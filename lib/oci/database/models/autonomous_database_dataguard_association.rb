# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define dataguard association between two different Autonomous Databases.
  # Note that Autonomous Databases inherit DataGuard association from parent Autonomous Container Database.
  # No actions can be taken on AutonomousDatabaseDataguardAssociation, usage is strictly informational.
  #
  class Database::Models::AutonomousDatabaseDataguardAssociation
    ROLE_ENUM = [
      ROLE_PRIMARY = 'PRIMARY'.freeze,
      ROLE_STANDBY = 'STANDBY'.freeze,
      ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_ROLE_CHANGE_IN_PROGRESS = 'ROLE_CHANGE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PEER_ROLE_ENUM = [
      PEER_ROLE_PRIMARY = 'PRIMARY'.freeze,
      PEER_ROLE_STANDBY = 'STANDBY'.freeze,
      PEER_ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      PEER_ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_ENUM = [
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_ROLE_CHANGE_IN_PROGRESS = 'ROLE_CHANGE_IN_PROGRESS'.freeze,
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_FAILED = 'FAILED'.freeze,
      PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PROTECTION_MODE_ENUM = [
      PROTECTION_MODE_MAXIMUM_AVAILABILITY = 'MAXIMUM_AVAILABILITY'.freeze,
      PROTECTION_MODE_MAXIMUM_PERFORMANCE = 'MAXIMUM_PERFORMANCE'.freeze,
      PROTECTION_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the Autonomous Dataguard created for Autonomous Container Database where given Autonomous Database resides in.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous Database that has a relationship with the peer Autonomous Database.
    #
    # @return [String]
    attr_accessor :autonomous_database_id

    # **[Required]** The role of the Autonomous Data Guard-enabled Autonomous Container Database.
    # @return [String]
    attr_reader :role

    # **[Required]** The current state of Autonomous Data Guard.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycleState, if available.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The role of the Autonomous Data Guard-enabled Autonomous Container Database.
    # @return [String]
    attr_reader :peer_role

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the peer Autonomous Database.
    #
    # @return [String]
    attr_accessor :peer_autonomous_database_id

    # The current state of Autonomous Data Guard.
    # @return [String]
    attr_reader :peer_autonomous_database_life_cycle_state

    # The protection mode of this Data Guard association. For more information, see
    # [Oracle Data Guard Protection Modes](http://docs.oracle.com/database/122/SBYDB/oracle-data-guard-protection-modes.htm#SBYDB02000)
    # in the Oracle Data Guard documentation.
    #
    # @return [String]
    attr_reader :protection_mode

    # The lag time between updates to the primary database and application of the redo data on the standby database,
    # as computed by the reporting database.
    #
    # Example: `9 seconds`
    #
    # @return [String]
    attr_accessor :apply_lag

    # The rate at which redo logs are synced between the associated databases.
    #
    # Example: `180 Mb per second`
    #
    # @return [String]
    attr_accessor :apply_rate

    # The approximate number of seconds of redo data not yet available on the standby Autonomous Container Database,
    # as computed by the reporting database.
    #
    # Example: `7 seconds`
    #
    # @return [String]
    attr_accessor :transport_lag

    # The date and time of the last update to the apply lag, apply rate, and transport lag values.
    # @return [DateTime]
    attr_accessor :time_last_synced

    # The date and time the Data Guard association was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time when the last role change action happened.
    # @return [DateTime]
    attr_accessor :time_last_role_changed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'autonomous_database_id': :'autonomousDatabaseId',
        'role': :'role',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'peer_role': :'peerRole',
        'peer_autonomous_database_id': :'peerAutonomousDatabaseId',
        'peer_autonomous_database_life_cycle_state': :'peerAutonomousDatabaseLifeCycleState',
        'protection_mode': :'protectionMode',
        'apply_lag': :'applyLag',
        'apply_rate': :'applyRate',
        'transport_lag': :'transportLag',
        'time_last_synced': :'timeLastSynced',
        'time_created': :'timeCreated',
        'time_last_role_changed': :'timeLastRoleChanged'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'autonomous_database_id': :'String',
        'role': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'peer_role': :'String',
        'peer_autonomous_database_id': :'String',
        'peer_autonomous_database_life_cycle_state': :'String',
        'protection_mode': :'String',
        'apply_lag': :'String',
        'apply_rate': :'String',
        'transport_lag': :'String',
        'time_last_synced': :'DateTime',
        'time_created': :'DateTime',
        'time_last_role_changed': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :autonomous_database_id The value to assign to the {#autonomous_database_id} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :peer_role The value to assign to the {#peer_role} property
    # @option attributes [String] :peer_autonomous_database_id The value to assign to the {#peer_autonomous_database_id} property
    # @option attributes [String] :peer_autonomous_database_life_cycle_state The value to assign to the {#peer_autonomous_database_life_cycle_state} property
    # @option attributes [String] :protection_mode The value to assign to the {#protection_mode} property
    # @option attributes [String] :apply_lag The value to assign to the {#apply_lag} property
    # @option attributes [String] :apply_rate The value to assign to the {#apply_rate} property
    # @option attributes [String] :transport_lag The value to assign to the {#transport_lag} property
    # @option attributes [DateTime] :time_last_synced The value to assign to the {#time_last_synced} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_last_role_changed The value to assign to the {#time_last_role_changed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.autonomous_database_id = attributes[:'autonomousDatabaseId'] if attributes[:'autonomousDatabaseId']

      raise 'You cannot provide both :autonomousDatabaseId and :autonomous_database_id' if attributes.key?(:'autonomousDatabaseId') && attributes.key?(:'autonomous_database_id')

      self.autonomous_database_id = attributes[:'autonomous_database_id'] if attributes[:'autonomous_database_id']

      self.role = attributes[:'role'] if attributes[:'role']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.peer_role = attributes[:'peerRole'] if attributes[:'peerRole']

      raise 'You cannot provide both :peerRole and :peer_role' if attributes.key?(:'peerRole') && attributes.key?(:'peer_role')

      self.peer_role = attributes[:'peer_role'] if attributes[:'peer_role']

      self.peer_autonomous_database_id = attributes[:'peerAutonomousDatabaseId'] if attributes[:'peerAutonomousDatabaseId']

      raise 'You cannot provide both :peerAutonomousDatabaseId and :peer_autonomous_database_id' if attributes.key?(:'peerAutonomousDatabaseId') && attributes.key?(:'peer_autonomous_database_id')

      self.peer_autonomous_database_id = attributes[:'peer_autonomous_database_id'] if attributes[:'peer_autonomous_database_id']

      self.peer_autonomous_database_life_cycle_state = attributes[:'peerAutonomousDatabaseLifeCycleState'] if attributes[:'peerAutonomousDatabaseLifeCycleState']

      raise 'You cannot provide both :peerAutonomousDatabaseLifeCycleState and :peer_autonomous_database_life_cycle_state' if attributes.key?(:'peerAutonomousDatabaseLifeCycleState') && attributes.key?(:'peer_autonomous_database_life_cycle_state')

      self.peer_autonomous_database_life_cycle_state = attributes[:'peer_autonomous_database_life_cycle_state'] if attributes[:'peer_autonomous_database_life_cycle_state']

      self.protection_mode = attributes[:'protectionMode'] if attributes[:'protectionMode']

      raise 'You cannot provide both :protectionMode and :protection_mode' if attributes.key?(:'protectionMode') && attributes.key?(:'protection_mode')

      self.protection_mode = attributes[:'protection_mode'] if attributes[:'protection_mode']

      self.apply_lag = attributes[:'applyLag'] if attributes[:'applyLag']

      raise 'You cannot provide both :applyLag and :apply_lag' if attributes.key?(:'applyLag') && attributes.key?(:'apply_lag')

      self.apply_lag = attributes[:'apply_lag'] if attributes[:'apply_lag']

      self.apply_rate = attributes[:'applyRate'] if attributes[:'applyRate']

      raise 'You cannot provide both :applyRate and :apply_rate' if attributes.key?(:'applyRate') && attributes.key?(:'apply_rate')

      self.apply_rate = attributes[:'apply_rate'] if attributes[:'apply_rate']

      self.transport_lag = attributes[:'transportLag'] if attributes[:'transportLag']

      raise 'You cannot provide both :transportLag and :transport_lag' if attributes.key?(:'transportLag') && attributes.key?(:'transport_lag')

      self.transport_lag = attributes[:'transport_lag'] if attributes[:'transport_lag']

      self.time_last_synced = attributes[:'timeLastSynced'] if attributes[:'timeLastSynced']

      raise 'You cannot provide both :timeLastSynced and :time_last_synced' if attributes.key?(:'timeLastSynced') && attributes.key?(:'time_last_synced')

      self.time_last_synced = attributes[:'time_last_synced'] if attributes[:'time_last_synced']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_last_role_changed = attributes[:'timeLastRoleChanged'] if attributes[:'timeLastRoleChanged']

      raise 'You cannot provide both :timeLastRoleChanged and :time_last_role_changed' if attributes.key?(:'timeLastRoleChanged') && attributes.key?(:'time_last_role_changed')

      self.time_last_role_changed = attributes[:'time_last_role_changed'] if attributes[:'time_last_role_changed']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
    # @param [Object] peer_role Object to be assigned
    def peer_role=(peer_role)
      # rubocop:disable Style/ConditionalAssignment
      if peer_role && !PEER_ROLE_ENUM.include?(peer_role)
        OCI.logger.debug("Unknown value for 'peer_role' [" + peer_role + "]. Mapping to 'PEER_ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @peer_role = PEER_ROLE_UNKNOWN_ENUM_VALUE
      else
        @peer_role = peer_role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] peer_autonomous_database_life_cycle_state Object to be assigned
    def peer_autonomous_database_life_cycle_state=(peer_autonomous_database_life_cycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if peer_autonomous_database_life_cycle_state && !PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_ENUM.include?(peer_autonomous_database_life_cycle_state)
        OCI.logger.debug("Unknown value for 'peer_autonomous_database_life_cycle_state' [" + peer_autonomous_database_life_cycle_state + "]. Mapping to 'PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @peer_autonomous_database_life_cycle_state = PEER_AUTONOMOUS_DATABASE_LIFE_CYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @peer_autonomous_database_life_cycle_state = peer_autonomous_database_life_cycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protection_mode Object to be assigned
    def protection_mode=(protection_mode)
      # rubocop:disable Style/ConditionalAssignment
      if protection_mode && !PROTECTION_MODE_ENUM.include?(protection_mode)
        OCI.logger.debug("Unknown value for 'protection_mode' [" + protection_mode + "]. Mapping to 'PROTECTION_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protection_mode = PROTECTION_MODE_UNKNOWN_ENUM_VALUE
      else
        @protection_mode = protection_mode
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
        autonomous_database_id == other.autonomous_database_id &&
        role == other.role &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        peer_role == other.peer_role &&
        peer_autonomous_database_id == other.peer_autonomous_database_id &&
        peer_autonomous_database_life_cycle_state == other.peer_autonomous_database_life_cycle_state &&
        protection_mode == other.protection_mode &&
        apply_lag == other.apply_lag &&
        apply_rate == other.apply_rate &&
        transport_lag == other.transport_lag &&
        time_last_synced == other.time_last_synced &&
        time_created == other.time_created &&
        time_last_role_changed == other.time_last_role_changed
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
      [id, autonomous_database_id, role, lifecycle_state, lifecycle_details, peer_role, peer_autonomous_database_id, peer_autonomous_database_life_cycle_state, protection_mode, apply_lag, apply_rate, transport_lag, time_last_synced, time_created, time_last_role_changed].hash
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
