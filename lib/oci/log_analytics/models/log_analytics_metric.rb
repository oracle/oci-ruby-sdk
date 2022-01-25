# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsMetric
  class LogAnalytics::Models::LogAnalyticsMetric
    METRIC_TYPE_ENUM = [
      METRIC_TYPE_COUNT = 'COUNT'.freeze,
      METRIC_TYPE_SUM = 'SUM'.freeze,
      METRIC_TYPE_AVERAGE = 'AVERAGE'.freeze,
      METRIC_TYPE_COUNT_DISTRIBUTION = 'COUNT_DISTRIBUTION'.freeze,
      METRIC_TYPE_SUM_DISTRIBUTION = 'SUM_DISTRIBUTION'.freeze,
      METRIC_TYPE_AVERAGE_DISTRIBUTION = 'AVERAGE_DISTRIBUTION'.freeze,
      METRIC_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATOR_ENUM = [
      OPERATOR_CONTAINS_IGNORE_CASE = 'CONTAINS_IGNORE_CASE'.freeze,
      OPERATOR_IN_IGNORE_CASE = 'IN_IGNORE_CASE'.freeze,
      OPERATOR_EQUAL_IGNORE_CASE = 'EQUAL_IGNORE_CASE'.freeze,
      OPERATOR_NOT_NULL = 'NOT_NULL'.freeze,
      OPERATOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The aggregation field.
    # @return [String]
    attr_accessor :aggregation_field

    # The bucket metadata.
    # @return [String]
    attr_accessor :bucket_metadata

    # The clock period.
    # @return [String]
    attr_accessor :clock_period

    # The metric description.
    # @return [String]
    attr_accessor :description

    # The metric edit version.
    # @return [Integer]
    attr_accessor :edit_version

    # The field name.
    # @return [String]
    attr_accessor :field_name

    # The field values.
    # @return [Array<String>]
    attr_accessor :field_values

    # The grouping fields.
    # @return [String]
    attr_accessor :grouping_field

    # A flag inidcating whether or not the metric is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # The metric display name.
    # @return [String]
    attr_accessor :display_name

    # The metric unique identifier.
    # @return [Integer]
    attr_accessor :metric_reference

    # The metric name.
    # @return [String]
    attr_accessor :name

    # The metric type, specifying the type of aggreation to perform.  Default value
    # is COUNT.
    #
    # @return [String]
    attr_reader :metric_type

    # A flag specifying whether or not the metric source is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_metric_source_enabled

    # The metric operator.
    # @return [String]
    attr_reader :operator

    # The metric sources.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSource>]
    attr_accessor :sources

    # The entity type.
    # @return [String]
    attr_accessor :entity_type

    # The last updated date.
    # @return [DateTime]
    attr_accessor :time_updated

    # The unit type.
    # @return [String]
    attr_accessor :unit_type

    # A flag specifying whether or not this is a custom (user defined) metric.
    #
    # @return [BOOLEAN]
    attr_accessor :is_user_customized

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'aggregation_field': :'aggregationField',
        'bucket_metadata': :'bucketMetadata',
        'clock_period': :'clockPeriod',
        'description': :'description',
        'edit_version': :'editVersion',
        'field_name': :'fieldName',
        'field_values': :'fieldValues',
        'grouping_field': :'groupingField',
        'is_enabled': :'isEnabled',
        'is_system': :'isSystem',
        'display_name': :'displayName',
        'metric_reference': :'metricReference',
        'name': :'name',
        'metric_type': :'metricType',
        'is_metric_source_enabled': :'isMetricSourceEnabled',
        'operator': :'operator',
        'sources': :'sources',
        'entity_type': :'entityType',
        'time_updated': :'timeUpdated',
        'unit_type': :'unitType',
        'is_user_customized': :'isUserCustomized'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'aggregation_field': :'String',
        'bucket_metadata': :'String',
        'clock_period': :'String',
        'description': :'String',
        'edit_version': :'Integer',
        'field_name': :'String',
        'field_values': :'Array<String>',
        'grouping_field': :'String',
        'is_enabled': :'BOOLEAN',
        'is_system': :'BOOLEAN',
        'display_name': :'String',
        'metric_reference': :'Integer',
        'name': :'String',
        'metric_type': :'String',
        'is_metric_source_enabled': :'BOOLEAN',
        'operator': :'String',
        'sources': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSource>',
        'entity_type': :'String',
        'time_updated': :'DateTime',
        'unit_type': :'String',
        'is_user_customized': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :aggregation_field The value to assign to the {#aggregation_field} property
    # @option attributes [String] :bucket_metadata The value to assign to the {#bucket_metadata} property
    # @option attributes [String] :clock_period The value to assign to the {#clock_period} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [String] :field_name The value to assign to the {#field_name} property
    # @option attributes [Array<String>] :field_values The value to assign to the {#field_values} property
    # @option attributes [String] :grouping_field The value to assign to the {#grouping_field} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :metric_reference The value to assign to the {#metric_reference} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :metric_type The value to assign to the {#metric_type} property
    # @option attributes [BOOLEAN] :is_metric_source_enabled The value to assign to the {#is_metric_source_enabled} property
    # @option attributes [String] :operator The value to assign to the {#operator} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSource>] :sources The value to assign to the {#sources} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :unit_type The value to assign to the {#unit_type} property
    # @option attributes [BOOLEAN] :is_user_customized The value to assign to the {#is_user_customized} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.aggregation_field = attributes[:'aggregationField'] if attributes[:'aggregationField']

      raise 'You cannot provide both :aggregationField and :aggregation_field' if attributes.key?(:'aggregationField') && attributes.key?(:'aggregation_field')

      self.aggregation_field = attributes[:'aggregation_field'] if attributes[:'aggregation_field']

      self.bucket_metadata = attributes[:'bucketMetadata'] if attributes[:'bucketMetadata']

      raise 'You cannot provide both :bucketMetadata and :bucket_metadata' if attributes.key?(:'bucketMetadata') && attributes.key?(:'bucket_metadata')

      self.bucket_metadata = attributes[:'bucket_metadata'] if attributes[:'bucket_metadata']

      self.clock_period = attributes[:'clockPeriod'] if attributes[:'clockPeriod']

      raise 'You cannot provide both :clockPeriod and :clock_period' if attributes.key?(:'clockPeriod') && attributes.key?(:'clock_period')

      self.clock_period = attributes[:'clock_period'] if attributes[:'clock_period']

      self.description = attributes[:'description'] if attributes[:'description']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.field_name = attributes[:'fieldName'] if attributes[:'fieldName']

      raise 'You cannot provide both :fieldName and :field_name' if attributes.key?(:'fieldName') && attributes.key?(:'field_name')

      self.field_name = attributes[:'field_name'] if attributes[:'field_name']

      self.field_values = attributes[:'fieldValues'] if attributes[:'fieldValues']

      raise 'You cannot provide both :fieldValues and :field_values' if attributes.key?(:'fieldValues') && attributes.key?(:'field_values')

      self.field_values = attributes[:'field_values'] if attributes[:'field_values']

      self.grouping_field = attributes[:'groupingField'] if attributes[:'groupingField']

      raise 'You cannot provide both :groupingField and :grouping_field' if attributes.key?(:'groupingField') && attributes.key?(:'grouping_field')

      self.grouping_field = attributes[:'grouping_field'] if attributes[:'grouping_field']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.metric_reference = attributes[:'metricReference'] if attributes[:'metricReference']

      raise 'You cannot provide both :metricReference and :metric_reference' if attributes.key?(:'metricReference') && attributes.key?(:'metric_reference')

      self.metric_reference = attributes[:'metric_reference'] if attributes[:'metric_reference']

      self.name = attributes[:'name'] if attributes[:'name']

      self.metric_type = attributes[:'metricType'] if attributes[:'metricType']
      self.metric_type = "COUNT" if metric_type.nil? && !attributes.key?(:'metricType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :metricType and :metric_type' if attributes.key?(:'metricType') && attributes.key?(:'metric_type')

      self.metric_type = attributes[:'metric_type'] if attributes[:'metric_type']
      self.metric_type = "COUNT" if metric_type.nil? && !attributes.key?(:'metricType') && !attributes.key?(:'metric_type') # rubocop:disable Style/StringLiterals

      self.is_metric_source_enabled = attributes[:'isMetricSourceEnabled'] unless attributes[:'isMetricSourceEnabled'].nil?

      raise 'You cannot provide both :isMetricSourceEnabled and :is_metric_source_enabled' if attributes.key?(:'isMetricSourceEnabled') && attributes.key?(:'is_metric_source_enabled')

      self.is_metric_source_enabled = attributes[:'is_metric_source_enabled'] unless attributes[:'is_metric_source_enabled'].nil?

      self.operator = attributes[:'operator'] if attributes[:'operator']
      self.operator = "CONTAINS_IGNORE_CASE" if operator.nil? && !attributes.key?(:'operator') # rubocop:disable Style/StringLiterals

      self.sources = attributes[:'sources'] if attributes[:'sources']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.unit_type = attributes[:'unitType'] if attributes[:'unitType']

      raise 'You cannot provide both :unitType and :unit_type' if attributes.key?(:'unitType') && attributes.key?(:'unit_type')

      self.unit_type = attributes[:'unit_type'] if attributes[:'unit_type']

      self.is_user_customized = attributes[:'isUserCustomized'] unless attributes[:'isUserCustomized'].nil?

      raise 'You cannot provide both :isUserCustomized and :is_user_customized' if attributes.key?(:'isUserCustomized') && attributes.key?(:'is_user_customized')

      self.is_user_customized = attributes[:'is_user_customized'] unless attributes[:'is_user_customized'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] metric_type Object to be assigned
    def metric_type=(metric_type)
      # rubocop:disable Style/ConditionalAssignment
      if metric_type && !METRIC_TYPE_ENUM.include?(metric_type)
        OCI.logger.debug("Unknown value for 'metric_type' [" + metric_type + "]. Mapping to 'METRIC_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @metric_type = METRIC_TYPE_UNKNOWN_ENUM_VALUE
      else
        @metric_type = metric_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operator Object to be assigned
    def operator=(operator)
      # rubocop:disable Style/ConditionalAssignment
      if operator && !OPERATOR_ENUM.include?(operator)
        OCI.logger.debug("Unknown value for 'operator' [" + operator + "]. Mapping to 'OPERATOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operator = OPERATOR_UNKNOWN_ENUM_VALUE
      else
        @operator = operator
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        aggregation_field == other.aggregation_field &&
        bucket_metadata == other.bucket_metadata &&
        clock_period == other.clock_period &&
        description == other.description &&
        edit_version == other.edit_version &&
        field_name == other.field_name &&
        field_values == other.field_values &&
        grouping_field == other.grouping_field &&
        is_enabled == other.is_enabled &&
        is_system == other.is_system &&
        display_name == other.display_name &&
        metric_reference == other.metric_reference &&
        name == other.name &&
        metric_type == other.metric_type &&
        is_metric_source_enabled == other.is_metric_source_enabled &&
        operator == other.operator &&
        sources == other.sources &&
        entity_type == other.entity_type &&
        time_updated == other.time_updated &&
        unit_type == other.unit_type &&
        is_user_customized == other.is_user_customized
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
      [aggregation_field, bucket_metadata, clock_period, description, edit_version, field_name, field_values, grouping_field, is_enabled, is_system, display_name, metric_reference, name, metric_type, is_metric_source_enabled, operator, sources, entity_type, time_updated, unit_type, is_user_customized].hash
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
