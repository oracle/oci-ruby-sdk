# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # Options for tuning compatibility and performance of VM shapes.
  #
  class Core::Models::LaunchOptions # rubocop:disable Metrics/LineLength
    BOOT_VOLUME_TYPE_ENUM = [
      BOOT_VOLUME_TYPE_ISCSI = 'ISCSI'.freeze,
      BOOT_VOLUME_TYPE_SCSI = 'SCSI'.freeze,
      BOOT_VOLUME_TYPE_IDE = 'IDE'.freeze,
      BOOT_VOLUME_TYPE_VFIO = 'VFIO'.freeze,
      BOOT_VOLUME_TYPE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      BOOT_VOLUME_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    FIRMWARE_ENUM = [
      FIRMWARE_BIOS = 'BIOS'.freeze,
      FIRMWARE_UEFI_64 = 'UEFI_64'.freeze,
      FIRMWARE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NETWORK_TYPE_ENUM = [
      NETWORK_TYPE_E1000 = 'E1000'.freeze,
      NETWORK_TYPE_VFIO = 'VFIO'.freeze,
      NETWORK_TYPE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      NETWORK_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REMOTE_DATA_VOLUME_TYPE_ENUM = [
      REMOTE_DATA_VOLUME_TYPE_ISCSI = 'ISCSI'.freeze,
      REMOTE_DATA_VOLUME_TYPE_SCSI = 'SCSI'.freeze,
      REMOTE_DATA_VOLUME_TYPE_IDE = 'IDE'.freeze,
      REMOTE_DATA_VOLUME_TYPE_VFIO = 'VFIO'.freeze,
      REMOTE_DATA_VOLUME_TYPE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      REMOTE_DATA_VOLUME_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Emulation type for volume.
    # * `ISCSI` - ISCSI attached block storage device. This is the default for Boot Volumes and Remote Block
    # Storage volumes on Oracle provided images.
    # * `SCSI` - Emulated SCSI disk.
    # * `IDE` - Emulated IDE disk.
    # * `VFIO` - Direct attached Virtual Function storage.  This is the default option for Local data
    # volumes on Oracle provided images.
    # * `PARAVIRTUALIZED` - Paravirtualized disk.
    #
    # @return [String]
    attr_reader :boot_volume_type

    # **[Required]** Firmware used to boot VM.  Select the option that matches your operating system.
    # * `BIOS` - Boot VM using BIOS style firmware.  This is compatible with both 32 bit and 64 bit operating
    # systems that boot using MBR style bootloaders.
    # * `UEFI_64` - Boot VM using UEFI style firmware compatible with 64 bit operating systems.  This is the
    # default for Oracle provided images.
    #
    # @return [String]
    attr_reader :firmware

    # **[Required]** Emulation type for NIC.
    # * `E1000` - Emulated Gigabit ethernet controller.  Compatible with Linux e1000 network driver.
    # * `VFIO` - Direct attached Virtual Function network controller.  Default for Oracle provided images.
    # * `PARAVIRTUALIZED` - VM instances launch with paravirtualized devices using virtio drivers.
    #
    # @return [String]
    attr_reader :network_type

    # **[Required]** Emulation type for volume.
    # * `ISCSI` - ISCSI attached block storage device. This is the default for Boot Volumes and Remote Block
    # Storage volumes on Oracle provided images.
    # * `SCSI` - Emulated SCSI disk.
    # * `IDE` - Emulated IDE disk.
    # * `VFIO` - Direct attached Virtual Function storage.  This is the default option for Local data
    # volumes on Oracle provided images.
    # * `PARAVIRTUALIZED` - Paravirtualized disk.
    #
    # @return [String]
    attr_reader :remote_data_volume_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'boot_volume_type': :'bootVolumeType',
        'firmware': :'firmware',
        'network_type': :'networkType',
        'remote_data_volume_type': :'remoteDataVolumeType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'boot_volume_type': :'String',
        'firmware': :'String',
        'network_type': :'String',
        'remote_data_volume_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :boot_volume_type The value to assign to the {#boot_volume_type} property
    # @option attributes [String] :firmware The value to assign to the {#firmware} property
    # @option attributes [String] :network_type The value to assign to the {#network_type} property
    # @option attributes [String] :remote_data_volume_type The value to assign to the {#remote_data_volume_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.boot_volume_type = attributes[:'bootVolumeType'] if attributes[:'bootVolumeType']

      raise 'You cannot provide both :bootVolumeType and :boot_volume_type' if attributes.key?(:'bootVolumeType') && attributes.key?(:'boot_volume_type')

      self.boot_volume_type = attributes[:'boot_volume_type'] if attributes[:'boot_volume_type']

      self.firmware = attributes[:'firmware'] if attributes[:'firmware']

      self.network_type = attributes[:'networkType'] if attributes[:'networkType']

      raise 'You cannot provide both :networkType and :network_type' if attributes.key?(:'networkType') && attributes.key?(:'network_type')

      self.network_type = attributes[:'network_type'] if attributes[:'network_type']

      self.remote_data_volume_type = attributes[:'remoteDataVolumeType'] if attributes[:'remoteDataVolumeType']

      raise 'You cannot provide both :remoteDataVolumeType and :remote_data_volume_type' if attributes.key?(:'remoteDataVolumeType') && attributes.key?(:'remote_data_volume_type')

      self.remote_data_volume_type = attributes[:'remote_data_volume_type'] if attributes[:'remote_data_volume_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] boot_volume_type Object to be assigned
    def boot_volume_type=(boot_volume_type)
      # rubocop:disable Style/ConditionalAssignment
      if boot_volume_type && !BOOT_VOLUME_TYPE_ENUM.include?(boot_volume_type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'boot_volume_type' [" + boot_volume_type + "]. Mapping to 'BOOT_VOLUME_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @boot_volume_type = BOOT_VOLUME_TYPE_UNKNOWN_ENUM_VALUE
      else
        @boot_volume_type = boot_volume_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] firmware Object to be assigned
    def firmware=(firmware)
      # rubocop:disable Style/ConditionalAssignment
      if firmware && !FIRMWARE_ENUM.include?(firmware)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'firmware' [" + firmware + "]. Mapping to 'FIRMWARE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @firmware = FIRMWARE_UNKNOWN_ENUM_VALUE
      else
        @firmware = firmware
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] network_type Object to be assigned
    def network_type=(network_type)
      # rubocop:disable Style/ConditionalAssignment
      if network_type && !NETWORK_TYPE_ENUM.include?(network_type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'network_type' [" + network_type + "]. Mapping to 'NETWORK_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @network_type = NETWORK_TYPE_UNKNOWN_ENUM_VALUE
      else
        @network_type = network_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] remote_data_volume_type Object to be assigned
    def remote_data_volume_type=(remote_data_volume_type)
      # rubocop:disable Style/ConditionalAssignment
      if remote_data_volume_type && !REMOTE_DATA_VOLUME_TYPE_ENUM.include?(remote_data_volume_type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'remote_data_volume_type' [" + remote_data_volume_type + "]. Mapping to 'REMOTE_DATA_VOLUME_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @remote_data_volume_type = REMOTE_DATA_VOLUME_TYPE_UNKNOWN_ENUM_VALUE
      else
        @remote_data_volume_type = remote_data_volume_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        boot_volume_type == other.boot_volume_type &&
        firmware == other.firmware &&
        network_type == other.network_type &&
        remote_data_volume_type == other.remote_data_volume_type
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [boot_volume_type, firmware, network_type, remote_data_volume_type].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
