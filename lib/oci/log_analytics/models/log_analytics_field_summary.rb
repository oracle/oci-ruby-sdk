# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # summary of fields
  class LogAnalytics::Models::LogAnalyticsFieldSummary
    # The name this field is given in the common event expression standard from mitre.org.
    # This is used for reference when exporting content conforming to CEE standard
    #
    # @return [String]
    attr_accessor :cee_alias

    # data type
    # @return [String]
    attr_accessor :data_type

    # default regular expression
    # @return [String]
    attr_accessor :regular_expression

    # description
    # @return [String]
    attr_accessor :description

    # display name
    # @return [String]
    attr_accessor :display_name

    # edit version
    # @return [Integer]
    attr_accessor :edit_version

    # facet priority
    # @return [Integer]
    attr_accessor :facet_priority

    # internal name
    # @return [String]
    attr_accessor :name

    # is facet eligible flag
    # @return [BOOLEAN]
    attr_accessor :is_facet_eligible

    # is high cardinality flag
    # @return [BOOLEAN]
    attr_accessor :is_high_cardinality

    # is larget data flag
    # @return [BOOLEAN]
    attr_accessor :is_large_data

    # is multi-valued flag
    # @return [BOOLEAN]
    attr_accessor :is_multi_valued

    # is primary flag
    # @return [BOOLEAN]
    attr_accessor :is_primary

    # is system flag
    # @return [BOOLEAN]
    attr_accessor :is_system

    # is summarizable flag
    # @return [BOOLEAN]
    attr_accessor :is_summarizable

    # mappable
    # @return [String]
    attr_accessor :mapped_value

    # metric key eligible
    # @return [BOOLEAN]
    attr_accessor :is_metric_key_eligible

    # metric value eligible
    # @return [BOOLEAN]
    attr_accessor :is_metric_value_eligible

    # range facet eligible
    # @return [Integer]
    attr_accessor :range_facet_eligible

    # table eligible
    # @return [BOOLEAN]
    attr_accessor :is_table_eligible

    # unit type
    # @return [String]
    attr_accessor :unit_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cee_alias': :'ceeAlias',
        'data_type': :'dataType',
        'regular_expression': :'regularExpression',
        'description': :'description',
        'display_name': :'displayName',
        'edit_version': :'editVersion',
        'facet_priority': :'facetPriority',
        'name': :'name',
        'is_facet_eligible': :'isFacetEligible',
        'is_high_cardinality': :'isHighCardinality',
        'is_large_data': :'isLargeData',
        'is_multi_valued': :'isMultiValued',
        'is_primary': :'isPrimary',
        'is_system': :'isSystem',
        'is_summarizable': :'isSummarizable',
        'mapped_value': :'mappedValue',
        'is_metric_key_eligible': :'isMetricKeyEligible',
        'is_metric_value_eligible': :'isMetricValueEligible',
        'range_facet_eligible': :'rangeFacetEligible',
        'is_table_eligible': :'isTableEligible',
        'unit_type': :'unitType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cee_alias': :'String',
        'data_type': :'String',
        'regular_expression': :'String',
        'description': :'String',
        'display_name': :'String',
        'edit_version': :'Integer',
        'facet_priority': :'Integer',
        'name': :'String',
        'is_facet_eligible': :'BOOLEAN',
        'is_high_cardinality': :'BOOLEAN',
        'is_large_data': :'BOOLEAN',
        'is_multi_valued': :'BOOLEAN',
        'is_primary': :'BOOLEAN',
        'is_system': :'BOOLEAN',
        'is_summarizable': :'BOOLEAN',
        'mapped_value': :'String',
        'is_metric_key_eligible': :'BOOLEAN',
        'is_metric_value_eligible': :'BOOLEAN',
        'range_facet_eligible': :'Integer',
        'is_table_eligible': :'BOOLEAN',
        'unit_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cee_alias The value to assign to the {#cee_alias} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [String] :regular_expression The value to assign to the {#regular_expression} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [Integer] :facet_priority The value to assign to the {#facet_priority} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [BOOLEAN] :is_facet_eligible The value to assign to the {#is_facet_eligible} property
    # @option attributes [BOOLEAN] :is_high_cardinality The value to assign to the {#is_high_cardinality} property
    # @option attributes [BOOLEAN] :is_large_data The value to assign to the {#is_large_data} property
    # @option attributes [BOOLEAN] :is_multi_valued The value to assign to the {#is_multi_valued} property
    # @option attributes [BOOLEAN] :is_primary The value to assign to the {#is_primary} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [BOOLEAN] :is_summarizable The value to assign to the {#is_summarizable} property
    # @option attributes [String] :mapped_value The value to assign to the {#mapped_value} property
    # @option attributes [BOOLEAN] :is_metric_key_eligible The value to assign to the {#is_metric_key_eligible} property
    # @option attributes [BOOLEAN] :is_metric_value_eligible The value to assign to the {#is_metric_value_eligible} property
    # @option attributes [Integer] :range_facet_eligible The value to assign to the {#range_facet_eligible} property
    # @option attributes [BOOLEAN] :is_table_eligible The value to assign to the {#is_table_eligible} property
    # @option attributes [String] :unit_type The value to assign to the {#unit_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.cee_alias = attributes[:'ceeAlias'] if attributes[:'ceeAlias']

      raise 'You cannot provide both :ceeAlias and :cee_alias' if attributes.key?(:'ceeAlias') && attributes.key?(:'cee_alias')

      self.cee_alias = attributes[:'cee_alias'] if attributes[:'cee_alias']

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.regular_expression = attributes[:'regularExpression'] if attributes[:'regularExpression']

      raise 'You cannot provide both :regularExpression and :regular_expression' if attributes.key?(:'regularExpression') && attributes.key?(:'regular_expression')

      self.regular_expression = attributes[:'regular_expression'] if attributes[:'regular_expression']

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.facet_priority = attributes[:'facetPriority'] if attributes[:'facetPriority']

      raise 'You cannot provide both :facetPriority and :facet_priority' if attributes.key?(:'facetPriority') && attributes.key?(:'facet_priority')

      self.facet_priority = attributes[:'facet_priority'] if attributes[:'facet_priority']

      self.name = attributes[:'name'] if attributes[:'name']

      self.is_facet_eligible = attributes[:'isFacetEligible'] unless attributes[:'isFacetEligible'].nil?

      raise 'You cannot provide both :isFacetEligible and :is_facet_eligible' if attributes.key?(:'isFacetEligible') && attributes.key?(:'is_facet_eligible')

      self.is_facet_eligible = attributes[:'is_facet_eligible'] unless attributes[:'is_facet_eligible'].nil?

      self.is_high_cardinality = attributes[:'isHighCardinality'] unless attributes[:'isHighCardinality'].nil?

      raise 'You cannot provide both :isHighCardinality and :is_high_cardinality' if attributes.key?(:'isHighCardinality') && attributes.key?(:'is_high_cardinality')

      self.is_high_cardinality = attributes[:'is_high_cardinality'] unless attributes[:'is_high_cardinality'].nil?

      self.is_large_data = attributes[:'isLargeData'] unless attributes[:'isLargeData'].nil?

      raise 'You cannot provide both :isLargeData and :is_large_data' if attributes.key?(:'isLargeData') && attributes.key?(:'is_large_data')

      self.is_large_data = attributes[:'is_large_data'] unless attributes[:'is_large_data'].nil?

      self.is_multi_valued = attributes[:'isMultiValued'] unless attributes[:'isMultiValued'].nil?

      raise 'You cannot provide both :isMultiValued and :is_multi_valued' if attributes.key?(:'isMultiValued') && attributes.key?(:'is_multi_valued')

      self.is_multi_valued = attributes[:'is_multi_valued'] unless attributes[:'is_multi_valued'].nil?

      self.is_primary = attributes[:'isPrimary'] unless attributes[:'isPrimary'].nil?

      raise 'You cannot provide both :isPrimary and :is_primary' if attributes.key?(:'isPrimary') && attributes.key?(:'is_primary')

      self.is_primary = attributes[:'is_primary'] unless attributes[:'is_primary'].nil?

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.is_summarizable = attributes[:'isSummarizable'] unless attributes[:'isSummarizable'].nil?

      raise 'You cannot provide both :isSummarizable and :is_summarizable' if attributes.key?(:'isSummarizable') && attributes.key?(:'is_summarizable')

      self.is_summarizable = attributes[:'is_summarizable'] unless attributes[:'is_summarizable'].nil?

      self.mapped_value = attributes[:'mappedValue'] if attributes[:'mappedValue']

      raise 'You cannot provide both :mappedValue and :mapped_value' if attributes.key?(:'mappedValue') && attributes.key?(:'mapped_value')

      self.mapped_value = attributes[:'mapped_value'] if attributes[:'mapped_value']

      self.is_metric_key_eligible = attributes[:'isMetricKeyEligible'] unless attributes[:'isMetricKeyEligible'].nil?

      raise 'You cannot provide both :isMetricKeyEligible and :is_metric_key_eligible' if attributes.key?(:'isMetricKeyEligible') && attributes.key?(:'is_metric_key_eligible')

      self.is_metric_key_eligible = attributes[:'is_metric_key_eligible'] unless attributes[:'is_metric_key_eligible'].nil?

      self.is_metric_value_eligible = attributes[:'isMetricValueEligible'] unless attributes[:'isMetricValueEligible'].nil?

      raise 'You cannot provide both :isMetricValueEligible and :is_metric_value_eligible' if attributes.key?(:'isMetricValueEligible') && attributes.key?(:'is_metric_value_eligible')

      self.is_metric_value_eligible = attributes[:'is_metric_value_eligible'] unless attributes[:'is_metric_value_eligible'].nil?

      self.range_facet_eligible = attributes[:'rangeFacetEligible'] if attributes[:'rangeFacetEligible']

      raise 'You cannot provide both :rangeFacetEligible and :range_facet_eligible' if attributes.key?(:'rangeFacetEligible') && attributes.key?(:'range_facet_eligible')

      self.range_facet_eligible = attributes[:'range_facet_eligible'] if attributes[:'range_facet_eligible']

      self.is_table_eligible = attributes[:'isTableEligible'] unless attributes[:'isTableEligible'].nil?

      raise 'You cannot provide both :isTableEligible and :is_table_eligible' if attributes.key?(:'isTableEligible') && attributes.key?(:'is_table_eligible')

      self.is_table_eligible = attributes[:'is_table_eligible'] unless attributes[:'is_table_eligible'].nil?

      self.unit_type = attributes[:'unitType'] if attributes[:'unitType']

      raise 'You cannot provide both :unitType and :unit_type' if attributes.key?(:'unitType') && attributes.key?(:'unit_type')

      self.unit_type = attributes[:'unit_type'] if attributes[:'unit_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cee_alias == other.cee_alias &&
        data_type == other.data_type &&
        regular_expression == other.regular_expression &&
        description == other.description &&
        display_name == other.display_name &&
        edit_version == other.edit_version &&
        facet_priority == other.facet_priority &&
        name == other.name &&
        is_facet_eligible == other.is_facet_eligible &&
        is_high_cardinality == other.is_high_cardinality &&
        is_large_data == other.is_large_data &&
        is_multi_valued == other.is_multi_valued &&
        is_primary == other.is_primary &&
        is_system == other.is_system &&
        is_summarizable == other.is_summarizable &&
        mapped_value == other.mapped_value &&
        is_metric_key_eligible == other.is_metric_key_eligible &&
        is_metric_value_eligible == other.is_metric_value_eligible &&
        range_facet_eligible == other.range_facet_eligible &&
        is_table_eligible == other.is_table_eligible &&
        unit_type == other.unit_type
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
      [cee_alias, data_type, regular_expression, description, display_name, edit_version, facet_priority, name, is_facet_eligible, is_high_cardinality, is_large_data, is_multi_valued, is_primary, is_system, is_summarizable, mapped_value, is_metric_key_eligible, is_metric_value_eligible, range_facet_eligible, is_table_eligible, unit_type].hash
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
