# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the OS Management service. Use these API operations for working
  # with Managed instances and Managed instance groups.
  class OsManagement::OsManagementClient
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


    # Creates a new OsManagementClient.
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
        @endpoint = endpoint + '/20190801'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "OsManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://osms.{region}.oci.{secondLevelDomain}') + '/20190801'
      logger.info "OsManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds a given list of Software Packages to a specific Software Source.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [OCI::OsManagement::Models::AddPackagesToSoftwareSourceDetails] add_packages_to_software_source_details A list of package identifiers
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/add_packages_to_software_source.rb.html) to see an example of how to use add_packages_to_software_source API.
    def add_packages_to_software_source(software_source_id, add_packages_to_software_source_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#add_packages_to_software_source.' if logger

      raise "Missing the required parameter 'software_source_id' when calling add_packages_to_software_source." if software_source_id.nil?
      raise "Missing the required parameter 'add_packages_to_software_source_details' when calling add_packages_to_software_source." if add_packages_to_software_source_details.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}/actions/addPackages'.sub('{softwareSourceId}', software_source_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_packages_to_software_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#add_packages_to_software_source') do
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


    # Adds a child software source to a managed instance. After the software
    # source has been added, then packages from that software source can be
    # installed on the managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [OCI::OsManagement::Models::AttachChildSoftwareSourceToManagedInstanceDetails] attach_child_software_source_to_managed_instance_details Details for attaching a Software Source to a Managed Instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/attach_child_software_source_to_managed_instance.rb.html) to see an example of how to use attach_child_software_source_to_managed_instance API.
    def attach_child_software_source_to_managed_instance(managed_instance_id, attach_child_software_source_to_managed_instance_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#attach_child_software_source_to_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling attach_child_software_source_to_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'attach_child_software_source_to_managed_instance_details' when calling attach_child_software_source_to_managed_instance." if attach_child_software_source_to_managed_instance_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/attachChildSoftwareSource'.sub('{managedInstanceId}', managed_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(attach_child_software_source_to_managed_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#attach_child_software_source_to_managed_instance') do
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


    # Adds a Managed Instance to a Managed Instance Group. After the Managed
    # Instance has been added, then operations can be performed on the Managed
    # Instance Group which will then apply to all Managed Instances in the
    # group.
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/attach_managed_instance_to_managed_instance_group.rb.html) to see an example of how to use attach_managed_instance_to_managed_instance_group API.
    def attach_managed_instance_to_managed_instance_group(managed_instance_group_id, managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#attach_managed_instance_to_managed_instance_group.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling attach_managed_instance_to_managed_instance_group." if managed_instance_group_id.nil?
      raise "Missing the required parameter 'managed_instance_id' when calling attach_managed_instance_to_managed_instance_group." if managed_instance_id.nil?
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}/actions/attachManagedInstance'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:managedInstanceId] = managed_instance_id

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#attach_managed_instance_to_managed_instance_group') do
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


    # Adds a parent software source to a managed instance. After the software
    # source has been added, then packages from that software source can be
    # installed on the managed instance. Software sources that have this
    # software source as a parent will be able to be added to this managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [OCI::OsManagement::Models::AttachParentSoftwareSourceToManagedInstanceDetails] attach_parent_software_source_to_managed_instance_details Details for attaching a Software Source to a Managed Instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/attach_parent_software_source_to_managed_instance.rb.html) to see an example of how to use attach_parent_software_source_to_managed_instance API.
    def attach_parent_software_source_to_managed_instance(managed_instance_id, attach_parent_software_source_to_managed_instance_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#attach_parent_software_source_to_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling attach_parent_software_source_to_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'attach_parent_software_source_to_managed_instance_details' when calling attach_parent_software_source_to_managed_instance." if attach_parent_software_source_to_managed_instance_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/attachParentSoftwareSource'.sub('{managedInstanceId}', managed_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(attach_parent_software_source_to_managed_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#attach_parent_software_source_to_managed_instance') do
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


    # Moves a resource into a different compartment. When provided, If-Match
    # is checked against ETag values of the resource.
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [OCI::OsManagement::Models::ChangeManagedInstanceGroupCompartmentDetails] change_managed_instance_group_compartment_details OCID for the compartment to which the resource will be moved.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/change_managed_instance_group_compartment.rb.html) to see an example of how to use change_managed_instance_group_compartment API.
    def change_managed_instance_group_compartment(managed_instance_group_id, change_managed_instance_group_compartment_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#change_managed_instance_group_compartment.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling change_managed_instance_group_compartment." if managed_instance_group_id.nil?
      raise "Missing the required parameter 'change_managed_instance_group_compartment_details' when calling change_managed_instance_group_compartment." if change_managed_instance_group_compartment_details.nil?
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}/actions/changeCompartment'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_managed_instance_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#change_managed_instance_group_compartment') do
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


    # Moves a resource into a different compartment. When provided, If-Match
    # is checked against ETag values of the resource.
    #
    # @param [String] scheduled_job_id The ID of the scheduled job.
    # @param [OCI::OsManagement::Models::ChangeScheduledJobCompartmentDetails] change_scheduled_job_compartment_details OCID for the compartment to which the resource will be moved.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/change_scheduled_job_compartment.rb.html) to see an example of how to use change_scheduled_job_compartment API.
    def change_scheduled_job_compartment(scheduled_job_id, change_scheduled_job_compartment_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#change_scheduled_job_compartment.' if logger

      raise "Missing the required parameter 'scheduled_job_id' when calling change_scheduled_job_compartment." if scheduled_job_id.nil?
      raise "Missing the required parameter 'change_scheduled_job_compartment_details' when calling change_scheduled_job_compartment." if change_scheduled_job_compartment_details.nil?
      raise "Parameter value for 'scheduled_job_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_job_id)

      path = '/scheduledJobs/{scheduledJobId}/actions/changeCompartment'.sub('{scheduledJobId}', scheduled_job_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_scheduled_job_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#change_scheduled_job_compartment') do
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


    # Moves a resource into a different compartment. When provided, If-Match
    # is checked against ETag values of the resource.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [OCI::OsManagement::Models::ChangeSoftwareSourceCompartmentDetails] change_software_source_compartment_details OCID for the compartment to which the resource will be moved.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/change_software_source_compartment.rb.html) to see an example of how to use change_software_source_compartment API.
    def change_software_source_compartment(software_source_id, change_software_source_compartment_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#change_software_source_compartment.' if logger

      raise "Missing the required parameter 'software_source_id' when calling change_software_source_compartment." if software_source_id.nil?
      raise "Missing the required parameter 'change_software_source_compartment_details' when calling change_software_source_compartment." if change_software_source_compartment_details.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}/actions/changeCompartment'.sub('{softwareSourceId}', software_source_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_software_source_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#change_software_source_compartment') do
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


    # Creates a new Managed Instance Group on the management system.
    # This will not contain any managed instances after it is first created,
    # and they must be added later.
    #
    # @param [OCI::OsManagement::Models::CreateManagedInstanceGroupDetails] create_managed_instance_group_details Details about a Managed Instance Group to create
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ManagedInstanceGroup ManagedInstanceGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/create_managed_instance_group.rb.html) to see an example of how to use create_managed_instance_group API.
    def create_managed_instance_group(create_managed_instance_group_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#create_managed_instance_group.' if logger

      raise "Missing the required parameter 'create_managed_instance_group_details' when calling create_managed_instance_group." if create_managed_instance_group_details.nil?

      path = '/managedInstanceGroups'
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

      post_body = @api_client.object_to_http_body(create_managed_instance_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#create_managed_instance_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ManagedInstanceGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Scheduled Job to perform a specific package operation on
    # a set of managed instances or managed instance groups.  Can be created
    # as a one-time execution in the future, or as a recurring execution
    # that repeats on a defined interval.
    #
    # @param [OCI::OsManagement::Models::CreateScheduledJobDetails] create_scheduled_job_details Details about a Scheduled Job to create
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ScheduledJob ScheduledJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/create_scheduled_job.rb.html) to see an example of how to use create_scheduled_job API.
    def create_scheduled_job(create_scheduled_job_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#create_scheduled_job.' if logger

      raise "Missing the required parameter 'create_scheduled_job_details' when calling create_scheduled_job." if create_scheduled_job_details.nil?

      path = '/scheduledJobs'
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

      post_body = @api_client.object_to_http_body(create_scheduled_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#create_scheduled_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ScheduledJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new custom Software Source on the management system.
    # This will not contain any packages after it is first created,
    # and they must be added later.
    #
    # @param [OCI::OsManagement::Models::CreateSoftwareSourceDetails] create_software_source_details Details about a Sofware Source to create
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::SoftwareSource SoftwareSource}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/create_software_source.rb.html) to see an example of how to use create_software_source API.
    def create_software_source(create_software_source_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#create_software_source.' if logger

      raise "Missing the required parameter 'create_software_source_details' when calling create_software_source." if create_software_source_details.nil?

      path = '/softwareSources'
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

      post_body = @api_client.object_to_http_body(create_software_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#create_software_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::SoftwareSource'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a Managed Instance Group from the management system
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/delete_managed_instance_group.rb.html) to see an example of how to use delete_managed_instance_group API.
    def delete_managed_instance_group(managed_instance_group_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#delete_managed_instance_group.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling delete_managed_instance_group." if managed_instance_group_id.nil?
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#delete_managed_instance_group') do
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


    # Cancels an existing Scheduled Job on the management system
    #
    # @param [String] scheduled_job_id The ID of the scheduled job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/delete_scheduled_job.rb.html) to see an example of how to use delete_scheduled_job API.
    def delete_scheduled_job(scheduled_job_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#delete_scheduled_job.' if logger

      raise "Missing the required parameter 'scheduled_job_id' when calling delete_scheduled_job." if scheduled_job_id.nil?
      raise "Parameter value for 'scheduled_job_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_job_id)

      path = '/scheduledJobs/{scheduledJobId}'.sub('{scheduledJobId}', scheduled_job_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#delete_scheduled_job') do
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


    # Deletes a custom Software Source on the management system
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/delete_software_source.rb.html) to see an example of how to use delete_software_source API.
    def delete_software_source(software_source_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#delete_software_source.' if logger

      raise "Missing the required parameter 'software_source_id' when calling delete_software_source." if software_source_id.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}'.sub('{softwareSourceId}', software_source_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#delete_software_source') do
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


    # Removes a child software source from a managed instance. Packages will no longer be able to be
    # installed from these software sources.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [OCI::OsManagement::Models::DetachChildSoftwareSourceFromManagedInstanceDetails] detach_child_software_source_from_managed_instance_details Details for detaching a Software Source from a Managed Instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/detach_child_software_source_from_managed_instance.rb.html) to see an example of how to use detach_child_software_source_from_managed_instance API.
    def detach_child_software_source_from_managed_instance(managed_instance_id, detach_child_software_source_from_managed_instance_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#detach_child_software_source_from_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling detach_child_software_source_from_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'detach_child_software_source_from_managed_instance_details' when calling detach_child_software_source_from_managed_instance." if detach_child_software_source_from_managed_instance_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/detachChildSoftwareSource'.sub('{managedInstanceId}', managed_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(detach_child_software_source_from_managed_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#detach_child_software_source_from_managed_instance') do
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


    # Removes a Managed Instance from a Managed Instance Group.
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/detach_managed_instance_from_managed_instance_group.rb.html) to see an example of how to use detach_managed_instance_from_managed_instance_group API.
    def detach_managed_instance_from_managed_instance_group(managed_instance_group_id, managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#detach_managed_instance_from_managed_instance_group.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling detach_managed_instance_from_managed_instance_group." if managed_instance_group_id.nil?
      raise "Missing the required parameter 'managed_instance_id' when calling detach_managed_instance_from_managed_instance_group." if managed_instance_id.nil?
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}/actions/detachManagedInstance'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:managedInstanceId] = managed_instance_id

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#detach_managed_instance_from_managed_instance_group') do
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


    # Removes a software source from a managed instance. All child software sources will also be removed
    # from the managed instance. Packages will no longer be able to be installed from these software sources.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [OCI::OsManagement::Models::DetachParentSoftwareSourceFromManagedInstanceDetails] detach_parent_software_source_from_managed_instance_details Details for detaching a Software Source from a Managed Instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/detach_parent_software_source_from_managed_instance.rb.html) to see an example of how to use detach_parent_software_source_from_managed_instance API.
    def detach_parent_software_source_from_managed_instance(managed_instance_id, detach_parent_software_source_from_managed_instance_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#detach_parent_software_source_from_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling detach_parent_software_source_from_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'detach_parent_software_source_from_managed_instance_details' when calling detach_parent_software_source_from_managed_instance." if detach_parent_software_source_from_managed_instance_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/detachParentSoftwareSource'.sub('{managedInstanceId}', managed_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(detach_parent_software_source_from_managed_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#detach_parent_software_source_from_managed_instance') do
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


    # Disables a module stream on a managed instance.  After the stream is
    # disabled, it is no longer possible to install the profiles that are
    # contained by the stream.  All installed profiles must be removed prior
    # to disabling a module stream.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] module_name The name of a module.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/disable_module_stream_on_managed_instance.rb.html) to see an example of how to use disable_module_stream_on_managed_instance API.
    def disable_module_stream_on_managed_instance(managed_instance_id, module_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#disable_module_stream_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling disable_module_stream_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'module_name' when calling disable_module_stream_on_managed_instance." if module_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/moduleStreams/disable'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:moduleName] = module_name
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#disable_module_stream_on_managed_instance') do
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


    # Enables a module stream on a managed instance.  After the stream is
    # enabled, it is possible to install the profiles that are contained
    # by the stream.  Enabling a stream that is already enabled will
    # succeed.  Attempting to enable a different stream for a module that
    # already has a stream enabled results in an error.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] module_name The name of a module.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/enable_module_stream_on_managed_instance.rb.html) to see an example of how to use enable_module_stream_on_managed_instance API.
    def enable_module_stream_on_managed_instance(managed_instance_id, module_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#enable_module_stream_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling enable_module_stream_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'module_name' when calling enable_module_stream_on_managed_instance." if module_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/moduleStreams/enable'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:moduleName] = module_name
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#enable_module_stream_on_managed_instance') do
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


    # Returns a specific erratum.
    #
    # @param [String] erratum_id The OCID of the erratum.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::Erratum Erratum}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_erratum.rb.html) to see an example of how to use get_erratum API.
    def get_erratum(erratum_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_erratum.' if logger

      raise "Missing the required parameter 'erratum_id' when calling get_erratum." if erratum_id.nil?
      raise "Parameter value for 'erratum_id' must not be blank" if OCI::Internal::Util.blank_string?(erratum_id)

      path = '/errata/{erratumId}'.sub('{erratumId}', erratum_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_erratum') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::Erratum'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a specific Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ManagedInstance ManagedInstance}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_managed_instance.rb.html) to see an example of how to use get_managed_instance API.
    def get_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling get_managed_instance." if managed_instance_id.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}'.sub('{managedInstanceId}', managed_instance_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ManagedInstance'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a specific Managed Instance Group.
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ManagedInstanceGroup ManagedInstanceGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_managed_instance_group.rb.html) to see an example of how to use get_managed_instance_group API.
    def get_managed_instance_group(managed_instance_group_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_managed_instance_group.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling get_managed_instance_group." if managed_instance_group_id.nil?
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_managed_instance_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ManagedInstanceGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a detailed description of a module stream from a software source.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [String] module_name The name of the module
    # @param [String] stream_name The name of the stream of the containing module
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ModuleStream ModuleStream}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_module_stream.rb.html) to see an example of how to use get_module_stream API.
    def get_module_stream(software_source_id, module_name, stream_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_module_stream.' if logger

      raise "Missing the required parameter 'software_source_id' when calling get_module_stream." if software_source_id.nil?
      raise "Missing the required parameter 'module_name' when calling get_module_stream." if module_name.nil?
      raise "Missing the required parameter 'stream_name' when calling get_module_stream." if stream_name.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)
      raise "Parameter value for 'module_name' must not be blank" if OCI::Internal::Util.blank_string?(module_name)
      raise "Parameter value for 'stream_name' must not be blank" if OCI::Internal::Util.blank_string?(stream_name)

      path = '/softwareSources/{softwareSourceId}/modules/{moduleName}/streams/{streamName}'.sub('{softwareSourceId}', software_source_id.to_s).sub('{moduleName}', module_name.to_s).sub('{streamName}', stream_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_module_stream') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ModuleStream'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a detailed description of a module stream profile from a software source.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [String] module_name The name of the module
    # @param [String] stream_name The name of the stream of the containing module
    # @param [String] profile_name The name of the profile of the containing module stream
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ModuleStreamProfile ModuleStreamProfile}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_module_stream_profile.rb.html) to see an example of how to use get_module_stream_profile API.
    def get_module_stream_profile(software_source_id, module_name, stream_name, profile_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_module_stream_profile.' if logger

      raise "Missing the required parameter 'software_source_id' when calling get_module_stream_profile." if software_source_id.nil?
      raise "Missing the required parameter 'module_name' when calling get_module_stream_profile." if module_name.nil?
      raise "Missing the required parameter 'stream_name' when calling get_module_stream_profile." if stream_name.nil?
      raise "Missing the required parameter 'profile_name' when calling get_module_stream_profile." if profile_name.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)
      raise "Parameter value for 'module_name' must not be blank" if OCI::Internal::Util.blank_string?(module_name)
      raise "Parameter value for 'stream_name' must not be blank" if OCI::Internal::Util.blank_string?(stream_name)
      raise "Parameter value for 'profile_name' must not be blank" if OCI::Internal::Util.blank_string?(profile_name)

      path = '/softwareSources/{softwareSourceId}/modules/{moduleName}/streams/{streamName}/profiles/{profileName}'.sub('{softwareSourceId}', software_source_id.to_s).sub('{moduleName}', module_name.to_s).sub('{streamName}', stream_name.to_s).sub('{profileName}', profile_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_module_stream_profile') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ModuleStreamProfile'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the detailed information for the Scheduled Job with the given ID.
    #
    # @param [String] scheduled_job_id The ID of the scheduled job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ScheduledJob ScheduledJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_scheduled_job.rb.html) to see an example of how to use get_scheduled_job API.
    def get_scheduled_job(scheduled_job_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_scheduled_job.' if logger

      raise "Missing the required parameter 'scheduled_job_id' when calling get_scheduled_job." if scheduled_job_id.nil?
      raise "Parameter value for 'scheduled_job_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_job_id)

      path = '/scheduledJobs/{scheduledJobId}'.sub('{scheduledJobId}', scheduled_job_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_scheduled_job') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ScheduledJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a specific Software Package.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [String] software_package_name The id of the software package.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::SoftwarePackage SoftwarePackage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_software_package.rb.html) to see an example of how to use get_software_package API.
    def get_software_package(software_source_id, software_package_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_software_package.' if logger

      raise "Missing the required parameter 'software_source_id' when calling get_software_package." if software_source_id.nil?
      raise "Missing the required parameter 'software_package_name' when calling get_software_package." if software_package_name.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)
      raise "Parameter value for 'software_package_name' must not be blank" if OCI::Internal::Util.blank_string?(software_package_name)

      path = '/softwareSources/{softwareSourceId}/softwarePackages/{softwarePackageName}'.sub('{softwareSourceId}', software_source_id.to_s).sub('{softwarePackageName}', software_package_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_software_package') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::SoftwarePackage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a specific Software Source.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::SoftwareSource SoftwareSource}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_software_source.rb.html) to see an example of how to use get_software_source API.
    def get_software_source(software_source_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_software_source.' if logger

      raise "Missing the required parameter 'software_source_id' when calling get_software_source." if software_source_id.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}'.sub('{softwareSourceId}', software_source_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_software_source') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::SoftwareSource'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a Windows Update object.
    #
    # @param [String] windows_update The Windows Update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::WindowsUpdate WindowsUpdate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_windows_update.rb.html) to see an example of how to use get_windows_update API.
    def get_windows_update(windows_update, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_windows_update.' if logger

      raise "Missing the required parameter 'windows_update' when calling get_windows_update." if windows_update.nil?
      raise "Parameter value for 'windows_update' must not be blank" if OCI::Internal::Util.blank_string?(windows_update)

      path = '/updates/{windowsUpdate}'.sub('{windowsUpdate}', windows_update.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_windows_update') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::WindowsUpdate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the detailed information for the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Install all of the available package updates for the managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :update_type The type of updates to be applied
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_all_package_updates_on_managed_instance.rb.html) to see an example of how to use install_all_package_updates_on_managed_instance API.
    def install_all_package_updates_on_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_all_package_updates_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling install_all_package_updates_on_managed_instance." if managed_instance_id.nil?

      if opts[:update_type] && !OCI::OsManagement::Models::PACKAGE_UPDATE_TYPES_ENUM.include?(opts[:update_type])
        raise 'Invalid value for "update_type", must be one of the values in OCI::OsManagement::Models::PACKAGE_UPDATE_TYPES_ENUM.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/packages/updateAll'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:updateType] = opts[:update_type] if opts[:update_type]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_all_package_updates_on_managed_instance') do
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


    # Install all of the available updates for the Managed Instance Group.
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :update_type The type of updates to be applied
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_all_updates_on_managed_instance_group.rb.html) to see an example of how to use install_all_updates_on_managed_instance_group API.
    def install_all_updates_on_managed_instance_group(managed_instance_group_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_all_updates_on_managed_instance_group.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling install_all_updates_on_managed_instance_group." if managed_instance_group_id.nil?

      if opts[:update_type] && !OCI::OsManagement::Models::PACKAGE_UPDATE_TYPES_ENUM.include?(opts[:update_type])
        raise 'Invalid value for "update_type", must be one of the values in OCI::OsManagement::Models::PACKAGE_UPDATE_TYPES_ENUM.'
      end
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}/actions/updates/installAll'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:updateType] = opts[:update_type] if opts[:update_type]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_all_updates_on_managed_instance_group') do
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


    # Install all of the available Windows updates for the managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :update_type The type of updates to be applied
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_all_windows_updates_on_managed_instance.rb.html) to see an example of how to use install_all_windows_updates_on_managed_instance API.
    def install_all_windows_updates_on_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_all_windows_updates_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling install_all_windows_updates_on_managed_instance." if managed_instance_id.nil?

      if opts[:update_type] && !OCI::OsManagement::Models::PACKAGE_UPDATE_TYPES_ENUM.include?(opts[:update_type])
        raise 'Invalid value for "update_type", must be one of the values in OCI::OsManagement::Models::PACKAGE_UPDATE_TYPES_ENUM.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/updates/installAll'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:updateType] = opts[:update_type] if opts[:update_type]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_all_windows_updates_on_managed_instance') do
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


    # Installs a profile for an module stream.  The stream must be
    # enabled before a profile can be installed.  If a module stream
    # defines multiple profiles, each one can be installed independently.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] module_name The name of a module.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @option opts [String] :profile_name The name of the profile of the containing module stream
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_module_stream_profile_on_managed_instance.rb.html) to see an example of how to use install_module_stream_profile_on_managed_instance API.
    def install_module_stream_profile_on_managed_instance(managed_instance_id, module_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_module_stream_profile_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling install_module_stream_profile_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'module_name' when calling install_module_stream_profile_on_managed_instance." if module_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/streamProfiles/install'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:moduleName] = module_name
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]
      query_params[:profileName] = opts[:profile_name] if opts[:profile_name]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_module_stream_profile_on_managed_instance') do
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


    # Installs a package on a managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] software_package_name Package name
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_package_on_managed_instance.rb.html) to see an example of how to use install_package_on_managed_instance API.
    def install_package_on_managed_instance(managed_instance_id, software_package_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_package_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling install_package_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'software_package_name' when calling install_package_on_managed_instance." if software_package_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/packages/install'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:softwarePackageName] = software_package_name

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_package_on_managed_instance') do
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


    # Updates a package on a managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] software_package_name Package name
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_package_update_on_managed_instance.rb.html) to see an example of how to use install_package_update_on_managed_instance API.
    def install_package_update_on_managed_instance(managed_instance_id, software_package_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_package_update_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling install_package_update_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'software_package_name' when calling install_package_update_on_managed_instance." if software_package_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/packages/update'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:softwarePackageName] = software_package_name

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_package_update_on_managed_instance') do
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


    # Installs a Windows update on a managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] windows_update_name Unique identifier for the Windows update. NOTE - This is not an OCID,
    #   but is a unique identifier assigned by Microsoft.
    #   Example: `6981d463-cd91-4a26-b7c4-ea4ded9183ed`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/install_windows_update_on_managed_instance.rb.html) to see an example of how to use install_windows_update_on_managed_instance API.
    def install_windows_update_on_managed_instance(managed_instance_id, windows_update_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#install_windows_update_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling install_windows_update_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'windows_update_name' when calling install_windows_update_on_managed_instance." if windows_update_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/updates/install'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:windowsUpdateName] = windows_update_name

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#install_windows_update_on_managed_instance') do
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


    # Returns a list of packages available for install on the Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::InstallablePackageSummary InstallablePackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_available_packages_for_managed_instance.rb.html) to see an example of how to use list_available_packages_for_managed_instance API.
    def list_available_packages_for_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_available_packages_for_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_available_packages_for_managed_instance." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/packages/available'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_available_packages_for_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::InstallablePackageSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of available software sources for a Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::AvailableSoftwareSourceSummary AvailableSoftwareSourceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_available_software_sources_for_managed_instance.rb.html) to see an example of how to use list_available_software_sources_for_managed_instance API.
    def list_available_software_sources_for_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_available_software_sources_for_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_available_software_sources_for_managed_instance." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/availableSoftwareSources'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_available_software_sources_for_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::AvailableSoftwareSourceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of available updates for a Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::AvailableUpdateSummary AvailableUpdateSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_available_updates_for_managed_instance.rb.html) to see an example of how to use list_available_updates_for_managed_instance API.
    def list_available_updates_for_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_available_updates_for_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_available_updates_for_managed_instance." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/packages/updates'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_available_updates_for_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::AvailableUpdateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of available Windows updates for a Managed Instance. This is only applicable to Windows instances.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :is_eligible_for_installation Indicator of whether the update can be installed using OSMS.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::AvailableWindowsUpdateSummary AvailableWindowsUpdateSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_available_windows_updates_for_managed_instance.rb.html) to see an example of how to use list_available_windows_updates_for_managed_instance API.
    def list_available_windows_updates_for_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_available_windows_updates_for_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_available_windows_updates_for_managed_instance." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:is_eligible_for_installation] && !OCI::OsManagement::Models::IS_ELIGIBLE_FOR_INSTALLATION_ENUM.include?(opts[:is_eligible_for_installation])
        raise 'Invalid value for "is_eligible_for_installation", must be one of the values in OCI::OsManagement::Models::IS_ELIGIBLE_FOR_INSTALLATION_ENUM.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/updates/available'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:isEligibleForInstallation] = opts[:is_eligible_for_installation] if opts[:is_eligible_for_installation]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_available_windows_updates_for_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::AvailableWindowsUpdateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all of the currently available Errata in the system
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :erratum_id The OCID of the erratum.
    # @option opts [String] :advisory_name The assigned erratum name. It's unique and not changeable.
    #
    #   Example: `ELSA-2020-5804`
    #
    # @option opts [DateTime] :time_issue_date_start The issue date after which to list all errata, in ISO 8601 format
    #
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @option opts [DateTime] :time_issue_date_end The issue date before which to list all errata, in ISO 8601 format
    #
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort errata by. Only one sort order may be provided. Default order for ISSUEDATE is descending. Default order for ADVISORYNAME is ascending. If no value is specified ISSUEDATE is default.
    #    (default to ISSUEDATE)
    #   Allowed values are: ISSUEDATE, ADVISORYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ErratumSummary ErratumSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_errata.rb.html) to see an example of how to use list_errata API.
    def list_errata(opts = {})
      logger.debug 'Calling operation OsManagementClient#list_errata.' if logger


      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[ISSUEDATE ADVISORYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of ISSUEDATE, ADVISORYNAME.'
      end

      path = '/errata'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:erratumId] = opts[:erratum_id] if opts[:erratum_id]
      query_params[:advisoryName] = opts[:advisory_name] if opts[:advisory_name]
      query_params[:timeIssueDateStart] = opts[:time_issue_date_start] if opts[:time_issue_date_start]
      query_params[:timeIssueDateEnd] = opts[:time_issue_date_end] if opts[:time_issue_date_end]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_errata') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ErratumSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of errata relevant to the Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ErratumSummary ErratumSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_managed_instance_errata.rb.html) to see an example of how to use list_managed_instance_errata API.
    def list_managed_instance_errata(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_managed_instance_errata.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_managed_instance_errata." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/errata'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_managed_instance_errata') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ErratumSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all Managed Instance Groups.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :lifecycle_state The current lifecycle state for the object.
    # @option opts [String] :os_family The OS family for which to list resources.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ManagedInstanceGroupSummary ManagedInstanceGroupSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_managed_instance_groups.rb.html) to see an example of how to use list_managed_instance_groups API.
    def list_managed_instance_groups(compartment_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_managed_instance_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_managed_instance_groups." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:lifecycle_state] && !OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:os_family] && !OCI::OsManagement::Models::OS_FAMILIES_ENUM.include?(opts[:os_family])
        raise 'Invalid value for "os_family", must be one of the values in OCI::OsManagement::Models::OS_FAMILIES_ENUM.'
      end

      path = '/managedInstanceGroups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:osFamily] = opts[:os_family] if opts[:os_family]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_managed_instance_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ManagedInstanceGroupSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all Managed Instances.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :os_family The OS family for which to list resources.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ManagedInstanceSummary ManagedInstanceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_managed_instances.rb.html) to see an example of how to use list_managed_instances API.
    def list_managed_instances(compartment_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_managed_instances.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_managed_instances." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:os_family] && !OCI::OsManagement::Models::OS_FAMILIES_ENUM.include?(opts[:os_family])
        raise 'Invalid value for "os_family", must be one of the values in OCI::OsManagement::Models::OS_FAMILIES_ENUM.'
      end

      path = '/managedInstances'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:osFamily] = opts[:os_family] if opts[:os_family]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_managed_instances') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ManagedInstanceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a list of module stream profiles from a software source.
    # Filters may be applied to select a subset of module stream profiles
    # based on the filter criteria.
    #
    # The \"moduleName\", \"streamName\", and \"profileName\" attributes combine
    # to form a set of filters on the list of module stream profiles.  If
    # a \"moduleName\" is provided, only profiles that belong to that module
    # are returned.  If both a \"moduleName\" and \"streamName\" are given,
    # only profiles belonging to that module stream are returned.  Finally,
    # if all three are given then only the particular profile indicated
    # by the triple is returned.  It is not valid to supply a \"streamName\"
    # without a \"moduleName\".  It is also not valid to supply a \"profileName\"
    # without a \"streamName\".
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :module_name The name of a module.  This parameter is required if a
    #   streamName is specified.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @option opts [String] :profile_name The name of the profile of the containing module stream
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ModuleStreamProfileSummary ModuleStreamProfileSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_module_stream_profiles.rb.html) to see an example of how to use list_module_stream_profiles API.
    def list_module_stream_profiles(software_source_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_module_stream_profiles.' if logger

      raise "Missing the required parameter 'software_source_id' when calling list_module_stream_profiles." if software_source_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}/streamProfiles'.sub('{softwareSourceId}', software_source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:moduleName] = opts[:module_name] if opts[:module_name]
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]
      query_params[:profileName] = opts[:profile_name] if opts[:profile_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_module_stream_profiles') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ModuleStreamProfileSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a list of module stream profiles, along with a summary of their
    # of their status, from a managed instance.  Filters may be applied to
    # select a subset of profiles based on the filter criteria.
    #
    # The \"moduleName\", \"streamName\", and \"profileName\" attributes combine
    # to form a set of filters on the list of module stream profiles.  If
    # a \"modulName\" is provided, only profiles that belong to that module
    # are returned.  If both a \"moduleName\" and \"streamName\" are given,
    # only profiles belonging to that module stream are returned.  Finally,
    # if all three are given then only the particular profile indicated
    # by the triple is returned.  It is not valid to supply a \"streamName\"
    # without a \"moduleName\".  It is also not valid to supply a \"profileName\"
    # without a \"streamName\".
    #
    # The \"status\" attribute filters against the state of a module stream
    # profile.  Valid values are \"INSTALLED\" and \"AVAILABLE\".  If the
    # attribute is set to \"INSTALLED\", only module stream profiles that
    # are installed are included in the result set.  If the attribute is
    # set to \"AVAILABLE\", only module stream profiles that are not
    # installed are included in the result set.  If the attribute is not
    # defined, the request is not subject to this filter.
    #
    # When sorting by display name, the result set is sorted first by
    # module name, then by stream name, and finally by profile name.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :module_name The name of a module.  This parameter is required if a
    #   streamName is specified.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @option opts [String] :profile_name The name of the profile of the containing module stream
    # @option opts [String] :profile_status The status of the profile.
    #
    #   A profile with the \"INSTALLED\" status indicates that the
    #   profile has been installed.
    #
    #   A profile with the \"AVAILABLE\" status indicates that the
    #   profile is not installed, but can be.
    #
    #   Allowed values are: INSTALLED, AVAILABLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ModuleStreamProfileOnManagedInstanceSummary ModuleStreamProfileOnManagedInstanceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_module_stream_profiles_on_managed_instance.rb.html) to see an example of how to use list_module_stream_profiles_on_managed_instance API.
    def list_module_stream_profiles_on_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_module_stream_profiles_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_module_stream_profiles_on_managed_instance." if managed_instance_id.nil?

      if opts[:profile_status] && !%w[INSTALLED AVAILABLE].include?(opts[:profile_status])
        raise 'Invalid value for "profile_status", must be one of INSTALLED, AVAILABLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/streamProfiles'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:moduleName] = opts[:module_name] if opts[:module_name]
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]
      query_params[:profileName] = opts[:profile_name] if opts[:profile_name]
      query_params[:profileStatus] = opts[:profile_status] if opts[:profile_status]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_module_stream_profiles_on_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ModuleStreamProfileOnManagedInstanceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a list of module streams from a software source.
    # Filters may be applied to select a subset of module streams
    # based on the filter criteria.
    #
    # The 'moduleName' attribute filters against the name of a module.
    # It accepts strings of the format \"<module>\".  If this attribute
    # is defined, only streams that belong to the specified module are
    # included in the result set.  If it is not defined, the request is
    # not subject to this filter.  The 'streamName' attribute filters
    # against the name of a stream of a module.  If this attribute is
    # defined, only the particular module stream that matches both the
    # module and stream names is included in the result set.  It is
    # not valid to supply 'streamName' without also supplying a
    # 'moduleName'.
    #
    # When sorting by display name, the result set is sorted first by
    # module name, then by stream name.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :module_name The name of a module.  This parameter is required if a
    #   streamName is specified.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ModuleStreamSummary ModuleStreamSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_module_streams.rb.html) to see an example of how to use list_module_streams API.
    def list_module_streams(software_source_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_module_streams.' if logger

      raise "Missing the required parameter 'software_source_id' when calling list_module_streams." if software_source_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}/moduleStreams'.sub('{softwareSourceId}', software_source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:moduleName] = opts[:module_name] if opts[:module_name]
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_module_streams') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ModuleStreamSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a list of module streams, along with a summary of their
    # status, from a managed instance.  Filters may be applied to select
    # a subset of module streams based on the filter criteria.
    #
    # The 'moduleName' attribute filters against the name of a module.
    # It accepts strings of the format \"<module>\".  If this attribute
    # is defined, only streams that belong to the specified module are
    # included in the result set.  If it is not defined, the request is
    # not subject to this filter.
    #
    # The \"status\" attribute filters against the state of a module stream.
    # Valid values are \"ENABLED\", \"DISABLED\", and \"ACTIVE\".  If the
    # attribute is set to \"ENABLED\", only module streams that are enabled
    # are included in the result set.  If the attribute is set to \"DISABLED\",
    # only module streams that are not enabled are included in the result
    # set.  If the attribute is set to \"ACTIVE\", only module streams that
    # are active are included in the result set.  If the attribute is not
    # defined, the request is not subject to this filter.
    #
    # When sorting by the display name, the result set is sorted first
    # by the module name and then by the stream name.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :module_name The name of a module.  This parameter is required if a
    #   streamName is specified.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @option opts [String] :stream_status The status of the stream
    #
    #   A stream with the \"ENABLED\" status can be used as a source for installing
    #   profiles.  Streams with this status are also \"ACTIVE\".
    #
    #   A stream with the \"DISABLED\" status cannot be the source for installing
    #   profiles.  To install profiles and packages from this stream, it must be
    #   enabled.
    #
    #   A stream with the \"ACTIVE\" status can be used as a source for installing
    #   profiles.  The packages that comprise the stream are also used when a
    #   matching package is installed directly.  In general, a stream can have
    #   this status if it is the default stream for the module and no stream has
    #   been explicitly enabled.
    #
    #   Allowed values are: ENABLED, DISABLED, ACTIVE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ModuleStreamOnManagedInstanceSummary ModuleStreamOnManagedInstanceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_module_streams_on_managed_instance.rb.html) to see an example of how to use list_module_streams_on_managed_instance API.
    def list_module_streams_on_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_module_streams_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_module_streams_on_managed_instance." if managed_instance_id.nil?

      if opts[:stream_status] && !%w[ENABLED DISABLED ACTIVE].include?(opts[:stream_status])
        raise 'Invalid value for "stream_status", must be one of ENABLED, DISABLED, ACTIVE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/moduleStreams'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:moduleName] = opts[:module_name] if opts[:module_name]
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]
      query_params[:streamStatus] = opts[:stream_status] if opts[:stream_status]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_module_streams_on_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ModuleStreamOnManagedInstanceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of installed packages on the Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::InstalledPackageSummary InstalledPackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_packages_installed_on_managed_instance.rb.html) to see an example of how to use list_packages_installed_on_managed_instance API.
    def list_packages_installed_on_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_packages_installed_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_packages_installed_on_managed_instance." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/packages'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_packages_installed_on_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::InstalledPackageSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all of the currently active Scheduled Jobs in the system
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :managed_instance_id The ID of the managed instance for which to list resources.
    # @option opts [String] :managed_instance_group_id The ID of the managed instace group for which to list resources.
    # @option opts [String] :operation_type The operation type for which to list resources
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :lifecycle_state The current lifecycle state for the object.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :os_family The OS family for which to list resources.
    # @option opts [BOOLEAN] :is_restricted If true, will only filter out restricted Autonomous Linux Scheduled Job
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ScheduledJobSummary ScheduledJobSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_scheduled_jobs.rb.html) to see an example of how to use list_scheduled_jobs API.
    def list_scheduled_jobs(compartment_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_scheduled_jobs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_scheduled_jobs." if compartment_id.nil?

      if opts[:operation_type] && !OCI::OsManagement::Models::OPERATION_TYPES_ENUM.include?(opts[:operation_type])
        raise 'Invalid value for "operation_type", must be one of the values in OCI::OsManagement::Models::OPERATION_TYPES_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:lifecycle_state] && !OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:os_family] && !OCI::OsManagement::Models::OS_FAMILIES_ENUM.include?(opts[:os_family])
        raise 'Invalid value for "os_family", must be one of the values in OCI::OsManagement::Models::OS_FAMILIES_ENUM.'
      end

      path = '/scheduledJobs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:managedInstanceId] = opts[:managed_instance_id] if opts[:managed_instance_id]
      query_params[:managedInstanceGroupId] = opts[:managed_instance_group_id] if opts[:managed_instance_group_id]
      query_params[:operationType] = opts[:operation_type] if opts[:operation_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:osFamily] = opts[:os_family] if opts[:os_family]
      query_params[:isRestricted] = opts[:is_restricted] if !opts[:is_restricted].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_scheduled_jobs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ScheduledJobSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists Software Packages in a Software Source
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::SoftwarePackageSummary SoftwarePackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_software_source_packages.rb.html) to see an example of how to use list_software_source_packages API.
    def list_software_source_packages(software_source_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_software_source_packages.' if logger

      raise "Missing the required parameter 'software_source_id' when calling list_software_source_packages." if software_source_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}/softwarePackages'.sub('{softwareSourceId}', software_source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_software_source_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::SoftwarePackageSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all Software Sources.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :lifecycle_state The current lifecycle state for the object.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::SoftwareSourceSummary SoftwareSourceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_software_sources.rb.html) to see an example of how to use list_software_sources API.
    def list_software_sources(compartment_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_software_sources.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_software_sources." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:lifecycle_state] && !OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.'
      end

      path = '/softwareSources'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_software_sources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::SoftwareSourceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all of the Scheduled Jobs whose next execution time is at or before the specified time.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [DateTime] time_end The cut-off time before which to list all upcoming schedules, in ISO 8601 format
    #
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :tag_name The name of the tag.
    # @option opts [String] :tag_value The value for the tag.
    # @option opts [String] :lifecycle_state The current lifecycle state for the object.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :os_family The OS family for which to list resources.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::ScheduledJobSummary ScheduledJobSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_upcoming_scheduled_jobs.rb.html) to see an example of how to use list_upcoming_scheduled_jobs API.
    def list_upcoming_scheduled_jobs(compartment_id, time_end, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_upcoming_scheduled_jobs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_upcoming_scheduled_jobs." if compartment_id.nil?
      raise "Missing the required parameter 'time_end' when calling list_upcoming_scheduled_jobs." if time_end.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:lifecycle_state] && !OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::OsManagement::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:os_family] && !OCI::OsManagement::Models::OS_FAMILIES_ENUM.include?(opts[:os_family])
        raise 'Invalid value for "os_family", must be one of the values in OCI::OsManagement::Models::OS_FAMILIES_ENUM.'
      end

      path = '/scheduledJobs/upcomingSchedules'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:timeEnd] = time_end
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:tagName] = opts[:tag_name] if opts[:tag_name]
      query_params[:tagValue] = opts[:tag_value] if opts[:tag_value]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:osFamily] = opts[:os_family] if opts[:os_family]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_upcoming_scheduled_jobs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::ScheduledJobSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of Windows Updates.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::WindowsUpdateSummary WindowsUpdateSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_windows_updates.rb.html) to see an example of how to use list_windows_updates API.
    def list_windows_updates(opts = {})
      logger.debug 'Calling operation OsManagementClient#list_windows_updates.' if logger


      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/updates'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_windows_updates') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::WindowsUpdateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of installed Windows updates for a Managed Instance. This is only applicable to Windows instances.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :compartment_id The ID of the compartment in which to list resources. This parameter is optional and in some cases may have no effect.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::InstalledWindowsUpdateSummary InstalledWindowsUpdateSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_windows_updates_installed_on_managed_instance.rb.html) to see an example of how to use list_windows_updates_installed_on_managed_instance API.
    def list_windows_updates_installed_on_managed_instance(managed_instance_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_windows_updates_installed_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_windows_updates_installed_on_managed_instance." if managed_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/updates/installed'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_windows_updates_installed_on_managed_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::InstalledWindowsUpdateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the errors for the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the log entries for the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::WorkRequestLogEntry>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the work requests in a compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :managed_instance_id The ID of the managed instance for which to list resources.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :os_family The OS family for which to list resources.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:os_family] && !OCI::OsManagement::Models::OS_FAMILIES_ENUM.include?(opts[:os_family])
        raise 'Invalid value for "os_family", must be one of the values in OCI::OsManagement::Models::OS_FAMILIES_ENUM.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:managedInstanceId] = opts[:managed_instance_id] if opts[:managed_instance_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:osFamily] = opts[:os_family] if opts[:os_family]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Perform an operation involving modules, streams, and profiles on a
    # managed instance.  Each operation may enable or disable an arbitrary
    # amount of module streams, and install or remove an arbitrary number
    # of module stream profiles.  When the operation is complete, the
    # state of the modules, streams, and profiles on the managed instance
    # will match the state indicated in the operation.
    #
    # Each module stream specified in the list of module streams to enable
    # will be in the \"ENABLED\" state upon completion of the operation.
    # If there was already a stream of that module enabled, any work
    # required to switch from the current stream to the new stream is
    # performed implicitly.
    #
    # Each module stream specified in the list of module streams to disable
    # will be in the \"DISABLED\" state upon completion of the operation.
    # Any profiles that are installed for the module stream will be removed
    # as part of the operation.
    #
    # Each module stream profile specified in the list of profiles to install
    # will be in the \"INSTALLED\" state upon completion of the operation,
    # indicating that any packages that are part of the profile are installed
    # on the managed instance.  If the module stream containing the profile
    # is not enabled, it will be enabled as part of the operation.  There
    # is an exception when attempting to install a stream of a profile when
    # another stream of the same module is enabled.  It is an error to attempt
    # to install a profile of another module stream, unless enabling the
    # new module stream is explicitly included in this operation.
    #
    # Each module stream profile specified in the list of profiles to remove
    # will be in the \"AVAILABLE\" state upon completion of the operation.
    # The status of packages within the profile after the operation is
    # complete is defined by the package manager on the managed instance.
    #
    # Operations that contain one or more elements that are not allowed
    # are rejected.
    #
    # The result of this request is a WorkRequest object.  The returned
    # WorkRequest is the parent of a structure of other WorkRequests.  Taken
    # as a whole, this structure indicates the entire set of work to be
    # performed to complete the operation.
    #
    # This interface can also be used to perform a dry run of the operation
    # rather than committing it to a managed instance.  If a dry run is
    # requested, the OS Management Service will evaluate the operation
    # against the current module, stream, and profile state on the managed
    # instance.  It will calculate the impact of the operation on all
    # modules, streams, and profiles on the managed instance, including those
    # that are implicitly impacted by the operation.
    #
    # The WorkRequest resulting from a dry run behaves differently than
    # a WorkRequest resulting from a committable operation.  Dry run
    # WorkRequests are always singletons and never have children.  The
    # impact of the operation is returned using the log and error
    # facilities of WorkRequests.  The impact of operations that are
    # allowed by the OS Management Service are communicated as one or
    # more work request log entries.  Operations that are not allowed
    # by the OS Management Service are communicated as one or more
    # work requst error entries.  Each entry, for either logs or errors,
    # contains a structured message containing the results of one
    # or more operations.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [OCI::OsManagement::Models::ManageModuleStreamsOnManagedInstanceDetails] manage_module_streams_on_managed_instance_details A description of an operation to perform against the modules, streams, and profiles of a managed instance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/manage_module_streams_on_managed_instance.rb.html) to see an example of how to use manage_module_streams_on_managed_instance API.
    def manage_module_streams_on_managed_instance(managed_instance_id, manage_module_streams_on_managed_instance_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#manage_module_streams_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling manage_module_streams_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'manage_module_streams_on_managed_instance_details' when calling manage_module_streams_on_managed_instance." if manage_module_streams_on_managed_instance_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/moduleStreams/manage'.sub('{managedInstanceId}', managed_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(manage_module_streams_on_managed_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#manage_module_streams_on_managed_instance') do
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


    # Removes a profile for a module stream that is installed on a managed instance.
    # If a module stream is provided, rather than a fully qualified profile, all
    # profiles that have been installed for the module stream will be removed.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] module_name The name of a module.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @option opts [String] :profile_name The name of the profile of the containing module stream
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/remove_module_stream_profile_from_managed_instance.rb.html) to see an example of how to use remove_module_stream_profile_from_managed_instance API.
    def remove_module_stream_profile_from_managed_instance(managed_instance_id, module_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#remove_module_stream_profile_from_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling remove_module_stream_profile_from_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'module_name' when calling remove_module_stream_profile_from_managed_instance." if module_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/streamProfiles/remove'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:moduleName] = module_name
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]
      query_params[:profileName] = opts[:profile_name] if opts[:profile_name]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#remove_module_stream_profile_from_managed_instance') do
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


    # Removes an installed package from a managed instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] software_package_name Package name
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/remove_package_from_managed_instance.rb.html) to see an example of how to use remove_package_from_managed_instance API.
    def remove_package_from_managed_instance(managed_instance_id, software_package_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#remove_package_from_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling remove_package_from_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'software_package_name' when calling remove_package_from_managed_instance." if software_package_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/packages/remove'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:softwarePackageName] = software_package_name

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#remove_package_from_managed_instance') do
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


    # Removes a given list of Software Packages from a specific Software Source.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [OCI::OsManagement::Models::RemovePackagesFromSoftwareSourceDetails] remove_packages_from_software_source_details A list of package identifiers
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/remove_packages_from_software_source.rb.html) to see an example of how to use remove_packages_from_software_source API.
    def remove_packages_from_software_source(software_source_id, remove_packages_from_software_source_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#remove_packages_from_software_source.' if logger

      raise "Missing the required parameter 'software_source_id' when calling remove_packages_from_software_source." if software_source_id.nil?
      raise "Missing the required parameter 'remove_packages_from_software_source_details' when calling remove_packages_from_software_source." if remove_packages_from_software_source_details.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}/actions/removePackages'.sub('{softwareSourceId}', software_source_id.to_s)
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

      post_body = @api_client.object_to_http_body(remove_packages_from_software_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#remove_packages_from_software_source') do
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


    # This will trigger an already created Scheduled Job to being executing
    # immediately instead of waiting for its next regularly scheduled time.
    #
    # @param [String] scheduled_job_id The ID of the scheduled job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/run_scheduled_job_now.rb.html) to see an example of how to use run_scheduled_job_now API.
    def run_scheduled_job_now(scheduled_job_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#run_scheduled_job_now.' if logger

      raise "Missing the required parameter 'scheduled_job_id' when calling run_scheduled_job_now." if scheduled_job_id.nil?
      raise "Parameter value for 'scheduled_job_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_job_id)

      path = '/scheduledJobs/{scheduledJobId}/actions/runNow'.sub('{scheduledJobId}', scheduled_job_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#run_scheduled_job_now') do
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


    # Searches all of the available Software Sources and returns any/all Software Packages matching
    # the search criteria.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :software_package_name the identifier for the software package (not an OCID)
    # @option opts [String] :display_name A user-friendly name. Does not have to be unique, and it's changeable.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :cve_name The name of the CVE as published.
    #   Example: `CVE-2006-4535`
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::OsManagement::Models::SoftwarePackageSearchSummary SoftwarePackageSearchSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/search_software_packages.rb.html) to see an example of how to use search_software_packages API.
    def search_software_packages(opts = {})
      logger.debug 'Calling operation OsManagementClient#search_software_packages.' if logger


      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/softwareSources/softwarePackages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:softwarePackageName] = opts[:software_package_name] if opts[:software_package_name]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:cveName] = opts[:cve_name] if opts[:cve_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#search_software_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsManagement::Models::SoftwarePackageSearchSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This will force an already created Scheduled Job to skip its
    # next regularly scheduled execution
    #
    # @param [String] scheduled_job_id The ID of the scheduled job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/skip_next_scheduled_job_execution.rb.html) to see an example of how to use skip_next_scheduled_job_execution API.
    def skip_next_scheduled_job_execution(scheduled_job_id, opts = {})
      logger.debug 'Calling operation OsManagementClient#skip_next_scheduled_job_execution.' if logger

      raise "Missing the required parameter 'scheduled_job_id' when calling skip_next_scheduled_job_execution." if scheduled_job_id.nil?
      raise "Parameter value for 'scheduled_job_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_job_id)

      path = '/scheduledJobs/{scheduledJobId}/actions/skipNextExecution'.sub('{scheduledJobId}', scheduled_job_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#skip_next_scheduled_job_execution') do
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


    # Enables a new stream for a module that already has a stream enabled.
    # If any profiles or packages from the original module are installed,
    # switching to a new stream will remove the existing packages and
    # install their counterparts in the new stream.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [String] module_name The name of a module.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :stream_name The name of the stream of the containing module.  This parameter
    #   is required if a profileName is specified.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/switch_module_stream_on_managed_instance.rb.html) to see an example of how to use switch_module_stream_on_managed_instance API.
    def switch_module_stream_on_managed_instance(managed_instance_id, module_name, opts = {})
      logger.debug 'Calling operation OsManagementClient#switch_module_stream_on_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling switch_module_stream_on_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'module_name' when calling switch_module_stream_on_managed_instance." if module_name.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/actions/moduleStreams/switch'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:moduleName] = module_name
      query_params[:streamName] = opts[:stream_name] if opts[:stream_name]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#switch_module_stream_on_managed_instance') do
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


    # Updates a specific Managed Instance.
    #
    # @param [String] managed_instance_id OCID for the managed instance
    # @param [OCI::OsManagement::Models::UpdateManagedInstanceDetails] update_managed_instance_details Details about a Managed Instance to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ManagedInstance ManagedInstance}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/update_managed_instance.rb.html) to see an example of how to use update_managed_instance API.
    def update_managed_instance(managed_instance_id, update_managed_instance_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#update_managed_instance.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling update_managed_instance." if managed_instance_id.nil?
      raise "Missing the required parameter 'update_managed_instance_details' when calling update_managed_instance." if update_managed_instance_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}'.sub('{managedInstanceId}', managed_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_managed_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#update_managed_instance') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ManagedInstance'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific Managed Instance Group.
    #
    # @param [String] managed_instance_group_id OCID for the managed instance group
    # @param [OCI::OsManagement::Models::UpdateManagedInstanceGroupDetails] update_managed_instance_group_details Details about a Managed Instance Group to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ManagedInstanceGroup ManagedInstanceGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/update_managed_instance_group.rb.html) to see an example of how to use update_managed_instance_group API.
    def update_managed_instance_group(managed_instance_group_id, update_managed_instance_group_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#update_managed_instance_group.' if logger

      raise "Missing the required parameter 'managed_instance_group_id' when calling update_managed_instance_group." if managed_instance_group_id.nil?
      raise "Missing the required parameter 'update_managed_instance_group_details' when calling update_managed_instance_group." if update_managed_instance_group_details.nil?
      raise "Parameter value for 'managed_instance_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_group_id)

      path = '/managedInstanceGroups/{managedInstanceGroupId}'.sub('{managedInstanceGroupId}', managed_instance_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_managed_instance_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#update_managed_instance_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ManagedInstanceGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates an existing Scheduled Job on the management system.
    #
    # @param [String] scheduled_job_id The ID of the scheduled job.
    # @param [OCI::OsManagement::Models::UpdateScheduledJobDetails] update_scheduled_job_details Details about a Scheduled Job to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::ScheduledJob ScheduledJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/update_scheduled_job.rb.html) to see an example of how to use update_scheduled_job API.
    def update_scheduled_job(scheduled_job_id, update_scheduled_job_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#update_scheduled_job.' if logger

      raise "Missing the required parameter 'scheduled_job_id' when calling update_scheduled_job." if scheduled_job_id.nil?
      raise "Missing the required parameter 'update_scheduled_job_details' when calling update_scheduled_job." if update_scheduled_job_details.nil?
      raise "Parameter value for 'scheduled_job_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_job_id)

      path = '/scheduledJobs/{scheduledJobId}'.sub('{scheduledJobId}', scheduled_job_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_scheduled_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#update_scheduled_job') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::ScheduledJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates an existing custom Software Source on the management system.
    #
    # @param [String] software_source_id The OCID of the software source.
    # @param [OCI::OsManagement::Models::UpdateSoftwareSourceDetails] update_software_source_details Details about a Sofware Source to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::SoftwareSource SoftwareSource}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/update_software_source.rb.html) to see an example of how to use update_software_source API.
    def update_software_source(software_source_id, update_software_source_details, opts = {})
      logger.debug 'Calling operation OsManagementClient#update_software_source.' if logger

      raise "Missing the required parameter 'software_source_id' when calling update_software_source." if software_source_id.nil?
      raise "Missing the required parameter 'update_software_source_details' when calling update_software_source." if update_software_source_details.nil?
      raise "Parameter value for 'software_source_id' must not be blank" if OCI::Internal::Util.blank_string?(software_source_id)

      path = '/softwareSources/{softwareSourceId}'.sub('{softwareSourceId}', software_source_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_software_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OsManagementClient#update_software_source') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::SoftwareSource'
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
