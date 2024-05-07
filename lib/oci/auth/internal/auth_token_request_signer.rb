# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
