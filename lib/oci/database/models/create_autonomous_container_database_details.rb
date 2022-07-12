# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Describes the required parameters for the creation of an Autonomous Container Database.
  #
  class Database::Models::CreateAutonomousContainerDatabaseDetails
    SERVICE_LEVEL_AGREEMENT_TYPE_ENUM = [
      SERVICE_LEVEL_AGREEMENT_TYPE_STANDARD = 'STANDARD'.freeze,
      SERVICE_LEVEL_AGREEMENT_TYPE_AUTONOMOUS_DATAGUARD = 'AUTONOMOUS_DATAGUARD'.freeze
    ].freeze

    PROTECTION_MODE_ENUM = [
      PROTECTION_MODE_MAXIMUM_AVAILABILITY = 'MAXIMUM_AVAILABILITY'.freeze,
      PROTECTION_MODE_MAXIMUM_PERFORMANCE = 'MAXIMUM_PERFORMANCE'.freeze
    ].freeze

    PATCH_MODEL_ENUM = [
      PATCH_MODEL_RELEASE_UPDATES = 'RELEASE_UPDATES'.freeze,
      PATCH_MODEL_RELEASE_UPDATE_REVISIONS = 'RELEASE_UPDATE_REVISIONS'.freeze
    ].freeze

    # **[Required]** The display name for the Autonomous Container Database.
    # @return [String]
    attr_accessor :display_name

    # **Deprecated.** The `DB_UNIQUE_NAME` value is set by Oracle Cloud Infrastructure.  Do not specify a value for this parameter. Specifying a value for this field will cause Terraform operations to fail.
    #
    # @return [String]
    attr_accessor :db_unique_name

    # The service level agreement type of the Autonomous Container Database. The default is STANDARD. For an autonomous dataguard Autonomous Container Database, the specified Autonomous Exadata Infrastructure must be associated with a remote Autonomous Exadata Infrastructure.
    # @return [String]
    attr_reader :service_level_agreement_type

    # **No longer used.** This parameter is no longer used for Autonomous Database on dedicated Exadata infrasture. Specify a `cloudAutonomousVmClusterId` instead. Using this parameter will cause the operation to fail.
    #
    # @return [String]
    attr_accessor :autonomous_exadata_infrastructure_id

    # *No longer used.* This parameter is no longer used for Autonomous Database on dedicated Exadata infrasture. Specify a `peerCloudAutonomousVmClusterId` instead. Using this parameter will cause the operation to fail.
    #
    # @return [String]
    attr_accessor :peer_autonomous_exadata_infrastructure_id

    # The display name for the peer Autonomous Container Database.
    # @return [String]
    attr_accessor :peer_autonomous_container_database_display_name

    # The protection mode of this Autonomous Data Guard association. For more information, see
    # [Oracle Data Guard Protection Modes](http://docs.oracle.com/database/122/SBYDB/oracle-data-guard-protection-modes.htm#SBYDB02000)
    # in the Oracle Data Guard documentation.
    #
    # @return [String]
    attr_reader :protection_mode

    # Indicates whether Automatic Failover is enabled for Autonomous Container Database Dataguard Association
    #
    # @return [BOOLEAN]
    attr_accessor :is_automatic_failover_enabled

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the peer cloud Autonomous Exadata VM Cluster.
    # @return [String]
    attr_accessor :peer_cloud_autonomous_vm_cluster_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the peer Autonomous VM cluster for Autonomous Data Guard. Required to enable Data Guard.
    #
    # @return [String]
    attr_accessor :peer_autonomous_vm_cluster_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment where the standby Autonomous Container Database
    # will be created.
    #
    # @return [String]
    attr_accessor :peer_autonomous_container_database_compartment_id

    # @return [OCI::Database::Models::PeerAutonomousContainerDatabaseBackupConfig]
    attr_accessor :peer_autonomous_container_database_backup_config

    # **Deprecated.** The `DB_UNIQUE_NAME` of the peer Autonomous Container Database in a Data Guard association is set by Oracle Cloud Infrastructure.  Do not specify a value for this parameter. Specifying a value for this field will cause Terraform operations to fail.
    #
    # @return [String]
    attr_accessor :peer_db_unique_name

    # The OCID of the Autonomous VM Cluster.
    # @return [String]
    attr_accessor :autonomous_vm_cluster_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the cloud Autonomous Exadata VM Cluster.
    # @return [String]
    attr_accessor :cloud_autonomous_vm_cluster_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the Autonomous Container Database.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Database Patch model preference.
    # @return [String]
    attr_reader :patch_model

    # @return [OCI::Database::Models::MaintenanceWindow]
    attr_accessor :maintenance_window_details

    # The scheduling detail for the quarterly maintenance window of the standby Autonomous Container Database.
    # This value represents the number of days before scheduled maintenance of the primary database.
    #
    # @return [Integer]
    attr_accessor :standby_maintenance_buffer_in_days

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

    # @return [OCI::Database::Models::AutonomousContainerDatabaseBackupConfig]
    attr_accessor :backup_config

    # The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations.
    # @return [String]
    attr_accessor :kms_key_id

    # The OCID of the key container version that is used in database transparent data encryption (TDE) operations KMS Key can have multiple key versions. If none is specified, the current key version (latest) of the Key Id is used for the operation.
    #
    # @return [String]
    attr_accessor :kms_key_version_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure [vault](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @return [String]
    attr_accessor :vault_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @return [String]
    attr_accessor :key_store_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'db_unique_name': :'dbUniqueName',
        'service_level_agreement_type': :'serviceLevelAgreementType',
        'autonomous_exadata_infrastructure_id': :'autonomousExadataInfrastructureId',
        'peer_autonomous_exadata_infrastructure_id': :'peerAutonomousExadataInfrastructureId',
        'peer_autonomous_container_database_display_name': :'peerAutonomousContainerDatabaseDisplayName',
        'protection_mode': :'protectionMode',
        'is_automatic_failover_enabled': :'isAutomaticFailoverEnabled',
        'peer_cloud_autonomous_vm_cluster_id': :'peerCloudAutonomousVmClusterId',
        'peer_autonomous_vm_cluster_id': :'peerAutonomousVmClusterId',
        'peer_autonomous_container_database_compartment_id': :'peerAutonomousContainerDatabaseCompartmentId',
        'peer_autonomous_container_database_backup_config': :'peerAutonomousContainerDatabaseBackupConfig',
        'peer_db_unique_name': :'peerDbUniqueName',
        'autonomous_vm_cluster_id': :'autonomousVmClusterId',
        'cloud_autonomous_vm_cluster_id': :'cloudAutonomousVmClusterId',
        'compartment_id': :'compartmentId',
        'patch_model': :'patchModel',
        'maintenance_window_details': :'maintenanceWindowDetails',
        'standby_maintenance_buffer_in_days': :'standbyMaintenanceBufferInDays',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'backup_config': :'backupConfig',
        'kms_key_id': :'kmsKeyId',
        'kms_key_version_id': :'kmsKeyVersionId',
        'vault_id': :'vaultId',
        'key_store_id': :'keyStoreId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'db_unique_name': :'String',
        'service_level_agreement_type': :'String',
        'autonomous_exadata_infrastructure_id': :'String',
        'peer_autonomous_exadata_infrastructure_id': :'String',
        'peer_autonomous_container_database_display_name': :'String',
        'protection_mode': :'String',
        'is_automatic_failover_enabled': :'BOOLEAN',
        'peer_cloud_autonomous_vm_cluster_id': :'String',
        'peer_autonomous_vm_cluster_id': :'String',
        'peer_autonomous_container_database_compartment_id': :'String',
        'peer_autonomous_container_database_backup_config': :'OCI::Database::Models::PeerAutonomousContainerDatabaseBackupConfig',
        'peer_db_unique_name': :'String',
        'autonomous_vm_cluster_id': :'String',
        'cloud_autonomous_vm_cluster_id': :'String',
        'compartment_id': :'String',
        'patch_model': :'String',
        'maintenance_window_details': :'OCI::Database::Models::MaintenanceWindow',
        'standby_maintenance_buffer_in_days': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'backup_config': :'OCI::Database::Models::AutonomousContainerDatabaseBackupConfig',
        'kms_key_id': :'String',
        'kms_key_version_id': :'String',
        'vault_id': :'String',
        'key_store_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :db_unique_name The value to assign to the {#db_unique_name} property
    # @option attributes [String] :service_level_agreement_type The value to assign to the {#service_level_agreement_type} property
    # @option attributes [String] :autonomous_exadata_infrastructure_id The value to assign to the {#autonomous_exadata_infrastructure_id} property
    # @option attributes [String] :peer_autonomous_exadata_infrastructure_id The value to assign to the {#peer_autonomous_exadata_infrastructure_id} property
    # @option attributes [String] :peer_autonomous_container_database_display_name The value to assign to the {#peer_autonomous_container_database_display_name} property
    # @option attributes [String] :protection_mode The value to assign to the {#protection_mode} property
    # @option attributes [BOOLEAN] :is_automatic_failover_enabled The value to assign to the {#is_automatic_failover_enabled} property
    # @option attributes [String] :peer_cloud_autonomous_vm_cluster_id The value to assign to the {#peer_cloud_autonomous_vm_cluster_id} property
    # @option attributes [String] :peer_autonomous_vm_cluster_id The value to assign to the {#peer_autonomous_vm_cluster_id} property
    # @option attributes [String] :peer_autonomous_container_database_compartment_id The value to assign to the {#peer_autonomous_container_database_compartment_id} property
    # @option attributes [OCI::Database::Models::PeerAutonomousContainerDatabaseBackupConfig] :peer_autonomous_container_database_backup_config The value to assign to the {#peer_autonomous_container_database_backup_config} property
    # @option attributes [String] :peer_db_unique_name The value to assign to the {#peer_db_unique_name} property
    # @option attributes [String] :autonomous_vm_cluster_id The value to assign to the {#autonomous_vm_cluster_id} property
    # @option attributes [String] :cloud_autonomous_vm_cluster_id The value to assign to the {#cloud_autonomous_vm_cluster_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :patch_model The value to assign to the {#patch_model} property
    # @option attributes [OCI::Database::Models::MaintenanceWindow] :maintenance_window_details The value to assign to the {#maintenance_window_details} property
    # @option attributes [Integer] :standby_maintenance_buffer_in_days The value to assign to the {#standby_maintenance_buffer_in_days} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Database::Models::AutonomousContainerDatabaseBackupConfig] :backup_config The value to assign to the {#backup_config} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [String] :kms_key_version_id The value to assign to the {#kms_key_version_id} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :key_store_id The value to assign to the {#key_store_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.db_unique_name = attributes[:'dbUniqueName'] if attributes[:'dbUniqueName']

      raise 'You cannot provide both :dbUniqueName and :db_unique_name' if attributes.key?(:'dbUniqueName') && attributes.key?(:'db_unique_name')

      self.db_unique_name = attributes[:'db_unique_name'] if attributes[:'db_unique_name']

      self.service_level_agreement_type = attributes[:'serviceLevelAgreementType'] if attributes[:'serviceLevelAgreementType']

      raise 'You cannot provide both :serviceLevelAgreementType and :service_level_agreement_type' if attributes.key?(:'serviceLevelAgreementType') && attributes.key?(:'service_level_agreement_type')

      self.service_level_agreement_type = attributes[:'service_level_agreement_type'] if attributes[:'service_level_agreement_type']

      self.autonomous_exadata_infrastructure_id = attributes[:'autonomousExadataInfrastructureId'] if attributes[:'autonomousExadataInfrastructureId']

      raise 'You cannot provide both :autonomousExadataInfrastructureId and :autonomous_exadata_infrastructure_id' if attributes.key?(:'autonomousExadataInfrastructureId') && attributes.key?(:'autonomous_exadata_infrastructure_id')

      self.autonomous_exadata_infrastructure_id = attributes[:'autonomous_exadata_infrastructure_id'] if attributes[:'autonomous_exadata_infrastructure_id']

      self.peer_autonomous_exadata_infrastructure_id = attributes[:'peerAutonomousExadataInfrastructureId'] if attributes[:'peerAutonomousExadataInfrastructureId']

      raise 'You cannot provide both :peerAutonomousExadataInfrastructureId and :peer_autonomous_exadata_infrastructure_id' if attributes.key?(:'peerAutonomousExadataInfrastructureId') && attributes.key?(:'peer_autonomous_exadata_infrastructure_id')

      self.peer_autonomous_exadata_infrastructure_id = attributes[:'peer_autonomous_exadata_infrastructure_id'] if attributes[:'peer_autonomous_exadata_infrastructure_id']

      self.peer_autonomous_container_database_display_name = attributes[:'peerAutonomousContainerDatabaseDisplayName'] if attributes[:'peerAutonomousContainerDatabaseDisplayName']

      raise 'You cannot provide both :peerAutonomousContainerDatabaseDisplayName and :peer_autonomous_container_database_display_name' if attributes.key?(:'peerAutonomousContainerDatabaseDisplayName') && attributes.key?(:'peer_autonomous_container_database_display_name')

      self.peer_autonomous_container_database_display_name = attributes[:'peer_autonomous_container_database_display_name'] if attributes[:'peer_autonomous_container_database_display_name']

      self.protection_mode = attributes[:'protectionMode'] if attributes[:'protectionMode']

      raise 'You cannot provide both :protectionMode and :protection_mode' if attributes.key?(:'protectionMode') && attributes.key?(:'protection_mode')

      self.protection_mode = attributes[:'protection_mode'] if attributes[:'protection_mode']

      self.is_automatic_failover_enabled = attributes[:'isAutomaticFailoverEnabled'] unless attributes[:'isAutomaticFailoverEnabled'].nil?

      raise 'You cannot provide both :isAutomaticFailoverEnabled and :is_automatic_failover_enabled' if attributes.key?(:'isAutomaticFailoverEnabled') && attributes.key?(:'is_automatic_failover_enabled')

      self.is_automatic_failover_enabled = attributes[:'is_automatic_failover_enabled'] unless attributes[:'is_automatic_failover_enabled'].nil?

      self.peer_cloud_autonomous_vm_cluster_id = attributes[:'peerCloudAutonomousVmClusterId'] if attributes[:'peerCloudAutonomousVmClusterId']

      raise 'You cannot provide both :peerCloudAutonomousVmClusterId and :peer_cloud_autonomous_vm_cluster_id' if attributes.key?(:'peerCloudAutonomousVmClusterId') && attributes.key?(:'peer_cloud_autonomous_vm_cluster_id')

      self.peer_cloud_autonomous_vm_cluster_id = attributes[:'peer_cloud_autonomous_vm_cluster_id'] if attributes[:'peer_cloud_autonomous_vm_cluster_id']

      self.peer_autonomous_vm_cluster_id = attributes[:'peerAutonomousVmClusterId'] if attributes[:'peerAutonomousVmClusterId']

      raise 'You cannot provide both :peerAutonomousVmClusterId and :peer_autonomous_vm_cluster_id' if attributes.key?(:'peerAutonomousVmClusterId') && attributes.key?(:'peer_autonomous_vm_cluster_id')

      self.peer_autonomous_vm_cluster_id = attributes[:'peer_autonomous_vm_cluster_id'] if attributes[:'peer_autonomous_vm_cluster_id']

      self.peer_autonomous_container_database_compartment_id = attributes[:'peerAutonomousContainerDatabaseCompartmentId'] if attributes[:'peerAutonomousContainerDatabaseCompartmentId']

      raise 'You cannot provide both :peerAutonomousContainerDatabaseCompartmentId and :peer_autonomous_container_database_compartment_id' if attributes.key?(:'peerAutonomousContainerDatabaseCompartmentId') && attributes.key?(:'peer_autonomous_container_database_compartment_id')

      self.peer_autonomous_container_database_compartment_id = attributes[:'peer_autonomous_container_database_compartment_id'] if attributes[:'peer_autonomous_container_database_compartment_id']

      self.peer_autonomous_container_database_backup_config = attributes[:'peerAutonomousContainerDatabaseBackupConfig'] if attributes[:'peerAutonomousContainerDatabaseBackupConfig']

      raise 'You cannot provide both :peerAutonomousContainerDatabaseBackupConfig and :peer_autonomous_container_database_backup_config' if attributes.key?(:'peerAutonomousContainerDatabaseBackupConfig') && attributes.key?(:'peer_autonomous_container_database_backup_config')

      self.peer_autonomous_container_database_backup_config = attributes[:'peer_autonomous_container_database_backup_config'] if attributes[:'peer_autonomous_container_database_backup_config']

      self.peer_db_unique_name = attributes[:'peerDbUniqueName'] if attributes[:'peerDbUniqueName']

      raise 'You cannot provide both :peerDbUniqueName and :peer_db_unique_name' if attributes.key?(:'peerDbUniqueName') && attributes.key?(:'peer_db_unique_name')

      self.peer_db_unique_name = attributes[:'peer_db_unique_name'] if attributes[:'peer_db_unique_name']

      self.autonomous_vm_cluster_id = attributes[:'autonomousVmClusterId'] if attributes[:'autonomousVmClusterId']

      raise 'You cannot provide both :autonomousVmClusterId and :autonomous_vm_cluster_id' if attributes.key?(:'autonomousVmClusterId') && attributes.key?(:'autonomous_vm_cluster_id')

      self.autonomous_vm_cluster_id = attributes[:'autonomous_vm_cluster_id'] if attributes[:'autonomous_vm_cluster_id']

      self.cloud_autonomous_vm_cluster_id = attributes[:'cloudAutonomousVmClusterId'] if attributes[:'cloudAutonomousVmClusterId']

      raise 'You cannot provide both :cloudAutonomousVmClusterId and :cloud_autonomous_vm_cluster_id' if attributes.key?(:'cloudAutonomousVmClusterId') && attributes.key?(:'cloud_autonomous_vm_cluster_id')

      self.cloud_autonomous_vm_cluster_id = attributes[:'cloud_autonomous_vm_cluster_id'] if attributes[:'cloud_autonomous_vm_cluster_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.patch_model = attributes[:'patchModel'] if attributes[:'patchModel']

      raise 'You cannot provide both :patchModel and :patch_model' if attributes.key?(:'patchModel') && attributes.key?(:'patch_model')

      self.patch_model = attributes[:'patch_model'] if attributes[:'patch_model']

      self.maintenance_window_details = attributes[:'maintenanceWindowDetails'] if attributes[:'maintenanceWindowDetails']

      raise 'You cannot provide both :maintenanceWindowDetails and :maintenance_window_details' if attributes.key?(:'maintenanceWindowDetails') && attributes.key?(:'maintenance_window_details')

      self.maintenance_window_details = attributes[:'maintenance_window_details'] if attributes[:'maintenance_window_details']

      self.standby_maintenance_buffer_in_days = attributes[:'standbyMaintenanceBufferInDays'] if attributes[:'standbyMaintenanceBufferInDays']

      raise 'You cannot provide both :standbyMaintenanceBufferInDays and :standby_maintenance_buffer_in_days' if attributes.key?(:'standbyMaintenanceBufferInDays') && attributes.key?(:'standby_maintenance_buffer_in_days')

      self.standby_maintenance_buffer_in_days = attributes[:'standby_maintenance_buffer_in_days'] if attributes[:'standby_maintenance_buffer_in_days']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.backup_config = attributes[:'backupConfig'] if attributes[:'backupConfig']

      raise 'You cannot provide both :backupConfig and :backup_config' if attributes.key?(:'backupConfig') && attributes.key?(:'backup_config')

      self.backup_config = attributes[:'backup_config'] if attributes[:'backup_config']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.kms_key_version_id = attributes[:'kmsKeyVersionId'] if attributes[:'kmsKeyVersionId']

      raise 'You cannot provide both :kmsKeyVersionId and :kms_key_version_id' if attributes.key?(:'kmsKeyVersionId') && attributes.key?(:'kms_key_version_id')

      self.kms_key_version_id = attributes[:'kms_key_version_id'] if attributes[:'kms_key_version_id']

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.key_store_id = attributes[:'keyStoreId'] if attributes[:'keyStoreId']

      raise 'You cannot provide both :keyStoreId and :key_store_id' if attributes.key?(:'keyStoreId') && attributes.key?(:'key_store_id')

      self.key_store_id = attributes[:'key_store_id'] if attributes[:'key_store_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] service_level_agreement_type Object to be assigned
    def service_level_agreement_type=(service_level_agreement_type)
      raise "Invalid value for 'service_level_agreement_type': this must be one of the values in SERVICE_LEVEL_AGREEMENT_TYPE_ENUM." if service_level_agreement_type && !SERVICE_LEVEL_AGREEMENT_TYPE_ENUM.include?(service_level_agreement_type)

      @service_level_agreement_type = service_level_agreement_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protection_mode Object to be assigned
    def protection_mode=(protection_mode)
      raise "Invalid value for 'protection_mode': this must be one of the values in PROTECTION_MODE_ENUM." if protection_mode && !PROTECTION_MODE_ENUM.include?(protection_mode)

      @protection_mode = protection_mode
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patch_model Object to be assigned
    def patch_model=(patch_model)
      raise "Invalid value for 'patch_model': this must be one of the values in PATCH_MODEL_ENUM." if patch_model && !PATCH_MODEL_ENUM.include?(patch_model)

      @patch_model = patch_model
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        db_unique_name == other.db_unique_name &&
        service_level_agreement_type == other.service_level_agreement_type &&
        autonomous_exadata_infrastructure_id == other.autonomous_exadata_infrastructure_id &&
        peer_autonomous_exadata_infrastructure_id == other.peer_autonomous_exadata_infrastructure_id &&
        peer_autonomous_container_database_display_name == other.peer_autonomous_container_database_display_name &&
        protection_mode == other.protection_mode &&
        is_automatic_failover_enabled == other.is_automatic_failover_enabled &&
        peer_cloud_autonomous_vm_cluster_id == other.peer_cloud_autonomous_vm_cluster_id &&
        peer_autonomous_vm_cluster_id == other.peer_autonomous_vm_cluster_id &&
        peer_autonomous_container_database_compartment_id == other.peer_autonomous_container_database_compartment_id &&
        peer_autonomous_container_database_backup_config == other.peer_autonomous_container_database_backup_config &&
        peer_db_unique_name == other.peer_db_unique_name &&
        autonomous_vm_cluster_id == other.autonomous_vm_cluster_id &&
        cloud_autonomous_vm_cluster_id == other.cloud_autonomous_vm_cluster_id &&
        compartment_id == other.compartment_id &&
        patch_model == other.patch_model &&
        maintenance_window_details == other.maintenance_window_details &&
        standby_maintenance_buffer_in_days == other.standby_maintenance_buffer_in_days &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        backup_config == other.backup_config &&
        kms_key_id == other.kms_key_id &&
        kms_key_version_id == other.kms_key_version_id &&
        vault_id == other.vault_id &&
        key_store_id == other.key_store_id
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
      [display_name, db_unique_name, service_level_agreement_type, autonomous_exadata_infrastructure_id, peer_autonomous_exadata_infrastructure_id, peer_autonomous_container_database_display_name, protection_mode, is_automatic_failover_enabled, peer_cloud_autonomous_vm_cluster_id, peer_autonomous_vm_cluster_id, peer_autonomous_container_database_compartment_id, peer_autonomous_container_database_backup_config, peer_db_unique_name, autonomous_vm_cluster_id, cloud_autonomous_vm_cluster_id, compartment_id, patch_model, maintenance_window_details, standby_maintenance_buffer_in_days, freeform_tags, defined_tags, backup_config, kms_key_id, kms_key_version_id, vault_id, key_store_id].hash
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
