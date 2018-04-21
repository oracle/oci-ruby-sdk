# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The properties that define a Data Guard association.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an
  # administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/sdks.htm).
  #
  class Database::Models::DataGuardAssociationSummary # rubocop:disable Metrics/LineLength
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
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

    PROTECTION_MODE_ENUM = [
      PROTECTION_MODE_MAXIMUM_AVAILABILITY = 'MAXIMUM_AVAILABILITY'.freeze,
      PROTECTION_MODE_MAXIMUM_PERFORMANCE = 'MAXIMUM_PERFORMANCE'.freeze,
      PROTECTION_MODE_MAXIMUM_PROTECTION = 'MAXIMUM_PROTECTION'.freeze,
      PROTECTION_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_PRIMARY = 'PRIMARY'.freeze,
      ROLE_STANDBY = 'STANDBY'.freeze,
      ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRANSPORT_TYPE_ENUM = [
      TRANSPORT_TYPE_SYNC = 'SYNC'.freeze,
      TRANSPORT_TYPE_ASYNC = 'ASYNC'.freeze,
      TRANSPORT_TYPE_FASTSYNC = 'FASTSYNC'.freeze,
      TRANSPORT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

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

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the reporting database.
    # @return [String]
    attr_accessor :database_id

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the Data Guard association.
    # @return [String]
    attr_accessor :id

    # Additional information about the current lifecycleState, if available.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The current state of the Data Guard association.
    # @return [String]
    attr_reader :lifecycle_state

    # The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the peer database's Data Guard association.
    # @return [String]
    attr_accessor :peer_data_guard_association_id

    # The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the associated peer database.
    # @return [String]
    attr_accessor :peer_database_id

    # The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the database home containing the associated peer database.
    #
    # @return [String]
    attr_accessor :peer_db_home_id

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the DB System containing the associated
    # peer database.
    #
    # @return [String]
    attr_accessor :peer_db_system_id

    # **[Required]** The role of the peer database in this Data Guard association.
    # @return [String]
    attr_reader :peer_role

    # **[Required]** The protection mode of this Data Guard association. For more information, see
    # [Oracle Data Guard Protection Modes](http://docs.oracle.com/database/122/SBYDB/oracle-data-guard-protection-modes.htm#SBYDB02000)
    # in the Oracle Data Guard documentation.
    #
    # @return [String]
    attr_reader :protection_mode

    # **[Required]** The role of the reporting database in this Data Guard association.
    # @return [String]
    attr_reader :role

    # The date and time the Data Guard Association was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The redo transport type used by this Data Guard association.  For more information, see
    # [Redo Transport Services](http://docs.oracle.com/database/122/SBYDB/oracle-data-guard-redo-transport-services.htm#SBYDB00400)
    # in the Oracle Data Guard documentation.
    #
    # @return [String]
    attr_reader :transport_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'apply_lag': :'applyLag',
        'apply_rate': :'applyRate',
        'database_id': :'databaseId',
        'id': :'id',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'peer_data_guard_association_id': :'peerDataGuardAssociationId',
        'peer_database_id': :'peerDatabaseId',
        'peer_db_home_id': :'peerDbHomeId',
        'peer_db_system_id': :'peerDbSystemId',
        'peer_role': :'peerRole',
        'protection_mode': :'protectionMode',
        'role': :'role',
        'time_created': :'timeCreated',
        'transport_type': :'transportType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'apply_lag': :'String',
        'apply_rate': :'String',
        'database_id': :'String',
        'id': :'String',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'peer_data_guard_association_id': :'String',
        'peer_database_id': :'String',
        'peer_db_home_id': :'String',
        'peer_db_system_id': :'String',
        'peer_role': :'String',
        'protection_mode': :'String',
        'role': :'String',
        'time_created': :'DateTime',
        'transport_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :apply_lag The value to assign to the {#apply_lag} property
    # @option attributes [String] :apply_rate The value to assign to the {#apply_rate} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :peer_data_guard_association_id The value to assign to the {#peer_data_guard_association_id} property
    # @option attributes [String] :peer_database_id The value to assign to the {#peer_database_id} property
    # @option attributes [String] :peer_db_home_id The value to assign to the {#peer_db_home_id} property
    # @option attributes [String] :peer_db_system_id The value to assign to the {#peer_db_system_id} property
    # @option attributes [String] :peer_role The value to assign to the {#peer_role} property
    # @option attributes [String] :protection_mode The value to assign to the {#protection_mode} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :transport_type The value to assign to the {#transport_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.apply_lag = attributes[:'applyLag'] if attributes[:'applyLag']

      raise 'You cannot provide both :applyLag and :apply_lag' if attributes.key?(:'applyLag') && attributes.key?(:'apply_lag')

      self.apply_lag = attributes[:'apply_lag'] if attributes[:'apply_lag']

      self.apply_rate = attributes[:'applyRate'] if attributes[:'applyRate']

      raise 'You cannot provide both :applyRate and :apply_rate' if attributes.key?(:'applyRate') && attributes.key?(:'apply_rate')

      self.apply_rate = attributes[:'apply_rate'] if attributes[:'apply_rate']

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.peer_data_guard_association_id = attributes[:'peerDataGuardAssociationId'] if attributes[:'peerDataGuardAssociationId']

      raise 'You cannot provide both :peerDataGuardAssociationId and :peer_data_guard_association_id' if attributes.key?(:'peerDataGuardAssociationId') && attributes.key?(:'peer_data_guard_association_id')

      self.peer_data_guard_association_id = attributes[:'peer_data_guard_association_id'] if attributes[:'peer_data_guard_association_id']

      self.peer_database_id = attributes[:'peerDatabaseId'] if attributes[:'peerDatabaseId']

      raise 'You cannot provide both :peerDatabaseId and :peer_database_id' if attributes.key?(:'peerDatabaseId') && attributes.key?(:'peer_database_id')

      self.peer_database_id = attributes[:'peer_database_id'] if attributes[:'peer_database_id']

      self.peer_db_home_id = attributes[:'peerDbHomeId'] if attributes[:'peerDbHomeId']

      raise 'You cannot provide both :peerDbHomeId and :peer_db_home_id' if attributes.key?(:'peerDbHomeId') && attributes.key?(:'peer_db_home_id')

      self.peer_db_home_id = attributes[:'peer_db_home_id'] if attributes[:'peer_db_home_id']

      self.peer_db_system_id = attributes[:'peerDbSystemId'] if attributes[:'peerDbSystemId']

      raise 'You cannot provide both :peerDbSystemId and :peer_db_system_id' if attributes.key?(:'peerDbSystemId') && attributes.key?(:'peer_db_system_id')

      self.peer_db_system_id = attributes[:'peer_db_system_id'] if attributes[:'peer_db_system_id']

      self.peer_role = attributes[:'peerRole'] if attributes[:'peerRole']

      raise 'You cannot provide both :peerRole and :peer_role' if attributes.key?(:'peerRole') && attributes.key?(:'peer_role')

      self.peer_role = attributes[:'peer_role'] if attributes[:'peer_role']

      self.protection_mode = attributes[:'protectionMode'] if attributes[:'protectionMode']

      raise 'You cannot provide both :protectionMode and :protection_mode' if attributes.key?(:'protectionMode') && attributes.key?(:'protection_mode')

      self.protection_mode = attributes[:'protection_mode'] if attributes[:'protection_mode']

      self.role = attributes[:'role'] if attributes[:'role']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.transport_type = attributes[:'transportType'] if attributes[:'transportType']

      raise 'You cannot provide both :transportType and :transport_type' if attributes.key?(:'transportType') && attributes.key?(:'transport_type')

      self.transport_type = attributes[:'transport_type'] if attributes[:'transport_type']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] peer_role Object to be assigned
    def peer_role=(peer_role)
      # rubocop:disable Style/ConditionalAssignment
      if peer_role && !PEER_ROLE_ENUM.include?(peer_role)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'peer_role' [" + peer_role + "]. Mapping to 'PEER_ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @peer_role = PEER_ROLE_UNKNOWN_ENUM_VALUE
      else
        @peer_role = peer_role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protection_mode Object to be assigned
    def protection_mode=(protection_mode)
      # rubocop:disable Style/ConditionalAssignment
      if protection_mode && !PROTECTION_MODE_ENUM.include?(protection_mode)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'protection_mode' [" + protection_mode + "]. Mapping to 'PROTECTION_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @protection_mode = PROTECTION_MODE_UNKNOWN_ENUM_VALUE
      else
        @protection_mode = protection_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] transport_type Object to be assigned
    def transport_type=(transport_type)
      # rubocop:disable Style/ConditionalAssignment
      if transport_type && !TRANSPORT_TYPE_ENUM.include?(transport_type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'transport_type' [" + transport_type + "]. Mapping to 'TRANSPORT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @transport_type = TRANSPORT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @transport_type = transport_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        apply_lag == other.apply_lag &&
        apply_rate == other.apply_rate &&
        database_id == other.database_id &&
        id == other.id &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        peer_data_guard_association_id == other.peer_data_guard_association_id &&
        peer_database_id == other.peer_database_id &&
        peer_db_home_id == other.peer_db_home_id &&
        peer_db_system_id == other.peer_db_system_id &&
        peer_role == other.peer_role &&
        protection_mode == other.protection_mode &&
        role == other.role &&
        time_created == other.time_created &&
        transport_type == other.transport_type
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
      [apply_lag, apply_rate, database_id, id, lifecycle_details, lifecycle_state, peer_data_guard_association_id, peer_database_id, peer_db_home_id, peer_db_system_id, peer_role, protection_mode, role, time_created, transport_type].hash
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
