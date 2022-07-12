# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a host configuration for a resource.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Opsi::Models::HostConfigurationSummary
    ENTITY_SOURCE_ENUM = [
      ENTITY_SOURCE_MACS_MANAGED_EXTERNAL_HOST = 'MACS_MANAGED_EXTERNAL_HOST'.freeze,
      ENTITY_SOURCE_EM_MANAGED_EXTERNAL_HOST = 'EM_MANAGED_EXTERNAL_HOST'.freeze,
      ENTITY_SOURCE_PE_COMANAGED_HOST = 'PE_COMANAGED_HOST'.freeze,
      ENTITY_SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PLATFORM_TYPE_ENUM = [
      PLATFORM_TYPE_LINUX = 'LINUX'.freeze,
      PLATFORM_TYPE_SOLARIS = 'SOLARIS'.freeze,
      PLATFORM_TYPE_SUNOS = 'SUNOS'.freeze,
      PLATFORM_TYPE_ZLINUX = 'ZLINUX'.freeze,
      PLATFORM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the host insight resource.
    # @return [String]
    attr_accessor :host_insight_id

    # **[Required]** Source of the host entity.
    # @return [String]
    attr_reader :entity_source

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The host name. The host name is unique amongst the hosts managed by the same management agent.
    # @return [String]
    attr_accessor :host_name

    # **[Required]** Platform type.
    # Supported platformType(s) for MACS-managed external host insight: [LINUX].
    # Supported platformType(s) for EM-managed external host insight: [LINUX, SOLARIS, SUNOS, ZLINUX].
    #
    # @return [String]
    attr_reader :platform_type

    # **[Required]** Platform version.
    # @return [String]
    attr_accessor :platform_version

    # **[Required]** Platform vendor.
    # @return [String]
    attr_accessor :platform_vendor

    # **[Required]** Total CPU on this host.
    #
    # @return [Integer]
    attr_accessor :total_cpus

    # **[Required]** Total amount of usable physical memory in gibabytes
    #
    # @return [Float]
    attr_accessor :total_memory_in_gbs

    # **[Required]** CPU architechure
    # @return [String]
    attr_accessor :cpu_architecture

    # **[Required]** Size of cache memory in megabytes.
    #
    # @return [Float]
    attr_accessor :cpu_cache_in_mbs

    # **[Required]** Name of the CPU vendor.
    # @return [String]
    attr_accessor :cpu_vendor

    # **[Required]** Clock frequency of the processor in megahertz.
    #
    # @return [Float]
    attr_accessor :cpu_frequency_in_mhz

    # **[Required]** Model name of processor.
    # @return [String]
    attr_accessor :cpu_implementation

    # **[Required]** Number of cores per socket.
    #
    # @return [Integer]
    attr_accessor :cores_per_socket

    # **[Required]** Number of total sockets.
    # @return [Integer]
    attr_accessor :total_sockets

    # **[Required]** Number of threads per socket.
    # @return [Integer]
    attr_accessor :threads_per_socket

    # **[Required]** Indicates if hyper-threading is enabled or not
    #
    # @return [BOOLEAN]
    attr_accessor :is_hyper_threading_enabled

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'host_insight_id': :'hostInsightId',
        'entity_source': :'entitySource',
        'compartment_id': :'compartmentId',
        'host_name': :'hostName',
        'platform_type': :'platformType',
        'platform_version': :'platformVersion',
        'platform_vendor': :'platformVendor',
        'total_cpus': :'totalCpus',
        'total_memory_in_gbs': :'totalMemoryInGBs',
        'cpu_architecture': :'cpuArchitecture',
        'cpu_cache_in_mbs': :'cpuCacheInMBs',
        'cpu_vendor': :'cpuVendor',
        'cpu_frequency_in_mhz': :'cpuFrequencyInMhz',
        'cpu_implementation': :'cpuImplementation',
        'cores_per_socket': :'coresPerSocket',
        'total_sockets': :'totalSockets',
        'threads_per_socket': :'threadsPerSocket',
        'is_hyper_threading_enabled': :'isHyperThreadingEnabled',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'host_insight_id': :'String',
        'entity_source': :'String',
        'compartment_id': :'String',
        'host_name': :'String',
        'platform_type': :'String',
        'platform_version': :'String',
        'platform_vendor': :'String',
        'total_cpus': :'Integer',
        'total_memory_in_gbs': :'Float',
        'cpu_architecture': :'String',
        'cpu_cache_in_mbs': :'Float',
        'cpu_vendor': :'String',
        'cpu_frequency_in_mhz': :'Float',
        'cpu_implementation': :'String',
        'cores_per_socket': :'Integer',
        'total_sockets': :'Integer',
        'threads_per_socket': :'Integer',
        'is_hyper_threading_enabled': :'BOOLEAN',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'entitySource'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Opsi::Models::MacsManagedExternalHostConfigurationSummary' if type == 'MACS_MANAGED_EXTERNAL_HOST'
      return 'OCI::Opsi::Models::PeComanagedHostConfigurationSummary' if type == 'PE_COMANAGED_HOST'
      return 'OCI::Opsi::Models::EmManagedExternalHostConfigurationSummary' if type == 'EM_MANAGED_EXTERNAL_HOST'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Opsi::Models::HostConfigurationSummary'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :host_insight_id The value to assign to the {#host_insight_id} property
    # @option attributes [String] :entity_source The value to assign to the {#entity_source} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :platform_type The value to assign to the {#platform_type} property
    # @option attributes [String] :platform_version The value to assign to the {#platform_version} property
    # @option attributes [String] :platform_vendor The value to assign to the {#platform_vendor} property
    # @option attributes [Integer] :total_cpus The value to assign to the {#total_cpus} property
    # @option attributes [Float] :total_memory_in_gbs The value to assign to the {#total_memory_in_gbs} property
    # @option attributes [String] :cpu_architecture The value to assign to the {#cpu_architecture} property
    # @option attributes [Float] :cpu_cache_in_mbs The value to assign to the {#cpu_cache_in_mbs} property
    # @option attributes [String] :cpu_vendor The value to assign to the {#cpu_vendor} property
    # @option attributes [Float] :cpu_frequency_in_mhz The value to assign to the {#cpu_frequency_in_mhz} property
    # @option attributes [String] :cpu_implementation The value to assign to the {#cpu_implementation} property
    # @option attributes [Integer] :cores_per_socket The value to assign to the {#cores_per_socket} property
    # @option attributes [Integer] :total_sockets The value to assign to the {#total_sockets} property
    # @option attributes [Integer] :threads_per_socket The value to assign to the {#threads_per_socket} property
    # @option attributes [BOOLEAN] :is_hyper_threading_enabled The value to assign to the {#is_hyper_threading_enabled} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.host_insight_id = attributes[:'hostInsightId'] if attributes[:'hostInsightId']

      raise 'You cannot provide both :hostInsightId and :host_insight_id' if attributes.key?(:'hostInsightId') && attributes.key?(:'host_insight_id')

      self.host_insight_id = attributes[:'host_insight_id'] if attributes[:'host_insight_id']

      self.entity_source = attributes[:'entitySource'] if attributes[:'entitySource']

      raise 'You cannot provide both :entitySource and :entity_source' if attributes.key?(:'entitySource') && attributes.key?(:'entity_source')

      self.entity_source = attributes[:'entity_source'] if attributes[:'entity_source']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.platform_type = attributes[:'platformType'] if attributes[:'platformType']

      raise 'You cannot provide both :platformType and :platform_type' if attributes.key?(:'platformType') && attributes.key?(:'platform_type')

      self.platform_type = attributes[:'platform_type'] if attributes[:'platform_type']

      self.platform_version = attributes[:'platformVersion'] if attributes[:'platformVersion']

      raise 'You cannot provide both :platformVersion and :platform_version' if attributes.key?(:'platformVersion') && attributes.key?(:'platform_version')

      self.platform_version = attributes[:'platform_version'] if attributes[:'platform_version']

      self.platform_vendor = attributes[:'platformVendor'] if attributes[:'platformVendor']

      raise 'You cannot provide both :platformVendor and :platform_vendor' if attributes.key?(:'platformVendor') && attributes.key?(:'platform_vendor')

      self.platform_vendor = attributes[:'platform_vendor'] if attributes[:'platform_vendor']

      self.total_cpus = attributes[:'totalCpus'] if attributes[:'totalCpus']

      raise 'You cannot provide both :totalCpus and :total_cpus' if attributes.key?(:'totalCpus') && attributes.key?(:'total_cpus')

      self.total_cpus = attributes[:'total_cpus'] if attributes[:'total_cpus']

      self.total_memory_in_gbs = attributes[:'totalMemoryInGBs'] if attributes[:'totalMemoryInGBs']

      raise 'You cannot provide both :totalMemoryInGBs and :total_memory_in_gbs' if attributes.key?(:'totalMemoryInGBs') && attributes.key?(:'total_memory_in_gbs')

      self.total_memory_in_gbs = attributes[:'total_memory_in_gbs'] if attributes[:'total_memory_in_gbs']

      self.cpu_architecture = attributes[:'cpuArchitecture'] if attributes[:'cpuArchitecture']

      raise 'You cannot provide both :cpuArchitecture and :cpu_architecture' if attributes.key?(:'cpuArchitecture') && attributes.key?(:'cpu_architecture')

      self.cpu_architecture = attributes[:'cpu_architecture'] if attributes[:'cpu_architecture']

      self.cpu_cache_in_mbs = attributes[:'cpuCacheInMBs'] if attributes[:'cpuCacheInMBs']

      raise 'You cannot provide both :cpuCacheInMBs and :cpu_cache_in_mbs' if attributes.key?(:'cpuCacheInMBs') && attributes.key?(:'cpu_cache_in_mbs')

      self.cpu_cache_in_mbs = attributes[:'cpu_cache_in_mbs'] if attributes[:'cpu_cache_in_mbs']

      self.cpu_vendor = attributes[:'cpuVendor'] if attributes[:'cpuVendor']

      raise 'You cannot provide both :cpuVendor and :cpu_vendor' if attributes.key?(:'cpuVendor') && attributes.key?(:'cpu_vendor')

      self.cpu_vendor = attributes[:'cpu_vendor'] if attributes[:'cpu_vendor']

      self.cpu_frequency_in_mhz = attributes[:'cpuFrequencyInMhz'] if attributes[:'cpuFrequencyInMhz']

      raise 'You cannot provide both :cpuFrequencyInMhz and :cpu_frequency_in_mhz' if attributes.key?(:'cpuFrequencyInMhz') && attributes.key?(:'cpu_frequency_in_mhz')

      self.cpu_frequency_in_mhz = attributes[:'cpu_frequency_in_mhz'] if attributes[:'cpu_frequency_in_mhz']

      self.cpu_implementation = attributes[:'cpuImplementation'] if attributes[:'cpuImplementation']

      raise 'You cannot provide both :cpuImplementation and :cpu_implementation' if attributes.key?(:'cpuImplementation') && attributes.key?(:'cpu_implementation')

      self.cpu_implementation = attributes[:'cpu_implementation'] if attributes[:'cpu_implementation']

      self.cores_per_socket = attributes[:'coresPerSocket'] if attributes[:'coresPerSocket']

      raise 'You cannot provide both :coresPerSocket and :cores_per_socket' if attributes.key?(:'coresPerSocket') && attributes.key?(:'cores_per_socket')

      self.cores_per_socket = attributes[:'cores_per_socket'] if attributes[:'cores_per_socket']

      self.total_sockets = attributes[:'totalSockets'] if attributes[:'totalSockets']

      raise 'You cannot provide both :totalSockets and :total_sockets' if attributes.key?(:'totalSockets') && attributes.key?(:'total_sockets')

      self.total_sockets = attributes[:'total_sockets'] if attributes[:'total_sockets']

      self.threads_per_socket = attributes[:'threadsPerSocket'] if attributes[:'threadsPerSocket']

      raise 'You cannot provide both :threadsPerSocket and :threads_per_socket' if attributes.key?(:'threadsPerSocket') && attributes.key?(:'threads_per_socket')

      self.threads_per_socket = attributes[:'threads_per_socket'] if attributes[:'threads_per_socket']

      self.is_hyper_threading_enabled = attributes[:'isHyperThreadingEnabled'] unless attributes[:'isHyperThreadingEnabled'].nil?

      raise 'You cannot provide both :isHyperThreadingEnabled and :is_hyper_threading_enabled' if attributes.key?(:'isHyperThreadingEnabled') && attributes.key?(:'is_hyper_threading_enabled')

      self.is_hyper_threading_enabled = attributes[:'is_hyper_threading_enabled'] unless attributes[:'is_hyper_threading_enabled'].nil?

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_source Object to be assigned
    def entity_source=(entity_source)
      # rubocop:disable Style/ConditionalAssignment
      if entity_source && !ENTITY_SOURCE_ENUM.include?(entity_source)
        OCI.logger.debug("Unknown value for 'entity_source' [" + entity_source + "]. Mapping to 'ENTITY_SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_source = ENTITY_SOURCE_UNKNOWN_ENUM_VALUE
      else
        @entity_source = entity_source
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] platform_type Object to be assigned
    def platform_type=(platform_type)
      # rubocop:disable Style/ConditionalAssignment
      if platform_type && !PLATFORM_TYPE_ENUM.include?(platform_type)
        OCI.logger.debug("Unknown value for 'platform_type' [" + platform_type + "]. Mapping to 'PLATFORM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @platform_type = PLATFORM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @platform_type = platform_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        host_insight_id == other.host_insight_id &&
        entity_source == other.entity_source &&
        compartment_id == other.compartment_id &&
        host_name == other.host_name &&
        platform_type == other.platform_type &&
        platform_version == other.platform_version &&
        platform_vendor == other.platform_vendor &&
        total_cpus == other.total_cpus &&
        total_memory_in_gbs == other.total_memory_in_gbs &&
        cpu_architecture == other.cpu_architecture &&
        cpu_cache_in_mbs == other.cpu_cache_in_mbs &&
        cpu_vendor == other.cpu_vendor &&
        cpu_frequency_in_mhz == other.cpu_frequency_in_mhz &&
        cpu_implementation == other.cpu_implementation &&
        cores_per_socket == other.cores_per_socket &&
        total_sockets == other.total_sockets &&
        threads_per_socket == other.threads_per_socket &&
        is_hyper_threading_enabled == other.is_hyper_threading_enabled &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags
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
      [host_insight_id, entity_source, compartment_id, host_name, platform_type, platform_version, platform_vendor, total_cpus, total_memory_in_gbs, cpu_architecture, cpu_cache_in_mbs, cpu_vendor, cpu_frequency_in_mhz, cpu_implementation, cores_per_socket, total_sockets, threads_per_socket, is_hyper_threading_enabled, defined_tags, freeform_tags].hash
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
