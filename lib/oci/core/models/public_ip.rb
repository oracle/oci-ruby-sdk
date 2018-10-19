# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A *public IP* is a conceptual term that refers to a public IP address and related properties.
  # The `publicIp` object is the API representation of a public IP.
  #
  # There are two types of public IPs:
  # 1. Ephemeral
  # 2. Reserved
  #
  # For more information and comparison of the two types,
  # see [Public IP Addresses](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingpublicIPs.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::PublicIp # rubocop:disable Metrics/LineLength
    ASSIGNED_ENTITY_TYPE_ENUM = [
      ASSIGNED_ENTITY_TYPE_PRIVATE_IP = 'PRIVATE_IP'.freeze,
      ASSIGNED_ENTITY_TYPE_NAT_GATEWAY = 'NAT_GATEWAY'.freeze,
      ASSIGNED_ENTITY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_ASSIGNING = 'ASSIGNING'.freeze,
      LIFECYCLE_STATE_ASSIGNED = 'ASSIGNED'.freeze,
      LIFECYCLE_STATE_UNASSIGNING = 'UNASSIGNING'.freeze,
      LIFECYCLE_STATE_UNASSIGNED = 'UNASSIGNED'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFETIME_ENUM = [
      LIFETIME_EPHEMERAL = 'EPHEMERAL'.freeze,
      LIFETIME_RESERVED = 'RESERVED'.freeze,
      LIFETIME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SCOPE_ENUM = [
      SCOPE_REGION = 'REGION'.freeze,
      SCOPE_AVAILABILITY_DOMAIN = 'AVAILABILITY_DOMAIN'.freeze,
      SCOPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the entity the public IP is assigned to, or in the process of
    # being assigned to.
    #
    # @return [String]
    attr_accessor :assigned_entity_id

    # The type of entity the public IP is assigned to, or in the process of being
    # assigned to.
    #
    # @return [String]
    attr_reader :assigned_entity_type

    # The public IP's availability domain. This property is set only for ephemeral public IPs
    # that are assigned to a private IP (that is, when the `scope` of the public IP is set to
    # AVAILABILITY_DOMAIN). The value is the availability domain of the assigned private IP.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the compartment containing the public IP. For an ephemeral public IP, this is
    # the compartment of its assigned entity (which can be a private IP or a regional entity such
    # as a NAT gateway). For a reserved public IP that is currently assigned,
    # its compartment can be different from the assigned private IP's.
    #
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable. Avoid
    # entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see
    # [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The public IP's Oracle ID (OCID).
    # @return [String]
    attr_accessor :id

    # The public IP address of the `publicIp` object.
    #
    # Example: `129.146.2.1`
    #
    # @return [String]
    attr_accessor :ip_address

    # The public IP's current state.
    # @return [String]
    attr_reader :lifecycle_state

    # Defines when the public IP is deleted and released back to Oracle's public IP pool.
    #
    # * `EPHEMERAL`: The lifetime is tied to the lifetime of its assigned entity. An ephemeral
    # public IP must always be assigned to an entity. If the assigned entity is a private IP,
    # the ephemeral public IP is automatically deleted when the private IP is deleted, when
    # the VNIC is terminated, or when the instance is terminated. If the assigned entity is a
    # {NatGateway}, the ephemeral public IP is automatically
    # deleted when the NAT gateway is terminated.
    #
    # * `RESERVED`: You control the public IP's lifetime. You can delete a reserved public IP
    # whenever you like. It does not need to be assigned to a private IP at all times.
    #
    # For more information and comparison of the two types,
    # see [Public IP Addresses](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingpublicIPs.htm).
    #
    # @return [String]
    attr_reader :lifetime

    # Deprecated. Use `assignedEntityId` instead.
    #
    # The OCID of the private IP that the public IP is currently assigned to, or in the
    # process of being assigned to.
    #
    # **Note:** This is `null` if the public IP is not assigned to a private IP, or is
    # in the process of being assigned to one.
    #
    # @return [String]
    attr_accessor :private_ip_id

    # Whether the public IP is regional or specific to a particular availability domain.
    #
    # * `REGION`: The public IP exists within a region and is assigned to a regional entity
    # (such as a {NatGateway}), or can be assigned to a private
    # IP in any availability domain in the region. Reserved public IPs and ephemeral public IPs
    # assigned to a regional entity have `scope` = `REGION`.
    #
    # * `AVAILABILITY_DOMAIN`: The public IP exists within the availability domain of the entity
    # it's assigned to, which is specified by the `availabilityDomain` property of the public IP object.
    # Ephemeral public IPs that are assigned to private IPs have `scope` = `AVAILABILITY_DOMAIN`.
    #
    # @return [String]
    attr_reader :scope

    # The date and time the public IP was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'assigned_entity_id': :'assignedEntityId',
        'assigned_entity_type': :'assignedEntityType',
        'availability_domain': :'availabilityDomain',
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'ip_address': :'ipAddress',
        'lifecycle_state': :'lifecycleState',
        'lifetime': :'lifetime',
        'private_ip_id': :'privateIpId',
        'scope': :'scope',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'assigned_entity_id': :'String',
        'assigned_entity_type': :'String',
        'availability_domain': :'String',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'ip_address': :'String',
        'lifecycle_state': :'String',
        'lifetime': :'String',
        'private_ip_id': :'String',
        'scope': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :assigned_entity_id The value to assign to the {#assigned_entity_id} property
    # @option attributes [String] :assigned_entity_type The value to assign to the {#assigned_entity_type} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifetime The value to assign to the {#lifetime} property
    # @option attributes [String] :private_ip_id The value to assign to the {#private_ip_id} property
    # @option attributes [String] :scope The value to assign to the {#scope} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.assigned_entity_id = attributes[:'assignedEntityId'] if attributes[:'assignedEntityId']

      raise 'You cannot provide both :assignedEntityId and :assigned_entity_id' if attributes.key?(:'assignedEntityId') && attributes.key?(:'assigned_entity_id')

      self.assigned_entity_id = attributes[:'assigned_entity_id'] if attributes[:'assigned_entity_id']

      self.assigned_entity_type = attributes[:'assignedEntityType'] if attributes[:'assignedEntityType']

      raise 'You cannot provide both :assignedEntityType and :assigned_entity_type' if attributes.key?(:'assignedEntityType') && attributes.key?(:'assigned_entity_type')

      self.assigned_entity_type = attributes[:'assigned_entity_type'] if attributes[:'assigned_entity_type']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifetime = attributes[:'lifetime'] if attributes[:'lifetime']

      self.private_ip_id = attributes[:'privateIpId'] if attributes[:'privateIpId']

      raise 'You cannot provide both :privateIpId and :private_ip_id' if attributes.key?(:'privateIpId') && attributes.key?(:'private_ip_id')

      self.private_ip_id = attributes[:'private_ip_id'] if attributes[:'private_ip_id']

      self.scope = attributes[:'scope'] if attributes[:'scope']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] assigned_entity_type Object to be assigned
    def assigned_entity_type=(assigned_entity_type)
      # rubocop:disable Style/ConditionalAssignment
      if assigned_entity_type && !ASSIGNED_ENTITY_TYPE_ENUM.include?(assigned_entity_type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'assigned_entity_type' [" + assigned_entity_type + "]. Mapping to 'ASSIGNED_ENTITY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @assigned_entity_type = ASSIGNED_ENTITY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @assigned_entity_type = assigned_entity_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] lifetime Object to be assigned
    def lifetime=(lifetime)
      # rubocop:disable Style/ConditionalAssignment
      if lifetime && !LIFETIME_ENUM.include?(lifetime)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifetime' [" + lifetime + "]. Mapping to 'LIFETIME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @lifetime = LIFETIME_UNKNOWN_ENUM_VALUE
      else
        @lifetime = lifetime
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] scope Object to be assigned
    def scope=(scope)
      # rubocop:disable Style/ConditionalAssignment
      if scope && !SCOPE_ENUM.include?(scope)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'scope' [" + scope + "]. Mapping to 'SCOPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @scope = SCOPE_UNKNOWN_ENUM_VALUE
      else
        @scope = scope
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        assigned_entity_id == other.assigned_entity_id &&
        assigned_entity_type == other.assigned_entity_type &&
        availability_domain == other.availability_domain &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        ip_address == other.ip_address &&
        lifecycle_state == other.lifecycle_state &&
        lifetime == other.lifetime &&
        private_ip_id == other.private_ip_id &&
        scope == other.scope &&
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
      [assigned_entity_id, assigned_entity_type, availability_domain, compartment_id, defined_tags, display_name, freeform_tags, id, ip_address, lifecycle_state, lifetime, private_ip_id, scope, time_created].hash
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
