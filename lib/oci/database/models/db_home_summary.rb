# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A directory where Oracle Database software is installed. A bare metal or Exadata DB system can have multiple Database Homes
  # and each Database Home can run a different supported version of Oracle Database. A virtual machine DB system can have only one Database Home.
  # For more information, see [Bare Metal and Virtual Machine DB Systems](https://docs.cloud.oracle.com/Content/Database/Concepts/overview.htm) and [Exadata DB Systems](https://docs.cloud.oracle.com/Content/Database/Concepts/exaoverview.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an
  # administrator. If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::DbHomeSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Home.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-provided name for the Database Home. The name does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last patch history. This value is updated as soon as a patch operation is started.
    # @return [String]
    attr_accessor :last_patch_history_entry_id

    # **[Required]** The current state of the Database Home.
    # @return [String]
    attr_reader :lifecycle_state

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DB system.
    # @return [String]
    attr_accessor :db_system_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM cluster.
    # @return [String]
    attr_accessor :vm_cluster_id

    # **[Required]** The Oracle Database version.
    # @return [String]
    attr_accessor :db_version

    # **[Required]** The location of the Oracle Database Home.
    # @return [String]
    attr_accessor :db_home_location

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The date and time the Database Home was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations.
    # @return [String]
    attr_accessor :kms_key_id

    # List of one-off patches for Database Homes.
    # @return [Array<String>]
    attr_accessor :one_off_patches

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

    # The database software image [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :database_software_image_id

    # Indicates whether unified autiding is enabled or not.
    # @return [BOOLEAN]
    attr_accessor :is_unified_auditing_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'last_patch_history_entry_id': :'lastPatchHistoryEntryId',
        'lifecycle_state': :'lifecycleState',
        'db_system_id': :'dbSystemId',
        'vm_cluster_id': :'vmClusterId',
        'db_version': :'dbVersion',
        'db_home_location': :'dbHomeLocation',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'kms_key_id': :'kmsKeyId',
        'one_off_patches': :'oneOffPatches',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'database_software_image_id': :'databaseSoftwareImageId',
        'is_unified_auditing_enabled': :'isUnifiedAuditingEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'last_patch_history_entry_id': :'String',
        'lifecycle_state': :'String',
        'db_system_id': :'String',
        'vm_cluster_id': :'String',
        'db_version': :'String',
        'db_home_location': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'kms_key_id': :'String',
        'one_off_patches': :'Array<String>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'database_software_image_id': :'String',
        'is_unified_auditing_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :last_patch_history_entry_id The value to assign to the {#last_patch_history_entry_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :vm_cluster_id The value to assign to the {#vm_cluster_id} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :db_home_location The value to assign to the {#db_home_location} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [Array<String>] :one_off_patches The value to assign to the {#one_off_patches} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :database_software_image_id The value to assign to the {#database_software_image_id} property
    # @option attributes [BOOLEAN] :is_unified_auditing_enabled The value to assign to the {#is_unified_auditing_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.last_patch_history_entry_id = attributes[:'lastPatchHistoryEntryId'] if attributes[:'lastPatchHistoryEntryId']

      raise 'You cannot provide both :lastPatchHistoryEntryId and :last_patch_history_entry_id' if attributes.key?(:'lastPatchHistoryEntryId') && attributes.key?(:'last_patch_history_entry_id')

      self.last_patch_history_entry_id = attributes[:'last_patch_history_entry_id'] if attributes[:'last_patch_history_entry_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.vm_cluster_id = attributes[:'vmClusterId'] if attributes[:'vmClusterId']

      raise 'You cannot provide both :vmClusterId and :vm_cluster_id' if attributes.key?(:'vmClusterId') && attributes.key?(:'vm_cluster_id')

      self.vm_cluster_id = attributes[:'vm_cluster_id'] if attributes[:'vm_cluster_id']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.db_home_location = attributes[:'dbHomeLocation'] if attributes[:'dbHomeLocation']

      raise 'You cannot provide both :dbHomeLocation and :db_home_location' if attributes.key?(:'dbHomeLocation') && attributes.key?(:'db_home_location')

      self.db_home_location = attributes[:'db_home_location'] if attributes[:'db_home_location']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.one_off_patches = attributes[:'oneOffPatches'] if attributes[:'oneOffPatches']

      raise 'You cannot provide both :oneOffPatches and :one_off_patches' if attributes.key?(:'oneOffPatches') && attributes.key?(:'one_off_patches')

      self.one_off_patches = attributes[:'one_off_patches'] if attributes[:'one_off_patches']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.database_software_image_id = attributes[:'databaseSoftwareImageId'] if attributes[:'databaseSoftwareImageId']

      raise 'You cannot provide both :databaseSoftwareImageId and :database_software_image_id' if attributes.key?(:'databaseSoftwareImageId') && attributes.key?(:'database_software_image_id')

      self.database_software_image_id = attributes[:'database_software_image_id'] if attributes[:'database_software_image_id']

      self.is_unified_auditing_enabled = attributes[:'isUnifiedAuditingEnabled'] unless attributes[:'isUnifiedAuditingEnabled'].nil?

      raise 'You cannot provide both :isUnifiedAuditingEnabled and :is_unified_auditing_enabled' if attributes.key?(:'isUnifiedAuditingEnabled') && attributes.key?(:'is_unified_auditing_enabled')

      self.is_unified_auditing_enabled = attributes[:'is_unified_auditing_enabled'] unless attributes[:'is_unified_auditing_enabled'].nil?
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
        display_name == other.display_name &&
        last_patch_history_entry_id == other.last_patch_history_entry_id &&
        lifecycle_state == other.lifecycle_state &&
        db_system_id == other.db_system_id &&
        vm_cluster_id == other.vm_cluster_id &&
        db_version == other.db_version &&
        db_home_location == other.db_home_location &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        kms_key_id == other.kms_key_id &&
        one_off_patches == other.one_off_patches &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        database_software_image_id == other.database_software_image_id &&
        is_unified_auditing_enabled == other.is_unified_auditing_enabled
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
      [id, compartment_id, display_name, last_patch_history_entry_id, lifecycle_state, db_system_id, vm_cluster_id, db_version, db_home_location, lifecycle_details, time_created, kms_key_id, one_off_patches, freeform_tags, defined_tags, database_software_image_id, is_unified_auditing_enabled].hash
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
