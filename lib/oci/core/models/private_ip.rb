# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A *private IP* is a conceptual term that refers to a private IP address and related properties.
  # The `privateIp` object is the API representation of a private IP.
  #
  # Each instance has a *primary private IP* that is automatically created and
  # assigned to the primary VNIC during instance launch. If you add a secondary
  # VNIC to the instance, it also automatically gets a primary private IP. You
  # can't remove a primary private IP from its VNIC. The primary private IP is
  # automatically deleted when the VNIC is terminated.
  #
  # You can add *secondary private IPs* to a VNIC after it's created. For more
  # information, see the `privateIp` operations and also
  # [IP Addresses](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingIPaddresses.htm).
  #
  # **Note:** Only
  # {#list_private_ips list_private_ips} and
  # {#get_private_ip get_private_ip} work with
  # *primary* private IPs. To create and update primary private IPs, you instead
  # work with instance and VNIC operations. For example, a primary private IP's
  # properties come from the values you specify in
  # {CreateVnicDetails} when calling either
  # {#launch_instance launch_instance} or
  # {#attach_vnic attach_vnic}. To update the hostname
  # for a primary private IP, you use {#update_vnic update_vnic}.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::PrivateIp # rubocop:disable Metrics/LineLength
    # The private IP's availability domain.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the compartment containing the private IP.
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

    # The hostname for the private IP. Used for DNS. The value is the hostname
    # portion of the private IP's fully qualified domain name (FQDN)
    # (for example, `bminstance-1` in FQDN `bminstance-1.subnet123.vcn1.oraclevcn.com`).
    # Must be unique across all VNICs in the subnet and comply with
    # [RFC 952](https://tools.ietf.org/html/rfc952) and
    # [RFC 1123](https://tools.ietf.org/html/rfc1123).
    #
    # For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/dns.htm).
    #
    # Example: `bminstance-1`
    #
    # @return [String]
    attr_accessor :hostname_label

    # The private IP's Oracle ID (OCID).
    # @return [String]
    attr_accessor :id

    # The private IP address of the `privateIp` object. The address is within the CIDR
    # of the VNIC's subnet.
    #
    # Example: `10.0.3.3`
    #
    # @return [String]
    attr_accessor :ip_address

    # Whether this private IP is the primary one on the VNIC. Primary private IPs
    # are unassigned and deleted automatically when the VNIC is terminated.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_primary

    # The OCID of the subnet the VNIC is in.
    # @return [String]
    attr_accessor :subnet_id

    # The date and time the private IP was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The OCID of the VNIC the private IP is assigned to. The VNIC and private IP
    # must be in the same subnet.
    #
    # @return [String]
    attr_accessor :vnic_id

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
        'ip_address': :'ipAddress',
        'is_primary': :'isPrimary',
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
        'availability_domain': :'String',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname_label': :'String',
        'id': :'String',
        'ip_address': :'String',
        'is_primary': :'BOOLEAN',
        'subnet_id': :'String',
        'time_created': :'DateTime',
        'vnic_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [BOOLEAN] :is_primary The value to assign to the {#is_primary} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :vnic_id The value to assign to the {#vnic_id} property
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

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.is_primary = attributes[:'isPrimary'] unless attributes[:'isPrimary'].nil?

      raise 'You cannot provide both :isPrimary and :is_primary' if attributes.key?(:'isPrimary') && attributes.key?(:'is_primary')

      self.is_primary = attributes[:'is_primary'] unless attributes[:'is_primary'].nil?

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
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        ip_address == other.ip_address &&
        is_primary == other.is_primary &&
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

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [availability_domain, compartment_id, defined_tags, display_name, freeform_tags, hostname_label, id, ip_address, is_primary, subnet_id, time_created, vnic_id].hash
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
