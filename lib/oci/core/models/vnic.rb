# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A virtual network interface card. Each VNIC resides in a subnet in a VCN.
  # An instance attaches to a VNIC to obtain a network connection into the VCN
  # through that subnet. Each instance has a *primary VNIC* that is automatically
  # created and attached during launch. You can add *secondary VNICs* to an
  # instance after it's launched. For more information, see
  # [Virtual Network Interface Cards (VNICs)](https://docs.cloud.oracle.com/Content/Network/Tasks/managingVNICs.htm).
  #
  # Each VNIC has a *primary private IP* that is automatically assigned during launch.
  # You can add *secondary private IPs* to a VNIC after it's created. For more
  # information, see {#create_private_ip create_private_ip} and
  # [IP Addresses](https://docs.cloud.oracle.com/Content/Network/Tasks/managingIPaddresses.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::Vnic
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The VNIC's availability domain.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** The OCID of the compartment containing the VNIC.
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique.
    # Avoid entering confidential information.
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

    # The hostname for the VNIC's primary private IP. Used for DNS. The value is the hostname
    # portion of the primary private IP's fully qualified domain name (FQDN)
    # (for example, `bminstance-1` in FQDN `bminstance-1.subnet123.vcn1.oraclevcn.com`).
    # Must be unique across all VNICs in the subnet and comply with
    # [RFC 952](https://tools.ietf.org/html/rfc952) and
    # [RFC 1123](https://tools.ietf.org/html/rfc1123).
    #
    # For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).
    #
    # Example: `bminstance-1`
    #
    # @return [String]
    attr_accessor :hostname_label

    # **[Required]** The OCID of the VNIC.
    # @return [String]
    attr_accessor :id

    # Whether the VNIC is the primary VNIC (the VNIC that is automatically created
    # and attached during instance launch).
    #
    # @return [BOOLEAN]
    attr_accessor :is_primary

    # **[Required]** The current state of the VNIC.
    # @return [String]
    attr_reader :lifecycle_state

    # The MAC address of the VNIC.
    #
    # Example: `00:00:17:B6:4D:DD`
    #
    # @return [String]
    attr_accessor :mac_address

    # A list of the OCIDs of the network security groups that the VNIC belongs to. For more
    # information about NSGs, see
    # {NetworkSecurityGroup}.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The private IP address of the primary `privateIp` object on the VNIC.
    # The address is within the CIDR of the VNIC's subnet.
    #
    # Example: `10.0.3.3`
    #
    # @return [String]
    attr_accessor :private_ip

    # The public IP address of the VNIC, if one is assigned.
    #
    # @return [String]
    attr_accessor :public_ip

    # Whether the source/destination check is disabled on the VNIC.
    # Defaults to `false`, which means the check is performed. For information
    # about why you would skip the source/destination check, see
    # [Using a Private IP as a Route Target](https://docs.cloud.oracle.com/Content/Network/Tasks/managingroutetables.htm#privateip).
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :skip_source_dest_check

    # **[Required]** The OCID of the subnet the VNIC is in.
    # @return [String]
    attr_accessor :subnet_id

    # **[Required]** The date and time the VNIC was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'hostname_label': :'hostnameLabel',
        'id': :'id',
        'is_primary': :'isPrimary',
        'lifecycle_state': :'lifecycleState',
        'mac_address': :'macAddress',
        'nsg_ids': :'nsgIds',
        'private_ip': :'privateIp',
        'public_ip': :'publicIp',
        'skip_source_dest_check': :'skipSourceDestCheck',
        'subnet_id': :'subnetId',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname_label': :'String',
        'id': :'String',
        'is_primary': :'BOOLEAN',
        'lifecycle_state': :'String',
        'mac_address': :'String',
        'nsg_ids': :'Array<String>',
        'private_ip': :'String',
        'public_ip': :'String',
        'skip_source_dest_check': :'BOOLEAN',
        'subnet_id': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [BOOLEAN] :is_primary The value to assign to the {#is_primary} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :mac_address The value to assign to the {#mac_address} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    # @option attributes [String] :public_ip The value to assign to the {#public_ip} property
    # @option attributes [BOOLEAN] :skip_source_dest_check The value to assign to the {#skip_source_dest_check} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

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

      self.hostname_label = attributes[:'hostnameLabel'] if attributes[:'hostnameLabel']

      raise 'You cannot provide both :hostnameLabel and :hostname_label' if attributes.key?(:'hostnameLabel') && attributes.key?(:'hostname_label')

      self.hostname_label = attributes[:'hostname_label'] if attributes[:'hostname_label']

      self.id = attributes[:'id'] if attributes[:'id']

      self.is_primary = attributes[:'isPrimary'] unless attributes[:'isPrimary'].nil?

      raise 'You cannot provide both :isPrimary and :is_primary' if attributes.key?(:'isPrimary') && attributes.key?(:'is_primary')

      self.is_primary = attributes[:'is_primary'] unless attributes[:'is_primary'].nil?

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.mac_address = attributes[:'macAddress'] if attributes[:'macAddress']

      raise 'You cannot provide both :macAddress and :mac_address' if attributes.key?(:'macAddress') && attributes.key?(:'mac_address')

      self.mac_address = attributes[:'mac_address'] if attributes[:'mac_address']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.private_ip = attributes[:'privateIp'] if attributes[:'privateIp']

      raise 'You cannot provide both :privateIp and :private_ip' if attributes.key?(:'privateIp') && attributes.key?(:'private_ip')

      self.private_ip = attributes[:'private_ip'] if attributes[:'private_ip']

      self.public_ip = attributes[:'publicIp'] if attributes[:'publicIp']

      raise 'You cannot provide both :publicIp and :public_ip' if attributes.key?(:'publicIp') && attributes.key?(:'public_ip')

      self.public_ip = attributes[:'public_ip'] if attributes[:'public_ip']

      self.skip_source_dest_check = attributes[:'skipSourceDestCheck'] unless attributes[:'skipSourceDestCheck'].nil?

      raise 'You cannot provide both :skipSourceDestCheck and :skip_source_dest_check' if attributes.key?(:'skipSourceDestCheck') && attributes.key?(:'skip_source_dest_check')

      self.skip_source_dest_check = attributes[:'skip_source_dest_check'] unless attributes[:'skip_source_dest_check'].nil?

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
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
        availability_domain == other.availability_domain &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        hostname_label == other.hostname_label &&
        id == other.id &&
        is_primary == other.is_primary &&
        lifecycle_state == other.lifecycle_state &&
        mac_address == other.mac_address &&
        nsg_ids == other.nsg_ids &&
        private_ip == other.private_ip &&
        public_ip == other.public_ip &&
        skip_source_dest_check == other.skip_source_dest_check &&
        subnet_id == other.subnet_id &&
        time_created == other.time_created
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
      [availability_domain, compartment_id, defined_tags, display_name, freeform_tags, hostname_label, id, is_primary, lifecycle_state, mac_address, nsg_ids, private_ip, public_ip, skip_source_dest_check, subnet_id, time_created].hash
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
