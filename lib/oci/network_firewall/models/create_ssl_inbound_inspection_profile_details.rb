# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230501
require 'date'
require_relative 'create_decryption_profile_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Request for creating SSLInboundInspection used on the firewall policy rules.
  class NetworkFirewall::Models::CreateSslInboundInspectionProfileDetails < NetworkFirewall::Models::CreateDecryptionProfileDetails
    # Whether to block sessions if SSL version is not supported.
    # @return [BOOLEAN]
    attr_accessor :is_unsupported_version_blocked

    # Whether to block sessions if SSL cipher suite is not supported.
    # @return [BOOLEAN]
    attr_accessor :is_unsupported_cipher_blocked

    # Whether to block sessions if the firewall is temporarily unable to decrypt their traffic.
    # @return [BOOLEAN]
    attr_accessor :is_out_of_capacity_blocked

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'name': :'name',
        'is_unsupported_version_blocked': :'isUnsupportedVersionBlocked',
        'is_unsupported_cipher_blocked': :'isUnsupportedCipherBlocked',
        'is_out_of_capacity_blocked': :'isOutOfCapacityBlocked'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'name': :'String',
        'is_unsupported_version_blocked': :'BOOLEAN',
        'is_unsupported_cipher_blocked': :'BOOLEAN',
        'is_out_of_capacity_blocked': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {OCI::NetworkFirewall::Models::CreateDecryptionProfileDetails#name #name} proprety
    # @option attributes [BOOLEAN] :is_unsupported_version_blocked The value to assign to the {#is_unsupported_version_blocked} property
    # @option attributes [BOOLEAN] :is_unsupported_cipher_blocked The value to assign to the {#is_unsupported_cipher_blocked} property
    # @option attributes [BOOLEAN] :is_out_of_capacity_blocked The value to assign to the {#is_out_of_capacity_blocked} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'SSL_INBOUND_INSPECTION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_unsupported_version_blocked = attributes[:'isUnsupportedVersionBlocked'] unless attributes[:'isUnsupportedVersionBlocked'].nil?

      raise 'You cannot provide both :isUnsupportedVersionBlocked and :is_unsupported_version_blocked' if attributes.key?(:'isUnsupportedVersionBlocked') && attributes.key?(:'is_unsupported_version_blocked')

      self.is_unsupported_version_blocked = attributes[:'is_unsupported_version_blocked'] unless attributes[:'is_unsupported_version_blocked'].nil?

      self.is_unsupported_cipher_blocked = attributes[:'isUnsupportedCipherBlocked'] unless attributes[:'isUnsupportedCipherBlocked'].nil?

      raise 'You cannot provide both :isUnsupportedCipherBlocked and :is_unsupported_cipher_blocked' if attributes.key?(:'isUnsupportedCipherBlocked') && attributes.key?(:'is_unsupported_cipher_blocked')

      self.is_unsupported_cipher_blocked = attributes[:'is_unsupported_cipher_blocked'] unless attributes[:'is_unsupported_cipher_blocked'].nil?

      self.is_out_of_capacity_blocked = attributes[:'isOutOfCapacityBlocked'] unless attributes[:'isOutOfCapacityBlocked'].nil?

      raise 'You cannot provide both :isOutOfCapacityBlocked and :is_out_of_capacity_blocked' if attributes.key?(:'isOutOfCapacityBlocked') && attributes.key?(:'is_out_of_capacity_blocked')

      self.is_out_of_capacity_blocked = attributes[:'is_out_of_capacity_blocked'] unless attributes[:'is_out_of_capacity_blocked'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        name == other.name &&
        is_unsupported_version_blocked == other.is_unsupported_version_blocked &&
        is_unsupported_cipher_blocked == other.is_unsupported_cipher_blocked &&
        is_out_of_capacity_blocked == other.is_out_of_capacity_blocked
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
      [type, name, is_unsupported_version_blocked, is_unsupported_cipher_blocked, is_out_of_capacity_blocked].hash
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