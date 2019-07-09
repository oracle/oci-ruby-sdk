# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains properties for a VNIC. You use this object when creating the
  # primary VNIC during instance launch or when creating a secondary VNIC.
  # For more information about VNICs, see
  # [Virtual Network Interface Cards (VNICs)](https://docs.cloud.oracle.com/Content/Network/Tasks/managingVNICs.htm).
  #
  class Core::Models::CreateVnicDetails
    # Whether the VNIC should be assigned a public IP address. Defaults to whether
    # the subnet is public or private. If not set and the VNIC is being created
    # in a private subnet (that is, where `prohibitPublicIpOnVnic` = true in the
    # {Subnet}), then no public IP address is assigned.
    # If not set and the subnet is public (`prohibitPublicIpOnVnic` = false), then
    # a public IP address is assigned. If set to true and
    # `prohibitPublicIpOnVnic` = true, an error is returned.
    #
    # **Note:** This public IP address is associated with the primary private IP
    # on the VNIC. For more information, see
    # [IP Addresses](https://docs.cloud.oracle.com/Content/Network/Tasks/managingIPaddresses.htm).
    #
    # **Note:** There's a limit to the number of {PublicIp}
    # a VNIC or instance can have. If you try to create a secondary VNIC
    # with an assigned public IP for an instance that has already
    # reached its public IP limit, an error is returned. For information
    # about the public IP limits, see
    # [Public IP Addresses](https://docs.cloud.oracle.com/Content/Network/Tasks/managingpublicIPs.htm).
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :assign_public_ip

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name for the VNIC. Does not have to be unique.
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
    # The value appears in the {Vnic} object and also the
    # {PrivateIp} object returned by
    # {#list_private_ips list_private_ips} and
    # {#get_private_ip get_private_ip}.
    #
    # For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).
    #
    # When launching an instance, use this `hostnameLabel` instead
    # of the deprecated `hostnameLabel` in
    # {#launch_instance_details launch_instance_details}.
    # If you provide both, the values must match.
    #
    # Example: `bminstance-1`
    #
    # @return [String]
    attr_accessor :hostname_label

    # A list of the OCIDs of the network security groups (NSGs) to add the VNIC to. For more
    # information about NSGs, see
    # {NetworkSecurityGroup}.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # A private IP address of your choice to assign to the VNIC. Must be an
    # available IP address within the subnet's CIDR. If you don't specify a
    # value, Oracle automatically assigns a private IP address from the subnet.
    # This is the VNIC's *primary* private IP address. The value appears in
    # the {Vnic} object and also the
    # {PrivateIp} object returned by
    # {#list_private_ips list_private_ips} and
    # {#get_private_ip get_private_ip}.
    #
    # Example: `10.0.3.3`
    #
    # @return [String]
    attr_accessor :private_ip

    # Whether the source/destination check is disabled on the VNIC.
    # Defaults to `false`, which means the check is performed. For information
    # about why you would skip the source/destination check, see
    # [Using a Private IP as a Route Target](https://docs.cloud.oracle.com/Content/Network/Tasks/managingroutetables.htm#privateip).
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :skip_source_dest_check

    # **[Required]** The OCID of the subnet to create the VNIC in. When launching an instance,
    # use this `subnetId` instead of the deprecated `subnetId` in
    # {#launch_instance_details launch_instance_details}.
    # At least one of them is required; if you provide both, the values must match.
    #
    # @return [String]
    attr_accessor :subnet_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'assign_public_ip': :'assignPublicIp',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'hostname_label': :'hostnameLabel',
        'nsg_ids': :'nsgIds',
        'private_ip': :'privateIp',
        'skip_source_dest_check': :'skipSourceDestCheck',
        'subnet_id': :'subnetId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'assign_public_ip': :'BOOLEAN',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname_label': :'String',
        'nsg_ids': :'Array<String>',
        'private_ip': :'String',
        'skip_source_dest_check': :'BOOLEAN',
        'subnet_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :assign_public_ip The value to assign to the {#assign_public_ip} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    # @option attributes [BOOLEAN] :skip_source_dest_check The value to assign to the {#skip_source_dest_check} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.assign_public_ip = attributes[:'assignPublicIp'] unless attributes[:'assignPublicIp'].nil?

      raise 'You cannot provide both :assignPublicIp and :assign_public_ip' if attributes.key?(:'assignPublicIp') && attributes.key?(:'assign_public_ip')

      self.assign_public_ip = attributes[:'assign_public_ip'] unless attributes[:'assign_public_ip'].nil?

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

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.private_ip = attributes[:'privateIp'] if attributes[:'privateIp']

      raise 'You cannot provide both :privateIp and :private_ip' if attributes.key?(:'privateIp') && attributes.key?(:'private_ip')

      self.private_ip = attributes[:'private_ip'] if attributes[:'private_ip']

      self.skip_source_dest_check = attributes[:'skipSourceDestCheck'] unless attributes[:'skipSourceDestCheck'].nil?

      raise 'You cannot provide both :skipSourceDestCheck and :skip_source_dest_check' if attributes.key?(:'skipSourceDestCheck') && attributes.key?(:'skip_source_dest_check')

      self.skip_source_dest_check = attributes[:'skip_source_dest_check'] unless attributes[:'skip_source_dest_check'].nil?

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        assign_public_ip == other.assign_public_ip &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        hostname_label == other.hostname_label &&
        nsg_ids == other.nsg_ids &&
        private_ip == other.private_ip &&
        skip_source_dest_check == other.skip_source_dest_check &&
        subnet_id == other.subnet_id
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
      [assign_public_ip, defined_tags, display_name, freeform_tags, hostname_label, nsg_ids, private_ip, skip_source_dest_check, subnet_id].hash
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
