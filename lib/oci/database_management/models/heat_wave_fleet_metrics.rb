# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the HeatWave cluster fleet health metrics.
  class DatabaseManagement::Models::HeatWaveFleetMetrics
    # **[Required]** The beginning of the time range during which metric data is retrieved.
    # @return [String]
    attr_accessor :start_time

    # **[Required]** The end of the time range during which metric data is retrieved.
    # @return [String]
    attr_accessor :end_time

    # **[Required]** The list of HeatWave clusters in the fleet and their usage metrics.
    # @return [Array<OCI::DatabaseManagement::Models::HeatWaveClusterUsageMetrics>]
    attr_accessor :fleet_clusters

    # **[Required]** The number of HeatWave clusters in the fleet and a summary of the metrics that provide the aggregated usage of CPU, storage, and so on of all the clusters.
    # @return [Array<OCI::DatabaseManagement::Models::HeatWaveFleetSummary>]
    attr_accessor :fleet_summary

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'start_time': :'startTime',
        'end_time': :'endTime',
        'fleet_clusters': :'fleetClusters',
        'fleet_summary': :'fleetSummary'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'start_time': :'String',
        'end_time': :'String',
        'fleet_clusters': :'Array<OCI::DatabaseManagement::Models::HeatWaveClusterUsageMetrics>',
        'fleet_summary': :'Array<OCI::DatabaseManagement::Models::HeatWaveFleetSummary>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :start_time The value to assign to the {#start_time} property
    # @option attributes [String] :end_time The value to assign to the {#end_time} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::HeatWaveClusterUsageMetrics>] :fleet_clusters The value to assign to the {#fleet_clusters} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::HeatWaveFleetSummary>] :fleet_summary The value to assign to the {#fleet_summary} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.start_time = attributes[:'startTime'] if attributes[:'startTime']

      raise 'You cannot provide both :startTime and :start_time' if attributes.key?(:'startTime') && attributes.key?(:'start_time')

      self.start_time = attributes[:'start_time'] if attributes[:'start_time']

      self.end_time = attributes[:'endTime'] if attributes[:'endTime']

      raise 'You cannot provide both :endTime and :end_time' if attributes.key?(:'endTime') && attributes.key?(:'end_time')

      self.end_time = attributes[:'end_time'] if attributes[:'end_time']

      self.fleet_clusters = attributes[:'fleetClusters'] if attributes[:'fleetClusters']

      raise 'You cannot provide both :fleetClusters and :fleet_clusters' if attributes.key?(:'fleetClusters') && attributes.key?(:'fleet_clusters')

      self.fleet_clusters = attributes[:'fleet_clusters'] if attributes[:'fleet_clusters']

      self.fleet_summary = attributes[:'fleetSummary'] if attributes[:'fleetSummary']

      raise 'You cannot provide both :fleetSummary and :fleet_summary' if attributes.key?(:'fleetSummary') && attributes.key?(:'fleet_summary')

      self.fleet_summary = attributes[:'fleet_summary'] if attributes[:'fleet_summary']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        start_time == other.start_time &&
        end_time == other.end_time &&
        fleet_clusters == other.fleet_clusters &&
        fleet_summary == other.fleet_summary
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
      [start_time, end_time, fleet_clusters, fleet_summary].hash
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
