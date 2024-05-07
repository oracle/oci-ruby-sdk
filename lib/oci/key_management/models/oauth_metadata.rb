# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: release
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Authorization details required to get access token from IDP for accessing protected resources.
  class KeyManagement::Models::OauthMetadata
    # **[Required]** Base URL of the IDCS account where confidential client app is created.
    # @return [String]
    attr_accessor :idcs_account_name_url

    # **[Required]** ID of the client app created in IDP.
    # @return [String]
    attr_accessor :client_app_id

    # **[Required]** Secret of the client app created in IDP.
    # @return [String]
    attr_accessor :client_app_secret

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'idcs_account_name_url': :'idcsAccountNameUrl',
        'client_app_id': :'clientAppId',
        'client_app_secret': :'clientAppSecret'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'idcs_account_name_url': :'String',
        'client_app_id': :'String',
        'client_app_secret': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :idcs_account_name_url The value to assign to the {#idcs_account_name_url} property
    # @option attributes [String] :client_app_id The value to assign to the {#client_app_id} property
    # @option attributes [String] :client_app_secret The value to assign to the {#client_app_secret} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.idcs_account_name_url = attributes[:'idcsAccountNameUrl'] if attributes[:'idcsAccountNameUrl']

      raise 'You cannot provide both :idcsAccountNameUrl and :idcs_account_name_url' if attributes.key?(:'idcsAccountNameUrl') && attributes.key?(:'idcs_account_name_url')

      self.idcs_account_name_url = attributes[:'idcs_account_name_url'] if attributes[:'idcs_account_name_url']

      self.client_app_id = attributes[:'clientAppId'] if attributes[:'clientAppId']

      raise 'You cannot provide both :clientAppId and :client_app_id' if attributes.key?(:'clientAppId') && attributes.key?(:'client_app_id')

      self.client_app_id = attributes[:'client_app_id'] if attributes[:'client_app_id']

      self.client_app_secret = attributes[:'clientAppSecret'] if attributes[:'clientAppSecret']

      raise 'You cannot provide both :clientAppSecret and :client_app_secret' if attributes.key?(:'clientAppSecret') && attributes.key?(:'client_app_secret')

      self.client_app_secret = attributes[:'client_app_secret'] if attributes[:'client_app_secret']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        idcs_account_name_url == other.idcs_account_name_url &&
        client_app_id == other.client_app_id &&
        client_app_secret == other.client_app_secret
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
      [idcs_account_name_url, client_app_id, client_app_secret].hash
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
