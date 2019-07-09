# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A database backup.
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::BackupSummary
    TYPE_ENUM = [
      TYPE_INCREMENTAL = 'INCREMENTAL'.freeze,
      TYPE_FULL = 'FULL'.freeze,
      TYPE_VIRTUAL_FULL = 'VIRTUAL_FULL'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_RESTORING = 'RESTORING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_EDITION_ENUM = [
      DATABASE_EDITION_STANDARD_EDITION = 'STANDARD_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION = 'ENTERPRISE_EDITION'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_HIGH_PERFORMANCE = 'ENTERPRISE_EDITION_HIGH_PERFORMANCE'.freeze,
      DATABASE_EDITION_ENTERPRISE_EDITION_EXTREME_PERFORMANCE = 'ENTERPRISE_EDITION_EXTREME_PERFORMANCE'.freeze,
      DATABASE_EDITION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup.
    # @return [String]
    attr_accessor :id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :database_id

    # The user-friendly name for the backup. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The type of backup.
    # @return [String]
    attr_reader :type

    # The date and time the backup started.
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time the backup was completed.
    # @return [DateTime]
    attr_accessor :time_ended

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # The name of the availability domain where the database backup is stored.
    # @return [String]
    attr_accessor :availability_domain

    # The current state of the backup.
    # @return [String]
    attr_reader :lifecycle_state

    # The Oracle Database edition of the DB system from which the database backup was taken.
    #
    # @return [String]
    attr_reader :database_edition

    # The size of the database in gigabytes at the time the backup was taken.
    #
    # @return [Float]
    attr_accessor :database_size_in_gbs

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'database_id': :'databaseId',
        'display_name': :'displayName',
        'type': :'type',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded',
        'lifecycle_details': :'lifecycleDetails',
        'availability_domain': :'availabilityDomain',
        'lifecycle_state': :'lifecycleState',
        'database_edition': :'databaseEdition',
        'database_size_in_gbs': :'databaseSizeInGBs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'database_id': :'String',
        'display_name': :'String',
        'type': :'String',
        'time_started': :'DateTime',
        'time_ended': :'DateTime',
        'lifecycle_details': :'String',
        'availability_domain': :'String',
        'lifecycle_state': :'String',
        'database_edition': :'String',
        'database_size_in_gbs': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    # @option attributes [Float] :database_size_in_gbs The value to assign to the {#database_size_in_gbs} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']

      self.database_size_in_gbs = attributes[:'databaseSizeInGBs'] if attributes[:'databaseSizeInGBs']

      raise 'You cannot provide both :databaseSizeInGBs and :database_size_in_gbs' if attributes.key?(:'databaseSizeInGBs') && attributes.key?(:'database_size_in_gbs')

      self.database_size_in_gbs = attributes[:'database_size_in_gbs'] if attributes[:'database_size_in_gbs']
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
        database_id == other.database_id &&
        display_name == other.display_name &&
        type == other.type &&
        time_started == other.time_started &&
        time_ended == other.time_ended &&
        lifecycle_details == other.lifecycle_details &&
        availability_domain == other.availability_domain &&
        lifecycle_state == other.lifecycle_state &&
        database_edition == other.database_edition &&
        database_size_in_gbs == other.database_size_in_gbs
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
      [id, compartment_id, database_id, display_name, type, time_started, time_ended, lifecycle_details, availability_domain, lifecycle_state, database_edition, database_size_in_gbs].hash
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
