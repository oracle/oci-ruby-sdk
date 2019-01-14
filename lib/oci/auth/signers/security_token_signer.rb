# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'oci/base_signer'

module OCI
  module Auth
    module Signers
      # The base signer for signing requests where the API key is a token (e.g. instance principals, service-to-service auth) rather representing
      # the details for a specific user.
      class SecurityTokenSigner < OCI::BaseSigner
        # Creates a new SecurityTokenSigner
        #
        # @param [Strong] security_token The token to use as the API key
        # @param [OpenSSL::PKey::RSA] private_key The private key whose corresponding public key was provided when requesting the token
        # @param [String] pass_phrase  The pass phrase for the public key, if any. Defaults to nil (no passphrase) if not provided
        # @param [String] signing_strategy Whether this signer is used for Object Storage requests or not. Acceptable values are {OCI::BaseSigner::STANDARD} and {OCI::BaseSigner::OBJECT_STORAGE}. If not provided, defaults to {OCI::BaseSigner::STANDARD}
        # @param [Array<String>] headers_to_sign_in_all_requests An array of headers which will be signed in each request. If not provided, defaults to {OCI::BaseSigner::GENERIC_HEADERS}
        # @param [Array<String>] body_headers_to_sign An array of headers which should be signed on requests with bodies. If not provided, defaults to {OCI::BaseSigner::BODY_HEADERS}
        def initialize(
          security_token,
          private_key,
          pass_phrase: nil,
          signing_strategy: OCI::BaseSigner::STANDARD,
          headers_to_sign_in_all_requests: OCI::BaseSigner::GENERIC_HEADERS,
          body_headers_to_sign: OCI::BaseSigner::BODY_HEADERS
        )
          super(
            "ST$#{security_token}",
            private_key,
            pass_phrase: pass_phrase,
            signing_strategy: signing_strategy,
            headers_to_sign_in_all_requests: headers_to_sign_in_all_requests,
            body_headers_to_sign: body_headers_to_sign
          )
        end
      end
    end
  end
end
