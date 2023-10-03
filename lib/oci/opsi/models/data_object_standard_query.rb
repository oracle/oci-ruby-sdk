# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require_relative 'data_object_query'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information required to execute query on data objects. Query is given in standard SQL syntax providing flexibility
  # to form complex queries such as queries with joins and nested queries.
  #
  class Opsi::Models::DataObjectStandardQuery < Opsi::Models::DataObjectQuery
    # SQL query statement with standard Oracle supported SQL syntax.
    # - When Warehouse (e.g: Awr hub) data objects are queried, use the actual names of underlying data objects (e.g: tables, views) in the query.
    # The same query that works through JDBC connection with the OperationsInsightsWarehouseUsers credentials will work here and vice-versa.
    # SCHEMA.VIEW syntax can also be used here.
    # - When OPSI data objects are queried, use name of the respective OPSI data object, just like how views are used in a query.
    # Identifier of the OPSI data object cannot be used in the query.
    #
    # @return [String]
    attr_accessor :statement

    # @return [OCI::Opsi::Models::DataObjectQueryTimeFilters]
    attr_accessor :time_filters

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'query_type': :'queryType',
        'bind_params': :'bindParams',
        'query_execution_timeout_in_seconds': :'queryExecutionTimeoutInSeconds',
        'statement': :'statement',
        'time_filters': :'timeFilters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'query_type': :'String',
        'bind_params': :'Array<OCI::Opsi::Models::DataObjectBindParameter>',
        'query_execution_timeout_in_seconds': :'Float',
        'statement': :'String',
        'time_filters': :'OCI::Opsi::Models::DataObjectQueryTimeFilters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Opsi::Models::DataObjectBindParameter>] :bind_params The value to assign to the {OCI::Opsi::Models::DataObjectQuery#bind_params #bind_params} proprety
    # @option attributes [Float] :query_execution_timeout_in_seconds The value to assign to the {OCI::Opsi::Models::DataObjectQuery#query_execution_timeout_in_seconds #query_execution_timeout_in_seconds} proprety
    # @option attributes [String] :statement The value to assign to the {#statement} property
    # @option attributes [OCI::Opsi::Models::DataObjectQueryTimeFilters] :time_filters The value to assign to the {#time_filters} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['queryType'] = 'STANDARD_QUERY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.statement = attributes[:'statement'] if attributes[:'statement']

      self.time_filters = attributes[:'timeFilters'] if attributes[:'timeFilters']

      raise 'You cannot provide both :timeFilters and :time_filters' if attributes.key?(:'timeFilters') && attributes.key?(:'time_filters')

      self.time_filters = attributes[:'time_filters'] if attributes[:'time_filters']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        query_type == other.query_type &&
        bind_params == other.bind_params &&
        query_execution_timeout_in_seconds == other.query_execution_timeout_in_seconds &&
        statement == other.statement &&
        time_filters == other.time_filters
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
      [query_type, bind_params, query_execution_timeout_in_seconds, statement, time_filters].hash
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
