# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'oci/base_signer'
require 'net/http'
require 'json'
require 'pp'

module OCI
  module Auth
    # signer
    module Signers
      # rubocop:disable Metrics/LineLength

      # This signer takes the following parameters:
      # - session_token
      # - private_key
      # - private_key_passphrase
      #     These parameters may be used in one of two modes. In the first mode, they contain the actual
      #     contents of the Resource Pricipals Session Token, private key (in PEM format) and the passphrase.
      #
      #     In the second mode, if these parameters contain absolute paths, then those paths are taken as the
      #     on-filesystem location of the values in question.
      #
      # - region: the canonical region name
      #
      #     This is utilised in locating the "local" endpoints of services.
      class EphemeralResourcePrincipalsSigner < OCI::Auth::Signers::SecurityTokenSigner
        attr_reader :region

        def initialize(
          session_token: nil,
          private_key: nil,
          private_key_passphrase: nil,
          region: nil
        )
          @refresh_lock = Mutex.new
          @region = initialize_and_return_region(region)
          raise 'Missing Resource Principal Session Token when initializing resource principals signer' if session_token.nil?

          @rpst = session_token

          # Load the initial values
          @session_key_supplier = OCI::Auth::Signers::EphemeralRPSessionKeySupplier.new(private_key, private_key_passphrase)
          @security_token = OCI::Auth::SecurityTokenContainer.new(resource_principal_session_token, key_pair: @session_key_supplier.session_key)

          # After load, the RPST holds claims for tenancy and compartment.
          reset_claims

          # Get the Resource Principal Session Token and use it to set up the signer
          super(@security_token.security_token, @session_key_supplier.session_key)
        end

        # The region should be something like "us-phoenix-1" but if we get "phx" then convert it.
        def initialize_and_return_region(region)
          if OCI::Regions::REGION_SHORT_NAMES_TO_LONG_NAMES.include?(region)
            OCI::Regions::REGION_SHORT_NAMES_TO_LONG_NAMES[region]
          else
            region
          end
        end

        def security_token
          if defined? @security_token
            return @security_token.security_token if @security_token.token_valid?
          end
          refresh_security_token
          @security_token.security_token
        end

        def refresh_security_token
          @refresh_lock.lock
          @session_key_supplier.refresh
          @security_token = OCI::Auth::SecurityTokenContainer.new(resource_principal_session_token, key_pair: @session_key_supplier.session_key)
          reset_signer
          # Resources may be moved between compartments. Update any coordinates on refresh.
          reset_claims
        ensure
          @refresh_lock.unlock if @refresh_lock.locked? && @refresh_lock.owned?
        end

        def reset_signer
          @key_id = "ST$#{@security_token.security_token}"
          @private_key_content = @session_key_supplier.session_key
          @private_key = OpenSSL::PKey::RSA.new(
            @private_key_content,
            @pass_phrase || SecureRandom.uuid
          )
        end

        def resource_principal_session_token
          if File.exist?(File.expand_path(@rpst))
            File.read(File.expand_path(@rpst)).to_s.strip
          else
            @rpst
          end
        end

        def reset_claims
          @tenancy_id = claim('res_tenant')
          @compartment_id = claim('res_compartment')
        end

        def claim(claim)
          @security_token.jwt[0][claim]
        end
      end

      # EphemeralRPSessionKeySupplier for containing key info
      class EphemeralRPSessionKeySupplier
        attr_accessor :session_key

        def initialize(private_key, private_key_passphrase)
          raise 'Missing Resource Principal Private Key' if private_key.nil?

          @private_key = private_key
          @private_key_passphrase = private_key_passphrase
          refresh
        end

        def refresh
          @session_key = if File.exist?(File.expand_path(@private_key))
                           OCI::Auth::Util.load_private_key_from_file(File.expand_path(@private_key), @private_key_passphrase)
                         else
                           OCI::Auth::Util.load_private_key(@private_key, @private_key_passphrase)
                         end
        end
      end
      # rubocop:enable Metrics/LineLength
    end
  end
end
