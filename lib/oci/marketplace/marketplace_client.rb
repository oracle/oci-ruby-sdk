# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Manage applications in Oracle Cloud Infrastructure Marketplace.
  class Marketplace::MarketplaceClient
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


    # Creates a new MarketplaceClient.
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
        @endpoint = endpoint + '/20181001'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "MarketplaceClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://marketplace.{region}.oci.{secondLevelDomain}') + '/20181001'
      logger.info "MarketplaceClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Changes the compartment of the Publication
    # @param [String] publication_id The unique identifier for the listing.
    # @param [OCI::Marketplace::Models::ChangePublicationCompartmentDetails] change_publication_compartment_details Request to change the compartment of a given Publication.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without
    #   risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been deleted and purged from the system,
    #   then a retry of the original creation request might be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to
    #   the value of the etag from a previous GET or POST response for that resource.  The resource will be updated or
    #   deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/change_publication_compartment.rb.html) to see an example of how to use change_publication_compartment API.
    def change_publication_compartment(publication_id, change_publication_compartment_details, opts = {})
      logger.debug 'Calling operation MarketplaceClient#change_publication_compartment.' if logger

      raise "Missing the required parameter 'publication_id' when calling change_publication_compartment." if publication_id.nil?
      raise "Missing the required parameter 'change_publication_compartment_details' when calling change_publication_compartment." if change_publication_compartment_details.nil?
      raise "Parameter value for 'publication_id' must not be blank" if OCI::Internal::Util.blank_string?(publication_id)

      path = '/publications/{publicationId}/actions/changeCompartment'.sub('{publicationId}', publication_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_publication_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#change_publication_compartment') do
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


    # Accepts a terms of use agreement for a specific package version of a listing. You must accept all
    # terms of use for a package before you can deploy the package.
    #
    # @param [OCI::Marketplace::Models::CreateAcceptedAgreementDetails] create_accepted_agreement_details Details necessary to accept an agreement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without
    #   risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been deleted and purged from the system,
    #   then a retry of the original creation request might be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::AcceptedAgreement AcceptedAgreement}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/create_accepted_agreement.rb.html) to see an example of how to use create_accepted_agreement API.
    def create_accepted_agreement(create_accepted_agreement_details, opts = {})
      logger.debug 'Calling operation MarketplaceClient#create_accepted_agreement.' if logger

      raise "Missing the required parameter 'create_accepted_agreement_details' when calling create_accepted_agreement." if create_accepted_agreement_details.nil?

      path = '/acceptedAgreements'
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

      post_body = @api_client.object_to_http_body(create_accepted_agreement_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#create_accepted_agreement') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::AcceptedAgreement'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a publication of the given type with an optional default package
    # @param [OCI::Marketplace::Models::CreatePublicationDetails] create_publication_details Details of Publication to be created including optional default package.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without
    #   risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been deleted and purged from the system,
    #   then a retry of the original creation request might be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::Publication Publication}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/create_publication.rb.html) to see an example of how to use create_publication API.
    def create_publication(create_publication_details, opts = {})
      logger.debug 'Calling operation MarketplaceClient#create_publication.' if logger

      raise "Missing the required parameter 'create_publication_details' when calling create_publication." if create_publication_details.nil?

      path = '/publications'
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

      post_body = @api_client.object_to_http_body(create_publication_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#create_publication') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::Publication'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Removes a previously accepted terms of use agreement from the list of agreements that Marketplace checks
    # before initiating a deployment. Listings in the Marketplace that require acceptance of the specified terms
    # of use can no longer be deployed, but existing deployments aren't affected.
    #
    # @param [String] accepted_agreement_id The unique identifier for the accepted terms of use agreement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :signature Previously, the signature generated for the listing package terms of use agreement, but now deprecated and ignored.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to
    #   the value of the etag from a previous GET or POST response for that resource.  The resource will be updated or
    #   deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/delete_accepted_agreement.rb.html) to see an example of how to use delete_accepted_agreement API.
    def delete_accepted_agreement(accepted_agreement_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#delete_accepted_agreement.' if logger

      raise "Missing the required parameter 'accepted_agreement_id' when calling delete_accepted_agreement." if accepted_agreement_id.nil?
      raise "Parameter value for 'accepted_agreement_id' must not be blank" if OCI::Internal::Util.blank_string?(accepted_agreement_id)

      path = '/acceptedAgreements/{acceptedAgreementId}'.sub('{acceptedAgreementId}', accepted_agreement_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:signature] = opts[:signature] if opts[:signature]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#delete_accepted_agreement') do
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


    # Deletes a Publication. This will also remove the associated Listing from Marketplace.
    # @param [String] publication_id The unique identifier for the listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to
    #   the value of the etag from a previous GET or POST response for that resource.  The resource will be updated or
    #   deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/delete_publication.rb.html) to see an example of how to use delete_publication API.
    def delete_publication(publication_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#delete_publication.' if logger

      raise "Missing the required parameter 'publication_id' when calling delete_publication." if publication_id.nil?
      raise "Parameter value for 'publication_id' must not be blank" if OCI::Internal::Util.blank_string?(publication_id)

      path = '/publications/{publicationId}'.sub('{publicationId}', publication_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#delete_publication') do
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


    # Gets the details of a specific, previously accepted terms of use agreement.
    #
    # @param [String] accepted_agreement_id The unique identifier for the accepted terms of use agreement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::AcceptedAgreement AcceptedAgreement}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/get_accepted_agreement.rb.html) to see an example of how to use get_accepted_agreement API.
    def get_accepted_agreement(accepted_agreement_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#get_accepted_agreement.' if logger

      raise "Missing the required parameter 'accepted_agreement_id' when calling get_accepted_agreement." if accepted_agreement_id.nil?
      raise "Parameter value for 'accepted_agreement_id' must not be blank" if OCI::Internal::Util.blank_string?(accepted_agreement_id)

      path = '/acceptedAgreements/{acceptedAgreementId}'.sub('{acceptedAgreementId}', accepted_agreement_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#get_accepted_agreement') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::AcceptedAgreement'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a terms of use agreement for a package with a time-based signature that can be used to
    # accept the agreement.
    #
    # @param [String] listing_id The unique identifier for the listing.
    # @param [String] package_version The version of the package. Package versions are unique within a listing.
    # @param [String] agreement_id The unique identifier for the agreement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::Agreement Agreement}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/get_agreement.rb.html) to see an example of how to use get_agreement API.
    def get_agreement(listing_id, package_version, agreement_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#get_agreement.' if logger

      raise "Missing the required parameter 'listing_id' when calling get_agreement." if listing_id.nil?
      raise "Missing the required parameter 'package_version' when calling get_agreement." if package_version.nil?
      raise "Missing the required parameter 'agreement_id' when calling get_agreement." if agreement_id.nil?
      raise "Parameter value for 'listing_id' must not be blank" if OCI::Internal::Util.blank_string?(listing_id)
      raise "Parameter value for 'package_version' must not be blank" if OCI::Internal::Util.blank_string?(package_version)
      raise "Parameter value for 'agreement_id' must not be blank" if OCI::Internal::Util.blank_string?(agreement_id)

      path = '/listings/{listingId}/packages/{packageVersion}/agreements/{agreementId}'.sub('{listingId}', listing_id.to_s).sub('{packageVersion}', package_version.to_s).sub('{agreementId}', agreement_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#get_agreement') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::Agreement'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets detailed information about a listing, including the listing's name, version, description, and
    # resources.
    #
    # If you plan to launch an instance from an image listing, you must first subscribe to the listing. When
    # you launch the instance, you also need to provide the image ID of the listing resource version that you want.
    #
    # Subscribing to the listing requires you to first get a signature from the terms of use agreement for the
    # listing resource version. To get the signature, issue a [GetAppCatalogListingAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements/GetAppCatalogListingAgreements) API call.
    # The [AppCatalogListingResourceVersionAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements) object, including
    # its signature, is returned in the response. With the signature for the terms of use agreement for the desired
    # listing resource version, create a subscription by issuing a
    # [CreateAppCatalogSubscription](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogSubscription/CreateAppCatalogSubscription) API call.
    #
    # To get the image ID to launch an instance, issue a [GetAppCatalogListingResourceVersion](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersion/GetAppCatalogListingResourceVersion) API call.
    # Lastly, to launch the instance, use the image ID of the listing resource version to issue a [LaunchInstance](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/Instance/LaunchInstance) API call.
    #
    # @param [String] listing_id The unique identifier for the listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::Listing Listing}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/get_listing.rb.html) to see an example of how to use get_listing API.
    def get_listing(listing_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#get_listing.' if logger

      raise "Missing the required parameter 'listing_id' when calling get_listing." if listing_id.nil?
      raise "Parameter value for 'listing_id' must not be blank" if OCI::Internal::Util.blank_string?(listing_id)

      path = '/listings/{listingId}'.sub('{listingId}', listing_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#get_listing') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::Listing'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the details of the specified version of a package, including information needed to launch the package.
    #
    # If you plan to launch an instance from an image listing, you must first subscribe to the listing. When
    # you launch the instance, you also need to provide the image ID of the listing resource version that you want.
    #
    # Subscribing to the listing requires you to first get a signature from the terms of use agreement for the
    # listing resource version. To get the signature, issue a [GetAppCatalogListingAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements/GetAppCatalogListingAgreements) API call.
    # The [AppCatalogListingResourceVersionAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements) object, including
    # its signature, is returned in the response. With the signature for the terms of use agreement for the desired
    # listing resource version, create a subscription by issuing a
    # [CreateAppCatalogSubscription](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogSubscription/CreateAppCatalogSubscription) API call.
    #
    # To get the image ID to launch an instance, issue a [GetAppCatalogListingResourceVersion](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersion/GetAppCatalogListingResourceVersion) API call.
    # Lastly, to launch the instance, use the image ID of the listing resource version to issue a [LaunchInstance](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/Instance/LaunchInstance) API call.
    #
    # @param [String] listing_id The unique identifier for the listing.
    # @param [String] package_version The version of the package. Package versions are unique within a listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::ListingPackage ListingPackage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/get_package.rb.html) to see an example of how to use get_package API.
    def get_package(listing_id, package_version, opts = {})
      logger.debug 'Calling operation MarketplaceClient#get_package.' if logger

      raise "Missing the required parameter 'listing_id' when calling get_package." if listing_id.nil?
      raise "Missing the required parameter 'package_version' when calling get_package." if package_version.nil?
      raise "Parameter value for 'listing_id' must not be blank" if OCI::Internal::Util.blank_string?(listing_id)
      raise "Parameter value for 'package_version' must not be blank" if OCI::Internal::Util.blank_string?(package_version)

      path = '/listings/{listingId}/packages/{packageVersion}'.sub('{listingId}', listing_id.to_s).sub('{packageVersion}', package_version.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#get_package') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::ListingPackage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get details of a publication
    # @param [String] publication_id The unique identifier for the listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::Publication Publication}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/get_publication.rb.html) to see an example of how to use get_publication API.
    def get_publication(publication_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#get_publication.' if logger

      raise "Missing the required parameter 'publication_id' when calling get_publication." if publication_id.nil?
      raise "Parameter value for 'publication_id' must not be blank" if OCI::Internal::Util.blank_string?(publication_id)

      path = '/publications/{publicationId}'.sub('{publicationId}', publication_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#get_publication') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::Publication'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a specific package within a given Publication
    # @param [String] publication_id The unique identifier for the listing.
    # @param [String] package_version The version of the package. Package versions are unique within a listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::PublicationPackage PublicationPackage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/get_publication_package.rb.html) to see an example of how to use get_publication_package API.
    def get_publication_package(publication_id, package_version, opts = {})
      logger.debug 'Calling operation MarketplaceClient#get_publication_package.' if logger

      raise "Missing the required parameter 'publication_id' when calling get_publication_package." if publication_id.nil?
      raise "Missing the required parameter 'package_version' when calling get_publication_package." if package_version.nil?
      raise "Parameter value for 'publication_id' must not be blank" if OCI::Internal::Util.blank_string?(publication_id)
      raise "Parameter value for 'package_version' must not be blank" if OCI::Internal::Util.blank_string?(package_version)

      path = '/publications/{publicationId}/packages/{packageVersion}'.sub('{publicationId}', publication_id.to_s).sub('{packageVersion}', package_version.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#get_publication_package') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::PublicationPackage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the terms of use agreements that have been accepted in the specified compartment.
    # You can filter results by specifying query parameters.
    #
    # @param [String] compartment_id The unique identifier for the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name The display name of the resource.
    # @option opts [String] :listing_id The unique identifier for the listing.
    # @option opts [String] :package_version The version of the package. Package versions are unique within a listing.
    # @option opts [String] :accepted_agreement_id The unique identifier for the accepted terms of use agreement.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :sort_by The field to use to sort listed results. You can only specify one field to sort by.
    #   `TIMEACCEPTED` displays results in descending order by default. You can change your
    #   preference by specifying a different sort order.
    #    (default to TIMEACCEPTED)
    #   Allowed values are: TIMEACCEPTED
    # @option opts [String] :sort_order The sort order to use, either `ASC` or `DESC`. (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::AcceptedAgreementSummary AcceptedAgreementSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_accepted_agreements.rb.html) to see an example of how to use list_accepted_agreements API.
    def list_accepted_agreements(compartment_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_accepted_agreements.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_accepted_agreements." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMEACCEPTED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMEACCEPTED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/acceptedAgreements'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:listingId] = opts[:listing_id] if opts[:listing_id]
      query_params[:packageVersion] = opts[:package_version] if opts[:package_version]
      query_params[:acceptedAgreementId] = opts[:accepted_agreement_id] if opts[:accepted_agreement_id]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_accepted_agreements') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::AcceptedAgreementSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the terms of use agreements that must be accepted before you can deploy the specified version of a package.
    #
    # @param [String] listing_id The unique identifier for the listing.
    # @param [String] package_version The version of the package. Package versions are unique within a listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::AgreementSummary AgreementSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_agreements.rb.html) to see an example of how to use list_agreements API.
    def list_agreements(listing_id, package_version, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_agreements.' if logger

      raise "Missing the required parameter 'listing_id' when calling list_agreements." if listing_id.nil?
      raise "Missing the required parameter 'package_version' when calling list_agreements." if package_version.nil?
      raise "Parameter value for 'listing_id' must not be blank" if OCI::Internal::Util.blank_string?(listing_id)
      raise "Parameter value for 'package_version' must not be blank" if OCI::Internal::Util.blank_string?(package_version)

      path = '/listings/{listingId}/packages/{packageVersion}/agreements'.sub('{listingId}', listing_id.to_s).sub('{packageVersion}', package_version.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_agreements') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::AgreementSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of all the categories for listings published to Oracle Cloud Infrastructure Marketplace. Categories apply
    # to the software product provided by the listing.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::CategorySummary CategorySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_categories.rb.html) to see an example of how to use list_categories API.
    def list_categories(opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_categories.' if logger


      path = '/categories'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_categories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::CategorySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of listings from Oracle Cloud Infrastructure Marketplace by searching keywords and
    # filtering according to listing attributes.
    #
    # If you plan to launch an instance from an image listing, you must first subscribe to the listing. When
    # you launch the instance, you also need to provide the image ID of the listing resource version that you want.
    #
    # Subscribing to the listing requires you to first get a signature from the terms of use agreement for the
    # listing resource version. To get the signature, issue a [GetAppCatalogListingAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements/GetAppCatalogListingAgreements) API call.
    # The [AppCatalogListingResourceVersionAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements) object, including
    # its signature, is returned in the response. With the signature for the terms of use agreement for the desired
    # listing resource version, create a subscription by issuing a
    # [CreateAppCatalogSubscription](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogSubscription/CreateAppCatalogSubscription) API call.
    #
    # To get the image ID to launch an instance, issue a [GetAppCatalogListingResourceVersion](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersion/GetAppCatalogListingResourceVersion) API call.
    # Lastly, to launch the instance, use the image ID of the listing resource version to issue a [LaunchInstance](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/Instance/LaunchInstance) API call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :name The name of the listing.
    # @option opts [String] :listing_id The unique identifier for the listing.
    # @option opts [String] :publisher_id Limit results to just this publisher.
    # @option opts [String] :package_type A filter to return only packages that match the given package type exactly.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :sort_by The field to use to sort listed results. You can only specify one field to sort by.
    #   `TIMERELEASED` displays results in descending order by default.
    #   You can change your preference by specifying a different sort order.
    #    (default to TIMERELEASED)
    #   Allowed values are: TIMERELEASED
    # @option opts [String] :sort_order The sort order to use, either `ASC` or `DESC`. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :category Name of the product category or categories. If you specify multiple categories, then Marketplace returns any listing with
    #   one or more matching categories.
    #
    # @option opts [Array<String>] :pricing Name of the pricing type. If multiple pricing types are provided, then any listing with
    #   one or more matching pricing models will be returned.
    #
    #   Allowed values are: FREE, BYOL, PAYGO
    # @option opts [BOOLEAN] :is_featured Indicates whether to show only featured listings. If this is set to `false` or is omitted, then all listings will be returned.
    #    (default to false)
    # @option opts [Array<String>] :listing_types The type of the listing
    #   Allowed values are: COMMUNITY, PARTNER, PRIVATE
    # @option opts [Array<String>] :operating_systems OS of the listing.
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::ListingSummary ListingSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_listings.rb.html) to see an example of how to use list_listings API.
    def list_listings(opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_listings.' if logger


      if opts[:sort_by] && !%w[TIMERELEASED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMERELEASED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end


      pricing_allowable_values = %w[FREE BYOL PAYGO]
      if opts[:pricing] && !opts[:pricing].empty?
        opts[:pricing].each do |val_to_check|
          unless pricing_allowable_values.include?(val_to_check)
            raise 'Invalid value for "pricing", must be one of FREE, BYOL, PAYGO.'
          end
        end
      end


      listing_types_allowable_values = %w[COMMUNITY PARTNER PRIVATE]
      if opts[:listing_types] && !opts[:listing_types].empty?
        opts[:listing_types].each do |val_to_check|
          unless listing_types_allowable_values.include?(val_to_check)
            raise 'Invalid value for "listing_types", must be one of COMMUNITY, PARTNER, PRIVATE.'
          end
        end
      end

      path = '/listings'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = OCI::ApiClient.build_collection_params(opts[:name], :multi) if opts[:name] && !opts[:name].empty?
      query_params[:listingId] = opts[:listing_id] if opts[:listing_id]
      query_params[:publisherId] = opts[:publisher_id] if opts[:publisher_id]
      query_params[:packageType] = opts[:package_type] if opts[:package_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:category] = OCI::ApiClient.build_collection_params(opts[:category], :multi) if opts[:category] && !opts[:category].empty?
      query_params[:pricing] = OCI::ApiClient.build_collection_params(opts[:pricing], :multi) if opts[:pricing] && !opts[:pricing].empty?
      query_params[:isFeatured] = opts[:is_featured] if !opts[:is_featured].nil?
      query_params[:listingTypes] = OCI::ApiClient.build_collection_params(opts[:listing_types], :multi) if opts[:listing_types] && !opts[:listing_types].empty?
      query_params[:operatingSystems] = OCI::ApiClient.build_collection_params(opts[:operating_systems], :multi) if opts[:operating_systems] && !opts[:operating_systems].empty?
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_listings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::ListingSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of packages for a listing.
    #
    # If you plan to launch an instance from an image listing, you must first subscribe to the listing. When
    # you launch the instance, you also need to provide the image ID of the listing resource version that you want.
    #
    # Subscribing to the listing requires you to first get a signature from the terms of use agreement for the
    # listing resource version. To get the signature, issue a [GetAppCatalogListingAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements/GetAppCatalogListingAgreements) API call.
    # The [AppCatalogListingResourceVersionAgreements](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersionAgreements) object, including
    # its signature, is returned in the response. With the signature for the terms of use agreement for the desired
    # listing resource version, create a subscription by issuing a
    # [CreateAppCatalogSubscription](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogSubscription/CreateAppCatalogSubscription) API call.
    #
    # To get the image ID to launch an instance, issue a [GetAppCatalogListingResourceVersion](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListingResourceVersion/GetAppCatalogListingResourceVersion) API call.
    # Lastly, to launch the instance, use the image ID of the listing resource version to issue a [LaunchInstance](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/Instance/LaunchInstance) API call.
    #
    # @param [String] listing_id The unique identifier for the listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :package_version The version of the package. Package versions are unique within a listing.
    # @option opts [String] :package_type A filter to return only packages that match the given package type exactly.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :sort_by The field to use to sort listed results. You can only specify one field to sort by.
    #   `TIMERELEASED` displays results in descending order by default.
    #   You can change your preference by specifying a different sort order.
    #    (default to TIMERELEASED)
    #   Allowed values are: TIMERELEASED
    # @option opts [String] :sort_order The sort order to use, either `ASC` or `DESC`. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::ListingPackageSummary ListingPackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_packages.rb.html) to see an example of how to use list_packages API.
    def list_packages(listing_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_packages.' if logger

      raise "Missing the required parameter 'listing_id' when calling list_packages." if listing_id.nil?

      if opts[:sort_by] && !%w[TIMERELEASED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMERELEASED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'listing_id' must not be blank" if OCI::Internal::Util.blank_string?(listing_id)

      path = '/listings/{listingId}/packages'.sub('{listingId}', listing_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:packageVersion] = opts[:package_version] if opts[:package_version]
      query_params[:packageType] = opts[:package_type] if opts[:package_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::ListingPackageSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the packages in the given Publication
    # @param [String] publication_id The unique identifier for the listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :package_version The version of the package. Package versions are unique within a listing.
    # @option opts [String] :package_type A filter to return only packages that match the given package type exactly.
    #
    # @option opts [String] :sort_by The field to use to sort listed results. You can only specify one field to sort by.
    #   `TIMERELEASED` displays results in descending order by default.
    #   You can change your preference by specifying a different sort order.
    #    (default to TIMERELEASED)
    #   Allowed values are: TIMERELEASED
    # @option opts [String] :sort_order The sort order to use, either `ASC` or `DESC`. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::PublicationPackageSummary PublicationPackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_publication_packages.rb.html) to see an example of how to use list_publication_packages API.
    def list_publication_packages(publication_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_publication_packages.' if logger

      raise "Missing the required parameter 'publication_id' when calling list_publication_packages." if publication_id.nil?

      if opts[:sort_by] && !%w[TIMERELEASED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMERELEASED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'publication_id' must not be blank" if OCI::Internal::Util.blank_string?(publication_id)

      path = '/publications/{publicationId}/packages'.sub('{publicationId}', publication_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:packageVersion] = opts[:package_version] if opts[:package_version]
      query_params[:packageType] = opts[:package_type] if opts[:package_type]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_publication_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::PublicationPackageSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the publications in the given compartment
    # @param [String] compartment_id The unique identifier for the compartment.
    # @param [String] listing_type The type of the listing
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :name The name of the listing.
    # @option opts [String] :publication_id The unique identifier for the listing.
    # @option opts [Array<String>] :operating_systems OS of the listing.
    # @option opts [String] :sort_by The field to use to sort listed results. You can only specify one field to sort by.
    #   `TIMERELEASED` displays results in descending order by default.
    #   You can change your preference by specifying a different sort order.
    #    (default to TIMERELEASED)
    #   Allowed values are: TIMERELEASED
    # @option opts [String] :sort_order The sort order to use, either `ASC` or `DESC`. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::PublicationSummary PublicationSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_publications.rb.html) to see an example of how to use list_publications API.
    def list_publications(compartment_id, listing_type, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_publications.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_publications." if compartment_id.nil?
      raise "Missing the required parameter 'listing_type' when calling list_publications." if listing_type.nil?
      unless OCI::Marketplace::Models::LISTING_TYPE_ENUM.include?(listing_type)
        raise 'Invalid value for "listing_type", must be one of the values in OCI::Marketplace::Models::LISTING_TYPE_ENUM.'
      end


      if opts[:sort_by] && !%w[TIMERELEASED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMERELEASED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/publications'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:listingType] = listing_type
      query_params[:name] = OCI::ApiClient.build_collection_params(opts[:name], :multi) if opts[:name] && !opts[:name].empty?
      query_params[:publicationId] = opts[:publication_id] if opts[:publication_id]
      query_params[:operatingSystems] = OCI::ApiClient.build_collection_params(opts[:operating_systems], :multi) if opts[:operating_systems] && !opts[:operating_systems].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_publications') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::PublicationSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of all the publishers of listings available in Oracle Cloud Infrastructure Marketplace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :publisher_id Limit results to just this publisher.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :limit How many records to return. Specify a value greater than zero and less than or equal to 1000. The default is 30.
    #    (default to 30)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::PublisherSummary PublisherSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_publishers.rb.html) to see an example of how to use list_publishers API.
    def list_publishers(opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_publishers.' if logger


      path = '/publishers'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:publisherId] = opts[:publisher_id] if opts[:publisher_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_publishers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::PublisherSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists available types of reports for the compartment.
    # @param [String] compartment_id The unique identifier for the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::ReportTypeCollection ReportTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_report_types.rb.html) to see an example of how to use list_report_types API.
    def list_report_types(compartment_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_report_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_report_types." if compartment_id.nil?

      path = '/reportTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_report_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::ReportTypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists reports in the compartment that match the specified report type and date.
    # @param [String] report_type The type of the report.
    # @param [DateTime] date Date, expressed in `YYYYMMDD` format, where `Y` represents the year, `M` represents the month, and `D` represents the day.
    # @param [String] compartment_id The unique identifier for the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::ReportCollection ReportCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_reports.rb.html) to see an example of how to use list_reports API.
    def list_reports(report_type, date, compartment_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_reports.' if logger

      raise "Missing the required parameter 'report_type' when calling list_reports." if report_type.nil?
      raise "Missing the required parameter 'date' when calling list_reports." if date.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_reports." if compartment_id.nil?

      path = '/reports'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:reportType] = report_type
      query_params[:date] = date
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_reports') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::ReportCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns list of all tax implications that current tenant may be liable to once they launch the listing.
    # @param [String] listing_id The unique identifier for the listing.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :compartment_id The unique identifier for the compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Marketplace::Models::TaxSummary TaxSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/list_taxes.rb.html) to see an example of how to use list_taxes API.
    def list_taxes(listing_id, opts = {})
      logger.debug 'Calling operation MarketplaceClient#list_taxes.' if logger

      raise "Missing the required parameter 'listing_id' when calling list_taxes." if listing_id.nil?
      raise "Parameter value for 'listing_id' must not be blank" if OCI::Internal::Util.blank_string?(listing_id)

      path = '/listings/{listingId}/taxes'.sub('{listingId}', listing_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#list_taxes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Marketplace::Models::TaxSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the display name or tags associated with a listing's previously accepted terms of use agreement.
    #
    # @param [String] accepted_agreement_id The unique identifier for the accepted terms of use agreement.
    # @param [OCI::Marketplace::Models::UpdateAcceptedAgreementDetails] update_accepted_agreement_details Details to update for an accepted agreement.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without
    #   risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been deleted and purged from the system,
    #   then a retry of the original creation request might be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to
    #   the value of the etag from a previous GET or POST response for that resource.  The resource will be updated or
    #   deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::AcceptedAgreement AcceptedAgreement}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/update_accepted_agreement.rb.html) to see an example of how to use update_accepted_agreement API.
    def update_accepted_agreement(accepted_agreement_id, update_accepted_agreement_details, opts = {})
      logger.debug 'Calling operation MarketplaceClient#update_accepted_agreement.' if logger

      raise "Missing the required parameter 'accepted_agreement_id' when calling update_accepted_agreement." if accepted_agreement_id.nil?
      raise "Missing the required parameter 'update_accepted_agreement_details' when calling update_accepted_agreement." if update_accepted_agreement_details.nil?
      raise "Parameter value for 'accepted_agreement_id' must not be blank" if OCI::Internal::Util.blank_string?(accepted_agreement_id)

      path = '/acceptedAgreements/{acceptedAgreementId}'.sub('{acceptedAgreementId}', accepted_agreement_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_accepted_agreement_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#update_accepted_agreement') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::AcceptedAgreement'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates details of an existing Publication
    # @param [String] publication_id The unique identifier for the listing.
    # @param [OCI::Marketplace::Models::UpdatePublicationDetails] update_publication_details Details of the Publication which needs to be updated
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without
    #   risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been deleted and purged from the system,
    #   then a retry of the original creation request might be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to
    #   the value of the etag from a previous GET or POST response for that resource.  The resource will be updated or
    #   deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Marketplace::Models::Publication Publication}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/marketplace/update_publication.rb.html) to see an example of how to use update_publication API.
    def update_publication(publication_id, update_publication_details, opts = {})
      logger.debug 'Calling operation MarketplaceClient#update_publication.' if logger

      raise "Missing the required parameter 'publication_id' when calling update_publication." if publication_id.nil?
      raise "Missing the required parameter 'update_publication_details' when calling update_publication." if update_publication_details.nil?
      raise "Parameter value for 'publication_id' must not be blank" if OCI::Internal::Util.blank_string?(publication_id)

      path = '/publications/{publicationId}'.sub('{publicationId}', publication_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_publication_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MarketplaceClient#update_publication') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Marketplace::Models::Publication'
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
