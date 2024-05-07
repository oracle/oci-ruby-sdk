# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require_relative 'base_signer'

module OCI
  # Used to sign HTTP requests as required by Oracle Cloud Infrastructure.
  class Signer < BaseSigner
    # enum to define the signing strategy
    SIGNING_STRATEGY_ENUM = [STANDARD = 'standard'.freeze, OBJECT_STORAGE = 'object_storage'.freeze].freeze

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/AbcSize, Metrics/LineLength


    # Creates a Signer
    #
    # @param [String] user OCID of the user to be used for authentication, for example "ocidv1:user:oc1:phx:1460406592659:aaaaaaaawcbqrkycbolrirg2n3xjl5fyxe".
    # @param [String] fingerprint Fingerprint of the key used for authentication, for example "20:3b:97:13:55:1c:5b:0d:d3:37:d8:50:4e:c5:3a:34"
    # @param [String] tenancy OCID of the tenancy
    # @param [String] private_key_file It can be nil if private_key_content is provided. Full path and filename of the unencrypted PEM file, for example "/Users/bgustafs/.ssh/id_rsa.pem"
    # @param [String] pass_phrase Optional pass phrase used to encrypt the private key
    # @param [String] private_key_content Optional if private_key_file is provided. The value should be the content of the unencrypted PEM file.
    # @param [SIGNING_STRATEGY_ENUM] signing_strategy Optional signing for standard service or object storage service
    def initialize(
      user,
      fingerprint,
      tenancy,
      private_key_file,
      pass_phrase: nil,
      private_key_content: nil,
      signing_strategy: STANDARD
    )
      raise 'Missing required parameter user.' unless user
      raise 'Missing required parameter fingerprint.' unless fingerprint
      raise 'Missing required parameter tenancy.' unless tenancy

      raise 'Missing required parameter private_key_file or private_key_content.' unless private_key_file || private_key_content

      private_key = private_key_content.nil? ? File.read(private_key_file) : private_key_content
      super("#{tenancy}/#{user}/#{fingerprint}", private_key, pass_phrase: pass_phrase, signing_strategy: signing_strategy)
    end

    def self.config_file_auth_builder(config)
      signer = nil

      case config.authentication_type
      when 'instance_principal'
        unless config.delegation_token_file.nil?
          raise 'Delegation Token File not exist' unless File.exist?(File.expand_path(config.delegation_token_file))

          delegation_token = File.read(File.expand_path(config.delegation_token_file)).to_s.strip
          signer ||= OCI::Auth::Signers::InstancePrincipalsDelegationTokenSigner.new(delegation_token) unless delegation_token.nil?
        end
      when 'resource_principal'
        signer ||= OCI::Auth::Signers.resource_principals_signer
      else
        signer ||= OCI::Signer.new(
          config.user,
          config.fingerprint,
          config.tenancy,
          config.key_file,
          pass_phrase: config.pass_phrase,
          private_key_content: config.key_content
        )
      end
      signer
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/AbcSize, Metrics/LineLength
  end
end
