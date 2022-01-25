# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'instance_configuration_launch_instance_platform_config'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The platform configuration used when launching a bare metal instance with an E4 shape
  # (the AMD Milan platform).
  #
  class Core::Models::InstanceConfigurationAmdMilanBmLaunchInstancePlatformConfig < Core::Models::InstanceConfigurationLaunchInstancePlatformConfig
    NUMA_NODES_PER_SOCKET_ENUM = [
      NUMA_NODES_PER_SOCKET_NPS0 = 'NPS0'.freeze,
      NUMA_NODES_PER_SOCKET_NPS1 = 'NPS1'.freeze,
      NUMA_NODES_PER_SOCKET_NPS2 = 'NPS2'.freeze,
      NUMA_NODES_PER_SOCKET_NPS4 = 'NPS4'.freeze,
      NUMA_NODES_PER_SOCKET_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The number of NUMA nodes per socket.
    #
    # @return [String]
    attr_reader :numa_nodes_per_socket

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'is_secure_boot_enabled': :'isSecureBootEnabled',
        'is_trusted_platform_module_enabled': :'isTrustedPlatformModuleEnabled',
        'is_measured_boot_enabled': :'isMeasuredBootEnabled',
        'numa_nodes_per_socket': :'numaNodesPerSocket'
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
        'numa_nodes_per_socket': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_secure_boot_enabled The value to assign to the {OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig#is_secure_boot_enabled #is_secure_boot_enabled} proprety
    # @option attributes [BOOLEAN] :is_trusted_platform_module_enabled The value to assign to the {OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig#is_trusted_platform_module_enabled #is_trusted_platform_module_enabled} proprety
    # @option attributes [BOOLEAN] :is_measured_boot_enabled The value to assign to the {OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig#is_measured_boot_enabled #is_measured_boot_enabled} proprety
    # @option attributes [String] :numa_nodes_per_socket The value to assign to the {#numa_nodes_per_socket} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'AMD_MILAN_BM'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.numa_nodes_per_socket = attributes[:'numaNodesPerSocket'] if attributes[:'numaNodesPerSocket']
      self.numa_nodes_per_socket = "NPS1" if numa_nodes_per_socket.nil? && !attributes.key?(:'numaNodesPerSocket') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :numaNodesPerSocket and :numa_nodes_per_socket' if attributes.key?(:'numaNodesPerSocket') && attributes.key?(:'numa_nodes_per_socket')

      self.numa_nodes_per_socket = attributes[:'numa_nodes_per_socket'] if attributes[:'numa_nodes_per_socket']
      self.numa_nodes_per_socket = "NPS1" if numa_nodes_per_socket.nil? && !attributes.key?(:'numaNodesPerSocket') && !attributes.key?(:'numa_nodes_per_socket') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] numa_nodes_per_socket Object to be assigned
    def numa_nodes_per_socket=(numa_nodes_per_socket)
      # rubocop:disable Style/ConditionalAssignment
      if numa_nodes_per_socket && !NUMA_NODES_PER_SOCKET_ENUM.include?(numa_nodes_per_socket)
        OCI.logger.debug("Unknown value for 'numa_nodes_per_socket' [" + numa_nodes_per_socket + "]. Mapping to 'NUMA_NODES_PER_SOCKET_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @numa_nodes_per_socket = NUMA_NODES_PER_SOCKET_UNKNOWN_ENUM_VALUE
      else
        @numa_nodes_per_socket = numa_nodes_per_socket
      end
      # rubocop:enable Style/ConditionalAssignment
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
        numa_nodes_per_socket == other.numa_nodes_per_socket
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
      [type, is_secure_boot_enabled, is_trusted_platform_module_enabled, is_measured_boot_enabled, numa_nodes_per_socket].hash
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
