# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Property overrides at the scope of objects.
  # For example, if you want to use logSourceName as 'xyz' for all objects that conatins string 'abc/' then
  # define matchType as 'contains', matchValue as 'abc/', propertyName as 'logSourceName' and propertyValue as 'xyz'.
  #
  class LogAnalytics::Models::PropertyOverride
    # Match Type. Accepted values are: contains
    #
    # @return [String]
    attr_accessor :match_type

    # Match Value.
    # @return [String]
    attr_accessor :match_value

    # Property to override. Accepted values are: logSourceName, charEncoding.
    #
    # @return [String]
    attr_accessor :property_name

    # Value.
    # @return [String]
    attr_accessor :property_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'match_type': :'matchType',
        'match_value': :'matchValue',
        'property_name': :'propertyName',
        'property_value': :'propertyValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'match_type': :'String',
        'match_value': :'String',
        'property_name': :'String',
        'property_value': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :match_type The value to assign to the {#match_type} property
    # @option attributes [String] :match_value The value to assign to the {#match_value} property
    # @option attributes [String] :property_name The value to assign to the {#property_name} property
    # @option attributes [String] :property_value The value to assign to the {#property_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.match_type = attributes[:'matchType'] if attributes[:'matchType']

      raise 'You cannot provide both :matchType and :match_type' if attributes.key?(:'matchType') && attributes.key?(:'match_type')

      self.match_type = attributes[:'match_type'] if attributes[:'match_type']

      self.match_value = attributes[:'matchValue'] if attributes[:'matchValue']

      raise 'You cannot provide both :matchValue and :match_value' if attributes.key?(:'matchValue') && attributes.key?(:'match_value')

      self.match_value = attributes[:'match_value'] if attributes[:'match_value']

      self.property_name = attributes[:'propertyName'] if attributes[:'propertyName']

      raise 'You cannot provide both :propertyName and :property_name' if attributes.key?(:'propertyName') && attributes.key?(:'property_name')

      self.property_name = attributes[:'property_name'] if attributes[:'property_name']

      self.property_value = attributes[:'propertyValue'] if attributes[:'propertyValue']

      raise 'You cannot provide both :propertyValue and :property_value' if attributes.key?(:'propertyValue') && attributes.key?(:'property_value')

      self.property_value = attributes[:'property_value'] if attributes[:'property_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        match_type == other.match_type &&
        match_value == other.match_value &&
        property_name == other.property_name &&
        property_value == other.property_value
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
      [match_type, match_value, property_name, property_value].hash
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
