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
      # InstancePrincipalsDelegationTokenSigner extends the functionality of InstancePrincipalsSecurityTokenSigner.
      # A delegation token allows the instance to assume the privileges of the user for which the token
      # was created.
      class InstancePrincipalsDelegationTokenSigner < OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner
        HEADERS_TO_SIGN = %i[date (request-target) host opc-obo-token].freeze
        # Creates a new InstancePrincipalsDelegationTokenSigner
        #
        # @param [String] delegation_token This token allows an instance to assume the privileges of a specific user
        #   and act on-behalf-of that user.
        # @param [String] federation_client_cert_bundle The full file path to a custom certificate bundle which can be
        #   used for SSL verification against the federation_endpoint. If not provided (e.g. because a custom bundle is
        #   not needed), defaults to nil
        # @param [String] signing_strategy Whether this signer is used for Object Storage requests or not. Acceptable
        #   values are {OCI::BaseSigner::STANDARD} and {OCI::BaseSigner::OBJECT_STORAGE}. If not provided, defaults to
        #   {OCI::BaseSigner::STANDARD}
        # @param [Array<String>] body_headers_to_sign An array of headers which should be signed on requests with
        #   bodies. If not provided, defaults to {OCI::BaseSigner::BODY_HEADERS}
        # @param [Hash<String>] additional_auth_params Additional parameters for the federation client to pass as part
        #   of the Auth Service request. If not provided, defaults to an empty hash
        def initialize(delegation_token,
                       federation_endpoint: nil,
                       federation_client_cert_bundle: nil,
                       signing_strategy: OCI::BaseSigner::STANDARD,
                       body_headers_to_sign: OCI::BaseSigner::BODY_HEADERS,
                       additional_auth_params: {})
          raise 'Delegation Token not exist' if delegation_token.nil?

          @delegation_token = delegation_token
          super(federation_endpoint: federation_endpoint,
                federation_client_cert_bundle: federation_client_cert_bundle,
                signing_strategy: signing_strategy,
                headers_to_sign_in_all_requests: HEADERS_TO_SIGN,
                body_headers_to_sign: body_headers_to_sign,
                additional_auth_params: additional_auth_params)
        end

        # Add opc-obo-token to request header
        def sign(method, uri, headers, body, operation_signing_strategy = :standard)
          headers[:'opc-obo-token'] = @delegation_token
          super(method, uri, headers, body, operation_signing_strategy)
        end
      end
    end
  end
end
