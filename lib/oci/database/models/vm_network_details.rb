# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the client or backup networks in a VM cluster network.
  class Database::Models::VmNetworkDetails
    NETWORK_TYPE_ENUM = [
      NETWORK_TYPE_CLIENT = 'CLIENT'.freeze,
      NETWORK_TYPE_BACKUP = 'BACKUP'.freeze,
      NETWORK_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The network VLAN ID.
    # @return [String]
    attr_accessor :vlan_id

    # **[Required]** The network type.
    # @return [String]
    attr_reader :network_type

    # **[Required]** The network netmask.
    # @return [String]
    attr_accessor :netmask

    # **[Required]** The network gateway.
    # @return [String]
    attr_accessor :gateway

    # **[Required]** The network domain name.
    # @return [String]
    attr_accessor :domain_name

    # **[Required]** The list of node details.
    # @return [Array<OCI::Database::Models::NodeDetails>]
    attr_accessor :nodes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'vlan_id': :'vlanId',
        'network_type': :'networkType',
        'netmask': :'netmask',
        'gateway': :'gateway',
        'domain_name': :'domainName',
        'nodes': :'nodes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'vlan_id': :'String',
        'network_type': :'String',
        'netmask': :'String',
        'gateway': :'String',
        'domain_name': :'String',
        'nodes': :'Array<OCI::Database::Models::NodeDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :vlan_id The value to assign to the {#vlan_id} property
    # @option attributes [String] :network_type The value to assign to the {#network_type} property
    # @option attributes [String] :netmask The value to assign to the {#netmask} property
    # @option attributes [String] :gateway The value to assign to the {#gateway} property
    # @option attributes [String] :domain_name The value to assign to the {#domain_name} property
    # @option attributes [Array<OCI::Database::Models::NodeDetails>] :nodes The value to assign to the {#nodes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.vlan_id = attributes[:'vlanId'] if attributes[:'vlanId']

      raise 'You cannot provide both :vlanId and :vlan_id' if attributes.key?(:'vlanId') && attributes.key?(:'vlan_id')

      self.vlan_id = attributes[:'vlan_id'] if attributes[:'vlan_id']

      self.network_type = attributes[:'networkType'] if attributes[:'networkType']

      raise 'You cannot provide both :networkType and :network_type' if attributes.key?(:'networkType') && attributes.key?(:'network_type')

      self.network_type = attributes[:'network_type'] if attributes[:'network_type']

      self.netmask = attributes[:'netmask'] if attributes[:'netmask']

      self.gateway = attributes[:'gateway'] if attributes[:'gateway']

      self.domain_name = attributes[:'domainName'] if attributes[:'domainName']

      raise 'You cannot provide both :domainName and :domain_name' if attributes.key?(:'domainName') && attributes.key?(:'domain_name')

      self.domain_name = attributes[:'domain_name'] if attributes[:'domain_name']

      self.nodes = attributes[:'nodes'] if attributes[:'nodes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] network_type Object to be assigned
    def network_type=(network_type)
      # rubocop:disable Style/ConditionalAssignment
      if network_type && !NETWORK_TYPE_ENUM.include?(network_type)
        OCI.logger.debug("Unknown value for 'network_type' [" + network_type + "]. Mapping to 'NETWORK_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @network_type = NETWORK_TYPE_UNKNOWN_ENUM_VALUE
      else
        @network_type = network_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        vlan_id == other.vlan_id &&
        network_type == other.network_type &&
        netmask == other.netmask &&
        gateway == other.gateway &&
        domain_name == other.domain_name &&
        nodes == other.nodes
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
      [vlan_id, network_type, netmask, gateway, domain_name, nodes].hash
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
