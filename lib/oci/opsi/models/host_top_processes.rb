# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'host_performance_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Top Processes metric for the host
  #
  class Opsi::Models::HostTopProcesses < Opsi::Models::HostPerformanceMetricGroup
    # process id
    # @return [Float]
    attr_accessor :pid

    # User that started the process
    # @return [String]
    attr_accessor :user_name

    # Memory utilization percentage
    # @return [Float]
    attr_accessor :memory_utilization_percent

    # CPU utilization percentage
    # @return [Float]
    attr_accessor :cpu_utilization_percent

    # CPU usage in seconds
    # @return [Float]
    attr_accessor :cpu_usage_in_seconds

    # Command line executed for the process
    # @return [String]
    attr_accessor :command

    # Virtual memory in megabytes
    # @return [Float]
    attr_accessor :virtual_memory_in_mbs

    # Physical memory in megabytes
    # @return [Float]
    attr_accessor :physical_memory_in_mbs

    # Process Start Time
    # Example: `\"2020-03-31T00:00:00.000Z\"`
    #
    # @return [DateTime]
    attr_accessor :start_time

    # Number of processes running at the time of collection
    # @return [Float]
    attr_accessor :total_processes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'pid': :'pid',
        'user_name': :'userName',
        'memory_utilization_percent': :'memoryUtilizationPercent',
        'cpu_utilization_percent': :'cpuUtilizationPercent',
        'cpu_usage_in_seconds': :'cpuUsageInSeconds',
        'command': :'command',
        'virtual_memory_in_mbs': :'virtualMemoryInMBs',
        'physical_memory_in_mbs': :'physicalMemoryInMBs',
        'start_time': :'startTime',
        'total_processes': :'totalProcesses'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'pid': :'Float',
        'user_name': :'String',
        'memory_utilization_percent': :'Float',
        'cpu_utilization_percent': :'Float',
        'cpu_usage_in_seconds': :'Float',
        'command': :'String',
        'virtual_memory_in_mbs': :'Float',
        'physical_memory_in_mbs': :'Float',
        'start_time': :'DateTime',
        'total_processes': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::HostPerformanceMetricGroup#time_collected #time_collected} proprety
    # @option attributes [Float] :pid The value to assign to the {#pid} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [Float] :memory_utilization_percent The value to assign to the {#memory_utilization_percent} property
    # @option attributes [Float] :cpu_utilization_percent The value to assign to the {#cpu_utilization_percent} property
    # @option attributes [Float] :cpu_usage_in_seconds The value to assign to the {#cpu_usage_in_seconds} property
    # @option attributes [String] :command The value to assign to the {#command} property
    # @option attributes [Float] :virtual_memory_in_mbs The value to assign to the {#virtual_memory_in_mbs} property
    # @option attributes [Float] :physical_memory_in_mbs The value to assign to the {#physical_memory_in_mbs} property
    # @option attributes [DateTime] :start_time The value to assign to the {#start_time} property
    # @option attributes [Float] :total_processes The value to assign to the {#total_processes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'HOST_TOP_PROCESSES'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.pid = attributes[:'pid'] if attributes[:'pid']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.memory_utilization_percent = attributes[:'memoryUtilizationPercent'] if attributes[:'memoryUtilizationPercent']

      raise 'You cannot provide both :memoryUtilizationPercent and :memory_utilization_percent' if attributes.key?(:'memoryUtilizationPercent') && attributes.key?(:'memory_utilization_percent')

      self.memory_utilization_percent = attributes[:'memory_utilization_percent'] if attributes[:'memory_utilization_percent']

      self.cpu_utilization_percent = attributes[:'cpuUtilizationPercent'] if attributes[:'cpuUtilizationPercent']

      raise 'You cannot provide both :cpuUtilizationPercent and :cpu_utilization_percent' if attributes.key?(:'cpuUtilizationPercent') && attributes.key?(:'cpu_utilization_percent')

      self.cpu_utilization_percent = attributes[:'cpu_utilization_percent'] if attributes[:'cpu_utilization_percent']

      self.cpu_usage_in_seconds = attributes[:'cpuUsageInSeconds'] if attributes[:'cpuUsageInSeconds']

      raise 'You cannot provide both :cpuUsageInSeconds and :cpu_usage_in_seconds' if attributes.key?(:'cpuUsageInSeconds') && attributes.key?(:'cpu_usage_in_seconds')

      self.cpu_usage_in_seconds = attributes[:'cpu_usage_in_seconds'] if attributes[:'cpu_usage_in_seconds']

      self.command = attributes[:'command'] if attributes[:'command']

      self.virtual_memory_in_mbs = attributes[:'virtualMemoryInMBs'] if attributes[:'virtualMemoryInMBs']

      raise 'You cannot provide both :virtualMemoryInMBs and :virtual_memory_in_mbs' if attributes.key?(:'virtualMemoryInMBs') && attributes.key?(:'virtual_memory_in_mbs')

      self.virtual_memory_in_mbs = attributes[:'virtual_memory_in_mbs'] if attributes[:'virtual_memory_in_mbs']

      self.physical_memory_in_mbs = attributes[:'physicalMemoryInMBs'] if attributes[:'physicalMemoryInMBs']

      raise 'You cannot provide both :physicalMemoryInMBs and :physical_memory_in_mbs' if attributes.key?(:'physicalMemoryInMBs') && attributes.key?(:'physical_memory_in_mbs')

      self.physical_memory_in_mbs = attributes[:'physical_memory_in_mbs'] if attributes[:'physical_memory_in_mbs']

      self.start_time = attributes[:'startTime'] if attributes[:'startTime']

      raise 'You cannot provide both :startTime and :start_time' if attributes.key?(:'startTime') && attributes.key?(:'start_time')

      self.start_time = attributes[:'start_time'] if attributes[:'start_time']

      self.total_processes = attributes[:'totalProcesses'] if attributes[:'totalProcesses']

      raise 'You cannot provide both :totalProcesses and :total_processes' if attributes.key?(:'totalProcesses') && attributes.key?(:'total_processes')

      self.total_processes = attributes[:'total_processes'] if attributes[:'total_processes']
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
        pid == other.pid &&
        user_name == other.user_name &&
        memory_utilization_percent == other.memory_utilization_percent &&
        cpu_utilization_percent == other.cpu_utilization_percent &&
        cpu_usage_in_seconds == other.cpu_usage_in_seconds &&
        command == other.command &&
        virtual_memory_in_mbs == other.virtual_memory_in_mbs &&
        physical_memory_in_mbs == other.physical_memory_in_mbs &&
        start_time == other.start_time &&
        total_processes == other.total_processes
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
      [metric_name, time_collected, pid, user_name, memory_utilization_percent, cpu_utilization_percent, cpu_usage_in_seconds, command, virtual_memory_in_mbs, physical_memory_in_mbs, start_time, total_processes].hash
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
