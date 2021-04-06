# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Query results.
  #
  class LogAnalytics::Models::QueryAggregation
    # Number of rows query retrieved. Up to maxTotalCount limit.
    #
    # @return [Integer]
    attr_accessor :total_count

    # Number of rows matched by query.
    #
    # @return [Integer]
    attr_accessor :total_matched_count

    # True if query did not complete processing all data.
    #
    # @return [BOOLEAN]
    attr_accessor :are_partial_results

    # Explanation of why results may be partial. Only set if arePartialResults is true.
    #
    # @return [String]
    attr_accessor :partial_result_reason

    # Query result columns
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractColumn>]
    attr_accessor :columns

    # Query result fields
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractColumn>]
    attr_accessor :fields

    # Query result data
    #
    # @return [Array<Hash<String, Object>>]
    attr_accessor :items

    # Time ellapsed executing query in milli-seconds.
    #
    # @return [Integer]
    attr_accessor :query_execution_time_in_ms

    # **[Required]** Percentage progress completion of the query.
    #
    # @return [Integer]
    attr_accessor :percent_complete

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'total_count': :'totalCount',
        'total_matched_count': :'totalMatchedCount',
        'are_partial_results': :'arePartialResults',
        'partial_result_reason': :'partialResultReason',
        'columns': :'columns',
        'fields': :'fields',
        'items': :'items',
        'query_execution_time_in_ms': :'queryExecutionTimeInMs',
        'percent_complete': :'percentComplete'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'total_count': :'Integer',
        'total_matched_count': :'Integer',
        'are_partial_results': :'BOOLEAN',
        'partial_result_reason': :'String',
        'columns': :'Array<OCI::LogAnalytics::Models::AbstractColumn>',
        'fields': :'Array<OCI::LogAnalytics::Models::AbstractColumn>',
        'items': :'Array<Hash<String, Object>>',
        'query_execution_time_in_ms': :'Integer',
        'percent_complete': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :total_count The value to assign to the {#total_count} property
    # @option attributes [Integer] :total_matched_count The value to assign to the {#total_matched_count} property
    # @option attributes [BOOLEAN] :are_partial_results The value to assign to the {#are_partial_results} property
    # @option attributes [String] :partial_result_reason The value to assign to the {#partial_result_reason} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractColumn>] :columns The value to assign to the {#columns} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractColumn>] :fields The value to assign to the {#fields} property
    # @option attributes [Array<Hash<String, Object>>] :items The value to assign to the {#items} property
    # @option attributes [Integer] :query_execution_time_in_ms The value to assign to the {#query_execution_time_in_ms} property
    # @option attributes [Integer] :percent_complete The value to assign to the {#percent_complete} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.total_count = attributes[:'totalCount'] if attributes[:'totalCount']

      raise 'You cannot provide both :totalCount and :total_count' if attributes.key?(:'totalCount') && attributes.key?(:'total_count')

      self.total_count = attributes[:'total_count'] if attributes[:'total_count']

      self.total_matched_count = attributes[:'totalMatchedCount'] if attributes[:'totalMatchedCount']

      raise 'You cannot provide both :totalMatchedCount and :total_matched_count' if attributes.key?(:'totalMatchedCount') && attributes.key?(:'total_matched_count')

      self.total_matched_count = attributes[:'total_matched_count'] if attributes[:'total_matched_count']

      self.are_partial_results = attributes[:'arePartialResults'] unless attributes[:'arePartialResults'].nil?

      raise 'You cannot provide both :arePartialResults and :are_partial_results' if attributes.key?(:'arePartialResults') && attributes.key?(:'are_partial_results')

      self.are_partial_results = attributes[:'are_partial_results'] unless attributes[:'are_partial_results'].nil?

      self.partial_result_reason = attributes[:'partialResultReason'] if attributes[:'partialResultReason']

      raise 'You cannot provide both :partialResultReason and :partial_result_reason' if attributes.key?(:'partialResultReason') && attributes.key?(:'partial_result_reason')

      self.partial_result_reason = attributes[:'partial_result_reason'] if attributes[:'partial_result_reason']

      self.columns = attributes[:'columns'] if attributes[:'columns']

      self.fields = attributes[:'fields'] if attributes[:'fields']

      self.items = attributes[:'items'] if attributes[:'items']

      self.query_execution_time_in_ms = attributes[:'queryExecutionTimeInMs'] if attributes[:'queryExecutionTimeInMs']

      raise 'You cannot provide both :queryExecutionTimeInMs and :query_execution_time_in_ms' if attributes.key?(:'queryExecutionTimeInMs') && attributes.key?(:'query_execution_time_in_ms')

      self.query_execution_time_in_ms = attributes[:'query_execution_time_in_ms'] if attributes[:'query_execution_time_in_ms']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        total_count == other.total_count &&
        total_matched_count == other.total_matched_count &&
        are_partial_results == other.are_partial_results &&
        partial_result_reason == other.partial_result_reason &&
        columns == other.columns &&
        fields == other.fields &&
        items == other.items &&
        query_execution_time_in_ms == other.query_execution_time_in_ms &&
        percent_complete == other.percent_complete
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
      [total_count, total_matched_count, are_partial_results, partial_result_reason, columns, fields, items, query_execution_time_in_ms, percent_complete].hash
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
