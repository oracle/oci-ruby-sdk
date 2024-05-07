# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'

module OCI
  # Error which will be thrown which configuration fails validation
  class InvalidConfigError < RuntimeError; end

  # This class contains accessors for configuration attributes needed when using the
  # SDK
  class Config
    # Patterns to use validate value for  different attribute
    PATTERNS = { 'tenancy' => /^([0-9a-zA-Z\-_]+[.:])([0-9a-zA-Z\-_]*[.:]){3,}([0-9a-zA-Z\-_]+)$/,
                 'user' => /^([0-9a-zA-Z\-_]+[.:])([0-9a-zA-Z\-_]*[.:]){3,}([0-9a-zA-Z\-_]+)$/,
                 'fingerprint' => /^([0-9a-f]{2}:){15}[0-9a-f]{2}$/ }.freeze

    OCI_REGION_ENV = 'OCI_REGION'.freeze

    private_constant :PATTERNS

    # OCID of the user to use for authentication.
    # Example: ocidv1:user:oc1:phx:1460406592659:aaaaaaaawcbqrkycbolrirg2n3xjl5fabc
    #
    # @return [String]
    attr_accessor :user

    # SSL Fingerprint to use for authentication.
    # Example: 20:3b:97:13:55:1c:1c:0d:d3:37:d8:50:4e:c5:3a:12
    #
    # @return [String]
    attr_accessor :fingerprint

    # OCID of the tenancy to use for authentication.
    # Example: ocid1.tenancy.oc1..aaaaaaaaba3pv6wkcr4jqae5f15p2b2m2yt2j6rx32uzr4h25vqstifsfdsq
    #
    # @return [String]
    attr_accessor :tenancy

    # Client private key file.
    # Example: ~/.ssh/oci_key
    #
    # @return [String]
    attr_accessor :key_file

    # Client private key content.
    # key_content takes precedence if both key_file and key_content are provided.
    # For the security reason, don't provide the key content in the configuration file itself and it will be ignored by SDK.
    # The value should be same as the content which is normally found in a .pem file.
    # Example: "-----BEGIN RSA PRIVATE KEY-----\nProc-Type: 4,ENCRYPTED\nDEK-Info: AES-128-CBC,D3D04C29BD3061489F4FF579A2133620\n\njZO+B3DMBTz6Pszk0EUS8O2gU0T...jZpo\n-----END RSA PRIVATE KEY-----\n"
    #
    # @return [String]
    attr_accessor :key_content

    # Pass phrase used for key file, if it is encrypted.
    #
    # @return [String]
    attr_accessor :pass_phrase

    # A region to use for APIs created with this Config.
    #
    # @return [OCI::Regions::REGION_ENUM]
    attr_writer :region

    # Defines the logger used for debugging.
    # For example, log to STDOUT by setting this to Logger.new(STDOUT).
    # This property cannot be set from a config file.
    attr_writer :logger

    # Whether to log detailed request and response
    # data. This will always write to STDOUT.
    # Defaults to false.
    #
    # @return [true, false]
    attr_accessor :log_requests

    # The time limit for HTTP request in seconds.
    # Defaults to 0 (times out in 365 days).
    #
    # @return [Integer]
    attr_accessor :timeout

    # The time limit for the connection phase in seconds.
    # Defaults to 10 seconds.
    #
    # @return [Integer]
    attr_accessor :connection_timeout

    # If set, then this string will be added to the
    # user agent sent with each request.
    #
    # @return [String]
    attr_accessor :additional_user_agent

    # The file location of delegation token
    # Example: ~/.oci/delegation
    #
    # @return [String]
    attr_accessor :delegation_token_file

    # The authentication type user want to apply
    # Example: instance_principal
    #
    # @return [String]
    attr_accessor :authentication_type

    def initialize
      @timeout = 0
      @connection_timeout = 10
      @log_requests = false
      @key_content = nil
    end

    # Gets the logger used for debugging.  If nil, then {OCI#logger} will be returned instead.
    #
    # @return [Logger]
    def logger
      return OCI.logger if @logger.nil?

      @logger
    end

    # Gets the region var. If the region doesn't exist, check OCI_REGION_ENV env var to search for it
    #
    # @return [OCI::Regions::REGION_ENUM]
    def region
      @region ||= ENV[OCI::Config::OCI_REGION_ENV]

      @region
    end

    # rubocop:disable Metrics/PerceivedComplexity
    def validate
      # currently, config file auth type only supports delegation token auth which is `instance_principal` based auth
      return unless @authentication_type.nil? && @delegation_token_file.nil?

      %w[user fingerprint tenancy].each do |name|
        if !instance_variable_defined?("@#{name}") || instance_variable_get("@#{name}").nil?
          raise OCI::InvalidConfigError, "The #{name} is missing in configuration."
        end
      end

      raise OCI::InvalidConfigError, 'The region is missing in configuration or environment variable.' if @region.nil?

      if (!instance_variable_defined?('@key_file') || instance_variable_get('@key_file').nil?) && @key_content.nil?
        raise OCI::InvalidConfigError, 'The key_file and key_content cannot both be missing in configuration.'
      end

      PATTERNS.each do |name, pattern|
        raise OCI::InvalidConfigError, "The format of #{name} is invalid." if (pattern =~ instance_variable_get("@#{name}")).nil?
      end
    end
    # rubocop:enable Metrics/PerceivedComplexity

    def self.validate_and_build_config_with_signer(config, signer)
      config ||= OCI.config unless signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner) || \
                                   signer.is_a?(OCI::Auth::Signers::SecurityTokenSigner)
      config ||= OCI::Config.new if signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner) || \
                                    signer.is_a?(OCI::Auth::Signers::SecurityTokenSigner)
      config.validate unless signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner) || \
                             signer.is_a?(OCI::Auth::Signers::SecurityTokenSigner)
      config
    end
  end
end
