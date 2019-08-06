# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CreateSubnetDetails model.
  class Core::Models::CreateSubnetDetails
    # Controls whether the subnet is regional or specific to an availability domain. Oracle
    # recommends creating regional subnets because they're more flexible and make it easier to
    # implement failover across availability domains. Originally, AD-specific subnets were the
    # only kind available to use.
    #
    # To create a regional subnet, omit this attribute. Then any resources later created in this
    # subnet (such as a Compute instance) can be created in any availability domain in the region.
    #
    # To instead create an AD-specific subnet, set this attribute to the availability domain you
    # want this subnet to be in. Then any resources later created in this subnet can only be
    # created in that availability domain.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** The CIDR IP address range of the subnet.
    #
    # Example: `172.16.1.0/24`
    #
    # @return [String]
    attr_accessor :cidr_block

    # **[Required]** The OCID of the compartment to contain the subnet.
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The OCID of the set of DHCP options the subnet will use. If you don't
    # provide a value, the subnet uses the VCN's default set of DHCP options.
    #
    # @return [String]
    attr_accessor :dhcp_options_id

    # A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # A DNS label for the subnet, used in conjunction with the VNIC's hostname and
    # VCN's DNS label to form a fully qualified domain name (FQDN) for each VNIC
    # within this subnet (for example, `bminstance-1.subnet123.vcn1.oraclevcn.com`).
    # Must be an alphanumeric string that begins with a letter and is unique within the VCN.
    # The value cannot be changed.
    #
    # This value must be set if you want to use the Internet and VCN Resolver to resolve the
    # hostnames of instances in the subnet. It can only be set if the VCN itself
    # was created with a DNS label.
    #
    # For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).
    #
    # Example: `subnet123`
    #
    # @return [String]
    attr_accessor :dns_label

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Use this to enable IPv6 addressing for this subnet. The VCN must be enabled for IPv6.
    # You can't change this subnet characteristic later. All subnets are /64 in size. The subnet
    # portion of the IPv6 address is the fourth hextet from the left (1111 in the following example).
    #
    # For important details about IPv6 addressing in a VCN, see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).
    #
    # Example: `2001:0db8:0123:1111::/64`
    #
    # @return [String]
    attr_accessor :ipv6_cidr_block

    # Whether VNICs within this subnet can have public IP addresses.
    # Defaults to false, which means VNICs created in this subnet will
    # automatically be assigned public IP addresses unless specified
    # otherwise during instance launch or VNIC creation (with the
    # `assignPublicIp` flag in {CreateVnicDetails}).
    # If `prohibitPublicIpOnVnic` is set to true, VNICs created in this
    # subnet cannot have public IP addresses (that is, it's a private
    # subnet).
    #
    # For IPv6, if `prohibitPublicIpOnVnic` is set to `true`, internet access is not allowed for any
    # IPv6s assigned to VNICs in the subnet.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :prohibit_public_ip_on_vnic

    # The OCID of the route table the subnet will use. If you don't provide a value,
    # the subnet uses the VCN's default route table.
    #
    # @return [String]
    attr_accessor :route_table_id

    # The OCIDs of the security list or lists the subnet will use. If you don't
    # provide a value, the subnet uses the VCN's default security list.
    # Remember that security lists are associated *with the subnet*, but the
    # rules are applied to the individual VNICs in the subnet.
    #
    # @return [Array<String>]
    attr_accessor :security_list_ids

    # **[Required]** The OCID of the VCN to contain the subnet.
    # @return [String]
    attr_accessor :vcn_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'cidr_block': :'cidrBlock',
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'dhcp_options_id': :'dhcpOptionsId',
        'display_name': :'displayName',
        'dns_label': :'dnsLabel',
        'freeform_tags': :'freeformTags',
        'ipv6_cidr_block': :'ipv6CidrBlock',
        'prohibit_public_ip_on_vnic': :'prohibitPublicIpOnVnic',
        'route_table_id': :'routeTableId',
        'security_list_ids': :'securityListIds',
        'vcn_id': :'vcnId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'cidr_block': :'String',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'dhcp_options_id': :'String',
        'display_name': :'String',
        'dns_label': :'String',
        'freeform_tags': :'Hash<String, String>',
        'ipv6_cidr_block': :'String',
        'prohibit_public_ip_on_vnic': :'BOOLEAN',
        'route_table_id': :'String',
        'security_list_ids': :'Array<String>',
        'vcn_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :cidr_block The value to assign to the {#cidr_block} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :dhcp_options_id The value to assign to the {#dhcp_options_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :dns_label The value to assign to the {#dns_label} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :ipv6_cidr_block The value to assign to the {#ipv6_cidr_block} property
    # @option attributes [BOOLEAN] :prohibit_public_ip_on_vnic The value to assign to the {#prohibit_public_ip_on_vnic} property
    # @option attributes [String] :route_table_id The value to assign to the {#route_table_id} property
    # @option attributes [Array<String>] :security_list_ids The value to assign to the {#security_list_ids} property
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.cidr_block = attributes[:'cidrBlock'] if attributes[:'cidrBlock']

      raise 'You cannot provide both :cidrBlock and :cidr_block' if attributes.key?(:'cidrBlock') && attributes.key?(:'cidr_block')

      self.cidr_block = attributes[:'cidr_block'] if attributes[:'cidr_block']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.dhcp_options_id = attributes[:'dhcpOptionsId'] if attributes[:'dhcpOptionsId']

      raise 'You cannot provide both :dhcpOptionsId and :dhcp_options_id' if attributes.key?(:'dhcpOptionsId') && attributes.key?(:'dhcp_options_id')

      self.dhcp_options_id = attributes[:'dhcp_options_id'] if attributes[:'dhcp_options_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.dns_label = attributes[:'dnsLabel'] if attributes[:'dnsLabel']

      raise 'You cannot provide both :dnsLabel and :dns_label' if attributes.key?(:'dnsLabel') && attributes.key?(:'dns_label')

      self.dns_label = attributes[:'dns_label'] if attributes[:'dns_label']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.ipv6_cidr_block = attributes[:'ipv6CidrBlock'] if attributes[:'ipv6CidrBlock']

      raise 'You cannot provide both :ipv6CidrBlock and :ipv6_cidr_block' if attributes.key?(:'ipv6CidrBlock') && attributes.key?(:'ipv6_cidr_block')

      self.ipv6_cidr_block = attributes[:'ipv6_cidr_block'] if attributes[:'ipv6_cidr_block']

      self.prohibit_public_ip_on_vnic = attributes[:'prohibitPublicIpOnVnic'] unless attributes[:'prohibitPublicIpOnVnic'].nil?

      raise 'You cannot provide both :prohibitPublicIpOnVnic and :prohibit_public_ip_on_vnic' if attributes.key?(:'prohibitPublicIpOnVnic') && attributes.key?(:'prohibit_public_ip_on_vnic')

      self.prohibit_public_ip_on_vnic = attributes[:'prohibit_public_ip_on_vnic'] unless attributes[:'prohibit_public_ip_on_vnic'].nil?

      self.route_table_id = attributes[:'routeTableId'] if attributes[:'routeTableId']

      raise 'You cannot provide both :routeTableId and :route_table_id' if attributes.key?(:'routeTableId') && attributes.key?(:'route_table_id')

      self.route_table_id = attributes[:'route_table_id'] if attributes[:'route_table_id']

      self.security_list_ids = attributes[:'securityListIds'] if attributes[:'securityListIds']

      raise 'You cannot provide both :securityListIds and :security_list_ids' if attributes.key?(:'securityListIds') && attributes.key?(:'security_list_ids')

      self.security_list_ids = attributes[:'security_list_ids'] if attributes[:'security_list_ids']

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_domain == other.availability_domain &&
        cidr_block == other.cidr_block &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        dhcp_options_id == other.dhcp_options_id &&
        display_name == other.display_name &&
        dns_label == other.dns_label &&
        freeform_tags == other.freeform_tags &&
        ipv6_cidr_block == other.ipv6_cidr_block &&
        prohibit_public_ip_on_vnic == other.prohibit_public_ip_on_vnic &&
        route_table_id == other.route_table_id &&
        security_list_ids == other.security_list_ids &&
        vcn_id == other.vcn_id
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
      [availability_domain, cidr_block, compartment_id, defined_tags, dhcp_options_id, display_name, dns_label, freeform_tags, ipv6_cidr_block, prohibit_public_ip_on_vnic, route_table_id, security_list_ids, vcn_id].hash
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
