# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The Database Service supports several types of DB Systems, ranging in size, price, and performance. For details about each type of system, see:
  #
  # - [Exadata DB Systems](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/Concepts/exaoverview.htm)
  # - [Bare Metal and Virtual Machine DB Systems](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/Concepts/overview.htm)
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about access control and compartments, see
  # [Overview of the Identity Service](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/overview.htm).
  #
  # For information about Availability Domains, see
  # [Regions and Availability Domains](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/regions.htm).
  #
  # To get a list of Availability Domains, use the `ListAvailabilityDomains` operation
  # in the Identity Service API.
  #
  class Database::Models::DbSystem # rubocop:disable Metrics/LineLength
    DATABASE_EDITION_ENUM = [
      DATABASE_EDITION_STANDARD_EDITION = 'STANDARD_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION = 'ENTERPRISE_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_EXTREME_PERFORMANCE = 'ENTERPRISE_EDITION_EXTREME_PERFORMANCE'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_HIGH_PERFORMANCE = 'ENTERPRISE_EDITION_HIGH_PERFORMANCE'.freeze,
      DATABASE_EDITION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the Availability Domain that the DB System is located in.
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the backup network subnet the DB System is associated with. Applicable only to Exadata.
    #
    # **Subnet Restriction:** See above subnetId's 'Subnet Restriction'.
    # to malfunction.
    #
    # @return [String]
    attr_accessor :backup_subnet_id

    # Cluster name for Exadata and 2-node RAC DB Systems. The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive.
    #
    # @return [String]
    attr_accessor :cluster_name

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The number of CPU cores enabled on the DB System.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The percentage assigned to DATA storage (user data and database files).
    # The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups). Accepted values are 40 and 80.
    #
    # @return [Integer]
    attr_accessor :data_storage_percentage

    # Data storage size, in GBs, that is currently available to the DB system. This is applicable only for VM-based DBs.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # **[Required]** The Oracle Database Edition that applies to all the databases on the DB System.
    #
    # @return [String]
    attr_reader :database_edition

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The type of redundancy configured for the DB System.
    # Normal is 2-way redundancy.
    # High is 3-way redundancy.
    #
    # @return [String]
    attr_reader :disk_redundancy

    # **[Required]** The user-friendly name for the DB System. It does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The domain name for the DB System.
    # @return [String]
    attr_accessor :domain

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The host name for the DB Node.
    # @return [String]
    attr_accessor :hostname

    # **[Required]** The OCID of the DB System.
    # @return [String]
    attr_accessor :id

    # The OCID of the last patch history. This is updated as soon as a patch operation is started.
    # @return [String]
    attr_accessor :last_patch_history_entry_id

    # The Oracle license model that applies to all the databases on the DB System. The default is LICENSE_INCLUDED.
    #
    # @return [String]
    attr_reader :license_model

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The current state of the DB System.
    # @return [String]
    attr_reader :lifecycle_state

    # The port number configured for the listener on the DB System.
    # @return [Integer]
    attr_accessor :listener_port

    # Number of nodes in this DB system. For RAC DBs, this will be greater than 1.
    #
    # @return [Integer]
    attr_accessor :node_count

    # RECO/REDO storage size, in GBs, that is currently allocated to the DB system. This is applicable only for VM-based DBs.
    #
    # @return [Integer]
    attr_accessor :reco_storage_size_in_gb

    # The OCID of the DNS record for the SCAN IP addresses that are associated with the DB System.
    #
    # @return [String]
    attr_accessor :scan_dns_record_id

    # The OCID of the Single Client Access Name (SCAN) IP addresses associated with the DB System.
    # SCAN IP addresses are typically used for load balancing and are not assigned to any interface.
    # Clusterware directs the requests to the appropriate nodes in the cluster.
    #
    # - For a single-node DB System, this list is empty.
    #
    # @return [Array<String>]
    attr_accessor :scan_ip_ids

    # **[Required]** The shape of the DB System. The shape determines resources to allocate to the DB system - CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes.
    # @return [String]
    attr_accessor :shape

    # **[Required]** The public key portion of one or more key pairs used for SSH access to the DB System.
    # @return [Array<String>]
    attr_accessor :ssh_public_keys

    # **[Required]** The OCID of the subnet the DB System is associated with.
    #
    # **Subnet Restrictions:**
    # - For single node and 2-node (RAC) DB Systems, do not use a subnet that overlaps with 192.168.16.16/28
    # - For Exadata and VM-based RAC DB Systems, do not use a subnet that overlaps with 192.168.128.0/20
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # The date and time the DB System was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The version of the DB System.
    # @return [String]
    attr_accessor :version

    # The OCID of the virtual IP (VIP) addresses associated with the DB System.
    # The Cluster Ready Services (CRS) creates and maintains one VIP address for each node in the DB System to
    # enable failover. If one node fails, the VIP is reassigned to another active node in the cluster.
    #
    # - For a single-node DB System, this list is empty.
    #
    # @return [Array<String>]
    attr_accessor :vip_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'backup_subnet_id': :'backupSubnetId',
        'cluster_name': :'clusterName',
        'compartment_id': :'compartmentId',
        'cpu_core_count': :'cpuCoreCount',
        'data_storage_percentage': :'dataStoragePercentage',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'database_edition': :'databaseEdition',
        'defined_tags': :'definedTags',
        'disk_redundancy': :'diskRedundancy',
        'display_name': :'displayName',
        'domain': :'domain',
        'freeform_tags': :'freeformTags',
        'hostname': :'hostname',
        'id': :'id',
        'last_patch_history_entry_id': :'lastPatchHistoryEntryId',
        'license_model': :'licenseModel',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'listener_port': :'listenerPort',
        'node_count': :'nodeCount',
        'reco_storage_size_in_gb': :'recoStorageSizeInGB',
        'scan_dns_record_id': :'scanDnsRecordId',
        'scan_ip_ids': :'scanIpIds',
        'shape': :'shape',
        'ssh_public_keys': :'sshPublicKeys',
        'subnet_id': :'subnetId',
        'time_created': :'timeCreated',
        'version': :'version',
        'vip_ids': :'vipIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'backup_subnet_id': :'String',
        'cluster_name': :'String',
        'compartment_id': :'String',
        'cpu_core_count': :'Integer',
        'data_storage_percentage': :'Integer',
        'data_storage_size_in_gbs': :'Integer',
        'database_edition': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'disk_redundancy': :'String',
        'display_name': :'String',
        'domain': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname': :'String',
        'id': :'String',
        'last_patch_history_entry_id': :'String',
        'license_model': :'String',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'listener_port': :'Integer',
        'node_count': :'Integer',
        'reco_storage_size_in_gb': :'Integer',
        'scan_dns_record_id': :'String',
        'scan_ip_ids': :'Array<String>',
        'shape': :'String',
        'ssh_public_keys': :'Array<String>',
        'subnet_id': :'String',
        'time_created': :'DateTime',
        'version': :'String',
        'vip_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :backup_subnet_id The value to assign to the {#backup_subnet_id} property
    # @option attributes [String] :cluster_name The value to assign to the {#cluster_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :data_storage_percentage The value to assign to the {#data_storage_percentage} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :disk_redundancy The value to assign to the {#disk_redundancy} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :last_patch_history_entry_id The value to assign to the {#last_patch_history_entry_id} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Integer] :listener_port The value to assign to the {#listener_port} property
    # @option attributes [Integer] :node_count The value to assign to the {#node_count} property
    # @option attributes [Integer] :reco_storage_size_in_gb The value to assign to the {#reco_storage_size_in_gb} property
    # @option attributes [String] :scan_dns_record_id The value to assign to the {#scan_dns_record_id} property
    # @option attributes [Array<String>] :scan_ip_ids The value to assign to the {#scan_ip_ids} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {#ssh_public_keys} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Array<String>] :vip_ids The value to assign to the {#vip_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.backup_subnet_id = attributes[:'backupSubnetId'] if attributes[:'backupSubnetId']

      raise 'You cannot provide both :backupSubnetId and :backup_subnet_id' if attributes.key?(:'backupSubnetId') && attributes.key?(:'backup_subnet_id')

      self.backup_subnet_id = attributes[:'backup_subnet_id'] if attributes[:'backup_subnet_id']

      self.cluster_name = attributes[:'clusterName'] if attributes[:'clusterName']

      raise 'You cannot provide both :clusterName and :cluster_name' if attributes.key?(:'clusterName') && attributes.key?(:'cluster_name')

      self.cluster_name = attributes[:'cluster_name'] if attributes[:'cluster_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.data_storage_percentage = attributes[:'dataStoragePercentage'] if attributes[:'dataStoragePercentage']

      raise 'You cannot provide both :dataStoragePercentage and :data_storage_percentage' if attributes.key?(:'dataStoragePercentage') && attributes.key?(:'data_storage_percentage')

      self.data_storage_percentage = attributes[:'data_storage_percentage'] if attributes[:'data_storage_percentage']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.disk_redundancy = attributes[:'diskRedundancy'] if attributes[:'diskRedundancy']

      raise 'You cannot provide both :diskRedundancy and :disk_redundancy' if attributes.key?(:'diskRedundancy') && attributes.key?(:'disk_redundancy')

      self.disk_redundancy = attributes[:'disk_redundancy'] if attributes[:'disk_redundancy']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.id = attributes[:'id'] if attributes[:'id']

      self.last_patch_history_entry_id = attributes[:'lastPatchHistoryEntryId'] if attributes[:'lastPatchHistoryEntryId']

      raise 'You cannot provide both :lastPatchHistoryEntryId and :last_patch_history_entry_id' if attributes.key?(:'lastPatchHistoryEntryId') && attributes.key?(:'last_patch_history_entry_id')

      self.last_patch_history_entry_id = attributes[:'last_patch_history_entry_id'] if attributes[:'last_patch_history_entry_id']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.listener_port = attributes[:'listenerPort'] if attributes[:'listenerPort']

      raise 'You cannot provide both :listenerPort and :listener_port' if attributes.key?(:'listenerPort') && attributes.key?(:'listener_port')

      self.listener_port = attributes[:'listener_port'] if attributes[:'listener_port']

      self.node_count = attributes[:'nodeCount'] if attributes[:'nodeCount']

      raise 'You cannot provide both :nodeCount and :node_count' if attributes.key?(:'nodeCount') && attributes.key?(:'node_count')

      self.node_count = attributes[:'node_count'] if attributes[:'node_count']

      self.reco_storage_size_in_gb = attributes[:'recoStorageSizeInGB'] if attributes[:'recoStorageSizeInGB']

      raise 'You cannot provide both :recoStorageSizeInGB and :reco_storage_size_in_gb' if attributes.key?(:'recoStorageSizeInGB') && attributes.key?(:'reco_storage_size_in_gb')

      self.reco_storage_size_in_gb = attributes[:'reco_storage_size_in_gb'] if attributes[:'reco_storage_size_in_gb']

      self.scan_dns_record_id = attributes[:'scanDnsRecordId'] if attributes[:'scanDnsRecordId']

      raise 'You cannot provide both :scanDnsRecordId and :scan_dns_record_id' if attributes.key?(:'scanDnsRecordId') && attributes.key?(:'scan_dns_record_id')

      self.scan_dns_record_id = attributes[:'scan_dns_record_id'] if attributes[:'scan_dns_record_id']

      self.scan_ip_ids = attributes[:'scanIpIds'] if attributes[:'scanIpIds']

      raise 'You cannot provide both :scanIpIds and :scan_ip_ids' if attributes.key?(:'scanIpIds') && attributes.key?(:'scan_ip_ids')

      self.scan_ip_ids = attributes[:'scan_ip_ids'] if attributes[:'scan_ip_ids']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.ssh_public_keys = attributes[:'sshPublicKeys'] if attributes[:'sshPublicKeys']

      raise 'You cannot provide both :sshPublicKeys and :ssh_public_keys' if attributes.key?(:'sshPublicKeys') && attributes.key?(:'ssh_public_keys')

      self.ssh_public_keys = attributes[:'ssh_public_keys'] if attributes[:'ssh_public_keys']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.version = attributes[:'version'] if attributes[:'version']

      self.vip_ids = attributes[:'vipIds'] if attributes[:'vipIds']

      raise 'You cannot provide both :vipIds and :vip_ids' if attributes.key?(:'vipIds') && attributes.key?(:'vip_ids')

      self.vip_ids = attributes[:'vip_ids'] if attributes[:'vip_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_edition Object to be assigned
    def database_edition=(database_edition)
      # rubocop:disable Style/ConditionalAssignment
      if database_edition && !DATABASE_EDITION_ENUM.include?(database_edition)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'database_edition' [" + database_edition + "]. Mapping to 'DATABASE_EDITION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @database_edition = DATABASE_EDITION_UNKNOWN_ENUM_VALUE
      else
        @database_edition = database_edition
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] disk_redundancy Object to be assigned
    def disk_redundancy=(disk_redundancy)
      # rubocop:disable Style/ConditionalAssignment
      if disk_redundancy && !DISK_REDUNDANCY_ENUM.include?(disk_redundancy)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'disk_redundancy' [" + disk_redundancy + "]. Mapping to 'DISK_REDUNDANCY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
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
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'license_model' [" + license_model + "]. Mapping to 'LICENSE_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @license_model = LICENSE_MODEL_UNKNOWN_ENUM_VALUE
      else
        @license_model = license_model
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
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
        availability_domain == other.availability_domain &&
        backup_subnet_id == other.backup_subnet_id &&
        cluster_name == other.cluster_name &&
        compartment_id == other.compartment_id &&
        cpu_core_count == other.cpu_core_count &&
        data_storage_percentage == other.data_storage_percentage &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        database_edition == other.database_edition &&
        defined_tags == other.defined_tags &&
        disk_redundancy == other.disk_redundancy &&
        display_name == other.display_name &&
        domain == other.domain &&
        freeform_tags == other.freeform_tags &&
        hostname == other.hostname &&
        id == other.id &&
        last_patch_history_entry_id == other.last_patch_history_entry_id &&
        license_model == other.license_model &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        listener_port == other.listener_port &&
        node_count == other.node_count &&
        reco_storage_size_in_gb == other.reco_storage_size_in_gb &&
        scan_dns_record_id == other.scan_dns_record_id &&
        scan_ip_ids == other.scan_ip_ids &&
        shape == other.shape &&
        ssh_public_keys == other.ssh_public_keys &&
        subnet_id == other.subnet_id &&
        time_created == other.time_created &&
        version == other.version &&
        vip_ids == other.vip_ids
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
      [availability_domain, backup_subnet_id, cluster_name, compartment_id, cpu_core_count, data_storage_percentage, data_storage_size_in_gbs, database_edition, defined_tags, disk_redundancy, display_name, domain, freeform_tags, hostname, id, last_patch_history_entry_id, license_model, lifecycle_details, lifecycle_state, listener_port, node_count, reco_storage_size_in_gb, scan_dns_record_id, scan_ip_ids, shape, ssh_public_keys, subnet_id, time_created, version, vip_ids].hash
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
