# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This resource contains the rules governing what traffic a VTAP mirrors.
  #
  class Core::Models::VtapCaptureFilterRuleDetails
    TRAFFIC_DIRECTION_ENUM = [
      TRAFFIC_DIRECTION_INGRESS = 'INGRESS'.freeze,
      TRAFFIC_DIRECTION_EGRESS = 'EGRESS'.freeze,
      TRAFFIC_DIRECTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RULE_ACTION_ENUM = [
      RULE_ACTION_INCLUDE = 'INCLUDE'.freeze,
      RULE_ACTION_EXCLUDE = 'EXCLUDE'.freeze,
      RULE_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The traffic direction the VTAP is configured to mirror.
    #
    # @return [String]
    attr_reader :traffic_direction

    # Include or exclude packets meeting this definition from mirrored traffic.
    #
    # @return [String]
    attr_reader :rule_action

    # Traffic from this CIDR block to the VTAP source will be mirrored to the VTAP target.
    #
    # @return [String]
    attr_accessor :source_cidr

    # Traffic sent to this CIDR block through the VTAP source will be mirrored to the VTAP target.
    #
    # @return [String]
    attr_accessor :destination_cidr

    # The transport protocol used in the filter. If do not choose a protocol, all protocols will be used in the filter.
    # Supported options are:
    #   * 1 = ICMP
    #   * 6 = TCP
    #   * 17 = UDP
    #
    # @return [String]
    attr_accessor :protocol

    # @return [OCI::Core::Models::IcmpOptions]
    attr_accessor :icmp_options

    # @return [OCI::Core::Models::TcpOptions]
    attr_accessor :tcp_options

    # @return [OCI::Core::Models::UdpOptions]
    attr_accessor :udp_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'traffic_direction': :'trafficDirection',
        'rule_action': :'ruleAction',
        'source_cidr': :'sourceCidr',
        'destination_cidr': :'destinationCidr',
        'protocol': :'protocol',
        'icmp_options': :'icmpOptions',
        'tcp_options': :'tcpOptions',
        'udp_options': :'udpOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'traffic_direction': :'String',
        'rule_action': :'String',
        'source_cidr': :'String',
        'destination_cidr': :'String',
        'protocol': :'String',
        'icmp_options': :'OCI::Core::Models::IcmpOptions',
        'tcp_options': :'OCI::Core::Models::TcpOptions',
        'udp_options': :'OCI::Core::Models::UdpOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :traffic_direction The value to assign to the {#traffic_direction} property
    # @option attributes [String] :rule_action The value to assign to the {#rule_action} property
    # @option attributes [String] :source_cidr The value to assign to the {#source_cidr} property
    # @option attributes [String] :destination_cidr The value to assign to the {#destination_cidr} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [OCI::Core::Models::IcmpOptions] :icmp_options The value to assign to the {#icmp_options} property
    # @option attributes [OCI::Core::Models::TcpOptions] :tcp_options The value to assign to the {#tcp_options} property
    # @option attributes [OCI::Core::Models::UdpOptions] :udp_options The value to assign to the {#udp_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.traffic_direction = attributes[:'trafficDirection'] if attributes[:'trafficDirection']

      raise 'You cannot provide both :trafficDirection and :traffic_direction' if attributes.key?(:'trafficDirection') && attributes.key?(:'traffic_direction')

      self.traffic_direction = attributes[:'traffic_direction'] if attributes[:'traffic_direction']

      self.rule_action = attributes[:'ruleAction'] if attributes[:'ruleAction']

      raise 'You cannot provide both :ruleAction and :rule_action' if attributes.key?(:'ruleAction') && attributes.key?(:'rule_action')

      self.rule_action = attributes[:'rule_action'] if attributes[:'rule_action']

      self.source_cidr = attributes[:'sourceCidr'] if attributes[:'sourceCidr']

      raise 'You cannot provide both :sourceCidr and :source_cidr' if attributes.key?(:'sourceCidr') && attributes.key?(:'source_cidr')

      self.source_cidr = attributes[:'source_cidr'] if attributes[:'source_cidr']

      self.destination_cidr = attributes[:'destinationCidr'] if attributes[:'destinationCidr']

      raise 'You cannot provide both :destinationCidr and :destination_cidr' if attributes.key?(:'destinationCidr') && attributes.key?(:'destination_cidr')

      self.destination_cidr = attributes[:'destination_cidr'] if attributes[:'destination_cidr']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.icmp_options = attributes[:'icmpOptions'] if attributes[:'icmpOptions']

      raise 'You cannot provide both :icmpOptions and :icmp_options' if attributes.key?(:'icmpOptions') && attributes.key?(:'icmp_options')

      self.icmp_options = attributes[:'icmp_options'] if attributes[:'icmp_options']

      self.tcp_options = attributes[:'tcpOptions'] if attributes[:'tcpOptions']

      raise 'You cannot provide both :tcpOptions and :tcp_options' if attributes.key?(:'tcpOptions') && attributes.key?(:'tcp_options')

      self.tcp_options = attributes[:'tcp_options'] if attributes[:'tcp_options']

      self.udp_options = attributes[:'udpOptions'] if attributes[:'udpOptions']

      raise 'You cannot provide both :udpOptions and :udp_options' if attributes.key?(:'udpOptions') && attributes.key?(:'udp_options')

      self.udp_options = attributes[:'udp_options'] if attributes[:'udp_options']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] traffic_direction Object to be assigned
    def traffic_direction=(traffic_direction)
      # rubocop:disable Style/ConditionalAssignment
      if traffic_direction && !TRAFFIC_DIRECTION_ENUM.include?(traffic_direction)
        OCI.logger.debug("Unknown value for 'traffic_direction' [" + traffic_direction + "]. Mapping to 'TRAFFIC_DIRECTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @traffic_direction = TRAFFIC_DIRECTION_UNKNOWN_ENUM_VALUE
      else
        @traffic_direction = traffic_direction
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] rule_action Object to be assigned
    def rule_action=(rule_action)
      # rubocop:disable Style/ConditionalAssignment
      if rule_action && !RULE_ACTION_ENUM.include?(rule_action)
        OCI.logger.debug("Unknown value for 'rule_action' [" + rule_action + "]. Mapping to 'RULE_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @rule_action = RULE_ACTION_UNKNOWN_ENUM_VALUE
      else
        @rule_action = rule_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        traffic_direction == other.traffic_direction &&
        rule_action == other.rule_action &&
        source_cidr == other.source_cidr &&
        destination_cidr == other.destination_cidr &&
        protocol == other.protocol &&
        icmp_options == other.icmp_options &&
        tcp_options == other.tcp_options &&
        udp_options == other.udp_options
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
      [traffic_direction, rule_action, source_cidr, destination_cidr, protocol, icmp_options, tcp_options, udp_options].hash
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
