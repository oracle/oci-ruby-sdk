# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'host_performance_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Memory usage metric for the host
  #
  class Opsi::Models::HostMemoryUsage < Opsi::Models::HostPerformanceMetricGroup
    # Amount of physical memory used in gigabytes
    # @return [Float]
    attr_accessor :memory_used_in_gb

    # Amount of physical memory used in percentage
    # @return [Float]
    attr_accessor :memory_utilization_in_percent

    # Load on memory in gigabytes
    # @return [Float]
    attr_accessor :memory_load_in_gb

    # Amount of usable physical memory in kilobytes
    # @return [Float]
    attr_accessor :real_memory_in_kb

    # Amount of available physical memory in kilobytes
    # @return [Float]
    attr_accessor :free_memory_in_kb

    # Memory used excluding buffers and cache in gigabytes
    # @return [Float]
    attr_accessor :logical_memory_used_in_gb

    # Amount of logical memory used in percentage
    # @return [Float]
    attr_accessor :logical_memory_utilization_in_percent

    # Amount of avaiable virtual memory in kilobytes
    # @return [Float]
    attr_accessor :free_logical_memory_in_kb

    # Number of major page faults
    # @return [Integer]
    attr_accessor :major_page_faults

    # Amount of available swap space in kilobytes
    # @return [Float]
    attr_accessor :swap_free_in_kb

    # Amount of memory used for anon huge pages in kilobytes
    # @return [Float]
    attr_accessor :anon_huge_pages_in_kb

    # Number of available huge pages
    # @return [Integer]
    attr_accessor :huge_pages_free

    # Number of reserved huge pages
    # @return [Integer]
    attr_accessor :huge_pages_reserved

    # Number of surplus huge pages
    # @return [Integer]
    attr_accessor :huge_pages_surplus

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'memory_used_in_gb': :'memoryUsedInGB',
        'memory_utilization_in_percent': :'memoryUtilizationInPercent',
        'memory_load_in_gb': :'memoryLoadInGB',
        'real_memory_in_kb': :'realMemoryInKB',
        'free_memory_in_kb': :'freeMemoryInKB',
        'logical_memory_used_in_gb': :'logicalMemoryUsedInGB',
        'logical_memory_utilization_in_percent': :'logicalMemoryUtilizationInPercent',
        'free_logical_memory_in_kb': :'freeLogicalMemoryInKB',
        'major_page_faults': :'majorPageFaults',
        'swap_free_in_kb': :'swapFreeInKB',
        'anon_huge_pages_in_kb': :'anonHugePagesInKB',
        'huge_pages_free': :'hugePagesFree',
        'huge_pages_reserved': :'hugePagesReserved',
        'huge_pages_surplus': :'hugePagesSurplus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'memory_used_in_gb': :'Float',
        'memory_utilization_in_percent': :'Float',
        'memory_load_in_gb': :'Float',
        'real_memory_in_kb': :'Float',
        'free_memory_in_kb': :'Float',
        'logical_memory_used_in_gb': :'Float',
        'logical_memory_utilization_in_percent': :'Float',
        'free_logical_memory_in_kb': :'Float',
        'major_page_faults': :'Integer',
        'swap_free_in_kb': :'Float',
        'anon_huge_pages_in_kb': :'Float',
        'huge_pages_free': :'Integer',
        'huge_pages_reserved': :'Integer',
        'huge_pages_surplus': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::HostPerformanceMetricGroup#time_collected #time_collected} proprety
    # @option attributes [Float] :memory_used_in_gb The value to assign to the {#memory_used_in_gb} property
    # @option attributes [Float] :memory_utilization_in_percent The value to assign to the {#memory_utilization_in_percent} property
    # @option attributes [Float] :memory_load_in_gb The value to assign to the {#memory_load_in_gb} property
    # @option attributes [Float] :real_memory_in_kb The value to assign to the {#real_memory_in_kb} property
    # @option attributes [Float] :free_memory_in_kb The value to assign to the {#free_memory_in_kb} property
    # @option attributes [Float] :logical_memory_used_in_gb The value to assign to the {#logical_memory_used_in_gb} property
    # @option attributes [Float] :logical_memory_utilization_in_percent The value to assign to the {#logical_memory_utilization_in_percent} property
    # @option attributes [Float] :free_logical_memory_in_kb The value to assign to the {#free_logical_memory_in_kb} property
    # @option attributes [Integer] :major_page_faults The value to assign to the {#major_page_faults} property
    # @option attributes [Float] :swap_free_in_kb The value to assign to the {#swap_free_in_kb} property
    # @option attributes [Float] :anon_huge_pages_in_kb The value to assign to the {#anon_huge_pages_in_kb} property
    # @option attributes [Integer] :huge_pages_free The value to assign to the {#huge_pages_free} property
    # @option attributes [Integer] :huge_pages_reserved The value to assign to the {#huge_pages_reserved} property
    # @option attributes [Integer] :huge_pages_surplus The value to assign to the {#huge_pages_surplus} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'HOST_MEMORY_USAGE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.memory_used_in_gb = attributes[:'memoryUsedInGB'] if attributes[:'memoryUsedInGB']

      raise 'You cannot provide both :memoryUsedInGB and :memory_used_in_gb' if attributes.key?(:'memoryUsedInGB') && attributes.key?(:'memory_used_in_gb')

      self.memory_used_in_gb = attributes[:'memory_used_in_gb'] if attributes[:'memory_used_in_gb']

      self.memory_utilization_in_percent = attributes[:'memoryUtilizationInPercent'] if attributes[:'memoryUtilizationInPercent']

      raise 'You cannot provide both :memoryUtilizationInPercent and :memory_utilization_in_percent' if attributes.key?(:'memoryUtilizationInPercent') && attributes.key?(:'memory_utilization_in_percent')

      self.memory_utilization_in_percent = attributes[:'memory_utilization_in_percent'] if attributes[:'memory_utilization_in_percent']

      self.memory_load_in_gb = attributes[:'memoryLoadInGB'] if attributes[:'memoryLoadInGB']

      raise 'You cannot provide both :memoryLoadInGB and :memory_load_in_gb' if attributes.key?(:'memoryLoadInGB') && attributes.key?(:'memory_load_in_gb')

      self.memory_load_in_gb = attributes[:'memory_load_in_gb'] if attributes[:'memory_load_in_gb']

      self.real_memory_in_kb = attributes[:'realMemoryInKB'] if attributes[:'realMemoryInKB']

      raise 'You cannot provide both :realMemoryInKB and :real_memory_in_kb' if attributes.key?(:'realMemoryInKB') && attributes.key?(:'real_memory_in_kb')

      self.real_memory_in_kb = attributes[:'real_memory_in_kb'] if attributes[:'real_memory_in_kb']

      self.free_memory_in_kb = attributes[:'freeMemoryInKB'] if attributes[:'freeMemoryInKB']

      raise 'You cannot provide both :freeMemoryInKB and :free_memory_in_kb' if attributes.key?(:'freeMemoryInKB') && attributes.key?(:'free_memory_in_kb')

      self.free_memory_in_kb = attributes[:'free_memory_in_kb'] if attributes[:'free_memory_in_kb']

      self.logical_memory_used_in_gb = attributes[:'logicalMemoryUsedInGB'] if attributes[:'logicalMemoryUsedInGB']

      raise 'You cannot provide both :logicalMemoryUsedInGB and :logical_memory_used_in_gb' if attributes.key?(:'logicalMemoryUsedInGB') && attributes.key?(:'logical_memory_used_in_gb')

      self.logical_memory_used_in_gb = attributes[:'logical_memory_used_in_gb'] if attributes[:'logical_memory_used_in_gb']

      self.logical_memory_utilization_in_percent = attributes[:'logicalMemoryUtilizationInPercent'] if attributes[:'logicalMemoryUtilizationInPercent']

      raise 'You cannot provide both :logicalMemoryUtilizationInPercent and :logical_memory_utilization_in_percent' if attributes.key?(:'logicalMemoryUtilizationInPercent') && attributes.key?(:'logical_memory_utilization_in_percent')

      self.logical_memory_utilization_in_percent = attributes[:'logical_memory_utilization_in_percent'] if attributes[:'logical_memory_utilization_in_percent']

      self.free_logical_memory_in_kb = attributes[:'freeLogicalMemoryInKB'] if attributes[:'freeLogicalMemoryInKB']

      raise 'You cannot provide both :freeLogicalMemoryInKB and :free_logical_memory_in_kb' if attributes.key?(:'freeLogicalMemoryInKB') && attributes.key?(:'free_logical_memory_in_kb')

      self.free_logical_memory_in_kb = attributes[:'free_logical_memory_in_kb'] if attributes[:'free_logical_memory_in_kb']

      self.major_page_faults = attributes[:'majorPageFaults'] if attributes[:'majorPageFaults']

      raise 'You cannot provide both :majorPageFaults and :major_page_faults' if attributes.key?(:'majorPageFaults') && attributes.key?(:'major_page_faults')

      self.major_page_faults = attributes[:'major_page_faults'] if attributes[:'major_page_faults']

      self.swap_free_in_kb = attributes[:'swapFreeInKB'] if attributes[:'swapFreeInKB']

      raise 'You cannot provide both :swapFreeInKB and :swap_free_in_kb' if attributes.key?(:'swapFreeInKB') && attributes.key?(:'swap_free_in_kb')

      self.swap_free_in_kb = attributes[:'swap_free_in_kb'] if attributes[:'swap_free_in_kb']

      self.anon_huge_pages_in_kb = attributes[:'anonHugePagesInKB'] if attributes[:'anonHugePagesInKB']

      raise 'You cannot provide both :anonHugePagesInKB and :anon_huge_pages_in_kb' if attributes.key?(:'anonHugePagesInKB') && attributes.key?(:'anon_huge_pages_in_kb')

      self.anon_huge_pages_in_kb = attributes[:'anon_huge_pages_in_kb'] if attributes[:'anon_huge_pages_in_kb']

      self.huge_pages_free = attributes[:'hugePagesFree'] if attributes[:'hugePagesFree']

      raise 'You cannot provide both :hugePagesFree and :huge_pages_free' if attributes.key?(:'hugePagesFree') && attributes.key?(:'huge_pages_free')

      self.huge_pages_free = attributes[:'huge_pages_free'] if attributes[:'huge_pages_free']

      self.huge_pages_reserved = attributes[:'hugePagesReserved'] if attributes[:'hugePagesReserved']

      raise 'You cannot provide both :hugePagesReserved and :huge_pages_reserved' if attributes.key?(:'hugePagesReserved') && attributes.key?(:'huge_pages_reserved')

      self.huge_pages_reserved = attributes[:'huge_pages_reserved'] if attributes[:'huge_pages_reserved']

      self.huge_pages_surplus = attributes[:'hugePagesSurplus'] if attributes[:'hugePagesSurplus']

      raise 'You cannot provide both :hugePagesSurplus and :huge_pages_surplus' if attributes.key?(:'hugePagesSurplus') && attributes.key?(:'huge_pages_surplus')

      self.huge_pages_surplus = attributes[:'huge_pages_surplus'] if attributes[:'huge_pages_surplus']
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
        memory_used_in_gb == other.memory_used_in_gb &&
        memory_utilization_in_percent == other.memory_utilization_in_percent &&
        memory_load_in_gb == other.memory_load_in_gb &&
        real_memory_in_kb == other.real_memory_in_kb &&
        free_memory_in_kb == other.free_memory_in_kb &&
        logical_memory_used_in_gb == other.logical_memory_used_in_gb &&
        logical_memory_utilization_in_percent == other.logical_memory_utilization_in_percent &&
        free_logical_memory_in_kb == other.free_logical_memory_in_kb &&
        major_page_faults == other.major_page_faults &&
        swap_free_in_kb == other.swap_free_in_kb &&
        anon_huge_pages_in_kb == other.anon_huge_pages_in_kb &&
        huge_pages_free == other.huge_pages_free &&
        huge_pages_reserved == other.huge_pages_reserved &&
        huge_pages_surplus == other.huge_pages_surplus
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
      [metric_name, time_collected, memory_used_in_gb, memory_utilization_in_percent, memory_load_in_gb, real_memory_in_kb, free_memory_in_kb, logical_memory_used_in_gb, logical_memory_utilization_in_percent, free_logical_memory_in_kb, major_page_faults, swap_free_in_kb, anon_huge_pages_in_kb, huge_pages_free, huge_pages_reserved, huge_pages_surplus].hash
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
