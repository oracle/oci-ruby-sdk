# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190415
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the read replica.
  class Mysql::Models::ReplicaSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the read replica.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the DB System the read replica is associated with.
    # @return [String]
    attr_accessor :db_system_id

    # **[Required]** The OCID of the compartment that contains the read replica.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-friendly name for the read replica. It does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # User provided description of the read replica.
    # @return [String]
    attr_accessor :description

    # **[Required]** The state of the read replica.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the state of the read replica.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The date and time the read replica was created, as described by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the read replica was last updated, as described by [RFC 3339](https://tools.ietf.org/rfc/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The MySQL version currently in use by the read replica.
    # @return [String]
    attr_accessor :mysql_version

    # The name of the Availability Domain the read replica is located in.
    # @return [String]
    attr_accessor :availability_domain

    # The name of the Fault Domain the read replica is located in.
    # @return [String]
    attr_accessor :fault_domain

    # **[Required]** The IP address the read replica is configured to listen on.
    #
    # @return [String]
    attr_accessor :ip_address

    # **[Required]** The port the read replica is configured to listen on.
    # @return [Integer]
    attr_accessor :port

    # **[Required]** The TCP network port on which X Plugin listens for connections. This is the X Plugin equivalent of port.
    #
    # @return [Integer]
    attr_accessor :port_x

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

    # Specifies whether the read replica can be deleted. Set to true to prevent deletion, false (default) to allow.
    # Note that if a read replica is delete protected it also prevents the entire DB System from being deleted. If
    # the DB System is delete protected, read replicas can still be deleted individually if they are not delete
    # protected themselves.
    #
    # @return [BOOLEAN]
    attr_accessor :is_delete_protected

    # The shape currently in use by the read replica. The shape determines the resources allocated:
    # CPU cores and memory for VM shapes, CPU cores, memory and storage for non-VM (bare metal) shapes.
    # To get a list of shapes, use the {#list_shapes list_shapes} operation.
    #
    # @return [String]
    attr_accessor :shape_name

    # The OCID of the Configuration currently in use by the read replica.
    # @return [String]
    attr_accessor :configuration_id

    # @return [OCI::Mysql::Models::ReplicaOverrides]
    attr_accessor :replica_overrides

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'db_system_id': :'dbSystemId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'mysql_version': :'mysqlVersion',
        'availability_domain': :'availabilityDomain',
        'fault_domain': :'faultDomain',
        'ip_address': :'ipAddress',
        'port': :'port',
        'port_x': :'portX',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'is_delete_protected': :'isDeleteProtected',
        'shape_name': :'shapeName',
        'configuration_id': :'configurationId',
        'replica_overrides': :'replicaOverrides'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'db_system_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'mysql_version': :'String',
        'availability_domain': :'String',
        'fault_domain': :'String',
        'ip_address': :'String',
        'port': :'Integer',
        'port_x': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'is_delete_protected': :'BOOLEAN',
        'shape_name': :'String',
        'configuration_id': :'String',
        'replica_overrides': :'OCI::Mysql::Models::ReplicaOverrides'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :mysql_version The value to assign to the {#mysql_version} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [Integer] :port_x The value to assign to the {#port_x} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [BOOLEAN] :is_delete_protected The value to assign to the {#is_delete_protected} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [String] :configuration_id The value to assign to the {#configuration_id} property
    # @option attributes [OCI::Mysql::Models::ReplicaOverrides] :replica_overrides The value to assign to the {#replica_overrides} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.mysql_version = attributes[:'mysqlVersion'] if attributes[:'mysqlVersion']

      raise 'You cannot provide both :mysqlVersion and :mysql_version' if attributes.key?(:'mysqlVersion') && attributes.key?(:'mysql_version')

      self.mysql_version = attributes[:'mysql_version'] if attributes[:'mysql_version']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.port = attributes[:'port'] if attributes[:'port']

      self.port_x = attributes[:'portX'] if attributes[:'portX']

      raise 'You cannot provide both :portX and :port_x' if attributes.key?(:'portX') && attributes.key?(:'port_x')

      self.port_x = attributes[:'port_x'] if attributes[:'port_x']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.is_delete_protected = attributes[:'isDeleteProtected'] unless attributes[:'isDeleteProtected'].nil?
      self.is_delete_protected = false if is_delete_protected.nil? && !attributes.key?(:'isDeleteProtected') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDeleteProtected and :is_delete_protected' if attributes.key?(:'isDeleteProtected') && attributes.key?(:'is_delete_protected')

      self.is_delete_protected = attributes[:'is_delete_protected'] unless attributes[:'is_delete_protected'].nil?
      self.is_delete_protected = false if is_delete_protected.nil? && !attributes.key?(:'isDeleteProtected') && !attributes.key?(:'is_delete_protected') # rubocop:disable Style/StringLiterals

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.configuration_id = attributes[:'configurationId'] if attributes[:'configurationId']

      raise 'You cannot provide both :configurationId and :configuration_id' if attributes.key?(:'configurationId') && attributes.key?(:'configuration_id')

      self.configuration_id = attributes[:'configuration_id'] if attributes[:'configuration_id']

      self.replica_overrides = attributes[:'replicaOverrides'] if attributes[:'replicaOverrides']

      raise 'You cannot provide both :replicaOverrides and :replica_overrides' if attributes.key?(:'replicaOverrides') && attributes.key?(:'replica_overrides')

      self.replica_overrides = attributes[:'replica_overrides'] if attributes[:'replica_overrides']
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
        db_system_id == other.db_system_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        mysql_version == other.mysql_version &&
        availability_domain == other.availability_domain &&
        fault_domain == other.fault_domain &&
        ip_address == other.ip_address &&
        port == other.port &&
        port_x == other.port_x &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        is_delete_protected == other.is_delete_protected &&
        shape_name == other.shape_name &&
        configuration_id == other.configuration_id &&
        replica_overrides == other.replica_overrides
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
      [id, db_system_id, compartment_id, display_name, description, lifecycle_state, lifecycle_details, time_created, time_updated, mysql_version, availability_domain, fault_domain, ip_address, port, port_x, freeform_tags, defined_tags, is_delete_protected, shape_name, configuration_id, replica_overrides].hash
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
