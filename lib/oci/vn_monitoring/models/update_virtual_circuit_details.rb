# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpdateVirtualCircuitDetails model.
  class VnMonitoring::Models::UpdateVirtualCircuitDetails
    PROVIDER_STATE_ENUM = [
      PROVIDER_STATE_ACTIVE = 'ACTIVE'.freeze,
      PROVIDER_STATE_INACTIVE = 'INACTIVE'.freeze
    ].freeze

    # The provisioned data rate of the connection. To get a list of the
    # available bandwidth levels (that is, shapes), see
    # {#list_fast_connect_provider_virtual_circuit_bandwidth_shapes list_fast_connect_provider_virtual_circuit_bandwidth_shapes}.
    # To be updated only by the customer who owns the virtual circuit.
    #
    # @return [String]
    attr_accessor :bandwidth_shape_name

    # An array of mappings, each containing properties for a cross-connect or
    # cross-connect group associated with this virtual circuit.
    #
    # The customer and provider can update different properties in the mapping
    # depending on the situation. See the description of the
    # {CrossConnectMapping}.
    #
    # @return [Array<OCI::VnMonitoring::Models::CrossConnectMapping>]
    attr_accessor :cross_connect_mappings

    # The BGP ASN of the network at the other end of the BGP
    # session from Oracle.
    #
    # If the BGP session is from the customer's edge router to Oracle, the
    # required value is the customer's ASN, and it can be updated only
    # by the customer.
    #
    # If the BGP session is from the provider's edge router to Oracle, the
    # required value is the provider's ASN, and it can be updated only
    # by the provider.
    #
    # @return [Integer]
    attr_accessor :customer_bgp_asn

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the {Drg}
    # that this private virtual circuit uses.
    #
    # To be updated only by the customer who owns the virtual circuit.
    #
    # @return [String]
    attr_accessor :gateway_id

    # The provider's state in relation to this virtual circuit. Relevant only
    # if the customer is using FastConnect via a provider. ACTIVE
    # means the provider has provisioned the virtual circuit from their
    # end. INACTIVE means the provider has not yet provisioned the virtual
    # circuit, or has de-provisioned it.
    #
    # To be updated only by the provider.
    #
    # @return [String]
    attr_reader :provider_state

    # Provider-supplied reference information about this virtual circuit.
    # Relevant only if the customer is using FastConnect via a provider.
    #
    # To be updated only by the provider.
    #
    # @return [String]
    attr_accessor :reference_comment

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bandwidth_shape_name': :'bandwidthShapeName',
        'cross_connect_mappings': :'crossConnectMappings',
        'customer_bgp_asn': :'customerBgpAsn',
        'display_name': :'displayName',
        'gateway_id': :'gatewayId',
        'provider_state': :'providerState',
        'reference_comment': :'referenceComment'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bandwidth_shape_name': :'String',
        'cross_connect_mappings': :'Array<OCI::VnMonitoring::Models::CrossConnectMapping>',
        'customer_bgp_asn': :'Integer',
        'display_name': :'String',
        'gateway_id': :'String',
        'provider_state': :'String',
        'reference_comment': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bandwidth_shape_name The value to assign to the {#bandwidth_shape_name} property
    # @option attributes [Array<OCI::VnMonitoring::Models::CrossConnectMapping>] :cross_connect_mappings The value to assign to the {#cross_connect_mappings} property
    # @option attributes [Integer] :customer_bgp_asn The value to assign to the {#customer_bgp_asn} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :gateway_id The value to assign to the {#gateway_id} property
    # @option attributes [String] :provider_state The value to assign to the {#provider_state} property
    # @option attributes [String] :reference_comment The value to assign to the {#reference_comment} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bandwidth_shape_name = attributes[:'bandwidthShapeName'] if attributes[:'bandwidthShapeName']

      raise 'You cannot provide both :bandwidthShapeName and :bandwidth_shape_name' if attributes.key?(:'bandwidthShapeName') && attributes.key?(:'bandwidth_shape_name')

      self.bandwidth_shape_name = attributes[:'bandwidth_shape_name'] if attributes[:'bandwidth_shape_name']

      self.cross_connect_mappings = attributes[:'crossConnectMappings'] if attributes[:'crossConnectMappings']

      raise 'You cannot provide both :crossConnectMappings and :cross_connect_mappings' if attributes.key?(:'crossConnectMappings') && attributes.key?(:'cross_connect_mappings')

      self.cross_connect_mappings = attributes[:'cross_connect_mappings'] if attributes[:'cross_connect_mappings']

      self.customer_bgp_asn = attributes[:'customerBgpAsn'] if attributes[:'customerBgpAsn']

      raise 'You cannot provide both :customerBgpAsn and :customer_bgp_asn' if attributes.key?(:'customerBgpAsn') && attributes.key?(:'customer_bgp_asn')

      self.customer_bgp_asn = attributes[:'customer_bgp_asn'] if attributes[:'customer_bgp_asn']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.gateway_id = attributes[:'gatewayId'] if attributes[:'gatewayId']

      raise 'You cannot provide both :gatewayId and :gateway_id' if attributes.key?(:'gatewayId') && attributes.key?(:'gateway_id')

      self.gateway_id = attributes[:'gateway_id'] if attributes[:'gateway_id']

      self.provider_state = attributes[:'providerState'] if attributes[:'providerState']

      raise 'You cannot provide both :providerState and :provider_state' if attributes.key?(:'providerState') && attributes.key?(:'provider_state')

      self.provider_state = attributes[:'provider_state'] if attributes[:'provider_state']

      self.reference_comment = attributes[:'referenceComment'] if attributes[:'referenceComment']

      raise 'You cannot provide both :referenceComment and :reference_comment' if attributes.key?(:'referenceComment') && attributes.key?(:'reference_comment')

      self.reference_comment = attributes[:'reference_comment'] if attributes[:'reference_comment']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] provider_state Object to be assigned
    def provider_state=(provider_state)
      raise "Invalid value for 'provider_state': this must be one of the values in PROVIDER_STATE_ENUM." if provider_state && !PROVIDER_STATE_ENUM.include?(provider_state)

      @provider_state = provider_state
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bandwidth_shape_name == other.bandwidth_shape_name &&
        cross_connect_mappings == other.cross_connect_mappings &&
        customer_bgp_asn == other.customer_bgp_asn &&
        display_name == other.display_name &&
        gateway_id == other.gateway_id &&
        provider_state == other.provider_state &&
        reference_comment == other.reference_comment
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
      [bandwidth_shape_name, cross_connect_mappings, customer_bgp_asn, display_name, gateway_id, provider_state, reference_comment].hash
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
