# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains the properties of the VNIC for an instance configuration. See {CreateVnicDetails}
  # and [Instance Configurations](https://docs.cloud.oracle.com/iaas/Content/Compute/Concepts/instancemanagement.htm#config) for more information.
  #
  class Core::Models::InstanceConfigurationCreateVnicDetails
    # Whether to allocate an IPv6 address at instance and VNIC creation from an IPv6 enabled
    # subnet. Default: False. When provided you may optionally provide an IPv6 prefix
    # (`ipv6SubnetCidr`) of your choice to assign the IPv6 address from. If `ipv6SubnetCidr`
    # is not provided then an IPv6 prefix is chosen
    # for you.
    #
    # @return [BOOLEAN]
    attr_accessor :assign_ipv6_ip

    # Whether the VNIC should be assigned a public IP address. See the `assignPublicIp` attribute of {CreateVnicDetails}
    # for more information.
    #
    # @return [BOOLEAN]
    attr_accessor :assign_public_ip

    # Whether the VNIC should be assigned a private DNS record. See the `assignPrivateDnsRecord` attribute of {CreateVnicDetails}
    # for more information.
    #
    # @return [BOOLEAN]
    attr_accessor :assign_private_dns_record

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # A list of IPv6 prefixes from which the VNIC should be assigned an IPv6 address.
    # You can provide only the prefix and OCI selects an available
    # address from the range. You can optionally choose to leave the prefix range empty
    # and instead provide the specific IPv6 address that should be used from within that range.
    #
    # @return [Array<OCI::Core::Models::InstanceConfigurationIpv6AddressIpv6SubnetCidrPairDetails>]
    attr_accessor :ipv6_address_ipv6_subnet_cidr_pair_details

    # The hostname for the VNIC's primary private IP.
    # See the `hostnameLabel` attribute of {CreateVnicDetails} for more information.
    #
    # @return [String]
    attr_accessor :hostname_label

    # A list of the OCIDs of the network security groups (NSGs) to add the VNIC to. For more
    # information about NSGs, see
    # {NetworkSecurityGroup}.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # A private IP address of your choice to assign to the VNIC.
    # See the `privateIp` attribute of {CreateVnicDetails} for more information.
    #
    # @return [String]
    attr_accessor :private_ip

    # Whether the source/destination check is disabled on the VNIC.
    # See the `skipSourceDestCheck` attribute of {CreateVnicDetails} for more information.
    #
    # @return [BOOLEAN]
    attr_accessor :skip_source_dest_check

    # The OCID of the subnet to create the VNIC in.
    # See the `subnetId` attribute of {CreateVnicDetails} for more information.
    #
    # @return [String]
    attr_accessor :subnet_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'assign_ipv6_ip': :'assignIpv6Ip',
        'assign_public_ip': :'assignPublicIp',
        'assign_private_dns_record': :'assignPrivateDnsRecord',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'ipv6_address_ipv6_subnet_cidr_pair_details': :'ipv6AddressIpv6SubnetCidrPairDetails',
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
        'assign_ipv6_ip': :'BOOLEAN',
        'assign_public_ip': :'BOOLEAN',
        'assign_private_dns_record': :'BOOLEAN',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'ipv6_address_ipv6_subnet_cidr_pair_details': :'Array<OCI::Core::Models::InstanceConfigurationIpv6AddressIpv6SubnetCidrPairDetails>',
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
    # @option attributes [BOOLEAN] :assign_ipv6_ip The value to assign to the {#assign_ipv6_ip} property
    # @option attributes [BOOLEAN] :assign_public_ip The value to assign to the {#assign_public_ip} property
    # @option attributes [BOOLEAN] :assign_private_dns_record The value to assign to the {#assign_private_dns_record} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Array<OCI::Core::Models::InstanceConfigurationIpv6AddressIpv6SubnetCidrPairDetails>] :ipv6_address_ipv6_subnet_cidr_pair_details The value to assign to the {#ipv6_address_ipv6_subnet_cidr_pair_details} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    # @option attributes [BOOLEAN] :skip_source_dest_check The value to assign to the {#skip_source_dest_check} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.assign_ipv6_ip = attributes[:'assignIpv6Ip'] unless attributes[:'assignIpv6Ip'].nil?
      self.assign_ipv6_ip = false if assign_ipv6_ip.nil? && !attributes.key?(:'assignIpv6Ip') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :assignIpv6Ip and :assign_ipv6_ip' if attributes.key?(:'assignIpv6Ip') && attributes.key?(:'assign_ipv6_ip')

      self.assign_ipv6_ip = attributes[:'assign_ipv6_ip'] unless attributes[:'assign_ipv6_ip'].nil?
      self.assign_ipv6_ip = false if assign_ipv6_ip.nil? && !attributes.key?(:'assignIpv6Ip') && !attributes.key?(:'assign_ipv6_ip') # rubocop:disable Style/StringLiterals

      self.assign_public_ip = attributes[:'assignPublicIp'] unless attributes[:'assignPublicIp'].nil?

      raise 'You cannot provide both :assignPublicIp and :assign_public_ip' if attributes.key?(:'assignPublicIp') && attributes.key?(:'assign_public_ip')

      self.assign_public_ip = attributes[:'assign_public_ip'] unless attributes[:'assign_public_ip'].nil?

      self.assign_private_dns_record = attributes[:'assignPrivateDnsRecord'] unless attributes[:'assignPrivateDnsRecord'].nil?

      raise 'You cannot provide both :assignPrivateDnsRecord and :assign_private_dns_record' if attributes.key?(:'assignPrivateDnsRecord') && attributes.key?(:'assign_private_dns_record')

      self.assign_private_dns_record = attributes[:'assign_private_dns_record'] unless attributes[:'assign_private_dns_record'].nil?

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.ipv6_address_ipv6_subnet_cidr_pair_details = attributes[:'ipv6AddressIpv6SubnetCidrPairDetails'] if attributes[:'ipv6AddressIpv6SubnetCidrPairDetails']

      raise 'You cannot provide both :ipv6AddressIpv6SubnetCidrPairDetails and :ipv6_address_ipv6_subnet_cidr_pair_details' if attributes.key?(:'ipv6AddressIpv6SubnetCidrPairDetails') && attributes.key?(:'ipv6_address_ipv6_subnet_cidr_pair_details')

      self.ipv6_address_ipv6_subnet_cidr_pair_details = attributes[:'ipv6_address_ipv6_subnet_cidr_pair_details'] if attributes[:'ipv6_address_ipv6_subnet_cidr_pair_details']

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
        assign_ipv6_ip == other.assign_ipv6_ip &&
        assign_public_ip == other.assign_public_ip &&
        assign_private_dns_record == other.assign_private_dns_record &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        ipv6_address_ipv6_subnet_cidr_pair_details == other.ipv6_address_ipv6_subnet_cidr_pair_details &&
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
      [assign_ipv6_ip, assign_public_ip, assign_private_dns_record, defined_tags, display_name, freeform_tags, ipv6_address_ipv6_subnet_cidr_pair_details, hostname_label, nsg_ids, private_ip, skip_source_dest_check, subnet_id].hash
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
