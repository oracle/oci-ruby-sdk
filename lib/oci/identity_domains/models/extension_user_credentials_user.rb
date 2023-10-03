# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # User's credentials
  class IdentityDomains::Models::ExtensionUserCredentialsUser
    # A list of database credentials corresponding to user.
    #
    # **Added In:** 2102181953
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::UserExtDbCredentials>]
    attr_accessor :db_credentials

    # A list of customer secret keys corresponding to user.
    #
    # **Added In:** 2102181953
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::UserExtCustomerSecretKeys>]
    attr_accessor :customer_secret_keys

    # A list of Auth tokens corresponding to user.
    #
    # **Added In:** 2012271618
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::UserExtAuthTokens>]
    attr_accessor :auth_tokens

    # A list of SMTP credentials corresponding to user.
    #
    # **Added In:** 2012271618
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::UserExtSmtpCredentials>]
    attr_accessor :smtp_credentials

    # A list of API keys corresponding to user.
    #
    # **Added In:** 2012271618
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::UserExtApiKeys>]
    attr_accessor :api_keys

    # A list of OAuth2 client credentials corresponding to a user.
    #
    # **Added In:** 2012271618
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::UserExtOAuth2ClientCredentials>]
    attr_accessor :o_auth2_client_credentials

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'db_credentials': :'dbCredentials',
        'customer_secret_keys': :'customerSecretKeys',
        'auth_tokens': :'authTokens',
        'smtp_credentials': :'smtpCredentials',
        'api_keys': :'apiKeys',
        'o_auth2_client_credentials': :'oAuth2ClientCredentials'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'db_credentials': :'Array<OCI::IdentityDomains::Models::UserExtDbCredentials>',
        'customer_secret_keys': :'Array<OCI::IdentityDomains::Models::UserExtCustomerSecretKeys>',
        'auth_tokens': :'Array<OCI::IdentityDomains::Models::UserExtAuthTokens>',
        'smtp_credentials': :'Array<OCI::IdentityDomains::Models::UserExtSmtpCredentials>',
        'api_keys': :'Array<OCI::IdentityDomains::Models::UserExtApiKeys>',
        'o_auth2_client_credentials': :'Array<OCI::IdentityDomains::Models::UserExtOAuth2ClientCredentials>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::IdentityDomains::Models::UserExtDbCredentials>] :db_credentials The value to assign to the {#db_credentials} property
    # @option attributes [Array<OCI::IdentityDomains::Models::UserExtCustomerSecretKeys>] :customer_secret_keys The value to assign to the {#customer_secret_keys} property
    # @option attributes [Array<OCI::IdentityDomains::Models::UserExtAuthTokens>] :auth_tokens The value to assign to the {#auth_tokens} property
    # @option attributes [Array<OCI::IdentityDomains::Models::UserExtSmtpCredentials>] :smtp_credentials The value to assign to the {#smtp_credentials} property
    # @option attributes [Array<OCI::IdentityDomains::Models::UserExtApiKeys>] :api_keys The value to assign to the {#api_keys} property
    # @option attributes [Array<OCI::IdentityDomains::Models::UserExtOAuth2ClientCredentials>] :o_auth2_client_credentials The value to assign to the {#o_auth2_client_credentials} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.db_credentials = attributes[:'dbCredentials'] if attributes[:'dbCredentials']

      raise 'You cannot provide both :dbCredentials and :db_credentials' if attributes.key?(:'dbCredentials') && attributes.key?(:'db_credentials')

      self.db_credentials = attributes[:'db_credentials'] if attributes[:'db_credentials']

      self.customer_secret_keys = attributes[:'customerSecretKeys'] if attributes[:'customerSecretKeys']

      raise 'You cannot provide both :customerSecretKeys and :customer_secret_keys' if attributes.key?(:'customerSecretKeys') && attributes.key?(:'customer_secret_keys')

      self.customer_secret_keys = attributes[:'customer_secret_keys'] if attributes[:'customer_secret_keys']

      self.auth_tokens = attributes[:'authTokens'] if attributes[:'authTokens']

      raise 'You cannot provide both :authTokens and :auth_tokens' if attributes.key?(:'authTokens') && attributes.key?(:'auth_tokens')

      self.auth_tokens = attributes[:'auth_tokens'] if attributes[:'auth_tokens']

      self.smtp_credentials = attributes[:'smtpCredentials'] if attributes[:'smtpCredentials']

      raise 'You cannot provide both :smtpCredentials and :smtp_credentials' if attributes.key?(:'smtpCredentials') && attributes.key?(:'smtp_credentials')

      self.smtp_credentials = attributes[:'smtp_credentials'] if attributes[:'smtp_credentials']

      self.api_keys = attributes[:'apiKeys'] if attributes[:'apiKeys']

      raise 'You cannot provide both :apiKeys and :api_keys' if attributes.key?(:'apiKeys') && attributes.key?(:'api_keys')

      self.api_keys = attributes[:'api_keys'] if attributes[:'api_keys']

      self.o_auth2_client_credentials = attributes[:'oAuth2ClientCredentials'] if attributes[:'oAuth2ClientCredentials']

      raise 'You cannot provide both :oAuth2ClientCredentials and :o_auth2_client_credentials' if attributes.key?(:'oAuth2ClientCredentials') && attributes.key?(:'o_auth2_client_credentials')

      self.o_auth2_client_credentials = attributes[:'o_auth2_client_credentials'] if attributes[:'o_auth2_client_credentials']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        db_credentials == other.db_credentials &&
        customer_secret_keys == other.customer_secret_keys &&
        auth_tokens == other.auth_tokens &&
        smtp_credentials == other.smtp_credentials &&
        api_keys == other.api_keys &&
        o_auth2_client_credentials == other.o_auth2_client_credentials
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
      [db_credentials, customer_secret_keys, auth_tokens, smtp_credentials, api_keys, o_auth2_client_credentials].hash
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
