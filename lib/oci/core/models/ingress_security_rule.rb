# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A rule for allowing inbound IP packets.
  class Core::Models::IngressSecurityRule # rubocop:disable Metrics/LineLength
    # Optional and valid only for ICMP. Use to specify a particular ICMP type and code
    # as defined in
    # [ICMP Parameters](http://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml).
    # If you specify ICMP as the protocol but omit this object, then all ICMP types and
    # codes are allowed. If you do provide this object, the type is required and the code is optional.
    # To enable MTU negotiation for ingress internet traffic, make sure to allow type 3 (\"Destination
    # Unreachable\") code 4 (\"Fragmentation Needed and Don't Fragment was Set\"). If you need to specify
    # multiple codes for a single type, create a separate security list rule for each.
    #
    # @return [OCI::Core::Models::IcmpOptions]
    attr_accessor :icmp_options

    # A stateless rule allows traffic in one direction. Remember to add a corresponding
    # stateless rule in the other direction if you need to support bidirectional traffic. For
    # example, if ingress traffic allows TCP destination port 80, there should be an egress
    # rule to allow TCP source port 80. Defaults to false, which means the rule is stateful
    # and a corresponding rule is not necessary for bidirectional traffic.
    #
    # @return [BOOLEAN]
    attr_accessor :is_stateless

    # **[Required]** The transport protocol. Specify either `all` or an IPv4 protocol number as
    # defined in
    # [Protocol Numbers](http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml).
    # Options are supported only for ICMP (\"1\"), TCP (\"6\"), and UDP (\"17\").
    #
    # @return [String]
    attr_accessor :protocol

    # **[Required]** The source CIDR block for the ingress rule. This is the range of IP addresses that a
    # packet coming into the instance can come from.
    #
    # @return [String]
    attr_accessor :source

    # Optional and valid only for TCP. Use to specify particular destination ports for TCP rules.
    # If you specify TCP as the protocol but omit this object, then all destination ports are allowed.
    #
    # @return [OCI::Core::Models::TcpOptions]
    attr_accessor :tcp_options

    # Optional and valid only for UDP. Use to specify particular destination ports for UDP rules.
    # If you specify UDP as the protocol but omit this object, then all destination ports are allowed.
    #
    # @return [OCI::Core::Models::UdpOptions]
    attr_accessor :udp_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'icmp_options': :'icmpOptions',
        'is_stateless': :'isStateless',
        'protocol': :'protocol',
        'source': :'source',
        'tcp_options': :'tcpOptions',
        'udp_options': :'udpOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'icmp_options': :'OCI::Core::Models::IcmpOptions',
        'is_stateless': :'BOOLEAN',
        'protocol': :'String',
        'source': :'String',
        'tcp_options': :'OCI::Core::Models::TcpOptions',
        'udp_options': :'OCI::Core::Models::UdpOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Core::Models::IcmpOptions] :icmp_options The value to assign to the {#icmp_options} property
    # @option attributes [BOOLEAN] :is_stateless The value to assign to the {#is_stateless} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :source The value to assign to the {#source} property
    # @option attributes [OCI::Core::Models::TcpOptions] :tcp_options The value to assign to the {#tcp_options} property
    # @option attributes [OCI::Core::Models::UdpOptions] :udp_options The value to assign to the {#udp_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.icmp_options = attributes[:'icmpOptions'] if attributes[:'icmpOptions']

      raise 'You cannot provide both :icmpOptions and :icmp_options' if attributes.key?(:'icmpOptions') && attributes.key?(:'icmp_options')

      self.icmp_options = attributes[:'icmp_options'] if attributes[:'icmp_options']

      self.is_stateless = attributes[:'isStateless'] unless attributes[:'isStateless'].nil?

      raise 'You cannot provide both :isStateless and :is_stateless' if attributes.key?(:'isStateless') && attributes.key?(:'is_stateless')

      self.is_stateless = attributes[:'is_stateless'] unless attributes[:'is_stateless'].nil?

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.source = attributes[:'source'] if attributes[:'source']

      self.tcp_options = attributes[:'tcpOptions'] if attributes[:'tcpOptions']

      raise 'You cannot provide both :tcpOptions and :tcp_options' if attributes.key?(:'tcpOptions') && attributes.key?(:'tcp_options')

      self.tcp_options = attributes[:'tcp_options'] if attributes[:'tcp_options']

      self.udp_options = attributes[:'udpOptions'] if attributes[:'udpOptions']

      raise 'You cannot provide both :udpOptions and :udp_options' if attributes.key?(:'udpOptions') && attributes.key?(:'udp_options')

      self.udp_options = attributes[:'udp_options'] if attributes[:'udp_options']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        icmp_options == other.icmp_options &&
        is_stateless == other.is_stateless &&
        protocol == other.protocol &&
        source == other.source &&
        tcp_options == other.tcp_options &&
        udp_options == other.udp_options
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
      [icmp_options, is_stateless, protocol, source, tcp_options, udp_options].hash
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
