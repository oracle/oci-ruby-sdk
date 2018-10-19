# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A server where Oracle Database software is running.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::DbNodeSummary # rubocop:disable Metrics/LineLength
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_STATE_STOPPED = 'STOPPED'.freeze,
      LIFECYCLE_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the backup VNIC.
    # @return [String]
    attr_accessor :backup_vnic_id

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the DB system.
    # @return [String]
    attr_accessor :db_system_id

    # The host name for the database node.
    # @return [String]
    attr_accessor :hostname

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the database node.
    # @return [String]
    attr_accessor :id

    # **[Required]** The current state of the database node.
    # @return [String]
    attr_reader :lifecycle_state

    # The size (in GB) of the block storage volume allocation for the DB system. This attribute applies only for virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :software_storage_size_in_gb

    # **[Required]** The date and time that the database node was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the VNIC.
    # @return [String]
    attr_accessor :vnic_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_vnic_id': :'backupVnicId',
        'db_system_id': :'dbSystemId',
        'hostname': :'hostname',
        'id': :'id',
        'lifecycle_state': :'lifecycleState',
        'software_storage_size_in_gb': :'softwareStorageSizeInGB',
        'time_created': :'timeCreated',
        'vnic_id': :'vnicId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_vnic_id': :'String',
        'db_system_id': :'String',
        'hostname': :'String',
        'id': :'String',
        'lifecycle_state': :'String',
        'software_storage_size_in_gb': :'Integer',
        'time_created': :'DateTime',
        'vnic_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :backup_vnic_id The value to assign to the {#backup_vnic_id} property
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Integer] :software_storage_size_in_gb The value to assign to the {#software_storage_size_in_gb} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :vnic_id The value to assign to the {#vnic_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.backup_vnic_id = attributes[:'backupVnicId'] if attributes[:'backupVnicId']

      raise 'You cannot provide both :backupVnicId and :backup_vnic_id' if attributes.key?(:'backupVnicId') && attributes.key?(:'backup_vnic_id')

      self.backup_vnic_id = attributes[:'backup_vnic_id'] if attributes[:'backup_vnic_id']

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.software_storage_size_in_gb = attributes[:'softwareStorageSizeInGB'] if attributes[:'softwareStorageSizeInGB']

      raise 'You cannot provide both :softwareStorageSizeInGB and :software_storage_size_in_gb' if attributes.key?(:'softwareStorageSizeInGB') && attributes.key?(:'software_storage_size_in_gb')

      self.software_storage_size_in_gb = attributes[:'software_storage_size_in_gb'] if attributes[:'software_storage_size_in_gb']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.vnic_id = attributes[:'vnicId'] if attributes[:'vnicId']

      raise 'You cannot provide both :vnicId and :vnic_id' if attributes.key?(:'vnicId') && attributes.key?(:'vnic_id')

      self.vnic_id = attributes[:'vnic_id'] if attributes[:'vnic_id']
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
        backup_vnic_id == other.backup_vnic_id &&
        db_system_id == other.db_system_id &&
        hostname == other.hostname &&
        id == other.id &&
        lifecycle_state == other.lifecycle_state &&
        software_storage_size_in_gb == other.software_storage_size_in_gb &&
        time_created == other.time_created &&
        vnic_id == other.vnic_id
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
      [backup_vnic_id, db_system_id, hostname, id, lifecycle_state, software_storage_size_in_gb, time_created, vnic_id].hash
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
