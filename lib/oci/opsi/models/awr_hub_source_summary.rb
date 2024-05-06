# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Awr hub source object
  class Opsi::Models::AwrHubSourceSummary
    TYPE_ENUM = [
      TYPE_ADW_S = 'ADW_S'.freeze,
      TYPE_ATP_S = 'ATP_S'.freeze,
      TYPE_ADW_D = 'ADW_D'.freeze,
      TYPE_ATP_D = 'ATP_D'.freeze,
      TYPE_EXTERNAL_PDB = 'EXTERNAL_PDB'.freeze,
      TYPE_EXTERNAL_NONCDB = 'EXTERNAL_NONCDB'.freeze,
      TYPE_COMANAGED_VM_CDB = 'COMANAGED_VM_CDB'.freeze,
      TYPE_COMANAGED_VM_PDB = 'COMANAGED_VM_PDB'.freeze,
      TYPE_COMANAGED_VM_NONCDB = 'COMANAGED_VM_NONCDB'.freeze,
      TYPE_COMANAGED_BM_CDB = 'COMANAGED_BM_CDB'.freeze,
      TYPE_COMANAGED_BM_PDB = 'COMANAGED_BM_PDB'.freeze,
      TYPE_COMANAGED_BM_NONCDB = 'COMANAGED_BM_NONCDB'.freeze,
      TYPE_COMANAGED_EXACS_CDB = 'COMANAGED_EXACS_CDB'.freeze,
      TYPE_COMANAGED_EXACS_PDB = 'COMANAGED_EXACS_PDB'.freeze,
      TYPE_COMANAGED_EXACS_NONCDB = 'COMANAGED_EXACS_NONCDB'.freeze,
      TYPE_UNDEFINED = 'UNDEFINED'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ACCEPTING = 'ACCEPTING'.freeze,
      STATUS_NOT_ACCEPTING = 'NOT_ACCEPTING'.freeze,
      STATUS_NOT_REGISTERED = 'NOT_REGISTERED'.freeze,
      STATUS_TERMINATED = 'TERMINATED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the Awr Hub source database.
    # @return [String]
    attr_accessor :name

    # **[Required]** AWR Hub OCID
    # @return [String]
    attr_accessor :awr_hub_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** source type of the database
    # @return [String]
    attr_reader :type

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the Awr Hub source database.
    # @return [String]
    attr_accessor :id

    # **[Required]** The shorted string of the Awr Hub source database identifier.
    # @return [String]
    attr_accessor :awr_hub_opsi_source_id

    # **[Required]** Opsi Mailbox URL based on the Awr Hub and Awr Hub source.
    # @return [String]
    attr_accessor :source_mail_box_url

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database id.
    # @return [String]
    attr_accessor :associated_resource_id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database id.
    # @return [String]
    attr_accessor :associated_opsi_id

    # **[Required]** The time at which the resource was first created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time at which the resource was last updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # This is `true` if the source databse is registered with a Awr Hub, otherwise `false`
    # @return [BOOLEAN]
    attr_accessor :is_registered_with_awr_hub

    # DatabaseId of the Source database for which AWR Data will be uploaded to AWR Hub.
    # @return [String]
    attr_accessor :awr_source_database_id

    # The minimum snapshot identifier of the source database for which AWR data is uploaded to AWR Hub.
    # @return [Float]
    attr_accessor :min_snapshot_identifier

    # The maximum snapshot identifier of the source database for which AWR data is uploaded to AWR Hub.
    # @return [Float]
    attr_accessor :max_snapshot_identifier

    # The time at which the earliest snapshot was generated in the source database for which data is uploaded to AWR Hub. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_first_snapshot_generated

    # The time at which the latest snapshot was generated in the source database for which data is uploaded to AWR Hub. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_last_snapshot_generated

    # Number of hours since last AWR snapshots import happened from the Source database.
    # @return [Float]
    attr_accessor :hours_since_last_import

    # **[Required]** the current state of the source database
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** Indicates the status of a source database in Operations Insights
    # @return [String]
    attr_reader :status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'awr_hub_id': :'awrHubId',
        'compartment_id': :'compartmentId',
        'type': :'type',
        'id': :'id',
        'awr_hub_opsi_source_id': :'awrHubOpsiSourceId',
        'source_mail_box_url': :'sourceMailBoxUrl',
        'associated_resource_id': :'associatedResourceId',
        'associated_opsi_id': :'associatedOpsiId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'is_registered_with_awr_hub': :'isRegisteredWithAwrHub',
        'awr_source_database_id': :'awrSourceDatabaseId',
        'min_snapshot_identifier': :'minSnapshotIdentifier',
        'max_snapshot_identifier': :'maxSnapshotIdentifier',
        'time_first_snapshot_generated': :'timeFirstSnapshotGenerated',
        'time_last_snapshot_generated': :'timeLastSnapshotGenerated',
        'hours_since_last_import': :'hoursSinceLastImport',
        'lifecycle_state': :'lifecycleState',
        'status': :'status'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'awr_hub_id': :'String',
        'compartment_id': :'String',
        'type': :'String',
        'id': :'String',
        'awr_hub_opsi_source_id': :'String',
        'source_mail_box_url': :'String',
        'associated_resource_id': :'String',
        'associated_opsi_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'is_registered_with_awr_hub': :'BOOLEAN',
        'awr_source_database_id': :'String',
        'min_snapshot_identifier': :'Float',
        'max_snapshot_identifier': :'Float',
        'time_first_snapshot_generated': :'DateTime',
        'time_last_snapshot_generated': :'DateTime',
        'hours_since_last_import': :'Float',
        'lifecycle_state': :'String',
        'status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :awr_hub_id The value to assign to the {#awr_hub_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :awr_hub_opsi_source_id The value to assign to the {#awr_hub_opsi_source_id} property
    # @option attributes [String] :source_mail_box_url The value to assign to the {#source_mail_box_url} property
    # @option attributes [String] :associated_resource_id The value to assign to the {#associated_resource_id} property
    # @option attributes [String] :associated_opsi_id The value to assign to the {#associated_opsi_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [BOOLEAN] :is_registered_with_awr_hub The value to assign to the {#is_registered_with_awr_hub} property
    # @option attributes [String] :awr_source_database_id The value to assign to the {#awr_source_database_id} property
    # @option attributes [Float] :min_snapshot_identifier The value to assign to the {#min_snapshot_identifier} property
    # @option attributes [Float] :max_snapshot_identifier The value to assign to the {#max_snapshot_identifier} property
    # @option attributes [DateTime] :time_first_snapshot_generated The value to assign to the {#time_first_snapshot_generated} property
    # @option attributes [DateTime] :time_last_snapshot_generated The value to assign to the {#time_last_snapshot_generated} property
    # @option attributes [Float] :hours_since_last_import The value to assign to the {#hours_since_last_import} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :status The value to assign to the {#status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.awr_hub_id = attributes[:'awrHubId'] if attributes[:'awrHubId']

      raise 'You cannot provide both :awrHubId and :awr_hub_id' if attributes.key?(:'awrHubId') && attributes.key?(:'awr_hub_id')

      self.awr_hub_id = attributes[:'awr_hub_id'] if attributes[:'awr_hub_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.type = attributes[:'type'] if attributes[:'type']

      self.id = attributes[:'id'] if attributes[:'id']

      self.awr_hub_opsi_source_id = attributes[:'awrHubOpsiSourceId'] if attributes[:'awrHubOpsiSourceId']

      raise 'You cannot provide both :awrHubOpsiSourceId and :awr_hub_opsi_source_id' if attributes.key?(:'awrHubOpsiSourceId') && attributes.key?(:'awr_hub_opsi_source_id')

      self.awr_hub_opsi_source_id = attributes[:'awr_hub_opsi_source_id'] if attributes[:'awr_hub_opsi_source_id']

      self.source_mail_box_url = attributes[:'sourceMailBoxUrl'] if attributes[:'sourceMailBoxUrl']

      raise 'You cannot provide both :sourceMailBoxUrl and :source_mail_box_url' if attributes.key?(:'sourceMailBoxUrl') && attributes.key?(:'source_mail_box_url')

      self.source_mail_box_url = attributes[:'source_mail_box_url'] if attributes[:'source_mail_box_url']

      self.associated_resource_id = attributes[:'associatedResourceId'] if attributes[:'associatedResourceId']

      raise 'You cannot provide both :associatedResourceId and :associated_resource_id' if attributes.key?(:'associatedResourceId') && attributes.key?(:'associated_resource_id')

      self.associated_resource_id = attributes[:'associated_resource_id'] if attributes[:'associated_resource_id']

      self.associated_opsi_id = attributes[:'associatedOpsiId'] if attributes[:'associatedOpsiId']

      raise 'You cannot provide both :associatedOpsiId and :associated_opsi_id' if attributes.key?(:'associatedOpsiId') && attributes.key?(:'associated_opsi_id')

      self.associated_opsi_id = attributes[:'associated_opsi_id'] if attributes[:'associated_opsi_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.is_registered_with_awr_hub = attributes[:'isRegisteredWithAwrHub'] unless attributes[:'isRegisteredWithAwrHub'].nil?

      raise 'You cannot provide both :isRegisteredWithAwrHub and :is_registered_with_awr_hub' if attributes.key?(:'isRegisteredWithAwrHub') && attributes.key?(:'is_registered_with_awr_hub')

      self.is_registered_with_awr_hub = attributes[:'is_registered_with_awr_hub'] unless attributes[:'is_registered_with_awr_hub'].nil?

      self.awr_source_database_id = attributes[:'awrSourceDatabaseId'] if attributes[:'awrSourceDatabaseId']

      raise 'You cannot provide both :awrSourceDatabaseId and :awr_source_database_id' if attributes.key?(:'awrSourceDatabaseId') && attributes.key?(:'awr_source_database_id')

      self.awr_source_database_id = attributes[:'awr_source_database_id'] if attributes[:'awr_source_database_id']

      self.min_snapshot_identifier = attributes[:'minSnapshotIdentifier'] if attributes[:'minSnapshotIdentifier']

      raise 'You cannot provide both :minSnapshotIdentifier and :min_snapshot_identifier' if attributes.key?(:'minSnapshotIdentifier') && attributes.key?(:'min_snapshot_identifier')

      self.min_snapshot_identifier = attributes[:'min_snapshot_identifier'] if attributes[:'min_snapshot_identifier']

      self.max_snapshot_identifier = attributes[:'maxSnapshotIdentifier'] if attributes[:'maxSnapshotIdentifier']

      raise 'You cannot provide both :maxSnapshotIdentifier and :max_snapshot_identifier' if attributes.key?(:'maxSnapshotIdentifier') && attributes.key?(:'max_snapshot_identifier')

      self.max_snapshot_identifier = attributes[:'max_snapshot_identifier'] if attributes[:'max_snapshot_identifier']

      self.time_first_snapshot_generated = attributes[:'timeFirstSnapshotGenerated'] if attributes[:'timeFirstSnapshotGenerated']

      raise 'You cannot provide both :timeFirstSnapshotGenerated and :time_first_snapshot_generated' if attributes.key?(:'timeFirstSnapshotGenerated') && attributes.key?(:'time_first_snapshot_generated')

      self.time_first_snapshot_generated = attributes[:'time_first_snapshot_generated'] if attributes[:'time_first_snapshot_generated']

      self.time_last_snapshot_generated = attributes[:'timeLastSnapshotGenerated'] if attributes[:'timeLastSnapshotGenerated']

      raise 'You cannot provide both :timeLastSnapshotGenerated and :time_last_snapshot_generated' if attributes.key?(:'timeLastSnapshotGenerated') && attributes.key?(:'time_last_snapshot_generated')

      self.time_last_snapshot_generated = attributes[:'time_last_snapshot_generated'] if attributes[:'time_last_snapshot_generated']

      self.hours_since_last_import = attributes[:'hoursSinceLastImport'] if attributes[:'hoursSinceLastImport']

      raise 'You cannot provide both :hoursSinceLastImport and :hours_since_last_import' if attributes.key?(:'hoursSinceLastImport') && attributes.key?(:'hours_since_last_import')

      self.hours_since_last_import = attributes[:'hours_since_last_import'] if attributes[:'hours_since_last_import']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.status = attributes[:'status'] if attributes[:'status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
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
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        awr_hub_id == other.awr_hub_id &&
        compartment_id == other.compartment_id &&
        type == other.type &&
        id == other.id &&
        awr_hub_opsi_source_id == other.awr_hub_opsi_source_id &&
        source_mail_box_url == other.source_mail_box_url &&
        associated_resource_id == other.associated_resource_id &&
        associated_opsi_id == other.associated_opsi_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        is_registered_with_awr_hub == other.is_registered_with_awr_hub &&
        awr_source_database_id == other.awr_source_database_id &&
        min_snapshot_identifier == other.min_snapshot_identifier &&
        max_snapshot_identifier == other.max_snapshot_identifier &&
        time_first_snapshot_generated == other.time_first_snapshot_generated &&
        time_last_snapshot_generated == other.time_last_snapshot_generated &&
        hours_since_last_import == other.hours_since_last_import &&
        lifecycle_state == other.lifecycle_state &&
        status == other.status
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
      [name, awr_hub_id, compartment_id, type, id, awr_hub_opsi_source_id, source_mail_box_url, associated_resource_id, associated_opsi_id, time_created, time_updated, freeform_tags, defined_tags, system_tags, is_registered_with_awr_hub, awr_source_database_id, min_snapshot_identifier, max_snapshot_identifier, time_first_snapshot_generated, time_last_snapshot_generated, hours_since_last_import, lifecycle_state, status].hash
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