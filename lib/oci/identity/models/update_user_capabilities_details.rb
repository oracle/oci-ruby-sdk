# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpdateUserCapabilitiesDetails model.
  class Identity::Models::UpdateUserCapabilitiesDetails
    # Indicates if the user can log in to the console.
    #
    # @return [BOOLEAN]
    attr_accessor :can_use_console_password

    # Indicates if the user can use API keys.
    #
    # @return [BOOLEAN]
    attr_accessor :can_use_api_keys

    # Indicates if the user can use SWIFT passwords / auth tokens.
    #
    # @return [BOOLEAN]
    attr_accessor :can_use_auth_tokens

    # Indicates if the user can use SMTP passwords.
    #
    # @return [BOOLEAN]
    attr_accessor :can_use_smtp_credentials

    # Indicates if the user can use SigV4 symmetric keys.
    #
    # @return [BOOLEAN]
    attr_accessor :can_use_customer_secret_keys

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'can_use_console_password': :'canUseConsolePassword',
        'can_use_api_keys': :'canUseApiKeys',
        'can_use_auth_tokens': :'canUseAuthTokens',
        'can_use_smtp_credentials': :'canUseSmtpCredentials',
        'can_use_customer_secret_keys': :'canUseCustomerSecretKeys'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'can_use_console_password': :'BOOLEAN',
        'can_use_api_keys': :'BOOLEAN',
        'can_use_auth_tokens': :'BOOLEAN',
        'can_use_smtp_credentials': :'BOOLEAN',
        'can_use_customer_secret_keys': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :can_use_console_password The value to assign to the {#can_use_console_password} property
    # @option attributes [BOOLEAN] :can_use_api_keys The value to assign to the {#can_use_api_keys} property
    # @option attributes [BOOLEAN] :can_use_auth_tokens The value to assign to the {#can_use_auth_tokens} property
    # @option attributes [BOOLEAN] :can_use_smtp_credentials The value to assign to the {#can_use_smtp_credentials} property
    # @option attributes [BOOLEAN] :can_use_customer_secret_keys The value to assign to the {#can_use_customer_secret_keys} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.can_use_console_password = attributes[:'canUseConsolePassword'] unless attributes[:'canUseConsolePassword'].nil?

      raise 'You cannot provide both :canUseConsolePassword and :can_use_console_password' if attributes.key?(:'canUseConsolePassword') && attributes.key?(:'can_use_console_password')

      self.can_use_console_password = attributes[:'can_use_console_password'] unless attributes[:'can_use_console_password'].nil?

      self.can_use_api_keys = attributes[:'canUseApiKeys'] unless attributes[:'canUseApiKeys'].nil?

      raise 'You cannot provide both :canUseApiKeys and :can_use_api_keys' if attributes.key?(:'canUseApiKeys') && attributes.key?(:'can_use_api_keys')

      self.can_use_api_keys = attributes[:'can_use_api_keys'] unless attributes[:'can_use_api_keys'].nil?

      self.can_use_auth_tokens = attributes[:'canUseAuthTokens'] unless attributes[:'canUseAuthTokens'].nil?

      raise 'You cannot provide both :canUseAuthTokens and :can_use_auth_tokens' if attributes.key?(:'canUseAuthTokens') && attributes.key?(:'can_use_auth_tokens')

      self.can_use_auth_tokens = attributes[:'can_use_auth_tokens'] unless attributes[:'can_use_auth_tokens'].nil?

      self.can_use_smtp_credentials = attributes[:'canUseSmtpCredentials'] unless attributes[:'canUseSmtpCredentials'].nil?

      raise 'You cannot provide both :canUseSmtpCredentials and :can_use_smtp_credentials' if attributes.key?(:'canUseSmtpCredentials') && attributes.key?(:'can_use_smtp_credentials')

      self.can_use_smtp_credentials = attributes[:'can_use_smtp_credentials'] unless attributes[:'can_use_smtp_credentials'].nil?

      self.can_use_customer_secret_keys = attributes[:'canUseCustomerSecretKeys'] unless attributes[:'canUseCustomerSecretKeys'].nil?

      raise 'You cannot provide both :canUseCustomerSecretKeys and :can_use_customer_secret_keys' if attributes.key?(:'canUseCustomerSecretKeys') && attributes.key?(:'can_use_customer_secret_keys')

      self.can_use_customer_secret_keys = attributes[:'can_use_customer_secret_keys'] unless attributes[:'can_use_customer_secret_keys'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        can_use_console_password == other.can_use_console_password &&
        can_use_api_keys == other.can_use_api_keys &&
        can_use_auth_tokens == other.can_use_auth_tokens &&
        can_use_smtp_credentials == other.can_use_smtp_credentials &&
        can_use_customer_secret_keys == other.can_use_customer_secret_keys
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [can_use_console_password, can_use_api_keys, can_use_auth_tokens, can_use_smtp_credentials, can_use_customer_secret_keys].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
