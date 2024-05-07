# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'oci/base_signer'
require 'openssl'
require 'securerandom'

require_relative 'security_token_signer'

module OCI
  module Auth
    module Signers
      # A SecurityTokenSigner where the token and private key are sourced from a provided federation_client. The token is retrieved via
      # the client's security_token method, and the private key is retrieved by reading it from the session_key_supplier in the client.
      class X509FederationClientBasedSecurityTokenSigner < OCI::Auth::Signers::SecurityTokenSigner
        # Creates a new X509FederationClientBasedSecurityTokenSigner
        #
        # @param [<OCI::Auth::FederationClient>] federation_client The federation client to use to request a security token
        # @param [String] signing_strategy Whether this signer is used for Object Storage requests or not. Acceptable values are {OCI::BaseSigner::STANDARD} and {OCI::BaseSigner::OBJECT_STORAGE}. If not provided, defaults to {OCI::BaseSigner::STANDARD}
        # @param [Array<String>] headers_to_sign_in_all_requests An array of headers which will be signed in each request. If not provided, defaults to {OCI::BaseSigner::GENERIC_HEADERS}
        # @param [Array<String>] body_headers_to_sign An array of headers which should be signed on requests with bodies. If not provided, defaults to {OCI::BaseSigner::BODY_HEADERS}
        def initialize(
          federation_client,
          signing_strategy: OCI::BaseSigner::STANDARD,
          headers_to_sign_in_all_requests: OCI::BaseSigner::GENERIC_HEADERS,
          body_headers_to_sign: OCI::BaseSigner::BODY_HEADERS
        )
          @federation_client = federation_client
          @refresh_lock = Mutex.new

          super(
            federation_client.security_token,
            federation_client.session_key_supplier.key_pair[:private_key],
            signing_strategy: signing_strategy,
            headers_to_sign_in_all_requests: headers_to_sign_in_all_requests,
            body_headers_to_sign: body_headers_to_sign
          )
        end

        # Refreshes the security token in the federation_client used by this class
        # @return [String] The new security token
        def refresh_security_token
          @federation_client.security_token!
        end

        # Generates the correct signature and adds it to the
        # headers that are passed in. Also injects any required
        # headers that might be missing.
        #
        # @param [Symbol] method The HTTP method, such as :get or :post.
        # @param [String] uri The URI, such as 'https://iaas.us-phoenix-1.oraclecloud.com/20160918/volumeAttachments/'
        # @param [Hash] headers A hash of headers
        # @param [String] body The request body
        # @param [String] operation_signing_strategy the signing strategy for the operation. Default is :standard
        def sign(method, uri, headers, body, operation_signing_strategy = :standard)
          reset_signer
          super
        end

        private

        def reset_signer
          @refresh_lock.lock
          @key_id = "ST$#{@federation_client.security_token}"
          @private_key_content = @federation_client.session_key_supplier.key_pair[:private_key]
          @private_key = OpenSSL::PKey::RSA.new(
            @private_key_content,
            @pass_phrase || SecureRandom.uuid
          )
        ensure
          @refresh_lock.unlock if @refresh_lock.locked? && @refresh_lock.owned?
        end
      end
    end
  end
end
