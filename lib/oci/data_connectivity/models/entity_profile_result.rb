# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A metadata details of a profiling entity result.
  class DataConnectivity::Models::EntityProfileResult
    # Number of columns in the DataFrame (arrow buffer) sent from Java layer. This value is not impacted by the List of attributes to profile as being passed via configuration.
    # @return [Integer]
    attr_accessor :attribute_count

    # Number of rows were that were sampled
    # @return [Integer]
    attr_accessor :sampled_row_count

    # The estimated row count in the source.
    # @return [Integer]
    attr_accessor :estimated_row_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'attribute_count': :'attributeCount',
        'sampled_row_count': :'sampledRowCount',
        'estimated_row_count': :'estimatedRowCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'attribute_count': :'Integer',
        'sampled_row_count': :'Integer',
        'estimated_row_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :attribute_count The value to assign to the {#attribute_count} property
    # @option attributes [Integer] :sampled_row_count The value to assign to the {#sampled_row_count} property
    # @option attributes [Integer] :estimated_row_count The value to assign to the {#estimated_row_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.attribute_count = attributes[:'attributeCount'] if attributes[:'attributeCount']

      raise 'You cannot provide both :attributeCount and :attribute_count' if attributes.key?(:'attributeCount') && attributes.key?(:'attribute_count')

      self.attribute_count = attributes[:'attribute_count'] if attributes[:'attribute_count']

      self.sampled_row_count = attributes[:'sampledRowCount'] if attributes[:'sampledRowCount']

      raise 'You cannot provide both :sampledRowCount and :sampled_row_count' if attributes.key?(:'sampledRowCount') && attributes.key?(:'sampled_row_count')

      self.sampled_row_count = attributes[:'sampled_row_count'] if attributes[:'sampled_row_count']

      self.estimated_row_count = attributes[:'estimatedRowCount'] if attributes[:'estimatedRowCount']

      raise 'You cannot provide both :estimatedRowCount and :estimated_row_count' if attributes.key?(:'estimatedRowCount') && attributes.key?(:'estimated_row_count')

      self.estimated_row_count = attributes[:'estimated_row_count'] if attributes[:'estimated_row_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        attribute_count == other.attribute_count &&
        sampled_row_count == other.sampled_row_count &&
        estimated_row_count == other.estimated_row_count
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
      [attribute_count, sampled_row_count, estimated_row_count].hash
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
