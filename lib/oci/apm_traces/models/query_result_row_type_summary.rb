# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the datatype, unit and related metadata of an individual row element of a query result row that is returned.
  #
  class ApmTraces::Models::QueryResultRowTypeSummary
    # Datatype of the query result row element.
    #
    # @return [String]
    attr_accessor :data_type

    # Granular unit in which the query result row element's data is represented.
    #
    # @return [String]
    attr_accessor :unit

    # Alias name if an alias is used for the query result row element or an assigned display name from the query language
    # in some default cases.
    #
    # @return [String]
    attr_accessor :display_name

    # Actual show expression in the user typed query that produced this column.
    #
    # @return [String]
    attr_accessor :expression

    # A query result row type summary object that represents a nested table structure.
    #
    # @return [Array<OCI::ApmTraces::Models::QueryResultRowTypeSummary>]
    attr_accessor :query_result_row_type_summaries

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'data_type': :'dataType',
        'unit': :'unit',
        'display_name': :'displayName',
        'expression': :'expression',
        'query_result_row_type_summaries': :'queryResultRowTypeSummaries'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'data_type': :'String',
        'unit': :'String',
        'display_name': :'String',
        'expression': :'String',
        'query_result_row_type_summaries': :'Array<OCI::ApmTraces::Models::QueryResultRowTypeSummary>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [String] :unit The value to assign to the {#unit} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :expression The value to assign to the {#expression} property
    # @option attributes [Array<OCI::ApmTraces::Models::QueryResultRowTypeSummary>] :query_result_row_type_summaries The value to assign to the {#query_result_row_type_summaries} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.unit = attributes[:'unit'] if attributes[:'unit']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.expression = attributes[:'expression'] if attributes[:'expression']

      self.query_result_row_type_summaries = attributes[:'queryResultRowTypeSummaries'] if attributes[:'queryResultRowTypeSummaries']

      raise 'You cannot provide both :queryResultRowTypeSummaries and :query_result_row_type_summaries' if attributes.key?(:'queryResultRowTypeSummaries') && attributes.key?(:'query_result_row_type_summaries')

      self.query_result_row_type_summaries = attributes[:'query_result_row_type_summaries'] if attributes[:'query_result_row_type_summaries']
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
        unit == other.unit &&
        display_name == other.display_name &&
        expression == other.expression &&
        query_result_row_type_summaries == other.query_result_row_type_summaries
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
      [data_type, unit, display_name, expression, query_result_row_type_summaries].hash
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
