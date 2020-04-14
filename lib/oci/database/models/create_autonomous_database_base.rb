# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create an Oracle Autonomous Database.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Database::Models::CreateAutonomousDatabaseBase
    DB_WORKLOAD_ENUM = [
      DB_WORKLOAD_OLTP = 'OLTP'.freeze,
      DB_WORKLOAD_DW = 'DW'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    SOURCE_ENUM = [
      SOURCE_NONE = 'NONE'.freeze,
      SOURCE_DATABASE = 'DATABASE'.freeze,
      SOURCE_BACKUP_FROM_ID = 'BACKUP_FROM_ID'.freeze,
      SOURCE_BACKUP_FROM_TIMESTAMP = 'BACKUP_FROM_TIMESTAMP'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment of the Autonomous Database.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The database name. The name must begin with an alphabetic character and can contain a maximum of 14 alphanumeric characters. Special characters are not permitted. The database name must be unique in the tenancy.
    # @return [String]
    attr_accessor :db_name

    # **[Required]** The number of OCPU cores to be made available to the database.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The Autonomous Database workload type. The following values are valid:
    #
    # - OLTP - indicates an Autonomous Transaction Processing database
    # - DW - indicates an Autonomous Data Warehouse database
    #
    # @return [String]
    attr_reader :db_workload

    # **[Required]** The size, in terabytes, of the data volume that will be created and attached to the database. This storage can later be scaled up if needed.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_tbs

    # Indicates if this is an Always Free resource. The default value is false. Note that Always Free Autonomous Databases have 1 CPU and 20GB of memory. For Always Free databases, memory and CPU cannot be scaled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_free_tier

    # **[Required]** The password must be between 12 and 30 characters long, and must contain at least 1 uppercase, 1 lowercase, and 1 numeric character. It cannot contain the double quote symbol (\") or the username \"admin\", regardless of casing.
    # @return [String]
    attr_accessor :admin_password

    # The user-friendly name for the Autonomous Database. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The Oracle license model that applies to the Oracle Autonomous Database. Note that when provisioning an Autonomous Database on [dedicated Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adbddoverview.htm), this attribute must be null because the attribute is already set at the
    # Autonomous Exadata Infrastructure level. When using [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI), if a value is not specified, the system will supply the value of `BRING_YOUR_OWN_LICENSE`.
    #
    # @return [String]
    attr_reader :license_model

    # If set to `TRUE`, indicates that an Autonomous Database preview version is being provisioned, and that the preview version's terms of service have been accepted. Note that preview version software is only available for databases on [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI).
    #
    # @return [BOOLEAN]
    attr_accessor :is_preview_version_with_service_terms_accepted

    # Indicates if auto scaling is enabled for the Autonomous Database OCPU core count. The default value is `FALSE`. Note that auto scaling is available for databases on [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI) only.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # True if the database is on [dedicated Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adbddoverview.htm).
    #
    # @return [BOOLEAN]
    attr_accessor :is_dedicated

    # The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :autonomous_container_database_id

    # The client IP access control list (ACL). This feature is available for databases on [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI) only.
    # Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance. This is an array of CIDR (Classless Inter-Domain Routing) notations for a subnet or VCN OCID.
    # To add the whitelist VCN specific subnet or IP, use a semicoln ';' as a deliminator to add the VCN specific subnets or IPs.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"ocid1.vcn.oc1.sea.aaaaaaaard2hfx2nn3e5xeo6j6o62jga44xjizkw\",\"ocid1.vcn.oc1.sea.aaaaaaaard2hfx2nn3e5xeo6j6o62jga44xjizkw;1.1.1.1\",\"ocid1.vcn.oc1.sea.aaaaaaaard2hfx2nn3e5xeo6j6o62jga44xjizkw;1.1.0.0/16\"]`
    #
    # @return [Array<String>]
    attr_accessor :whitelisted_ips

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the resource is associated with.
    #
    # **Subnet Restrictions:**
    # - For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
    # - For Exadata and virtual machine 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.128.0/20.
    # - For Autonomous Database, setting this will disable public secure access to the database.
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and the backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    # **NsgIds restrictions:**
    # - Autonomous Databases with private access require at least 1 Network Security Group (NSG). The nsgIds array cannot be empty.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The private endpoint label for the resource.
    # @return [String]
    attr_accessor :private_endpoint_label

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

    # A valid Oracle Database version for Autonomous Database.
    # @return [String]
    attr_accessor :db_version

    # The source of the database: Use `NONE` for creating a new Autonomous Database. Use `DATABASE` for creating a new Autonomous Database by cloning an existing Autonomous Database.
    #
    # For Autonomous Databases on [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI), the following cloning options are available: Use `BACKUP_FROM_ID` for creating a new Autonomous Database from a specified backup. Use `BACKUP_FROM_TIMESTAMP` for creating a point-in-time Autonomous Database clone using backups. For more information, see [Cloning an Autonomous Database](https://docs.cloud.oracle.com/Content/Database/Tasks/adbcloning.htm).
    #
    # @return [String]
    attr_reader :source

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'db_name': :'dbName',
        'cpu_core_count': :'cpuCoreCount',
        'db_workload': :'dbWorkload',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'is_free_tier': :'isFreeTier',
        'admin_password': :'adminPassword',
        'display_name': :'displayName',
        'license_model': :'licenseModel',
        'is_preview_version_with_service_terms_accepted': :'isPreviewVersionWithServiceTermsAccepted',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'is_dedicated': :'isDedicated',
        'autonomous_container_database_id': :'autonomousContainerDatabaseId',
        'whitelisted_ips': :'whitelistedIps',
        'subnet_id': :'subnetId',
        'nsg_ids': :'nsgIds',
        'private_endpoint_label': :'privateEndpointLabel',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'db_version': :'dbVersion',
        'source': :'source'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'db_name': :'String',
        'cpu_core_count': :'Integer',
        'db_workload': :'String',
        'data_storage_size_in_tbs': :'Integer',
        'is_free_tier': :'BOOLEAN',
        'admin_password': :'String',
        'display_name': :'String',
        'license_model': :'String',
        'is_preview_version_with_service_terms_accepted': :'BOOLEAN',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'is_dedicated': :'BOOLEAN',
        'autonomous_container_database_id': :'String',
        'whitelisted_ips': :'Array<String>',
        'subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'private_endpoint_label': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'db_version': :'String',
        'source': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'source'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Database::Models::CreateAutonomousDatabaseCloneDetails' if type == 'DATABASE'
      return 'OCI::Database::Models::CreateAutonomousDatabaseFromBackupDetails' if type == 'BACKUP_FROM_ID'
      return 'OCI::Database::Models::CreateAutonomousDatabaseFromBackupTimestampDetails' if type == 'BACKUP_FROM_TIMESTAMP'
      return 'OCI::Database::Models::CreateAutonomousDatabaseDetails' if type == 'NONE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Database::Models::CreateAutonomousDatabaseBase'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [Integer] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [BOOLEAN] :is_free_tier The value to assign to the {#is_free_tier} property
    # @option attributes [String] :admin_password The value to assign to the {#admin_password} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [BOOLEAN] :is_preview_version_with_service_terms_accepted The value to assign to the {#is_preview_version_with_service_terms_accepted} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [BOOLEAN] :is_dedicated The value to assign to the {#is_dedicated} property
    # @option attributes [String] :autonomous_container_database_id The value to assign to the {#autonomous_container_database_id} property
    # @option attributes [Array<String>] :whitelisted_ips The value to assign to the {#whitelisted_ips} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :private_endpoint_label The value to assign to the {#private_endpoint_label} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :source The value to assign to the {#source} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.is_free_tier = attributes[:'isFreeTier'] unless attributes[:'isFreeTier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isFreeTier and :is_free_tier' if attributes.key?(:'isFreeTier') && attributes.key?(:'is_free_tier')

      self.is_free_tier = attributes[:'is_free_tier'] unless attributes[:'is_free_tier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') && !attributes.key?(:'is_free_tier') # rubocop:disable Style/StringLiterals

      self.admin_password = attributes[:'adminPassword'] if attributes[:'adminPassword']

      raise 'You cannot provide both :adminPassword and :admin_password' if attributes.key?(:'adminPassword') && attributes.key?(:'admin_password')

      self.admin_password = attributes[:'admin_password'] if attributes[:'admin_password']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.is_preview_version_with_service_terms_accepted = attributes[:'isPreviewVersionWithServiceTermsAccepted'] unless attributes[:'isPreviewVersionWithServiceTermsAccepted'].nil?
      self.is_preview_version_with_service_terms_accepted = false if is_preview_version_with_service_terms_accepted.nil? && !attributes.key?(:'isPreviewVersionWithServiceTermsAccepted') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPreviewVersionWithServiceTermsAccepted and :is_preview_version_with_service_terms_accepted' if attributes.key?(:'isPreviewVersionWithServiceTermsAccepted') && attributes.key?(:'is_preview_version_with_service_terms_accepted')

      self.is_preview_version_with_service_terms_accepted = attributes[:'is_preview_version_with_service_terms_accepted'] unless attributes[:'is_preview_version_with_service_terms_accepted'].nil?
      self.is_preview_version_with_service_terms_accepted = false if is_preview_version_with_service_terms_accepted.nil? && !attributes.key?(:'isPreviewVersionWithServiceTermsAccepted') && !attributes.key?(:'is_preview_version_with_service_terms_accepted') # rubocop:disable Style/StringLiterals

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?
      self.is_auto_scaling_enabled = false if is_auto_scaling_enabled.nil? && !attributes.key?(:'isAutoScalingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?
      self.is_auto_scaling_enabled = false if is_auto_scaling_enabled.nil? && !attributes.key?(:'isAutoScalingEnabled') && !attributes.key?(:'is_auto_scaling_enabled') # rubocop:disable Style/StringLiterals

      self.is_dedicated = attributes[:'isDedicated'] unless attributes[:'isDedicated'].nil?

      raise 'You cannot provide both :isDedicated and :is_dedicated' if attributes.key?(:'isDedicated') && attributes.key?(:'is_dedicated')

      self.is_dedicated = attributes[:'is_dedicated'] unless attributes[:'is_dedicated'].nil?

      self.autonomous_container_database_id = attributes[:'autonomousContainerDatabaseId'] if attributes[:'autonomousContainerDatabaseId']

      raise 'You cannot provide both :autonomousContainerDatabaseId and :autonomous_container_database_id' if attributes.key?(:'autonomousContainerDatabaseId') && attributes.key?(:'autonomous_container_database_id')

      self.autonomous_container_database_id = attributes[:'autonomous_container_database_id'] if attributes[:'autonomous_container_database_id']

      self.whitelisted_ips = attributes[:'whitelistedIps'] if attributes[:'whitelistedIps']

      raise 'You cannot provide both :whitelistedIps and :whitelisted_ips' if attributes.key?(:'whitelistedIps') && attributes.key?(:'whitelisted_ips')

      self.whitelisted_ips = attributes[:'whitelisted_ips'] if attributes[:'whitelisted_ips']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.private_endpoint_label = attributes[:'privateEndpointLabel'] if attributes[:'privateEndpointLabel']

      raise 'You cannot provide both :privateEndpointLabel and :private_endpoint_label' if attributes.key?(:'privateEndpointLabel') && attributes.key?(:'private_endpoint_label')

      self.private_endpoint_label = attributes[:'private_endpoint_label'] if attributes[:'private_endpoint_label']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.source = attributes[:'source'] if attributes[:'source']
      self.source = "NONE" if source.nil? && !attributes.key?(:'source') # rubocop:disable Style/StringLiterals
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
    # @param [Object] source Object to be assigned
    def source=(source)
      raise "Invalid value for 'source': this must be one of the values in SOURCE_ENUM." if source && !SOURCE_ENUM.include?(source)

      @source = source
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        db_name == other.db_name &&
        cpu_core_count == other.cpu_core_count &&
        db_workload == other.db_workload &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        is_free_tier == other.is_free_tier &&
        admin_password == other.admin_password &&
        display_name == other.display_name &&
        license_model == other.license_model &&
        is_preview_version_with_service_terms_accepted == other.is_preview_version_with_service_terms_accepted &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        is_dedicated == other.is_dedicated &&
        autonomous_container_database_id == other.autonomous_container_database_id &&
        whitelisted_ips == other.whitelisted_ips &&
        subnet_id == other.subnet_id &&
        nsg_ids == other.nsg_ids &&
        private_endpoint_label == other.private_endpoint_label &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        db_version == other.db_version &&
        source == other.source
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
      [compartment_id, db_name, cpu_core_count, db_workload, data_storage_size_in_tbs, is_free_tier, admin_password, display_name, license_model, is_preview_version_with_service_terms_accepted, is_auto_scaling_enabled, is_dedicated, autonomous_container_database_id, whitelisted_ips, subnet_id, nsg_ids, private_endpoint_label, freeform_tags, defined_tags, db_version, source].hash
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
