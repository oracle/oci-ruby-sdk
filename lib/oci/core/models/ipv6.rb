# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An *IPv6* is a conceptual term that refers to an IPv6 address and related properties.
  # The `IPv6` object is the API representation of an IPv6.
  #
  # You can create and assign an IPv6 to any VNIC that is in an IPv6-enabled subnet in an
  # IPv6-enabled VCN.
  #
  # **Note:** IPv6 addressing is currently supported only in the Government Cloud.
  #
  # For important details about IPv6 addressing in a VCN, see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).
  #
  class Core::Models::Ipv6
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the IPv6.
    # This is the same as the VNIC's compartment.
    #
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** A user-friendly name. Does not have to be unique, and it's changeable. Avoid
    # entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the IPv6.
    # @return [String]
    attr_accessor :id

    # **[Required]** The IPv6 address of the `IPv6` object. The address is within the private IPv6 CIDR block
    # of the VNIC's subnet (see the `ipv6CidrBlock` attribute for the {Subnet}
    # object).
    #
    # Example: `2001:0db8:0123:1111:abcd:ef01:2345:6789`
    #
    # @return [String]
    attr_accessor :ip_address

    # Whether the IPv6 can be used for internet communication. Allowed by default for an IPv6 in
    # a public subnet. Never allowed for an IPv6 in a private subnet. If the value is `true`, the
    # IPv6 uses its public IP address for internet communication.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_internet_access_allowed

    # **[Required]** The IPv6's current state.
    # @return [String]
    attr_reader :lifecycle_state

    # The IPv6 address to be used for internet communication. The address is within the public
    # IPv6 CIDR block of the VNIC's subnet (see the `ipv6PublicCidrBlock` attribute for the
    # {Subnet} object).
    #
    # If your organization did NOT assign a custom IPv6 CIDR to the VCN for the private address
    # space, Oracle provides the IPv6 CIDR and uses that same CIDR for the private and public
    # address space. Therefore the `publicIpAddress` would be the same as the `ipAddress`.
    #
    # If your organization assigned a custom IPv6 CIDR to the VCN for the private address space,
    # the right 80 bits of the IPv6 public IP (the subnet and address bits) are the same as for
    # the `ipAddress`. But the left 48 bits are from the public IPv6 CIDR that Oracle assigned
    # to the VCN.
    #
    # This is null if the IPv6 is created with `isInternetAccessAllowed` set to `false`.
    #
    # Example: `2001:0db8:0123:1111:abcd:ef01:2345:6789`
    #
    # @return [String]
    attr_accessor :public_ip_address

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the VNIC is in.
    # @return [String]
    attr_accessor :subnet_id

    # **[Required]** The date and time the IPv6 was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VNIC the IPv6 is assigned to.
    # The VNIC and IPv6 must be in the same subnet.
    #
    # @return [String]
    attr_accessor :vnic_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'ip_address': :'ipAddress',
        'is_internet_access_allowed': :'isInternetAccessAllowed',
        'lifecycle_state': :'lifecycleState',
        'public_ip_address': :'publicIpAddress',
        'subnet_id': :'subnetId',
        'time_created': :'timeCreated',
        'vnic_id': :'vnicId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'ip_address': :'String',
        'is_internet_access_allowed': :'BOOLEAN',
        'lifecycle_state': :'String',
        'public_ip_address': :'String',
        'subnet_id': :'String',
        'time_created': :'DateTime',
        'vnic_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [BOOLEAN] :is_internet_access_allowed The value to assign to the {#is_internet_access_allowed} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :public_ip_address The value to assign to the {#public_ip_address} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :vnic_id The value to assign to the {#vnic_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

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

      self.is_internet_access_allowed = attributes[:'isInternetAccessAllowed'] unless attributes[:'isInternetAccessAllowed'].nil?

      raise 'You cannot provide both :isInternetAccessAllowed and :is_internet_access_allowed' if attributes.key?(:'isInternetAccessAllowed') && attributes.key?(:'is_internet_access_allowed')

      self.is_internet_access_allowed = attributes[:'is_internet_access_allowed'] unless attributes[:'is_internet_access_allowed'].nil?

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.public_ip_address = attributes[:'publicIpAddress'] if attributes[:'publicIpAddress']

      raise 'You cannot provide both :publicIpAddress and :public_ip_address' if attributes.key?(:'publicIpAddress') && attributes.key?(:'public_ip_address')

      self.public_ip_address = attributes[:'public_ip_address'] if attributes[:'public_ip_address']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.vnic_id = attributes[:'vnicId'] if attributes[:'vnicId']

      raise 'You cannot provide both :vnicId and :vnic_id' if attributes.key?(:'vnicId') && attributes.key?(:'vnic_id')

      self.vnic_id = attributes[:'vnic_id'] if attributes[:'vnic_id']
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
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        ip_address == other.ip_address &&
        is_internet_access_allowed == other.is_internet_access_allowed &&
        lifecycle_state == other.lifecycle_state &&
        public_ip_address == other.public_ip_address &&
        subnet_id == other.subnet_id &&
        time_created == other.time_created &&
        vnic_id == other.vnic_id
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
      [compartment_id, defined_tags, display_name, freeform_tags, id, ip_address, is_internet_access_allowed, lifecycle_state, public_ip_address, subnet_id, time_created, vnic_id].hash
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
