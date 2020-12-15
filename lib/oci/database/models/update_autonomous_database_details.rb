# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to update an Oracle Autonomous Database.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::UpdateAutonomousDatabaseDetails
    DB_WORKLOAD_ENUM = [
      DB_WORKLOAD_OLTP = 'OLTP'.freeze,
      DB_WORKLOAD_DW = 'DW'.freeze,
      DB_WORKLOAD_AJD = 'AJD'.freeze,
      DB_WORKLOAD_APEX = 'APEX'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    REFRESHABLE_MODE_ENUM = [
      REFRESHABLE_MODE_AUTOMATIC = 'AUTOMATIC'.freeze,
      REFRESHABLE_MODE_MANUAL = 'MANUAL'.freeze
    ].freeze

    OPEN_MODE_ENUM = [
      OPEN_MODE_READ_ONLY = 'READ_ONLY'.freeze,
      OPEN_MODE_READ_WRITE = 'READ_WRITE'.freeze
    ].freeze

    PERMISSION_LEVEL_ENUM = [
      PERMISSION_LEVEL_RESTRICTED = 'RESTRICTED'.freeze,
      PERMISSION_LEVEL_UNRESTRICTED = 'UNRESTRICTED'.freeze
    ].freeze

    # The number of CPU cores to be made available to the database.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The size, in terabytes, of the data volume that will be attached to the database.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_tbs

    # The user-friendly name for the Autonomous Database. The name does not have to be unique. Can only be updated for Autonomous Databases
    # using dedicated Exadata infrastructure.
    #
    # @return [String]
    attr_accessor :display_name

    # Indicates if this is an Always Free resource. The default value is false. Note that Always Free Autonomous Databases have 1 CPU and 20GB of memory. For Always Free databases, memory and CPU cannot be scaled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_free_tier

    # The password must be between 12 and 30 characters long, and must contain at least 1 uppercase, 1 lowercase, and 1 numeric character. It cannot contain the double quote symbol (\") or the username \"admin\", regardless of casing. It must be different from the last four passwords and it must not be a password used within the last 24 hours.
    # @return [String]
    attr_accessor :admin_password

    # New name for this Autonomous Database.
    # For databases using dedicated Exadata infrastructure, the name must begin with an alphabetic character, and can contain a maximum of eight alphanumeric characters. Special characters are not permitted.
    # For databases using shared Exadata infrastructure, the name must begin with an alphabetic character, and can contain a maximum of 14 alphanumeric characters. Special characters are not permitted. The database name must be unique in the tenancy.
    #
    # @return [String]
    attr_accessor :db_name

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

    # The Autonomous Database workload type. The following values are valid:
    #
    # - OLTP - indicates an Autonomous Transaction Processing database
    # - DW - indicates an Autonomous Data Warehouse database
    # - AJD - indicates an Autonomous JSON Database
    # - APEX - indicates an Autonomous Database with the Oracle Application Express (APEX) workload type.
    #
    # @return [String]
    attr_reader :db_workload

    # The Oracle license model that applies to the Oracle Autonomous Database. Bring your own license (BYOL) allows you to apply your current on-premises Oracle software licenses to equivalent, highly automated Oracle PaaS and IaaS services in the cloud.
    # License Included allows you to subscribe to new Oracle Database software licenses and the Database service.
    # Note that when provisioning an Autonomous Database on [dedicated Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adbddoverview.htm), this attribute must be null because the attribute is already set at the
    # Autonomous Exadata Infrastructure level. When using [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI), if a value is not specified, the system will supply the value of `BRING_YOUR_OWN_LICENSE`.
    #
    # @return [String]
    attr_reader :license_model

    # Indicates if the database-level access control is enabled.
    # If disabled, database access is defined by the network security rules.
    # If enabled, database access is restricted to the IP addresses defined by the rules specified with the `whitelistedIps` property. While specifying `whitelistedIps` rules is optional,
    #  if database-level access control is enabled and no rules are specified, the database will become inaccessible. The rules can be added later using the `UpdateAutonomousDatabase` API operation or edit option in console.
    # When creating a database clone, the desired access control setting should be specified. By default, database-level access control will be disabled for the clone.
    #
    # This property is applicable only to Autonomous Databases on the Exadata Cloud@Customer platform.
    #
    # @return [BOOLEAN]
    attr_accessor :is_access_control_enabled

    # The client IP access control list (ACL). This feature is available for autonomous databases on [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI) and on Exadata Cloud@Customer.
    # Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance.
    #
    # For shared Exadata infrastructure, this is an array of CIDR (Classless Inter-Domain Routing) notations for a subnet or VCN OCID.
    # Use a semicolon (;) as a deliminator between the VCN-specific subnets or IPs.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"ocid1.vcn.oc1.sea.<unique_id>\",\"ocid1.vcn.oc1.sea.<unique_id1>;1.1.1.1\",\"ocid1.vcn.oc1.sea.<unique_id2>;1.1.0.0/16\"]`
    # For Exadata Cloud@Customer, this is an array of IP addresses or CIDR (Classless Inter-Domain Routing) notations.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"1.1.2.25\"]`
    #
    # For an update operation, if you want to delete all the IPs in the ACL, use an array with a single empty string entry.
    #
    # @return [Array<String>]
    attr_accessor :whitelisted_ips

    # Indicates whether to enable or disable auto scaling for the Autonomous Database OCPU core count. Setting to `true` enables auto scaling. Setting to `false` disables auto scaling. The default value is true. Auto scaling is available for databases on [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI) only.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # Indicates whether the Autonomous Database is a refreshable clone.
    # @return [BOOLEAN]
    attr_accessor :is_refreshable_clone

    # The refresh mode of the clone. AUTOMATIC indicates that the clone is automatically being refreshed with data from the source Autonomous Database.
    # @return [String]
    attr_reader :refreshable_mode

    # Indicates whether the Autonomous Database has Data Guard enabled.
    # @return [BOOLEAN]
    attr_accessor :is_data_guard_enabled

    # A valid Oracle Database version for Autonomous Database.
    # @return [String]
    attr_accessor :db_version

    # The `DATABASE OPEN` mode. You can open the database in `READ_ONLY` or `READ_WRITE` mode.
    # @return [String]
    attr_reader :open_mode

    # The Autonomous Database permission level. Restricted mode allows access only to admin users.
    # @return [String]
    attr_reader :permission_level

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the resource is associated with.
    #
    # **Subnet Restrictions:**
    # - For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
    # - For Exadata and virtual machine 2-node RAC systems, do not use a subnet that overlaps with 192.168.128.0/20.
    # - For Autonomous Database, setting this will disable public secure access to the database.
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and the backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # The private endpoint label for the resource. Setting this to an empty string, after the private endpoint database gets created, will change the same private endpoint database to the public endpoint database.
    # @return [String]
    attr_accessor :private_endpoint_label

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    # **NsgIds restrictions:**
    # - Autonomous Databases with private access require at least 1 Network Security Group (NSG). The nsgIds array cannot be empty.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cpu_core_count': :'cpuCoreCount',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'display_name': :'displayName',
        'is_free_tier': :'isFreeTier',
        'admin_password': :'adminPassword',
        'db_name': :'dbName',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'db_workload': :'dbWorkload',
        'license_model': :'licenseModel',
        'is_access_control_enabled': :'isAccessControlEnabled',
        'whitelisted_ips': :'whitelistedIps',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'is_refreshable_clone': :'isRefreshableClone',
        'refreshable_mode': :'refreshableMode',
        'is_data_guard_enabled': :'isDataGuardEnabled',
        'db_version': :'dbVersion',
        'open_mode': :'openMode',
        'permission_level': :'permissionLevel',
        'subnet_id': :'subnetId',
        'private_endpoint_label': :'privateEndpointLabel',
        'nsg_ids': :'nsgIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cpu_core_count': :'Integer',
        'data_storage_size_in_tbs': :'Integer',
        'display_name': :'String',
        'is_free_tier': :'BOOLEAN',
        'admin_password': :'String',
        'db_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'db_workload': :'String',
        'license_model': :'String',
        'is_access_control_enabled': :'BOOLEAN',
        'whitelisted_ips': :'Array<String>',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'is_refreshable_clone': :'BOOLEAN',
        'refreshable_mode': :'String',
        'is_data_guard_enabled': :'BOOLEAN',
        'db_version': :'String',
        'open_mode': :'String',
        'permission_level': :'String',
        'subnet_id': :'String',
        'private_endpoint_label': :'String',
        'nsg_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_free_tier The value to assign to the {#is_free_tier} property
    # @option attributes [String] :admin_password The value to assign to the {#admin_password} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [BOOLEAN] :is_access_control_enabled The value to assign to the {#is_access_control_enabled} property
    # @option attributes [Array<String>] :whitelisted_ips The value to assign to the {#whitelisted_ips} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [BOOLEAN] :is_refreshable_clone The value to assign to the {#is_refreshable_clone} property
    # @option attributes [String] :refreshable_mode The value to assign to the {#refreshable_mode} property
    # @option attributes [BOOLEAN] :is_data_guard_enabled The value to assign to the {#is_data_guard_enabled} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :open_mode The value to assign to the {#open_mode} property
    # @option attributes [String] :permission_level The value to assign to the {#permission_level} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :private_endpoint_label The value to assign to the {#private_endpoint_label} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_free_tier = attributes[:'isFreeTier'] unless attributes[:'isFreeTier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isFreeTier and :is_free_tier' if attributes.key?(:'isFreeTier') && attributes.key?(:'is_free_tier')

      self.is_free_tier = attributes[:'is_free_tier'] unless attributes[:'is_free_tier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') && !attributes.key?(:'is_free_tier') # rubocop:disable Style/StringLiterals

      self.admin_password = attributes[:'adminPassword'] if attributes[:'adminPassword']

      raise 'You cannot provide both :adminPassword and :admin_password' if attributes.key?(:'adminPassword') && attributes.key?(:'admin_password')

      self.admin_password = attributes[:'admin_password'] if attributes[:'admin_password']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.is_access_control_enabled = attributes[:'isAccessControlEnabled'] unless attributes[:'isAccessControlEnabled'].nil?

      raise 'You cannot provide both :isAccessControlEnabled and :is_access_control_enabled' if attributes.key?(:'isAccessControlEnabled') && attributes.key?(:'is_access_control_enabled')

      self.is_access_control_enabled = attributes[:'is_access_control_enabled'] unless attributes[:'is_access_control_enabled'].nil?

      self.whitelisted_ips = attributes[:'whitelistedIps'] if attributes[:'whitelistedIps']

      raise 'You cannot provide both :whitelistedIps and :whitelisted_ips' if attributes.key?(:'whitelistedIps') && attributes.key?(:'whitelisted_ips')

      self.whitelisted_ips = attributes[:'whitelisted_ips'] if attributes[:'whitelisted_ips']

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?

      self.is_refreshable_clone = attributes[:'isRefreshableClone'] unless attributes[:'isRefreshableClone'].nil?

      raise 'You cannot provide both :isRefreshableClone and :is_refreshable_clone' if attributes.key?(:'isRefreshableClone') && attributes.key?(:'is_refreshable_clone')

      self.is_refreshable_clone = attributes[:'is_refreshable_clone'] unless attributes[:'is_refreshable_clone'].nil?

      self.refreshable_mode = attributes[:'refreshableMode'] if attributes[:'refreshableMode']

      raise 'You cannot provide both :refreshableMode and :refreshable_mode' if attributes.key?(:'refreshableMode') && attributes.key?(:'refreshable_mode')

      self.refreshable_mode = attributes[:'refreshable_mode'] if attributes[:'refreshable_mode']

      self.is_data_guard_enabled = attributes[:'isDataGuardEnabled'] unless attributes[:'isDataGuardEnabled'].nil?

      raise 'You cannot provide both :isDataGuardEnabled and :is_data_guard_enabled' if attributes.key?(:'isDataGuardEnabled') && attributes.key?(:'is_data_guard_enabled')

      self.is_data_guard_enabled = attributes[:'is_data_guard_enabled'] unless attributes[:'is_data_guard_enabled'].nil?

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.open_mode = attributes[:'openMode'] if attributes[:'openMode']

      raise 'You cannot provide both :openMode and :open_mode' if attributes.key?(:'openMode') && attributes.key?(:'open_mode')

      self.open_mode = attributes[:'open_mode'] if attributes[:'open_mode']

      self.permission_level = attributes[:'permissionLevel'] if attributes[:'permissionLevel']

      raise 'You cannot provide both :permissionLevel and :permission_level' if attributes.key?(:'permissionLevel') && attributes.key?(:'permission_level')

      self.permission_level = attributes[:'permission_level'] if attributes[:'permission_level']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.private_endpoint_label = attributes[:'privateEndpointLabel'] if attributes[:'privateEndpointLabel']

      raise 'You cannot provide both :privateEndpointLabel and :private_endpoint_label' if attributes.key?(:'privateEndpointLabel') && attributes.key?(:'private_endpoint_label')

      self.private_endpoint_label = attributes[:'private_endpoint_label'] if attributes[:'private_endpoint_label']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] db_workload Object to be assigned
    def db_workload=(db_workload)
      raise "Invalid value for 'db_workload': this must be one of the values in DB_WORKLOAD_ENUM." if db_workload && !DB_WORKLOAD_ENUM.include?(db_workload)

      @db_workload = db_workload
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)

      @license_model = license_model
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] refreshable_mode Object to be assigned
    def refreshable_mode=(refreshable_mode)
      raise "Invalid value for 'refreshable_mode': this must be one of the values in REFRESHABLE_MODE_ENUM." if refreshable_mode && !REFRESHABLE_MODE_ENUM.include?(refreshable_mode)

      @refreshable_mode = refreshable_mode
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] open_mode Object to be assigned
    def open_mode=(open_mode)
      raise "Invalid value for 'open_mode': this must be one of the values in OPEN_MODE_ENUM." if open_mode && !OPEN_MODE_ENUM.include?(open_mode)

      @open_mode = open_mode
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] permission_level Object to be assigned
    def permission_level=(permission_level)
      raise "Invalid value for 'permission_level': this must be one of the values in PERMISSION_LEVEL_ENUM." if permission_level && !PERMISSION_LEVEL_ENUM.include?(permission_level)

      @permission_level = permission_level
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cpu_core_count == other.cpu_core_count &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        display_name == other.display_name &&
        is_free_tier == other.is_free_tier &&
        admin_password == other.admin_password &&
        db_name == other.db_name &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        db_workload == other.db_workload &&
        license_model == other.license_model &&
        is_access_control_enabled == other.is_access_control_enabled &&
        whitelisted_ips == other.whitelisted_ips &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        is_refreshable_clone == other.is_refreshable_clone &&
        refreshable_mode == other.refreshable_mode &&
        is_data_guard_enabled == other.is_data_guard_enabled &&
        db_version == other.db_version &&
        open_mode == other.open_mode &&
        permission_level == other.permission_level &&
        subnet_id == other.subnet_id &&
        private_endpoint_label == other.private_endpoint_label &&
        nsg_ids == other.nsg_ids
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
      [cpu_core_count, data_storage_size_in_tbs, display_name, is_free_tier, admin_password, db_name, freeform_tags, defined_tags, db_workload, license_model, is_access_control_enabled, whitelisted_ips, is_auto_scaling_enabled, is_refreshable_clone, refreshable_mode, is_data_guard_enabled, db_version, open_mode, permission_level, subnet_id, private_endpoint_label, nsg_ids].hash
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
