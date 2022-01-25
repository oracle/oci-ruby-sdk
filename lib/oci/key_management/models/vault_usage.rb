# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # VaultUsage model.
  class KeyManagement::Models::VaultUsage
    # **[Required]** The number of keys in this vault that persist on a hardware security module (HSM), across all compartments, excluding keys in a `DELETED` state.
    # @return [Integer]
    attr_accessor :key_count

    # **[Required]** The number of key versions in this vault that persist on a hardware security module (HSM), across all compartments, excluding key versions in a `DELETED` state.
    # @return [Integer]
    attr_accessor :key_version_count

    # The number of keys in this vault that persist on the server, across all compartments, excluding keys in a `DELETED` state.
    # @return [Integer]
    attr_accessor :software_key_count

    # The number of key versions in this vault that persist on the server, across all compartments, excluding key versions in a `DELETED` state.
    # @return [Integer]
    attr_accessor :software_key_version_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key_count': :'keyCount',
        'key_version_count': :'keyVersionCount',
        'software_key_count': :'softwareKeyCount',
        'software_key_version_count': :'softwareKeyVersionCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key_count': :'Integer',
        'key_version_count': :'Integer',
        'software_key_count': :'Integer',
        'software_key_version_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :key_count The value to assign to the {#key_count} property
    # @option attributes [Integer] :key_version_count The value to assign to the {#key_version_count} property
    # @option attributes [Integer] :software_key_count The value to assign to the {#software_key_count} property
    # @option attributes [Integer] :software_key_version_count The value to assign to the {#software_key_version_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key_count = attributes[:'keyCount'] if attributes[:'keyCount']

      raise 'You cannot provide both :keyCount and :key_count' if attributes.key?(:'keyCount') && attributes.key?(:'key_count')

      self.key_count = attributes[:'key_count'] if attributes[:'key_count']

      self.key_version_count = attributes[:'keyVersionCount'] if attributes[:'keyVersionCount']

      raise 'You cannot provide both :keyVersionCount and :key_version_count' if attributes.key?(:'keyVersionCount') && attributes.key?(:'key_version_count')

      self.key_version_count = attributes[:'key_version_count'] if attributes[:'key_version_count']

      self.software_key_count = attributes[:'softwareKeyCount'] if attributes[:'softwareKeyCount']

      raise 'You cannot provide both :softwareKeyCount and :software_key_count' if attributes.key?(:'softwareKeyCount') && attributes.key?(:'software_key_count')

      self.software_key_count = attributes[:'software_key_count'] if attributes[:'software_key_count']

      self.software_key_version_count = attributes[:'softwareKeyVersionCount'] if attributes[:'softwareKeyVersionCount']

      raise 'You cannot provide both :softwareKeyVersionCount and :software_key_version_count' if attributes.key?(:'softwareKeyVersionCount') && attributes.key?(:'software_key_version_count')

      self.software_key_version_count = attributes[:'software_key_version_count'] if attributes[:'software_key_version_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key_count == other.key_count &&
        key_version_count == other.key_version_count &&
        software_key_count == other.software_key_count &&
        software_key_version_count == other.software_key_version_count
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
      [key_count, key_version_count, software_key_count, software_key_version_count].hash
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
