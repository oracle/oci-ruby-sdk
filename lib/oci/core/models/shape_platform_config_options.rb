# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The list of supported platform configuration options for this shape.
  #
  class Core::Models::ShapePlatformConfigOptions
    TYPE_ENUM = [
      TYPE_AMD_MILAN_BM = 'AMD_MILAN_BM'.freeze,
      TYPE_AMD_ROME_BM = 'AMD_ROME_BM'.freeze,
      TYPE_AMD_ROME_BM_GPU = 'AMD_ROME_BM_GPU'.freeze,
      TYPE_INTEL_ICELAKE_BM = 'INTEL_ICELAKE_BM'.freeze,
      TYPE_INTEL_SKYLAKE_BM = 'INTEL_SKYLAKE_BM'.freeze,
      TYPE_AMD_VM = 'AMD_VM'.freeze,
      TYPE_INTEL_VM = 'INTEL_VM'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The type of platform being configured.
    #
    # @return [String]
    attr_reader :type

    # @return [OCI::Core::Models::ShapeSecureBootOptions]
    attr_accessor :secure_boot_options

    # @return [OCI::Core::Models::ShapeMeasuredBootOptions]
    attr_accessor :measured_boot_options

    # @return [OCI::Core::Models::ShapeTrustedPlatformModuleOptions]
    attr_accessor :trusted_platform_module_options

    # @return [OCI::Core::Models::ShapeNumaNodesPerSocketPlatformOptions]
    attr_accessor :numa_nodes_per_socket_platform_options

    # @return [OCI::Core::Models::ShapeSymmetricMultiThreadingEnabledPlatformOptions]
    attr_accessor :symmetric_multi_threading_options

    # @return [OCI::Core::Models::ShapeAccessControlServiceEnabledPlatformOptions]
    attr_accessor :access_control_service_options

    # @return [OCI::Core::Models::ShapeVirtualInstructionsEnabledPlatformOptions]
    attr_accessor :virtual_instructions_options

    # @return [OCI::Core::Models::ShapeInputOutputMemoryManagementUnitEnabledPlatformOptions]
    attr_accessor :input_output_memory_management_unit_options

    # @return [OCI::Core::Models::PercentageOfCoresEnabledOptions]
    attr_accessor :percentage_of_cores_enabled_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'secure_boot_options': :'secureBootOptions',
        'measured_boot_options': :'measuredBootOptions',
        'trusted_platform_module_options': :'trustedPlatformModuleOptions',
        'numa_nodes_per_socket_platform_options': :'numaNodesPerSocketPlatformOptions',
        'symmetric_multi_threading_options': :'symmetricMultiThreadingOptions',
        'access_control_service_options': :'accessControlServiceOptions',
        'virtual_instructions_options': :'virtualInstructionsOptions',
        'input_output_memory_management_unit_options': :'inputOutputMemoryManagementUnitOptions',
        'percentage_of_cores_enabled_options': :'percentageOfCoresEnabledOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'secure_boot_options': :'OCI::Core::Models::ShapeSecureBootOptions',
        'measured_boot_options': :'OCI::Core::Models::ShapeMeasuredBootOptions',
        'trusted_platform_module_options': :'OCI::Core::Models::ShapeTrustedPlatformModuleOptions',
        'numa_nodes_per_socket_platform_options': :'OCI::Core::Models::ShapeNumaNodesPerSocketPlatformOptions',
        'symmetric_multi_threading_options': :'OCI::Core::Models::ShapeSymmetricMultiThreadingEnabledPlatformOptions',
        'access_control_service_options': :'OCI::Core::Models::ShapeAccessControlServiceEnabledPlatformOptions',
        'virtual_instructions_options': :'OCI::Core::Models::ShapeVirtualInstructionsEnabledPlatformOptions',
        'input_output_memory_management_unit_options': :'OCI::Core::Models::ShapeInputOutputMemoryManagementUnitEnabledPlatformOptions',
        'percentage_of_cores_enabled_options': :'OCI::Core::Models::PercentageOfCoresEnabledOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [OCI::Core::Models::ShapeSecureBootOptions] :secure_boot_options The value to assign to the {#secure_boot_options} property
    # @option attributes [OCI::Core::Models::ShapeMeasuredBootOptions] :measured_boot_options The value to assign to the {#measured_boot_options} property
    # @option attributes [OCI::Core::Models::ShapeTrustedPlatformModuleOptions] :trusted_platform_module_options The value to assign to the {#trusted_platform_module_options} property
    # @option attributes [OCI::Core::Models::ShapeNumaNodesPerSocketPlatformOptions] :numa_nodes_per_socket_platform_options The value to assign to the {#numa_nodes_per_socket_platform_options} property
    # @option attributes [OCI::Core::Models::ShapeSymmetricMultiThreadingEnabledPlatformOptions] :symmetric_multi_threading_options The value to assign to the {#symmetric_multi_threading_options} property
    # @option attributes [OCI::Core::Models::ShapeAccessControlServiceEnabledPlatformOptions] :access_control_service_options The value to assign to the {#access_control_service_options} property
    # @option attributes [OCI::Core::Models::ShapeVirtualInstructionsEnabledPlatformOptions] :virtual_instructions_options The value to assign to the {#virtual_instructions_options} property
    # @option attributes [OCI::Core::Models::ShapeInputOutputMemoryManagementUnitEnabledPlatformOptions] :input_output_memory_management_unit_options The value to assign to the {#input_output_memory_management_unit_options} property
    # @option attributes [OCI::Core::Models::PercentageOfCoresEnabledOptions] :percentage_of_cores_enabled_options The value to assign to the {#percentage_of_cores_enabled_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.secure_boot_options = attributes[:'secureBootOptions'] if attributes[:'secureBootOptions']

      raise 'You cannot provide both :secureBootOptions and :secure_boot_options' if attributes.key?(:'secureBootOptions') && attributes.key?(:'secure_boot_options')

      self.secure_boot_options = attributes[:'secure_boot_options'] if attributes[:'secure_boot_options']

      self.measured_boot_options = attributes[:'measuredBootOptions'] if attributes[:'measuredBootOptions']

      raise 'You cannot provide both :measuredBootOptions and :measured_boot_options' if attributes.key?(:'measuredBootOptions') && attributes.key?(:'measured_boot_options')

      self.measured_boot_options = attributes[:'measured_boot_options'] if attributes[:'measured_boot_options']

      self.trusted_platform_module_options = attributes[:'trustedPlatformModuleOptions'] if attributes[:'trustedPlatformModuleOptions']

      raise 'You cannot provide both :trustedPlatformModuleOptions and :trusted_platform_module_options' if attributes.key?(:'trustedPlatformModuleOptions') && attributes.key?(:'trusted_platform_module_options')

      self.trusted_platform_module_options = attributes[:'trusted_platform_module_options'] if attributes[:'trusted_platform_module_options']

      self.numa_nodes_per_socket_platform_options = attributes[:'numaNodesPerSocketPlatformOptions'] if attributes[:'numaNodesPerSocketPlatformOptions']

      raise 'You cannot provide both :numaNodesPerSocketPlatformOptions and :numa_nodes_per_socket_platform_options' if attributes.key?(:'numaNodesPerSocketPlatformOptions') && attributes.key?(:'numa_nodes_per_socket_platform_options')

      self.numa_nodes_per_socket_platform_options = attributes[:'numa_nodes_per_socket_platform_options'] if attributes[:'numa_nodes_per_socket_platform_options']

      self.symmetric_multi_threading_options = attributes[:'symmetricMultiThreadingOptions'] if attributes[:'symmetricMultiThreadingOptions']

      raise 'You cannot provide both :symmetricMultiThreadingOptions and :symmetric_multi_threading_options' if attributes.key?(:'symmetricMultiThreadingOptions') && attributes.key?(:'symmetric_multi_threading_options')

      self.symmetric_multi_threading_options = attributes[:'symmetric_multi_threading_options'] if attributes[:'symmetric_multi_threading_options']

      self.access_control_service_options = attributes[:'accessControlServiceOptions'] if attributes[:'accessControlServiceOptions']

      raise 'You cannot provide both :accessControlServiceOptions and :access_control_service_options' if attributes.key?(:'accessControlServiceOptions') && attributes.key?(:'access_control_service_options')

      self.access_control_service_options = attributes[:'access_control_service_options'] if attributes[:'access_control_service_options']

      self.virtual_instructions_options = attributes[:'virtualInstructionsOptions'] if attributes[:'virtualInstructionsOptions']

      raise 'You cannot provide both :virtualInstructionsOptions and :virtual_instructions_options' if attributes.key?(:'virtualInstructionsOptions') && attributes.key?(:'virtual_instructions_options')

      self.virtual_instructions_options = attributes[:'virtual_instructions_options'] if attributes[:'virtual_instructions_options']

      self.input_output_memory_management_unit_options = attributes[:'inputOutputMemoryManagementUnitOptions'] if attributes[:'inputOutputMemoryManagementUnitOptions']

      raise 'You cannot provide both :inputOutputMemoryManagementUnitOptions and :input_output_memory_management_unit_options' if attributes.key?(:'inputOutputMemoryManagementUnitOptions') && attributes.key?(:'input_output_memory_management_unit_options')

      self.input_output_memory_management_unit_options = attributes[:'input_output_memory_management_unit_options'] if attributes[:'input_output_memory_management_unit_options']

      self.percentage_of_cores_enabled_options = attributes[:'percentageOfCoresEnabledOptions'] if attributes[:'percentageOfCoresEnabledOptions']

      raise 'You cannot provide both :percentageOfCoresEnabledOptions and :percentage_of_cores_enabled_options' if attributes.key?(:'percentageOfCoresEnabledOptions') && attributes.key?(:'percentage_of_cores_enabled_options')

      self.percentage_of_cores_enabled_options = attributes[:'percentage_of_cores_enabled_options'] if attributes[:'percentage_of_cores_enabled_options']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
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
        secure_boot_options == other.secure_boot_options &&
        measured_boot_options == other.measured_boot_options &&
        trusted_platform_module_options == other.trusted_platform_module_options &&
        numa_nodes_per_socket_platform_options == other.numa_nodes_per_socket_platform_options &&
        symmetric_multi_threading_options == other.symmetric_multi_threading_options &&
        access_control_service_options == other.access_control_service_options &&
        virtual_instructions_options == other.virtual_instructions_options &&
        input_output_memory_management_unit_options == other.input_output_memory_management_unit_options &&
        percentage_of_cores_enabled_options == other.percentage_of_cores_enabled_options
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
      [type, secure_boot_options, measured_boot_options, trusted_platform_module_options, numa_nodes_per_socket_platform_options, symmetric_multi_threading_options, access_control_service_options, virtual_instructions_options, input_output_memory_management_unit_options, percentage_of_cores_enabled_options].hash
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
