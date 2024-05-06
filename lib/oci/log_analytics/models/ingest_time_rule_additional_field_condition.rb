# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200601
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The additional field condition(s) to evaluate for an ingest time rule.
  class LogAnalytics::Models::IngestTimeRuleAdditionalFieldCondition
    CONDITION_OPERATOR_ENUM = [
      CONDITION_OPERATOR_CONTAINS = 'CONTAINS'.freeze,
      CONDITION_OPERATOR_CONTAINS_IGNORE_CASE = 'CONTAINS_IGNORE_CASE'.freeze,
      CONDITION_OPERATOR_CONTAINS_REGEX = 'CONTAINS_REGEX'.freeze,
      CONDITION_OPERATOR_CONTAINS_ONEOF_REGEXES = 'CONTAINS_ONEOF_REGEXES'.freeze,
      CONDITION_OPERATOR_ENDS_WITH = 'ENDS_WITH'.freeze,
      CONDITION_OPERATOR_EQUAL = 'EQUAL'.freeze,
      CONDITION_OPERATOR_EQUAL_IGNORE_CASE = 'EQUAL_IGNORE_CASE'.freeze,
      CONDITION_OPERATOR_IN = 'IN'.freeze,
      CONDITION_OPERATOR_IN_IGNORE_CASE = 'IN_IGNORE_CASE'.freeze,
      CONDITION_OPERATOR_NOT_CONTAINS = 'NOT_CONTAINS'.freeze,
      CONDITION_OPERATOR_NOT_EQUAL = 'NOT_EQUAL'.freeze,
      CONDITION_OPERATOR_NOT_IN = 'NOT_IN'.freeze,
      CONDITION_OPERATOR_NOT_NULL = 'NOT_NULL'.freeze,
      CONDITION_OPERATOR_STARTS_WITH = 'STARTS_WITH'.freeze,
      CONDITION_OPERATOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The additional field name to be evaluated.
    # @return [String]
    attr_accessor :condition_field

    # **[Required]** The operator to be used for evaluating the additional field.
    # @return [String]
    attr_reader :condition_operator

    # **[Required]** The additional field value to be evaluated.
    # @return [String]
    attr_accessor :condition_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'condition_field': :'conditionField',
        'condition_operator': :'conditionOperator',
        'condition_value': :'conditionValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'condition_field': :'String',
        'condition_operator': :'String',
        'condition_value': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :condition_field The value to assign to the {#condition_field} property
    # @option attributes [String] :condition_operator The value to assign to the {#condition_operator} property
    # @option attributes [String] :condition_value The value to assign to the {#condition_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.condition_field = attributes[:'conditionField'] if attributes[:'conditionField']

      raise 'You cannot provide both :conditionField and :condition_field' if attributes.key?(:'conditionField') && attributes.key?(:'condition_field')

      self.condition_field = attributes[:'condition_field'] if attributes[:'condition_field']

      self.condition_operator = attributes[:'conditionOperator'] if attributes[:'conditionOperator']

      raise 'You cannot provide both :conditionOperator and :condition_operator' if attributes.key?(:'conditionOperator') && attributes.key?(:'condition_operator')

      self.condition_operator = attributes[:'condition_operator'] if attributes[:'condition_operator']

      self.condition_value = attributes[:'conditionValue'] if attributes[:'conditionValue']

      raise 'You cannot provide both :conditionValue and :condition_value' if attributes.key?(:'conditionValue') && attributes.key?(:'condition_value')

      self.condition_value = attributes[:'condition_value'] if attributes[:'condition_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] condition_operator Object to be assigned
    def condition_operator=(condition_operator)
      # rubocop:disable Style/ConditionalAssignment
      if condition_operator && !CONDITION_OPERATOR_ENUM.include?(condition_operator)
        OCI.logger.debug("Unknown value for 'condition_operator' [" + condition_operator + "]. Mapping to 'CONDITION_OPERATOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @condition_operator = CONDITION_OPERATOR_UNKNOWN_ENUM_VALUE
      else
        @condition_operator = condition_operator
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        condition_field == other.condition_field &&
        condition_operator == other.condition_operator &&
        condition_value == other.condition_value
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
      [condition_field, condition_operator, condition_value].hash
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