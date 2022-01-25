# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UsageStatusItem
  class LogAnalytics::Models::UsageStatusItem
    # The field data type.
    # @return [String]
    attr_accessor :data_type

    # A flag indicating whether or not the field is multi-valued.
    #
    # @return [BOOLEAN]
    attr_accessor :is_multi_valued

    # The current usage of the field.
    # @return [Integer]
    attr_accessor :current_usage

    # The maximum availability of the field.
    # @return [Integer]
    attr_accessor :max_available

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'data_type': :'dataType',
        'is_multi_valued': :'isMultiValued',
        'current_usage': :'currentUsage',
        'max_available': :'maxAvailable'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'data_type': :'String',
        'is_multi_valued': :'BOOLEAN',
        'current_usage': :'Integer',
        'max_available': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [BOOLEAN] :is_multi_valued The value to assign to the {#is_multi_valued} property
    # @option attributes [Integer] :current_usage The value to assign to the {#current_usage} property
    # @option attributes [Integer] :max_available The value to assign to the {#max_available} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.is_multi_valued = attributes[:'isMultiValued'] unless attributes[:'isMultiValued'].nil?

      raise 'You cannot provide both :isMultiValued and :is_multi_valued' if attributes.key?(:'isMultiValued') && attributes.key?(:'is_multi_valued')

      self.is_multi_valued = attributes[:'is_multi_valued'] unless attributes[:'is_multi_valued'].nil?

      self.current_usage = attributes[:'currentUsage'] if attributes[:'currentUsage']

      raise 'You cannot provide both :currentUsage and :current_usage' if attributes.key?(:'currentUsage') && attributes.key?(:'current_usage')

      self.current_usage = attributes[:'current_usage'] if attributes[:'current_usage']

      self.max_available = attributes[:'maxAvailable'] if attributes[:'maxAvailable']

      raise 'You cannot provide both :maxAvailable and :max_available' if attributes.key?(:'maxAvailable') && attributes.key?(:'max_available')

      self.max_available = attributes[:'max_available'] if attributes[:'max_available']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        data_type == other.data_type &&
        is_multi_valued == other.is_multi_valued &&
        current_usage == other.current_usage &&
        max_available == other.max_available
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
      [data_type, is_multi_valued, current_usage, max_available].hash
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
