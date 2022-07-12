# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # an external Oracle pluggable database.
  class Database::Models::ExternalPluggableDatabase
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_NOT_CONNECTED = 'NOT_CONNECTED'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_EDITION_ENUM = [
      DATABASE_EDITION_STANDARD_EDITION = 'STANDARD_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION = 'ENTERPRISE_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_HIGH_PERFORMANCE = 'ENTERPRISE_EDITION_HIGH_PERFORMANCE'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_EXTREME_PERFORMANCE = 'ENTERPRISE_EDITION_EXTREME_PERFORMANCE'.freeze,
      DATABASE_EDITION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_CONFIGURATION_ENUM = [
      DATABASE_CONFIGURATION_RAC = 'RAC'.freeze,
      DATABASE_CONFIGURATION_SINGLE_INSTANCE = 'SINGLE_INSTANCE'.freeze,
      DATABASE_CONFIGURATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the the non-container database that was converted
    # to a pluggable database to create this resource.
    #
    # @return [String]
    attr_accessor :source_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the
    # {#create_external_container_database_details create_external_container_database_details} that contains
    # the specified {#create_external_pluggable_database_details create_external_pluggable_database_details} resource.
    #
    # @return [String]
    attr_accessor :external_container_database_id

    # @return [OCI::Database::Models::OperationsInsightsConfig]
    attr_accessor :operations_insights_config

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

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

    # **[Required]** The user-friendly name for the external database. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure external database resource.
    #
    # @return [String]
    attr_accessor :id

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The current state of the Oracle Cloud Infrastructure external database resource.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The date and time the database was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The `DB_UNIQUE_NAME` of the external database.
    # @return [String]
    attr_accessor :db_unique_name

    # The Oracle Database ID, which identifies an Oracle Database located outside of Oracle Cloud.
    #
    # @return [String]
    attr_accessor :db_id

    # The Oracle Database version.
    # @return [String]
    attr_accessor :database_version

    # The Oracle Database edition.
    #
    # @return [String]
    attr_reader :database_edition

    # The time zone of the external database.
    # It is a time zone offset (a character type in the format '[+|-]TZH:TZM') or a time zone region name,
    # depending on how the time zone value was specified when the database was created / last altered.
    #
    # @return [String]
    attr_accessor :time_zone

    # The character set of the external database.
    # @return [String]
    attr_accessor :character_set

    # The national character of the external database.
    # @return [String]
    attr_accessor :ncharacter_set

    # The database packs licensed for the external Oracle Database.
    # @return [String]
    attr_accessor :db_packs

    # The Oracle Database configuration
    # @return [String]
    attr_reader :database_configuration

    # @return [OCI::Database::Models::DatabaseManagementConfig]
    attr_accessor :database_management_config

    # @return [OCI::Database::Models::StackMonitoringConfig]
    attr_accessor :stack_monitoring_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_id': :'sourceId',
        'external_container_database_id': :'externalContainerDatabaseId',
        'operations_insights_config': :'operationsInsightsConfig',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'id': :'id',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'db_unique_name': :'dbUniqueName',
        'db_id': :'dbId',
        'database_version': :'databaseVersion',
        'database_edition': :'databaseEdition',
        'time_zone': :'timeZone',
        'character_set': :'characterSet',
        'ncharacter_set': :'ncharacterSet',
        'db_packs': :'dbPacks',
        'database_configuration': :'databaseConfiguration',
        'database_management_config': :'databaseManagementConfig',
        'stack_monitoring_config': :'stackMonitoringConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_id': :'String',
        'external_container_database_id': :'String',
        'operations_insights_config': :'OCI::Database::Models::OperationsInsightsConfig',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'id': :'String',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'db_unique_name': :'String',
        'db_id': :'String',
        'database_version': :'String',
        'database_edition': :'String',
        'time_zone': :'String',
        'character_set': :'String',
        'ncharacter_set': :'String',
        'db_packs': :'String',
        'database_configuration': :'String',
        'database_management_config': :'OCI::Database::Models::DatabaseManagementConfig',
        'stack_monitoring_config': :'OCI::Database::Models::StackMonitoringConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :external_container_database_id The value to assign to the {#external_container_database_id} property
    # @option attributes [OCI::Database::Models::OperationsInsightsConfig] :operations_insights_config The value to assign to the {#operations_insights_config} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :db_unique_name The value to assign to the {#db_unique_name} property
    # @option attributes [String] :db_id The value to assign to the {#db_id} property
    # @option attributes [String] :database_version The value to assign to the {#database_version} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [String] :character_set The value to assign to the {#character_set} property
    # @option attributes [String] :ncharacter_set The value to assign to the {#ncharacter_set} property
    # @option attributes [String] :db_packs The value to assign to the {#db_packs} property
    # @option attributes [String] :database_configuration The value to assign to the {#database_configuration} property
    # @option attributes [OCI::Database::Models::DatabaseManagementConfig] :database_management_config The value to assign to the {#database_management_config} property
    # @option attributes [OCI::Database::Models::StackMonitoringConfig] :stack_monitoring_config The value to assign to the {#stack_monitoring_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.external_container_database_id = attributes[:'externalContainerDatabaseId'] if attributes[:'externalContainerDatabaseId']

      raise 'You cannot provide both :externalContainerDatabaseId and :external_container_database_id' if attributes.key?(:'externalContainerDatabaseId') && attributes.key?(:'external_container_database_id')

      self.external_container_database_id = attributes[:'external_container_database_id'] if attributes[:'external_container_database_id']

      self.operations_insights_config = attributes[:'operationsInsightsConfig'] if attributes[:'operationsInsightsConfig']

      raise 'You cannot provide both :operationsInsightsConfig and :operations_insights_config' if attributes.key?(:'operationsInsightsConfig') && attributes.key?(:'operations_insights_config')

      self.operations_insights_config = attributes[:'operations_insights_config'] if attributes[:'operations_insights_config']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.db_unique_name = attributes[:'dbUniqueName'] if attributes[:'dbUniqueName']

      raise 'You cannot provide both :dbUniqueName and :db_unique_name' if attributes.key?(:'dbUniqueName') && attributes.key?(:'db_unique_name')

      self.db_unique_name = attributes[:'db_unique_name'] if attributes[:'db_unique_name']

      self.db_id = attributes[:'dbId'] if attributes[:'dbId']

      raise 'You cannot provide both :dbId and :db_id' if attributes.key?(:'dbId') && attributes.key?(:'db_id')

      self.db_id = attributes[:'db_id'] if attributes[:'db_id']

      self.database_version = attributes[:'databaseVersion'] if attributes[:'databaseVersion']

      raise 'You cannot provide both :databaseVersion and :database_version' if attributes.key?(:'databaseVersion') && attributes.key?(:'database_version')

      self.database_version = attributes[:'database_version'] if attributes[:'database_version']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.character_set = attributes[:'characterSet'] if attributes[:'characterSet']

      raise 'You cannot provide both :characterSet and :character_set' if attributes.key?(:'characterSet') && attributes.key?(:'character_set')

      self.character_set = attributes[:'character_set'] if attributes[:'character_set']

      self.ncharacter_set = attributes[:'ncharacterSet'] if attributes[:'ncharacterSet']

      raise 'You cannot provide both :ncharacterSet and :ncharacter_set' if attributes.key?(:'ncharacterSet') && attributes.key?(:'ncharacter_set')

      self.ncharacter_set = attributes[:'ncharacter_set'] if attributes[:'ncharacter_set']

      self.db_packs = attributes[:'dbPacks'] if attributes[:'dbPacks']

      raise 'You cannot provide both :dbPacks and :db_packs' if attributes.key?(:'dbPacks') && attributes.key?(:'db_packs')

      self.db_packs = attributes[:'db_packs'] if attributes[:'db_packs']

      self.database_configuration = attributes[:'databaseConfiguration'] if attributes[:'databaseConfiguration']

      raise 'You cannot provide both :databaseConfiguration and :database_configuration' if attributes.key?(:'databaseConfiguration') && attributes.key?(:'database_configuration')

      self.database_configuration = attributes[:'database_configuration'] if attributes[:'database_configuration']

      self.database_management_config = attributes[:'databaseManagementConfig'] if attributes[:'databaseManagementConfig']

      raise 'You cannot provide both :databaseManagementConfig and :database_management_config' if attributes.key?(:'databaseManagementConfig') && attributes.key?(:'database_management_config')

      self.database_management_config = attributes[:'database_management_config'] if attributes[:'database_management_config']

      self.stack_monitoring_config = attributes[:'stackMonitoringConfig'] if attributes[:'stackMonitoringConfig']

      raise 'You cannot provide both :stackMonitoringConfig and :stack_monitoring_config' if attributes.key?(:'stackMonitoringConfig') && attributes.key?(:'stack_monitoring_config')

      self.stack_monitoring_config = attributes[:'stack_monitoring_config'] if attributes[:'stack_monitoring_config']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_configuration Object to be assigned
    def database_configuration=(database_configuration)
      # rubocop:disable Style/ConditionalAssignment
      if database_configuration && !DATABASE_CONFIGURATION_ENUM.include?(database_configuration)
        OCI.logger.debug("Unknown value for 'database_configuration' [" + database_configuration + "]. Mapping to 'DATABASE_CONFIGURATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_configuration = DATABASE_CONFIGURATION_UNKNOWN_ENUM_VALUE
      else
        @database_configuration = database_configuration
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_id == other.source_id &&
        external_container_database_id == other.external_container_database_id &&
        operations_insights_config == other.operations_insights_config &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        id == other.id &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        db_unique_name == other.db_unique_name &&
        db_id == other.db_id &&
        database_version == other.database_version &&
        database_edition == other.database_edition &&
        time_zone == other.time_zone &&
        character_set == other.character_set &&
        ncharacter_set == other.ncharacter_set &&
        db_packs == other.db_packs &&
        database_configuration == other.database_configuration &&
        database_management_config == other.database_management_config &&
        stack_monitoring_config == other.stack_monitoring_config
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
      [source_id, external_container_database_id, operations_insights_config, compartment_id, freeform_tags, defined_tags, display_name, id, lifecycle_details, lifecycle_state, time_created, db_unique_name, db_id, database_version, database_edition, time_zone, character_set, ncharacter_set, db_packs, database_configuration, database_management_config, stack_monitoring_config].hash
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
