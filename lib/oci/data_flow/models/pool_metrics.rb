# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200129
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A collection of metrics related to a particular pool.
  #
  class DataFlow::Models::PoolMetrics
    # The last time this pool was started.
    #
    # @return [DateTime]
    attr_accessor :time_last_started

    # The last time this pool was stopped.
    #
    # @return [DateTime]
    attr_accessor :time_last_stopped

    # The last time a run used this pool.
    #
    # @return [DateTime]
    attr_accessor :time_last_used

    # The last time the mertics were updated for this.
    #
    # @return [DateTime]
    attr_accessor :time_last_metrics_updated

    # The number of runs that are currently running that are using this pool.
    #
    # @return [Integer]
    attr_accessor :active_runs_count

    # A count of the nodes that are currently being used for each shape in this pool.
    #
    # @return [Array<OCI::DataFlow::Models::NodeCount>]
    attr_accessor :actively_used_node_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_last_started': :'timeLastStarted',
        'time_last_stopped': :'timeLastStopped',
        'time_last_used': :'timeLastUsed',
        'time_last_metrics_updated': :'timeLastMetricsUpdated',
        'active_runs_count': :'activeRunsCount',
        'actively_used_node_count': :'activelyUsedNodeCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_last_started': :'DateTime',
        'time_last_stopped': :'DateTime',
        'time_last_used': :'DateTime',
        'time_last_metrics_updated': :'DateTime',
        'active_runs_count': :'Integer',
        'actively_used_node_count': :'Array<OCI::DataFlow::Models::NodeCount>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_last_started The value to assign to the {#time_last_started} property
    # @option attributes [DateTime] :time_last_stopped The value to assign to the {#time_last_stopped} property
    # @option attributes [DateTime] :time_last_used The value to assign to the {#time_last_used} property
    # @option attributes [DateTime] :time_last_metrics_updated The value to assign to the {#time_last_metrics_updated} property
    # @option attributes [Integer] :active_runs_count The value to assign to the {#active_runs_count} property
    # @option attributes [Array<OCI::DataFlow::Models::NodeCount>] :actively_used_node_count The value to assign to the {#actively_used_node_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_last_started = attributes[:'timeLastStarted'] if attributes[:'timeLastStarted']

      raise 'You cannot provide both :timeLastStarted and :time_last_started' if attributes.key?(:'timeLastStarted') && attributes.key?(:'time_last_started')

      self.time_last_started = attributes[:'time_last_started'] if attributes[:'time_last_started']

      self.time_last_stopped = attributes[:'timeLastStopped'] if attributes[:'timeLastStopped']

      raise 'You cannot provide both :timeLastStopped and :time_last_stopped' if attributes.key?(:'timeLastStopped') && attributes.key?(:'time_last_stopped')

      self.time_last_stopped = attributes[:'time_last_stopped'] if attributes[:'time_last_stopped']

      self.time_last_used = attributes[:'timeLastUsed'] if attributes[:'timeLastUsed']

      raise 'You cannot provide both :timeLastUsed and :time_last_used' if attributes.key?(:'timeLastUsed') && attributes.key?(:'time_last_used')

      self.time_last_used = attributes[:'time_last_used'] if attributes[:'time_last_used']

      self.time_last_metrics_updated = attributes[:'timeLastMetricsUpdated'] if attributes[:'timeLastMetricsUpdated']

      raise 'You cannot provide both :timeLastMetricsUpdated and :time_last_metrics_updated' if attributes.key?(:'timeLastMetricsUpdated') && attributes.key?(:'time_last_metrics_updated')

      self.time_last_metrics_updated = attributes[:'time_last_metrics_updated'] if attributes[:'time_last_metrics_updated']

      self.active_runs_count = attributes[:'activeRunsCount'] if attributes[:'activeRunsCount']

      raise 'You cannot provide both :activeRunsCount and :active_runs_count' if attributes.key?(:'activeRunsCount') && attributes.key?(:'active_runs_count')

      self.active_runs_count = attributes[:'active_runs_count'] if attributes[:'active_runs_count']

      self.actively_used_node_count = attributes[:'activelyUsedNodeCount'] if attributes[:'activelyUsedNodeCount']

      raise 'You cannot provide both :activelyUsedNodeCount and :actively_used_node_count' if attributes.key?(:'activelyUsedNodeCount') && attributes.key?(:'actively_used_node_count')

      self.actively_used_node_count = attributes[:'actively_used_node_count'] if attributes[:'actively_used_node_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_last_started == other.time_last_started &&
        time_last_stopped == other.time_last_stopped &&
        time_last_used == other.time_last_used &&
        time_last_metrics_updated == other.time_last_metrics_updated &&
        active_runs_count == other.active_runs_count &&
        actively_used_node_count == other.actively_used_node_count
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
      [time_last_started, time_last_stopped, time_last_used, time_last_metrics_updated, active_runs_count, actively_used_node_count].hash
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