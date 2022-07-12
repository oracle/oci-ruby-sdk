# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters detailing the compute performance for a specified DB system shape.
  #
  class Database::Models::ComputePerformanceSummary
    # **[Required]** The number of OCPU cores available.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # **[Required]** The amount of memory allocated for the VMDB System.
    # @return [Float]
    attr_accessor :memory_in_gbs

    # **[Required]** The network bandwidth of the VMDB system in gbps.
    # @return [Float]
    attr_accessor :network_bandwidth_in_gbps

    # **[Required]** IOPS for the VMDB System.
    # @return [Float]
    attr_accessor :network_iops

    # **[Required]** Network throughput for the VMDB System.
    # @return [Float]
    attr_accessor :network_throughput_in_mbps

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cpu_core_count': :'cpuCoreCount',
        'memory_in_gbs': :'memoryInGBs',
        'network_bandwidth_in_gbps': :'networkBandwidthInGbps',
        'network_iops': :'networkIops',
        'network_throughput_in_mbps': :'networkThroughputInMbps'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cpu_core_count': :'Integer',
        'memory_in_gbs': :'Float',
        'network_bandwidth_in_gbps': :'Float',
        'network_iops': :'Float',
        'network_throughput_in_mbps': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Float] :memory_in_gbs The value to assign to the {#memory_in_gbs} property
    # @option attributes [Float] :network_bandwidth_in_gbps The value to assign to the {#network_bandwidth_in_gbps} property
    # @option attributes [Float] :network_iops The value to assign to the {#network_iops} property
    # @option attributes [Float] :network_throughput_in_mbps The value to assign to the {#network_throughput_in_mbps} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.memory_in_gbs = attributes[:'memoryInGBs'] if attributes[:'memoryInGBs']

      raise 'You cannot provide both :memoryInGBs and :memory_in_gbs' if attributes.key?(:'memoryInGBs') && attributes.key?(:'memory_in_gbs')

      self.memory_in_gbs = attributes[:'memory_in_gbs'] if attributes[:'memory_in_gbs']

      self.network_bandwidth_in_gbps = attributes[:'networkBandwidthInGbps'] if attributes[:'networkBandwidthInGbps']

      raise 'You cannot provide both :networkBandwidthInGbps and :network_bandwidth_in_gbps' if attributes.key?(:'networkBandwidthInGbps') && attributes.key?(:'network_bandwidth_in_gbps')

      self.network_bandwidth_in_gbps = attributes[:'network_bandwidth_in_gbps'] if attributes[:'network_bandwidth_in_gbps']

      self.network_iops = attributes[:'networkIops'] if attributes[:'networkIops']

      raise 'You cannot provide both :networkIops and :network_iops' if attributes.key?(:'networkIops') && attributes.key?(:'network_iops')

      self.network_iops = attributes[:'network_iops'] if attributes[:'network_iops']

      self.network_throughput_in_mbps = attributes[:'networkThroughputInMbps'] if attributes[:'networkThroughputInMbps']

      raise 'You cannot provide both :networkThroughputInMbps and :network_throughput_in_mbps' if attributes.key?(:'networkThroughputInMbps') && attributes.key?(:'network_throughput_in_mbps')

      self.network_throughput_in_mbps = attributes[:'network_throughput_in_mbps'] if attributes[:'network_throughput_in_mbps']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cpu_core_count == other.cpu_core_count &&
        memory_in_gbs == other.memory_in_gbs &&
        network_bandwidth_in_gbps == other.network_bandwidth_in_gbps &&
        network_iops == other.network_iops &&
        network_throughput_in_mbps == other.network_throughput_in_mbps
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
      [cpu_core_count, memory_in_gbs, network_bandwidth_in_gbps, network_iops, network_throughput_in_mbps].hash
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