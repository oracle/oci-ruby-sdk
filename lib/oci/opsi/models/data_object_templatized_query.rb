# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'data_object_query'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information required in a structured template to form and execute query on a data object.
  class Opsi::Models::DataObjectTemplatizedQuery < Opsi::Models::DataObjectQuery
    # List of items to be added into the SELECT clause of the query; items will be added with comma separation.
    # @return [Array<String>]
    attr_accessor :select_list

    # List of items to be added into the WHERE clause of the query; items will be added with AND separation.
    # Item can contain a single condition or multiple conditions.
    # Single condition e.g:  \"optimizer_mode='mode1'\"
    # Multiple conditions e.g: (module='module1' OR module='module2')
    #
    # @return [Array<String>]
    attr_accessor :where_conditions_list

    # List of items to be added into the GROUP BY clause of the query; items will be added with comma separation.
    # @return [Array<String>]
    attr_accessor :group_by_list

    # List of items to be added into the HAVING clause of the query; items will be added with AND separation.
    # @return [Array<String>]
    attr_accessor :having_conditions_list

    # List of items to be added into the ORDER BY clause of the query; items will be added with comma separation.
    # @return [Array<String>]
    attr_accessor :order_by_list

    # @return [OCI::Opsi::Models::DataObjectQueryTimeFilters]
    attr_accessor :time_filters

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'query_type': :'queryType',
        'select_list': :'selectList',
        'where_conditions_list': :'whereConditionsList',
        'group_by_list': :'groupByList',
        'having_conditions_list': :'havingConditionsList',
        'order_by_list': :'orderByList',
        'time_filters': :'timeFilters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'query_type': :'String',
        'select_list': :'Array<String>',
        'where_conditions_list': :'Array<String>',
        'group_by_list': :'Array<String>',
        'having_conditions_list': :'Array<String>',
        'order_by_list': :'Array<String>',
        'time_filters': :'OCI::Opsi::Models::DataObjectQueryTimeFilters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :select_list The value to assign to the {#select_list} property
    # @option attributes [Array<String>] :where_conditions_list The value to assign to the {#where_conditions_list} property
    # @option attributes [Array<String>] :group_by_list The value to assign to the {#group_by_list} property
    # @option attributes [Array<String>] :having_conditions_list The value to assign to the {#having_conditions_list} property
    # @option attributes [Array<String>] :order_by_list The value to assign to the {#order_by_list} property
    # @option attributes [OCI::Opsi::Models::DataObjectQueryTimeFilters] :time_filters The value to assign to the {#time_filters} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['queryType'] = 'TEMPLATIZED_QUERY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.select_list = attributes[:'selectList'] if attributes[:'selectList']

      raise 'You cannot provide both :selectList and :select_list' if attributes.key?(:'selectList') && attributes.key?(:'select_list')

      self.select_list = attributes[:'select_list'] if attributes[:'select_list']

      self.where_conditions_list = attributes[:'whereConditionsList'] if attributes[:'whereConditionsList']

      raise 'You cannot provide both :whereConditionsList and :where_conditions_list' if attributes.key?(:'whereConditionsList') && attributes.key?(:'where_conditions_list')

      self.where_conditions_list = attributes[:'where_conditions_list'] if attributes[:'where_conditions_list']

      self.group_by_list = attributes[:'groupByList'] if attributes[:'groupByList']

      raise 'You cannot provide both :groupByList and :group_by_list' if attributes.key?(:'groupByList') && attributes.key?(:'group_by_list')

      self.group_by_list = attributes[:'group_by_list'] if attributes[:'group_by_list']

      self.having_conditions_list = attributes[:'havingConditionsList'] if attributes[:'havingConditionsList']

      raise 'You cannot provide both :havingConditionsList and :having_conditions_list' if attributes.key?(:'havingConditionsList') && attributes.key?(:'having_conditions_list')

      self.having_conditions_list = attributes[:'having_conditions_list'] if attributes[:'having_conditions_list']

      self.order_by_list = attributes[:'orderByList'] if attributes[:'orderByList']

      raise 'You cannot provide both :orderByList and :order_by_list' if attributes.key?(:'orderByList') && attributes.key?(:'order_by_list')

      self.order_by_list = attributes[:'order_by_list'] if attributes[:'order_by_list']

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
        select_list == other.select_list &&
        where_conditions_list == other.where_conditions_list &&
        group_by_list == other.group_by_list &&
        having_conditions_list == other.having_conditions_list &&
        order_by_list == other.order_by_list &&
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
      [query_type, select_list, where_conditions_list, group_by_list, having_conditions_list, order_by_list, time_filters].hash
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
