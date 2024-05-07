# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the OS Management Hub API to manage and monitor updates and patches for instances in OCI, your private data center, or 3rd-party clouds.
  # For more information, see [Overview of OS Management Hub](https://docs.cloud.oracle.com/iaas/osmh/doc/overview.htm).
  class OsManagementHub::ReportingManagedInstanceClient
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


    # Creates a new ReportingManagedInstanceClient.
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
        @endpoint = endpoint + '/20220901'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ReportingManagedInstanceClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://osmh.{region}.oci.{secondLevelDomain}') + '/20220901'
      logger.info "ReportingManagedInstanceClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a report of managed instances matching the given filters. You can select CSV, XML, or JSON format.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #   This filter returns only resources contained within the specified compartment.
    #
    # @option opts [String] :managed_instance_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the managed instance group. This filter returns resources associated with this group.
    # @option opts [String] :lifecycle_environment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the lifecycle environment. This filter returns only resource contained with the specified lifecycle environment.
    # @option opts [String] :lifecycle_stage_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the lifecycle stage. This resource returns resources associated with this lifecycle stage.
    # @option opts [Array<String>] :status A filter to return only managed instances whose status matches the status provided.
    #   Allowed values are: NORMAL, UNREACHABLE, ERROR, WARNING, REGISTRATION_ERROR, DELETING, ONBOARDING
    # @option opts [Array<String>] :display_name A filter to return resources that match the given display names.
    # @option opts [String] :display_name_contains A filter to return resources that may partially match the given display name.
    # @option opts [Integer] :security_updates_available_equals_to A filter to return instances that have the specified number of available security updates.
    # @option opts [Integer] :bug_updates_available_equals_to A filter to return instances that have the specified number of available bug updates.
    # @option opts [Integer] :security_updates_available_greater_than A filter to return instances that have more available security updates than the number specified.
    # @option opts [Integer] :bug_updates_available_greater_than A filter to return instances that have more available bug updates than the number specified.
    # @option opts [Array<String>] :location A filter to return only resources whose location matches the given value.
    #   Allowed values are: ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP
    # @option opts [Array<String>] :location_not_equal_to A filter to return only resources whose location does not match the given value.
    #   Allowed values are: ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP
    # @option opts [Array<String>] :os_family A filter to return only resources that match the given operating system family.
    #   Allowed values are: ORACLE_LINUX_9, ORACLE_LINUX_8, ORACLE_LINUX_7, ORACLE_LINUX_6, WINDOWS_SERVER_2016, WINDOWS_SERVER_2019, WINDOWS_SERVER_2022, ALL
    # @option opts [BOOLEAN] :is_managed_by_autonomous_linux Indicates whether to list only resources managed by the Autonomous Linux service.
    #
    # @option opts [String] :report_format The format of the report to download. Default is CSV. (default to csv)
    #   Allowed values are: csv, json, xml
    # @option opts [String] :report_type The type of the report the user wants to download. Default is ALL. (default to ALL)
    #   Allowed values are: SECURITY, BUGFIX, ACTIVITY, ALL
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagementhub/get_managed_instance_analytic_content.rb.html) to see an example of how to use get_managed_instance_analytic_content API.
    def get_managed_instance_analytic_content(opts = {}, &block)
      logger.debug 'Calling operation ReportingManagedInstanceClient#get_managed_instance_analytic_content.' if logger



      status_allowable_values = %w[NORMAL UNREACHABLE ERROR WARNING REGISTRATION_ERROR DELETING ONBOARDING]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of NORMAL, UNREACHABLE, ERROR, WARNING, REGISTRATION_ERROR, DELETING, ONBOARDING.'
          end
        end
      end


      location_allowable_values = %w[ON_PREMISE OCI_COMPUTE AZURE EC2 GCP]
      if opts[:location] && !opts[:location].empty?
        opts[:location].each do |val_to_check|
          unless location_allowable_values.include?(val_to_check)
            raise 'Invalid value for "location", must be one of ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP.'
          end
        end
      end


      location_not_equal_to_allowable_values = %w[ON_PREMISE OCI_COMPUTE AZURE EC2 GCP]
      if opts[:location_not_equal_to] && !opts[:location_not_equal_to].empty?
        opts[:location_not_equal_to].each do |val_to_check|
          unless location_not_equal_to_allowable_values.include?(val_to_check)
            raise 'Invalid value for "location_not_equal_to", must be one of ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP.'
          end
        end
      end


      os_family_allowable_values = %w[ORACLE_LINUX_9 ORACLE_LINUX_8 ORACLE_LINUX_7 ORACLE_LINUX_6 WINDOWS_SERVER_2016 WINDOWS_SERVER_2019 WINDOWS_SERVER_2022 ALL]
      if opts[:os_family] && !opts[:os_family].empty?
        opts[:os_family].each do |val_to_check|
          unless os_family_allowable_values.include?(val_to_check)
            raise 'Invalid value for "os_family", must be one of ORACLE_LINUX_9, ORACLE_LINUX_8, ORACLE_LINUX_7, ORACLE_LINUX_6, WINDOWS_SERVER_2016, WINDOWS_SERVER_2019, WINDOWS_SERVER_2022, ALL.'
          end
        end
      end

      if opts[:report_format] && !%w[csv json xml].include?(opts[:report_format])
        raise 'Invalid value for "report_format", must be one of csv, json, xml.'
      end

      if opts[:report_type] && !%w[SECURITY BUGFIX ACTIVITY ALL].include?(opts[:report_type])
        raise 'Invalid value for "report_type", must be one of SECURITY, BUGFIX, ACTIVITY, ALL.'
      end

      path = '/managedInstanceAnalytics/content'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:managedInstanceGroupId] = opts[:managed_instance_group_id] if opts[:managed_instance_group_id]
      query_params[:lifecycleEnvironmentId] = opts[:lifecycle_environment_id] if opts[:lifecycle_environment_id]
      query_params[:lifecycleStageId] = opts[:lifecycle_stage_id] if opts[:lifecycle_stage_id]
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?
      query_params[:displayName] = OCI::ApiClient.build_collection_params(opts[:display_name], :multi) if opts[:display_name] && !opts[:display_name].empty?
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:securityUpdatesAvailableEqualsTo] = opts[:security_updates_available_equals_to] if opts[:security_updates_available_equals_to]
      query_params[:bugUpdatesAvailableEqualsTo] = opts[:bug_updates_available_equals_to] if opts[:bug_updates_available_equals_to]
      query_params[:securityUpdatesAvailableGreaterThan] = opts[:security_updates_available_greater_than] if opts[:security_updates_available_greater_than]
      query_params[:bugUpdatesAvailableGreaterThan] = opts[:bug_updates_available_greater_than] if opts[:bug_updates_available_greater_than]
      query_params[:location] = OCI::ApiClient.build_collection_params(opts[:location], :multi) if opts[:location] && !opts[:location].empty?
      query_params[:locationNotEqualTo] = OCI::ApiClient.build_collection_params(opts[:location_not_equal_to], :multi) if opts[:location_not_equal_to] && !opts[:location_not_equal_to].empty?
      query_params[:osFamily] = OCI::ApiClient.build_collection_params(opts[:os_family], :multi) if opts[:os_family] && !opts[:os_family].empty?
      query_params[:isManagedByAutonomousLinux] = opts[:is_managed_by_autonomous_linux] if !opts[:is_managed_by_autonomous_linux].nil?
      query_params[:reportFormat] = opts[:report_format] if opts[:report_format]
      query_params[:reportType] = opts[:report_type] if opts[:report_type]

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/x-yaml'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ReportingManagedInstanceClient#get_managed_instance_analytic_content') do
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


    # Returns a report for a single managed instance whose associated erratas match the given filters. You can select CSV, XML, or JSON format.
    #
    # @param [String] managed_instance_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the managed instance.
    # @param [Array<String>] vulnerability_type A filter to return only vulnerabilities matching the given types.
    #   Allowed values are: SECURITY, BUGFIX, ENHANCEMENT, OTHER, ALL
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :advisory_name The assigned erratum name. It's unique and not changeable.
    #
    #   Example: `ELSA-2020-5804`
    #
    # @option opts [String] :advisory_name_contains A filter to return resources that may partially match the erratum advisory name given.
    # @option opts [Array<String>] :advisory_type A filter to return only errata that match the given advisory types.
    #   Allowed values are: SECURITY, BUGFIX, ENHANCEMENT
    # @option opts [Array<String>] :vulnerability_name A filter to return vulnerabilities that match the given name. For Linux instances, this refers to the advisory name. For Windows instances, this refers to the Windows update display name.
    # @option opts [String] :vulnerability_name_contains A filter to return vulnerabilities that partially match the given name. For Linux instances, this refers to the advisory name. For Windows instances, this refers to the Windows update display name.
    # @option opts [String] :report_format The format of the report to download. Default is CSV. (default to csv)
    #   Allowed values are: csv, json, xml
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagementhub/get_managed_instance_content.rb.html) to see an example of how to use get_managed_instance_content API.
    def get_managed_instance_content(managed_instance_id, vulnerability_type, opts = {}, &block)
      logger.debug 'Calling operation ReportingManagedInstanceClient#get_managed_instance_content.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling get_managed_instance_content." if managed_instance_id.nil?
      raise "Missing the required parameter 'vulnerability_type' when calling get_managed_instance_content." if vulnerability_type.nil?

      vulnerability_type_allowable_values = %w[SECURITY BUGFIX ENHANCEMENT OTHER ALL]
      vulnerability_type.each do |val_to_check|
        unless vulnerability_type_allowable_values.include?(val_to_check)
          raise "Invalid value for 'vulnerability_type', must be one of SECURITY, BUGFIX, ENHANCEMENT, OTHER, ALL."
        end
      end


      advisory_type_allowable_values = %w[SECURITY BUGFIX ENHANCEMENT]
      if opts[:advisory_type] && !opts[:advisory_type].empty?
        opts[:advisory_type].each do |val_to_check|
          unless advisory_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "advisory_type", must be one of SECURITY, BUGFIX, ENHANCEMENT.'
          end
        end
      end

      if opts[:report_format] && !%w[csv json xml].include?(opts[:report_format])
        raise 'Invalid value for "report_format", must be one of csv, json, xml.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/content'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:vulnerabilityType] = OCI::ApiClient.build_collection_params(vulnerability_type, :multi)
      query_params[:advisoryName] = OCI::ApiClient.build_collection_params(opts[:advisory_name], :multi) if opts[:advisory_name] && !opts[:advisory_name].empty?
      query_params[:advisoryNameContains] = opts[:advisory_name_contains] if opts[:advisory_name_contains]
      query_params[:advisoryType] = OCI::ApiClient.build_collection_params(opts[:advisory_type], :multi) if opts[:advisory_type] && !opts[:advisory_type].empty?
      query_params[:vulnerabilityName] = OCI::ApiClient.build_collection_params(opts[:vulnerability_name], :multi) if opts[:vulnerability_name] && !opts[:vulnerability_name].empty?
      query_params[:vulnerabilityNameContains] = opts[:vulnerability_name_contains] if opts[:vulnerability_name_contains]
      query_params[:reportFormat] = opts[:report_format] if opts[:report_format]

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/x-yaml'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ReportingManagedInstanceClient#get_managed_instance_content') do
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


    # Returns a list of user specified metrics for a collection of managed instances.
    #
    # @param [Array<String>] metric_names A filter to return only metrics whose name matches the given metric names.
    #   Allowed values are: TOTAL_INSTANCE_COUNT, INSTANCE_WITH_AVAILABLE_SECURITY_UPDATES_COUNT, INSTANCE_WITH_AVAILABLE_BUGFIX_UPDATES_COUNT, NORMAL_INSTANCE_COUNT, ERROR_INSTANCE_COUNT, WARNING_INSTANCE_COUNT, UNREACHABLE_INSTANCE_COUNT, REGISTRATION_FAILED_INSTANCE_COUNT, DELETING_INSTANCE_COUNT, ONBOARDING_INSTANCE_COUNT, INSTANCE_SECURITY_UPDATES_COUNT, INSTANCE_BUGFIX_UPDATES_COUNT, INSTANCE_SECURITY_ADVISORY_COUNT, INSTANCE_BUGFIX_ADVISORY_COUNT
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #   This filter returns only resources contained within the specified compartment.
    #
    # @option opts [String] :managed_instance_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the managed instance group. This filter returns resources associated with this group.
    # @option opts [String] :lifecycle_environment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the lifecycle environment. This filter returns only resource contained with the specified lifecycle environment.
    # @option opts [String] :lifecycle_stage_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the lifecycle stage. This resource returns resources associated with this lifecycle stage.
    # @option opts [Array<String>] :status A filter to return only managed instances whose status matches the status provided.
    #   Allowed values are: NORMAL, UNREACHABLE, ERROR, WARNING, REGISTRATION_ERROR, DELETING, ONBOARDING
    # @option opts [Array<String>] :location A filter to return only resources whose location matches the given value.
    #   Allowed values are: ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP
    # @option opts [Array<String>] :location_not_equal_to A filter to return only resources whose location does not match the given value.
    #   Allowed values are: ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP
    # @option opts [Array<String>] :os_family A filter to return only resources that match the given operating system family.
    #   Allowed values are: ORACLE_LINUX_9, ORACLE_LINUX_8, ORACLE_LINUX_7, ORACLE_LINUX_6, WINDOWS_SERVER_2016, WINDOWS_SERVER_2019, WINDOWS_SERVER_2022, ALL
    # @option opts [BOOLEAN] :is_managed_by_autonomous_linux Indicates whether to list only resources managed by the Autonomous Linux service.
    #
    # @option opts [Array<String>] :display_name A filter to return resources that match the given display names.
    # @option opts [String] :display_name_contains A filter to return resources that may partially match the given display name.
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
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. The default is to sort in ascending order by metricName (previously name, which is now depricated).
    #   You can also sort by displayName (default is ascending order).
    #    (default to name)
    #   Allowed values are: name, metricName, displayName
    # @option opts [String] :sort_order The sort order to use, either 'ASC' or 'DESC'.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::OsManagementHub::Models::ManagedInstanceAnalyticCollection ManagedInstanceAnalyticCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagementhub/summarize_managed_instance_analytics.rb.html) to see an example of how to use summarize_managed_instance_analytics API.
    def summarize_managed_instance_analytics(metric_names, opts = {})
      logger.debug 'Calling operation ReportingManagedInstanceClient#summarize_managed_instance_analytics.' if logger

      raise "Missing the required parameter 'metric_names' when calling summarize_managed_instance_analytics." if metric_names.nil?

      metric_names_allowable_values = %w[TOTAL_INSTANCE_COUNT INSTANCE_WITH_AVAILABLE_SECURITY_UPDATES_COUNT INSTANCE_WITH_AVAILABLE_BUGFIX_UPDATES_COUNT NORMAL_INSTANCE_COUNT ERROR_INSTANCE_COUNT WARNING_INSTANCE_COUNT UNREACHABLE_INSTANCE_COUNT REGISTRATION_FAILED_INSTANCE_COUNT DELETING_INSTANCE_COUNT ONBOARDING_INSTANCE_COUNT INSTANCE_SECURITY_UPDATES_COUNT INSTANCE_BUGFIX_UPDATES_COUNT INSTANCE_SECURITY_ADVISORY_COUNT INSTANCE_BUGFIX_ADVISORY_COUNT]
      metric_names.each do |val_to_check|
        unless metric_names_allowable_values.include?(val_to_check)
          raise "Invalid value for 'metric_names', must be one of TOTAL_INSTANCE_COUNT, INSTANCE_WITH_AVAILABLE_SECURITY_UPDATES_COUNT, INSTANCE_WITH_AVAILABLE_BUGFIX_UPDATES_COUNT, NORMAL_INSTANCE_COUNT, ERROR_INSTANCE_COUNT, WARNING_INSTANCE_COUNT, UNREACHABLE_INSTANCE_COUNT, REGISTRATION_FAILED_INSTANCE_COUNT, DELETING_INSTANCE_COUNT, ONBOARDING_INSTANCE_COUNT, INSTANCE_SECURITY_UPDATES_COUNT, INSTANCE_BUGFIX_UPDATES_COUNT, INSTANCE_SECURITY_ADVISORY_COUNT, INSTANCE_BUGFIX_ADVISORY_COUNT."
        end
      end


      status_allowable_values = %w[NORMAL UNREACHABLE ERROR WARNING REGISTRATION_ERROR DELETING ONBOARDING]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of NORMAL, UNREACHABLE, ERROR, WARNING, REGISTRATION_ERROR, DELETING, ONBOARDING.'
          end
        end
      end


      location_allowable_values = %w[ON_PREMISE OCI_COMPUTE AZURE EC2 GCP]
      if opts[:location] && !opts[:location].empty?
        opts[:location].each do |val_to_check|
          unless location_allowable_values.include?(val_to_check)
            raise 'Invalid value for "location", must be one of ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP.'
          end
        end
      end


      location_not_equal_to_allowable_values = %w[ON_PREMISE OCI_COMPUTE AZURE EC2 GCP]
      if opts[:location_not_equal_to] && !opts[:location_not_equal_to].empty?
        opts[:location_not_equal_to].each do |val_to_check|
          unless location_not_equal_to_allowable_values.include?(val_to_check)
            raise 'Invalid value for "location_not_equal_to", must be one of ON_PREMISE, OCI_COMPUTE, AZURE, EC2, GCP.'
          end
        end
      end


      os_family_allowable_values = %w[ORACLE_LINUX_9 ORACLE_LINUX_8 ORACLE_LINUX_7 ORACLE_LINUX_6 WINDOWS_SERVER_2016 WINDOWS_SERVER_2019 WINDOWS_SERVER_2022 ALL]
      if opts[:os_family] && !opts[:os_family].empty?
        opts[:os_family].each do |val_to_check|
          unless os_family_allowable_values.include?(val_to_check)
            raise 'Invalid value for "os_family", must be one of ORACLE_LINUX_9, ORACLE_LINUX_8, ORACLE_LINUX_7, ORACLE_LINUX_6, WINDOWS_SERVER_2016, WINDOWS_SERVER_2019, WINDOWS_SERVER_2022, ALL.'
          end
        end
      end

      if opts[:sort_by] && !%w[name metricName displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, metricName, displayName.'
      end

      if opts[:sort_order] && !OCI::OsManagementHub::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::OsManagementHub::Models::SORT_ORDER_ENUM.'
      end

      path = '/managedInstanceAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:metricNames] = OCI::ApiClient.build_collection_params(metric_names, :multi)
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:managedInstanceGroupId] = opts[:managed_instance_group_id] if opts[:managed_instance_group_id]
      query_params[:lifecycleEnvironmentId] = opts[:lifecycle_environment_id] if opts[:lifecycle_environment_id]
      query_params[:lifecycleStageId] = opts[:lifecycle_stage_id] if opts[:lifecycle_stage_id]
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?
      query_params[:location] = OCI::ApiClient.build_collection_params(opts[:location], :multi) if opts[:location] && !opts[:location].empty?
      query_params[:locationNotEqualTo] = OCI::ApiClient.build_collection_params(opts[:location_not_equal_to], :multi) if opts[:location_not_equal_to] && !opts[:location_not_equal_to].empty?
      query_params[:osFamily] = OCI::ApiClient.build_collection_params(opts[:os_family], :multi) if opts[:os_family] && !opts[:os_family].empty?
      query_params[:isManagedByAutonomousLinux] = opts[:is_managed_by_autonomous_linux] if !opts[:is_managed_by_autonomous_linux].nil?
      query_params[:displayName] = OCI::ApiClient.build_collection_params(opts[:display_name], :multi) if opts[:display_name] && !opts[:display_name].empty?
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ReportingManagedInstanceClient#summarize_managed_instance_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagementHub::Models::ManagedInstanceAnalyticCollection'
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
