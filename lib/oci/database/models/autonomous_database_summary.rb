# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An Oracle Autonomous Database.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::AutonomousDatabaseSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_STATE_STOPPED = 'STOPPED'.freeze,
      LIFECYCLE_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNAVAILABLE = 'UNAVAILABLE'.freeze,
      LIFECYCLE_STATE_RESTORE_IN_PROGRESS = 'RESTORE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_RESTORE_FAILED = 'RESTORE_FAILED'.freeze,
      LIFECYCLE_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_SCALE_IN_PROGRESS = 'SCALE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_AVAILABLE_NEEDS_ATTENTION = 'AVAILABLE_NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_RESTARTING = 'RESTARTING'.freeze,
      LIFECYCLE_STATE_RECREATING = 'RECREATING'.freeze,
      LIFECYCLE_STATE_ROLE_CHANGE_IN_PROGRESS = 'ROLE_CHANGE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UPGRADING = 'UPGRADING'.freeze,
      LIFECYCLE_STATE_INACCESSIBLE = 'INACCESSIBLE'.freeze,
      LIFECYCLE_STATE_STANDBY = 'STANDBY'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INFRASTRUCTURE_TYPE_ENUM = [
      INFRASTRUCTURE_TYPE_CLOUD = 'CLOUD'.freeze,
      INFRASTRUCTURE_TYPE_CLOUD_AT_CUSTOMER = 'CLOUD_AT_CUSTOMER'.freeze,
      INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DB_WORKLOAD_ENUM = [
      DB_WORKLOAD_OLTP = 'OLTP'.freeze,
      DB_WORKLOAD_DW = 'DW'.freeze,
      DB_WORKLOAD_AJD = 'AJD'.freeze,
      DB_WORKLOAD_APEX = 'APEX'.freeze,
      DB_WORKLOAD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATA_SAFE_STATUS_ENUM = [
      DATA_SAFE_STATUS_REGISTERING = 'REGISTERING'.freeze,
      DATA_SAFE_STATUS_REGISTERED = 'REGISTERED'.freeze,
      DATA_SAFE_STATUS_DEREGISTERING = 'DEREGISTERING'.freeze,
      DATA_SAFE_STATUS_NOT_REGISTERED = 'NOT_REGISTERED'.freeze,
      DATA_SAFE_STATUS_FAILED = 'FAILED'.freeze,
      DATA_SAFE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATIONS_INSIGHTS_STATUS_ENUM = [
      OPERATIONS_INSIGHTS_STATUS_ENABLING = 'ENABLING'.freeze,
      OPERATIONS_INSIGHTS_STATUS_ENABLED = 'ENABLED'.freeze,
      OPERATIONS_INSIGHTS_STATUS_DISABLING = 'DISABLING'.freeze,
      OPERATIONS_INSIGHTS_STATUS_NOT_ENABLED = 'NOT_ENABLED'.freeze,
      OPERATIONS_INSIGHTS_STATUS_FAILED_ENABLING = 'FAILED_ENABLING'.freeze,
      OPERATIONS_INSIGHTS_STATUS_FAILED_DISABLING = 'FAILED_DISABLING'.freeze,
      OPERATIONS_INSIGHTS_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_MANAGEMENT_STATUS_ENUM = [
      DATABASE_MANAGEMENT_STATUS_ENABLING = 'ENABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_ENABLED = 'ENABLED'.freeze,
      DATABASE_MANAGEMENT_STATUS_DISABLING = 'DISABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_NOT_ENABLED = 'NOT_ENABLED'.freeze,
      DATABASE_MANAGEMENT_STATUS_FAILED_ENABLING = 'FAILED_ENABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_FAILED_DISABLING = 'FAILED_DISABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPEN_MODE_ENUM = [
      OPEN_MODE_READ_ONLY = 'READ_ONLY'.freeze,
      OPEN_MODE_READ_WRITE = 'READ_WRITE'.freeze,
      OPEN_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REFRESHABLE_STATUS_ENUM = [
      REFRESHABLE_STATUS_REFRESHING = 'REFRESHING'.freeze,
      REFRESHABLE_STATUS_NOT_REFRESHING = 'NOT_REFRESHING'.freeze,
      REFRESHABLE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REFRESHABLE_MODE_ENUM = [
      REFRESHABLE_MODE_AUTOMATIC = 'AUTOMATIC'.freeze,
      REFRESHABLE_MODE_MANUAL = 'MANUAL'.freeze,
      REFRESHABLE_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PERMISSION_LEVEL_ENUM = [
      PERMISSION_LEVEL_RESTRICTED = 'RESTRICTED'.freeze,
      PERMISSION_LEVEL_UNRESTRICTED = 'UNRESTRICTED'.freeze,
      PERMISSION_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_PRIMARY = 'PRIMARY'.freeze,
      ROLE_STANDBY = 'STANDBY'.freeze,
      ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATAGUARD_REGION_TYPE_ENUM = [
      DATAGUARD_REGION_TYPE_PRIMARY_DG_REGION = 'PRIMARY_DG_REGION'.freeze,
      DATAGUARD_REGION_TYPE_REMOTE_STANDBY_DG_REGION = 'REMOTE_STANDBY_DG_REGION'.freeze,
      DATAGUARD_REGION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_ENUM = [
      AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_EARLY = 'EARLY'.freeze,
      AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_REGULAR = 'REGULAR'.freeze,
      AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_EDITION_ENUM = [
      DATABASE_EDITION_STANDARD_EDITION = 'STANDARD_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION = 'ENTERPRISE_EDITION'.freeze,
      DATABASE_EDITION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous Database.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The current state of the Autonomous Database.
    # @return [String]
    attr_reader :lifecycle_state

    # Information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations.
    # @return [String]
    attr_accessor :kms_key_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure [vault](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @return [String]
    attr_accessor :vault_id

    # KMS key lifecycle details.
    # @return [String]
    attr_accessor :kms_key_lifecycle_details

    # The OCID of the key container version that is used in database transparent data encryption (TDE) operations KMS Key can have multiple key versions. If none is specified, the current key version (latest) of the Key Id is used for the operation.
    #
    # @return [String]
    attr_accessor :kms_key_version_id

    # **[Required]** The database name.
    # @return [String]
    attr_accessor :db_name

    # The character set for the autonomous database.  The default is AL32UTF8. Allowed values are:
    #
    # AL32UTF8, AR8ADOS710, AR8ADOS720, AR8APTEC715, AR8ARABICMACS, AR8ASMO8X, AR8ISO8859P6, AR8MSWIN1256, AR8MUSSAD768, AR8NAFITHA711, AR8NAFITHA721, AR8SAKHR706, AR8SAKHR707, AZ8ISO8859P9E, BG8MSWIN, BG8PC437S, BLT8CP921, BLT8ISO8859P13, BLT8MSWIN1257, BLT8PC775, BN8BSCII, CDN8PC863, CEL8ISO8859P14, CL8ISO8859P5, CL8ISOIR111, CL8KOI8R, CL8KOI8U, CL8MACCYRILLICS, CL8MSWIN1251, EE8ISO8859P2, EE8MACCES, EE8MACCROATIANS, EE8MSWIN1250, EE8PC852, EL8DEC, EL8ISO8859P7, EL8MACGREEKS, EL8MSWIN1253, EL8PC437S, EL8PC851, EL8PC869, ET8MSWIN923, HU8ABMOD, HU8CWI2, IN8ISCII, IS8PC861, IW8ISO8859P8, IW8MACHEBREWS, IW8MSWIN1255, IW8PC1507, JA16EUC, JA16EUCTILDE, JA16SJIS, JA16SJISTILDE, JA16VMS, KO16KSC5601, KO16KSCCS, KO16MSWIN949, LA8ISO6937, LA8PASSPORT, LT8MSWIN921, LT8PC772, LT8PC774, LV8PC1117, LV8PC8LR, LV8RST104090, N8PC865, NE8ISO8859P10, NEE8ISO8859P4, RU8BESTA, RU8PC855, RU8PC866, SE8ISO8859P3, TH8MACTHAIS, TH8TISASCII, TR8DEC, TR8MACTURKISHS, TR8MSWIN1254, TR8PC857, US7ASCII, US8PC437, UTF8, VN8MSWIN1258, VN8VN3, WE8DEC, WE8DG, WE8ISO8859P1, WE8ISO8859P15, WE8ISO8859P9, WE8MACROMAN8S, WE8MSWIN1252, WE8NCR4970, WE8NEXTSTEP, WE8PC850, WE8PC858, WE8PC860, WE8ROMAN8, ZHS16CGB231280, ZHS16GBK, ZHT16BIG5, ZHT16CCDC, ZHT16DBT, ZHT16HKSCS, ZHT16MSWIN950, ZHT32EUC, ZHT32SOPS, ZHT32TRIS
    #
    # @return [String]
    attr_accessor :character_set

    # The national character set for the autonomous database.  The default is AL16UTF16. Allowed values are:
    # AL16UTF16 or UTF8.
    #
    # @return [String]
    attr_accessor :ncharacter_set

    # Indicates if this is an Always Free resource. The default value is false. Note that Always Free Autonomous Databases have 1 CPU and 20GB of memory. For Always Free databases, memory and CPU cannot be scaled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_free_tier

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # The date and time the Always Free database will be stopped because of inactivity. If this time is reached without any database activity, the database will automatically be put into the STOPPED state.
    #
    # @return [DateTime]
    attr_accessor :time_reclamation_of_free_autonomous_database

    # The date and time the Always Free database will be automatically deleted because of inactivity. If the database is in the STOPPED state and without activity until this time, it will be deleted.
    #
    # @return [DateTime]
    attr_accessor :time_deletion_of_free_autonomous_database

    # @return [OCI::Database::Models::AutonomousDatabaseBackupConfig]
    attr_accessor :backup_config

    # Key History Entry.
    # @return [Array<OCI::Database::Models::AutonomousDatabaseKeyHistoryEntry>]
    attr_accessor :key_history_entry

    # **[Required]** The number of OCPU cores to be made available to the database. For Autonomous Databases on dedicated Exadata infrastructure, the maximum number of cores is determined by the infrastructure shape. See [Characteristics of Infrastructure Shapes](https://www.oracle.com/pls/topic/lookup?ctx=en/cloud/paas/autonomous-database&id=ATPFG-GUID-B0F033C1-CC5A-42F0-B2E7-3CECFEDA1FD1) for shape details.
    #
    # **Note:** This parameter cannot be used with the `ocpuCount` parameter.
    #
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The number of OCPU cores to be made available to the database.
    #
    # The following points apply:
    # - For Autonomous Databases on dedicated Exadata infrastructure, to provision less than 1 core, enter a fractional value in an increment of 0.1. For example, you can provision 0.3 or 0.4 cores, but not 0.35 cores. (Note that fractional OCPU values are not supported for Autonomous Databasese on shared Exadata infrastructure.)
    # - To provision 1 or more cores, you must enter an integer between 1 and the maximum number of cores available for the infrastructure shape. For example, you can provision 2 cores or 3 cores, but not 2.5 cores. This applies to Autonomous Databases on both shared and dedicated Exadata infrastructure.
    #
    # For Autonomous Databases on dedicated Exadata infrastructure, the maximum number of cores is determined by the infrastructure shape. See [Characteristics of Infrastructure Shapes](https://www.oracle.com/pls/topic/lookup?ctx=en/cloud/paas/autonomous-database&id=ATPFG-GUID-B0F033C1-CC5A-42F0-B2E7-3CECFEDA1FD1) for shape details.
    #
    # **Note:** This parameter cannot be used with the `cpuCoreCount` parameter.
    #
    # @return [Float]
    attr_accessor :ocpu_count

    # An array of CPU values that an Autonomous Database can be scaled to.
    # @return [Array<Float>]
    attr_accessor :provisionable_cpus

    # **[Required]** The quantity of data in the database, in terabytes.
    # @return [Integer]
    attr_accessor :data_storage_size_in_tbs

    # The amount of memory (in GBs) enabled per each OCPU core in Autonomous VM Cluster.
    # @return [Integer]
    attr_accessor :memory_per_oracle_compute_unit_in_gbs

    # The quantity of data in the database, in gigabytes.
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # The infrastructure type this resource belongs to.
    # @return [String]
    attr_reader :infrastructure_type

    # True if the database uses [dedicated Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html).
    #
    # @return [BOOLEAN]
    attr_accessor :is_dedicated

    # The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :autonomous_container_database_id

    # The date and time the Autonomous Database was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The user-friendly name for the Autonomous Database. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The URL of the Service Console for the Autonomous Database.
    # @return [String]
    attr_accessor :service_console_url

    # The connection string used to connect to the Autonomous Database. The username for the Service Console is ADMIN. Use the password you entered when creating the Autonomous Database for the password value.
    # @return [OCI::Database::Models::AutonomousDatabaseConnectionStrings]
    attr_accessor :connection_strings

    # @return [OCI::Database::Models::AutonomousDatabaseConnectionUrls]
    attr_accessor :connection_urls

    # The Oracle license model that applies to the Oracle Autonomous Database. Bring your own license (BYOL) allows you to apply your current on-premises Oracle software licenses to equivalent, highly automated Oracle PaaS and IaaS services in the cloud.
    # License Included allows you to subscribe to new Oracle Database software licenses and the Database service.
    # Note that when provisioning an Autonomous Database on [dedicated Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), this attribute must be null because the attribute is already set at the
    # Autonomous Exadata Infrastructure level. When using [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), if a value is not specified, the system will supply the value of `BRING_YOUR_OWN_LICENSE`.
    #
    # @return [String]
    attr_reader :license_model

    # The amount of storage that has been used, in terabytes.
    # @return [Integer]
    attr_accessor :used_data_storage_size_in_tbs

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

    # The list of [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) for the network security groups (NSGs) to which this resource belongs. Setting this to an empty list removes all resources from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    # **NsgIds restrictions:**
    # - A network security group (NSG) is optional for Autonomous Databases with private access. The nsgIds list can be empty.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The private endpoint for the resource.
    # @return [String]
    attr_accessor :private_endpoint

    # The private endpoint label for the resource. Setting this to an empty string, after the private endpoint database gets created, will change the same private endpoint database to the public endpoint database.
    # @return [String]
    attr_accessor :private_endpoint_label

    # The private endpoint Ip address for the resource.
    # @return [String]
    attr_accessor :private_endpoint_ip

    # A valid Oracle Database version for Autonomous Database.
    # @return [String]
    attr_accessor :db_version

    # Indicates if the Autonomous Database version is a preview version.
    # @return [BOOLEAN]
    attr_accessor :is_preview

    # The Autonomous Database workload type. The following values are valid:
    #
    # - OLTP - indicates an Autonomous Transaction Processing database
    # - DW - indicates an Autonomous Data Warehouse database
    # - AJD - indicates an Autonomous JSON Database
    # - APEX - indicates an Autonomous Database with the Oracle APEX Application Development workload type.
    #
    # @return [String]
    attr_reader :db_workload

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

    # The client IP access control list (ACL). This feature is available for autonomous databases on [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html) and on Exadata Cloud@Customer.
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

    # This field will be null if the Autonomous Database is not Data Guard enabled or Access Control is disabled.
    # It's value would be `TRUE` if Autonomous Database is Data Guard enabled and Access Control is enabled and if the Autonomous Database uses primary IP access control list (ACL) for standby.
    # It's value would be `FALSE` if Autonomous Database is Data Guard enabled and Access Control is enabled and if the Autonomous Database uses different IP access control list (ACL) for standby compared to primary.
    #
    # @return [BOOLEAN]
    attr_accessor :are_primary_whitelisted_ips_used

    # The client IP access control list (ACL). This feature is available for autonomous databases on [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html) and on Exadata Cloud@Customer.
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
    attr_accessor :standby_whitelisted_ips

    # Information about Oracle APEX Application Development.
    # @return [OCI::Database::Models::AutonomousDatabaseApex]
    attr_accessor :apex_details

    # Indicates if auto scaling is enabled for the Autonomous Database CPU core count.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # Status of the Data Safe registration for this Autonomous Database.
    # @return [String]
    attr_reader :data_safe_status

    # Status of Operations Insights for this Autonomous Database.
    # @return [String]
    attr_reader :operations_insights_status

    # Status of Database Management for this Autonomous Database.
    # @return [String]
    attr_reader :database_management_status

    # The date and time when maintenance will begin.
    # @return [DateTime]
    attr_accessor :time_maintenance_begin

    # The date and time when maintenance will end.
    # @return [DateTime]
    attr_accessor :time_maintenance_end

    # Indicates whether the Autonomous Database is a refreshable clone.
    # @return [BOOLEAN]
    attr_accessor :is_refreshable_clone

    # The date and time when last refresh happened.
    # @return [DateTime]
    attr_accessor :time_of_last_refresh

    # The refresh point timestamp (UTC). The refresh point is the time to which the database was most recently refreshed. Data created after the refresh point is not included in the refresh.
    # @return [DateTime]
    attr_accessor :time_of_last_refresh_point

    # The date and time of next refresh.
    # @return [DateTime]
    attr_accessor :time_of_next_refresh

    # The `DATABASE OPEN` mode. You can open the database in `READ_ONLY` or `READ_WRITE` mode.
    # @return [String]
    attr_reader :open_mode

    # The refresh status of the clone. REFRESHING indicates that the clone is currently being refreshed with data from the source Autonomous Database.
    # @return [String]
    attr_reader :refreshable_status

    # The refresh mode of the clone. AUTOMATIC indicates that the clone is automatically being refreshed with data from the source Autonomous Database.
    # @return [String]
    attr_reader :refreshable_mode

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the source Autonomous Database that was cloned to create the current Autonomous Database.
    # @return [String]
    attr_accessor :source_id

    # The Autonomous Database permission level. Restricted mode allows access only to admin users.
    # @return [String]
    attr_reader :permission_level

    # The timestamp of the last switchover operation for the Autonomous Database.
    # @return [DateTime]
    attr_accessor :time_of_last_switchover

    # The timestamp of the last failover operation.
    # @return [DateTime]
    attr_accessor :time_of_last_failover

    # **Deprecated.** Indicates whether the Autonomous Database has local (in-region) Data Guard enabled. Not applicable to cross-region Autonomous Data Guard associations, or to Autonomous Databases using dedicated Exadata infrastructure or Exadata Cloud@Customer infrastructure.
    #
    # @return [BOOLEAN]
    attr_accessor :is_data_guard_enabled

    # Indicates the number of seconds of data loss for a Data Guard failover.
    # @return [Integer]
    attr_accessor :failed_data_recovery_in_seconds

    # **Deprecated** Autonomous Data Guard standby database details.
    #
    # @return [OCI::Database::Models::AutonomousDatabaseStandbySummary]
    attr_accessor :standby_db

    # Indicates whether the Autonomous Database has local (in-region) Data Guard enabled. Not applicable to cross-region Autonomous Data Guard associations, or to Autonomous Databases using dedicated Exadata infrastructure or Exadata Cloud@Customer infrastructure.
    # @return [BOOLEAN]
    attr_accessor :is_local_data_guard_enabled

    # Indicates whether the Autonomous Database has Cross Region Data Guard enabled. Not applicable to Autonomous Databases using dedicated Exadata infrastructure or Exadata Cloud@Customer infrastructure.
    # @return [BOOLEAN]
    attr_accessor :is_remote_data_guard_enabled

    # @return [OCI::Database::Models::AutonomousDatabaseStandbySummary]
    attr_accessor :local_standby_db

    # The Data Guard role of the Autonomous Container Database or Autonomous Database, if Autonomous Data Guard is enabled.
    #
    # @return [String]
    attr_reader :role

    # List of Oracle Database versions available for a database upgrade. If there are no version upgrades available, this list is empty.
    # @return [Array<String>]
    attr_accessor :available_upgrade_versions

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @return [String]
    attr_accessor :key_store_id

    # The wallet name for Oracle Key Vault.
    # @return [String]
    attr_accessor :key_store_wallet_name

    # The list of regions that support the creation of an Autonomous Database clone or an Autonomous Data Guard standby database.
    #
    # @return [Array<String>]
    attr_accessor :supported_regions_to_clone_to

    # Customer Contacts.
    # @return [Array<OCI::Database::Models::CustomerContact>]
    attr_accessor :customer_contacts

    # The date and time that Autonomous Data Guard was enabled for an Autonomous Database where the standby was provisioned in the same region as the primary database.
    # @return [DateTime]
    attr_accessor :time_local_data_guard_enabled

    # The Autonomous Data Guard region type of the Autonomous Database. For Autonomous Databases on shared Exadata infrastructure, Data Guard associations have designated primary and standby regions, and these region types do not change when the database changes roles. The standby regions in Data Guard associations can be the same region designated as the primary region, or they can be remote regions. Certain database administrative operations may be available only in the primary region of the Data Guard association, and cannot be performed when the database using the \"primary\" role is operating in a remote Data Guard standby region.
    # @return [String]
    attr_reader :dataguard_region_type

    # The date and time the Autonomous Data Guard role was switched for the Autonomous Database. For databases that have standbys in both the primary Data Guard region and a remote Data Guard standby region, this is the latest timestamp of either the database using the \"primary\" role in the primary Data Guard region, or database located in the remote Data Guard standby region.
    # @return [DateTime]
    attr_accessor :time_data_guard_role_changed

    # The list of [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of standby databases located in Autonomous Data Guard remote regions that are associated with the source database. Note that for shared Exadata infrastructure, standby databases located in the same region as the source primary database do not have OCIDs.
    # @return [Array<String>]
    attr_accessor :peer_db_ids

    # Indicates whether the Autonomous Database requires mTLS connections.
    # @return [BOOLEAN]
    attr_accessor :is_mtls_connection_required

    # Indicates if the refreshable clone can be reconnected to its source database.
    # @return [BOOLEAN]
    attr_accessor :is_reconnect_clone_enabled

    # The time and date as an RFC3339 formatted string, e.g., 2022-01-01T12:00:00.000Z, to set the limit for a refreshable clone to be reconnected to its source database.
    # @return [DateTime]
    attr_accessor :time_until_reconnect_clone_enabled

    # The maintenance schedule type of the Autonomous Database on shared Exadata infrastructure. The EARLY maintenance schedule of this Autonomous Database
    # follows a schedule that applies patches prior to the REGULAR schedule.The REGULAR maintenance schedule of this Autonomous Database follows the normal cycle.
    #
    # @return [String]
    attr_reader :autonomous_maintenance_schedule_type

    # list of scheduled operations
    # @return [Array<OCI::Database::Models::ScheduledOperationDetails>]
    attr_accessor :scheduled_operations

    # Indicates if auto scaling is enabled for the Autonomous Database storage. The default value is `FALSE`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_for_storage_enabled

    # The amount of storage currently allocated for the database tables and billed for, rounded up. When auto-scaling is not enabled, this value is equal to the `dataStorageSizeInTBs` value. You can compare this value to the `actualUsedDataStorageSizeInTBs` value to determine if a manual shrink operation is appropriate for your allocated storage.
    #
    # **Note:** Auto-scaling does not automatically decrease allocated storage when data is deleted from the database.
    #
    # @return [Float]
    attr_accessor :allocated_storage_size_in_tbs

    # The current amount of storage in use for user and system data, in terabytes (TB).
    #
    # @return [Float]
    attr_accessor :actual_used_data_storage_size_in_tbs

    # The number of Max OCPU cores to be made available to the autonomous database with auto scaling of cpu enabled.
    #
    # @return [Integer]
    attr_accessor :max_cpu_core_count

    # The Oracle Database Edition that applies to the Autonomous databases.
    #
    # @return [String]
    attr_reader :database_edition

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'kms_key_id': :'kmsKeyId',
        'vault_id': :'vaultId',
        'kms_key_lifecycle_details': :'kmsKeyLifecycleDetails',
        'kms_key_version_id': :'kmsKeyVersionId',
        'db_name': :'dbName',
        'character_set': :'characterSet',
        'ncharacter_set': :'ncharacterSet',
        'is_free_tier': :'isFreeTier',
        'system_tags': :'systemTags',
        'time_reclamation_of_free_autonomous_database': :'timeReclamationOfFreeAutonomousDatabase',
        'time_deletion_of_free_autonomous_database': :'timeDeletionOfFreeAutonomousDatabase',
        'backup_config': :'backupConfig',
        'key_history_entry': :'keyHistoryEntry',
        'cpu_core_count': :'cpuCoreCount',
        'ocpu_count': :'ocpuCount',
        'provisionable_cpus': :'provisionableCpus',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'memory_per_oracle_compute_unit_in_gbs': :'memoryPerOracleComputeUnitInGBs',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'infrastructure_type': :'infrastructureType',
        'is_dedicated': :'isDedicated',
        'autonomous_container_database_id': :'autonomousContainerDatabaseId',
        'time_created': :'timeCreated',
        'display_name': :'displayName',
        'service_console_url': :'serviceConsoleUrl',
        'connection_strings': :'connectionStrings',
        'connection_urls': :'connectionUrls',
        'license_model': :'licenseModel',
        'used_data_storage_size_in_tbs': :'usedDataStorageSizeInTBs',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'subnet_id': :'subnetId',
        'nsg_ids': :'nsgIds',
        'private_endpoint': :'privateEndpoint',
        'private_endpoint_label': :'privateEndpointLabel',
        'private_endpoint_ip': :'privateEndpointIp',
        'db_version': :'dbVersion',
        'is_preview': :'isPreview',
        'db_workload': :'dbWorkload',
        'is_access_control_enabled': :'isAccessControlEnabled',
        'whitelisted_ips': :'whitelistedIps',
        'are_primary_whitelisted_ips_used': :'arePrimaryWhitelistedIpsUsed',
        'standby_whitelisted_ips': :'standbyWhitelistedIps',
        'apex_details': :'apexDetails',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'data_safe_status': :'dataSafeStatus',
        'operations_insights_status': :'operationsInsightsStatus',
        'database_management_status': :'databaseManagementStatus',
        'time_maintenance_begin': :'timeMaintenanceBegin',
        'time_maintenance_end': :'timeMaintenanceEnd',
        'is_refreshable_clone': :'isRefreshableClone',
        'time_of_last_refresh': :'timeOfLastRefresh',
        'time_of_last_refresh_point': :'timeOfLastRefreshPoint',
        'time_of_next_refresh': :'timeOfNextRefresh',
        'open_mode': :'openMode',
        'refreshable_status': :'refreshableStatus',
        'refreshable_mode': :'refreshableMode',
        'source_id': :'sourceId',
        'permission_level': :'permissionLevel',
        'time_of_last_switchover': :'timeOfLastSwitchover',
        'time_of_last_failover': :'timeOfLastFailover',
        'is_data_guard_enabled': :'isDataGuardEnabled',
        'failed_data_recovery_in_seconds': :'failedDataRecoveryInSeconds',
        'standby_db': :'standbyDb',
        'is_local_data_guard_enabled': :'isLocalDataGuardEnabled',
        'is_remote_data_guard_enabled': :'isRemoteDataGuardEnabled',
        'local_standby_db': :'localStandbyDb',
        'role': :'role',
        'available_upgrade_versions': :'availableUpgradeVersions',
        'key_store_id': :'keyStoreId',
        'key_store_wallet_name': :'keyStoreWalletName',
        'supported_regions_to_clone_to': :'supportedRegionsToCloneTo',
        'customer_contacts': :'customerContacts',
        'time_local_data_guard_enabled': :'timeLocalDataGuardEnabled',
        'dataguard_region_type': :'dataguardRegionType',
        'time_data_guard_role_changed': :'timeDataGuardRoleChanged',
        'peer_db_ids': :'peerDbIds',
        'is_mtls_connection_required': :'isMtlsConnectionRequired',
        'is_reconnect_clone_enabled': :'isReconnectCloneEnabled',
        'time_until_reconnect_clone_enabled': :'timeUntilReconnectCloneEnabled',
        'autonomous_maintenance_schedule_type': :'autonomousMaintenanceScheduleType',
        'scheduled_operations': :'scheduledOperations',
        'is_auto_scaling_for_storage_enabled': :'isAutoScalingForStorageEnabled',
        'allocated_storage_size_in_tbs': :'allocatedStorageSizeInTBs',
        'actual_used_data_storage_size_in_tbs': :'actualUsedDataStorageSizeInTBs',
        'max_cpu_core_count': :'maxCpuCoreCount',
        'database_edition': :'databaseEdition'
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
        'lifecycle_details': :'String',
        'kms_key_id': :'String',
        'vault_id': :'String',
        'kms_key_lifecycle_details': :'String',
        'kms_key_version_id': :'String',
        'db_name': :'String',
        'character_set': :'String',
        'ncharacter_set': :'String',
        'is_free_tier': :'BOOLEAN',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'time_reclamation_of_free_autonomous_database': :'DateTime',
        'time_deletion_of_free_autonomous_database': :'DateTime',
        'backup_config': :'OCI::Database::Models::AutonomousDatabaseBackupConfig',
        'key_history_entry': :'Array<OCI::Database::Models::AutonomousDatabaseKeyHistoryEntry>',
        'cpu_core_count': :'Integer',
        'ocpu_count': :'Float',
        'provisionable_cpus': :'Array<Float>',
        'data_storage_size_in_tbs': :'Integer',
        'memory_per_oracle_compute_unit_in_gbs': :'Integer',
        'data_storage_size_in_gbs': :'Integer',
        'infrastructure_type': :'String',
        'is_dedicated': :'BOOLEAN',
        'autonomous_container_database_id': :'String',
        'time_created': :'DateTime',
        'display_name': :'String',
        'service_console_url': :'String',
        'connection_strings': :'OCI::Database::Models::AutonomousDatabaseConnectionStrings',
        'connection_urls': :'OCI::Database::Models::AutonomousDatabaseConnectionUrls',
        'license_model': :'String',
        'used_data_storage_size_in_tbs': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'private_endpoint': :'String',
        'private_endpoint_label': :'String',
        'private_endpoint_ip': :'String',
        'db_version': :'String',
        'is_preview': :'BOOLEAN',
        'db_workload': :'String',
        'is_access_control_enabled': :'BOOLEAN',
        'whitelisted_ips': :'Array<String>',
        'are_primary_whitelisted_ips_used': :'BOOLEAN',
        'standby_whitelisted_ips': :'Array<String>',
        'apex_details': :'OCI::Database::Models::AutonomousDatabaseApex',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'data_safe_status': :'String',
        'operations_insights_status': :'String',
        'database_management_status': :'String',
        'time_maintenance_begin': :'DateTime',
        'time_maintenance_end': :'DateTime',
        'is_refreshable_clone': :'BOOLEAN',
        'time_of_last_refresh': :'DateTime',
        'time_of_last_refresh_point': :'DateTime',
        'time_of_next_refresh': :'DateTime',
        'open_mode': :'String',
        'refreshable_status': :'String',
        'refreshable_mode': :'String',
        'source_id': :'String',
        'permission_level': :'String',
        'time_of_last_switchover': :'DateTime',
        'time_of_last_failover': :'DateTime',
        'is_data_guard_enabled': :'BOOLEAN',
        'failed_data_recovery_in_seconds': :'Integer',
        'standby_db': :'OCI::Database::Models::AutonomousDatabaseStandbySummary',
        'is_local_data_guard_enabled': :'BOOLEAN',
        'is_remote_data_guard_enabled': :'BOOLEAN',
        'local_standby_db': :'OCI::Database::Models::AutonomousDatabaseStandbySummary',
        'role': :'String',
        'available_upgrade_versions': :'Array<String>',
        'key_store_id': :'String',
        'key_store_wallet_name': :'String',
        'supported_regions_to_clone_to': :'Array<String>',
        'customer_contacts': :'Array<OCI::Database::Models::CustomerContact>',
        'time_local_data_guard_enabled': :'DateTime',
        'dataguard_region_type': :'String',
        'time_data_guard_role_changed': :'DateTime',
        'peer_db_ids': :'Array<String>',
        'is_mtls_connection_required': :'BOOLEAN',
        'is_reconnect_clone_enabled': :'BOOLEAN',
        'time_until_reconnect_clone_enabled': :'DateTime',
        'autonomous_maintenance_schedule_type': :'String',
        'scheduled_operations': :'Array<OCI::Database::Models::ScheduledOperationDetails>',
        'is_auto_scaling_for_storage_enabled': :'BOOLEAN',
        'allocated_storage_size_in_tbs': :'Float',
        'actual_used_data_storage_size_in_tbs': :'Float',
        'max_cpu_core_count': :'Integer',
        'database_edition': :'String'
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
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :kms_key_lifecycle_details The value to assign to the {#kms_key_lifecycle_details} property
    # @option attributes [String] :kms_key_version_id The value to assign to the {#kms_key_version_id} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [String] :character_set The value to assign to the {#character_set} property
    # @option attributes [String] :ncharacter_set The value to assign to the {#ncharacter_set} property
    # @option attributes [BOOLEAN] :is_free_tier The value to assign to the {#is_free_tier} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [DateTime] :time_reclamation_of_free_autonomous_database The value to assign to the {#time_reclamation_of_free_autonomous_database} property
    # @option attributes [DateTime] :time_deletion_of_free_autonomous_database The value to assign to the {#time_deletion_of_free_autonomous_database} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseBackupConfig] :backup_config The value to assign to the {#backup_config} property
    # @option attributes [Array<OCI::Database::Models::AutonomousDatabaseKeyHistoryEntry>] :key_history_entry The value to assign to the {#key_history_entry} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Float] :ocpu_count The value to assign to the {#ocpu_count} property
    # @option attributes [Array<Float>] :provisionable_cpus The value to assign to the {#provisionable_cpus} property
    # @option attributes [Integer] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [Integer] :memory_per_oracle_compute_unit_in_gbs The value to assign to the {#memory_per_oracle_compute_unit_in_gbs} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [String] :infrastructure_type The value to assign to the {#infrastructure_type} property
    # @option attributes [BOOLEAN] :is_dedicated The value to assign to the {#is_dedicated} property
    # @option attributes [String] :autonomous_container_database_id The value to assign to the {#autonomous_container_database_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :service_console_url The value to assign to the {#service_console_url} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseConnectionStrings] :connection_strings The value to assign to the {#connection_strings} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseConnectionUrls] :connection_urls The value to assign to the {#connection_urls} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Integer] :used_data_storage_size_in_tbs The value to assign to the {#used_data_storage_size_in_tbs} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :private_endpoint The value to assign to the {#private_endpoint} property
    # @option attributes [String] :private_endpoint_label The value to assign to the {#private_endpoint_label} property
    # @option attributes [String] :private_endpoint_ip The value to assign to the {#private_endpoint_ip} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [BOOLEAN] :is_preview The value to assign to the {#is_preview} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [BOOLEAN] :is_access_control_enabled The value to assign to the {#is_access_control_enabled} property
    # @option attributes [Array<String>] :whitelisted_ips The value to assign to the {#whitelisted_ips} property
    # @option attributes [BOOLEAN] :are_primary_whitelisted_ips_used The value to assign to the {#are_primary_whitelisted_ips_used} property
    # @option attributes [Array<String>] :standby_whitelisted_ips The value to assign to the {#standby_whitelisted_ips} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseApex] :apex_details The value to assign to the {#apex_details} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [String] :data_safe_status The value to assign to the {#data_safe_status} property
    # @option attributes [String] :operations_insights_status The value to assign to the {#operations_insights_status} property
    # @option attributes [String] :database_management_status The value to assign to the {#database_management_status} property
    # @option attributes [DateTime] :time_maintenance_begin The value to assign to the {#time_maintenance_begin} property
    # @option attributes [DateTime] :time_maintenance_end The value to assign to the {#time_maintenance_end} property
    # @option attributes [BOOLEAN] :is_refreshable_clone The value to assign to the {#is_refreshable_clone} property
    # @option attributes [DateTime] :time_of_last_refresh The value to assign to the {#time_of_last_refresh} property
    # @option attributes [DateTime] :time_of_last_refresh_point The value to assign to the {#time_of_last_refresh_point} property
    # @option attributes [DateTime] :time_of_next_refresh The value to assign to the {#time_of_next_refresh} property
    # @option attributes [String] :open_mode The value to assign to the {#open_mode} property
    # @option attributes [String] :refreshable_status The value to assign to the {#refreshable_status} property
    # @option attributes [String] :refreshable_mode The value to assign to the {#refreshable_mode} property
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :permission_level The value to assign to the {#permission_level} property
    # @option attributes [DateTime] :time_of_last_switchover The value to assign to the {#time_of_last_switchover} property
    # @option attributes [DateTime] :time_of_last_failover The value to assign to the {#time_of_last_failover} property
    # @option attributes [BOOLEAN] :is_data_guard_enabled The value to assign to the {#is_data_guard_enabled} property
    # @option attributes [Integer] :failed_data_recovery_in_seconds The value to assign to the {#failed_data_recovery_in_seconds} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseStandbySummary] :standby_db The value to assign to the {#standby_db} property
    # @option attributes [BOOLEAN] :is_local_data_guard_enabled The value to assign to the {#is_local_data_guard_enabled} property
    # @option attributes [BOOLEAN] :is_remote_data_guard_enabled The value to assign to the {#is_remote_data_guard_enabled} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseStandbySummary] :local_standby_db The value to assign to the {#local_standby_db} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [Array<String>] :available_upgrade_versions The value to assign to the {#available_upgrade_versions} property
    # @option attributes [String] :key_store_id The value to assign to the {#key_store_id} property
    # @option attributes [String] :key_store_wallet_name The value to assign to the {#key_store_wallet_name} property
    # @option attributes [Array<String>] :supported_regions_to_clone_to The value to assign to the {#supported_regions_to_clone_to} property
    # @option attributes [Array<OCI::Database::Models::CustomerContact>] :customer_contacts The value to assign to the {#customer_contacts} property
    # @option attributes [DateTime] :time_local_data_guard_enabled The value to assign to the {#time_local_data_guard_enabled} property
    # @option attributes [String] :dataguard_region_type The value to assign to the {#dataguard_region_type} property
    # @option attributes [DateTime] :time_data_guard_role_changed The value to assign to the {#time_data_guard_role_changed} property
    # @option attributes [Array<String>] :peer_db_ids The value to assign to the {#peer_db_ids} property
    # @option attributes [BOOLEAN] :is_mtls_connection_required The value to assign to the {#is_mtls_connection_required} property
    # @option attributes [BOOLEAN] :is_reconnect_clone_enabled The value to assign to the {#is_reconnect_clone_enabled} property
    # @option attributes [DateTime] :time_until_reconnect_clone_enabled The value to assign to the {#time_until_reconnect_clone_enabled} property
    # @option attributes [String] :autonomous_maintenance_schedule_type The value to assign to the {#autonomous_maintenance_schedule_type} property
    # @option attributes [Array<OCI::Database::Models::ScheduledOperationDetails>] :scheduled_operations The value to assign to the {#scheduled_operations} property
    # @option attributes [BOOLEAN] :is_auto_scaling_for_storage_enabled The value to assign to the {#is_auto_scaling_for_storage_enabled} property
    # @option attributes [Float] :allocated_storage_size_in_tbs The value to assign to the {#allocated_storage_size_in_tbs} property
    # @option attributes [Float] :actual_used_data_storage_size_in_tbs The value to assign to the {#actual_used_data_storage_size_in_tbs} property
    # @option attributes [Integer] :max_cpu_core_count The value to assign to the {#max_cpu_core_count} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.kms_key_lifecycle_details = attributes[:'kmsKeyLifecycleDetails'] if attributes[:'kmsKeyLifecycleDetails']

      raise 'You cannot provide both :kmsKeyLifecycleDetails and :kms_key_lifecycle_details' if attributes.key?(:'kmsKeyLifecycleDetails') && attributes.key?(:'kms_key_lifecycle_details')

      self.kms_key_lifecycle_details = attributes[:'kms_key_lifecycle_details'] if attributes[:'kms_key_lifecycle_details']

      self.kms_key_version_id = attributes[:'kmsKeyVersionId'] if attributes[:'kmsKeyVersionId']

      raise 'You cannot provide both :kmsKeyVersionId and :kms_key_version_id' if attributes.key?(:'kmsKeyVersionId') && attributes.key?(:'kms_key_version_id')

      self.kms_key_version_id = attributes[:'kms_key_version_id'] if attributes[:'kms_key_version_id']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.character_set = attributes[:'characterSet'] if attributes[:'characterSet']

      raise 'You cannot provide both :characterSet and :character_set' if attributes.key?(:'characterSet') && attributes.key?(:'character_set')

      self.character_set = attributes[:'character_set'] if attributes[:'character_set']

      self.ncharacter_set = attributes[:'ncharacterSet'] if attributes[:'ncharacterSet']

      raise 'You cannot provide both :ncharacterSet and :ncharacter_set' if attributes.key?(:'ncharacterSet') && attributes.key?(:'ncharacter_set')

      self.ncharacter_set = attributes[:'ncharacter_set'] if attributes[:'ncharacter_set']

      self.is_free_tier = attributes[:'isFreeTier'] unless attributes[:'isFreeTier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isFreeTier and :is_free_tier' if attributes.key?(:'isFreeTier') && attributes.key?(:'is_free_tier')

      self.is_free_tier = attributes[:'is_free_tier'] unless attributes[:'is_free_tier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') && !attributes.key?(:'is_free_tier') # rubocop:disable Style/StringLiterals

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.time_reclamation_of_free_autonomous_database = attributes[:'timeReclamationOfFreeAutonomousDatabase'] if attributes[:'timeReclamationOfFreeAutonomousDatabase']

      raise 'You cannot provide both :timeReclamationOfFreeAutonomousDatabase and :time_reclamation_of_free_autonomous_database' if attributes.key?(:'timeReclamationOfFreeAutonomousDatabase') && attributes.key?(:'time_reclamation_of_free_autonomous_database')

      self.time_reclamation_of_free_autonomous_database = attributes[:'time_reclamation_of_free_autonomous_database'] if attributes[:'time_reclamation_of_free_autonomous_database']

      self.time_deletion_of_free_autonomous_database = attributes[:'timeDeletionOfFreeAutonomousDatabase'] if attributes[:'timeDeletionOfFreeAutonomousDatabase']

      raise 'You cannot provide both :timeDeletionOfFreeAutonomousDatabase and :time_deletion_of_free_autonomous_database' if attributes.key?(:'timeDeletionOfFreeAutonomousDatabase') && attributes.key?(:'time_deletion_of_free_autonomous_database')

      self.time_deletion_of_free_autonomous_database = attributes[:'time_deletion_of_free_autonomous_database'] if attributes[:'time_deletion_of_free_autonomous_database']

      self.backup_config = attributes[:'backupConfig'] if attributes[:'backupConfig']

      raise 'You cannot provide both :backupConfig and :backup_config' if attributes.key?(:'backupConfig') && attributes.key?(:'backup_config')

      self.backup_config = attributes[:'backup_config'] if attributes[:'backup_config']

      self.key_history_entry = attributes[:'keyHistoryEntry'] if attributes[:'keyHistoryEntry']

      raise 'You cannot provide both :keyHistoryEntry and :key_history_entry' if attributes.key?(:'keyHistoryEntry') && attributes.key?(:'key_history_entry')

      self.key_history_entry = attributes[:'key_history_entry'] if attributes[:'key_history_entry']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.ocpu_count = attributes[:'ocpuCount'] if attributes[:'ocpuCount']

      raise 'You cannot provide both :ocpuCount and :ocpu_count' if attributes.key?(:'ocpuCount') && attributes.key?(:'ocpu_count')

      self.ocpu_count = attributes[:'ocpu_count'] if attributes[:'ocpu_count']

      self.provisionable_cpus = attributes[:'provisionableCpus'] if attributes[:'provisionableCpus']

      raise 'You cannot provide both :provisionableCpus and :provisionable_cpus' if attributes.key?(:'provisionableCpus') && attributes.key?(:'provisionable_cpus')

      self.provisionable_cpus = attributes[:'provisionable_cpus'] if attributes[:'provisionable_cpus']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memoryPerOracleComputeUnitInGBs'] if attributes[:'memoryPerOracleComputeUnitInGBs']

      raise 'You cannot provide both :memoryPerOracleComputeUnitInGBs and :memory_per_oracle_compute_unit_in_gbs' if attributes.key?(:'memoryPerOracleComputeUnitInGBs') && attributes.key?(:'memory_per_oracle_compute_unit_in_gbs')

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memory_per_oracle_compute_unit_in_gbs'] if attributes[:'memory_per_oracle_compute_unit_in_gbs']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.infrastructure_type = attributes[:'infrastructureType'] if attributes[:'infrastructureType']

      raise 'You cannot provide both :infrastructureType and :infrastructure_type' if attributes.key?(:'infrastructureType') && attributes.key?(:'infrastructure_type')

      self.infrastructure_type = attributes[:'infrastructure_type'] if attributes[:'infrastructure_type']

      self.is_dedicated = attributes[:'isDedicated'] unless attributes[:'isDedicated'].nil?

      raise 'You cannot provide both :isDedicated and :is_dedicated' if attributes.key?(:'isDedicated') && attributes.key?(:'is_dedicated')

      self.is_dedicated = attributes[:'is_dedicated'] unless attributes[:'is_dedicated'].nil?

      self.autonomous_container_database_id = attributes[:'autonomousContainerDatabaseId'] if attributes[:'autonomousContainerDatabaseId']

      raise 'You cannot provide both :autonomousContainerDatabaseId and :autonomous_container_database_id' if attributes.key?(:'autonomousContainerDatabaseId') && attributes.key?(:'autonomous_container_database_id')

      self.autonomous_container_database_id = attributes[:'autonomous_container_database_id'] if attributes[:'autonomous_container_database_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.service_console_url = attributes[:'serviceConsoleUrl'] if attributes[:'serviceConsoleUrl']

      raise 'You cannot provide both :serviceConsoleUrl and :service_console_url' if attributes.key?(:'serviceConsoleUrl') && attributes.key?(:'service_console_url')

      self.service_console_url = attributes[:'service_console_url'] if attributes[:'service_console_url']

      self.connection_strings = attributes[:'connectionStrings'] if attributes[:'connectionStrings']

      raise 'You cannot provide both :connectionStrings and :connection_strings' if attributes.key?(:'connectionStrings') && attributes.key?(:'connection_strings')

      self.connection_strings = attributes[:'connection_strings'] if attributes[:'connection_strings']

      self.connection_urls = attributes[:'connectionUrls'] if attributes[:'connectionUrls']

      raise 'You cannot provide both :connectionUrls and :connection_urls' if attributes.key?(:'connectionUrls') && attributes.key?(:'connection_urls')

      self.connection_urls = attributes[:'connection_urls'] if attributes[:'connection_urls']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.used_data_storage_size_in_tbs = attributes[:'usedDataStorageSizeInTBs'] if attributes[:'usedDataStorageSizeInTBs']

      raise 'You cannot provide both :usedDataStorageSizeInTBs and :used_data_storage_size_in_tbs' if attributes.key?(:'usedDataStorageSizeInTBs') && attributes.key?(:'used_data_storage_size_in_tbs')

      self.used_data_storage_size_in_tbs = attributes[:'used_data_storage_size_in_tbs'] if attributes[:'used_data_storage_size_in_tbs']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.private_endpoint = attributes[:'privateEndpoint'] if attributes[:'privateEndpoint']

      raise 'You cannot provide both :privateEndpoint and :private_endpoint' if attributes.key?(:'privateEndpoint') && attributes.key?(:'private_endpoint')

      self.private_endpoint = attributes[:'private_endpoint'] if attributes[:'private_endpoint']

      self.private_endpoint_label = attributes[:'privateEndpointLabel'] if attributes[:'privateEndpointLabel']

      raise 'You cannot provide both :privateEndpointLabel and :private_endpoint_label' if attributes.key?(:'privateEndpointLabel') && attributes.key?(:'private_endpoint_label')

      self.private_endpoint_label = attributes[:'private_endpoint_label'] if attributes[:'private_endpoint_label']

      self.private_endpoint_ip = attributes[:'privateEndpointIp'] if attributes[:'privateEndpointIp']

      raise 'You cannot provide both :privateEndpointIp and :private_endpoint_ip' if attributes.key?(:'privateEndpointIp') && attributes.key?(:'private_endpoint_ip')

      self.private_endpoint_ip = attributes[:'private_endpoint_ip'] if attributes[:'private_endpoint_ip']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.is_preview = attributes[:'isPreview'] unless attributes[:'isPreview'].nil?

      raise 'You cannot provide both :isPreview and :is_preview' if attributes.key?(:'isPreview') && attributes.key?(:'is_preview')

      self.is_preview = attributes[:'is_preview'] unless attributes[:'is_preview'].nil?

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.is_access_control_enabled = attributes[:'isAccessControlEnabled'] unless attributes[:'isAccessControlEnabled'].nil?

      raise 'You cannot provide both :isAccessControlEnabled and :is_access_control_enabled' if attributes.key?(:'isAccessControlEnabled') && attributes.key?(:'is_access_control_enabled')

      self.is_access_control_enabled = attributes[:'is_access_control_enabled'] unless attributes[:'is_access_control_enabled'].nil?

      self.whitelisted_ips = attributes[:'whitelistedIps'] if attributes[:'whitelistedIps']

      raise 'You cannot provide both :whitelistedIps and :whitelisted_ips' if attributes.key?(:'whitelistedIps') && attributes.key?(:'whitelisted_ips')

      self.whitelisted_ips = attributes[:'whitelisted_ips'] if attributes[:'whitelisted_ips']

      self.are_primary_whitelisted_ips_used = attributes[:'arePrimaryWhitelistedIpsUsed'] unless attributes[:'arePrimaryWhitelistedIpsUsed'].nil?

      raise 'You cannot provide both :arePrimaryWhitelistedIpsUsed and :are_primary_whitelisted_ips_used' if attributes.key?(:'arePrimaryWhitelistedIpsUsed') && attributes.key?(:'are_primary_whitelisted_ips_used')

      self.are_primary_whitelisted_ips_used = attributes[:'are_primary_whitelisted_ips_used'] unless attributes[:'are_primary_whitelisted_ips_used'].nil?

      self.standby_whitelisted_ips = attributes[:'standbyWhitelistedIps'] if attributes[:'standbyWhitelistedIps']

      raise 'You cannot provide both :standbyWhitelistedIps and :standby_whitelisted_ips' if attributes.key?(:'standbyWhitelistedIps') && attributes.key?(:'standby_whitelisted_ips')

      self.standby_whitelisted_ips = attributes[:'standby_whitelisted_ips'] if attributes[:'standby_whitelisted_ips']

      self.apex_details = attributes[:'apexDetails'] if attributes[:'apexDetails']

      raise 'You cannot provide both :apexDetails and :apex_details' if attributes.key?(:'apexDetails') && attributes.key?(:'apex_details')

      self.apex_details = attributes[:'apex_details'] if attributes[:'apex_details']

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?

      self.data_safe_status = attributes[:'dataSafeStatus'] if attributes[:'dataSafeStatus']

      raise 'You cannot provide both :dataSafeStatus and :data_safe_status' if attributes.key?(:'dataSafeStatus') && attributes.key?(:'data_safe_status')

      self.data_safe_status = attributes[:'data_safe_status'] if attributes[:'data_safe_status']

      self.operations_insights_status = attributes[:'operationsInsightsStatus'] if attributes[:'operationsInsightsStatus']

      raise 'You cannot provide both :operationsInsightsStatus and :operations_insights_status' if attributes.key?(:'operationsInsightsStatus') && attributes.key?(:'operations_insights_status')

      self.operations_insights_status = attributes[:'operations_insights_status'] if attributes[:'operations_insights_status']

      self.database_management_status = attributes[:'databaseManagementStatus'] if attributes[:'databaseManagementStatus']

      raise 'You cannot provide both :databaseManagementStatus and :database_management_status' if attributes.key?(:'databaseManagementStatus') && attributes.key?(:'database_management_status')

      self.database_management_status = attributes[:'database_management_status'] if attributes[:'database_management_status']

      self.time_maintenance_begin = attributes[:'timeMaintenanceBegin'] if attributes[:'timeMaintenanceBegin']

      raise 'You cannot provide both :timeMaintenanceBegin and :time_maintenance_begin' if attributes.key?(:'timeMaintenanceBegin') && attributes.key?(:'time_maintenance_begin')

      self.time_maintenance_begin = attributes[:'time_maintenance_begin'] if attributes[:'time_maintenance_begin']

      self.time_maintenance_end = attributes[:'timeMaintenanceEnd'] if attributes[:'timeMaintenanceEnd']

      raise 'You cannot provide both :timeMaintenanceEnd and :time_maintenance_end' if attributes.key?(:'timeMaintenanceEnd') && attributes.key?(:'time_maintenance_end')

      self.time_maintenance_end = attributes[:'time_maintenance_end'] if attributes[:'time_maintenance_end']

      self.is_refreshable_clone = attributes[:'isRefreshableClone'] unless attributes[:'isRefreshableClone'].nil?

      raise 'You cannot provide both :isRefreshableClone and :is_refreshable_clone' if attributes.key?(:'isRefreshableClone') && attributes.key?(:'is_refreshable_clone')

      self.is_refreshable_clone = attributes[:'is_refreshable_clone'] unless attributes[:'is_refreshable_clone'].nil?

      self.time_of_last_refresh = attributes[:'timeOfLastRefresh'] if attributes[:'timeOfLastRefresh']

      raise 'You cannot provide both :timeOfLastRefresh and :time_of_last_refresh' if attributes.key?(:'timeOfLastRefresh') && attributes.key?(:'time_of_last_refresh')

      self.time_of_last_refresh = attributes[:'time_of_last_refresh'] if attributes[:'time_of_last_refresh']

      self.time_of_last_refresh_point = attributes[:'timeOfLastRefreshPoint'] if attributes[:'timeOfLastRefreshPoint']

      raise 'You cannot provide both :timeOfLastRefreshPoint and :time_of_last_refresh_point' if attributes.key?(:'timeOfLastRefreshPoint') && attributes.key?(:'time_of_last_refresh_point')

      self.time_of_last_refresh_point = attributes[:'time_of_last_refresh_point'] if attributes[:'time_of_last_refresh_point']

      self.time_of_next_refresh = attributes[:'timeOfNextRefresh'] if attributes[:'timeOfNextRefresh']

      raise 'You cannot provide both :timeOfNextRefresh and :time_of_next_refresh' if attributes.key?(:'timeOfNextRefresh') && attributes.key?(:'time_of_next_refresh')

      self.time_of_next_refresh = attributes[:'time_of_next_refresh'] if attributes[:'time_of_next_refresh']

      self.open_mode = attributes[:'openMode'] if attributes[:'openMode']

      raise 'You cannot provide both :openMode and :open_mode' if attributes.key?(:'openMode') && attributes.key?(:'open_mode')

      self.open_mode = attributes[:'open_mode'] if attributes[:'open_mode']

      self.refreshable_status = attributes[:'refreshableStatus'] if attributes[:'refreshableStatus']

      raise 'You cannot provide both :refreshableStatus and :refreshable_status' if attributes.key?(:'refreshableStatus') && attributes.key?(:'refreshable_status')

      self.refreshable_status = attributes[:'refreshable_status'] if attributes[:'refreshable_status']

      self.refreshable_mode = attributes[:'refreshableMode'] if attributes[:'refreshableMode']

      raise 'You cannot provide both :refreshableMode and :refreshable_mode' if attributes.key?(:'refreshableMode') && attributes.key?(:'refreshable_mode')

      self.refreshable_mode = attributes[:'refreshable_mode'] if attributes[:'refreshable_mode']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.permission_level = attributes[:'permissionLevel'] if attributes[:'permissionLevel']

      raise 'You cannot provide both :permissionLevel and :permission_level' if attributes.key?(:'permissionLevel') && attributes.key?(:'permission_level')

      self.permission_level = attributes[:'permission_level'] if attributes[:'permission_level']

      self.time_of_last_switchover = attributes[:'timeOfLastSwitchover'] if attributes[:'timeOfLastSwitchover']

      raise 'You cannot provide both :timeOfLastSwitchover and :time_of_last_switchover' if attributes.key?(:'timeOfLastSwitchover') && attributes.key?(:'time_of_last_switchover')

      self.time_of_last_switchover = attributes[:'time_of_last_switchover'] if attributes[:'time_of_last_switchover']

      self.time_of_last_failover = attributes[:'timeOfLastFailover'] if attributes[:'timeOfLastFailover']

      raise 'You cannot provide both :timeOfLastFailover and :time_of_last_failover' if attributes.key?(:'timeOfLastFailover') && attributes.key?(:'time_of_last_failover')

      self.time_of_last_failover = attributes[:'time_of_last_failover'] if attributes[:'time_of_last_failover']

      self.is_data_guard_enabled = attributes[:'isDataGuardEnabled'] unless attributes[:'isDataGuardEnabled'].nil?

      raise 'You cannot provide both :isDataGuardEnabled and :is_data_guard_enabled' if attributes.key?(:'isDataGuardEnabled') && attributes.key?(:'is_data_guard_enabled')

      self.is_data_guard_enabled = attributes[:'is_data_guard_enabled'] unless attributes[:'is_data_guard_enabled'].nil?

      self.failed_data_recovery_in_seconds = attributes[:'failedDataRecoveryInSeconds'] if attributes[:'failedDataRecoveryInSeconds']

      raise 'You cannot provide both :failedDataRecoveryInSeconds and :failed_data_recovery_in_seconds' if attributes.key?(:'failedDataRecoveryInSeconds') && attributes.key?(:'failed_data_recovery_in_seconds')

      self.failed_data_recovery_in_seconds = attributes[:'failed_data_recovery_in_seconds'] if attributes[:'failed_data_recovery_in_seconds']

      self.standby_db = attributes[:'standbyDb'] if attributes[:'standbyDb']

      raise 'You cannot provide both :standbyDb and :standby_db' if attributes.key?(:'standbyDb') && attributes.key?(:'standby_db')

      self.standby_db = attributes[:'standby_db'] if attributes[:'standby_db']

      self.is_local_data_guard_enabled = attributes[:'isLocalDataGuardEnabled'] unless attributes[:'isLocalDataGuardEnabled'].nil?

      raise 'You cannot provide both :isLocalDataGuardEnabled and :is_local_data_guard_enabled' if attributes.key?(:'isLocalDataGuardEnabled') && attributes.key?(:'is_local_data_guard_enabled')

      self.is_local_data_guard_enabled = attributes[:'is_local_data_guard_enabled'] unless attributes[:'is_local_data_guard_enabled'].nil?

      self.is_remote_data_guard_enabled = attributes[:'isRemoteDataGuardEnabled'] unless attributes[:'isRemoteDataGuardEnabled'].nil?

      raise 'You cannot provide both :isRemoteDataGuardEnabled and :is_remote_data_guard_enabled' if attributes.key?(:'isRemoteDataGuardEnabled') && attributes.key?(:'is_remote_data_guard_enabled')

      self.is_remote_data_guard_enabled = attributes[:'is_remote_data_guard_enabled'] unless attributes[:'is_remote_data_guard_enabled'].nil?

      self.local_standby_db = attributes[:'localStandbyDb'] if attributes[:'localStandbyDb']

      raise 'You cannot provide both :localStandbyDb and :local_standby_db' if attributes.key?(:'localStandbyDb') && attributes.key?(:'local_standby_db')

      self.local_standby_db = attributes[:'local_standby_db'] if attributes[:'local_standby_db']

      self.role = attributes[:'role'] if attributes[:'role']

      self.available_upgrade_versions = attributes[:'availableUpgradeVersions'] if attributes[:'availableUpgradeVersions']

      raise 'You cannot provide both :availableUpgradeVersions and :available_upgrade_versions' if attributes.key?(:'availableUpgradeVersions') && attributes.key?(:'available_upgrade_versions')

      self.available_upgrade_versions = attributes[:'available_upgrade_versions'] if attributes[:'available_upgrade_versions']

      self.key_store_id = attributes[:'keyStoreId'] if attributes[:'keyStoreId']

      raise 'You cannot provide both :keyStoreId and :key_store_id' if attributes.key?(:'keyStoreId') && attributes.key?(:'key_store_id')

      self.key_store_id = attributes[:'key_store_id'] if attributes[:'key_store_id']

      self.key_store_wallet_name = attributes[:'keyStoreWalletName'] if attributes[:'keyStoreWalletName']

      raise 'You cannot provide both :keyStoreWalletName and :key_store_wallet_name' if attributes.key?(:'keyStoreWalletName') && attributes.key?(:'key_store_wallet_name')

      self.key_store_wallet_name = attributes[:'key_store_wallet_name'] if attributes[:'key_store_wallet_name']

      self.supported_regions_to_clone_to = attributes[:'supportedRegionsToCloneTo'] if attributes[:'supportedRegionsToCloneTo']

      raise 'You cannot provide both :supportedRegionsToCloneTo and :supported_regions_to_clone_to' if attributes.key?(:'supportedRegionsToCloneTo') && attributes.key?(:'supported_regions_to_clone_to')

      self.supported_regions_to_clone_to = attributes[:'supported_regions_to_clone_to'] if attributes[:'supported_regions_to_clone_to']

      self.customer_contacts = attributes[:'customerContacts'] if attributes[:'customerContacts']

      raise 'You cannot provide both :customerContacts and :customer_contacts' if attributes.key?(:'customerContacts') && attributes.key?(:'customer_contacts')

      self.customer_contacts = attributes[:'customer_contacts'] if attributes[:'customer_contacts']

      self.time_local_data_guard_enabled = attributes[:'timeLocalDataGuardEnabled'] if attributes[:'timeLocalDataGuardEnabled']

      raise 'You cannot provide both :timeLocalDataGuardEnabled and :time_local_data_guard_enabled' if attributes.key?(:'timeLocalDataGuardEnabled') && attributes.key?(:'time_local_data_guard_enabled')

      self.time_local_data_guard_enabled = attributes[:'time_local_data_guard_enabled'] if attributes[:'time_local_data_guard_enabled']

      self.dataguard_region_type = attributes[:'dataguardRegionType'] if attributes[:'dataguardRegionType']

      raise 'You cannot provide both :dataguardRegionType and :dataguard_region_type' if attributes.key?(:'dataguardRegionType') && attributes.key?(:'dataguard_region_type')

      self.dataguard_region_type = attributes[:'dataguard_region_type'] if attributes[:'dataguard_region_type']

      self.time_data_guard_role_changed = attributes[:'timeDataGuardRoleChanged'] if attributes[:'timeDataGuardRoleChanged']

      raise 'You cannot provide both :timeDataGuardRoleChanged and :time_data_guard_role_changed' if attributes.key?(:'timeDataGuardRoleChanged') && attributes.key?(:'time_data_guard_role_changed')

      self.time_data_guard_role_changed = attributes[:'time_data_guard_role_changed'] if attributes[:'time_data_guard_role_changed']

      self.peer_db_ids = attributes[:'peerDbIds'] if attributes[:'peerDbIds']

      raise 'You cannot provide both :peerDbIds and :peer_db_ids' if attributes.key?(:'peerDbIds') && attributes.key?(:'peer_db_ids')

      self.peer_db_ids = attributes[:'peer_db_ids'] if attributes[:'peer_db_ids']

      self.is_mtls_connection_required = attributes[:'isMtlsConnectionRequired'] unless attributes[:'isMtlsConnectionRequired'].nil?
      self.is_mtls_connection_required = true if is_mtls_connection_required.nil? && !attributes.key?(:'isMtlsConnectionRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMtlsConnectionRequired and :is_mtls_connection_required' if attributes.key?(:'isMtlsConnectionRequired') && attributes.key?(:'is_mtls_connection_required')

      self.is_mtls_connection_required = attributes[:'is_mtls_connection_required'] unless attributes[:'is_mtls_connection_required'].nil?
      self.is_mtls_connection_required = true if is_mtls_connection_required.nil? && !attributes.key?(:'isMtlsConnectionRequired') && !attributes.key?(:'is_mtls_connection_required') # rubocop:disable Style/StringLiterals

      self.is_reconnect_clone_enabled = attributes[:'isReconnectCloneEnabled'] unless attributes[:'isReconnectCloneEnabled'].nil?

      raise 'You cannot provide both :isReconnectCloneEnabled and :is_reconnect_clone_enabled' if attributes.key?(:'isReconnectCloneEnabled') && attributes.key?(:'is_reconnect_clone_enabled')

      self.is_reconnect_clone_enabled = attributes[:'is_reconnect_clone_enabled'] unless attributes[:'is_reconnect_clone_enabled'].nil?

      self.time_until_reconnect_clone_enabled = attributes[:'timeUntilReconnectCloneEnabled'] if attributes[:'timeUntilReconnectCloneEnabled']

      raise 'You cannot provide both :timeUntilReconnectCloneEnabled and :time_until_reconnect_clone_enabled' if attributes.key?(:'timeUntilReconnectCloneEnabled') && attributes.key?(:'time_until_reconnect_clone_enabled')

      self.time_until_reconnect_clone_enabled = attributes[:'time_until_reconnect_clone_enabled'] if attributes[:'time_until_reconnect_clone_enabled']

      self.autonomous_maintenance_schedule_type = attributes[:'autonomousMaintenanceScheduleType'] if attributes[:'autonomousMaintenanceScheduleType']

      raise 'You cannot provide both :autonomousMaintenanceScheduleType and :autonomous_maintenance_schedule_type' if attributes.key?(:'autonomousMaintenanceScheduleType') && attributes.key?(:'autonomous_maintenance_schedule_type')

      self.autonomous_maintenance_schedule_type = attributes[:'autonomous_maintenance_schedule_type'] if attributes[:'autonomous_maintenance_schedule_type']

      self.scheduled_operations = attributes[:'scheduledOperations'] if attributes[:'scheduledOperations']

      raise 'You cannot provide both :scheduledOperations and :scheduled_operations' if attributes.key?(:'scheduledOperations') && attributes.key?(:'scheduled_operations')

      self.scheduled_operations = attributes[:'scheduled_operations'] if attributes[:'scheduled_operations']

      self.is_auto_scaling_for_storage_enabled = attributes[:'isAutoScalingForStorageEnabled'] unless attributes[:'isAutoScalingForStorageEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingForStorageEnabled and :is_auto_scaling_for_storage_enabled' if attributes.key?(:'isAutoScalingForStorageEnabled') && attributes.key?(:'is_auto_scaling_for_storage_enabled')

      self.is_auto_scaling_for_storage_enabled = attributes[:'is_auto_scaling_for_storage_enabled'] unless attributes[:'is_auto_scaling_for_storage_enabled'].nil?

      self.allocated_storage_size_in_tbs = attributes[:'allocatedStorageSizeInTBs'] if attributes[:'allocatedStorageSizeInTBs']

      raise 'You cannot provide both :allocatedStorageSizeInTBs and :allocated_storage_size_in_tbs' if attributes.key?(:'allocatedStorageSizeInTBs') && attributes.key?(:'allocated_storage_size_in_tbs')

      self.allocated_storage_size_in_tbs = attributes[:'allocated_storage_size_in_tbs'] if attributes[:'allocated_storage_size_in_tbs']

      self.actual_used_data_storage_size_in_tbs = attributes[:'actualUsedDataStorageSizeInTBs'] if attributes[:'actualUsedDataStorageSizeInTBs']

      raise 'You cannot provide both :actualUsedDataStorageSizeInTBs and :actual_used_data_storage_size_in_tbs' if attributes.key?(:'actualUsedDataStorageSizeInTBs') && attributes.key?(:'actual_used_data_storage_size_in_tbs')

      self.actual_used_data_storage_size_in_tbs = attributes[:'actual_used_data_storage_size_in_tbs'] if attributes[:'actual_used_data_storage_size_in_tbs']

      self.max_cpu_core_count = attributes[:'maxCpuCoreCount'] if attributes[:'maxCpuCoreCount']

      raise 'You cannot provide both :maxCpuCoreCount and :max_cpu_core_count' if attributes.key?(:'maxCpuCoreCount') && attributes.key?(:'max_cpu_core_count')

      self.max_cpu_core_count = attributes[:'max_cpu_core_count'] if attributes[:'max_cpu_core_count']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] infrastructure_type Object to be assigned
    def infrastructure_type=(infrastructure_type)
      # rubocop:disable Style/ConditionalAssignment
      if infrastructure_type && !INFRASTRUCTURE_TYPE_ENUM.include?(infrastructure_type)
        OCI.logger.debug("Unknown value for 'infrastructure_type' [" + infrastructure_type + "]. Mapping to 'INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @infrastructure_type = INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @infrastructure_type = infrastructure_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] db_workload Object to be assigned
    def db_workload=(db_workload)
      # rubocop:disable Style/ConditionalAssignment
      if db_workload && !DB_WORKLOAD_ENUM.include?(db_workload)
        OCI.logger.debug("Unknown value for 'db_workload' [" + db_workload + "]. Mapping to 'DB_WORKLOAD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @db_workload = DB_WORKLOAD_UNKNOWN_ENUM_VALUE
      else
        @db_workload = db_workload
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] data_safe_status Object to be assigned
    def data_safe_status=(data_safe_status)
      # rubocop:disable Style/ConditionalAssignment
      if data_safe_status && !DATA_SAFE_STATUS_ENUM.include?(data_safe_status)
        OCI.logger.debug("Unknown value for 'data_safe_status' [" + data_safe_status + "]. Mapping to 'DATA_SAFE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @data_safe_status = DATA_SAFE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @data_safe_status = data_safe_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operations_insights_status Object to be assigned
    def operations_insights_status=(operations_insights_status)
      # rubocop:disable Style/ConditionalAssignment
      if operations_insights_status && !OPERATIONS_INSIGHTS_STATUS_ENUM.include?(operations_insights_status)
        OCI.logger.debug("Unknown value for 'operations_insights_status' [" + operations_insights_status + "]. Mapping to 'OPERATIONS_INSIGHTS_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operations_insights_status = OPERATIONS_INSIGHTS_STATUS_UNKNOWN_ENUM_VALUE
      else
        @operations_insights_status = operations_insights_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_management_status Object to be assigned
    def database_management_status=(database_management_status)
      # rubocop:disable Style/ConditionalAssignment
      if database_management_status && !DATABASE_MANAGEMENT_STATUS_ENUM.include?(database_management_status)
        OCI.logger.debug("Unknown value for 'database_management_status' [" + database_management_status + "]. Mapping to 'DATABASE_MANAGEMENT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_management_status = DATABASE_MANAGEMENT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @database_management_status = database_management_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] open_mode Object to be assigned
    def open_mode=(open_mode)
      # rubocop:disable Style/ConditionalAssignment
      if open_mode && !OPEN_MODE_ENUM.include?(open_mode)
        OCI.logger.debug("Unknown value for 'open_mode' [" + open_mode + "]. Mapping to 'OPEN_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @open_mode = OPEN_MODE_UNKNOWN_ENUM_VALUE
      else
        @open_mode = open_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] refreshable_status Object to be assigned
    def refreshable_status=(refreshable_status)
      # rubocop:disable Style/ConditionalAssignment
      if refreshable_status && !REFRESHABLE_STATUS_ENUM.include?(refreshable_status)
        OCI.logger.debug("Unknown value for 'refreshable_status' [" + refreshable_status + "]. Mapping to 'REFRESHABLE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @refreshable_status = REFRESHABLE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @refreshable_status = refreshable_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] refreshable_mode Object to be assigned
    def refreshable_mode=(refreshable_mode)
      # rubocop:disable Style/ConditionalAssignment
      if refreshable_mode && !REFRESHABLE_MODE_ENUM.include?(refreshable_mode)
        OCI.logger.debug("Unknown value for 'refreshable_mode' [" + refreshable_mode + "]. Mapping to 'REFRESHABLE_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @refreshable_mode = REFRESHABLE_MODE_UNKNOWN_ENUM_VALUE
      else
        @refreshable_mode = refreshable_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] permission_level Object to be assigned
    def permission_level=(permission_level)
      # rubocop:disable Style/ConditionalAssignment
      if permission_level && !PERMISSION_LEVEL_ENUM.include?(permission_level)
        OCI.logger.debug("Unknown value for 'permission_level' [" + permission_level + "]. Mapping to 'PERMISSION_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @permission_level = PERMISSION_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @permission_level = permission_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dataguard_region_type Object to be assigned
    def dataguard_region_type=(dataguard_region_type)
      # rubocop:disable Style/ConditionalAssignment
      if dataguard_region_type && !DATAGUARD_REGION_TYPE_ENUM.include?(dataguard_region_type)
        OCI.logger.debug("Unknown value for 'dataguard_region_type' [" + dataguard_region_type + "]. Mapping to 'DATAGUARD_REGION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @dataguard_region_type = DATAGUARD_REGION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @dataguard_region_type = dataguard_region_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] autonomous_maintenance_schedule_type Object to be assigned
    def autonomous_maintenance_schedule_type=(autonomous_maintenance_schedule_type)
      # rubocop:disable Style/ConditionalAssignment
      if autonomous_maintenance_schedule_type && !AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_ENUM.include?(autonomous_maintenance_schedule_type)
        OCI.logger.debug("Unknown value for 'autonomous_maintenance_schedule_type' [" + autonomous_maintenance_schedule_type + "]. Mapping to 'AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @autonomous_maintenance_schedule_type = AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        kms_key_id == other.kms_key_id &&
        vault_id == other.vault_id &&
        kms_key_lifecycle_details == other.kms_key_lifecycle_details &&
        kms_key_version_id == other.kms_key_version_id &&
        db_name == other.db_name &&
        character_set == other.character_set &&
        ncharacter_set == other.ncharacter_set &&
        is_free_tier == other.is_free_tier &&
        system_tags == other.system_tags &&
        time_reclamation_of_free_autonomous_database == other.time_reclamation_of_free_autonomous_database &&
        time_deletion_of_free_autonomous_database == other.time_deletion_of_free_autonomous_database &&
        backup_config == other.backup_config &&
        key_history_entry == other.key_history_entry &&
        cpu_core_count == other.cpu_core_count &&
        ocpu_count == other.ocpu_count &&
        provisionable_cpus == other.provisionable_cpus &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        memory_per_oracle_compute_unit_in_gbs == other.memory_per_oracle_compute_unit_in_gbs &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        infrastructure_type == other.infrastructure_type &&
        is_dedicated == other.is_dedicated &&
        autonomous_container_database_id == other.autonomous_container_database_id &&
        time_created == other.time_created &&
        display_name == other.display_name &&
        service_console_url == other.service_console_url &&
        connection_strings == other.connection_strings &&
        connection_urls == other.connection_urls &&
        license_model == other.license_model &&
        used_data_storage_size_in_tbs == other.used_data_storage_size_in_tbs &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        subnet_id == other.subnet_id &&
        nsg_ids == other.nsg_ids &&
        private_endpoint == other.private_endpoint &&
        private_endpoint_label == other.private_endpoint_label &&
        private_endpoint_ip == other.private_endpoint_ip &&
        db_version == other.db_version &&
        is_preview == other.is_preview &&
        db_workload == other.db_workload &&
        is_access_control_enabled == other.is_access_control_enabled &&
        whitelisted_ips == other.whitelisted_ips &&
        are_primary_whitelisted_ips_used == other.are_primary_whitelisted_ips_used &&
        standby_whitelisted_ips == other.standby_whitelisted_ips &&
        apex_details == other.apex_details &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        data_safe_status == other.data_safe_status &&
        operations_insights_status == other.operations_insights_status &&
        database_management_status == other.database_management_status &&
        time_maintenance_begin == other.time_maintenance_begin &&
        time_maintenance_end == other.time_maintenance_end &&
        is_refreshable_clone == other.is_refreshable_clone &&
        time_of_last_refresh == other.time_of_last_refresh &&
        time_of_last_refresh_point == other.time_of_last_refresh_point &&
        time_of_next_refresh == other.time_of_next_refresh &&
        open_mode == other.open_mode &&
        refreshable_status == other.refreshable_status &&
        refreshable_mode == other.refreshable_mode &&
        source_id == other.source_id &&
        permission_level == other.permission_level &&
        time_of_last_switchover == other.time_of_last_switchover &&
        time_of_last_failover == other.time_of_last_failover &&
        is_data_guard_enabled == other.is_data_guard_enabled &&
        failed_data_recovery_in_seconds == other.failed_data_recovery_in_seconds &&
        standby_db == other.standby_db &&
        is_local_data_guard_enabled == other.is_local_data_guard_enabled &&
        is_remote_data_guard_enabled == other.is_remote_data_guard_enabled &&
        local_standby_db == other.local_standby_db &&
        role == other.role &&
        available_upgrade_versions == other.available_upgrade_versions &&
        key_store_id == other.key_store_id &&
        key_store_wallet_name == other.key_store_wallet_name &&
        supported_regions_to_clone_to == other.supported_regions_to_clone_to &&
        customer_contacts == other.customer_contacts &&
        time_local_data_guard_enabled == other.time_local_data_guard_enabled &&
        dataguard_region_type == other.dataguard_region_type &&
        time_data_guard_role_changed == other.time_data_guard_role_changed &&
        peer_db_ids == other.peer_db_ids &&
        is_mtls_connection_required == other.is_mtls_connection_required &&
        is_reconnect_clone_enabled == other.is_reconnect_clone_enabled &&
        time_until_reconnect_clone_enabled == other.time_until_reconnect_clone_enabled &&
        autonomous_maintenance_schedule_type == other.autonomous_maintenance_schedule_type &&
        scheduled_operations == other.scheduled_operations &&
        is_auto_scaling_for_storage_enabled == other.is_auto_scaling_for_storage_enabled &&
        allocated_storage_size_in_tbs == other.allocated_storage_size_in_tbs &&
        actual_used_data_storage_size_in_tbs == other.actual_used_data_storage_size_in_tbs &&
        max_cpu_core_count == other.max_cpu_core_count &&
        database_edition == other.database_edition
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
      [id, compartment_id, lifecycle_state, lifecycle_details, kms_key_id, vault_id, kms_key_lifecycle_details, kms_key_version_id, db_name, character_set, ncharacter_set, is_free_tier, system_tags, time_reclamation_of_free_autonomous_database, time_deletion_of_free_autonomous_database, backup_config, key_history_entry, cpu_core_count, ocpu_count, provisionable_cpus, data_storage_size_in_tbs, memory_per_oracle_compute_unit_in_gbs, data_storage_size_in_gbs, infrastructure_type, is_dedicated, autonomous_container_database_id, time_created, display_name, service_console_url, connection_strings, connection_urls, license_model, used_data_storage_size_in_tbs, freeform_tags, defined_tags, subnet_id, nsg_ids, private_endpoint, private_endpoint_label, private_endpoint_ip, db_version, is_preview, db_workload, is_access_control_enabled, whitelisted_ips, are_primary_whitelisted_ips_used, standby_whitelisted_ips, apex_details, is_auto_scaling_enabled, data_safe_status, operations_insights_status, database_management_status, time_maintenance_begin, time_maintenance_end, is_refreshable_clone, time_of_last_refresh, time_of_last_refresh_point, time_of_next_refresh, open_mode, refreshable_status, refreshable_mode, source_id, permission_level, time_of_last_switchover, time_of_last_failover, is_data_guard_enabled, failed_data_recovery_in_seconds, standby_db, is_local_data_guard_enabled, is_remote_data_guard_enabled, local_standby_db, role, available_upgrade_versions, key_store_id, key_store_wallet_name, supported_regions_to_clone_to, customer_contacts, time_local_data_guard_enabled, dataguard_region_type, time_data_guard_role_changed, peer_db_ids, is_mtls_connection_required, is_reconnect_clone_enabled, time_until_reconnect_clone_enabled, autonomous_maintenance_schedule_type, scheduled_operations, is_auto_scaling_for_storage_enabled, allocated_storage_size_in_tbs, actual_used_data_storage_size_in_tbs, max_cpu_core_count, database_edition].hash
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
