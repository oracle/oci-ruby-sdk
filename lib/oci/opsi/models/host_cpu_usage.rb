# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'host_performance_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CPU Usage metric for the host
  #
  class Opsi::Models::HostCpuUsage < Opsi::Models::HostPerformanceMetricGroup
    # Percentage of CPU time spent in user mode
    # @return [Float]
    attr_accessor :cpu_user_mode_in_percent

    # Percentage of CPU time spent in system mode
    # @return [Float]
    attr_accessor :cpu_system_mode_in_percent

    # Amount of CPU Time spent in seconds
    # @return [Float]
    attr_accessor :cpu_usage_in_sec

    # Amount of CPU Time spent in percentage
    # @return [Float]
    attr_accessor :cpu_utilization_in_percent

    # Amount of CPU time stolen in percentage
    # @return [Float]
    attr_accessor :cpu_stolen_in_percent

    # Amount of CPU idle time in percentage
    # @return [Float]
    attr_accessor :cpu_idle_in_percent

    # Load average in the last 1 minute
    # @return [Float]
    attr_accessor :cpu_load1min

    # Load average in the last 5 minutes
    # @return [Float]
    attr_accessor :cpu_load5min

    # Load average in the last 15 minutes
    # @return [Float]
    attr_accessor :cpu_load15min

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'cpu_user_mode_in_percent': :'cpuUserModeInPercent',
        'cpu_system_mode_in_percent': :'cpuSystemModeInPercent',
        'cpu_usage_in_sec': :'cpuUsageInSec',
        'cpu_utilization_in_percent': :'cpuUtilizationInPercent',
        'cpu_stolen_in_percent': :'cpuStolenInPercent',
        'cpu_idle_in_percent': :'cpuIdleInPercent',
        'cpu_load1min': :'cpuLoad1min',
        'cpu_load5min': :'cpuLoad5min',
        'cpu_load15min': :'cpuLoad15min'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'cpu_user_mode_in_percent': :'Float',
        'cpu_system_mode_in_percent': :'Float',
        'cpu_usage_in_sec': :'Float',
        'cpu_utilization_in_percent': :'Float',
        'cpu_stolen_in_percent': :'Float',
        'cpu_idle_in_percent': :'Float',
        'cpu_load1min': :'Float',
        'cpu_load5min': :'Float',
        'cpu_load15min': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::HostPerformanceMetricGroup#time_collected #time_collected} proprety
    # @option attributes [Float] :cpu_user_mode_in_percent The value to assign to the {#cpu_user_mode_in_percent} property
    # @option attributes [Float] :cpu_system_mode_in_percent The value to assign to the {#cpu_system_mode_in_percent} property
    # @option attributes [Float] :cpu_usage_in_sec The value to assign to the {#cpu_usage_in_sec} property
    # @option attributes [Float] :cpu_utilization_in_percent The value to assign to the {#cpu_utilization_in_percent} property
    # @option attributes [Float] :cpu_stolen_in_percent The value to assign to the {#cpu_stolen_in_percent} property
    # @option attributes [Float] :cpu_idle_in_percent The value to assign to the {#cpu_idle_in_percent} property
    # @option attributes [Float] :cpu_load1min The value to assign to the {#cpu_load1min} property
    # @option attributes [Float] :cpu_load5min The value to assign to the {#cpu_load5min} property
    # @option attributes [Float] :cpu_load15min The value to assign to the {#cpu_load15min} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'HOST_CPU_USAGE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cpu_user_mode_in_percent = attributes[:'cpuUserModeInPercent'] if attributes[:'cpuUserModeInPercent']

      raise 'You cannot provide both :cpuUserModeInPercent and :cpu_user_mode_in_percent' if attributes.key?(:'cpuUserModeInPercent') && attributes.key?(:'cpu_user_mode_in_percent')

      self.cpu_user_mode_in_percent = attributes[:'cpu_user_mode_in_percent'] if attributes[:'cpu_user_mode_in_percent']

      self.cpu_system_mode_in_percent = attributes[:'cpuSystemModeInPercent'] if attributes[:'cpuSystemModeInPercent']

      raise 'You cannot provide both :cpuSystemModeInPercent and :cpu_system_mode_in_percent' if attributes.key?(:'cpuSystemModeInPercent') && attributes.key?(:'cpu_system_mode_in_percent')

      self.cpu_system_mode_in_percent = attributes[:'cpu_system_mode_in_percent'] if attributes[:'cpu_system_mode_in_percent']

      self.cpu_usage_in_sec = attributes[:'cpuUsageInSec'] if attributes[:'cpuUsageInSec']

      raise 'You cannot provide both :cpuUsageInSec and :cpu_usage_in_sec' if attributes.key?(:'cpuUsageInSec') && attributes.key?(:'cpu_usage_in_sec')

      self.cpu_usage_in_sec = attributes[:'cpu_usage_in_sec'] if attributes[:'cpu_usage_in_sec']

      self.cpu_utilization_in_percent = attributes[:'cpuUtilizationInPercent'] if attributes[:'cpuUtilizationInPercent']

      raise 'You cannot provide both :cpuUtilizationInPercent and :cpu_utilization_in_percent' if attributes.key?(:'cpuUtilizationInPercent') && attributes.key?(:'cpu_utilization_in_percent')

      self.cpu_utilization_in_percent = attributes[:'cpu_utilization_in_percent'] if attributes[:'cpu_utilization_in_percent']

      self.cpu_stolen_in_percent = attributes[:'cpuStolenInPercent'] if attributes[:'cpuStolenInPercent']

      raise 'You cannot provide both :cpuStolenInPercent and :cpu_stolen_in_percent' if attributes.key?(:'cpuStolenInPercent') && attributes.key?(:'cpu_stolen_in_percent')

      self.cpu_stolen_in_percent = attributes[:'cpu_stolen_in_percent'] if attributes[:'cpu_stolen_in_percent']

      self.cpu_idle_in_percent = attributes[:'cpuIdleInPercent'] if attributes[:'cpuIdleInPercent']

      raise 'You cannot provide both :cpuIdleInPercent and :cpu_idle_in_percent' if attributes.key?(:'cpuIdleInPercent') && attributes.key?(:'cpu_idle_in_percent')

      self.cpu_idle_in_percent = attributes[:'cpu_idle_in_percent'] if attributes[:'cpu_idle_in_percent']

      self.cpu_load1min = attributes[:'cpuLoad1min'] if attributes[:'cpuLoad1min']

      raise 'You cannot provide both :cpuLoad1min and :cpu_load1min' if attributes.key?(:'cpuLoad1min') && attributes.key?(:'cpu_load1min')

      self.cpu_load1min = attributes[:'cpu_load1min'] if attributes[:'cpu_load1min']

      self.cpu_load5min = attributes[:'cpuLoad5min'] if attributes[:'cpuLoad5min']

      raise 'You cannot provide both :cpuLoad5min and :cpu_load5min' if attributes.key?(:'cpuLoad5min') && attributes.key?(:'cpu_load5min')

      self.cpu_load5min = attributes[:'cpu_load5min'] if attributes[:'cpu_load5min']

      self.cpu_load15min = attributes[:'cpuLoad15min'] if attributes[:'cpuLoad15min']

      raise 'You cannot provide both :cpuLoad15min and :cpu_load15min' if attributes.key?(:'cpuLoad15min') && attributes.key?(:'cpu_load15min')

      self.cpu_load15min = attributes[:'cpu_load15min'] if attributes[:'cpu_load15min']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        metric_name == other.metric_name &&
        time_collected == other.time_collected &&
        cpu_user_mode_in_percent == other.cpu_user_mode_in_percent &&
        cpu_system_mode_in_percent == other.cpu_system_mode_in_percent &&
        cpu_usage_in_sec == other.cpu_usage_in_sec &&
        cpu_utilization_in_percent == other.cpu_utilization_in_percent &&
        cpu_stolen_in_percent == other.cpu_stolen_in_percent &&
        cpu_idle_in_percent == other.cpu_idle_in_percent &&
        cpu_load1min == other.cpu_load1min &&
        cpu_load5min == other.cpu_load5min &&
        cpu_load15min == other.cpu_load15min
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
      [metric_name, time_collected, cpu_user_mode_in_percent, cpu_system_mode_in_percent, cpu_usage_in_sec, cpu_utilization_in_percent, cpu_stolen_in_percent, cpu_idle_in_percent, cpu_load1min, cpu_load5min, cpu_load15min].hash
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
