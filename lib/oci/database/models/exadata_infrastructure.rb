# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # ExadataInfrastructure
  class Database::Models::ExadataInfrastructure
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_REQUIRES_ACTIVATION = 'REQUIRES_ACTIVATION'.freeze,
      LIFECYCLE_STATE_ACTIVATING = 'ACTIVATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_ACTIVATION_FAILED = 'ACTIVATION_FAILED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_DISCONNECTED = 'DISCONNECTED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exadata infrastructure.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The current lifecycle state of the Exadata infrastructure.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The user-friendly name for the Exadata Cloud@Customer infrastructure. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The shape of the Exadata infrastructure. The shape determines the amount of CPU, storage, and memory resources allocated to the instance.
    #
    # @return [String]
    attr_accessor :shape

    # The time zone of the Exadata infrastructure. For details, see [Exadata Infrastructure Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).
    # @return [String]
    attr_accessor :time_zone

    # The number of enabled CPU cores.
    # @return [Integer]
    attr_accessor :cpus_enabled

    # The total number of CPU cores available.
    # @return [Integer]
    attr_accessor :max_cpu_count

    # The memory allocated in GBs.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The total memory available in GBs.
    # @return [Integer]
    attr_accessor :max_memory_in_gbs

    # The local node storage allocated in GBs.
    # @return [Integer]
    attr_accessor :db_node_storage_size_in_gbs

    # The total local node storage available in GBs.
    # @return [Integer]
    attr_accessor :max_db_node_storage_in_g_bs

    # Size, in terabytes, of the DATA disk group.
    #
    # @return [Float]
    attr_accessor :data_storage_size_in_tbs

    # The total available DATA disk group size.
    # @return [Float]
    attr_accessor :max_data_storage_in_t_bs

    # The IP address for the first control plane server.
    # @return [String]
    attr_accessor :cloud_control_plane_server1

    # The IP address for the second control plane server.
    # @return [String]
    attr_accessor :cloud_control_plane_server2

    # The netmask for the control plane network.
    # @return [String]
    attr_accessor :netmask

    # The gateway for the control plane network.
    # @return [String]
    attr_accessor :gateway

    # The CIDR block for the Exadata administration network.
    # @return [String]
    attr_accessor :admin_network_cidr

    # The CIDR block for the Exadata InfiniBand interconnect.
    # @return [String]
    attr_accessor :infini_band_network_cidr

    # The corporate network proxy for access to the control plane network.
    # @return [String]
    attr_accessor :corporate_proxy

    # The list of DNS server IP addresses. Maximum of 3 allowed.
    # @return [Array<String>]
    attr_accessor :dns_server

    # The list of NTP server IP addresses. Maximum of 3 allowed.
    # @return [Array<String>]
    attr_accessor :ntp_server

    # The date and time the Exadata infrastructure was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The CSI Number of the Exadata infrastructure.
    # @return [String]
    attr_accessor :csi_number

    # The list of contacts for the Exadata infrastructure.
    # @return [Array<OCI::Database::Models::ExadataInfrastructureContact>]
    attr_accessor :contacts

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'display_name': :'displayName',
        'shape': :'shape',
        'time_zone': :'timeZone',
        'cpus_enabled': :'cpusEnabled',
        'max_cpu_count': :'maxCpuCount',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'max_memory_in_gbs': :'maxMemoryInGBs',
        'db_node_storage_size_in_gbs': :'dbNodeStorageSizeInGBs',
        'max_db_node_storage_in_g_bs': :'maxDbNodeStorageInGBs',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'max_data_storage_in_t_bs': :'maxDataStorageInTBs',
        'cloud_control_plane_server1': :'cloudControlPlaneServer1',
        'cloud_control_plane_server2': :'cloudControlPlaneServer2',
        'netmask': :'netmask',
        'gateway': :'gateway',
        'admin_network_cidr': :'adminNetworkCIDR',
        'infini_band_network_cidr': :'infiniBandNetworkCIDR',
        'corporate_proxy': :'corporateProxy',
        'dns_server': :'dnsServer',
        'ntp_server': :'ntpServer',
        'time_created': :'timeCreated',
        'lifecycle_details': :'lifecycleDetails',
        'csi_number': :'csiNumber',
        'contacts': :'contacts',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'display_name': :'String',
        'shape': :'String',
        'time_zone': :'String',
        'cpus_enabled': :'Integer',
        'max_cpu_count': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'max_memory_in_gbs': :'Integer',
        'db_node_storage_size_in_gbs': :'Integer',
        'max_db_node_storage_in_g_bs': :'Integer',
        'data_storage_size_in_tbs': :'Float',
        'max_data_storage_in_t_bs': :'Float',
        'cloud_control_plane_server1': :'String',
        'cloud_control_plane_server2': :'String',
        'netmask': :'String',
        'gateway': :'String',
        'admin_network_cidr': :'String',
        'infini_band_network_cidr': :'String',
        'corporate_proxy': :'String',
        'dns_server': :'Array<String>',
        'ntp_server': :'Array<String>',
        'time_created': :'DateTime',
        'lifecycle_details': :'String',
        'csi_number': :'String',
        'contacts': :'Array<OCI::Database::Models::ExadataInfrastructureContact>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [Integer] :cpus_enabled The value to assign to the {#cpus_enabled} property
    # @option attributes [Integer] :max_cpu_count The value to assign to the {#max_cpu_count} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Integer] :max_memory_in_gbs The value to assign to the {#max_memory_in_gbs} property
    # @option attributes [Integer] :db_node_storage_size_in_gbs The value to assign to the {#db_node_storage_size_in_gbs} property
    # @option attributes [Integer] :max_db_node_storage_in_g_bs The value to assign to the {#max_db_node_storage_in_g_bs} property
    # @option attributes [Float] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [Float] :max_data_storage_in_t_bs The value to assign to the {#max_data_storage_in_t_bs} property
    # @option attributes [String] :cloud_control_plane_server1 The value to assign to the {#cloud_control_plane_server1} property
    # @option attributes [String] :cloud_control_plane_server2 The value to assign to the {#cloud_control_plane_server2} property
    # @option attributes [String] :netmask The value to assign to the {#netmask} property
    # @option attributes [String] :gateway The value to assign to the {#gateway} property
    # @option attributes [String] :admin_network_cidr The value to assign to the {#admin_network_cidr} property
    # @option attributes [String] :infini_band_network_cidr The value to assign to the {#infini_band_network_cidr} property
    # @option attributes [String] :corporate_proxy The value to assign to the {#corporate_proxy} property
    # @option attributes [Array<String>] :dns_server The value to assign to the {#dns_server} property
    # @option attributes [Array<String>] :ntp_server The value to assign to the {#ntp_server} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :csi_number The value to assign to the {#csi_number} property
    # @option attributes [Array<OCI::Database::Models::ExadataInfrastructureContact>] :contacts The value to assign to the {#contacts} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.cpus_enabled = attributes[:'cpusEnabled'] if attributes[:'cpusEnabled']

      raise 'You cannot provide both :cpusEnabled and :cpus_enabled' if attributes.key?(:'cpusEnabled') && attributes.key?(:'cpus_enabled')

      self.cpus_enabled = attributes[:'cpus_enabled'] if attributes[:'cpus_enabled']

      self.max_cpu_count = attributes[:'maxCpuCount'] if attributes[:'maxCpuCount']

      raise 'You cannot provide both :maxCpuCount and :max_cpu_count' if attributes.key?(:'maxCpuCount') && attributes.key?(:'max_cpu_count')

      self.max_cpu_count = attributes[:'max_cpu_count'] if attributes[:'max_cpu_count']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.max_memory_in_gbs = attributes[:'maxMemoryInGBs'] if attributes[:'maxMemoryInGBs']

      raise 'You cannot provide both :maxMemoryInGBs and :max_memory_in_gbs' if attributes.key?(:'maxMemoryInGBs') && attributes.key?(:'max_memory_in_gbs')

      self.max_memory_in_gbs = attributes[:'max_memory_in_gbs'] if attributes[:'max_memory_in_gbs']

      self.db_node_storage_size_in_gbs = attributes[:'dbNodeStorageSizeInGBs'] if attributes[:'dbNodeStorageSizeInGBs']

      raise 'You cannot provide both :dbNodeStorageSizeInGBs and :db_node_storage_size_in_gbs' if attributes.key?(:'dbNodeStorageSizeInGBs') && attributes.key?(:'db_node_storage_size_in_gbs')

      self.db_node_storage_size_in_gbs = attributes[:'db_node_storage_size_in_gbs'] if attributes[:'db_node_storage_size_in_gbs']

      self.max_db_node_storage_in_g_bs = attributes[:'maxDbNodeStorageInGBs'] if attributes[:'maxDbNodeStorageInGBs']

      raise 'You cannot provide both :maxDbNodeStorageInGBs and :max_db_node_storage_in_g_bs' if attributes.key?(:'maxDbNodeStorageInGBs') && attributes.key?(:'max_db_node_storage_in_g_bs')

      self.max_db_node_storage_in_g_bs = attributes[:'max_db_node_storage_in_g_bs'] if attributes[:'max_db_node_storage_in_g_bs']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.max_data_storage_in_t_bs = attributes[:'maxDataStorageInTBs'] if attributes[:'maxDataStorageInTBs']

      raise 'You cannot provide both :maxDataStorageInTBs and :max_data_storage_in_t_bs' if attributes.key?(:'maxDataStorageInTBs') && attributes.key?(:'max_data_storage_in_t_bs')

      self.max_data_storage_in_t_bs = attributes[:'max_data_storage_in_t_bs'] if attributes[:'max_data_storage_in_t_bs']

      self.cloud_control_plane_server1 = attributes[:'cloudControlPlaneServer1'] if attributes[:'cloudControlPlaneServer1']

      raise 'You cannot provide both :cloudControlPlaneServer1 and :cloud_control_plane_server1' if attributes.key?(:'cloudControlPlaneServer1') && attributes.key?(:'cloud_control_plane_server1')

      self.cloud_control_plane_server1 = attributes[:'cloud_control_plane_server1'] if attributes[:'cloud_control_plane_server1']

      self.cloud_control_plane_server2 = attributes[:'cloudControlPlaneServer2'] if attributes[:'cloudControlPlaneServer2']

      raise 'You cannot provide both :cloudControlPlaneServer2 and :cloud_control_plane_server2' if attributes.key?(:'cloudControlPlaneServer2') && attributes.key?(:'cloud_control_plane_server2')

      self.cloud_control_plane_server2 = attributes[:'cloud_control_plane_server2'] if attributes[:'cloud_control_plane_server2']

      self.netmask = attributes[:'netmask'] if attributes[:'netmask']

      self.gateway = attributes[:'gateway'] if attributes[:'gateway']

      self.admin_network_cidr = attributes[:'adminNetworkCIDR'] if attributes[:'adminNetworkCIDR']

      raise 'You cannot provide both :adminNetworkCIDR and :admin_network_cidr' if attributes.key?(:'adminNetworkCIDR') && attributes.key?(:'admin_network_cidr')

      self.admin_network_cidr = attributes[:'admin_network_cidr'] if attributes[:'admin_network_cidr']

      self.infini_band_network_cidr = attributes[:'infiniBandNetworkCIDR'] if attributes[:'infiniBandNetworkCIDR']

      raise 'You cannot provide both :infiniBandNetworkCIDR and :infini_band_network_cidr' if attributes.key?(:'infiniBandNetworkCIDR') && attributes.key?(:'infini_band_network_cidr')

      self.infini_band_network_cidr = attributes[:'infini_band_network_cidr'] if attributes[:'infini_band_network_cidr']

      self.corporate_proxy = attributes[:'corporateProxy'] if attributes[:'corporateProxy']

      raise 'You cannot provide both :corporateProxy and :corporate_proxy' if attributes.key?(:'corporateProxy') && attributes.key?(:'corporate_proxy')

      self.corporate_proxy = attributes[:'corporate_proxy'] if attributes[:'corporate_proxy']

      self.dns_server = attributes[:'dnsServer'] if attributes[:'dnsServer']

      raise 'You cannot provide both :dnsServer and :dns_server' if attributes.key?(:'dnsServer') && attributes.key?(:'dns_server')

      self.dns_server = attributes[:'dns_server'] if attributes[:'dns_server']

      self.ntp_server = attributes[:'ntpServer'] if attributes[:'ntpServer']

      raise 'You cannot provide both :ntpServer and :ntp_server' if attributes.key?(:'ntpServer') && attributes.key?(:'ntp_server')

      self.ntp_server = attributes[:'ntp_server'] if attributes[:'ntp_server']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.csi_number = attributes[:'csiNumber'] if attributes[:'csiNumber']

      raise 'You cannot provide both :csiNumber and :csi_number' if attributes.key?(:'csiNumber') && attributes.key?(:'csi_number')

      self.csi_number = attributes[:'csi_number'] if attributes[:'csi_number']

      self.contacts = attributes[:'contacts'] if attributes[:'contacts']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        display_name == other.display_name &&
        shape == other.shape &&
        time_zone == other.time_zone &&
        cpus_enabled == other.cpus_enabled &&
        max_cpu_count == other.max_cpu_count &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        max_memory_in_gbs == other.max_memory_in_gbs &&
        db_node_storage_size_in_gbs == other.db_node_storage_size_in_gbs &&
        max_db_node_storage_in_g_bs == other.max_db_node_storage_in_g_bs &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        max_data_storage_in_t_bs == other.max_data_storage_in_t_bs &&
        cloud_control_plane_server1 == other.cloud_control_plane_server1 &&
        cloud_control_plane_server2 == other.cloud_control_plane_server2 &&
        netmask == other.netmask &&
        gateway == other.gateway &&
        admin_network_cidr == other.admin_network_cidr &&
        infini_band_network_cidr == other.infini_band_network_cidr &&
        corporate_proxy == other.corporate_proxy &&
        dns_server == other.dns_server &&
        ntp_server == other.ntp_server &&
        time_created == other.time_created &&
        lifecycle_details == other.lifecycle_details &&
        csi_number == other.csi_number &&
        contacts == other.contacts &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, compartment_id, lifecycle_state, display_name, shape, time_zone, cpus_enabled, max_cpu_count, memory_size_in_gbs, max_memory_in_gbs, db_node_storage_size_in_gbs, max_db_node_storage_in_g_bs, data_storage_size_in_tbs, max_data_storage_in_t_bs, cloud_control_plane_server1, cloud_control_plane_server2, netmask, gateway, admin_network_cidr, infini_band_network_cidr, corporate_proxy, dns_server, ntp_server, time_created, lifecycle_details, csi_number, contacts, freeform_tags, defined_tags].hash
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
