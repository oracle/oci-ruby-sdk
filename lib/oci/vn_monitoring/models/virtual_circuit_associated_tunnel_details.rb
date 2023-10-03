# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Detailed private tunnel info associated with the virtual circuit.
  class VnMonitoring::Models::VirtualCircuitAssociatedTunnelDetails
    TUNNEL_TYPE_ENUM = [
      TUNNEL_TYPE_IPSEC = 'IPSEC'.freeze,
      TUNNEL_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of the tunnel associated with the virtual circuit.
    # @return [String]
    attr_reader :tunnel_type

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of IPSec connection associated with the virtual circuit.
    # @return [String]
    attr_accessor :ipsec_connection_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec tunnel associated with the virtual circuit.
    # @return [String]
    attr_accessor :tunnel_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tunnel_type': :'tunnelType',
        'ipsec_connection_id': :'ipsecConnectionId',
        'tunnel_id': :'tunnelId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tunnel_type': :'String',
        'ipsec_connection_id': :'String',
        'tunnel_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tunnel_type The value to assign to the {#tunnel_type} property
    # @option attributes [String] :ipsec_connection_id The value to assign to the {#ipsec_connection_id} property
    # @option attributes [String] :tunnel_id The value to assign to the {#tunnel_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tunnel_type = attributes[:'tunnelType'] if attributes[:'tunnelType']

      raise 'You cannot provide both :tunnelType and :tunnel_type' if attributes.key?(:'tunnelType') && attributes.key?(:'tunnel_type')

      self.tunnel_type = attributes[:'tunnel_type'] if attributes[:'tunnel_type']

      self.ipsec_connection_id = attributes[:'ipsecConnectionId'] if attributes[:'ipsecConnectionId']

      raise 'You cannot provide both :ipsecConnectionId and :ipsec_connection_id' if attributes.key?(:'ipsecConnectionId') && attributes.key?(:'ipsec_connection_id')

      self.ipsec_connection_id = attributes[:'ipsec_connection_id'] if attributes[:'ipsec_connection_id']

      self.tunnel_id = attributes[:'tunnelId'] if attributes[:'tunnelId']

      raise 'You cannot provide both :tunnelId and :tunnel_id' if attributes.key?(:'tunnelId') && attributes.key?(:'tunnel_id')

      self.tunnel_id = attributes[:'tunnel_id'] if attributes[:'tunnel_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] tunnel_type Object to be assigned
    def tunnel_type=(tunnel_type)
      # rubocop:disable Style/ConditionalAssignment
      if tunnel_type && !TUNNEL_TYPE_ENUM.include?(tunnel_type)
        OCI.logger.debug("Unknown value for 'tunnel_type' [" + tunnel_type + "]. Mapping to 'TUNNEL_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @tunnel_type = TUNNEL_TYPE_UNKNOWN_ENUM_VALUE
      else
        @tunnel_type = tunnel_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tunnel_type == other.tunnel_type &&
        ipsec_connection_id == other.ipsec_connection_id &&
        tunnel_id == other.tunnel_id
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
      [tunnel_type, ipsec_connection_id, tunnel_id].hash
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
