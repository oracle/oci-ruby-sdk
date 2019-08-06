# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # APIs for managing users, groups, compartments, and policies.
  class Identity::IdentityClient
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


    # Creates a new IdentityClient.
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
        @endpoint = endpoint + '/20160918'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "IdentityClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint(@region, :IdentityClient) + '/20160918'
      logger.info "IdentityClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Activates the specified MFA TOTP device for the user. Activation requires manual interaction with the Console.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [OCI::Identity::Models::MfaTotpToken] mfa_totp_token MFA TOTP token
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDeviceSummary MfaTotpDeviceSummary}
    def activate_mfa_totp_device(user_id, mfa_totp_device_id, mfa_totp_token, opts = {})
      logger.debug 'Calling operation IdentityClient#activate_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling activate_mfa_totp_device." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling activate_mfa_totp_device." if mfa_totp_device_id.nil?
      raise "Missing the required parameter 'mfa_totp_token' when calling activate_mfa_totp_device." if mfa_totp_token.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}/actions/activate'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
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

      post_body = @api_client.object_to_http_body(mfa_totp_token)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#activate_mfa_totp_device') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDeviceSummary'
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


    # Adds the specified user to the specified group and returns a `UserGroupMembership` object with its own OCID.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::AddUserToGroupDetails] add_user_to_group_details Request object for adding a user to a group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UserGroupMembership UserGroupMembership}
    def add_user_to_group(add_user_to_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#add_user_to_group.' if logger

      raise "Missing the required parameter 'add_user_to_group_details' when calling add_user_to_group." if add_user_to_group_details.nil?

      path = '/userGroupMemberships/'
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

      post_body = @api_client.object_to_http_body(add_user_to_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#add_user_to_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UserGroupMembership'
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


    # Moves the specified tag namespace to the specified compartment within the same tenancy.
    #
    # To move the tag namespace, you must have the manage tag-namespaces permission on both compartments.
    # For more information about IAM policies, see [Details for IAM](https://docs.cloud.oracle.com/Content/Identity/Reference/iampolicyreference.htm).
    #
    # Moving a tag namespace moves all the tag key definitions contained in the tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::ChangeTagNamespaceCompartmentDetail] change_tag_namespace_compartment_detail Request object for changing the compartment of a tag namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def change_tag_namespace_compartment(tag_namespace_id, change_tag_namespace_compartment_detail, opts = {})
      logger.debug 'Calling operation IdentityClient#change_tag_namespace_compartment.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling change_tag_namespace_compartment." if tag_namespace_id.nil?
      raise "Missing the required parameter 'change_tag_namespace_compartment_detail' when calling change_tag_namespace_compartment." if change_tag_namespace_compartment_detail.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/actions/changeCompartment'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_tag_namespace_compartment_detail)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#change_tag_namespace_compartment') do
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


    # Creates a new auth token for the specified user. For information about what auth tokens are for, see
    # [Managing User Credentials](https://docs.cloud.oracle.com/Content/Identity/Tasks/managingcredentials.htm).
    #
    # You must specify a *description* for the auth token (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_auth_token update_auth_token}.
    #
    # Every user has permission to create an auth token for *their own user ID*. An administrator in your organization
    # does not need to write a policy to give users this ability. To compare, administrators who have permission to the
    # tenancy can use this operation to create an auth token for any user, including themselves.
    #
    # @param [OCI::Identity::Models::CreateAuthTokenDetails] create_auth_token_details Request object for creating a new auth token.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthToken AuthToken}
    def create_auth_token(create_auth_token_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_auth_token.' if logger

      raise "Missing the required parameter 'create_auth_token_details' when calling create_auth_token." if create_auth_token_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_auth_token." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/authTokens/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_auth_token_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_auth_token') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthToken'
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


    # Creates a new compartment in the specified compartment.
    #
    # **Important:** Compartments cannot be deleted.
    #
    # Specify the parent compartment's OCID as the compartment ID in the request object. Remember that the tenancy
    # is simply the root compartment. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the compartment, which must be unique across all compartments in
    # your tenancy. You can use this name or the OCID when writing policies that apply
    # to the compartment. For more information about policies, see
    # [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/Concepts/policies.htm).
    #
    # You must also specify a *description* for the compartment (although it can be an empty string). It does
    # not have to be unique, and you can change it anytime with
    # {#update_compartment update_compartment}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::CreateCompartmentDetails] create_compartment_details Request object for creating a new compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    def create_compartment(create_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_compartment.' if logger

      raise "Missing the required parameter 'create_compartment_details' when calling create_compartment." if create_compartment_details.nil?

      path = '/compartments/'
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

      post_body = @api_client.object_to_http_body(create_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_compartment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
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


    # Creates a new secret key for the specified user. Secret keys are used for authentication with the Object Storage Service's Amazon S3
    # compatible API. For information, see
    # [Managing User Credentials](https://docs.cloud.oracle.com/Content/Identity/Tasks/managingcredentials.htm).
    #
    # You must specify a *description* for the secret key (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_customer_secret_key update_customer_secret_key}.
    #
    # Every user has permission to create a secret key for *their own user ID*. An administrator in your organization
    # does not need to write a policy to give users this ability. To compare, administrators who have permission to the
    # tenancy can use this operation to create a secret key for any user, including themselves.
    #
    # @param [OCI::Identity::Models::CreateCustomerSecretKeyDetails] create_customer_secret_key_details Request object for creating a new secret key.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::CustomerSecretKey CustomerSecretKey}
    def create_customer_secret_key(create_customer_secret_key_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_customer_secret_key.' if logger

      raise "Missing the required parameter 'create_customer_secret_key_details' when calling create_customer_secret_key." if create_customer_secret_key_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_customer_secret_key." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/customerSecretKeys/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_customer_secret_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_customer_secret_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::CustomerSecretKey'
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


    # Creates a new dynamic group in your tenancy.
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the tenancy
    # is simply the root compartment). Notice that IAM resources (users, groups, compartments, and some policies)
    # reside within the tenancy itself, unlike cloud resources such as compute instances, which typically
    # reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the dynamic group, which must be unique across all dynamic groups in your
    # tenancy, and cannot be changed. Note that this name has to be also unique across all groups in your tenancy.
    # You can use this name or the OCID when writing policies that apply to the dynamic group. For more information
    # about policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/Concepts/policies.htm).
    #
    # You must also specify a *description* for the dynamic group (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_dynamic_group update_dynamic_group}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::CreateDynamicGroupDetails] create_dynamic_group_details Request object for creating a new dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DynamicGroup DynamicGroup}
    def create_dynamic_group(create_dynamic_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_dynamic_group.' if logger

      raise "Missing the required parameter 'create_dynamic_group_details' when calling create_dynamic_group." if create_dynamic_group_details.nil?

      path = '/dynamicGroups/'
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

      post_body = @api_client.object_to_http_body(create_dynamic_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_dynamic_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DynamicGroup'
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


    # Creates a new group in your tenancy.
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the tenancy
    # is simply the root compartment). Notice that IAM resources (users, groups, compartments, and some policies)
    # reside within the tenancy itself, unlike cloud resources such as compute instances, which typically
    # reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the group, which must be unique across all groups in your tenancy and
    # cannot be changed. You can use this name or the OCID when writing policies that apply to the group. For more
    # information about policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/Concepts/policies.htm).
    #
    # You must also specify a *description* for the group (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_group update_group}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # After creating the group, you need to put users in it and write policies for it.
    # See {#add_user_to_group add_user_to_group} and
    # {#create_policy create_policy}.
    #
    # @param [OCI::Identity::Models::CreateGroupDetails] create_group_details Request object for creating a new group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Group Group}
    def create_group(create_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_group.' if logger

      raise "Missing the required parameter 'create_group_details' when calling create_group." if create_group_details.nil?

      path = '/groups/'
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

      post_body = @api_client.object_to_http_body(create_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Group'
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


    # Creates a new identity provider in your tenancy. For more information, see
    # [Identity Providers and Federation](https://docs.cloud.oracle.com/Content/Identity/Concepts/federation.htm).
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object.
    # Remember that the tenancy is simply the root compartment. For information about
    # OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the `IdentityProvider`, which must be unique
    # across all `IdentityProvider` objects in your tenancy and cannot be changed.
    #
    # You must also specify a *description* for the `IdentityProvider` (although
    # it can be an empty string). It does not have to be unique, and you can change
    # it anytime with
    # {#update_identity_provider update_identity_provider}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily
    # be CREATING. Before using the object, first make sure its `lifecycleState` has
    # changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::CreateIdentityProviderDetails] create_identity_provider_details Request object for creating a new SAML2 identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdentityProvider IdentityProvider}
    def create_identity_provider(create_identity_provider_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_identity_provider.' if logger

      raise "Missing the required parameter 'create_identity_provider_details' when calling create_identity_provider." if create_identity_provider_details.nil?

      path = '/identityProviders/'
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

      post_body = @api_client.object_to_http_body(create_identity_provider_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_identity_provider') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdentityProvider'
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


    # Creates a single mapping between an IdP group and an IAM Service
    # {Group}.
    #
    # @param [OCI::Identity::Models::CreateIdpGroupMappingDetails] create_idp_group_mapping_details Add a mapping from an SAML2.0 identity provider group to a BMC group.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}
    def create_idp_group_mapping(create_idp_group_mapping_details, identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_idp_group_mapping.' if logger

      raise "Missing the required parameter 'create_idp_group_mapping_details' when calling create_idp_group_mapping." if create_idp_group_mapping_details.nil?
      raise "Missing the required parameter 'identity_provider_id' when calling create_idp_group_mapping." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/'.sub('{identityProviderId}', identity_provider_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_idp_group_mapping_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_idp_group_mapping') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdpGroupMapping'
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


    # Creates a new MFA TOTP device for the user. A user can have one MFA TOTP device.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDevice MfaTotpDevice}
    def create_mfa_totp_device(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling create_mfa_totp_device." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/mfaTotpDevices'.sub('{userId}', user_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_mfa_totp_device') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDevice'
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


    # Creates a new Console one-time password for the specified user. For more information about user
    # credentials, see [User Credentials](https://docs.cloud.oracle.com/Content/Identity/Concepts/usercredentials.htm).
    #
    # Use this operation after creating a new user, or if a user forgets their password. The new one-time
    # password is returned to you in the response, and you must securely deliver it to the user. They'll
    # be prompted to change this password the next time they sign in to the Console. If they don't change
    # it within 7 days, the password will expire and you'll need to create a new one-time password for the
    # user.
    #
    # **Note:** The user's Console login is the unique name you specified when you created the user
    # (see {#create_user create_user}).
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UIPassword UIPassword}
    def create_or_reset_ui_password(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_or_reset_ui_password.' if logger

      raise "Missing the required parameter 'user_id' when calling create_or_reset_ui_password." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/uiPassword'.sub('{userId}', user_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_or_reset_ui_password') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UIPassword'
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


    # Creates a new policy in the specified compartment (either the tenancy or another of your compartments).
    # If you're new to policies, see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # You must specify a *name* for the policy, which must be unique across all policies in your tenancy
    # and cannot be changed.
    #
    # You must also specify a *description* for the policy (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_policy update_policy}.
    #
    # You must specify one or more policy statements in the statements array. For information about writing
    # policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/Concepts/policies.htm) and
    # [Common Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/commonpolicies.htm).
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # New policies take effect typically within 10 seconds.
    #
    # @param [OCI::Identity::Models::CreatePolicyDetails] create_policy_details Request object for creating a new policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Policy Policy}
    def create_policy(create_policy_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_policy.' if logger

      raise "Missing the required parameter 'create_policy_details' when calling create_policy." if create_policy_details.nil?

      path = '/policies/'
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

      post_body = @api_client.object_to_http_body(create_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Policy'
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


    # Creates a subscription to a region for a tenancy.
    #
    # @param [OCI::Identity::Models::CreateRegionSubscriptionDetails] create_region_subscription_details Request object for activate a new region.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::RegionSubscription RegionSubscription}
    def create_region_subscription(create_region_subscription_details, tenancy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_region_subscription.' if logger

      raise "Missing the required parameter 'create_region_subscription_details' when calling create_region_subscription." if create_region_subscription_details.nil?
      raise "Missing the required parameter 'tenancy_id' when calling create_region_subscription." if tenancy_id.nil?
      raise "Parameter value for 'tenancy_id' must not be blank" if OCI::Internal::Util.blank_string?(tenancy_id)

      path = '/tenancies/{tenancyId}/regionSubscriptions'.sub('{tenancyId}', tenancy_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_region_subscription_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_region_subscription') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::RegionSubscription'
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


    # Creates a new SMTP credential for the specified user. An SMTP credential has an SMTP user name and an SMTP password.
    # You must specify a *description* for the SMTP credential (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_smtp_credential update_smtp_credential}.
    #
    # @param [OCI::Identity::Models::CreateSmtpCredentialDetails] create_smtp_credential_details Request object for creating a new SMTP credential with the user.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SmtpCredential SmtpCredential}
    def create_smtp_credential(create_smtp_credential_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_smtp_credential.' if logger

      raise "Missing the required parameter 'create_smtp_credential_details' when calling create_smtp_credential." if create_smtp_credential_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_smtp_credential." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/smtpCredentials/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_smtp_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_smtp_credential') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SmtpCredential'
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


    # **Deprecated. Use {#create_auth_token create_auth_token} instead.**
    #
    # Creates a new Swift password for the specified user. For information about what Swift passwords are for, see
    # [Managing User Credentials](https://docs.cloud.oracle.com/Content/Identity/Tasks/managingcredentials.htm).
    #
    # You must specify a *description* for the Swift password (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_swift_password update_swift_password}.
    #
    # Every user has permission to create a Swift password for *their own user ID*. An administrator in your organization
    # does not need to write a policy to give users this ability. To compare, administrators who have permission to the
    # tenancy can use this operation to create a Swift password for any user, including themselves.
    #
    # @param [OCI::Identity::Models::CreateSwiftPasswordDetails] create_swift_password_details Request object for creating a new swift password.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SwiftPassword SwiftPassword}
    def create_swift_password(create_swift_password_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_swift_password.' if logger

      raise "Missing the required parameter 'create_swift_password_details' when calling create_swift_password." if create_swift_password_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_swift_password." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/swiftPasswords/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_swift_password_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_swift_password') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SwiftPassword'
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


    # Creates a new tag in the specified tag namespace.
    #
    # You must specify either the OCID or the name of the tag namespace that will contain this tag definition.
    #
    # You must also specify a *name* for the tag, which must be unique across all tags in the tag namespace
    # and cannot be changed. The name can contain any ASCII character except the space (_) or period (.) characters.
    # Names are case insensitive. That means, for example, \"myTag\" and \"mytag\" are not allowed in the same namespace.
    # If you specify a name that's already in use in the tag namespace, a 409 error is returned.
    #
    # You must also specify a *description* for the tag.
    # It does not have to be unique, and you can change it with
    # {#update_tag update_tag}.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::CreateTagDetails] create_tag_details Request object for creating a new tag in the specified tag namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tag Tag}
    def create_tag(tag_namespace_id, create_tag_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling create_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'create_tag_details' when calling create_tag." if create_tag_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/tags'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_tag') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tag'
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


    # Creates a new tag default in the specified compartment for the specified tag definition.
    #
    # @param [OCI::Identity::Models::CreateTagDefaultDetails] create_tag_default_details Request object for creating a new tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    def create_tag_default(create_tag_default_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_tag_default.' if logger

      raise "Missing the required parameter 'create_tag_default_details' when calling create_tag_default." if create_tag_default_details.nil?

      path = '/tagDefaults'
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

      post_body = @api_client.object_to_http_body(create_tag_default_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_tag_default') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
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


    # Creates a new tag namespace in the specified compartment.
    #
    # You must specify the compartment ID in the request object (remember that the tenancy is simply the root
    # compartment).
    #
    # You must also specify a *name* for the namespace, which must be unique across all namespaces in your tenancy
    # and cannot be changed. The name can contain any ASCII character except the space (_) or period (.).
    # Names are case insensitive. That means, for example, \"myNamespace\" and \"mynamespace\" are not allowed
    # in the same tenancy. Once you created a namespace, you cannot change the name.
    # If you specify a name that's already in use in the tenancy, a 409 error is returned.
    #
    # You must also specify a *description* for the namespace.
    # It does not have to be unique, and you can change it with
    # {#update_tag_namespace update_tag_namespace}.
    #
    # Tag namespaces cannot be deleted, but they can be retired.
    # See [Retiring Key Definitions and Namespace Definitions](https://docs.cloud.oracle.com/Content/Identity/Concepts/taggingoverview.htm#Retiring) for more information.
    #
    # @param [OCI::Identity::Models::CreateTagNamespaceDetails] create_tag_namespace_details Request object for creating a new tag namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    def create_tag_namespace(create_tag_namespace_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_tag_namespace.' if logger

      raise "Missing the required parameter 'create_tag_namespace_details' when calling create_tag_namespace." if create_tag_namespace_details.nil?

      path = '/tagNamespaces'
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

      post_body = @api_client.object_to_http_body(create_tag_namespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_tag_namespace') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
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


    # Creates a new user in your tenancy. For conceptual information about users, your tenancy, and other
    # IAM Service components, see [Overview of the IAM Service](https://docs.cloud.oracle.com/Content/Identity/Concepts/overview.htm).
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the
    # tenancy is simply the root compartment). Notice that IAM resources (users, groups, compartments, and
    # some policies) reside within the tenancy itself, unlike cloud resources such as compute instances,
    # which typically reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the user, which must be unique across all users in your tenancy
    # and cannot be changed. Allowed characters: No spaces. Only letters, numerals, hyphens, periods,
    # underscores, +, and @. If you specify a name that's already in use, you'll get a 409 error.
    # This name will be the user's login to the Console. You might want to pick a
    # name that your company's own identity system (e.g., Active Directory, LDAP, etc.) already uses.
    # If you delete a user and then create a new user with the same name, they'll be considered different
    # users because they have different OCIDs.
    #
    # You must also specify a *description* for the user (although it can be an empty string).
    # It does not have to be unique, and you can change it anytime with
    # {#update_user update_user}. You can use the field to provide the user's
    # full name, a description, a nickname, or other information to generally identify the user.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before
    # using the object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # A new user has no permissions until you place the user in one or more groups (see
    # {#add_user_to_group add_user_to_group}). If the user needs to
    # access the Console, you need to provide the user a password (see
    # {#create_or_reset_ui_password create_or_reset_ui_password}).
    # If the user needs to access the Oracle Cloud Infrastructure REST API, you need to upload a
    # public API signing key for that user (see
    # [Required Keys and OCIDs](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm) and also
    # {#upload_api_key upload_api_key}).
    #
    # **Important:** Make sure to inform the new user which compartment(s) they have access to.
    #
    # @param [OCI::Identity::Models::CreateUserDetails] create_user_details Request object for creating a new user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    def create_user(create_user_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_user.' if logger

      raise "Missing the required parameter 'create_user_details' when calling create_user." if create_user_details.nil?

      path = '/users/'
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

      post_body = @api_client.object_to_http_body(create_user_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_user') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
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


    # Deletes the specified API signing key for the specified user.
    #
    # Every user has permission to use this operation to delete a key for *their own user ID*. An
    # administrator in your organization does not need to write a policy to give users this ability.
    # To compare, administrators who have permission to the tenancy can use this operation to delete
    # a key for any user, including themselves.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] fingerprint The key's fingerprint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_api_key(user_id, fingerprint, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_api_key.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_api_key." if user_id.nil?
      raise "Missing the required parameter 'fingerprint' when calling delete_api_key." if fingerprint.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'fingerprint' must not be blank" if OCI::Internal::Util.blank_string?(fingerprint)

      path = '/users/{userId}/apiKeys/{fingerprint}'.sub('{userId}', user_id.to_s).sub('{fingerprint}', fingerprint.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_api_key') do
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


    # Deletes the specified auth token for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] auth_token_id The OCID of the auth token.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_auth_token(user_id, auth_token_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_auth_token.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_auth_token." if user_id.nil?
      raise "Missing the required parameter 'auth_token_id' when calling delete_auth_token." if auth_token_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'auth_token_id' must not be blank" if OCI::Internal::Util.blank_string?(auth_token_id)

      path = '/users/{userId}/authTokens/{authTokenId}'.sub('{userId}', user_id.to_s).sub('{authTokenId}', auth_token_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_auth_token') do
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


    # Deletes the specified compartment. The compartment must be empty.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_compartment(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling delete_compartment." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_compartment') do
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


    # Deletes the specified secret key for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] customer_secret_key_id The OCID of the secret key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_customer_secret_key(user_id, customer_secret_key_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_customer_secret_key.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_customer_secret_key." if user_id.nil?
      raise "Missing the required parameter 'customer_secret_key_id' when calling delete_customer_secret_key." if customer_secret_key_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'customer_secret_key_id' must not be blank" if OCI::Internal::Util.blank_string?(customer_secret_key_id)

      path = '/users/{userId}/customerSecretKeys/{customerSecretKeyId}'.sub('{userId}', user_id.to_s).sub('{customerSecretKeyId}', customer_secret_key_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_customer_secret_key') do
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


    # Deletes the specified dynamic group.
    #
    # @param [String] dynamic_group_id The OCID of the dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_dynamic_group(dynamic_group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_dynamic_group.' if logger

      raise "Missing the required parameter 'dynamic_group_id' when calling delete_dynamic_group." if dynamic_group_id.nil?
      raise "Parameter value for 'dynamic_group_id' must not be blank" if OCI::Internal::Util.blank_string?(dynamic_group_id)

      path = '/dynamicGroups/{dynamicGroupId}'.sub('{dynamicGroupId}', dynamic_group_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_dynamic_group') do
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


    # Deletes the specified group. The group must be empty.
    #
    # @param [String] group_id The OCID of the group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_group(group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_group.' if logger

      raise "Missing the required parameter 'group_id' when calling delete_group." if group_id.nil?
      raise "Parameter value for 'group_id' must not be blank" if OCI::Internal::Util.blank_string?(group_id)

      path = '/groups/{groupId}'.sub('{groupId}', group_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_group') do
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


    # Deletes the specified identity provider. The identity provider must not have
    # any group mappings (see {IdpGroupMapping}).
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_identity_provider(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_identity_provider.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling delete_identity_provider." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}'.sub('{identityProviderId}', identity_provider_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_identity_provider') do
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


    # Deletes the specified group mapping.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [String] mapping_id The OCID of the group mapping.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_idp_group_mapping(identity_provider_id, mapping_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_idp_group_mapping.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling delete_idp_group_mapping." if identity_provider_id.nil?
      raise "Missing the required parameter 'mapping_id' when calling delete_idp_group_mapping." if mapping_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)
      raise "Parameter value for 'mapping_id' must not be blank" if OCI::Internal::Util.blank_string?(mapping_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/{mappingId}'.sub('{identityProviderId}', identity_provider_id.to_s).sub('{mappingId}', mapping_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_idp_group_mapping') do
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


    # Deletes the specified MFA TOTP device for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_mfa_totp_device(user_id, mfa_totp_device_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_mfa_totp_device." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling delete_mfa_totp_device." if mfa_totp_device_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_mfa_totp_device') do
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


    # Deletes the specified policy. The deletion takes effect typically within 10 seconds.
    # @param [String] policy_id The OCID of the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_policy(policy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling delete_policy." if policy_id.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/policies/{policyId}'.sub('{policyId}', policy_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_policy') do
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


    # Deletes the specified SMTP credential for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] smtp_credential_id The OCID of the SMTP credential.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_smtp_credential(user_id, smtp_credential_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_smtp_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_smtp_credential." if user_id.nil?
      raise "Missing the required parameter 'smtp_credential_id' when calling delete_smtp_credential." if smtp_credential_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'smtp_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(smtp_credential_id)

      path = '/users/{userId}/smtpCredentials/{smtpCredentialId}'.sub('{userId}', user_id.to_s).sub('{smtpCredentialId}', smtp_credential_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_smtp_credential') do
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


    # **Deprecated. Use {#delete_auth_token delete_auth_token} instead.**
    #
    # Deletes the specified Swift password for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] swift_password_id The OCID of the Swift password.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_swift_password(user_id, swift_password_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_swift_password.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_swift_password." if user_id.nil?
      raise "Missing the required parameter 'swift_password_id' when calling delete_swift_password." if swift_password_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'swift_password_id' must not be blank" if OCI::Internal::Util.blank_string?(swift_password_id)

      path = '/users/{userId}/swiftPasswords/{swiftPasswordId}'.sub('{userId}', user_id.to_s).sub('{swiftPasswordId}', swift_password_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_swift_password') do
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


    # Deletes the the specified tag definition.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [String] tag_name The name of the tag.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_tag(tag_namespace_id, tag_name, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling delete_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'tag_name' when calling delete_tag." if tag_name.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)
      raise "Parameter value for 'tag_name' must not be blank" if OCI::Internal::Util.blank_string?(tag_name)

      path = '/tagNamespaces/{tagNamespaceId}/tags/{tagName}'.sub('{tagNamespaceId}', tag_namespace_id.to_s).sub('{tagName}', tag_name.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_tag') do
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


    # Deletes the the specified tag default.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_tag_default(tag_default_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_tag_default.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling delete_tag_default." if tag_default_id.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}'.sub('{tagDefaultId}', tag_default_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_tag_default') do
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


    # Delete the specified tag namespace. Only an empty tagnamespace can be deleted.
    # If the tag namespace you are trying to delete is not empty, please remove tag definitions from it first.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_tag_namespace(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling delete_tag_namespace." if tag_namespace_id.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_tag_namespace') do
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


    # Deletes the specified user. The user must not be in any groups.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_user(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_user.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_user." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}'.sub('{userId}', user_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_user') do
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


    # Generate seed for the MFA TOTP device.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDevice MfaTotpDevice}
    def generate_totp_seed(user_id, mfa_totp_device_id, opts = {})
      logger.debug 'Calling operation IdentityClient#generate_totp_seed.' if logger

      raise "Missing the required parameter 'user_id' when calling generate_totp_seed." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling generate_totp_seed." if mfa_totp_device_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}/actions/generateSeed'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#generate_totp_seed') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDevice'
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


    # Gets the authentication policy for the given tenancy. You must specify your tenant\u2019s OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthenticationPolicy AuthenticationPolicy}
    def get_authentication_policy(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_authentication_policy.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_authentication_policy." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/authenticationPolicies/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_authentication_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthenticationPolicy'
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


    # Gets the specified compartment's information.
    #
    # This operation does not return a list of all the resources inside the compartment. There is no single
    # API operation that does that. Compartments can contain multiple types of resources (instances, block
    # storage volumes, etc.). To find out what's in a compartment, you must call the \"List\" operation for
    # each resource type and specify the compartment's OCID as a query parameter in the request. For example,
    # call the {#list_instances list_instances} operation in the Cloud Compute
    # Service or the {#list_volumes list_volumes} operation in Cloud Block Storage.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    def get_compartment(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_compartment." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_compartment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
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


    # Gets the specified dynamic group's information.
    #
    # @param [String] dynamic_group_id The OCID of the dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DynamicGroup DynamicGroup}
    def get_dynamic_group(dynamic_group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_dynamic_group.' if logger

      raise "Missing the required parameter 'dynamic_group_id' when calling get_dynamic_group." if dynamic_group_id.nil?
      raise "Parameter value for 'dynamic_group_id' must not be blank" if OCI::Internal::Util.blank_string?(dynamic_group_id)

      path = '/dynamicGroups/{dynamicGroupId}'.sub('{dynamicGroupId}', dynamic_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_dynamic_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DynamicGroup'
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


    # Gets the specified group's information.
    #
    # This operation does not return a list of all the users in the group. To do that, use
    # {#list_user_group_memberships list_user_group_memberships} and
    # provide the group's OCID as a query parameter in the request.
    #
    # @param [String] group_id The OCID of the group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Group Group}
    def get_group(group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_group.' if logger

      raise "Missing the required parameter 'group_id' when calling get_group." if group_id.nil?
      raise "Parameter value for 'group_id' must not be blank" if OCI::Internal::Util.blank_string?(group_id)

      path = '/groups/{groupId}'.sub('{groupId}', group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Group'
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


    # Gets the specified identity provider's information.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdentityProvider IdentityProvider}
    def get_identity_provider(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_identity_provider.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling get_identity_provider." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}'.sub('{identityProviderId}', identity_provider_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_identity_provider') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdentityProvider'
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


    # Gets the specified group mapping.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [String] mapping_id The OCID of the group mapping.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}
    def get_idp_group_mapping(identity_provider_id, mapping_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_idp_group_mapping.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling get_idp_group_mapping." if identity_provider_id.nil?
      raise "Missing the required parameter 'mapping_id' when calling get_idp_group_mapping." if mapping_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)
      raise "Parameter value for 'mapping_id' must not be blank" if OCI::Internal::Util.blank_string?(mapping_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/{mappingId}'.sub('{identityProviderId}', identity_provider_id.to_s).sub('{mappingId}', mapping_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_idp_group_mapping') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdpGroupMapping'
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


    # Get the specified MFA TOTP device for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDeviceSummary MfaTotpDeviceSummary}
    def get_mfa_totp_device(user_id, mfa_totp_device_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling get_mfa_totp_device." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling get_mfa_totp_device." if mfa_totp_device_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_mfa_totp_device') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDeviceSummary'
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


    # Gets the specified policy's information.
    # @param [String] policy_id The OCID of the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Policy Policy}
    def get_policy(policy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling get_policy." if policy_id.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/policies/{policyId}'.sub('{policyId}', policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Policy'
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


    # Gets the specified tag's information.
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [String] tag_name The name of the tag.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tag Tag}
    def get_tag(tag_namespace_id, tag_name, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling get_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'tag_name' when calling get_tag." if tag_name.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)
      raise "Parameter value for 'tag_name' must not be blank" if OCI::Internal::Util.blank_string?(tag_name)

      path = '/tagNamespaces/{tagNamespaceId}/tags/{tagName}'.sub('{tagNamespaceId}', tag_namespace_id.to_s).sub('{tagName}', tag_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tag') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tag'
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


    # Retrieves the specified tag default.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    def get_tag_default(tag_default_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tag_default.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling get_tag_default." if tag_default_id.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}'.sub('{tagDefaultId}', tag_default_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tag_default') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
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


    # Gets the specified tag namespace's information.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    def get_tag_namespace(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling get_tag_namespace." if tag_namespace_id.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tag_namespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
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


    # Get the specified tenancy's information.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tenancy Tenancy}
    def get_tenancy(tenancy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tenancy.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling get_tenancy." if tenancy_id.nil?
      raise "Parameter value for 'tenancy_id' must not be blank" if OCI::Internal::Util.blank_string?(tenancy_id)

      path = '/tenancies/{tenancyId}'.sub('{tenancyId}', tenancy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tenancy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tenancy'
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


    # Gets the specified user's information.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    def get_user(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_user.' if logger

      raise "Missing the required parameter 'user_id' when calling get_user." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_user') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
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


    # Gets the specified UserGroupMembership's information.
    # @param [String] user_group_membership_id The OCID of the userGroupMembership.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UserGroupMembership UserGroupMembership}
    def get_user_group_membership(user_group_membership_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_user_group_membership.' if logger

      raise "Missing the required parameter 'user_group_membership_id' when calling get_user_group_membership." if user_group_membership_id.nil?
      raise "Parameter value for 'user_group_membership_id' must not be blank" if OCI::Internal::Util.blank_string?(user_group_membership_id)

      path = '/userGroupMemberships/{userGroupMembershipId}'.sub('{userGroupMembershipId}', user_group_membership_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_user_group_membership') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UserGroupMembership'
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


    # Gets the specified user's console password information. The returned object contains the user's OCID,
    # but not the password itself. The actual password is returned only when created or reset.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UIPasswordInformation UIPasswordInformation}
    def get_user_ui_password_information(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_user_ui_password_information.' if logger

      raise "Missing the required parameter 'user_id' when calling get_user_ui_password_information." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/uiPassword'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_user_ui_password_information') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UIPasswordInformation'
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


    # Gets details on a specified work request. The workRequestID is returned in the opc-workrequest-id header
    # for any asynchronous operation in the Identity and Access Management service.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_work_request.' if logger

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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::WorkRequest'
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


    # Lists the API signing keys for the specified user. A user can have a maximum of three keys.
    #
    # Every user has permission to use this API call for *their own user ID*.  An administrator in your
    # organization does not need to write a policy to give users this ability.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::ApiKey ApiKey}>
    def list_api_keys(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_api_keys.' if logger

      raise "Missing the required parameter 'user_id' when calling list_api_keys." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/apiKeys/'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_api_keys') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::ApiKey>'
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


    # Lists the auth tokens for the specified user. The returned object contains the token's OCID, but not
    # the token itself. The actual token is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::AuthToken AuthToken}>
    def list_auth_tokens(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_auth_tokens.' if logger

      raise "Missing the required parameter 'user_id' when calling list_auth_tokens." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/authTokens/'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_auth_tokens') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::AuthToken>'
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


    # Lists the availability domains in your tenancy. Specify the OCID of either the tenancy or another
    # of your compartments as the value for the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    # Note that the order of the results returned can change if availability domains are added or removed; therefore, do not
    # create a dependency on the list order.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::AvailabilityDomain AvailabilityDomain}>
    def list_availability_domains(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_availability_domains.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_availability_domains." if compartment_id.nil?

      path = '/availabilityDomains/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_availability_domains') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::AvailabilityDomain>'
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


    # Lists the compartments in a specified compartment. The members of the list
    # returned depends on the values set for several parameters.
    #
    # With the exception of the tenancy (root compartment), the ListCompartments operation
    # returns only the first-level child compartments in the parent compartment specified in
    # `compartmentId`. The list does not include any subcompartments of the child
    # compartments (grandchildren).
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (the resource can be in a subcompartment).
    #
    # The parameter `compartmentIdInSubtree` applies only when you perform ListCompartments on the
    # tenancy (root compartment). When set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ANY.
    #
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :access_level Valid values are `ANY` and `ACCESSIBLE`. Default is `ANY`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). For the compartments on which the user indirectly has
    #   INSPECT permissions, a restricted set of fields is returned.
    #
    #   When set to `ANY` permissions are not checked.
    #
    #   Allowed values are: ANY, ACCESSIBLE
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false. Can only be set to true when performing
    #   ListCompartments on the tenancy (root compartment).
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Compartment Compartment}>
    def list_compartments(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_compartments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_compartments." if compartment_id.nil?

      if opts[:access_level] && !%w[ANY ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of ANY, ACCESSIBLE.'
      end

      path = '/compartments/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_compartments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Compartment>'
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


    # Lists all the tags enabled for cost-tracking in the specified tenancy. For information about
    # cost-tracking tags, see [Using Cost-tracking Tags](https://docs.cloud.oracle.com/Content/Identity/Concepts/taggingoverview.htm#costs).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Tag Tag}>
    def list_cost_tracking_tags(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_cost_tracking_tags.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cost_tracking_tags." if compartment_id.nil?

      path = '/tagNamespaces/actions/listCostTrackingTags'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_cost_tracking_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Tag>'
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


    # Lists the secret keys for the specified user. The returned object contains the secret key's OCID, but not
    # the secret key itself. The actual secret key is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::CustomerSecretKeySummary CustomerSecretKeySummary}>
    def list_customer_secret_keys(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_customer_secret_keys.' if logger

      raise "Missing the required parameter 'user_id' when calling list_customer_secret_keys." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/customerSecretKeys/'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_customer_secret_keys') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::CustomerSecretKeySummary>'
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


    # Lists the dynamic groups in your tenancy. You must specify your tenancy's OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::DynamicGroup DynamicGroup}>
    def list_dynamic_groups(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_dynamic_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_dynamic_groups." if compartment_id.nil?

      path = '/dynamicGroups/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_dynamic_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::DynamicGroup>'
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


    # Lists the Fault Domains in your tenancy. Specify the OCID of either the tenancy or another
    # of your compartments as the value for the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [String] availability_domain The name of the availibilityDomain.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::FaultDomain FaultDomain}>
    def list_fault_domains(compartment_id, availability_domain, opts = {})
      logger.debug 'Calling operation IdentityClient#list_fault_domains.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_fault_domains." if compartment_id.nil?
      raise "Missing the required parameter 'availability_domain' when calling list_fault_domains." if availability_domain.nil?

      path = '/faultDomains/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = availability_domain

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_fault_domains') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::FaultDomain>'
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


    # Lists the groups in your tenancy. You must specify your tenancy's OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Group Group}>
    def list_groups(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_groups." if compartment_id.nil?

      path = '/groups/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Group>'
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


    # Lists the identity provider groups.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IdentityProviderGroupSummary IdentityProviderGroupSummary}>
    def list_identity_provider_groups(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_identity_provider_groups.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling list_identity_provider_groups." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/groups/'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_identity_provider_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IdentityProviderGroupSummary>'
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


    # Lists all the identity providers in your tenancy. You must specify the identity provider type (e.g., `SAML2` for
    # identity providers using the SAML2.0 protocol). You must specify your tenancy's OCID as the value for the
    # compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] protocol The protocol used for federation.
    #   Allowed values are: SAML2
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IdentityProvider IdentityProvider}>
    def list_identity_providers(protocol, compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_identity_providers.' if logger

      raise "Missing the required parameter 'protocol' when calling list_identity_providers." if protocol.nil?
      unless %w[SAML2].include?(protocol)
        raise "Invalid value for 'protocol', must be one of SAML2."
      end
      raise "Missing the required parameter 'compartment_id' when calling list_identity_providers." if compartment_id.nil?

      path = '/identityProviders/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:protocol] = protocol
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_identity_providers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IdentityProvider>'
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


    # Lists the group mappings for the specified identity provider.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}>
    def list_idp_group_mappings(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_idp_group_mappings.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling list_idp_group_mappings." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_idp_group_mappings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IdpGroupMapping>'
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


    # Lists the MFA TOTP devices for the specified user. The returned object contains the device's OCID, but not
    # the seed. The seed is returned only upon creation or when the IAM service regenerates the MFA seed for the device.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::MfaTotpDeviceSummary MfaTotpDeviceSummary}>
    def list_mfa_totp_devices(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_mfa_totp_devices.' if logger

      raise "Missing the required parameter 'user_id' when calling list_mfa_totp_devices." if user_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/mfaTotpDevices'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_mfa_totp_devices') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::MfaTotpDeviceSummary>'
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


    # Lists the policies in the specified compartment (either the tenancy or another of your compartments).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # To determine which policies apply to a particular group or compartment, you must view the individual
    # statements inside all your policies. There isn't a way to automatically obtain that information via the API.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Policy Policy}>
    def list_policies(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_policies." if compartment_id.nil?

      path = '/policies/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Policy>'
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


    # Lists the region subscriptions for the specified tenancy.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::RegionSubscription RegionSubscription}>
    def list_region_subscriptions(tenancy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_region_subscriptions.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling list_region_subscriptions." if tenancy_id.nil?
      raise "Parameter value for 'tenancy_id' must not be blank" if OCI::Internal::Util.blank_string?(tenancy_id)

      path = '/tenancies/{tenancyId}/regionSubscriptions'.sub('{tenancyId}', tenancy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_region_subscriptions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::RegionSubscription>'
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


    # Lists all the regions offered by Oracle Cloud Infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Region Region}>
    def list_regions(opts = {})
      logger.debug 'Calling operation IdentityClient#list_regions.' if logger


      path = '/regions'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_regions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Region>'
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


    # Lists the SMTP credentials for the specified user. The returned object contains the credential's OCID,
    # the SMTP user name but not the SMTP password. The SMTP password is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::SmtpCredentialSummary SmtpCredentialSummary}>
    def list_smtp_credentials(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_smtp_credentials.' if logger

      raise "Missing the required parameter 'user_id' when calling list_smtp_credentials." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/smtpCredentials/'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_smtp_credentials') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::SmtpCredentialSummary>'
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


    # **Deprecated. Use {#list_auth_tokens list_auth_tokens} instead.**
    #
    # Lists the Swift passwords for the specified user. The returned object contains the password's OCID, but not
    # the password itself. The actual password is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::SwiftPassword SwiftPassword}>
    def list_swift_passwords(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_swift_passwords.' if logger

      raise "Missing the required parameter 'user_id' when calling list_swift_passwords." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/swiftPasswords/'.sub('{userId}', user_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_swift_passwords') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::SwiftPassword>'
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


    # Lists the tag defaults for tag definitions in the specified compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :id A filter to only return resources that match the specified OCID exactly.
    #
    # @option opts [String] :compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @option opts [String] :tag_definition_id The OCID of the tag definition.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagDefaultSummary TagDefaultSummary}>
    def list_tag_defaults(opts = {})
      logger.debug 'Calling operation IdentityClient#list_tag_defaults.' if logger


      if opts[:lifecycle_state] && !OCI::Identity::Models::TagDefaultSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::TagDefaultSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/tagDefaults'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:tagDefinitionId] = opts[:tag_definition_id] if opts[:tag_definition_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tag_defaults') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagDefaultSummary>'
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


    # Lists the tag namespaces in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [BOOLEAN] :include_subcompartments An optional boolean parameter indicating whether to retrieve all tag namespaces in subcompartments. If this
    #   parameter is not specified, only the tag namespaces defined in the specified compartment are retrieved.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagNamespaceSummary TagNamespaceSummary}>
    def list_tag_namespaces(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tag_namespaces.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_tag_namespaces." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::TagNamespace::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::TagNamespace::LIFECYCLE_STATE_ENUM.'
      end

      path = '/tagNamespaces'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:includeSubcompartments] = opts[:include_subcompartments] if !opts[:include_subcompartments].nil?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tag_namespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagNamespaceSummary>'
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


    # Lists the tag definitions in the specified tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagSummary TagSummary}>
    def list_tags(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tags.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling list_tags." if tag_namespace_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::Tag::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::Tag::LIFECYCLE_STATE_ENUM.'
      end
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/tags'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagSummary>'
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


    # Lists the `UserGroupMembership` objects in your tenancy. You must specify your tenancy's OCID
    # as the value for the compartment ID
    # (see [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five)).
    # You must also then filter the list in one of these ways:
    #
    # - You can limit the results to just the memberships for a given user by specifying a `userId`.
    # - Similarly, you can limit the results to just the memberships for a given group by specifying a `groupId`.
    # - You can set both the `userId` and `groupId` to determine if the specified user is in the specified group.
    # If the answer is no, the response is an empty list.
    # - Although`userId` and `groupId` are not indvidually required, you must set one of them.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :user_id The OCID of the user.
    # @option opts [String] :group_id The OCID of the group.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::UserGroupMembership UserGroupMembership}>
    def list_user_group_memberships(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_user_group_memberships.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_user_group_memberships." if compartment_id.nil?

      path = '/userGroupMemberships/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:userId] = opts[:user_id] if opts[:user_id]
      query_params[:groupId] = opts[:group_id] if opts[:group_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_user_group_memberships') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::UserGroupMembership>'
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


    # Lists the users in your tenancy. You must specify your tenancy's OCID as the value for the
    # compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :identity_provider_id The id of the identity provider.
    #
    # @option opts [String] :external_identifier The id of a user in the identity provider.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::User User}>
    def list_users(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_users.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_users." if compartment_id.nil?

      path = '/users/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:identityProviderId] = opts[:identity_provider_id] if opts[:identity_provider_id]
      query_params[:externalIdentifier] = opts[:external_identifier] if opts[:external_identifier]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::User>'
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


    # Lists the work requests in compartment.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :resource_identifier The identifier of the resource the work request affects.
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::WorkRequestSummary WorkRequestSummary}>
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:resourceIdentifier] = opts[:resource_identifier] if opts[:resource_identifier]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::WorkRequestSummary>'
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


    # Move the compartment tree to a different parent compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::MoveCompartmentDetails] move_compartment_details Request object for moving a compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def move_compartment(compartment_id, move_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#move_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling move_compartment." if compartment_id.nil?
      raise "Missing the required parameter 'move_compartment_details' when calling move_compartment." if move_compartment_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}/actions/moveCompartment'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = @api_client.object_to_http_body(move_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#move_compartment') do
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


    # Removes a user from a group by deleting the corresponding `UserGroupMembership`.
    # @param [String] user_group_membership_id The OCID of the userGroupMembership.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def remove_user_from_group(user_group_membership_id, opts = {})
      logger.debug 'Calling operation IdentityClient#remove_user_from_group.' if logger

      raise "Missing the required parameter 'user_group_membership_id' when calling remove_user_from_group." if user_group_membership_id.nil?
      raise "Parameter value for 'user_group_membership_id' must not be blank" if OCI::Internal::Util.blank_string?(user_group_membership_id)

      path = '/userGroupMemberships/{userGroupMembershipId}'.sub('{userGroupMembershipId}', user_group_membership_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#remove_user_from_group') do
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Resets the OAuth2 client credentials for the SCIM client associated with this identity provider.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::ScimClientCredentials ScimClientCredentials}
    def reset_idp_scim_client(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#reset_idp_scim_client.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling reset_idp_scim_client." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/actions/resetScimClient/'.sub('{identityProviderId}', identity_provider_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#reset_idp_scim_client') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::ScimClientCredentials'
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


    # Updates the specified auth token's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] auth_token_id The OCID of the auth token.
    # @param [OCI::Identity::Models::UpdateAuthTokenDetails] update_auth_token_details Request object for updating an auth token.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthToken AuthToken}
    def update_auth_token(user_id, auth_token_id, update_auth_token_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_auth_token.' if logger

      raise "Missing the required parameter 'user_id' when calling update_auth_token." if user_id.nil?
      raise "Missing the required parameter 'auth_token_id' when calling update_auth_token." if auth_token_id.nil?
      raise "Missing the required parameter 'update_auth_token_details' when calling update_auth_token." if update_auth_token_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'auth_token_id' must not be blank" if OCI::Internal::Util.blank_string?(auth_token_id)

      path = '/users/{userId}/authTokens/{authTokenId}'.sub('{userId}', user_id.to_s).sub('{authTokenId}', auth_token_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_auth_token_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_auth_token') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthToken'
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


    # Updates authentication policy for the specified tenancy
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::UpdateAuthenticationPolicyDetails] update_authentication_policy_details Request object for updating the authentication policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthenticationPolicy AuthenticationPolicy}
    def update_authentication_policy(compartment_id, update_authentication_policy_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_authentication_policy.' if logger

      raise "Missing the required parameter 'compartment_id' when calling update_authentication_policy." if compartment_id.nil?
      raise "Missing the required parameter 'update_authentication_policy_details' when calling update_authentication_policy." if update_authentication_policy_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/authenticationPolicies/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_authentication_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_authentication_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthenticationPolicy'
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


    # Updates the specified compartment's description or name. You can't update the root compartment.
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::UpdateCompartmentDetails] update_compartment_details Request object for updating a compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    def update_compartment(compartment_id, update_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling update_compartment." if compartment_id.nil?
      raise "Missing the required parameter 'update_compartment_details' when calling update_compartment." if update_compartment_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_compartment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
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


    # Updates the specified secret key's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] customer_secret_key_id The OCID of the secret key.
    # @param [OCI::Identity::Models::UpdateCustomerSecretKeyDetails] update_customer_secret_key_details Request object for updating a secret key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::CustomerSecretKeySummary CustomerSecretKeySummary}
    def update_customer_secret_key(user_id, customer_secret_key_id, update_customer_secret_key_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_customer_secret_key.' if logger

      raise "Missing the required parameter 'user_id' when calling update_customer_secret_key." if user_id.nil?
      raise "Missing the required parameter 'customer_secret_key_id' when calling update_customer_secret_key." if customer_secret_key_id.nil?
      raise "Missing the required parameter 'update_customer_secret_key_details' when calling update_customer_secret_key." if update_customer_secret_key_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'customer_secret_key_id' must not be blank" if OCI::Internal::Util.blank_string?(customer_secret_key_id)

      path = '/users/{userId}/customerSecretKeys/{customerSecretKeyId}'.sub('{userId}', user_id.to_s).sub('{customerSecretKeyId}', customer_secret_key_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_customer_secret_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_customer_secret_key') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::CustomerSecretKeySummary'
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


    # Updates the specified dynamic group.
    # @param [String] dynamic_group_id The OCID of the dynamic group.
    # @param [OCI::Identity::Models::UpdateDynamicGroupDetails] update_dynamic_group_details Request object for updating an dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DynamicGroup DynamicGroup}
    def update_dynamic_group(dynamic_group_id, update_dynamic_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_dynamic_group.' if logger

      raise "Missing the required parameter 'dynamic_group_id' when calling update_dynamic_group." if dynamic_group_id.nil?
      raise "Missing the required parameter 'update_dynamic_group_details' when calling update_dynamic_group." if update_dynamic_group_details.nil?
      raise "Parameter value for 'dynamic_group_id' must not be blank" if OCI::Internal::Util.blank_string?(dynamic_group_id)

      path = '/dynamicGroups/{dynamicGroupId}'.sub('{dynamicGroupId}', dynamic_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_dynamic_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_dynamic_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DynamicGroup'
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


    # Updates the specified group.
    # @param [String] group_id The OCID of the group.
    # @param [OCI::Identity::Models::UpdateGroupDetails] update_group_details Request object for updating a group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Group Group}
    def update_group(group_id, update_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_group.' if logger

      raise "Missing the required parameter 'group_id' when calling update_group." if group_id.nil?
      raise "Missing the required parameter 'update_group_details' when calling update_group." if update_group_details.nil?
      raise "Parameter value for 'group_id' must not be blank" if OCI::Internal::Util.blank_string?(group_id)

      path = '/groups/{groupId}'.sub('{groupId}', group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Group'
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


    # Updates the specified identity provider.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [OCI::Identity::Models::UpdateIdentityProviderDetails] update_identity_provider_details Request object for updating a identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdentityProvider IdentityProvider}
    def update_identity_provider(identity_provider_id, update_identity_provider_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_identity_provider.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling update_identity_provider." if identity_provider_id.nil?
      raise "Missing the required parameter 'update_identity_provider_details' when calling update_identity_provider." if update_identity_provider_details.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}'.sub('{identityProviderId}', identity_provider_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_identity_provider_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_identity_provider') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdentityProvider'
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


    # Updates the specified group mapping.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [String] mapping_id The OCID of the group mapping.
    # @param [OCI::Identity::Models::UpdateIdpGroupMappingDetails] update_idp_group_mapping_details Request object for updating an identity provider group mapping
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}
    def update_idp_group_mapping(identity_provider_id, mapping_id, update_idp_group_mapping_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_idp_group_mapping.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling update_idp_group_mapping." if identity_provider_id.nil?
      raise "Missing the required parameter 'mapping_id' when calling update_idp_group_mapping." if mapping_id.nil?
      raise "Missing the required parameter 'update_idp_group_mapping_details' when calling update_idp_group_mapping." if update_idp_group_mapping_details.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)
      raise "Parameter value for 'mapping_id' must not be blank" if OCI::Internal::Util.blank_string?(mapping_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/{mappingId}'.sub('{identityProviderId}', identity_provider_id.to_s).sub('{mappingId}', mapping_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_idp_group_mapping_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_idp_group_mapping') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdpGroupMapping'
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


    # Updates the specified policy. You can update the description or the policy statements themselves.
    #
    # Policy changes take effect typically within 10 seconds.
    #
    # @param [String] policy_id The OCID of the policy.
    # @param [OCI::Identity::Models::UpdatePolicyDetails] update_policy_details Request object for updating a policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Policy Policy}
    def update_policy(policy_id, update_policy_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling update_policy." if policy_id.nil?
      raise "Missing the required parameter 'update_policy_details' when calling update_policy." if update_policy_details.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/policies/{policyId}'.sub('{policyId}', policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Policy'
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


    # Updates the specified SMTP credential's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] smtp_credential_id The OCID of the SMTP credential.
    # @param [OCI::Identity::Models::UpdateSmtpCredentialDetails] update_smtp_credential_details Request object for updating a SMTP credential.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SmtpCredentialSummary SmtpCredentialSummary}
    def update_smtp_credential(user_id, smtp_credential_id, update_smtp_credential_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_smtp_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling update_smtp_credential." if user_id.nil?
      raise "Missing the required parameter 'smtp_credential_id' when calling update_smtp_credential." if smtp_credential_id.nil?
      raise "Missing the required parameter 'update_smtp_credential_details' when calling update_smtp_credential." if update_smtp_credential_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'smtp_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(smtp_credential_id)

      path = '/users/{userId}/smtpCredentials/{smtpCredentialId}'.sub('{userId}', user_id.to_s).sub('{smtpCredentialId}', smtp_credential_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_smtp_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_smtp_credential') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SmtpCredentialSummary'
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


    # **Deprecated. Use {#update_auth_token update_auth_token} instead.**
    #
    # Updates the specified Swift password's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] swift_password_id The OCID of the Swift password.
    # @param [OCI::Identity::Models::UpdateSwiftPasswordDetails] update_swift_password_details Request object for updating a Swift password.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SwiftPassword SwiftPassword}
    def update_swift_password(user_id, swift_password_id, update_swift_password_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_swift_password.' if logger

      raise "Missing the required parameter 'user_id' when calling update_swift_password." if user_id.nil?
      raise "Missing the required parameter 'swift_password_id' when calling update_swift_password." if swift_password_id.nil?
      raise "Missing the required parameter 'update_swift_password_details' when calling update_swift_password." if update_swift_password_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'swift_password_id' must not be blank" if OCI::Internal::Util.blank_string?(swift_password_id)

      path = '/users/{userId}/swiftPasswords/{swiftPasswordId}'.sub('{userId}', user_id.to_s).sub('{swiftPasswordId}', swift_password_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_swift_password_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_swift_password') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SwiftPassword'
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


    # Updates the the specified tag definition. You can update `description`, and `isRetired`.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [String] tag_name The name of the tag.
    #
    # @param [OCI::Identity::Models::UpdateTagDetails] update_tag_details Request object for updating a tag.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tag Tag}
    def update_tag(tag_namespace_id, tag_name, update_tag_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling update_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'tag_name' when calling update_tag." if tag_name.nil?
      raise "Missing the required parameter 'update_tag_details' when calling update_tag." if update_tag_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)
      raise "Parameter value for 'tag_name' must not be blank" if OCI::Internal::Util.blank_string?(tag_name)

      path = '/tagNamespaces/{tagNamespaceId}/tags/{tagName}'.sub('{tagNamespaceId}', tag_namespace_id.to_s).sub('{tagName}', tag_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_tag') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tag'
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


    # Updates the specified tag default. You can update the following field: `value`.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [OCI::Identity::Models::UpdateTagDefaultDetails] update_tag_default_details Request object for updating a tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    def update_tag_default(tag_default_id, update_tag_default_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_tag_default.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling update_tag_default." if tag_default_id.nil?
      raise "Missing the required parameter 'update_tag_default_details' when calling update_tag_default." if update_tag_default_details.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}'.sub('{tagDefaultId}', tag_default_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_tag_default_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_tag_default') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
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


    # Updates the the specified tag namespace. You can't update the namespace name.
    #
    # Updating `isRetired` to 'true' retires the namespace and all the tag definitions in the namespace. Reactivating a
    # namespace (changing `isRetired` from 'true' to 'false') does not reactivate tag definitions.
    # To reactivate the tag definitions, you must reactivate each one indvidually *after* you reactivate the namespace,
    # using {#update_tag update_tag}. For more information about retiring tag namespaces, see
    # [Retiring Key Definitions and Namespace Definitions](https://docs.cloud.oracle.com/Content/Identity/Concepts/taggingoverview.htm#Retiring).
    #
    # You can't add a namespace with the same name as a retired namespace in the same tenancy.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::UpdateTagNamespaceDetails] update_tag_namespace_details Request object for updating a namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    def update_tag_namespace(tag_namespace_id, update_tag_namespace_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling update_tag_namespace." if tag_namespace_id.nil?
      raise "Missing the required parameter 'update_tag_namespace_details' when calling update_tag_namespace." if update_tag_namespace_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_tag_namespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_tag_namespace') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
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


    # Updates the description of the specified user.
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::UpdateUserDetails] update_user_details Request object for updating a user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    def update_user(user_id, update_user_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_user.' if logger

      raise "Missing the required parameter 'user_id' when calling update_user." if user_id.nil?
      raise "Missing the required parameter 'update_user_details' when calling update_user." if update_user_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_user_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_user') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
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


    # Updates the capabilities of the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::UpdateUserCapabilitiesDetails] update_user_capabilities_details Request object for updating user capabilities.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    def update_user_capabilities(user_id, update_user_capabilities_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_user_capabilities.' if logger

      raise "Missing the required parameter 'user_id' when calling update_user_capabilities." if user_id.nil?
      raise "Missing the required parameter 'update_user_capabilities_details' when calling update_user_capabilities." if update_user_capabilities_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/capabilities/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_user_capabilities_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_user_capabilities') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
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


    # Updates the state of the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::UpdateStateDetails] update_state_details Request object for updating a user state.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    def update_user_state(user_id, update_state_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_user_state.' if logger

      raise "Missing the required parameter 'user_id' when calling update_user_state." if user_id.nil?
      raise "Missing the required parameter 'update_state_details' when calling update_user_state." if update_state_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/state/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_state_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_user_state') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
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


    # Uploads an API signing key for the specified user.
    #
    # Every user has permission to use this operation to upload a key for *their own user ID*. An
    # administrator in your organization does not need to write a policy to give users this ability.
    # To compare, administrators who have permission to the tenancy can use this operation to upload a
    # key for any user, including themselves.
    #
    # **Important:** Even though you have permission to upload an API key, you might not yet
    # have permission to do much else. If you try calling an operation unrelated to your own credential
    # management (e.g., `ListUsers`, `LaunchInstance`) and receive an \"unauthorized\" error,
    # check with an administrator to confirm which IAM Service group(s) you're in and what access
    # you have. Also confirm you're working in the correct compartment.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using
    # the object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::CreateApiKeyDetails] create_api_key_details Request object for uploading an API key for a user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::ApiKey ApiKey}
    def upload_api_key(user_id, create_api_key_details, opts = {})
      logger.debug 'Calling operation IdentityClient#upload_api_key.' if logger

      raise "Missing the required parameter 'user_id' when calling upload_api_key." if user_id.nil?
      raise "Missing the required parameter 'create_api_key_details' when calling upload_api_key." if create_api_key_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/apiKeys/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_api_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#upload_api_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::ApiKey'
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
