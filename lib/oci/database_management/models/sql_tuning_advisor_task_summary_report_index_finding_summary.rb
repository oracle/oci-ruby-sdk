# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary for all the index findings in a SQL Tuning Advisor task. Includes the index's hash value, table name, schema, index name, reference count and index columns
  class DatabaseManagement::Models::SqlTuningAdvisorTaskSummaryReportIndexFindingSummary
    # **[Required]** Numerical representation of the index.
    # @return [Integer]
    attr_accessor :index_hash_value

    # **[Required]** Name of the index.
    # @return [String]
    attr_accessor :index_name

    # **[Required]** Table's name related to the index.
    # @return [String]
    attr_accessor :table_name

    # **[Required]** Schema related to the index.
    # @return [String]
    attr_accessor :schema

    # **[Required]** The number of times the index is referenced within the SQL Tuning advisor task findings.
    # @return [Integer]
    attr_accessor :reference_count

    # **[Required]** Columns of the index.
    # @return [Array<String>]
    attr_accessor :index_columns

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'index_hash_value': :'indexHashValue',
        'index_name': :'indexName',
        'table_name': :'tableName',
        'schema': :'schema',
        'reference_count': :'referenceCount',
        'index_columns': :'indexColumns'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'index_hash_value': :'Integer',
        'index_name': :'String',
        'table_name': :'String',
        'schema': :'String',
        'reference_count': :'Integer',
        'index_columns': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :index_hash_value The value to assign to the {#index_hash_value} property
    # @option attributes [String] :index_name The value to assign to the {#index_name} property
    # @option attributes [String] :table_name The value to assign to the {#table_name} property
    # @option attributes [String] :schema The value to assign to the {#schema} property
    # @option attributes [Integer] :reference_count The value to assign to the {#reference_count} property
    # @option attributes [Array<String>] :index_columns The value to assign to the {#index_columns} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.index_hash_value = attributes[:'indexHashValue'] if attributes[:'indexHashValue']

      raise 'You cannot provide both :indexHashValue and :index_hash_value' if attributes.key?(:'indexHashValue') && attributes.key?(:'index_hash_value')

      self.index_hash_value = attributes[:'index_hash_value'] if attributes[:'index_hash_value']

      self.index_name = attributes[:'indexName'] if attributes[:'indexName']

      raise 'You cannot provide both :indexName and :index_name' if attributes.key?(:'indexName') && attributes.key?(:'index_name')

      self.index_name = attributes[:'index_name'] if attributes[:'index_name']

      self.table_name = attributes[:'tableName'] if attributes[:'tableName']

      raise 'You cannot provide both :tableName and :table_name' if attributes.key?(:'tableName') && attributes.key?(:'table_name')

      self.table_name = attributes[:'table_name'] if attributes[:'table_name']

      self.schema = attributes[:'schema'] if attributes[:'schema']

      self.reference_count = attributes[:'referenceCount'] if attributes[:'referenceCount']

      raise 'You cannot provide both :referenceCount and :reference_count' if attributes.key?(:'referenceCount') && attributes.key?(:'reference_count')

      self.reference_count = attributes[:'reference_count'] if attributes[:'reference_count']

      self.index_columns = attributes[:'indexColumns'] if attributes[:'indexColumns']

      raise 'You cannot provide both :indexColumns and :index_columns' if attributes.key?(:'indexColumns') && attributes.key?(:'index_columns')

      self.index_columns = attributes[:'index_columns'] if attributes[:'index_columns']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        index_hash_value == other.index_hash_value &&
        index_name == other.index_name &&
        table_name == other.table_name &&
        schema == other.schema &&
        reference_count == other.reference_count &&
        index_columns == other.index_columns
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
      [index_hash_value, index_name, table_name, schema, reference_count, index_columns].hash
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
