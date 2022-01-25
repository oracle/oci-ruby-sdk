# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Create Migration resource parameters.
  #
  class DatabaseMigration::Models::CreateMigrationDetails
    TYPE_ENUM = [
      TYPE_ONLINE = 'ONLINE'.freeze,
      TYPE_OFFLINE = 'OFFLINE'.freeze
    ].freeze

    # **[Required]** Migration type.
    #
    # @return [String]
    attr_reader :type

    # Migration Display Name
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** OCID of the compartment
    #
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the registered ODMS Agent. Only valid for Offline Logical Migrations.
    #
    # @return [String]
    attr_accessor :agent_id

    # **[Required]** The OCID of the Source Database Connection.
    #
    # @return [String]
    attr_accessor :source_database_connection_id

    # The OCID of the Source Container Database Connection. Only used for Online migrations.
    # Only Connections of type Non-Autonomous can be used as source container databases.
    #
    # @return [String]
    attr_accessor :source_container_database_connection_id

    # **[Required]** The OCID of the Target Database Connection.
    #
    # @return [String]
    attr_accessor :target_database_connection_id

    # @return [OCI::DatabaseMigration::Models::CreateDataTransferMediumDetails]
    attr_accessor :data_transfer_medium_details

    # @return [OCI::DatabaseMigration::Models::CreateDumpTransferDetails]
    attr_accessor :dump_transfer_details

    # @return [OCI::DatabaseMigration::Models::CreateDataPumpSettings]
    attr_accessor :datapump_settings

    # @return [OCI::DatabaseMigration::Models::CreateAdvisorSettings]
    attr_accessor :advisor_settings

    # Database objects to exclude from migration, cannot be specified alongside 'includeObjects'
    #
    # @return [Array<OCI::DatabaseMigration::Models::DatabaseObject>]
    attr_accessor :exclude_objects

    # Database objects to include from migration, cannot be specified alongside 'excludeObjects'
    #
    # @return [Array<OCI::DatabaseMigration::Models::DatabaseObject>]
    attr_accessor :include_objects

    # @return [OCI::DatabaseMigration::Models::CreateGoldenGateDetails]
    attr_accessor :golden_gate_details

    # @return [OCI::DatabaseMigration::Models::CreateVaultDetails]
    attr_accessor :vault_details

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

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'agent_id': :'agentId',
        'source_database_connection_id': :'sourceDatabaseConnectionId',
        'source_container_database_connection_id': :'sourceContainerDatabaseConnectionId',
        'target_database_connection_id': :'targetDatabaseConnectionId',
        'data_transfer_medium_details': :'dataTransferMediumDetails',
        'dump_transfer_details': :'dumpTransferDetails',
        'datapump_settings': :'datapumpSettings',
        'advisor_settings': :'advisorSettings',
        'exclude_objects': :'excludeObjects',
        'include_objects': :'includeObjects',
        'golden_gate_details': :'goldenGateDetails',
        'vault_details': :'vaultDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'agent_id': :'String',
        'source_database_connection_id': :'String',
        'source_container_database_connection_id': :'String',
        'target_database_connection_id': :'String',
        'data_transfer_medium_details': :'OCI::DatabaseMigration::Models::CreateDataTransferMediumDetails',
        'dump_transfer_details': :'OCI::DatabaseMigration::Models::CreateDumpTransferDetails',
        'datapump_settings': :'OCI::DatabaseMigration::Models::CreateDataPumpSettings',
        'advisor_settings': :'OCI::DatabaseMigration::Models::CreateAdvisorSettings',
        'exclude_objects': :'Array<OCI::DatabaseMigration::Models::DatabaseObject>',
        'include_objects': :'Array<OCI::DatabaseMigration::Models::DatabaseObject>',
        'golden_gate_details': :'OCI::DatabaseMigration::Models::CreateGoldenGateDetails',
        'vault_details': :'OCI::DatabaseMigration::Models::CreateVaultDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :agent_id The value to assign to the {#agent_id} property
    # @option attributes [String] :source_database_connection_id The value to assign to the {#source_database_connection_id} property
    # @option attributes [String] :source_container_database_connection_id The value to assign to the {#source_container_database_connection_id} property
    # @option attributes [String] :target_database_connection_id The value to assign to the {#target_database_connection_id} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateDataTransferMediumDetails] :data_transfer_medium_details The value to assign to the {#data_transfer_medium_details} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateDumpTransferDetails] :dump_transfer_details The value to assign to the {#dump_transfer_details} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateDataPumpSettings] :datapump_settings The value to assign to the {#datapump_settings} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateAdvisorSettings] :advisor_settings The value to assign to the {#advisor_settings} property
    # @option attributes [Array<OCI::DatabaseMigration::Models::DatabaseObject>] :exclude_objects The value to assign to the {#exclude_objects} property
    # @option attributes [Array<OCI::DatabaseMigration::Models::DatabaseObject>] :include_objects The value to assign to the {#include_objects} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateGoldenGateDetails] :golden_gate_details The value to assign to the {#golden_gate_details} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateVaultDetails] :vault_details The value to assign to the {#vault_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.agent_id = attributes[:'agentId'] if attributes[:'agentId']

      raise 'You cannot provide both :agentId and :agent_id' if attributes.key?(:'agentId') && attributes.key?(:'agent_id')

      self.agent_id = attributes[:'agent_id'] if attributes[:'agent_id']

      self.source_database_connection_id = attributes[:'sourceDatabaseConnectionId'] if attributes[:'sourceDatabaseConnectionId']

      raise 'You cannot provide both :sourceDatabaseConnectionId and :source_database_connection_id' if attributes.key?(:'sourceDatabaseConnectionId') && attributes.key?(:'source_database_connection_id')

      self.source_database_connection_id = attributes[:'source_database_connection_id'] if attributes[:'source_database_connection_id']

      self.source_container_database_connection_id = attributes[:'sourceContainerDatabaseConnectionId'] if attributes[:'sourceContainerDatabaseConnectionId']

      raise 'You cannot provide both :sourceContainerDatabaseConnectionId and :source_container_database_connection_id' if attributes.key?(:'sourceContainerDatabaseConnectionId') && attributes.key?(:'source_container_database_connection_id')

      self.source_container_database_connection_id = attributes[:'source_container_database_connection_id'] if attributes[:'source_container_database_connection_id']

      self.target_database_connection_id = attributes[:'targetDatabaseConnectionId'] if attributes[:'targetDatabaseConnectionId']

      raise 'You cannot provide both :targetDatabaseConnectionId and :target_database_connection_id' if attributes.key?(:'targetDatabaseConnectionId') && attributes.key?(:'target_database_connection_id')

      self.target_database_connection_id = attributes[:'target_database_connection_id'] if attributes[:'target_database_connection_id']

      self.data_transfer_medium_details = attributes[:'dataTransferMediumDetails'] if attributes[:'dataTransferMediumDetails']

      raise 'You cannot provide both :dataTransferMediumDetails and :data_transfer_medium_details' if attributes.key?(:'dataTransferMediumDetails') && attributes.key?(:'data_transfer_medium_details')

      self.data_transfer_medium_details = attributes[:'data_transfer_medium_details'] if attributes[:'data_transfer_medium_details']

      self.dump_transfer_details = attributes[:'dumpTransferDetails'] if attributes[:'dumpTransferDetails']

      raise 'You cannot provide both :dumpTransferDetails and :dump_transfer_details' if attributes.key?(:'dumpTransferDetails') && attributes.key?(:'dump_transfer_details')

      self.dump_transfer_details = attributes[:'dump_transfer_details'] if attributes[:'dump_transfer_details']

      self.datapump_settings = attributes[:'datapumpSettings'] if attributes[:'datapumpSettings']

      raise 'You cannot provide both :datapumpSettings and :datapump_settings' if attributes.key?(:'datapumpSettings') && attributes.key?(:'datapump_settings')

      self.datapump_settings = attributes[:'datapump_settings'] if attributes[:'datapump_settings']

      self.advisor_settings = attributes[:'advisorSettings'] if attributes[:'advisorSettings']

      raise 'You cannot provide both :advisorSettings and :advisor_settings' if attributes.key?(:'advisorSettings') && attributes.key?(:'advisor_settings')

      self.advisor_settings = attributes[:'advisor_settings'] if attributes[:'advisor_settings']

      self.exclude_objects = attributes[:'excludeObjects'] if attributes[:'excludeObjects']

      raise 'You cannot provide both :excludeObjects and :exclude_objects' if attributes.key?(:'excludeObjects') && attributes.key?(:'exclude_objects')

      self.exclude_objects = attributes[:'exclude_objects'] if attributes[:'exclude_objects']

      self.include_objects = attributes[:'includeObjects'] if attributes[:'includeObjects']

      raise 'You cannot provide both :includeObjects and :include_objects' if attributes.key?(:'includeObjects') && attributes.key?(:'include_objects')

      self.include_objects = attributes[:'include_objects'] if attributes[:'include_objects']

      self.golden_gate_details = attributes[:'goldenGateDetails'] if attributes[:'goldenGateDetails']

      raise 'You cannot provide both :goldenGateDetails and :golden_gate_details' if attributes.key?(:'goldenGateDetails') && attributes.key?(:'golden_gate_details')

      self.golden_gate_details = attributes[:'golden_gate_details'] if attributes[:'golden_gate_details']

      self.vault_details = attributes[:'vaultDetails'] if attributes[:'vaultDetails']

      raise 'You cannot provide both :vaultDetails and :vault_details' if attributes.key?(:'vaultDetails') && attributes.key?(:'vault_details')

      self.vault_details = attributes[:'vault_details'] if attributes[:'vault_details']

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
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        agent_id == other.agent_id &&
        source_database_connection_id == other.source_database_connection_id &&
        source_container_database_connection_id == other.source_container_database_connection_id &&
        target_database_connection_id == other.target_database_connection_id &&
        data_transfer_medium_details == other.data_transfer_medium_details &&
        dump_transfer_details == other.dump_transfer_details &&
        datapump_settings == other.datapump_settings &&
        advisor_settings == other.advisor_settings &&
        exclude_objects == other.exclude_objects &&
        include_objects == other.include_objects &&
        golden_gate_details == other.golden_gate_details &&
        vault_details == other.vault_details &&
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
      [type, display_name, compartment_id, agent_id, source_database_connection_id, source_container_database_connection_id, target_database_connection_id, data_transfer_medium_details, dump_transfer_details, datapump_settings, advisor_settings, exclude_objects, include_objects, golden_gate_details, vault_details, freeform_tags, defined_tags].hash
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
