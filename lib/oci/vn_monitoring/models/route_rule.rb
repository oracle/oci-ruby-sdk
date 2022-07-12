# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A mapping between a destination IP address range and a virtual device to route matching
  # packets to (a target).
  #
  class VnMonitoring::Models::RouteRule
    DESTINATION_TYPE_ENUM = [
      DESTINATION_TYPE_CIDR_BLOCK = 'CIDR_BLOCK'.freeze,
      DESTINATION_TYPE_SERVICE_CIDR_BLOCK = 'SERVICE_CIDR_BLOCK'.freeze,
      DESTINATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Deprecated. Instead use `destination` and `destinationType`. Requests that include both
    # `cidrBlock` and `destination` will be rejected.
    #
    # A destination IP address range in CIDR notation. Matching packets will
    # be routed to the indicated network entity (the target).
    #
    # Cannot be an IPv6 CIDR.
    #
    # Example: `0.0.0.0/0`
    #
    # @return [String]
    attr_accessor :cidr_block

    # Conceptually, this is the range of IP addresses used for matching when routing
    # traffic. Required if you provide a `destinationType`.
    #
    # Allowed values:
    #
    #   * IP address range in CIDR notation. Can be an IPv4 or IPv6 CIDR. For example: `192.168.1.0/24`
    #   or `2001:0db8:0123:45::/56`. If you set this to an IPv6 CIDR, the route rule's target
    #   can only be a DRG or internet gateway.
    #   IPv6 addressing is supported for all commercial and government regions.
    #   See [IPv6 Addresses](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/ipv6.htm).
    #
    #   * The `cidrBlock` value for a {Service}, if you're
    #     setting up a route rule for traffic destined for a particular `Service` through
    #     a service gateway. For example: `oci-phx-objectstorage`.
    #
    # @return [String]
    attr_accessor :destination

    # Type of destination for the rule. Required if you provide a `destination`.
    #
    #   * `CIDR_BLOCK`: If the rule's `destination` is an IP address range in CIDR notation.
    #
    #   * `SERVICE_CIDR_BLOCK`: If the rule's `destination` is the `cidrBlock` value for a
    #     {Service} (the rule is for traffic destined for a
    #     particular `Service` through a service gateway).
    #
    # @return [String]
    attr_reader :destination_type

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the route rule's target. For information about the type of
    # targets you can specify, see
    # [Route Tables](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm).
    #
    # @return [String]
    attr_accessor :network_entity_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cidr_block': :'cidrBlock',
        'destination': :'destination',
        'destination_type': :'destinationType',
        'network_entity_id': :'networkEntityId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cidr_block': :'String',
        'destination': :'String',
        'destination_type': :'String',
        'network_entity_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cidr_block The value to assign to the {#cidr_block} property
    # @option attributes [String] :destination The value to assign to the {#destination} property
    # @option attributes [String] :destination_type The value to assign to the {#destination_type} property
    # @option attributes [String] :network_entity_id The value to assign to the {#network_entity_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cidr_block = attributes[:'cidrBlock'] if attributes[:'cidrBlock']

      raise 'You cannot provide both :cidrBlock and :cidr_block' if attributes.key?(:'cidrBlock') && attributes.key?(:'cidr_block')

      self.cidr_block = attributes[:'cidr_block'] if attributes[:'cidr_block']

      self.destination = attributes[:'destination'] if attributes[:'destination']

      self.destination_type = attributes[:'destinationType'] if attributes[:'destinationType']
      self.destination_type = "CIDR_BLOCK" if destination_type.nil? && !attributes.key?(:'destinationType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :destinationType and :destination_type' if attributes.key?(:'destinationType') && attributes.key?(:'destination_type')

      self.destination_type = attributes[:'destination_type'] if attributes[:'destination_type']
      self.destination_type = "CIDR_BLOCK" if destination_type.nil? && !attributes.key?(:'destinationType') && !attributes.key?(:'destination_type') # rubocop:disable Style/StringLiterals

      self.network_entity_id = attributes[:'networkEntityId'] if attributes[:'networkEntityId']

      raise 'You cannot provide both :networkEntityId and :network_entity_id' if attributes.key?(:'networkEntityId') && attributes.key?(:'network_entity_id')

      self.network_entity_id = attributes[:'network_entity_id'] if attributes[:'network_entity_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] destination_type Object to be assigned
    def destination_type=(destination_type)
      # rubocop:disable Style/ConditionalAssignment
      if destination_type && !DESTINATION_TYPE_ENUM.include?(destination_type)
        OCI.logger.debug("Unknown value for 'destination_type' [" + destination_type + "]. Mapping to 'DESTINATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @destination_type = DESTINATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @destination_type = destination_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cidr_block == other.cidr_block &&
        destination == other.destination &&
        destination_type == other.destination_type &&
        network_entity_id == other.network_entity_id
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
      [cidr_block, destination, destination_type, network_entity_id].hash
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
