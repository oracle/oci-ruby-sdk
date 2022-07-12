# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the network configuration.
  class ApmSynthetics::Models::NetworkConfiguration
    PROTOCOL_ENUM = [
      PROTOCOL_ICMP = 'ICMP'.freeze,
      PROTOCOL_TCP = 'TCP'.freeze,
      PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PROBE_MODE_ENUM = [
      PROBE_MODE_SACK = 'SACK'.freeze,
      PROBE_MODE_SYN = 'SYN'.freeze,
      PROBE_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Number of hops.
    # @return [Integer]
    attr_accessor :number_of_hops

    # Number of probes per hop.
    # @return [Integer]
    attr_accessor :probe_per_hop

    # Number of probe packets sent out simultaneously.
    # @return [Integer]
    attr_accessor :transmission_rate

    # Type of protocol.
    # @return [String]
    attr_reader :protocol

    # Type of probe mode when TCP protocol is selected.
    # @return [String]
    attr_reader :probe_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'number_of_hops': :'numberOfHops',
        'probe_per_hop': :'probePerHop',
        'transmission_rate': :'transmissionRate',
        'protocol': :'protocol',
        'probe_mode': :'probeMode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'number_of_hops': :'Integer',
        'probe_per_hop': :'Integer',
        'transmission_rate': :'Integer',
        'protocol': :'String',
        'probe_mode': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :number_of_hops The value to assign to the {#number_of_hops} property
    # @option attributes [Integer] :probe_per_hop The value to assign to the {#probe_per_hop} property
    # @option attributes [Integer] :transmission_rate The value to assign to the {#transmission_rate} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :probe_mode The value to assign to the {#probe_mode} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.number_of_hops = attributes[:'numberOfHops'] if attributes[:'numberOfHops']

      raise 'You cannot provide both :numberOfHops and :number_of_hops' if attributes.key?(:'numberOfHops') && attributes.key?(:'number_of_hops')

      self.number_of_hops = attributes[:'number_of_hops'] if attributes[:'number_of_hops']

      self.probe_per_hop = attributes[:'probePerHop'] if attributes[:'probePerHop']

      raise 'You cannot provide both :probePerHop and :probe_per_hop' if attributes.key?(:'probePerHop') && attributes.key?(:'probe_per_hop')

      self.probe_per_hop = attributes[:'probe_per_hop'] if attributes[:'probe_per_hop']

      self.transmission_rate = attributes[:'transmissionRate'] if attributes[:'transmissionRate']

      raise 'You cannot provide both :transmissionRate and :transmission_rate' if attributes.key?(:'transmissionRate') && attributes.key?(:'transmission_rate')

      self.transmission_rate = attributes[:'transmission_rate'] if attributes[:'transmission_rate']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']
      self.protocol = "TCP" if protocol.nil? && !attributes.key?(:'protocol') # rubocop:disable Style/StringLiterals

      self.probe_mode = attributes[:'probeMode'] if attributes[:'probeMode']

      raise 'You cannot provide both :probeMode and :probe_mode' if attributes.key?(:'probeMode') && attributes.key?(:'probe_mode')

      self.probe_mode = attributes[:'probe_mode'] if attributes[:'probe_mode']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] probe_mode Object to be assigned
    def probe_mode=(probe_mode)
      # rubocop:disable Style/ConditionalAssignment
      if probe_mode && !PROBE_MODE_ENUM.include?(probe_mode)
        OCI.logger.debug("Unknown value for 'probe_mode' [" + probe_mode + "]. Mapping to 'PROBE_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @probe_mode = PROBE_MODE_UNKNOWN_ENUM_VALUE
      else
        @probe_mode = probe_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        number_of_hops == other.number_of_hops &&
        probe_per_hop == other.probe_per_hop &&
        transmission_rate == other.transmission_rate &&
        protocol == other.protocol &&
        probe_mode == other.probe_mode
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
      [number_of_hops, probe_per_hop, transmission_rate, protocol, probe_mode].hash
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