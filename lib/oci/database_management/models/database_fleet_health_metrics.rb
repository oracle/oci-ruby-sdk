# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the fleet health metrics.
  class DatabaseManagement::Models::DatabaseFleetHealthMetrics
    COMPARE_TYPE_ENUM = [
      COMPARE_TYPE_HOUR = 'HOUR'.freeze,
      COMPARE_TYPE_DAY = 'DAY'.freeze,
      COMPARE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The baseline date and time in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    # This is the date and time against which percentage change is calculated.
    #
    # @return [String]
    attr_accessor :compare_baseline_time

    # **[Required]** The target date and time in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    # All the metrics are returned for the target date and time and the percentage change
    # is calculated against the baseline date and time.
    #
    # @return [String]
    attr_accessor :compare_target_time

    # The time window used for metrics comparison.
    # @return [String]
    attr_reader :compare_type

    # @return [OCI::DatabaseManagement::Models::FleetSummary]
    attr_accessor :fleet_summary

    # **[Required]** A list of the databases present in the fleet and their usage metrics.
    # @return [Array<OCI::DatabaseManagement::Models::DatabaseUsageMetrics>]
    attr_accessor :fleet_databases

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compare_baseline_time': :'compareBaselineTime',
        'compare_target_time': :'compareTargetTime',
        'compare_type': :'compareType',
        'fleet_summary': :'fleetSummary',
        'fleet_databases': :'fleetDatabases'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compare_baseline_time': :'String',
        'compare_target_time': :'String',
        'compare_type': :'String',
        'fleet_summary': :'OCI::DatabaseManagement::Models::FleetSummary',
        'fleet_databases': :'Array<OCI::DatabaseManagement::Models::DatabaseUsageMetrics>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compare_baseline_time The value to assign to the {#compare_baseline_time} property
    # @option attributes [String] :compare_target_time The value to assign to the {#compare_target_time} property
    # @option attributes [String] :compare_type The value to assign to the {#compare_type} property
    # @option attributes [OCI::DatabaseManagement::Models::FleetSummary] :fleet_summary The value to assign to the {#fleet_summary} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::DatabaseUsageMetrics>] :fleet_databases The value to assign to the {#fleet_databases} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compare_baseline_time = attributes[:'compareBaselineTime'] if attributes[:'compareBaselineTime']

      raise 'You cannot provide both :compareBaselineTime and :compare_baseline_time' if attributes.key?(:'compareBaselineTime') && attributes.key?(:'compare_baseline_time')

      self.compare_baseline_time = attributes[:'compare_baseline_time'] if attributes[:'compare_baseline_time']

      self.compare_target_time = attributes[:'compareTargetTime'] if attributes[:'compareTargetTime']

      raise 'You cannot provide both :compareTargetTime and :compare_target_time' if attributes.key?(:'compareTargetTime') && attributes.key?(:'compare_target_time')

      self.compare_target_time = attributes[:'compare_target_time'] if attributes[:'compare_target_time']

      self.compare_type = attributes[:'compareType'] if attributes[:'compareType']

      raise 'You cannot provide both :compareType and :compare_type' if attributes.key?(:'compareType') && attributes.key?(:'compare_type')

      self.compare_type = attributes[:'compare_type'] if attributes[:'compare_type']

      self.fleet_summary = attributes[:'fleetSummary'] if attributes[:'fleetSummary']

      raise 'You cannot provide both :fleetSummary and :fleet_summary' if attributes.key?(:'fleetSummary') && attributes.key?(:'fleet_summary')

      self.fleet_summary = attributes[:'fleet_summary'] if attributes[:'fleet_summary']

      self.fleet_databases = attributes[:'fleetDatabases'] if attributes[:'fleetDatabases']

      raise 'You cannot provide both :fleetDatabases and :fleet_databases' if attributes.key?(:'fleetDatabases') && attributes.key?(:'fleet_databases')

      self.fleet_databases = attributes[:'fleet_databases'] if attributes[:'fleet_databases']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] compare_type Object to be assigned
    def compare_type=(compare_type)
      # rubocop:disable Style/ConditionalAssignment
      if compare_type && !COMPARE_TYPE_ENUM.include?(compare_type)
        OCI.logger.debug("Unknown value for 'compare_type' [" + compare_type + "]. Mapping to 'COMPARE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @compare_type = COMPARE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @compare_type = compare_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compare_baseline_time == other.compare_baseline_time &&
        compare_target_time == other.compare_target_time &&
        compare_type == other.compare_type &&
        fleet_summary == other.fleet_summary &&
        fleet_databases == other.fleet_databases
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
      [compare_baseline_time, compare_target_time, compare_type, fleet_summary, fleet_databases].hash
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
