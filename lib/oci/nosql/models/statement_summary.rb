# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information derived from parsing a NoSQL SQL statement.
  class Nosql::Models::StatementSummary
    OPERATION_ENUM = [
      OPERATION_CREATE_TABLE = 'CREATE_TABLE'.freeze,
      OPERATION_ALTER_TABLE = 'ALTER_TABLE'.freeze,
      OPERATION_DROP_TABLE = 'DROP_TABLE'.freeze,
      OPERATION_CREATE_INDEX = 'CREATE_INDEX'.freeze,
      OPERATION_DROP_INDEX = 'DROP_INDEX'.freeze,
      OPERATION_SELECT = 'SELECT'.freeze,
      OPERATION_UPDATE = 'UPDATE'.freeze,
      OPERATION_INSERT = 'INSERT'.freeze,
      OPERATION_DELETE = 'DELETE'.freeze,
      OPERATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The operation represented in the statement, e.g. CREATE_TABLE.
    #
    # @return [String]
    attr_reader :operation

    # The table name from the SQL statement.
    # @return [String]
    attr_accessor :table_name

    # The index name from the SQL statement, if present.
    # @return [String]
    attr_accessor :index_name

    # True if the statement includes \"IF EXISTS.\"
    # @return [BOOLEAN]
    attr_accessor :is_if_exists

    # True if the statement includes \"IF NOT EXISTS.\"
    # @return [BOOLEAN]
    attr_accessor :is_if_not_exists

    # If present, indicates a syntax error in the statement.
    # @return [String]
    attr_accessor :syntax_error

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation': :'operation',
        'table_name': :'tableName',
        'index_name': :'indexName',
        'is_if_exists': :'isIfExists',
        'is_if_not_exists': :'isIfNotExists',
        'syntax_error': :'syntaxError'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation': :'String',
        'table_name': :'String',
        'index_name': :'String',
        'is_if_exists': :'BOOLEAN',
        'is_if_not_exists': :'BOOLEAN',
        'syntax_error': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation The value to assign to the {#operation} property
    # @option attributes [String] :table_name The value to assign to the {#table_name} property
    # @option attributes [String] :index_name The value to assign to the {#index_name} property
    # @option attributes [BOOLEAN] :is_if_exists The value to assign to the {#is_if_exists} property
    # @option attributes [BOOLEAN] :is_if_not_exists The value to assign to the {#is_if_not_exists} property
    # @option attributes [String] :syntax_error The value to assign to the {#syntax_error} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operation = attributes[:'operation'] if attributes[:'operation']

      self.table_name = attributes[:'tableName'] if attributes[:'tableName']

      raise 'You cannot provide both :tableName and :table_name' if attributes.key?(:'tableName') && attributes.key?(:'table_name')

      self.table_name = attributes[:'table_name'] if attributes[:'table_name']

      self.index_name = attributes[:'indexName'] if attributes[:'indexName']

      raise 'You cannot provide both :indexName and :index_name' if attributes.key?(:'indexName') && attributes.key?(:'index_name')

      self.index_name = attributes[:'index_name'] if attributes[:'index_name']

      self.is_if_exists = attributes[:'isIfExists'] unless attributes[:'isIfExists'].nil?

      raise 'You cannot provide both :isIfExists and :is_if_exists' if attributes.key?(:'isIfExists') && attributes.key?(:'is_if_exists')

      self.is_if_exists = attributes[:'is_if_exists'] unless attributes[:'is_if_exists'].nil?

      self.is_if_not_exists = attributes[:'isIfNotExists'] unless attributes[:'isIfNotExists'].nil?

      raise 'You cannot provide both :isIfNotExists and :is_if_not_exists' if attributes.key?(:'isIfNotExists') && attributes.key?(:'is_if_not_exists')

      self.is_if_not_exists = attributes[:'is_if_not_exists'] unless attributes[:'is_if_not_exists'].nil?

      self.syntax_error = attributes[:'syntaxError'] if attributes[:'syntaxError']

      raise 'You cannot provide both :syntaxError and :syntax_error' if attributes.key?(:'syntaxError') && attributes.key?(:'syntax_error')

      self.syntax_error = attributes[:'syntax_error'] if attributes[:'syntax_error']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation Object to be assigned
    def operation=(operation)
      # rubocop:disable Style/ConditionalAssignment
      if operation && !OPERATION_ENUM.include?(operation)
        OCI.logger.debug("Unknown value for 'operation' [" + operation + "]. Mapping to 'OPERATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation = OPERATION_UNKNOWN_ENUM_VALUE
      else
        @operation = operation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation == other.operation &&
        table_name == other.table_name &&
        index_name == other.index_name &&
        is_if_exists == other.is_if_exists &&
        is_if_not_exists == other.is_if_not_exists &&
        syntax_error == other.syntax_error
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
      [operation, table_name, index_name, is_if_exists, is_if_not_exists, syntax_error].hash
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
