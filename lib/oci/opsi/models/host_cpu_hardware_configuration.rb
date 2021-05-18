# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'host_configuration_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CPU Hardware Configuration metric for the host
  #
  class Opsi::Models::HostCpuHardwareConfiguration < Opsi::Models::HostConfigurationMetricGroup
    # Total number of CPU Sockets
    # @return [Integer]
    attr_accessor :total_sockets

    # Name of the CPU vendor
    # @return [String]
    attr_accessor :vendor_name

    # Clock frequency of the processor in megahertz
    # @return [Float]
    attr_accessor :frequency_in_mhz

    # Size of cache memory in megabytes
    # @return [Float]
    attr_accessor :cache_in_mb

    # Model name of processor
    # @return [String]
    attr_accessor :cpu_implementation

    # CPU model
    # @return [String]
    attr_accessor :model

    # Type of processor in the system
    # @return [String]
    attr_accessor :cpu_family

    # Number of cores per socket
    # @return [Integer]
    attr_accessor :cores_per_socket

    # Number of threads per socket
    # @return [Integer]
    attr_accessor :threads_per_socket

    # Indicates if hyper-threading is enabled or not
    # @return [String]
    attr_accessor :hyper_threading_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'total_sockets': :'totalSockets',
        'vendor_name': :'vendorName',
        'frequency_in_mhz': :'frequencyInMhz',
        'cache_in_mb': :'cacheInMB',
        'cpu_implementation': :'cpuImplementation',
        'model': :'model',
        'cpu_family': :'cpuFamily',
        'cores_per_socket': :'coresPerSocket',
        'threads_per_socket': :'threadsPerSocket',
        'hyper_threading_enabled': :'hyperThreadingEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'total_sockets': :'Integer',
        'vendor_name': :'String',
        'frequency_in_mhz': :'Float',
        'cache_in_mb': :'Float',
        'cpu_implementation': :'String',
        'model': :'String',
        'cpu_family': :'String',
        'cores_per_socket': :'Integer',
        'threads_per_socket': :'Integer',
        'hyper_threading_enabled': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::HostConfigurationMetricGroup#time_collected #time_collected} proprety
    # @option attributes [Integer] :total_sockets The value to assign to the {#total_sockets} property
    # @option attributes [String] :vendor_name The value to assign to the {#vendor_name} property
    # @option attributes [Float] :frequency_in_mhz The value to assign to the {#frequency_in_mhz} property
    # @option attributes [Float] :cache_in_mb The value to assign to the {#cache_in_mb} property
    # @option attributes [String] :cpu_implementation The value to assign to the {#cpu_implementation} property
    # @option attributes [String] :model The value to assign to the {#model} property
    # @option attributes [String] :cpu_family The value to assign to the {#cpu_family} property
    # @option attributes [Integer] :cores_per_socket The value to assign to the {#cores_per_socket} property
    # @option attributes [Integer] :threads_per_socket The value to assign to the {#threads_per_socket} property
    # @option attributes [String] :hyper_threading_enabled The value to assign to the {#hyper_threading_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'HOST_CPU_HARDWARE_CONFIGURATION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.total_sockets = attributes[:'totalSockets'] if attributes[:'totalSockets']

      raise 'You cannot provide both :totalSockets and :total_sockets' if attributes.key?(:'totalSockets') && attributes.key?(:'total_sockets')

      self.total_sockets = attributes[:'total_sockets'] if attributes[:'total_sockets']

      self.vendor_name = attributes[:'vendorName'] if attributes[:'vendorName']

      raise 'You cannot provide both :vendorName and :vendor_name' if attributes.key?(:'vendorName') && attributes.key?(:'vendor_name')

      self.vendor_name = attributes[:'vendor_name'] if attributes[:'vendor_name']

      self.frequency_in_mhz = attributes[:'frequencyInMhz'] if attributes[:'frequencyInMhz']

      raise 'You cannot provide both :frequencyInMhz and :frequency_in_mhz' if attributes.key?(:'frequencyInMhz') && attributes.key?(:'frequency_in_mhz')

      self.frequency_in_mhz = attributes[:'frequency_in_mhz'] if attributes[:'frequency_in_mhz']

      self.cache_in_mb = attributes[:'cacheInMB'] if attributes[:'cacheInMB']

      raise 'You cannot provide both :cacheInMB and :cache_in_mb' if attributes.key?(:'cacheInMB') && attributes.key?(:'cache_in_mb')

      self.cache_in_mb = attributes[:'cache_in_mb'] if attributes[:'cache_in_mb']

      self.cpu_implementation = attributes[:'cpuImplementation'] if attributes[:'cpuImplementation']

      raise 'You cannot provide both :cpuImplementation and :cpu_implementation' if attributes.key?(:'cpuImplementation') && attributes.key?(:'cpu_implementation')

      self.cpu_implementation = attributes[:'cpu_implementation'] if attributes[:'cpu_implementation']

      self.model = attributes[:'model'] if attributes[:'model']

      self.cpu_family = attributes[:'cpuFamily'] if attributes[:'cpuFamily']

      raise 'You cannot provide both :cpuFamily and :cpu_family' if attributes.key?(:'cpuFamily') && attributes.key?(:'cpu_family')

      self.cpu_family = attributes[:'cpu_family'] if attributes[:'cpu_family']

      self.cores_per_socket = attributes[:'coresPerSocket'] if attributes[:'coresPerSocket']

      raise 'You cannot provide both :coresPerSocket and :cores_per_socket' if attributes.key?(:'coresPerSocket') && attributes.key?(:'cores_per_socket')

      self.cores_per_socket = attributes[:'cores_per_socket'] if attributes[:'cores_per_socket']

      self.threads_per_socket = attributes[:'threadsPerSocket'] if attributes[:'threadsPerSocket']

      raise 'You cannot provide both :threadsPerSocket and :threads_per_socket' if attributes.key?(:'threadsPerSocket') && attributes.key?(:'threads_per_socket')

      self.threads_per_socket = attributes[:'threads_per_socket'] if attributes[:'threads_per_socket']

      self.hyper_threading_enabled = attributes[:'hyperThreadingEnabled'] if attributes[:'hyperThreadingEnabled']

      raise 'You cannot provide both :hyperThreadingEnabled and :hyper_threading_enabled' if attributes.key?(:'hyperThreadingEnabled') && attributes.key?(:'hyper_threading_enabled')

      self.hyper_threading_enabled = attributes[:'hyper_threading_enabled'] if attributes[:'hyper_threading_enabled']
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
        total_sockets == other.total_sockets &&
        vendor_name == other.vendor_name &&
        frequency_in_mhz == other.frequency_in_mhz &&
        cache_in_mb == other.cache_in_mb &&
        cpu_implementation == other.cpu_implementation &&
        model == other.model &&
        cpu_family == other.cpu_family &&
        cores_per_socket == other.cores_per_socket &&
        threads_per_socket == other.threads_per_socket &&
        hyper_threading_enabled == other.hyper_threading_enabled
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
      [metric_name, time_collected, total_sockets, vendor_name, frequency_in_mhz, cache_in_mb, cpu_implementation, model, cpu_family, cores_per_socket, threads_per_socket, hyper_threading_enabled].hash
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
