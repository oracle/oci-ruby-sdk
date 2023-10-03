# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'jwt'

module OCI
  module Auth
    module Signers
      # Service Account Token Provider
      # Classes under this module will provide the service account token required for OKE auth provider
      module ServiceAccountTokenProvider
        OCI_KUBERNETES_SERVICE_ACCOUNT_TOKEN_PATH = '/var/run/secrets/kubernetes.io/serviceaccount/token'.freeze
        # Class that provides the service account token from the default location
        class DefaultServiceAccountTokenProvider
          def initialize
            @token_path = OCI_KUBERNETES_SERVICE_ACCOUNT_TOKEN_PATH
          end

          def override_sa_token_path(new_token_path)
            @token_path = new_token_path
          end

          def service_account_token
            sa_token = ''
            File.open(@token_path, 'r') do |file|
              sa_token = file.read.strip
            end
            is_sa_token_valid = OCI::Auth::Signers::ServiceAccountTokenProvider.valid_sa_token?(sa_token)
            raise "Service account token at #{@token_path} has expired." if is_sa_token_valid == false

            sa_token
          end
        end

        # Class that takes in the service account token from the user
        class SuppliedServiceAccountTokenProvider
          def initialize(token_string)
            @token_string = token_string
          end

          def service_account_token
            is_sa_token_valid = OCI::Auth::Signers::ServiceAccountTokenProvider.valid_sa_token?(@token_string)
            raise 'The supplied service account token has expired.' if is_sa_token_valid == false

            @token_string
          end
        end

        def self.valid_sa_token?(token)
          decoded_jwt = JWT.decode(token, nil, false)
          time_now = Time.now.to_i
          raise "Service account token does not have an 'exp' field." if decoded_jwt[0]['exp'].nil?

          time_now < decoded_jwt[0]['exp']
        end
      end
    end
  end
end
