# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsParserField
  class LogAnalytics::Models::LogAnalyticsParserField
    # @return [OCI::LogAnalytics::Models::LogAnalyticsField]
    attr_accessor :field

    # The parser field unique identifier.
    # @return [Integer]
    attr_accessor :parser_field_id

    # the parser field expression.
    # @return [String]
    attr_accessor :parser_field_expression

    # The parser field internal name.
    # @return [String]
    attr_accessor :parser_field_name

    # The storage field name.
    # @return [String]
    attr_accessor :storage_field_name

    # The integrator name.
    # @return [String]
    attr_accessor :parser_field_integrator_name

    # The parser internal name.
    # @return [String]
    attr_accessor :parser_name

    # The parser field sequence.
    # @return [Integer]
    attr_accessor :parser_field_sequence

    # @return [OCI::LogAnalytics::Models::LogAnalyticsParser]
    attr_accessor :parser

    # The structured column information.
    # @return [String]
    attr_accessor :structured_column_info

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'field': :'field',
        'parser_field_id': :'parserFieldId',
        'parser_field_expression': :'parserFieldExpression',
        'parser_field_name': :'parserFieldName',
        'storage_field_name': :'storageFieldName',
        'parser_field_integrator_name': :'parserFieldIntegratorName',
        'parser_name': :'parserName',
        'parser_field_sequence': :'parserFieldSequence',
        'parser': :'parser',
        'structured_column_info': :'structuredColumnInfo'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'field': :'OCI::LogAnalytics::Models::LogAnalyticsField',
        'parser_field_id': :'Integer',
        'parser_field_expression': :'String',
        'parser_field_name': :'String',
        'storage_field_name': :'String',
        'parser_field_integrator_name': :'String',
        'parser_name': :'String',
        'parser_field_sequence': :'Integer',
        'parser': :'OCI::LogAnalytics::Models::LogAnalyticsParser',
        'structured_column_info': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsField] :field The value to assign to the {#field} property
    # @option attributes [Integer] :parser_field_id The value to assign to the {#parser_field_id} property
    # @option attributes [String] :parser_field_expression The value to assign to the {#parser_field_expression} property
    # @option attributes [String] :parser_field_name The value to assign to the {#parser_field_name} property
    # @option attributes [String] :storage_field_name The value to assign to the {#storage_field_name} property
    # @option attributes [String] :parser_field_integrator_name The value to assign to the {#parser_field_integrator_name} property
    # @option attributes [String] :parser_name The value to assign to the {#parser_name} property
    # @option attributes [Integer] :parser_field_sequence The value to assign to the {#parser_field_sequence} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsParser] :parser The value to assign to the {#parser} property
    # @option attributes [String] :structured_column_info The value to assign to the {#structured_column_info} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.field = attributes[:'field'] if attributes[:'field']

      self.parser_field_id = attributes[:'parserFieldId'] if attributes[:'parserFieldId']

      raise 'You cannot provide both :parserFieldId and :parser_field_id' if attributes.key?(:'parserFieldId') && attributes.key?(:'parser_field_id')

      self.parser_field_id = attributes[:'parser_field_id'] if attributes[:'parser_field_id']

      self.parser_field_expression = attributes[:'parserFieldExpression'] if attributes[:'parserFieldExpression']

      raise 'You cannot provide both :parserFieldExpression and :parser_field_expression' if attributes.key?(:'parserFieldExpression') && attributes.key?(:'parser_field_expression')

      self.parser_field_expression = attributes[:'parser_field_expression'] if attributes[:'parser_field_expression']

      self.parser_field_name = attributes[:'parserFieldName'] if attributes[:'parserFieldName']

      raise 'You cannot provide both :parserFieldName and :parser_field_name' if attributes.key?(:'parserFieldName') && attributes.key?(:'parser_field_name')

      self.parser_field_name = attributes[:'parser_field_name'] if attributes[:'parser_field_name']

      self.storage_field_name = attributes[:'storageFieldName'] if attributes[:'storageFieldName']

      raise 'You cannot provide both :storageFieldName and :storage_field_name' if attributes.key?(:'storageFieldName') && attributes.key?(:'storage_field_name')

      self.storage_field_name = attributes[:'storage_field_name'] if attributes[:'storage_field_name']

      self.parser_field_integrator_name = attributes[:'parserFieldIntegratorName'] if attributes[:'parserFieldIntegratorName']

      raise 'You cannot provide both :parserFieldIntegratorName and :parser_field_integrator_name' if attributes.key?(:'parserFieldIntegratorName') && attributes.key?(:'parser_field_integrator_name')

      self.parser_field_integrator_name = attributes[:'parser_field_integrator_name'] if attributes[:'parser_field_integrator_name']

      self.parser_name = attributes[:'parserName'] if attributes[:'parserName']

      raise 'You cannot provide both :parserName and :parser_name' if attributes.key?(:'parserName') && attributes.key?(:'parser_name')

      self.parser_name = attributes[:'parser_name'] if attributes[:'parser_name']

      self.parser_field_sequence = attributes[:'parserFieldSequence'] if attributes[:'parserFieldSequence']

      raise 'You cannot provide both :parserFieldSequence and :parser_field_sequence' if attributes.key?(:'parserFieldSequence') && attributes.key?(:'parser_field_sequence')

      self.parser_field_sequence = attributes[:'parser_field_sequence'] if attributes[:'parser_field_sequence']

      self.parser = attributes[:'parser'] if attributes[:'parser']

      self.structured_column_info = attributes[:'structuredColumnInfo'] if attributes[:'structuredColumnInfo']

      raise 'You cannot provide both :structuredColumnInfo and :structured_column_info' if attributes.key?(:'structuredColumnInfo') && attributes.key?(:'structured_column_info')

      self.structured_column_info = attributes[:'structured_column_info'] if attributes[:'structured_column_info']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        field == other.field &&
        parser_field_id == other.parser_field_id &&
        parser_field_expression == other.parser_field_expression &&
        parser_field_name == other.parser_field_name &&
        storage_field_name == other.storage_field_name &&
        parser_field_integrator_name == other.parser_field_integrator_name &&
        parser_name == other.parser_name &&
        parser_field_sequence == other.parser_field_sequence &&
        parser == other.parser &&
        structured_column_info == other.structured_column_info
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
      [field, parser_field_id, parser_field_expression, parser_field_name, storage_field_name, parser_field_integrator_name, parser_name, parser_field_sequence, parser, structured_column_info].hash
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
