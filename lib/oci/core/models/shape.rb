# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A compute instance shape that can be used in {#launch_instance launch_instance}.
  # For more information, see [Overview of the Compute Service](https://docs.cloud.oracle.com/iaas/Content/Compute/Concepts/computeoverview.htm) and
  # [Compute Shapes](https://docs.cloud.oracle.com/iaas/Content/Compute/References/computeshapes.htm).
  #
  class Core::Models::Shape
    BASELINE_OCPU_UTILIZATIONS_ENUM = [
      BASELINE_OCPU_UTILIZATIONS_BASELINE_1_8 = 'BASELINE_1_8'.freeze,
      BASELINE_OCPU_UTILIZATIONS_BASELINE_1_2 = 'BASELINE_1_2'.freeze,
      BASELINE_OCPU_UTILIZATIONS_BASELINE_1_1 = 'BASELINE_1_1'.freeze,
      BASELINE_OCPU_UTILIZATIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # For a subcore burstable VM, the supported baseline OCPU utilization for instances that use this shape.
    #
    # @return [Array<String>]
    attr_reader :baseline_ocpu_utilizations

    # For a subcore burstable VM, the minimum total baseline OCPUs required. The total baseline OCPUs is equal to
    # baselineOcpuUtilization chosen multiplied by the number of OCPUs chosen.
    #
    # @return [Float]
    attr_accessor :min_total_baseline_ocpus_required

    # **[Required]** The name of the shape. You can enumerate all available shapes by calling
    # {#list_shapes list_shapes}.
    #
    # @return [String]
    attr_accessor :shape

    # A short description of the shape's processor (CPU).
    #
    # @return [String]
    attr_accessor :processor_description

    # The default number of OCPUs available for this shape.
    #
    # @return [Float]
    attr_accessor :ocpus

    # The default amount of memory available for this shape, in gigabytes.
    #
    # @return [Float]
    attr_accessor :memory_in_gbs

    # The networking bandwidth available for this shape, in gigabits per second.
    #
    # @return [Float]
    attr_accessor :networking_bandwidth_in_gbps

    # The maximum number of VNIC attachments available for this shape.
    #
    # @return [Integer]
    attr_accessor :max_vnic_attachments

    # The number of GPUs available for this shape.
    #
    # @return [Integer]
    attr_accessor :gpus

    # A short description of the graphics processing unit (GPU) available for this shape.
    #
    # If the shape does not have any GPUs, this field is `null`.
    #
    # @return [String]
    attr_accessor :gpu_description

    # The number of local disks available for this shape.
    #
    # @return [Integer]
    attr_accessor :local_disks

    # The aggregate size of the local disks available for this shape, in gigabytes.
    #
    # If the shape does not have any local disks, this field is `null`.
    #
    # @return [Float]
    attr_accessor :local_disks_total_size_in_gbs

    # A short description of the local disks available for this shape.
    #
    # If the shape does not have any local disks, this field is `null`.
    #
    # @return [String]
    attr_accessor :local_disk_description

    # Whether live migration is supported for this shape.
    #
    # @return [BOOLEAN]
    attr_accessor :is_live_migration_supported

    # @return [OCI::Core::Models::ShapeOcpuOptions]
    attr_accessor :ocpu_options

    # @return [OCI::Core::Models::ShapeMemoryOptions]
    attr_accessor :memory_options

    # @return [OCI::Core::Models::ShapeNetworkingBandwidthOptions]
    attr_accessor :networking_bandwidth_options

    # @return [OCI::Core::Models::ShapeMaxVnicAttachmentOptions]
    attr_accessor :max_vnic_attachment_options

    # @return [OCI::Core::Models::ShapePlatformConfigOptions]
    attr_accessor :platform_config_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'baseline_ocpu_utilizations': :'baselineOcpuUtilizations',
        'min_total_baseline_ocpus_required': :'minTotalBaselineOcpusRequired',
        'shape': :'shape',
        'processor_description': :'processorDescription',
        'ocpus': :'ocpus',
        'memory_in_gbs': :'memoryInGBs',
        'networking_bandwidth_in_gbps': :'networkingBandwidthInGbps',
        'max_vnic_attachments': :'maxVnicAttachments',
        'gpus': :'gpus',
        'gpu_description': :'gpuDescription',
        'local_disks': :'localDisks',
        'local_disks_total_size_in_gbs': :'localDisksTotalSizeInGBs',
        'local_disk_description': :'localDiskDescription',
        'is_live_migration_supported': :'isLiveMigrationSupported',
        'ocpu_options': :'ocpuOptions',
        'memory_options': :'memoryOptions',
        'networking_bandwidth_options': :'networkingBandwidthOptions',
        'max_vnic_attachment_options': :'maxVnicAttachmentOptions',
        'platform_config_options': :'platformConfigOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'baseline_ocpu_utilizations': :'Array<String>',
        'min_total_baseline_ocpus_required': :'Float',
        'shape': :'String',
        'processor_description': :'String',
        'ocpus': :'Float',
        'memory_in_gbs': :'Float',
        'networking_bandwidth_in_gbps': :'Float',
        'max_vnic_attachments': :'Integer',
        'gpus': :'Integer',
        'gpu_description': :'String',
        'local_disks': :'Integer',
        'local_disks_total_size_in_gbs': :'Float',
        'local_disk_description': :'String',
        'is_live_migration_supported': :'BOOLEAN',
        'ocpu_options': :'OCI::Core::Models::ShapeOcpuOptions',
        'memory_options': :'OCI::Core::Models::ShapeMemoryOptions',
        'networking_bandwidth_options': :'OCI::Core::Models::ShapeNetworkingBandwidthOptions',
        'max_vnic_attachment_options': :'OCI::Core::Models::ShapeMaxVnicAttachmentOptions',
        'platform_config_options': :'OCI::Core::Models::ShapePlatformConfigOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :baseline_ocpu_utilizations The value to assign to the {#baseline_ocpu_utilizations} property
    # @option attributes [Float] :min_total_baseline_ocpus_required The value to assign to the {#min_total_baseline_ocpus_required} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [String] :processor_description The value to assign to the {#processor_description} property
    # @option attributes [Float] :ocpus The value to assign to the {#ocpus} property
    # @option attributes [Float] :memory_in_gbs The value to assign to the {#memory_in_gbs} property
    # @option attributes [Float] :networking_bandwidth_in_gbps The value to assign to the {#networking_bandwidth_in_gbps} property
    # @option attributes [Integer] :max_vnic_attachments The value to assign to the {#max_vnic_attachments} property
    # @option attributes [Integer] :gpus The value to assign to the {#gpus} property
    # @option attributes [String] :gpu_description The value to assign to the {#gpu_description} property
    # @option attributes [Integer] :local_disks The value to assign to the {#local_disks} property
    # @option attributes [Float] :local_disks_total_size_in_gbs The value to assign to the {#local_disks_total_size_in_gbs} property
    # @option attributes [String] :local_disk_description The value to assign to the {#local_disk_description} property
    # @option attributes [BOOLEAN] :is_live_migration_supported The value to assign to the {#is_live_migration_supported} property
    # @option attributes [OCI::Core::Models::ShapeOcpuOptions] :ocpu_options The value to assign to the {#ocpu_options} property
    # @option attributes [OCI::Core::Models::ShapeMemoryOptions] :memory_options The value to assign to the {#memory_options} property
    # @option attributes [OCI::Core::Models::ShapeNetworkingBandwidthOptions] :networking_bandwidth_options The value to assign to the {#networking_bandwidth_options} property
    # @option attributes [OCI::Core::Models::ShapeMaxVnicAttachmentOptions] :max_vnic_attachment_options The value to assign to the {#max_vnic_attachment_options} property
    # @option attributes [OCI::Core::Models::ShapePlatformConfigOptions] :platform_config_options The value to assign to the {#platform_config_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.baseline_ocpu_utilizations = attributes[:'baselineOcpuUtilizations'] if attributes[:'baselineOcpuUtilizations']

      raise 'You cannot provide both :baselineOcpuUtilizations and :baseline_ocpu_utilizations' if attributes.key?(:'baselineOcpuUtilizations') && attributes.key?(:'baseline_ocpu_utilizations')

      self.baseline_ocpu_utilizations = attributes[:'baseline_ocpu_utilizations'] if attributes[:'baseline_ocpu_utilizations']

      self.min_total_baseline_ocpus_required = attributes[:'minTotalBaselineOcpusRequired'] if attributes[:'minTotalBaselineOcpusRequired']

      raise 'You cannot provide both :minTotalBaselineOcpusRequired and :min_total_baseline_ocpus_required' if attributes.key?(:'minTotalBaselineOcpusRequired') && attributes.key?(:'min_total_baseline_ocpus_required')

      self.min_total_baseline_ocpus_required = attributes[:'min_total_baseline_ocpus_required'] if attributes[:'min_total_baseline_ocpus_required']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.processor_description = attributes[:'processorDescription'] if attributes[:'processorDescription']

      raise 'You cannot provide both :processorDescription and :processor_description' if attributes.key?(:'processorDescription') && attributes.key?(:'processor_description')

      self.processor_description = attributes[:'processor_description'] if attributes[:'processor_description']

      self.ocpus = attributes[:'ocpus'] if attributes[:'ocpus']

      self.memory_in_gbs = attributes[:'memoryInGBs'] if attributes[:'memoryInGBs']

      raise 'You cannot provide both :memoryInGBs and :memory_in_gbs' if attributes.key?(:'memoryInGBs') && attributes.key?(:'memory_in_gbs')

      self.memory_in_gbs = attributes[:'memory_in_gbs'] if attributes[:'memory_in_gbs']

      self.networking_bandwidth_in_gbps = attributes[:'networkingBandwidthInGbps'] if attributes[:'networkingBandwidthInGbps']

      raise 'You cannot provide both :networkingBandwidthInGbps and :networking_bandwidth_in_gbps' if attributes.key?(:'networkingBandwidthInGbps') && attributes.key?(:'networking_bandwidth_in_gbps')

      self.networking_bandwidth_in_gbps = attributes[:'networking_bandwidth_in_gbps'] if attributes[:'networking_bandwidth_in_gbps']

      self.max_vnic_attachments = attributes[:'maxVnicAttachments'] if attributes[:'maxVnicAttachments']

      raise 'You cannot provide both :maxVnicAttachments and :max_vnic_attachments' if attributes.key?(:'maxVnicAttachments') && attributes.key?(:'max_vnic_attachments')

      self.max_vnic_attachments = attributes[:'max_vnic_attachments'] if attributes[:'max_vnic_attachments']

      self.gpus = attributes[:'gpus'] if attributes[:'gpus']

      self.gpu_description = attributes[:'gpuDescription'] if attributes[:'gpuDescription']

      raise 'You cannot provide both :gpuDescription and :gpu_description' if attributes.key?(:'gpuDescription') && attributes.key?(:'gpu_description')

      self.gpu_description = attributes[:'gpu_description'] if attributes[:'gpu_description']

      self.local_disks = attributes[:'localDisks'] if attributes[:'localDisks']

      raise 'You cannot provide both :localDisks and :local_disks' if attributes.key?(:'localDisks') && attributes.key?(:'local_disks')

      self.local_disks = attributes[:'local_disks'] if attributes[:'local_disks']

      self.local_disks_total_size_in_gbs = attributes[:'localDisksTotalSizeInGBs'] if attributes[:'localDisksTotalSizeInGBs']

      raise 'You cannot provide both :localDisksTotalSizeInGBs and :local_disks_total_size_in_gbs' if attributes.key?(:'localDisksTotalSizeInGBs') && attributes.key?(:'local_disks_total_size_in_gbs')

      self.local_disks_total_size_in_gbs = attributes[:'local_disks_total_size_in_gbs'] if attributes[:'local_disks_total_size_in_gbs']

      self.local_disk_description = attributes[:'localDiskDescription'] if attributes[:'localDiskDescription']

      raise 'You cannot provide both :localDiskDescription and :local_disk_description' if attributes.key?(:'localDiskDescription') && attributes.key?(:'local_disk_description')

      self.local_disk_description = attributes[:'local_disk_description'] if attributes[:'local_disk_description']

      self.is_live_migration_supported = attributes[:'isLiveMigrationSupported'] unless attributes[:'isLiveMigrationSupported'].nil?

      raise 'You cannot provide both :isLiveMigrationSupported and :is_live_migration_supported' if attributes.key?(:'isLiveMigrationSupported') && attributes.key?(:'is_live_migration_supported')

      self.is_live_migration_supported = attributes[:'is_live_migration_supported'] unless attributes[:'is_live_migration_supported'].nil?

      self.ocpu_options = attributes[:'ocpuOptions'] if attributes[:'ocpuOptions']

      raise 'You cannot provide both :ocpuOptions and :ocpu_options' if attributes.key?(:'ocpuOptions') && attributes.key?(:'ocpu_options')

      self.ocpu_options = attributes[:'ocpu_options'] if attributes[:'ocpu_options']

      self.memory_options = attributes[:'memoryOptions'] if attributes[:'memoryOptions']

      raise 'You cannot provide both :memoryOptions and :memory_options' if attributes.key?(:'memoryOptions') && attributes.key?(:'memory_options')

      self.memory_options = attributes[:'memory_options'] if attributes[:'memory_options']

      self.networking_bandwidth_options = attributes[:'networkingBandwidthOptions'] if attributes[:'networkingBandwidthOptions']

      raise 'You cannot provide both :networkingBandwidthOptions and :networking_bandwidth_options' if attributes.key?(:'networkingBandwidthOptions') && attributes.key?(:'networking_bandwidth_options')

      self.networking_bandwidth_options = attributes[:'networking_bandwidth_options'] if attributes[:'networking_bandwidth_options']

      self.max_vnic_attachment_options = attributes[:'maxVnicAttachmentOptions'] if attributes[:'maxVnicAttachmentOptions']

      raise 'You cannot provide both :maxVnicAttachmentOptions and :max_vnic_attachment_options' if attributes.key?(:'maxVnicAttachmentOptions') && attributes.key?(:'max_vnic_attachment_options')

      self.max_vnic_attachment_options = attributes[:'max_vnic_attachment_options'] if attributes[:'max_vnic_attachment_options']

      self.platform_config_options = attributes[:'platformConfigOptions'] if attributes[:'platformConfigOptions']

      raise 'You cannot provide both :platformConfigOptions and :platform_config_options' if attributes.key?(:'platformConfigOptions') && attributes.key?(:'platform_config_options')

      self.platform_config_options = attributes[:'platform_config_options'] if attributes[:'platform_config_options']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] baseline_ocpu_utilizations Object to be assigned
    def baseline_ocpu_utilizations=(baseline_ocpu_utilizations)
      # rubocop:disable Style/ConditionalAssignment
      if baseline_ocpu_utilizations.nil?
        @baseline_ocpu_utilizations = nil
      else
        @baseline_ocpu_utilizations =
          baseline_ocpu_utilizations.collect do |item|
            if BASELINE_OCPU_UTILIZATIONS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'baseline_ocpu_utilizations' [#{item}]. Mapping to 'BASELINE_OCPU_UTILIZATIONS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              BASELINE_OCPU_UTILIZATIONS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        baseline_ocpu_utilizations == other.baseline_ocpu_utilizations &&
        min_total_baseline_ocpus_required == other.min_total_baseline_ocpus_required &&
        shape == other.shape &&
        processor_description == other.processor_description &&
        ocpus == other.ocpus &&
        memory_in_gbs == other.memory_in_gbs &&
        networking_bandwidth_in_gbps == other.networking_bandwidth_in_gbps &&
        max_vnic_attachments == other.max_vnic_attachments &&
        gpus == other.gpus &&
        gpu_description == other.gpu_description &&
        local_disks == other.local_disks &&
        local_disks_total_size_in_gbs == other.local_disks_total_size_in_gbs &&
        local_disk_description == other.local_disk_description &&
        is_live_migration_supported == other.is_live_migration_supported &&
        ocpu_options == other.ocpu_options &&
        memory_options == other.memory_options &&
        networking_bandwidth_options == other.networking_bandwidth_options &&
        max_vnic_attachment_options == other.max_vnic_attachment_options &&
        platform_config_options == other.platform_config_options
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
      [baseline_ocpu_utilizations, min_total_baseline_ocpus_required, shape, processor_description, ocpus, memory_in_gbs, networking_bandwidth_in_gbps, max_vnic_attachments, gpus, gpu_description, local_disks, local_disks_total_size_in_gbs, local_disk_description, is_live_migration_supported, ocpu_options, memory_options, networking_bandwidth_options, max_vnic_attachment_options, platform_config_options].hash
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
