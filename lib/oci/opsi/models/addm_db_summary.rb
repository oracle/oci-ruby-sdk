# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # ADDM summary for a database
  class Opsi::Models::AddmDbSummary
    # This attribute is required.
    # @return [OCI::Opsi::Models::DatabaseDetails]
    attr_accessor :database_details

    # Number of ADDM findings
    # @return [Integer]
    attr_accessor :number_of_findings

    # Number of ADDM tasks
    # @return [Integer]
    attr_accessor :number_of_addm_tasks

    # The start timestamp that was passed into the request.
    # @return [DateTime]
    attr_accessor :time_first_snapshot_begin

    # The end timestamp that was passed into the request.
    # @return [DateTime]
    attr_accessor :time_latest_snapshot_end

    # AWR snapshot id.
    # @return [String]
    attr_accessor :snapshot_interval_start

    # AWR snapshot id.
    # @return [String]
    attr_accessor :snapshot_interval_end

    # Maximum overall impact in terms of percentage of total activity
    # @return [Float]
    attr_accessor :max_overall_impact

    # Category name
    # @return [String]
    attr_accessor :most_frequent_category_name

    # Category display name
    # @return [String]
    attr_accessor :most_frequent_category_display_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_details': :'databaseDetails',
        'number_of_findings': :'numberOfFindings',
        'number_of_addm_tasks': :'numberOfAddmTasks',
        'time_first_snapshot_begin': :'timeFirstSnapshotBegin',
        'time_latest_snapshot_end': :'timeLatestSnapshotEnd',
        'snapshot_interval_start': :'snapshotIntervalStart',
        'snapshot_interval_end': :'snapshotIntervalEnd',
        'max_overall_impact': :'maxOverallImpact',
        'most_frequent_category_name': :'mostFrequentCategoryName',
        'most_frequent_category_display_name': :'mostFrequentCategoryDisplayName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_details': :'OCI::Opsi::Models::DatabaseDetails',
        'number_of_findings': :'Integer',
        'number_of_addm_tasks': :'Integer',
        'time_first_snapshot_begin': :'DateTime',
        'time_latest_snapshot_end': :'DateTime',
        'snapshot_interval_start': :'String',
        'snapshot_interval_end': :'String',
        'max_overall_impact': :'Float',
        'most_frequent_category_name': :'String',
        'most_frequent_category_display_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Opsi::Models::DatabaseDetails] :database_details The value to assign to the {#database_details} property
    # @option attributes [Integer] :number_of_findings The value to assign to the {#number_of_findings} property
    # @option attributes [Integer] :number_of_addm_tasks The value to assign to the {#number_of_addm_tasks} property
    # @option attributes [DateTime] :time_first_snapshot_begin The value to assign to the {#time_first_snapshot_begin} property
    # @option attributes [DateTime] :time_latest_snapshot_end The value to assign to the {#time_latest_snapshot_end} property
    # @option attributes [String] :snapshot_interval_start The value to assign to the {#snapshot_interval_start} property
    # @option attributes [String] :snapshot_interval_end The value to assign to the {#snapshot_interval_end} property
    # @option attributes [Float] :max_overall_impact The value to assign to the {#max_overall_impact} property
    # @option attributes [String] :most_frequent_category_name The value to assign to the {#most_frequent_category_name} property
    # @option attributes [String] :most_frequent_category_display_name The value to assign to the {#most_frequent_category_display_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_details = attributes[:'databaseDetails'] if attributes[:'databaseDetails']

      raise 'You cannot provide both :databaseDetails and :database_details' if attributes.key?(:'databaseDetails') && attributes.key?(:'database_details')

      self.database_details = attributes[:'database_details'] if attributes[:'database_details']

      self.number_of_findings = attributes[:'numberOfFindings'] if attributes[:'numberOfFindings']

      raise 'You cannot provide both :numberOfFindings and :number_of_findings' if attributes.key?(:'numberOfFindings') && attributes.key?(:'number_of_findings')

      self.number_of_findings = attributes[:'number_of_findings'] if attributes[:'number_of_findings']

      self.number_of_addm_tasks = attributes[:'numberOfAddmTasks'] if attributes[:'numberOfAddmTasks']

      raise 'You cannot provide both :numberOfAddmTasks and :number_of_addm_tasks' if attributes.key?(:'numberOfAddmTasks') && attributes.key?(:'number_of_addm_tasks')

      self.number_of_addm_tasks = attributes[:'number_of_addm_tasks'] if attributes[:'number_of_addm_tasks']

      self.time_first_snapshot_begin = attributes[:'timeFirstSnapshotBegin'] if attributes[:'timeFirstSnapshotBegin']

      raise 'You cannot provide both :timeFirstSnapshotBegin and :time_first_snapshot_begin' if attributes.key?(:'timeFirstSnapshotBegin') && attributes.key?(:'time_first_snapshot_begin')

      self.time_first_snapshot_begin = attributes[:'time_first_snapshot_begin'] if attributes[:'time_first_snapshot_begin']

      self.time_latest_snapshot_end = attributes[:'timeLatestSnapshotEnd'] if attributes[:'timeLatestSnapshotEnd']

      raise 'You cannot provide both :timeLatestSnapshotEnd and :time_latest_snapshot_end' if attributes.key?(:'timeLatestSnapshotEnd') && attributes.key?(:'time_latest_snapshot_end')

      self.time_latest_snapshot_end = attributes[:'time_latest_snapshot_end'] if attributes[:'time_latest_snapshot_end']

      self.snapshot_interval_start = attributes[:'snapshotIntervalStart'] if attributes[:'snapshotIntervalStart']

      raise 'You cannot provide both :snapshotIntervalStart and :snapshot_interval_start' if attributes.key?(:'snapshotIntervalStart') && attributes.key?(:'snapshot_interval_start')

      self.snapshot_interval_start = attributes[:'snapshot_interval_start'] if attributes[:'snapshot_interval_start']

      self.snapshot_interval_end = attributes[:'snapshotIntervalEnd'] if attributes[:'snapshotIntervalEnd']

      raise 'You cannot provide both :snapshotIntervalEnd and :snapshot_interval_end' if attributes.key?(:'snapshotIntervalEnd') && attributes.key?(:'snapshot_interval_end')

      self.snapshot_interval_end = attributes[:'snapshot_interval_end'] if attributes[:'snapshot_interval_end']

      self.max_overall_impact = attributes[:'maxOverallImpact'] if attributes[:'maxOverallImpact']

      raise 'You cannot provide both :maxOverallImpact and :max_overall_impact' if attributes.key?(:'maxOverallImpact') && attributes.key?(:'max_overall_impact')

      self.max_overall_impact = attributes[:'max_overall_impact'] if attributes[:'max_overall_impact']

      self.most_frequent_category_name = attributes[:'mostFrequentCategoryName'] if attributes[:'mostFrequentCategoryName']

      raise 'You cannot provide both :mostFrequentCategoryName and :most_frequent_category_name' if attributes.key?(:'mostFrequentCategoryName') && attributes.key?(:'most_frequent_category_name')

      self.most_frequent_category_name = attributes[:'most_frequent_category_name'] if attributes[:'most_frequent_category_name']

      self.most_frequent_category_display_name = attributes[:'mostFrequentCategoryDisplayName'] if attributes[:'mostFrequentCategoryDisplayName']

      raise 'You cannot provide both :mostFrequentCategoryDisplayName and :most_frequent_category_display_name' if attributes.key?(:'mostFrequentCategoryDisplayName') && attributes.key?(:'most_frequent_category_display_name')

      self.most_frequent_category_display_name = attributes[:'most_frequent_category_display_name'] if attributes[:'most_frequent_category_display_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        database_details == other.database_details &&
        number_of_findings == other.number_of_findings &&
        number_of_addm_tasks == other.number_of_addm_tasks &&
        time_first_snapshot_begin == other.time_first_snapshot_begin &&
        time_latest_snapshot_end == other.time_latest_snapshot_end &&
        snapshot_interval_start == other.snapshot_interval_start &&
        snapshot_interval_end == other.snapshot_interval_end &&
        max_overall_impact == other.max_overall_impact &&
        most_frequent_category_name == other.most_frequent_category_name &&
        most_frequent_category_display_name == other.most_frequent_category_display_name
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
      [database_details, number_of_findings, number_of_addm_tasks, time_first_snapshot_begin, time_latest_snapshot_end, snapshot_interval_start, snapshot_interval_end, max_overall_impact, most_frequent_category_name, most_frequent_category_display_name].hash
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