# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Manage Oracle Cloud Infrastructure console announcements.
  class AnnouncementsService::AnnouncementClient
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


    # Creates a new AnnouncementClient.
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
        @endpoint = endpoint + '/20180904'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "AnnouncementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint(@region, :AnnouncementClient) + '/20180904'
      logger.info "AnnouncementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a specific announcement.
    #
    # @param [String] announcement_id The OCID of the announcement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::Announcement Announcement}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/get_announcement.rb.html) to see an example of how to use get_announcement API.
    def get_announcement(announcement_id, opts = {})
      logger.debug 'Calling operation AnnouncementClient#get_announcement.' if logger

      raise "Missing the required parameter 'announcement_id' when calling get_announcement." if announcement_id.nil?
      raise "Parameter value for 'announcement_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_id)

      path = '/announcements/{announcementId}'.sub('{announcementId}', announcement_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementClient#get_announcement') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::Announcement'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about whether a specific announcement was acknowledged by a user.
    #
    # @param [String] announcement_id The OCID of the announcement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::AnnouncementUserStatusDetails AnnouncementUserStatusDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/get_announcement_user_status.rb.html) to see an example of how to use get_announcement_user_status API.
    def get_announcement_user_status(announcement_id, opts = {})
      logger.debug 'Calling operation AnnouncementClient#get_announcement_user_status.' if logger

      raise "Missing the required parameter 'announcement_id' when calling get_announcement_user_status." if announcement_id.nil?
      raise "Parameter value for 'announcement_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_id)

      path = '/announcements/{announcementId}/userStatus'.sub('{announcementId}', announcement_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementClient#get_announcement_user_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::AnnouncementUserStatusDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of announcements for the current tenancy.
    #
    # @param [String] compartment_id The OCID of the compartment. Because announcements are specific to a tenancy, this is the
    #   OCID of the root compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :announcement_type The type of announcement.
    # @option opts [String] :lifecycle_state The announcement's current lifecycle state.
    #   Allowed values are: ACTIVE, INACTIVE
    # @option opts [BOOLEAN] :is_banner Whether the announcement is displayed as a console banner.
    # @option opts [String] :sort_by The criteria to sort by. You can specify only one sort order.
    #
    #   Allowed values are: timeOneValue, timeTwoValue, timeCreated, referenceTicketNumber, summary, announcementType
    # @option opts [String] :sort_order The sort order to use. (Sorting by `announcementType` orders the announcements list according to importance.)
    #
    #   Allowed values are: ASC, DESC
    # @option opts [DateTime] :time_one_earliest_time The boundary for the earliest `timeOneValue` date on announcements that you want to see.
    # @option opts [DateTime] :time_one_latest_time The boundary for the latest `timeOneValue` date on announcements that you want to see.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::AnnouncementsCollection AnnouncementsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/list_announcements.rb.html) to see an example of how to use list_announcements API.
    def list_announcements(compartment_id, opts = {})
      logger.debug 'Calling operation AnnouncementClient#list_announcements.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_announcements." if compartment_id.nil?

      if opts[:lifecycle_state] && !%w[ACTIVE INACTIVE].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of ACTIVE, INACTIVE.'
      end

      if opts[:sort_by] && !%w[timeOneValue timeTwoValue timeCreated referenceTicketNumber summary announcementType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeOneValue, timeTwoValue, timeCreated, referenceTicketNumber, summary, announcementType.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/announcements'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:announcementType] = opts[:announcement_type] if opts[:announcement_type]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:isBanner] = opts[:is_banner] if !opts[:is_banner].nil?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:timeOneEarliestTime] = opts[:time_one_earliest_time] if opts[:time_one_earliest_time]
      query_params[:timeOneLatestTime] = opts[:time_one_latest_time] if opts[:time_one_latest_time]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementClient#list_announcements') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::AnnouncementsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the status of the specified announcement with regard to whether it has been marked as read.
    #
    # @param [String] announcement_id The OCID of the announcement.
    # @param [OCI::AnnouncementsService::Models::AnnouncementUserStatusDetails] status_details The information to use to update the announcement's read status.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/update_announcement_user_status.rb.html) to see an example of how to use update_announcement_user_status API.
    def update_announcement_user_status(announcement_id, status_details, opts = {})
      logger.debug 'Calling operation AnnouncementClient#update_announcement_user_status.' if logger

      raise "Missing the required parameter 'announcement_id' when calling update_announcement_user_status." if announcement_id.nil?
      raise "Missing the required parameter 'status_details' when calling update_announcement_user_status." if status_details.nil?
      raise "Parameter value for 'announcement_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_id)

      path = '/announcements/{announcementId}/userStatus'.sub('{announcementId}', announcement_id.to_s)
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

      post_body = @api_client.object_to_http_body(status_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementClient#update_announcement_user_status') do
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
