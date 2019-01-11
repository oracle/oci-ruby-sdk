# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'oci/base_signer'

module OCI
  module Auth
    module Internal
      # A signer which can sign requests to Auth Service. Not intended for general use
      class AuthTokenRequestSigner < OCI::BaseSigner
        def initialize(tenancy_id, fingerprint, private_key_pem)
          api_key = "#{tenancy_id}/fed-x509/#{fingerprint}"
          private_key = private_key_pem

          generic_headers = %i[date (request-target)]
          super(api_key, private_key, headers_to_sign_in_all_requests: generic_headers)
        end
      end
    end
  end
end
