# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'access_policy_target'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # External service target that internal virtual services direct traffic to.
  class ServiceMesh::Models::ExternalServiceAccessPolicyTarget < ServiceMesh::Models::AccessPolicyTarget
    PROTOCOL_ENUM = [
      PROTOCOL_HTTP = 'HTTP'.freeze,
      PROTOCOL_HTTPS = 'HTTPS'.freeze,
      PROTOCOL_TCP = 'TCP'.freeze,
      PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The hostnames of the external service. Only applicable for HTTP and HTTPS protocols.
    # Wildcard hostnames are supported in the prefix form.
    # Examples of valid hostnames are \"www.example.com\", \"*.example.com\", \"*.com\", \"*\".
    # Hostname \"*\" can be used to allow all hosts.
    #
    # @return [Array<String>]
    attr_accessor :hostnames

    # The ipAddresses of the external service in CIDR notation. Only applicable for TCP protocol.
    # All requests matching the given CIDR notation will pass through.
    # In case a wildcard CIDR \"0.0.0.0/0\" is provided, the same port cannot be used for a virtual service communication.
    #
    # @return [Array<String>]
    attr_accessor :ip_addresses

    # Ports exposed by an external service. If left empty all ports will be allowed.
    # @return [Array<Integer>]
    attr_accessor :ports

    # Protocol of the external service
    # @return [String]
    attr_reader :protocol

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'hostnames': :'hostnames',
        'ip_addresses': :'ipAddresses',
        'ports': :'ports',
        'protocol': :'protocol'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'hostnames': :'Array<String>',
        'ip_addresses': :'Array<String>',
        'ports': :'Array<Integer>',
        'protocol': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :hostnames The value to assign to the {#hostnames} property
    # @option attributes [Array<String>] :ip_addresses The value to assign to the {#ip_addresses} property
    # @option attributes [Array<Integer>] :ports The value to assign to the {#ports} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'EXTERNAL_SERVICE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.hostnames = attributes[:'hostnames'] if attributes[:'hostnames']

      self.ip_addresses = attributes[:'ipAddresses'] if attributes[:'ipAddresses']

      raise 'You cannot provide both :ipAddresses and :ip_addresses' if attributes.key?(:'ipAddresses') && attributes.key?(:'ip_addresses')

      self.ip_addresses = attributes[:'ip_addresses'] if attributes[:'ip_addresses']

      self.ports = attributes[:'ports'] if attributes[:'ports']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protocol Object to be assigned
    def protocol=(protocol)
      # rubocop:disable Style/ConditionalAssignment
      if protocol && !PROTOCOL_ENUM.include?(protocol)
        OCI.logger.debug("Unknown value for 'protocol' [" + protocol + "]. Mapping to 'PROTOCOL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protocol = PROTOCOL_UNKNOWN_ENUM_VALUE
      else
        @protocol = protocol
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        hostnames == other.hostnames &&
        ip_addresses == other.ip_addresses &&
        ports == other.ports &&
        protocol == other.protocol
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
      [type, hostnames, ip_addresses, ports, protocol].hash
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
