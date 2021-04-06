# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'oci/base_signer'

module OCI
  module Auth
    # signers
    # rubocop:disable Metrics/AbcSize
    module Signers
      OCI_RESOURCE_PRINCIPAL_VERSION = 'OCI_RESOURCE_PRINCIPAL_VERSION'.freeze
      OCI_RESOURCE_PRINCIPAL_RPT_ENDPOINT = 'OCI_RESOURCE_PRINCIPAL_RPT_ENDPOINT'.freeze
      OCI_RESOURCE_PRINCIPAL_RPST_ENDPOINT = 'OCI_RESOURCE_PRINCIPAL_RPST_ENDPOINT'.freeze
      OCI_RESOURCE_PRINCIPAL_RPST = 'OCI_RESOURCE_PRINCIPAL_RPST'.freeze
      OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM = 'OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM'.freeze
      OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM_PASSPHRASE = 'OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM_PASSPHRASE'.freeze
      OCI_RESOURCE_PRINCIPAL_REGION = 'OCI_RESOURCE_PRINCIPAL_REGION'.freeze

      def self.resource_principals_signer(resource_principal_token_path_provider: nil)
        rp_version = ENV[OCI_RESOURCE_PRINCIPAL_VERSION]
        if rp_version == '2.2'
          session_token = ENV[OCI_RESOURCE_PRINCIPAL_RPST]
          private_key = ENV[OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM]
          private_key_passphrase = ENV[OCI_RESOURCE_PRINCIPAL_PRIVATE_PEM_PASSPHRASE]
          region = ENV[OCI_RESOURCE_PRINCIPAL_REGION]
          OCI::Auth::Signers::EphemeralResourcePrincipalsSigner.new(
            session_token: session_token,
            private_key: private_key,
            private_key_passphrase: private_key_passphrase,
            region: region
          )
        elsif rp_version == '1.1'
          #
          # This signer takes the following parameters
          # - OCI_RESOURCE_PRINCIPAL_RPT_ENDPOINT
          #     The endpoint for retrieving the Resource Principal Token
          # - OCI_RESOURCE_PRINCIPAL_RPST_ENDPOINT
          #     The endpoint for retrieving the Resource Principal Session Token
          # - Resource Principal Token Path Provider
          #     An Object which Provides the complete path for getting the Resource Principal Token
          resource_principal_token_endpoint = ENV[OCI_RESOURCE_PRINCIPAL_RPT_ENDPOINT]
          resource_principal_session_token_endpoint = ENV[OCI_RESOURCE_PRINCIPAL_RPST_ENDPOINT]
          OCI::Auth::Signers::ResourcePrincipalsFederationSigner.new(
            rp_token_endpoint: resource_principal_token_endpoint,
            rp_session_endpoint: resource_principal_session_token_endpoint,
            rp_token_path_provider: resource_principal_token_path_provider
          )
        elsif rp_version.nil?
          raise Exception("#{OCI_RESOURCE_PRINCIPAL_VERSION} is not defined")
        else
          raise Exception("Unsupported #{OCI_RESOURCE_PRINCIPAL_VERSION}: #{rp_version}")
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end
