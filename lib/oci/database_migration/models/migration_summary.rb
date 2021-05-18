# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Migration resource
  #
  class DatabaseMigration::Models::MigrationSummary
    TYPE_ENUM = [
      TYPE_ONLINE = 'ONLINE'.freeze,
      TYPE_OFFLINE = 'OFFLINE'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_DETAILS_ENUM = [
      LIFECYCLE_DETAILS_READY = 'READY'.freeze,
      LIFECYCLE_DETAILS_ABORTING = 'ABORTING'.freeze,
      LIFECYCLE_DETAILS_VALIDATING = 'VALIDATING'.freeze,
      LIFECYCLE_DETAILS_VALIDATED = 'VALIDATED'.freeze,
      LIFECYCLE_DETAILS_WAITING = 'WAITING'.freeze,
      LIFECYCLE_DETAILS_MIGRATING = 'MIGRATING'.freeze,
      LIFECYCLE_DETAILS_DONE = 'DONE'.freeze,
      LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the resource
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Migration Display Name
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** OCID of the compartment
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Migration type.
    #
    # @return [String]
    attr_reader :type

    # **[Required]** The OCID of the Source Database Connection.
    #
    # @return [String]
    attr_accessor :source_database_connection_id

    # The OCID of the Source Container Database Connection.
    #
    # @return [String]
    attr_accessor :source_container_database_connection_id

    # **[Required]** The OCID of the Target Database Connection.
    #
    # @return [String]
    attr_accessor :target_database_connection_id

    # OCID of the current ODMS Job in execution for the Migration, if any.
    #
    # @return [String]
    attr_accessor :executing_job_id

    # The OCID of the registered on-premises ODMS Agent. Only valid for Offline Migrations.
    #
    # @return [String]
    attr_accessor :agent_id

    # @return [OCI::DatabaseMigration::Models::VaultDetails]
    attr_accessor :vault_details

    # **[Required]** The time the Migration was created. An RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time of the last Migration details update. An RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The time of last Migration. An RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_last_migration

    # **[Required]** The current state of the Migration.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Additional status related to the execution and current state of the Migration.
    #
    # @return [String]
    attr_reader :lifecycle_details

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

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'type': :'type',
        'source_database_connection_id': :'sourceDatabaseConnectionId',
        'source_container_database_connection_id': :'sourceContainerDatabaseConnectionId',
        'target_database_connection_id': :'targetDatabaseConnectionId',
        'executing_job_id': :'executingJobId',
        'agent_id': :'agentId',
        'vault_details': :'vaultDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_last_migration': :'timeLastMigration',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'type': :'String',
        'source_database_connection_id': :'String',
        'source_container_database_connection_id': :'String',
        'target_database_connection_id': :'String',
        'executing_job_id': :'String',
        'agent_id': :'String',
        'vault_details': :'OCI::DatabaseMigration::Models::VaultDetails',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_last_migration': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :source_database_connection_id The value to assign to the {#source_database_connection_id} property
    # @option attributes [String] :source_container_database_connection_id The value to assign to the {#source_container_database_connection_id} property
    # @option attributes [String] :target_database_connection_id The value to assign to the {#target_database_connection_id} property
    # @option attributes [String] :executing_job_id The value to assign to the {#executing_job_id} property
    # @option attributes [String] :agent_id The value to assign to the {#agent_id} property
    # @option attributes [OCI::DatabaseMigration::Models::VaultDetails] :vault_details The value to assign to the {#vault_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [DateTime] :time_last_migration The value to assign to the {#time_last_migration} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.type = attributes[:'type'] if attributes[:'type']

      self.source_database_connection_id = attributes[:'sourceDatabaseConnectionId'] if attributes[:'sourceDatabaseConnectionId']

      raise 'You cannot provide both :sourceDatabaseConnectionId and :source_database_connection_id' if attributes.key?(:'sourceDatabaseConnectionId') && attributes.key?(:'source_database_connection_id')

      self.source_database_connection_id = attributes[:'source_database_connection_id'] if attributes[:'source_database_connection_id']

      self.source_container_database_connection_id = attributes[:'sourceContainerDatabaseConnectionId'] if attributes[:'sourceContainerDatabaseConnectionId']

      raise 'You cannot provide both :sourceContainerDatabaseConnectionId and :source_container_database_connection_id' if attributes.key?(:'sourceContainerDatabaseConnectionId') && attributes.key?(:'source_container_database_connection_id')

      self.source_container_database_connection_id = attributes[:'source_container_database_connection_id'] if attributes[:'source_container_database_connection_id']

      self.target_database_connection_id = attributes[:'targetDatabaseConnectionId'] if attributes[:'targetDatabaseConnectionId']

      raise 'You cannot provide both :targetDatabaseConnectionId and :target_database_connection_id' if attributes.key?(:'targetDatabaseConnectionId') && attributes.key?(:'target_database_connection_id')

      self.target_database_connection_id = attributes[:'target_database_connection_id'] if attributes[:'target_database_connection_id']

      self.executing_job_id = attributes[:'executingJobId'] if attributes[:'executingJobId']

      raise 'You cannot provide both :executingJobId and :executing_job_id' if attributes.key?(:'executingJobId') && attributes.key?(:'executing_job_id')

      self.executing_job_id = attributes[:'executing_job_id'] if attributes[:'executing_job_id']

      self.agent_id = attributes[:'agentId'] if attributes[:'agentId']

      raise 'You cannot provide both :agentId and :agent_id' if attributes.key?(:'agentId') && attributes.key?(:'agent_id')

      self.agent_id = attributes[:'agent_id'] if attributes[:'agent_id']

      self.vault_details = attributes[:'vaultDetails'] if attributes[:'vaultDetails']

      raise 'You cannot provide both :vaultDetails and :vault_details' if attributes.key?(:'vaultDetails') && attributes.key?(:'vault_details')

      self.vault_details = attributes[:'vault_details'] if attributes[:'vault_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.time_last_migration = attributes[:'timeLastMigration'] if attributes[:'timeLastMigration']

      raise 'You cannot provide both :timeLastMigration and :time_last_migration' if attributes.key?(:'timeLastMigration') && attributes.key?(:'time_last_migration')

      self.time_last_migration = attributes[:'time_last_migration'] if attributes[:'time_last_migration']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
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
    # @param [Object] lifecycle_details Object to be assigned
    def lifecycle_details=(lifecycle_details)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_details && !LIFECYCLE_DETAILS_ENUM.include?(lifecycle_details)
        OCI.logger.debug("Unknown value for 'lifecycle_details' [" + lifecycle_details + "]. Mapping to 'LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_details = LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_details = lifecycle_details
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
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        type == other.type &&
        source_database_connection_id == other.source_database_connection_id &&
        source_container_database_connection_id == other.source_container_database_connection_id &&
        target_database_connection_id == other.target_database_connection_id &&
        executing_job_id == other.executing_job_id &&
        agent_id == other.agent_id &&
        vault_details == other.vault_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_last_migration == other.time_last_migration &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, display_name, compartment_id, type, source_database_connection_id, source_container_database_connection_id, target_database_connection_id, executing_job_id, agent_id, vault_details, time_created, time_updated, time_last_migration, lifecycle_state, lifecycle_details, freeform_tags, defined_tags, system_tags].hash
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
