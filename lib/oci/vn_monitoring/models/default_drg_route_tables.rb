# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The default DRG route table for this DRG. Each network type
  # has a default DRG route table.
  #
  # You can update a network type to use a different DRG route table, but
  # each network type must have a default DRG route table. You cannot delete
  # a default DRG route table.
  #
  class VnMonitoring::Models::DefaultDrgRouteTables
    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the default DRG route table to be assigned to DRG attachments
    # of type VCN on creation.
    #
    # @return [String]
    attr_accessor :vcn

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the default DRG route table assigned to DRG attachments
    # of type IPSEC_TUNNEL on creation.
    #
    # @return [String]
    attr_accessor :ipsec_tunnel

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the default DRG route table to be assigned to DRG attachments
    # of type VIRTUAL_CIRCUIT on creation.
    #
    # @return [String]
    attr_accessor :virtual_circuit

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the default DRG route table to be assigned to DRG attachments
    # of type REMOTE_PEERING_CONNECTION on creation.
    #
    # @return [String]
    attr_accessor :remote_peering_connection

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'vcn': :'vcn',
        'ipsec_tunnel': :'ipsecTunnel',
        'virtual_circuit': :'virtualCircuit',
        'remote_peering_connection': :'remotePeeringConnection'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'vcn': :'String',
        'ipsec_tunnel': :'String',
        'virtual_circuit': :'String',
        'remote_peering_connection': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :vcn The value to assign to the {#vcn} property
    # @option attributes [String] :ipsec_tunnel The value to assign to the {#ipsec_tunnel} property
    # @option attributes [String] :virtual_circuit The value to assign to the {#virtual_circuit} property
    # @option attributes [String] :remote_peering_connection The value to assign to the {#remote_peering_connection} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.vcn = attributes[:'vcn'] if attributes[:'vcn']

      self.ipsec_tunnel = attributes[:'ipsecTunnel'] if attributes[:'ipsecTunnel']

      raise 'You cannot provide both :ipsecTunnel and :ipsec_tunnel' if attributes.key?(:'ipsecTunnel') && attributes.key?(:'ipsec_tunnel')

      self.ipsec_tunnel = attributes[:'ipsec_tunnel'] if attributes[:'ipsec_tunnel']

      self.virtual_circuit = attributes[:'virtualCircuit'] if attributes[:'virtualCircuit']

      raise 'You cannot provide both :virtualCircuit and :virtual_circuit' if attributes.key?(:'virtualCircuit') && attributes.key?(:'virtual_circuit')

      self.virtual_circuit = attributes[:'virtual_circuit'] if attributes[:'virtual_circuit']

      self.remote_peering_connection = attributes[:'remotePeeringConnection'] if attributes[:'remotePeeringConnection']

      raise 'You cannot provide both :remotePeeringConnection and :remote_peering_connection' if attributes.key?(:'remotePeeringConnection') && attributes.key?(:'remote_peering_connection')

      self.remote_peering_connection = attributes[:'remote_peering_connection'] if attributes[:'remote_peering_connection']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        vcn == other.vcn &&
        ipsec_tunnel == other.ipsec_tunnel &&
        virtual_circuit == other.virtual_circuit &&
        remote_peering_connection == other.remote_peering_connection
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
      [vcn, ipsec_tunnel, virtual_circuit, remote_peering_connection].hash
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
