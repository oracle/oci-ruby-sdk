# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the VM cluster resource. Applies to Exadata Cloud@Customer instances only.
  #
  class Database::Models::VmCluster
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM cluster.
    # @return [String]
    attr_accessor :id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last patch history. This value is updated as soon as a patch operation starts.
    # @return [String]
    attr_accessor :last_patch_history_entry_id

    # The current state of the VM cluster.
    # @return [String]
    attr_reader :lifecycle_state

    # The user-friendly name for the Exadata Cloud@Customer VM cluster. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # The date and time that the VM cluster was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The time zone of the Exadata infrastructure. For details, see [Exadata Infrastructure Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).
    # @return [String]
    attr_accessor :time_zone

    # If true, database backup on local Exadata storage is configured for the VM cluster. If false, database backup on local Exadata storage is not available in the VM cluster.
    #
    # @return [BOOLEAN]
    attr_accessor :is_local_backup_enabled

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exadata infrastructure.
    # @return [String]
    attr_accessor :exadata_infrastructure_id

    # If true, sparse disk group is configured for the VM cluster. If false, sparse disk group is not created.
    #
    # @return [BOOLEAN]
    attr_accessor :is_sparse_diskgroup_enabled

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM cluster network.
    # @return [String]
    attr_accessor :vm_cluster_network_id

    # The number of enabled CPU cores.
    # @return [Integer]
    attr_accessor :cpus_enabled

    # The memory allocated in GBs.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The local node storage allocated in GBs.
    # @return [Integer]
    attr_accessor :db_node_storage_size_in_gbs

    # Size, in terabytes, of the DATA disk group.
    #
    # @return [Float]
    attr_accessor :data_storage_size_in_tbs

    # The shape of the Exadata infrastructure. The shape determines the amount of CPU, storage, and memory resources allocated to the instance.
    #
    # @return [String]
    attr_accessor :shape

    # The Oracle Grid Infrastructure software version for the VM cluster.
    # @return [String]
    attr_accessor :gi_version

    # The public key portion of one or more key pairs used for SSH access to the VM cluster.
    # @return [Array<String>]
    attr_accessor :ssh_public_keys

    # The Oracle license model that applies to the VM cluster. The default is LICENSE_INCLUDED.
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
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'last_patch_history_entry_id': :'lastPatchHistoryEntryId',
        'lifecycle_state': :'lifecycleState',
        'display_name': :'displayName',
        'time_created': :'timeCreated',
        'lifecycle_details': :'lifecycleDetails',
        'time_zone': :'timeZone',
        'is_local_backup_enabled': :'isLocalBackupEnabled',
        'exadata_infrastructure_id': :'exadataInfrastructureId',
        'is_sparse_diskgroup_enabled': :'isSparseDiskgroupEnabled',
        'vm_cluster_network_id': :'vmClusterNetworkId',
        'cpus_enabled': :'cpusEnabled',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'db_node_storage_size_in_gbs': :'dbNodeStorageSizeInGBs',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'shape': :'shape',
        'gi_version': :'giVersion',
        'ssh_public_keys': :'sshPublicKeys',
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
        'id': :'String',
        'compartment_id': :'String',
        'last_patch_history_entry_id': :'String',
        'lifecycle_state': :'String',
        'display_name': :'String',
        'time_created': :'DateTime',
        'lifecycle_details': :'String',
        'time_zone': :'String',
        'is_local_backup_enabled': :'BOOLEAN',
        'exadata_infrastructure_id': :'String',
        'is_sparse_diskgroup_enabled': :'BOOLEAN',
        'vm_cluster_network_id': :'String',
        'cpus_enabled': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'db_node_storage_size_in_gbs': :'Integer',
        'data_storage_size_in_tbs': :'Float',
        'shape': :'String',
        'gi_version': :'String',
        'ssh_public_keys': :'Array<String>',
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
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :last_patch_history_entry_id The value to assign to the {#last_patch_history_entry_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [BOOLEAN] :is_local_backup_enabled The value to assign to the {#is_local_backup_enabled} property
    # @option attributes [String] :exadata_infrastructure_id The value to assign to the {#exadata_infrastructure_id} property
    # @option attributes [BOOLEAN] :is_sparse_diskgroup_enabled The value to assign to the {#is_sparse_diskgroup_enabled} property
    # @option attributes [String] :vm_cluster_network_id The value to assign to the {#vm_cluster_network_id} property
    # @option attributes [Integer] :cpus_enabled The value to assign to the {#cpus_enabled} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Integer] :db_node_storage_size_in_gbs The value to assign to the {#db_node_storage_size_in_gbs} property
    # @option attributes [Float] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [String] :gi_version The value to assign to the {#gi_version} property
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {#ssh_public_keys} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.last_patch_history_entry_id = attributes[:'lastPatchHistoryEntryId'] if attributes[:'lastPatchHistoryEntryId']

      raise 'You cannot provide both :lastPatchHistoryEntryId and :last_patch_history_entry_id' if attributes.key?(:'lastPatchHistoryEntryId') && attributes.key?(:'last_patch_history_entry_id')

      self.last_patch_history_entry_id = attributes[:'last_patch_history_entry_id'] if attributes[:'last_patch_history_entry_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.is_local_backup_enabled = attributes[:'isLocalBackupEnabled'] unless attributes[:'isLocalBackupEnabled'].nil?

      raise 'You cannot provide both :isLocalBackupEnabled and :is_local_backup_enabled' if attributes.key?(:'isLocalBackupEnabled') && attributes.key?(:'is_local_backup_enabled')

      self.is_local_backup_enabled = attributes[:'is_local_backup_enabled'] unless attributes[:'is_local_backup_enabled'].nil?

      self.exadata_infrastructure_id = attributes[:'exadataInfrastructureId'] if attributes[:'exadataInfrastructureId']

      raise 'You cannot provide both :exadataInfrastructureId and :exadata_infrastructure_id' if attributes.key?(:'exadataInfrastructureId') && attributes.key?(:'exadata_infrastructure_id')

      self.exadata_infrastructure_id = attributes[:'exadata_infrastructure_id'] if attributes[:'exadata_infrastructure_id']

      self.is_sparse_diskgroup_enabled = attributes[:'isSparseDiskgroupEnabled'] unless attributes[:'isSparseDiskgroupEnabled'].nil?

      raise 'You cannot provide both :isSparseDiskgroupEnabled and :is_sparse_diskgroup_enabled' if attributes.key?(:'isSparseDiskgroupEnabled') && attributes.key?(:'is_sparse_diskgroup_enabled')

      self.is_sparse_diskgroup_enabled = attributes[:'is_sparse_diskgroup_enabled'] unless attributes[:'is_sparse_diskgroup_enabled'].nil?

      self.vm_cluster_network_id = attributes[:'vmClusterNetworkId'] if attributes[:'vmClusterNetworkId']

      raise 'You cannot provide both :vmClusterNetworkId and :vm_cluster_network_id' if attributes.key?(:'vmClusterNetworkId') && attributes.key?(:'vm_cluster_network_id')

      self.vm_cluster_network_id = attributes[:'vm_cluster_network_id'] if attributes[:'vm_cluster_network_id']

      self.cpus_enabled = attributes[:'cpusEnabled'] if attributes[:'cpusEnabled']

      raise 'You cannot provide both :cpusEnabled and :cpus_enabled' if attributes.key?(:'cpusEnabled') && attributes.key?(:'cpus_enabled')

      self.cpus_enabled = attributes[:'cpus_enabled'] if attributes[:'cpus_enabled']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.db_node_storage_size_in_gbs = attributes[:'dbNodeStorageSizeInGBs'] if attributes[:'dbNodeStorageSizeInGBs']

      raise 'You cannot provide both :dbNodeStorageSizeInGBs and :db_node_storage_size_in_gbs' if attributes.key?(:'dbNodeStorageSizeInGBs') && attributes.key?(:'db_node_storage_size_in_gbs')

      self.db_node_storage_size_in_gbs = attributes[:'db_node_storage_size_in_gbs'] if attributes[:'db_node_storage_size_in_gbs']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.gi_version = attributes[:'giVersion'] if attributes[:'giVersion']

      raise 'You cannot provide both :giVersion and :gi_version' if attributes.key?(:'giVersion') && attributes.key?(:'gi_version')

      self.gi_version = attributes[:'gi_version'] if attributes[:'gi_version']

      self.ssh_public_keys = attributes[:'sshPublicKeys'] if attributes[:'sshPublicKeys']

      raise 'You cannot provide both :sshPublicKeys and :ssh_public_keys' if attributes.key?(:'sshPublicKeys') && attributes.key?(:'ssh_public_keys')

      self.ssh_public_keys = attributes[:'ssh_public_keys'] if attributes[:'ssh_public_keys']

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
        id == other.id &&
        compartment_id == other.compartment_id &&
        last_patch_history_entry_id == other.last_patch_history_entry_id &&
        lifecycle_state == other.lifecycle_state &&
        display_name == other.display_name &&
        time_created == other.time_created &&
        lifecycle_details == other.lifecycle_details &&
        time_zone == other.time_zone &&
        is_local_backup_enabled == other.is_local_backup_enabled &&
        exadata_infrastructure_id == other.exadata_infrastructure_id &&
        is_sparse_diskgroup_enabled == other.is_sparse_diskgroup_enabled &&
        vm_cluster_network_id == other.vm_cluster_network_id &&
        cpus_enabled == other.cpus_enabled &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        db_node_storage_size_in_gbs == other.db_node_storage_size_in_gbs &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        shape == other.shape &&
        gi_version == other.gi_version &&
        ssh_public_keys == other.ssh_public_keys &&
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
      [id, compartment_id, last_patch_history_entry_id, lifecycle_state, display_name, time_created, lifecycle_details, time_zone, is_local_backup_enabled, exadata_infrastructure_id, is_sparse_diskgroup_enabled, vm_cluster_network_id, cpus_enabled, memory_size_in_gbs, db_node_storage_size_in_gbs, data_storage_size_in_tbs, shape, gi_version, ssh_public_keys, license_model, freeform_tags, defined_tags].hash
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
