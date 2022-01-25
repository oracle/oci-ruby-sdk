# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CreateVcnDetails model.
  class Core::Models::CreateVcnDetails
    # **Deprecated.** Do *not* set this value. Use `cidrBlocks` instead.
    # Example: `10.0.0.0/16`
    #
    # @return [String]
    attr_accessor :cidr_block

    # The list of one or more IPv4 CIDR blocks for the VCN that meet the following criteria:
    # - The CIDR blocks must be valid.
    # - They must not overlap with each other or with the on-premises network CIDR block.
    # - The number of CIDR blocks must not exceed the limit of CIDR blocks allowed per VCN.
    #
    # **Important:** Do *not* specify a value for `cidrBlock`. Use this parameter instead.
    #
    # @return [Array<String>]
    attr_accessor :cidr_blocks

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment to contain the VCN.
    # @return [String]
    attr_accessor :compartment_id

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

    # A DNS label for the VCN, used in conjunction with the VNIC's hostname and
    # subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC
    # within this subnet (for example, `bminstance-1.subnet123.vcn1.oraclevcn.com`).
    # Not required to be unique, but it's a best practice to set unique DNS labels
    # for VCNs in your tenancy. Must be an alphanumeric string that begins with a letter.
    # The value cannot be changed.
    #
    # You must set this value if you want instances to be able to use hostnames to
    # resolve other instances in the VCN. Otherwise the Internet and VCN Resolver
    # will not work.
    #
    # For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/dns.htm).
    #
    # Example: `vcn1`
    #
    # @return [String]
    attr_accessor :dns_label

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Whether IPv6 is enabled for the VCN. Default is `false`.
    # If enabled, Oracle will assign the VCN a IPv6 /56 CIDR block.
    # For important details about IPv6 addressing in a VCN, see [IPv6 Addresses](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/ipv6.htm).
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_ipv6_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cidr_block': :'cidrBlock',
        'cidr_blocks': :'cidrBlocks',
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'dns_label': :'dnsLabel',
        'freeform_tags': :'freeformTags',
        'is_ipv6_enabled': :'isIpv6Enabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cidr_block': :'String',
        'cidr_blocks': :'Array<String>',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'dns_label': :'String',
        'freeform_tags': :'Hash<String, String>',
        'is_ipv6_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cidr_block The value to assign to the {#cidr_block} property
    # @option attributes [Array<String>] :cidr_blocks The value to assign to the {#cidr_blocks} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :dns_label The value to assign to the {#dns_label} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [BOOLEAN] :is_ipv6_enabled The value to assign to the {#is_ipv6_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cidr_block = attributes[:'cidrBlock'] if attributes[:'cidrBlock']

      raise 'You cannot provide both :cidrBlock and :cidr_block' if attributes.key?(:'cidrBlock') && attributes.key?(:'cidr_block')

      self.cidr_block = attributes[:'cidr_block'] if attributes[:'cidr_block']

      self.cidr_blocks = attributes[:'cidrBlocks'] if attributes[:'cidrBlocks']

      raise 'You cannot provide both :cidrBlocks and :cidr_blocks' if attributes.key?(:'cidrBlocks') && attributes.key?(:'cidr_blocks')

      self.cidr_blocks = attributes[:'cidr_blocks'] if attributes[:'cidr_blocks']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.dns_label = attributes[:'dnsLabel'] if attributes[:'dnsLabel']

      raise 'You cannot provide both :dnsLabel and :dns_label' if attributes.key?(:'dnsLabel') && attributes.key?(:'dns_label')

      self.dns_label = attributes[:'dns_label'] if attributes[:'dns_label']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.is_ipv6_enabled = attributes[:'isIpv6Enabled'] unless attributes[:'isIpv6Enabled'].nil?

      raise 'You cannot provide both :isIpv6Enabled and :is_ipv6_enabled' if attributes.key?(:'isIpv6Enabled') && attributes.key?(:'is_ipv6_enabled')

      self.is_ipv6_enabled = attributes[:'is_ipv6_enabled'] unless attributes[:'is_ipv6_enabled'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cidr_block == other.cidr_block &&
        cidr_blocks == other.cidr_blocks &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        dns_label == other.dns_label &&
        freeform_tags == other.freeform_tags &&
        is_ipv6_enabled == other.is_ipv6_enabled
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
      [cidr_block, cidr_blocks, compartment_id, defined_tags, display_name, dns_label, freeform_tags, is_ipv6_enabled].hash
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
