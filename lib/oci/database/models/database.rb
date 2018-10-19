# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # An Oracle database on a bare metal or virtual machine DB system. For more information, see [Bare Metal and Virtual Machine DB Systems](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/Concepts/overview.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::Database # rubocop:disable Metrics/LineLength
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_RESTORE_FAILED = 'RESTORE_FAILED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The character set for the database.
    # @return [String]
    attr_accessor :character_set

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # @return [OCI::Database::Models::DbBackupConfig]
    attr_accessor :db_backup_config

    # The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the database home.
    # @return [String]
    attr_accessor :db_home_id

    # **[Required]** The database name.
    # @return [String]
    attr_accessor :db_name

    # **[Required]** A system-generated name for the database to ensure uniqueness within an Oracle Data Guard group (a primary database and its standby databases). The unique name cannot be changed.
    #
    # @return [String]
    attr_accessor :db_unique_name

    # The database workload type.
    # @return [String]
    attr_accessor :db_workload

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :id

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The current state of the database.
    # @return [String]
    attr_reader :lifecycle_state

    # The national character set for the database.
    # @return [String]
    attr_accessor :ncharacter_set

    # The name of the pluggable database. The name must begin with an alphabetic character and can contain a maximum of eight alphanumeric characters. Special characters are not permitted. Pluggable database should not be same as database name.
    # @return [String]
    attr_accessor :pdb_name

    # The date and time the database was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'character_set': :'characterSet',
        'compartment_id': :'compartmentId',
        'db_backup_config': :'dbBackupConfig',
        'db_home_id': :'dbHomeId',
        'db_name': :'dbName',
        'db_unique_name': :'dbUniqueName',
        'db_workload': :'dbWorkload',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'ncharacter_set': :'ncharacterSet',
        'pdb_name': :'pdbName',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'character_set': :'String',
        'compartment_id': :'String',
        'db_backup_config': :'OCI::Database::Models::DbBackupConfig',
        'db_home_id': :'String',
        'db_name': :'String',
        'db_unique_name': :'String',
        'db_workload': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'ncharacter_set': :'String',
        'pdb_name': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :character_set The value to assign to the {#character_set} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::Database::Models::DbBackupConfig] :db_backup_config The value to assign to the {#db_backup_config} property
    # @option attributes [String] :db_home_id The value to assign to the {#db_home_id} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [String] :db_unique_name The value to assign to the {#db_unique_name} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :ncharacter_set The value to assign to the {#ncharacter_set} property
    # @option attributes [String] :pdb_name The value to assign to the {#pdb_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.character_set = attributes[:'characterSet'] if attributes[:'characterSet']

      raise 'You cannot provide both :characterSet and :character_set' if attributes.key?(:'characterSet') && attributes.key?(:'character_set')

      self.character_set = attributes[:'character_set'] if attributes[:'character_set']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.db_backup_config = attributes[:'dbBackupConfig'] if attributes[:'dbBackupConfig']

      raise 'You cannot provide both :dbBackupConfig and :db_backup_config' if attributes.key?(:'dbBackupConfig') && attributes.key?(:'db_backup_config')

      self.db_backup_config = attributes[:'db_backup_config'] if attributes[:'db_backup_config']

      self.db_home_id = attributes[:'dbHomeId'] if attributes[:'dbHomeId']

      raise 'You cannot provide both :dbHomeId and :db_home_id' if attributes.key?(:'dbHomeId') && attributes.key?(:'db_home_id')

      self.db_home_id = attributes[:'db_home_id'] if attributes[:'db_home_id']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.db_unique_name = attributes[:'dbUniqueName'] if attributes[:'dbUniqueName']

      raise 'You cannot provide both :dbUniqueName and :db_unique_name' if attributes.key?(:'dbUniqueName') && attributes.key?(:'db_unique_name')

      self.db_unique_name = attributes[:'db_unique_name'] if attributes[:'db_unique_name']

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.ncharacter_set = attributes[:'ncharacterSet'] if attributes[:'ncharacterSet']

      raise 'You cannot provide both :ncharacterSet and :ncharacter_set' if attributes.key?(:'ncharacterSet') && attributes.key?(:'ncharacter_set')

      self.ncharacter_set = attributes[:'ncharacter_set'] if attributes[:'ncharacter_set']

      self.pdb_name = attributes[:'pdbName'] if attributes[:'pdbName']

      raise 'You cannot provide both :pdbName and :pdb_name' if attributes.key?(:'pdbName') && attributes.key?(:'pdb_name')

      self.pdb_name = attributes[:'pdb_name'] if attributes[:'pdb_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
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
        character_set == other.character_set &&
        compartment_id == other.compartment_id &&
        db_backup_config == other.db_backup_config &&
        db_home_id == other.db_home_id &&
        db_name == other.db_name &&
        db_unique_name == other.db_unique_name &&
        db_workload == other.db_workload &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        ncharacter_set == other.ncharacter_set &&
        pdb_name == other.pdb_name &&
        time_created == other.time_created
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [character_set, compartment_id, db_backup_config, db_home_id, db_name, db_unique_name, db_workload, defined_tags, freeform_tags, id, lifecycle_details, lifecycle_state, ncharacter_set, pdb_name, time_created].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
