# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A response containing a collection of query rows (selected attributes and aggregations) filtered, grouped and
  # sorted by the specified criteria from the query that is run, and the associated summary describing the corresponding
  # query result metadata.
  #
  class ApmTraces::Models::QueryResultResponse
    # This attribute is required.
    # @return [OCI::ApmTraces::Models::QueryResultMetadataSummary]
    attr_accessor :query_result_metadata_summary

    # **[Required]** A collection of objects with each object representing an individual row of the query result set.  The total number of objects
    # returned in this collection correspond to the total number of rows returned by the actual query that is run against
    # the queried entity.
    #
    # @return [Array<OCI::ApmTraces::Models::QueryResultRow>]
    attr_accessor :query_result_rows

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'query_result_metadata_summary': :'queryResultMetadataSummary',
        'query_result_rows': :'queryResultRows'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'query_result_metadata_summary': :'OCI::ApmTraces::Models::QueryResultMetadataSummary',
        'query_result_rows': :'Array<OCI::ApmTraces::Models::QueryResultRow>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::ApmTraces::Models::QueryResultMetadataSummary] :query_result_metadata_summary The value to assign to the {#query_result_metadata_summary} property
    # @option attributes [Array<OCI::ApmTraces::Models::QueryResultRow>] :query_result_rows The value to assign to the {#query_result_rows} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.query_result_metadata_summary = attributes[:'queryResultMetadataSummary'] if attributes[:'queryResultMetadataSummary']

      raise 'You cannot provide both :queryResultMetadataSummary and :query_result_metadata_summary' if attributes.key?(:'queryResultMetadataSummary') && attributes.key?(:'query_result_metadata_summary')

      self.query_result_metadata_summary = attributes[:'query_result_metadata_summary'] if attributes[:'query_result_metadata_summary']

      self.query_result_rows = attributes[:'queryResultRows'] if attributes[:'queryResultRows']

      raise 'You cannot provide both :queryResultRows and :query_result_rows' if attributes.key?(:'queryResultRows') && attributes.key?(:'query_result_rows')

      self.query_result_rows = attributes[:'query_result_rows'] if attributes[:'query_result_rows']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        query_result_metadata_summary == other.query_result_metadata_summary &&
        query_result_rows == other.query_result_rows
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
      [query_result_metadata_summary, query_result_rows].hash
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
