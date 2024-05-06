# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220509
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Compute related properties.
  class CloudBridge::Models::ComputeProperties
    # Primary IP address of the compute instance.
    # @return [String]
    attr_accessor :primary_ip

    # Fully Qualified DNS Name.
    # @return [String]
    attr_accessor :dns_name

    # Information about the asset.
    # @return [String]
    attr_accessor :description

    # Number of CPUs.
    # @return [Integer]
    attr_accessor :cores_count

    # CPU model name.
    # @return [String]
    attr_accessor :cpu_model

    # Number of GPU devices.
    # @return [Integer]
    attr_accessor :gpu_devices_count

    # List of GPU devices attached to a virtual machine.
    # @return [Array<OCI::CloudBridge::Models::GpuDevice>]
    attr_accessor :gpu_devices

    # Number of threads per core.
    # @return [Integer]
    attr_accessor :threads_per_core_count

    # Memory size in MBs.
    # @return [Integer]
    attr_accessor :memory_in_mbs

    # Whether Pmem is enabled. Decides if NVDIMMs are used as a permanent memory.
    # @return [BOOLEAN]
    attr_accessor :is_pmem_enabled

    # Pmem size in MBs.
    # @return [Integer]
    attr_accessor :pmem_in_mbs

    # Operating system.
    # @return [String]
    attr_accessor :operating_system

    # Operating system version.
    # @return [String]
    attr_accessor :operating_system_version

    # Host name of the VM.
    # @return [String]
    attr_accessor :host_name

    # The current power state of the virtual machine.
    # @return [String]
    attr_accessor :power_state

    # Guest state.
    # @return [String]
    attr_accessor :guest_state

    # Whether Trusted Platform Module (TPM) is enabled.
    # @return [BOOLEAN]
    attr_accessor :is_tpm_enabled

    # Number of connected networks.
    # @return [Integer]
    attr_accessor :connected_networks

    # Number of network ethernet cards.
    # @return [Integer]
    attr_accessor :nics_count

    # List of network ethernet cards attached to a virtual machine.
    # @return [Array<OCI::CloudBridge::Models::Nic>]
    attr_accessor :nics

    # Provision storage size in MBs.
    # @return [Integer]
    attr_accessor :storage_provisioned_in_mbs

    # Number of disks.
    # @return [Integer]
    attr_accessor :disks_count

    # Lists the set of disks belonging to the virtual machine. This list is unordered.
    # @return [Array<OCI::CloudBridge::Models::Disk>]
    attr_accessor :disks

    # Information about firmware type for this virtual machine.
    # @return [String]
    attr_accessor :firmware

    # Latency sensitivity.
    # @return [String]
    attr_accessor :latency_sensitivity

    # The properties of the NVDIMMs attached to a virtual machine.
    # @return [Array<OCI::CloudBridge::Models::Nvdimm>]
    attr_accessor :nvdimms

    # @return [OCI::CloudBridge::Models::NvdimmController]
    attr_accessor :nvdimm_controller

    # @return [OCI::CloudBridge::Models::ScsiController]
    attr_accessor :scsi_controller

    # Hardware version.
    # @return [String]
    attr_accessor :hardware_version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'primary_ip': :'primaryIp',
        'dns_name': :'dnsName',
        'description': :'description',
        'cores_count': :'coresCount',
        'cpu_model': :'cpuModel',
        'gpu_devices_count': :'gpuDevicesCount',
        'gpu_devices': :'gpuDevices',
        'threads_per_core_count': :'threadsPerCoreCount',
        'memory_in_mbs': :'memoryInMBs',
        'is_pmem_enabled': :'isPmemEnabled',
        'pmem_in_mbs': :'pmemInMBs',
        'operating_system': :'operatingSystem',
        'operating_system_version': :'operatingSystemVersion',
        'host_name': :'hostName',
        'power_state': :'powerState',
        'guest_state': :'guestState',
        'is_tpm_enabled': :'isTpmEnabled',
        'connected_networks': :'connectedNetworks',
        'nics_count': :'nicsCount',
        'nics': :'nics',
        'storage_provisioned_in_mbs': :'storageProvisionedInMBs',
        'disks_count': :'disksCount',
        'disks': :'disks',
        'firmware': :'firmware',
        'latency_sensitivity': :'latencySensitivity',
        'nvdimms': :'nvdimms',
        'nvdimm_controller': :'nvdimmController',
        'scsi_controller': :'scsiController',
        'hardware_version': :'hardwareVersion'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'primary_ip': :'String',
        'dns_name': :'String',
        'description': :'String',
        'cores_count': :'Integer',
        'cpu_model': :'String',
        'gpu_devices_count': :'Integer',
        'gpu_devices': :'Array<OCI::CloudBridge::Models::GpuDevice>',
        'threads_per_core_count': :'Integer',
        'memory_in_mbs': :'Integer',
        'is_pmem_enabled': :'BOOLEAN',
        'pmem_in_mbs': :'Integer',
        'operating_system': :'String',
        'operating_system_version': :'String',
        'host_name': :'String',
        'power_state': :'String',
        'guest_state': :'String',
        'is_tpm_enabled': :'BOOLEAN',
        'connected_networks': :'Integer',
        'nics_count': :'Integer',
        'nics': :'Array<OCI::CloudBridge::Models::Nic>',
        'storage_provisioned_in_mbs': :'Integer',
        'disks_count': :'Integer',
        'disks': :'Array<OCI::CloudBridge::Models::Disk>',
        'firmware': :'String',
        'latency_sensitivity': :'String',
        'nvdimms': :'Array<OCI::CloudBridge::Models::Nvdimm>',
        'nvdimm_controller': :'OCI::CloudBridge::Models::NvdimmController',
        'scsi_controller': :'OCI::CloudBridge::Models::ScsiController',
        'hardware_version': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :primary_ip The value to assign to the {#primary_ip} property
    # @option attributes [String] :dns_name The value to assign to the {#dns_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :cores_count The value to assign to the {#cores_count} property
    # @option attributes [String] :cpu_model The value to assign to the {#cpu_model} property
    # @option attributes [Integer] :gpu_devices_count The value to assign to the {#gpu_devices_count} property
    # @option attributes [Array<OCI::CloudBridge::Models::GpuDevice>] :gpu_devices The value to assign to the {#gpu_devices} property
    # @option attributes [Integer] :threads_per_core_count The value to assign to the {#threads_per_core_count} property
    # @option attributes [Integer] :memory_in_mbs The value to assign to the {#memory_in_mbs} property
    # @option attributes [BOOLEAN] :is_pmem_enabled The value to assign to the {#is_pmem_enabled} property
    # @option attributes [Integer] :pmem_in_mbs The value to assign to the {#pmem_in_mbs} property
    # @option attributes [String] :operating_system The value to assign to the {#operating_system} property
    # @option attributes [String] :operating_system_version The value to assign to the {#operating_system_version} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :power_state The value to assign to the {#power_state} property
    # @option attributes [String] :guest_state The value to assign to the {#guest_state} property
    # @option attributes [BOOLEAN] :is_tpm_enabled The value to assign to the {#is_tpm_enabled} property
    # @option attributes [Integer] :connected_networks The value to assign to the {#connected_networks} property
    # @option attributes [Integer] :nics_count The value to assign to the {#nics_count} property
    # @option attributes [Array<OCI::CloudBridge::Models::Nic>] :nics The value to assign to the {#nics} property
    # @option attributes [Integer] :storage_provisioned_in_mbs The value to assign to the {#storage_provisioned_in_mbs} property
    # @option attributes [Integer] :disks_count The value to assign to the {#disks_count} property
    # @option attributes [Array<OCI::CloudBridge::Models::Disk>] :disks The value to assign to the {#disks} property
    # @option attributes [String] :firmware The value to assign to the {#firmware} property
    # @option attributes [String] :latency_sensitivity The value to assign to the {#latency_sensitivity} property
    # @option attributes [Array<OCI::CloudBridge::Models::Nvdimm>] :nvdimms The value to assign to the {#nvdimms} property
    # @option attributes [OCI::CloudBridge::Models::NvdimmController] :nvdimm_controller The value to assign to the {#nvdimm_controller} property
    # @option attributes [OCI::CloudBridge::Models::ScsiController] :scsi_controller The value to assign to the {#scsi_controller} property
    # @option attributes [String] :hardware_version The value to assign to the {#hardware_version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.primary_ip = attributes[:'primaryIp'] if attributes[:'primaryIp']

      raise 'You cannot provide both :primaryIp and :primary_ip' if attributes.key?(:'primaryIp') && attributes.key?(:'primary_ip')

      self.primary_ip = attributes[:'primary_ip'] if attributes[:'primary_ip']

      self.dns_name = attributes[:'dnsName'] if attributes[:'dnsName']

      raise 'You cannot provide both :dnsName and :dns_name' if attributes.key?(:'dnsName') && attributes.key?(:'dns_name')

      self.dns_name = attributes[:'dns_name'] if attributes[:'dns_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.cores_count = attributes[:'coresCount'] if attributes[:'coresCount']

      raise 'You cannot provide both :coresCount and :cores_count' if attributes.key?(:'coresCount') && attributes.key?(:'cores_count')

      self.cores_count = attributes[:'cores_count'] if attributes[:'cores_count']

      self.cpu_model = attributes[:'cpuModel'] if attributes[:'cpuModel']

      raise 'You cannot provide both :cpuModel and :cpu_model' if attributes.key?(:'cpuModel') && attributes.key?(:'cpu_model')

      self.cpu_model = attributes[:'cpu_model'] if attributes[:'cpu_model']

      self.gpu_devices_count = attributes[:'gpuDevicesCount'] if attributes[:'gpuDevicesCount']

      raise 'You cannot provide both :gpuDevicesCount and :gpu_devices_count' if attributes.key?(:'gpuDevicesCount') && attributes.key?(:'gpu_devices_count')

      self.gpu_devices_count = attributes[:'gpu_devices_count'] if attributes[:'gpu_devices_count']

      self.gpu_devices = attributes[:'gpuDevices'] if attributes[:'gpuDevices']

      raise 'You cannot provide both :gpuDevices and :gpu_devices' if attributes.key?(:'gpuDevices') && attributes.key?(:'gpu_devices')

      self.gpu_devices = attributes[:'gpu_devices'] if attributes[:'gpu_devices']

      self.threads_per_core_count = attributes[:'threadsPerCoreCount'] if attributes[:'threadsPerCoreCount']

      raise 'You cannot provide both :threadsPerCoreCount and :threads_per_core_count' if attributes.key?(:'threadsPerCoreCount') && attributes.key?(:'threads_per_core_count')

      self.threads_per_core_count = attributes[:'threads_per_core_count'] if attributes[:'threads_per_core_count']

      self.memory_in_mbs = attributes[:'memoryInMBs'] if attributes[:'memoryInMBs']

      raise 'You cannot provide both :memoryInMBs and :memory_in_mbs' if attributes.key?(:'memoryInMBs') && attributes.key?(:'memory_in_mbs')

      self.memory_in_mbs = attributes[:'memory_in_mbs'] if attributes[:'memory_in_mbs']

      self.is_pmem_enabled = attributes[:'isPmemEnabled'] unless attributes[:'isPmemEnabled'].nil?

      raise 'You cannot provide both :isPmemEnabled and :is_pmem_enabled' if attributes.key?(:'isPmemEnabled') && attributes.key?(:'is_pmem_enabled')

      self.is_pmem_enabled = attributes[:'is_pmem_enabled'] unless attributes[:'is_pmem_enabled'].nil?

      self.pmem_in_mbs = attributes[:'pmemInMBs'] if attributes[:'pmemInMBs']

      raise 'You cannot provide both :pmemInMBs and :pmem_in_mbs' if attributes.key?(:'pmemInMBs') && attributes.key?(:'pmem_in_mbs')

      self.pmem_in_mbs = attributes[:'pmem_in_mbs'] if attributes[:'pmem_in_mbs']

      self.operating_system = attributes[:'operatingSystem'] if attributes[:'operatingSystem']

      raise 'You cannot provide both :operatingSystem and :operating_system' if attributes.key?(:'operatingSystem') && attributes.key?(:'operating_system')

      self.operating_system = attributes[:'operating_system'] if attributes[:'operating_system']

      self.operating_system_version = attributes[:'operatingSystemVersion'] if attributes[:'operatingSystemVersion']

      raise 'You cannot provide both :operatingSystemVersion and :operating_system_version' if attributes.key?(:'operatingSystemVersion') && attributes.key?(:'operating_system_version')

      self.operating_system_version = attributes[:'operating_system_version'] if attributes[:'operating_system_version']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.power_state = attributes[:'powerState'] if attributes[:'powerState']

      raise 'You cannot provide both :powerState and :power_state' if attributes.key?(:'powerState') && attributes.key?(:'power_state')

      self.power_state = attributes[:'power_state'] if attributes[:'power_state']

      self.guest_state = attributes[:'guestState'] if attributes[:'guestState']

      raise 'You cannot provide both :guestState and :guest_state' if attributes.key?(:'guestState') && attributes.key?(:'guest_state')

      self.guest_state = attributes[:'guest_state'] if attributes[:'guest_state']

      self.is_tpm_enabled = attributes[:'isTpmEnabled'] unless attributes[:'isTpmEnabled'].nil?

      raise 'You cannot provide both :isTpmEnabled and :is_tpm_enabled' if attributes.key?(:'isTpmEnabled') && attributes.key?(:'is_tpm_enabled')

      self.is_tpm_enabled = attributes[:'is_tpm_enabled'] unless attributes[:'is_tpm_enabled'].nil?

      self.connected_networks = attributes[:'connectedNetworks'] if attributes[:'connectedNetworks']

      raise 'You cannot provide both :connectedNetworks and :connected_networks' if attributes.key?(:'connectedNetworks') && attributes.key?(:'connected_networks')

      self.connected_networks = attributes[:'connected_networks'] if attributes[:'connected_networks']

      self.nics_count = attributes[:'nicsCount'] if attributes[:'nicsCount']

      raise 'You cannot provide both :nicsCount and :nics_count' if attributes.key?(:'nicsCount') && attributes.key?(:'nics_count')

      self.nics_count = attributes[:'nics_count'] if attributes[:'nics_count']

      self.nics = attributes[:'nics'] if attributes[:'nics']

      self.storage_provisioned_in_mbs = attributes[:'storageProvisionedInMBs'] if attributes[:'storageProvisionedInMBs']

      raise 'You cannot provide both :storageProvisionedInMBs and :storage_provisioned_in_mbs' if attributes.key?(:'storageProvisionedInMBs') && attributes.key?(:'storage_provisioned_in_mbs')

      self.storage_provisioned_in_mbs = attributes[:'storage_provisioned_in_mbs'] if attributes[:'storage_provisioned_in_mbs']

      self.disks_count = attributes[:'disksCount'] if attributes[:'disksCount']

      raise 'You cannot provide both :disksCount and :disks_count' if attributes.key?(:'disksCount') && attributes.key?(:'disks_count')

      self.disks_count = attributes[:'disks_count'] if attributes[:'disks_count']

      self.disks = attributes[:'disks'] if attributes[:'disks']

      self.firmware = attributes[:'firmware'] if attributes[:'firmware']

      self.latency_sensitivity = attributes[:'latencySensitivity'] if attributes[:'latencySensitivity']

      raise 'You cannot provide both :latencySensitivity and :latency_sensitivity' if attributes.key?(:'latencySensitivity') && attributes.key?(:'latency_sensitivity')

      self.latency_sensitivity = attributes[:'latency_sensitivity'] if attributes[:'latency_sensitivity']

      self.nvdimms = attributes[:'nvdimms'] if attributes[:'nvdimms']

      self.nvdimm_controller = attributes[:'nvdimmController'] if attributes[:'nvdimmController']

      raise 'You cannot provide both :nvdimmController and :nvdimm_controller' if attributes.key?(:'nvdimmController') && attributes.key?(:'nvdimm_controller')

      self.nvdimm_controller = attributes[:'nvdimm_controller'] if attributes[:'nvdimm_controller']

      self.scsi_controller = attributes[:'scsiController'] if attributes[:'scsiController']

      raise 'You cannot provide both :scsiController and :scsi_controller' if attributes.key?(:'scsiController') && attributes.key?(:'scsi_controller')

      self.scsi_controller = attributes[:'scsi_controller'] if attributes[:'scsi_controller']

      self.hardware_version = attributes[:'hardwareVersion'] if attributes[:'hardwareVersion']

      raise 'You cannot provide both :hardwareVersion and :hardware_version' if attributes.key?(:'hardwareVersion') && attributes.key?(:'hardware_version')

      self.hardware_version = attributes[:'hardware_version'] if attributes[:'hardware_version']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        primary_ip == other.primary_ip &&
        dns_name == other.dns_name &&
        description == other.description &&
        cores_count == other.cores_count &&
        cpu_model == other.cpu_model &&
        gpu_devices_count == other.gpu_devices_count &&
        gpu_devices == other.gpu_devices &&
        threads_per_core_count == other.threads_per_core_count &&
        memory_in_mbs == other.memory_in_mbs &&
        is_pmem_enabled == other.is_pmem_enabled &&
        pmem_in_mbs == other.pmem_in_mbs &&
        operating_system == other.operating_system &&
        operating_system_version == other.operating_system_version &&
        host_name == other.host_name &&
        power_state == other.power_state &&
        guest_state == other.guest_state &&
        is_tpm_enabled == other.is_tpm_enabled &&
        connected_networks == other.connected_networks &&
        nics_count == other.nics_count &&
        nics == other.nics &&
        storage_provisioned_in_mbs == other.storage_provisioned_in_mbs &&
        disks_count == other.disks_count &&
        disks == other.disks &&
        firmware == other.firmware &&
        latency_sensitivity == other.latency_sensitivity &&
        nvdimms == other.nvdimms &&
        nvdimm_controller == other.nvdimm_controller &&
        scsi_controller == other.scsi_controller &&
        hardware_version == other.hardware_version
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
      [primary_ip, dns_name, description, cores_count, cpu_model, gpu_devices_count, gpu_devices, threads_per_core_count, memory_in_mbs, is_pmem_enabled, pmem_in_mbs, operating_system, operating_system_version, host_name, power_state, guest_state, is_tpm_enabled, connected_networks, nics_count, nics, storage_provisioned_in_mbs, disks_count, disks, firmware, latency_sensitivity, nvdimms, nvdimm_controller, scsi_controller, hardware_version].hash
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