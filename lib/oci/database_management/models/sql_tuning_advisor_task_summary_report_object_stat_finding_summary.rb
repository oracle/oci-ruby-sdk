# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary for all the statistic findings of an object in a SQL Tuning Advisor task. Includes the object's hash, name, type, schema, problem type and the object reference count.
  class DatabaseManagement::Models::SqlTuningAdvisorTaskSummaryReportObjectStatFindingSummary
    PROBLEM_TYPE_ENUM = [
      PROBLEM_TYPE_MISSING = 'MISSING'.freeze,
      PROBLEM_TYPE_STALE = 'STALE'.freeze,
      PROBLEM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Numerical representation of the object.
    # @return [Integer]
    attr_accessor :object_hash_value

    # **[Required]** Name of the object.
    # @return [String]
    attr_accessor :object_name

    # **[Required]** Type of the object.
    # @return [String]
    attr_accessor :object_type

    # **[Required]** Schema of the object.
    # @return [String]
    attr_accessor :schema

    # **[Required]** Type of statistics problem related to the object.
    # @return [String]
    attr_reader :problem_type

    # **[Required]** The number of the times the object is referenced within the SQL Tuning advisor task findings.
    # @return [Integer]
    attr_accessor :reference_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'object_hash_value': :'objectHashValue',
        'object_name': :'objectName',
        'object_type': :'objectType',
        'schema': :'schema',
        'problem_type': :'problemType',
        'reference_count': :'referenceCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'object_hash_value': :'Integer',
        'object_name': :'String',
        'object_type': :'String',
        'schema': :'String',
        'problem_type': :'String',
        'reference_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :object_hash_value The value to assign to the {#object_hash_value} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :schema The value to assign to the {#schema} property
    # @option attributes [String] :problem_type The value to assign to the {#problem_type} property
    # @option attributes [Integer] :reference_count The value to assign to the {#reference_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.object_hash_value = attributes[:'objectHashValue'] if attributes[:'objectHashValue']

      raise 'You cannot provide both :objectHashValue and :object_hash_value' if attributes.key?(:'objectHashValue') && attributes.key?(:'object_hash_value')

      self.object_hash_value = attributes[:'object_hash_value'] if attributes[:'object_hash_value']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.schema = attributes[:'schema'] if attributes[:'schema']

      self.problem_type = attributes[:'problemType'] if attributes[:'problemType']

      raise 'You cannot provide both :problemType and :problem_type' if attributes.key?(:'problemType') && attributes.key?(:'problem_type')

      self.problem_type = attributes[:'problem_type'] if attributes[:'problem_type']

      self.reference_count = attributes[:'referenceCount'] if attributes[:'referenceCount']

      raise 'You cannot provide both :referenceCount and :reference_count' if attributes.key?(:'referenceCount') && attributes.key?(:'reference_count')

      self.reference_count = attributes[:'reference_count'] if attributes[:'reference_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] problem_type Object to be assigned
    def problem_type=(problem_type)
      # rubocop:disable Style/ConditionalAssignment
      if problem_type && !PROBLEM_TYPE_ENUM.include?(problem_type)
        OCI.logger.debug("Unknown value for 'problem_type' [" + problem_type + "]. Mapping to 'PROBLEM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @problem_type = PROBLEM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @problem_type = problem_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        object_hash_value == other.object_hash_value &&
        object_name == other.object_name &&
        object_type == other.object_type &&
        schema == other.schema &&
        problem_type == other.problem_type &&
        reference_count == other.reference_count
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
      [object_hash_value, object_name, object_type, schema, problem_type, reference_count].hash
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
