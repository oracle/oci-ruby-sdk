# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # For use with Oracle Cloud Infrastructure FastConnect. Each
  # {VirtualCircuit} runs on one or
  # more cross-connects or cross-connect groups. A `CrossConnectMapping`
  # contains the properties for an individual cross-connect or cross-connect group
  # associated with a given virtual circuit.
  #
  # The mapping includes information about the cross-connect or
  # cross-connect group, the VLAN, and the BGP peering session.
  #
  # If you're a customer who is colocated with Oracle, that means you own both
  # the virtual circuit and the physical connection it runs on (cross-connect or
  # cross-connect group), so you specify all the information in the mapping. There's
  # one exception: for a public virtual circuit, Oracle specifies the BGP IP
  # addresses.
  #
  # If you're a provider, then you own the physical connection that the customer's
  # virtual circuit runs on, so you contribute information about the cross-connect
  # or cross-connect group and VLAN.
  #
  # Who specifies the BGP peering information in the case of customer connection via
  # provider? If the BGP session goes from Oracle to the provider's edge router, then
  # the provider also specifies the BGP peering information. If the BGP session instead
  # goes from Oracle to the customer's edge router, then the customer specifies the BGP
  # peering information. There's one exception: for a public virtual circuit, Oracle
  # specifies the BGP IP addresses.
  #
  class Core::Models::CrossConnectMapping # rubocop:disable Metrics/LineLength
    # The key for BGP MD5 authentication. Only applicable if your system
    # requires MD5 authentication. If empty or not set (null), that
    # means you don't use BGP MD5 authentication.
    #
    # @return [String]
    attr_accessor :bgp_md5_auth_key

    # The OCID of the cross-connect or cross-connect group for this mapping.
    # Specified by the owner of the cross-connect or cross-connect group (the
    # customer if the customer is colocated with Oracle, or the provider if the
    # customer is connecting via provider).
    #
    # @return [String]
    attr_accessor :cross_connect_or_cross_connect_group_id

    # The BGP IP address for the router on the other end of the BGP session from
    # Oracle. Specified by the owner of that router. If the session goes from Oracle
    # to a customer, this is the BGP IP address of the customer's edge router. If the
    # session goes from Oracle to a provider, this is the BGP IP address of the
    # provider's edge router. Must use a /30 or /31 subnet mask.
    #
    # There's one exception: for a public virtual circuit, Oracle specifies the BGP IP addresses.
    #
    # Example: `10.0.0.18/31`
    #
    # @return [String]
    attr_accessor :customer_bgp_peering_ip

    # The IP address for Oracle's end of the BGP session. Must use a /30 or /31
    # subnet mask. If the session goes from Oracle to a customer's edge router,
    # the customer specifies this information. If the session goes from Oracle to
    # a provider's edge router, the provider specifies this.
    #
    # There's one exception: for a public virtual circuit, Oracle specifies the BGP IP addresses.
    #
    # Example: `10.0.0.19/31`
    #
    # @return [String]
    attr_accessor :oracle_bgp_peering_ip

    # The number of the specific VLAN (on the cross-connect or cross-connect group)
    # that is assigned to this virtual circuit. Specified by the owner of the cross-connect
    # or cross-connect group (the customer if the customer is colocated with Oracle, or
    # the provider if the customer is connecting via provider).
    #
    # Example: `200`
    #
    # @return [Integer]
    attr_accessor :vlan

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bgp_md5_auth_key': :'bgpMd5AuthKey',
        'cross_connect_or_cross_connect_group_id': :'crossConnectOrCrossConnectGroupId',
        'customer_bgp_peering_ip': :'customerBgpPeeringIp',
        'oracle_bgp_peering_ip': :'oracleBgpPeeringIp',
        'vlan': :'vlan'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bgp_md5_auth_key': :'String',
        'cross_connect_or_cross_connect_group_id': :'String',
        'customer_bgp_peering_ip': :'String',
        'oracle_bgp_peering_ip': :'String',
        'vlan': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bgp_md5_auth_key The value to assign to the {#bgp_md5_auth_key} property
    # @option attributes [String] :cross_connect_or_cross_connect_group_id The value to assign to the {#cross_connect_or_cross_connect_group_id} property
    # @option attributes [String] :customer_bgp_peering_ip The value to assign to the {#customer_bgp_peering_ip} property
    # @option attributes [String] :oracle_bgp_peering_ip The value to assign to the {#oracle_bgp_peering_ip} property
    # @option attributes [Integer] :vlan The value to assign to the {#vlan} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bgp_md5_auth_key = attributes[:'bgpMd5AuthKey'] if attributes[:'bgpMd5AuthKey']

      raise 'You cannot provide both :bgpMd5AuthKey and :bgp_md5_auth_key' if attributes.key?(:'bgpMd5AuthKey') && attributes.key?(:'bgp_md5_auth_key')

      self.bgp_md5_auth_key = attributes[:'bgp_md5_auth_key'] if attributes[:'bgp_md5_auth_key']

      self.cross_connect_or_cross_connect_group_id = attributes[:'crossConnectOrCrossConnectGroupId'] if attributes[:'crossConnectOrCrossConnectGroupId']

      raise 'You cannot provide both :crossConnectOrCrossConnectGroupId and :cross_connect_or_cross_connect_group_id' if attributes.key?(:'crossConnectOrCrossConnectGroupId') && attributes.key?(:'cross_connect_or_cross_connect_group_id')

      self.cross_connect_or_cross_connect_group_id = attributes[:'cross_connect_or_cross_connect_group_id'] if attributes[:'cross_connect_or_cross_connect_group_id']

      self.customer_bgp_peering_ip = attributes[:'customerBgpPeeringIp'] if attributes[:'customerBgpPeeringIp']

      raise 'You cannot provide both :customerBgpPeeringIp and :customer_bgp_peering_ip' if attributes.key?(:'customerBgpPeeringIp') && attributes.key?(:'customer_bgp_peering_ip')

      self.customer_bgp_peering_ip = attributes[:'customer_bgp_peering_ip'] if attributes[:'customer_bgp_peering_ip']

      self.oracle_bgp_peering_ip = attributes[:'oracleBgpPeeringIp'] if attributes[:'oracleBgpPeeringIp']

      raise 'You cannot provide both :oracleBgpPeeringIp and :oracle_bgp_peering_ip' if attributes.key?(:'oracleBgpPeeringIp') && attributes.key?(:'oracle_bgp_peering_ip')

      self.oracle_bgp_peering_ip = attributes[:'oracle_bgp_peering_ip'] if attributes[:'oracle_bgp_peering_ip']

      self.vlan = attributes[:'vlan'] if attributes[:'vlan']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        bgp_md5_auth_key == other.bgp_md5_auth_key &&
        cross_connect_or_cross_connect_group_id == other.cross_connect_or_cross_connect_group_id &&
        customer_bgp_peering_ip == other.customer_bgp_peering_ip &&
        oracle_bgp_peering_ip == other.oracle_bgp_peering_ip &&
        vlan == other.vlan
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
      [bgp_md5_auth_key, cross_connect_or_cross_connect_group_id, customer_bgp_peering_ip, oracle_bgp_peering_ip, vlan].hash
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
