# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The value of this attribute persists any OAuth access token that the system uses to connect to this ManagedApp. The system obtains this access token using an OAuth protocol flow that could be two-legged or three-legged. A two-legged flow involves only the requester and the server. A three-legged flow also requires the consent of a user -- in this case the consent of an administrator.
  #
  # **SCIM++ Properties:**
  #  - idcsSearchable: true
  #  - multiValued: false
  #  - mutability: readWrite
  #  - required: false
  #  - returned: default
  #  - type: complex
  class IdentityDomains::Models::AppThreeLeggedOAuthCredential
    # Access Token
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: false
    #  - idcsSensitive: encrypt
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :access_token

    # Refresh Token
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - idcsSensitive: encrypt
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :refresh_token

    # Access token expiry
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: dateTime
    #  - uniqueness: none
    # @return [String]
    attr_accessor :access_token_expiry

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'access_token': :'accessToken',
        'refresh_token': :'refreshToken',
        'access_token_expiry': :'accessTokenExpiry'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'access_token': :'String',
        'refresh_token': :'String',
        'access_token_expiry': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :access_token The value to assign to the {#access_token} property
    # @option attributes [String] :refresh_token The value to assign to the {#refresh_token} property
    # @option attributes [String] :access_token_expiry The value to assign to the {#access_token_expiry} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.access_token = attributes[:'accessToken'] if attributes[:'accessToken']

      raise 'You cannot provide both :accessToken and :access_token' if attributes.key?(:'accessToken') && attributes.key?(:'access_token')

      self.access_token = attributes[:'access_token'] if attributes[:'access_token']

      self.refresh_token = attributes[:'refreshToken'] if attributes[:'refreshToken']

      raise 'You cannot provide both :refreshToken and :refresh_token' if attributes.key?(:'refreshToken') && attributes.key?(:'refresh_token')

      self.refresh_token = attributes[:'refresh_token'] if attributes[:'refresh_token']

      self.access_token_expiry = attributes[:'accessTokenExpiry'] if attributes[:'accessTokenExpiry']

      raise 'You cannot provide both :accessTokenExpiry and :access_token_expiry' if attributes.key?(:'accessTokenExpiry') && attributes.key?(:'access_token_expiry')

      self.access_token_expiry = attributes[:'access_token_expiry'] if attributes[:'access_token_expiry']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        access_token == other.access_token &&
        refresh_token == other.refresh_token &&
        access_token_expiry == other.access_token_expiry
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
      [access_token, refresh_token, access_token_expiry].hash
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
