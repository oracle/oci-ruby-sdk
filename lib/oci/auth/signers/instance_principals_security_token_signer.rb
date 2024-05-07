# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'net/http'
require 'uri'

require 'oci/auth/session_key_supplier'
require 'oci/auth/url_based_certificate_retriever'
require 'oci/auth/util'
require 'oci/base_signer'
require 'oci/regions'

require_relative 'x509_federation_client_based_security_token_signer'

module OCI
  module Auth
    module Signers
      # A SecurityTokenSigner which uses a security token for an instance principal.  This signer can also
      # refresh its token as needed.
      #
      # This signer is self-sufficient in that its internals know how to source the required information to request and
      #   use the token:
      #
      #   * Using the metadata endpoint for the instance (http://169.254.169.254/opc/v1) we can discover the region the
      #     instance is in, its leaf certificate and any intermediate certificates (for requesting the token) and the
      #     tenancy (as) that is in the leaf certificate.
      #   * The signer leverages {OCI::Auth::FederationClient} so it can refresh the security token and also get the
      #     private key needed to sign requests (via the client's session_key_supplier)
      class InstancePrincipalsSecurityTokenSigner < OCI::Auth::Signers::X509FederationClientBasedSecurityTokenSigner
        # The region the instance is in, as returned from the metadata endpoint for the instance
        #   (http://169.254.169.254/opc/v1/instance/region)
        # @return [String] The region for the instance
        attr_reader :region

        METADATA_URL_BASE = 'http://169.254.169.254/opc/v2'.freeze
        GET_REGION_URL = "#{METADATA_URL_BASE}/instance/region".freeze
        GET_REGION_INFO_URL = "#{METADATA_URL_BASE}/instance/regionInfo/".freeze
        LEAF_CERTIFICATE_URL = "#{METADATA_URL_BASE}/identity/cert.pem".freeze
        LEAF_CERTIFICATE_PRIVATE_KEY_URL = "#{METADATA_URL_BASE}/identity/key.pem".freeze
        INTERMEDIATE_CERTIFICATE_URL = "#{METADATA_URL_BASE}/identity/intermediate.pem".freeze

        # Creates a new InstancePrincipalsSecurityTokenSigner
        #
        # @param [String] federation_endpoint The endpoint where we will retrieve the instance principals auth token
        #   from. If not provided, this will default to the endpoint which the instance is in
        # @param [String] federation_client_cert_bundle The full file path to a custom certificate bundle which can be
        #   used for SSL verification against the federation_endpoint. If not provided (e.g. because a custom bundle is
        #   not needed), defaults to nil
        # @param [String] signing_strategy Whether this signer is used for Object Storage requests or not. Acceptable
        #   values are {OCI::BaseSigner::STANDARD} and {OCI::BaseSigner::OBJECT_STORAGE}. If not provided, defaults to
        #   {OCI::BaseSigner::STANDARD}
        # @param [Array<String>] headers_to_sign_in_all_requests An array of headers which will be signed in each
        #   request. If not provided, defaults to {OCI::BaseSigner::GENERIC_HEADERS}
        # @param [Array<String>] body_headers_to_sign An array of headers which should be signed on requests with
        #   bodies. If not provided, defaults to {OCI::BaseSigner::BODY_HEADERS}
        # @param [Hash<String>] additional_auth_params Additional parameters for the federation client to pass as part
        #   of the Auth Service request. If not provided, defaults to an empty hash
        def initialize(
          federation_endpoint: nil,
          federation_client_cert_bundle: nil,
          signing_strategy: OCI::BaseSigner::STANDARD,
          headers_to_sign_in_all_requests: OCI::BaseSigner::GENERIC_HEADERS,
          body_headers_to_sign: OCI::BaseSigner::BODY_HEADERS,
          additional_auth_params: {}
        )

          @leaf_certificate_retriever = OCI::Auth::UrlBasedCertificateRetriever.new(
            LEAF_CERTIFICATE_URL, private_key_url: LEAF_CERTIFICATE_PRIVATE_KEY_URL
          )
          @intermediate_certificate_retriever = OCI::Auth::UrlBasedCertificateRetriever.new(
            INTERMEDIATE_CERTIFICATE_URL
          )
          @session_key_supplier = OCI::Auth::SessionKeySupplier.new
          @tenancy_id = OCI::Auth::Util.get_tenancy_id_from_certificate(
            @leaf_certificate_retriever.certificate
          )

          uri = URI(GET_REGION_URL)
          raw_region_client = Net::HTTP.new(uri.hostname, uri.port)
          raw_region = nil
          raw_region_client.request(OCI::Auth::Util.get_metadata_request(GET_REGION_URL, 'get')) do |response|
            raw_region = response.body.strip.downcase
          end
          symbolised_raw_region = raw_region.to_sym
          @region = if OCI::Regions::REGION_SHORT_NAMES_TO_LONG_NAMES.key?(symbolised_raw_region)
                      OCI::Regions::REGION_SHORT_NAMES_TO_LONG_NAMES[symbolised_raw_region]
                    else
                      raw_region
                    end

          @federation_endpoint = federation_endpoint || "#{OCI::Regions.get_service_endpoint(@region, :Auth)}/v1/x509"

          @federation_client = OCI::Auth::FederationClient.new(
            @federation_endpoint,
            @tenancy_id,
            @session_key_supplier,
            @leaf_certificate_retriever,
            intermediate_certificate_suppliers: [@intermediate_certificate_retriever],
            cert_bundle_path: federation_client_cert_bundle,
            additional_auth_params: additional_auth_params
          )

          super(
            @federation_client,
            signing_strategy: signing_strategy,
            headers_to_sign_in_all_requests: headers_to_sign_in_all_requests,
            body_headers_to_sign: body_headers_to_sign
          )
        end
      end
    end
  end
end
