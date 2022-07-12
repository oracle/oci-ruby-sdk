# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # MacroPivotField is used for the PivotField with macro expressions. It can contain the rules according to the macro pattern/attribute added and create new fields according to the PivotKeyValues
  class DataIntegration::Models::MacroPivotField
    # Specifies whether the type of macro fields is inferred from an expression or useType (false) or the source field (true).
    # @return [BOOLEAN]
    attr_accessor :is_use_source_type

    # @return [OCI::DataIntegration::Models::Expression]
    attr_accessor :expr

    # @return [OCI::DataIntegration::Models::ConfiguredType]
    attr_accessor :use_type

    # @return [OCI::DataIntegration::Models::BaseType]
    attr_accessor :type

    # column name pattern can be used to generate the name structure of the generated columns. By default column names are of %PIVOT_KEY_VALUE% or %MACRO_INPUT%_%PIVOT_KEY_VALUE%, but we can change it something by passing something like MY_PREFIX%PIVOT_KEY_VALUE%MY_SUFFIX or MY_PREFIX%MACRO_INPUT%_%PIVOT_KEY_VALUE%MY_SUFFIX which will add custom prefix and suffix to the column name.
    # @return [String]
    attr_accessor :column_name_pattern

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_use_source_type': :'isUseSourceType',
        'expr': :'expr',
        'use_type': :'useType',
        'type': :'type',
        'column_name_pattern': :'columnNamePattern'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_use_source_type': :'BOOLEAN',
        'expr': :'OCI::DataIntegration::Models::Expression',
        'use_type': :'OCI::DataIntegration::Models::ConfiguredType',
        'type': :'OCI::DataIntegration::Models::BaseType',
        'column_name_pattern': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_use_source_type The value to assign to the {#is_use_source_type} property
    # @option attributes [OCI::DataIntegration::Models::Expression] :expr The value to assign to the {#expr} property
    # @option attributes [OCI::DataIntegration::Models::ConfiguredType] :use_type The value to assign to the {#use_type} property
    # @option attributes [OCI::DataIntegration::Models::BaseType] :type The value to assign to the {#type} property
    # @option attributes [String] :column_name_pattern The value to assign to the {#column_name_pattern} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_use_source_type = attributes[:'isUseSourceType'] unless attributes[:'isUseSourceType'].nil?
      self.is_use_source_type = false if is_use_source_type.nil? && !attributes.key?(:'isUseSourceType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUseSourceType and :is_use_source_type' if attributes.key?(:'isUseSourceType') && attributes.key?(:'is_use_source_type')

      self.is_use_source_type = attributes[:'is_use_source_type'] unless attributes[:'is_use_source_type'].nil?
      self.is_use_source_type = false if is_use_source_type.nil? && !attributes.key?(:'isUseSourceType') && !attributes.key?(:'is_use_source_type') # rubocop:disable Style/StringLiterals

      self.expr = attributes[:'expr'] if attributes[:'expr']

      self.use_type = attributes[:'useType'] if attributes[:'useType']

      raise 'You cannot provide both :useType and :use_type' if attributes.key?(:'useType') && attributes.key?(:'use_type')

      self.use_type = attributes[:'use_type'] if attributes[:'use_type']

      self.type = attributes[:'type'] if attributes[:'type']

      self.column_name_pattern = attributes[:'columnNamePattern'] if attributes[:'columnNamePattern']

      raise 'You cannot provide both :columnNamePattern and :column_name_pattern' if attributes.key?(:'columnNamePattern') && attributes.key?(:'column_name_pattern')

      self.column_name_pattern = attributes[:'column_name_pattern'] if attributes[:'column_name_pattern']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_use_source_type == other.is_use_source_type &&
        expr == other.expr &&
        use_type == other.use_type &&
        type == other.type &&
        column_name_pattern == other.column_name_pattern
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
      [is_use_source_type, expr, use_type, type, column_name_pattern].hash
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
