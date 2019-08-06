# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # DbSystem model.
  class Database::Models::DbSystem
    DATABASE_EDITION_ENUM = [
      DATABASE_EDITION_STANDARD_EDITION = 'STANDARD_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION = 'ENTERPRISE_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_HIGH_PERFORMANCE = 'ENTERPRISE_EDITION_HIGH_PERFORMANCE'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_EXTREME_PERFORMANCE = 'ENTERPRISE_EDITION_EXTREME_PERFORMANCE'.freeze,
      DATABASE_EDITION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DISK_REDUNDANCY_ENUM = [
      DISK_REDUNDANCY_HIGH = 'HIGH'.freeze,
      DISK_REDUNDANCY_NORMAL = 'NORMAL'.freeze,
      DISK_REDUNDANCY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [OCI::Database::Models::ExadataIormConfig]
    attr_accessor :iorm_config_cache

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DB system.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-friendly name for the DB system. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The name of the availability domain that the DB system is located in.
    # @return [String]
    attr_accessor :availability_domain

    # List of the Fault Domains in which this DB system is provisioned.
    # @return [Array<String>]
    attr_accessor :fault_domains

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the DB system is associated with.
    #
    # **Subnet Restrictions:**
    # - For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
    # - For Exadata and virtual machine 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.128.0/20.
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup network subnet the DB system is associated with. Applicable only to Exadata DB systems.
    #
    # **Subnet Restriction:** See the subnet restrictions information for **subnetId**.
    #
    # @return [String]
    attr_accessor :backup_subnet_id

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this DB system belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that the backup network of this DB system belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm). Applicable only to Exadata DB systems.
    #
    # @return [Array<String>]
    attr_accessor :backup_network_nsg_ids

    # **[Required]** The shape of the DB system. The shape determines resources to allocate to the DB system.
    # - For virtual machine shapes, the number of CPU cores and memory
    # - For bare metal and Exadata shapes, the number of CPU cores, storage, and memory
    #
    # @return [String]
    attr_accessor :shape

    # **[Required]** The public key portion of one or more key pairs used for SSH access to the DB system.
    # @return [Array<String>]
    attr_accessor :ssh_public_keys

    # The time zone of the DB system. For details, see [DB System Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).
    # @return [String]
    attr_accessor :time_zone

    # **[Required]** The hostname for the DB system.
    # @return [String]
    attr_accessor :hostname

    # **[Required]** The domain name for the DB system.
    # @return [String]
    attr_accessor :domain

    # The Oracle Database version of the DB system.
    # @return [String]
    attr_accessor :version

    # **[Required]** The number of CPU cores enabled on the DB system.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The cluster name for Exadata and 2-node RAC virtual machine DB systems. The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive.
    #
    # @return [String]
    attr_accessor :cluster_name

    # The percentage assigned to DATA storage (user data and database files).
    # The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups). Accepted values are 40 and 80. The default is 80 percent assigned to DATA storage. Not applicable for virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :data_storage_percentage

    # **[Required]** The Oracle Database edition that applies to all the databases on the DB system.
    #
    # @return [String]
    attr_reader :database_edition

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last patch history. This value is updated as soon as a patch operation starts.
    # @return [String]
    attr_accessor :last_patch_history_entry_id

    # The port number configured for the listener on the DB system.
    # @return [Integer]
    attr_accessor :listener_port

    # **[Required]** The current state of the DB system.
    # @return [String]
    attr_reader :lifecycle_state

    # The date and time the DB system was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # The type of redundancy configured for the DB system.
    # NORMAL is 2-way redundancy.
    # HIGH is 3-way redundancy.
    #
    # @return [String]
    attr_reader :disk_redundancy

    # True, if Sparse Diskgroup is configured for Exadata dbsystem, False, if Sparse diskgroup was not configured.
    #
    # @return [BOOLEAN]
    attr_accessor :sparse_diskgroup

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Single Client Access Name (SCAN) IP addresses associated with the DB system.
    # SCAN IP addresses are typically used for load balancing and are not assigned to any interface.
    # Oracle Clusterware directs the requests to the appropriate nodes in the cluster.
    #
    # **Note:** For a single-node DB system, this list is empty.
    #
    # @return [Array<String>]
    attr_accessor :scan_ip_ids

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the virtual IP (VIP) addresses associated with the DB system.
    # The Cluster Ready Services (CRS) creates and maintains one VIP address for each node in the DB system to
    # enable failover. If one node fails, the VIP is reassigned to another active node in the cluster.
    #
    # **Note:** For a single-node DB system, this list is empty.
    #
    # @return [Array<String>]
    attr_accessor :vip_ids

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DNS record for the SCAN IP addresses that are associated with the DB system.
    #
    # @return [String]
    attr_accessor :scan_dns_record_id

    # The data storage size, in gigabytes, that is currently available to the DB system. Applies only for virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # The RECO/REDO storage size, in gigabytes, that is currently allocated to the DB system. Applies only for virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :reco_storage_size_in_gb

    # The number of nodes in the DB system. For RAC DB systems, the value is greater than 1.
    #
    # @return [Integer]
    attr_accessor :node_count

    # The Oracle license model that applies to all the databases on the DB system. The default is LICENSE_INCLUDED.
    #
    # @return [String]
    attr_reader :license_model

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
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'iorm_config_cache': :'iormConfigCache',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'availability_domain': :'availabilityDomain',
        'fault_domains': :'faultDomains',
        'subnet_id': :'subnetId',
        'backup_subnet_id': :'backupSubnetId',
        'nsg_ids': :'nsgIds',
        'backup_network_nsg_ids': :'backupNetworkNsgIds',
        'shape': :'shape',
        'ssh_public_keys': :'sshPublicKeys',
        'time_zone': :'timeZone',
        'hostname': :'hostname',
        'domain': :'domain',
        'version': :'version',
        'cpu_core_count': :'cpuCoreCount',
        'cluster_name': :'clusterName',
        'data_storage_percentage': :'dataStoragePercentage',
        'database_edition': :'databaseEdition',
        'last_patch_history_entry_id': :'lastPatchHistoryEntryId',
        'listener_port': :'listenerPort',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'lifecycle_details': :'lifecycleDetails',
        'disk_redundancy': :'diskRedundancy',
        'sparse_diskgroup': :'sparseDiskgroup',
        'scan_ip_ids': :'scanIpIds',
        'vip_ids': :'vipIds',
        'scan_dns_record_id': :'scanDnsRecordId',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'reco_storage_size_in_gb': :'recoStorageSizeInGB',
        'node_count': :'nodeCount',
        'license_model': :'licenseModel',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'iorm_config_cache': :'OCI::Database::Models::ExadataIormConfig',
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'availability_domain': :'String',
        'fault_domains': :'Array<String>',
        'subnet_id': :'String',
        'backup_subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'backup_network_nsg_ids': :'Array<String>',
        'shape': :'String',
        'ssh_public_keys': :'Array<String>',
        'time_zone': :'String',
        'hostname': :'String',
        'domain': :'String',
        'version': :'String',
        'cpu_core_count': :'Integer',
        'cluster_name': :'String',
        'data_storage_percentage': :'Integer',
        'database_edition': :'String',
        'last_patch_history_entry_id': :'String',
        'listener_port': :'Integer',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'lifecycle_details': :'String',
        'disk_redundancy': :'String',
        'sparse_diskgroup': :'BOOLEAN',
        'scan_ip_ids': :'Array<String>',
        'vip_ids': :'Array<String>',
        'scan_dns_record_id': :'String',
        'data_storage_size_in_gbs': :'Integer',
        'reco_storage_size_in_gb': :'Integer',
        'node_count': :'Integer',
        'license_model': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Database::Models::ExadataIormConfig] :iorm_config_cache The value to assign to the {#iorm_config_cache} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [Array<String>] :fault_domains The value to assign to the {#fault_domains} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :backup_subnet_id The value to assign to the {#backup_subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [Array<String>] :backup_network_nsg_ids The value to assign to the {#backup_network_nsg_ids} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {#ssh_public_keys} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [String] :cluster_name The value to assign to the {#cluster_name} property
    # @option attributes [Integer] :data_storage_percentage The value to assign to the {#data_storage_percentage} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    # @option attributes [String] :last_patch_history_entry_id The value to assign to the {#last_patch_history_entry_id} property
    # @option attributes [Integer] :listener_port The value to assign to the {#listener_port} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :disk_redundancy The value to assign to the {#disk_redundancy} property
    # @option attributes [BOOLEAN] :sparse_diskgroup The value to assign to the {#sparse_diskgroup} property
    # @option attributes [Array<String>] :scan_ip_ids The value to assign to the {#scan_ip_ids} property
    # @option attributes [Array<String>] :vip_ids The value to assign to the {#vip_ids} property
    # @option attributes [String] :scan_dns_record_id The value to assign to the {#scan_dns_record_id} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [Integer] :reco_storage_size_in_gb The value to assign to the {#reco_storage_size_in_gb} property
    # @option attributes [Integer] :node_count The value to assign to the {#node_count} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.iorm_config_cache = attributes[:'iormConfigCache'] if attributes[:'iormConfigCache']

      raise 'You cannot provide both :iormConfigCache and :iorm_config_cache' if attributes.key?(:'iormConfigCache') && attributes.key?(:'iorm_config_cache')

      self.iorm_config_cache = attributes[:'iorm_config_cache'] if attributes[:'iorm_config_cache']

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.fault_domains = attributes[:'faultDomains'] if attributes[:'faultDomains']

      raise 'You cannot provide both :faultDomains and :fault_domains' if attributes.key?(:'faultDomains') && attributes.key?(:'fault_domains')

      self.fault_domains = attributes[:'fault_domains'] if attributes[:'fault_domains']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.backup_subnet_id = attributes[:'backupSubnetId'] if attributes[:'backupSubnetId']

      raise 'You cannot provide both :backupSubnetId and :backup_subnet_id' if attributes.key?(:'backupSubnetId') && attributes.key?(:'backup_subnet_id')

      self.backup_subnet_id = attributes[:'backup_subnet_id'] if attributes[:'backup_subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.backup_network_nsg_ids = attributes[:'backupNetworkNsgIds'] if attributes[:'backupNetworkNsgIds']

      raise 'You cannot provide both :backupNetworkNsgIds and :backup_network_nsg_ids' if attributes.key?(:'backupNetworkNsgIds') && attributes.key?(:'backup_network_nsg_ids')

      self.backup_network_nsg_ids = attributes[:'backup_network_nsg_ids'] if attributes[:'backup_network_nsg_ids']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.ssh_public_keys = attributes[:'sshPublicKeys'] if attributes[:'sshPublicKeys']

      raise 'You cannot provide both :sshPublicKeys and :ssh_public_keys' if attributes.key?(:'sshPublicKeys') && attributes.key?(:'ssh_public_keys')

      self.ssh_public_keys = attributes[:'ssh_public_keys'] if attributes[:'ssh_public_keys']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.version = attributes[:'version'] if attributes[:'version']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.cluster_name = attributes[:'clusterName'] if attributes[:'clusterName']

      raise 'You cannot provide both :clusterName and :cluster_name' if attributes.key?(:'clusterName') && attributes.key?(:'cluster_name')

      self.cluster_name = attributes[:'cluster_name'] if attributes[:'cluster_name']

      self.data_storage_percentage = attributes[:'dataStoragePercentage'] if attributes[:'dataStoragePercentage']

      raise 'You cannot provide both :dataStoragePercentage and :data_storage_percentage' if attributes.key?(:'dataStoragePercentage') && attributes.key?(:'data_storage_percentage')

      self.data_storage_percentage = attributes[:'data_storage_percentage'] if attributes[:'data_storage_percentage']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']

      self.last_patch_history_entry_id = attributes[:'lastPatchHistoryEntryId'] if attributes[:'lastPatchHistoryEntryId']

      raise 'You cannot provide both :lastPatchHistoryEntryId and :last_patch_history_entry_id' if attributes.key?(:'lastPatchHistoryEntryId') && attributes.key?(:'last_patch_history_entry_id')

      self.last_patch_history_entry_id = attributes[:'last_patch_history_entry_id'] if attributes[:'last_patch_history_entry_id']

      self.listener_port = attributes[:'listenerPort'] if attributes[:'listenerPort']

      raise 'You cannot provide both :listenerPort and :listener_port' if attributes.key?(:'listenerPort') && attributes.key?(:'listener_port')

      self.listener_port = attributes[:'listener_port'] if attributes[:'listener_port']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.disk_redundancy = attributes[:'diskRedundancy'] if attributes[:'diskRedundancy']

      raise 'You cannot provide both :diskRedundancy and :disk_redundancy' if attributes.key?(:'diskRedundancy') && attributes.key?(:'disk_redundancy')

      self.disk_redundancy = attributes[:'disk_redundancy'] if attributes[:'disk_redundancy']

      self.sparse_diskgroup = attributes[:'sparseDiskgroup'] unless attributes[:'sparseDiskgroup'].nil?

      raise 'You cannot provide both :sparseDiskgroup and :sparse_diskgroup' if attributes.key?(:'sparseDiskgroup') && attributes.key?(:'sparse_diskgroup')

      self.sparse_diskgroup = attributes[:'sparse_diskgroup'] unless attributes[:'sparse_diskgroup'].nil?

      self.scan_ip_ids = attributes[:'scanIpIds'] if attributes[:'scanIpIds']

      raise 'You cannot provide both :scanIpIds and :scan_ip_ids' if attributes.key?(:'scanIpIds') && attributes.key?(:'scan_ip_ids')

      self.scan_ip_ids = attributes[:'scan_ip_ids'] if attributes[:'scan_ip_ids']

      self.vip_ids = attributes[:'vipIds'] if attributes[:'vipIds']

      raise 'You cannot provide both :vipIds and :vip_ids' if attributes.key?(:'vipIds') && attributes.key?(:'vip_ids')

      self.vip_ids = attributes[:'vip_ids'] if attributes[:'vip_ids']

      self.scan_dns_record_id = attributes[:'scanDnsRecordId'] if attributes[:'scanDnsRecordId']

      raise 'You cannot provide both :scanDnsRecordId and :scan_dns_record_id' if attributes.key?(:'scanDnsRecordId') && attributes.key?(:'scan_dns_record_id')

      self.scan_dns_record_id = attributes[:'scan_dns_record_id'] if attributes[:'scan_dns_record_id']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.reco_storage_size_in_gb = attributes[:'recoStorageSizeInGB'] if attributes[:'recoStorageSizeInGB']

      raise 'You cannot provide both :recoStorageSizeInGB and :reco_storage_size_in_gb' if attributes.key?(:'recoStorageSizeInGB') && attributes.key?(:'reco_storage_size_in_gb')

      self.reco_storage_size_in_gb = attributes[:'reco_storage_size_in_gb'] if attributes[:'reco_storage_size_in_gb']

      self.node_count = attributes[:'nodeCount'] if attributes[:'nodeCount']

      raise 'You cannot provide both :nodeCount and :node_count' if attributes.key?(:'nodeCount') && attributes.key?(:'node_count')

      self.node_count = attributes[:'node_count'] if attributes[:'node_count']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

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
    # @param [Object] database_edition Object to be assigned
    def database_edition=(database_edition)
      # rubocop:disable Style/ConditionalAssignment
      if database_edition && !DATABASE_EDITION_ENUM.include?(database_edition)
        OCI.logger.debug("Unknown value for 'database_edition' [" + database_edition + "]. Mapping to 'DATABASE_EDITION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_edition = DATABASE_EDITION_UNKNOWN_ENUM_VALUE
      else
        @database_edition = database_edition
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] disk_redundancy Object to be assigned
    def disk_redundancy=(disk_redundancy)
      # rubocop:disable Style/ConditionalAssignment
      if disk_redundancy && !DISK_REDUNDANCY_ENUM.include?(disk_redundancy)
        OCI.logger.debug("Unknown value for 'disk_redundancy' [" + disk_redundancy + "]. Mapping to 'DISK_REDUNDANCY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @disk_redundancy = DISK_REDUNDANCY_UNKNOWN_ENUM_VALUE
      else
        @disk_redundancy = disk_redundancy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      # rubocop:disable Style/ConditionalAssignment
      if license_model && !LICENSE_MODEL_ENUM.include?(license_model)
        OCI.logger.debug("Unknown value for 'license_model' [" + license_model + "]. Mapping to 'LICENSE_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_model = LICENSE_MODEL_UNKNOWN_ENUM_VALUE
      else
        @license_model = license_model
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        iorm_config_cache == other.iorm_config_cache &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        availability_domain == other.availability_domain &&
        fault_domains == other.fault_domains &&
        subnet_id == other.subnet_id &&
        backup_subnet_id == other.backup_subnet_id &&
        nsg_ids == other.nsg_ids &&
        backup_network_nsg_ids == other.backup_network_nsg_ids &&
        shape == other.shape &&
        ssh_public_keys == other.ssh_public_keys &&
        time_zone == other.time_zone &&
        hostname == other.hostname &&
        domain == other.domain &&
        version == other.version &&
        cpu_core_count == other.cpu_core_count &&
        cluster_name == other.cluster_name &&
        data_storage_percentage == other.data_storage_percentage &&
        database_edition == other.database_edition &&
        last_patch_history_entry_id == other.last_patch_history_entry_id &&
        listener_port == other.listener_port &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        lifecycle_details == other.lifecycle_details &&
        disk_redundancy == other.disk_redundancy &&
        sparse_diskgroup == other.sparse_diskgroup &&
        scan_ip_ids == other.scan_ip_ids &&
        vip_ids == other.vip_ids &&
        scan_dns_record_id == other.scan_dns_record_id &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        reco_storage_size_in_gb == other.reco_storage_size_in_gb &&
        node_count == other.node_count &&
        license_model == other.license_model &&
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
      [iorm_config_cache, id, compartment_id, display_name, availability_domain, fault_domains, subnet_id, backup_subnet_id, nsg_ids, backup_network_nsg_ids, shape, ssh_public_keys, time_zone, hostname, domain, version, cpu_core_count, cluster_name, data_storage_percentage, database_edition, last_patch_history_entry_id, listener_port, lifecycle_state, time_created, lifecycle_details, disk_redundancy, sparse_diskgroup, scan_ip_ids, vip_ids, scan_dns_record_id, data_storage_size_in_gbs, reco_storage_size_in_gb, node_count, license_model, freeform_tags, defined_tags].hash
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
