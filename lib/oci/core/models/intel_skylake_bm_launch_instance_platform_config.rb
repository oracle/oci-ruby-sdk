# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require_relative 'launch_instance_platform_config'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The platform configuration used when launching a bare metal instance with an Intel X7-based processor
  # (the Intel Skylake platform).
  #
  class Core::Models::IntelSkylakeBmLaunchInstancePlatformConfig < Core::Models::LaunchInstancePlatformConfig
    NUMA_NODES_PER_SOCKET_ENUM = [
      NUMA_NODES_PER_SOCKET_NPS1 = 'NPS1'.freeze,
      NUMA_NODES_PER_SOCKET_NPS2 = 'NPS2'.freeze
    ].freeze

    # The number of NUMA nodes per socket (NPS).
    #
    # @return [String]
    attr_reader :numa_nodes_per_socket

    # Whether symmetric multithreading is enabled on the instance. Symmetric multithreading is also
    # called simultaneous multithreading (SMT) or Intel Hyper-Threading.
    #
    # Intel and AMD processors have two hardware execution threads per core (OCPU). SMT permits multiple
    # independent threads of execution, to better use the resources and increase the efficiency
    # of the CPU. When multithreading is disabled, only one thread is permitted to run on each core, which
    # can provide higher or more predictable performance for some workloads.
    #
    # @return [BOOLEAN]
    attr_accessor :is_symmetric_multi_threading_enabled

    # Whether the input-output memory management unit is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_input_output_memory_management_unit_enabled

    # The percentage of cores enabled. Value must be a multiple of 25%. If the requested percentage
    # results in a fractional number of cores, the system rounds up the number of cores across processors
    # and provisions an instance with a whole number of cores.
    #
    # If the applications that you run on the instance use a core-based licensing model and need fewer cores
    # than the full size of the shape, you can disable cores to reduce your licensing costs. The instance
    # itself is billed for the full shape, regardless of whether all cores are enabled.
    #
    # @return [Integer]
    attr_accessor :percentage_of_cores_enabled

    # Instance Platform Configuration Configuration Map for flexible setting input.
    #
    # @return [Hash<String, String>]
    attr_accessor :config_map

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'is_secure_boot_enabled': :'isSecureBootEnabled',
        'is_trusted_platform_module_enabled': :'isTrustedPlatformModuleEnabled',
        'is_measured_boot_enabled': :'isMeasuredBootEnabled',
        'is_memory_encryption_enabled': :'isMemoryEncryptionEnabled',
        'numa_nodes_per_socket': :'numaNodesPerSocket',
        'is_symmetric_multi_threading_enabled': :'isSymmetricMultiThreadingEnabled',
        'is_input_output_memory_management_unit_enabled': :'isInputOutputMemoryManagementUnitEnabled',
        'percentage_of_cores_enabled': :'percentageOfCoresEnabled',
        'config_map': :'configMap'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'is_secure_boot_enabled': :'BOOLEAN',
        'is_trusted_platform_module_enabled': :'BOOLEAN',
        'is_measured_boot_enabled': :'BOOLEAN',
        'is_memory_encryption_enabled': :'BOOLEAN',
        'numa_nodes_per_socket': :'String',
        'is_symmetric_multi_threading_enabled': :'BOOLEAN',
        'is_input_output_memory_management_unit_enabled': :'BOOLEAN',
        'percentage_of_cores_enabled': :'Integer',
        'config_map': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_secure_boot_enabled The value to assign to the {OCI::Core::Models::LaunchInstancePlatformConfig#is_secure_boot_enabled #is_secure_boot_enabled} proprety
    # @option attributes [BOOLEAN] :is_trusted_platform_module_enabled The value to assign to the {OCI::Core::Models::LaunchInstancePlatformConfig#is_trusted_platform_module_enabled #is_trusted_platform_module_enabled} proprety
    # @option attributes [BOOLEAN] :is_measured_boot_enabled The value to assign to the {OCI::Core::Models::LaunchInstancePlatformConfig#is_measured_boot_enabled #is_measured_boot_enabled} proprety
    # @option attributes [BOOLEAN] :is_memory_encryption_enabled The value to assign to the {OCI::Core::Models::LaunchInstancePlatformConfig#is_memory_encryption_enabled #is_memory_encryption_enabled} proprety
    # @option attributes [String] :numa_nodes_per_socket The value to assign to the {#numa_nodes_per_socket} property
    # @option attributes [BOOLEAN] :is_symmetric_multi_threading_enabled The value to assign to the {#is_symmetric_multi_threading_enabled} property
    # @option attributes [BOOLEAN] :is_input_output_memory_management_unit_enabled The value to assign to the {#is_input_output_memory_management_unit_enabled} property
    # @option attributes [Integer] :percentage_of_cores_enabled The value to assign to the {#percentage_of_cores_enabled} property
    # @option attributes [Hash<String, String>] :config_map The value to assign to the {#config_map} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'INTEL_SKYLAKE_BM'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.numa_nodes_per_socket = attributes[:'numaNodesPerSocket'] if attributes[:'numaNodesPerSocket']
      self.numa_nodes_per_socket = "NPS1" if numa_nodes_per_socket.nil? && !attributes.key?(:'numaNodesPerSocket') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :numaNodesPerSocket and :numa_nodes_per_socket' if attributes.key?(:'numaNodesPerSocket') && attributes.key?(:'numa_nodes_per_socket')

      self.numa_nodes_per_socket = attributes[:'numa_nodes_per_socket'] if attributes[:'numa_nodes_per_socket']
      self.numa_nodes_per_socket = "NPS1" if numa_nodes_per_socket.nil? && !attributes.key?(:'numaNodesPerSocket') && !attributes.key?(:'numa_nodes_per_socket') # rubocop:disable Style/StringLiterals

      self.is_symmetric_multi_threading_enabled = attributes[:'isSymmetricMultiThreadingEnabled'] unless attributes[:'isSymmetricMultiThreadingEnabled'].nil?
      self.is_symmetric_multi_threading_enabled = true if is_symmetric_multi_threading_enabled.nil? && !attributes.key?(:'isSymmetricMultiThreadingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSymmetricMultiThreadingEnabled and :is_symmetric_multi_threading_enabled' if attributes.key?(:'isSymmetricMultiThreadingEnabled') && attributes.key?(:'is_symmetric_multi_threading_enabled')

      self.is_symmetric_multi_threading_enabled = attributes[:'is_symmetric_multi_threading_enabled'] unless attributes[:'is_symmetric_multi_threading_enabled'].nil?
      self.is_symmetric_multi_threading_enabled = true if is_symmetric_multi_threading_enabled.nil? && !attributes.key?(:'isSymmetricMultiThreadingEnabled') && !attributes.key?(:'is_symmetric_multi_threading_enabled') # rubocop:disable Style/StringLiterals

      self.is_input_output_memory_management_unit_enabled = attributes[:'isInputOutputMemoryManagementUnitEnabled'] unless attributes[:'isInputOutputMemoryManagementUnitEnabled'].nil?
      self.is_input_output_memory_management_unit_enabled = true if is_input_output_memory_management_unit_enabled.nil? && !attributes.key?(:'isInputOutputMemoryManagementUnitEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isInputOutputMemoryManagementUnitEnabled and :is_input_output_memory_management_unit_enabled' if attributes.key?(:'isInputOutputMemoryManagementUnitEnabled') && attributes.key?(:'is_input_output_memory_management_unit_enabled')

      self.is_input_output_memory_management_unit_enabled = attributes[:'is_input_output_memory_management_unit_enabled'] unless attributes[:'is_input_output_memory_management_unit_enabled'].nil?
      self.is_input_output_memory_management_unit_enabled = true if is_input_output_memory_management_unit_enabled.nil? && !attributes.key?(:'isInputOutputMemoryManagementUnitEnabled') && !attributes.key?(:'is_input_output_memory_management_unit_enabled') # rubocop:disable Style/StringLiterals

      self.percentage_of_cores_enabled = attributes[:'percentageOfCoresEnabled'] if attributes[:'percentageOfCoresEnabled']

      raise 'You cannot provide both :percentageOfCoresEnabled and :percentage_of_cores_enabled' if attributes.key?(:'percentageOfCoresEnabled') && attributes.key?(:'percentage_of_cores_enabled')

      self.percentage_of_cores_enabled = attributes[:'percentage_of_cores_enabled'] if attributes[:'percentage_of_cores_enabled']

      self.config_map = attributes[:'configMap'] if attributes[:'configMap']

      raise 'You cannot provide both :configMap and :config_map' if attributes.key?(:'configMap') && attributes.key?(:'config_map')

      self.config_map = attributes[:'config_map'] if attributes[:'config_map']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] numa_nodes_per_socket Object to be assigned
    def numa_nodes_per_socket=(numa_nodes_per_socket)
      raise "Invalid value for 'numa_nodes_per_socket': this must be one of the values in NUMA_NODES_PER_SOCKET_ENUM." if numa_nodes_per_socket && !NUMA_NODES_PER_SOCKET_ENUM.include?(numa_nodes_per_socket)

      @numa_nodes_per_socket = numa_nodes_per_socket
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        is_secure_boot_enabled == other.is_secure_boot_enabled &&
        is_trusted_platform_module_enabled == other.is_trusted_platform_module_enabled &&
        is_measured_boot_enabled == other.is_measured_boot_enabled &&
        is_memory_encryption_enabled == other.is_memory_encryption_enabled &&
        numa_nodes_per_socket == other.numa_nodes_per_socket &&
        is_symmetric_multi_threading_enabled == other.is_symmetric_multi_threading_enabled &&
        is_input_output_memory_management_unit_enabled == other.is_input_output_memory_management_unit_enabled &&
        percentage_of_cores_enabled == other.percentage_of_cores_enabled &&
        config_map == other.config_map
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
      [type, is_secure_boot_enabled, is_trusted_platform_module_enabled, is_measured_boot_enabled, is_memory_encryption_enabled, numa_nodes_per_socket, is_symmetric_multi_threading_enabled, is_input_output_memory_management_unit_enabled, percentage_of_cores_enabled, config_map].hash
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
