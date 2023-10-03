# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210224

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for retrieving certificates.
  class Certificates::CertificatesClient
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


    # Creates a new CertificatesClient.
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
        @endpoint = endpoint + '/20210224'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "CertificatesClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://certificates.{region}.oci.{secondLevelDomain}') + '/20210224'
      logger.info "CertificatesClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a ca-bundle bundle.
    #
    # @param [String] ca_bundle_id The OCID of the CA bundle.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Certificates::Models::CaBundle CaBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificates/get_ca_bundle.rb.html) to see an example of how to use get_ca_bundle API.
    def get_ca_bundle(ca_bundle_id, opts = {})
      logger.debug 'Calling operation CertificatesClient#get_ca_bundle.' if logger

      raise "Missing the required parameter 'ca_bundle_id' when calling get_ca_bundle." if ca_bundle_id.nil?
      raise "Parameter value for 'ca_bundle_id' must not be blank" if OCI::Internal::Util.blank_string?(ca_bundle_id)

      path = '/caBundles/{caBundleId}'.sub('{caBundleId}', ca_bundle_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesClient#get_ca_bundle') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Certificates::Models::CaBundle'
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


    # Gets a certificate authority bundle that matches either the specified `stage`, `name`, or `versionNumber` parameter.
    # If none of these parameters are provided, the bundle for the certificate authority version marked as `CURRENT` will be returned.
    #
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :version_number The version number of the certificate authority (CA). (default to 0)
    # @option opts [String] :certificate_authority_version_name The name of the certificate authority (CA). (This might be referred to as the name of the CA version, as every CA consists of at least one version.) Names are unique across versions of a given CA.
    #
    # @option opts [String] :stage The rotation state of the certificate version.
    #   Allowed values are: CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED
    # @return [Response] A Response object with data of type {OCI::Certificates::Models::CertificateAuthorityBundle CertificateAuthorityBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificates/get_certificate_authority_bundle.rb.html) to see an example of how to use get_certificate_authority_bundle API.
    def get_certificate_authority_bundle(certificate_authority_id, opts = {})
      logger.debug 'Calling operation CertificatesClient#get_certificate_authority_bundle.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling get_certificate_authority_bundle." if certificate_authority_id.nil?

      if opts[:stage] && !%w[CURRENT PENDING LATEST PREVIOUS DEPRECATED].include?(opts[:stage])
        raise 'Invalid value for "stage", must be one of CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED.'
      end
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorityBundles/{certificateAuthorityId}'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionNumber] = opts[:version_number] if opts[:version_number]
      query_params[:certificateAuthorityVersionName] = opts[:certificate_authority_version_name] if opts[:certificate_authority_version_name]
      query_params[:stage] = opts[:stage] if opts[:stage]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesClient#get_certificate_authority_bundle') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Certificates::Models::CertificateAuthorityBundle'
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


    # Gets a certificate bundle that matches either the specified `stage`, `versionName`, or `versionNumber` parameter.
    # If none of these parameters are provided, the bundle for the certificate version marked as `CURRENT` will be returned.
    #
    # By default, the private key is not included in the query result, and a CertificateBundlePublicOnly is returned.
    # If the private key is needed, use the CertificateBundleTypeQueryParam parameter to get a CertificateBundleWithPrivateKey response.
    #
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :version_number The version number of the certificate. The default value is 0, which means that this query parameter is ignored. (default to 0)
    # @option opts [String] :certificate_version_name The name of the certificate. (This might be referred to as the name of the certificate version, as every certificate consists of at least one version.) Names are unique across versions of a given certificate.
    #
    # @option opts [String] :stage The rotation state of the certificate version.
    #   Allowed values are: CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED
    # @option opts [String] :certificate_bundle_type The type of certificate bundle. By default, the private key fields are not returned. When querying for certificate bundles, to return results with certificate contents, the private key in PEM format, and the private key passphrase, specify the value of this parameter as `CERTIFICATE_CONTENT_WITH_PRIVATE_KEY`.
    #
    #   Allowed values are: CERTIFICATE_CONTENT_PUBLIC_ONLY, CERTIFICATE_CONTENT_WITH_PRIVATE_KEY
    # @return [Response] A Response object with data of type {OCI::Certificates::Models::CertificateBundle CertificateBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificates/get_certificate_bundle.rb.html) to see an example of how to use get_certificate_bundle API.
    def get_certificate_bundle(certificate_id, opts = {})
      logger.debug 'Calling operation CertificatesClient#get_certificate_bundle.' if logger

      raise "Missing the required parameter 'certificate_id' when calling get_certificate_bundle." if certificate_id.nil?

      if opts[:stage] && !%w[CURRENT PENDING LATEST PREVIOUS DEPRECATED].include?(opts[:stage])
        raise 'Invalid value for "stage", must be one of CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED.'
      end

      if opts[:certificate_bundle_type] && !%w[CERTIFICATE_CONTENT_PUBLIC_ONLY CERTIFICATE_CONTENT_WITH_PRIVATE_KEY].include?(opts[:certificate_bundle_type])
        raise 'Invalid value for "certificate_bundle_type", must be one of CERTIFICATE_CONTENT_PUBLIC_ONLY, CERTIFICATE_CONTENT_WITH_PRIVATE_KEY.'
      end
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificateBundles/{certificateId}'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionNumber] = opts[:version_number] if opts[:version_number]
      query_params[:certificateVersionName] = opts[:certificate_version_name] if opts[:certificate_version_name]
      query_params[:stage] = opts[:stage] if opts[:stage]
      query_params[:certificateBundleType] = opts[:certificate_bundle_type] if opts[:certificate_bundle_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesClient#get_certificate_bundle') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Certificates::Models::CertificateBundle'
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


    # Lists all certificate authority bundle versions for the specified certificate authority.
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default
    #   order for `VERSION_NUMBER` is ascending.
    #    (default to VERSION_NUMBER)
    #   Allowed values are: VERSION_NUMBER
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type {OCI::Certificates::Models::CertificateAuthorityBundleVersionCollection CertificateAuthorityBundleVersionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificates/list_certificate_authority_bundle_versions.rb.html) to see an example of how to use list_certificate_authority_bundle_versions API.
    def list_certificate_authority_bundle_versions(certificate_authority_id, opts = {})
      logger.debug 'Calling operation CertificatesClient#list_certificate_authority_bundle_versions.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling list_certificate_authority_bundle_versions." if certificate_authority_id.nil?

      if opts[:sort_by] && !%w[VERSION_NUMBER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of VERSION_NUMBER.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorityBundles/{certificateAuthorityId}/versions'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesClient#list_certificate_authority_bundle_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Certificates::Models::CertificateAuthorityBundleVersionCollection'
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


    # Lists all certificate bundle versions for the specified certificate.
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default
    #   order for `VERSION_NUMBER` is ascending.
    #    (default to VERSION_NUMBER)
    #   Allowed values are: VERSION_NUMBER
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type {OCI::Certificates::Models::CertificateBundleVersionCollection CertificateBundleVersionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificates/list_certificate_bundle_versions.rb.html) to see an example of how to use list_certificate_bundle_versions API.
    def list_certificate_bundle_versions(certificate_id, opts = {})
      logger.debug 'Calling operation CertificatesClient#list_certificate_bundle_versions.' if logger

      raise "Missing the required parameter 'certificate_id' when calling list_certificate_bundle_versions." if certificate_id.nil?

      if opts[:sort_by] && !%w[VERSION_NUMBER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of VERSION_NUMBER.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificateBundles/{certificateId}/versions'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesClient#list_certificate_bundle_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Certificates::Models::CertificateBundleVersionCollection'
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
