# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'abstract_column'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Result column, that contains time series data points in each row. The column includes the time stamps as additional field in column header.
  #
  class LogAnalytics::Models::TrendColumn < LogAnalytics::Models::AbstractColumn
    # Time gap between each data pont in the series.
    #
    # @return [String]
    attr_accessor :interval_gap

    # Timestamps for each series data point
    #
    # @return [Array<Integer>]
    attr_accessor :intervals

    # Sum across all column values for a given timestamp.
    #
    # @return [Array<Integer>]
    attr_accessor :total_interval_counts

    # @return [Array<Integer>]
    attr_accessor :total_interval_counts_after_filter

    # @return [Array<Integer>]
    attr_accessor :interval_group_counts

    # @return [Array<Integer>]
    attr_accessor :interval_group_counts_after_filter

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'display_name': :'displayName',
        'sub_system': :'subSystem',
        'values': :'values',
        'is_list_of_values': :'isListOfValues',
        'is_multi_valued': :'isMultiValued',
        'is_groupable': :'isGroupable',
        'is_evaluable': :'isEvaluable',
        'value_type': :'valueType',
        'original_display_name': :'originalDisplayName',
        'internal_name': :'internalName',
        'interval_gap': :'intervalGap',
        'intervals': :'intervals',
        'total_interval_counts': :'totalIntervalCounts',
        'total_interval_counts_after_filter': :'totalIntervalCountsAfterFilter',
        'interval_group_counts': :'intervalGroupCounts',
        'interval_group_counts_after_filter': :'intervalGroupCountsAfterFilter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'display_name': :'String',
        'sub_system': :'String',
        'values': :'Array<OCI::LogAnalytics::Models::FieldValue>',
        'is_list_of_values': :'BOOLEAN',
        'is_multi_valued': :'BOOLEAN',
        'is_groupable': :'BOOLEAN',
        'is_evaluable': :'BOOLEAN',
        'value_type': :'String',
        'original_display_name': :'String',
        'internal_name': :'String',
        'interval_gap': :'String',
        'intervals': :'Array<Integer>',
        'total_interval_counts': :'Array<Integer>',
        'total_interval_counts_after_filter': :'Array<Integer>',
        'interval_group_counts': :'Array<Integer>',
        'interval_group_counts_after_filter': :'Array<Integer>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#display_name #display_name} proprety
    # @option attributes [String] :sub_system The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#sub_system #sub_system} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::FieldValue>] :values The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#values #values} proprety
    # @option attributes [BOOLEAN] :is_list_of_values The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_list_of_values #is_list_of_values} proprety
    # @option attributes [BOOLEAN] :is_multi_valued The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_multi_valued #is_multi_valued} proprety
    # @option attributes [BOOLEAN] :is_groupable The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_groupable #is_groupable} proprety
    # @option attributes [BOOLEAN] :is_evaluable The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_evaluable #is_evaluable} proprety
    # @option attributes [String] :value_type The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#value_type #value_type} proprety
    # @option attributes [String] :original_display_name The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#original_display_name #original_display_name} proprety
    # @option attributes [String] :internal_name The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#internal_name #internal_name} proprety
    # @option attributes [String] :interval_gap The value to assign to the {#interval_gap} property
    # @option attributes [Array<Integer>] :intervals The value to assign to the {#intervals} property
    # @option attributes [Array<Integer>] :total_interval_counts The value to assign to the {#total_interval_counts} property
    # @option attributes [Array<Integer>] :total_interval_counts_after_filter The value to assign to the {#total_interval_counts_after_filter} property
    # @option attributes [Array<Integer>] :interval_group_counts The value to assign to the {#interval_group_counts} property
    # @option attributes [Array<Integer>] :interval_group_counts_after_filter The value to assign to the {#interval_group_counts_after_filter} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'TREND_COLUMN'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.interval_gap = attributes[:'intervalGap'] if attributes[:'intervalGap']

      raise 'You cannot provide both :intervalGap and :interval_gap' if attributes.key?(:'intervalGap') && attributes.key?(:'interval_gap')

      self.interval_gap = attributes[:'interval_gap'] if attributes[:'interval_gap']

      self.intervals = attributes[:'intervals'] if attributes[:'intervals']

      self.total_interval_counts = attributes[:'totalIntervalCounts'] if attributes[:'totalIntervalCounts']

      raise 'You cannot provide both :totalIntervalCounts and :total_interval_counts' if attributes.key?(:'totalIntervalCounts') && attributes.key?(:'total_interval_counts')

      self.total_interval_counts = attributes[:'total_interval_counts'] if attributes[:'total_interval_counts']

      self.total_interval_counts_after_filter = attributes[:'totalIntervalCountsAfterFilter'] if attributes[:'totalIntervalCountsAfterFilter']

      raise 'You cannot provide both :totalIntervalCountsAfterFilter and :total_interval_counts_after_filter' if attributes.key?(:'totalIntervalCountsAfterFilter') && attributes.key?(:'total_interval_counts_after_filter')

      self.total_interval_counts_after_filter = attributes[:'total_interval_counts_after_filter'] if attributes[:'total_interval_counts_after_filter']

      self.interval_group_counts = attributes[:'intervalGroupCounts'] if attributes[:'intervalGroupCounts']

      raise 'You cannot provide both :intervalGroupCounts and :interval_group_counts' if attributes.key?(:'intervalGroupCounts') && attributes.key?(:'interval_group_counts')

      self.interval_group_counts = attributes[:'interval_group_counts'] if attributes[:'interval_group_counts']

      self.interval_group_counts_after_filter = attributes[:'intervalGroupCountsAfterFilter'] if attributes[:'intervalGroupCountsAfterFilter']

      raise 'You cannot provide both :intervalGroupCountsAfterFilter and :interval_group_counts_after_filter' if attributes.key?(:'intervalGroupCountsAfterFilter') && attributes.key?(:'interval_group_counts_after_filter')

      self.interval_group_counts_after_filter = attributes[:'interval_group_counts_after_filter'] if attributes[:'interval_group_counts_after_filter']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        display_name == other.display_name &&
        sub_system == other.sub_system &&
        values == other.values &&
        is_list_of_values == other.is_list_of_values &&
        is_multi_valued == other.is_multi_valued &&
        is_groupable == other.is_groupable &&
        is_evaluable == other.is_evaluable &&
        value_type == other.value_type &&
        original_display_name == other.original_display_name &&
        internal_name == other.internal_name &&
        interval_gap == other.interval_gap &&
        intervals == other.intervals &&
        total_interval_counts == other.total_interval_counts &&
        total_interval_counts_after_filter == other.total_interval_counts_after_filter &&
        interval_group_counts == other.interval_group_counts &&
        interval_group_counts_after_filter == other.interval_group_counts_after_filter
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
      [type, display_name, sub_system, values, is_list_of_values, is_multi_valued, is_groupable, is_evaluable, value_type, original_display_name, internal_name, interval_gap, intervals, total_interval_counts, total_interval_counts_after_filter, interval_group_counts, interval_group_counts_after_filter].hash
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
