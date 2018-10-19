# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'
require_relative 'dhcp_option'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # DHCP option for specifying how DNS (hostname resolution) is handled in the subnets in the VCN.
  # For more information, see
  # [DNS in Your Virtual Cloud Network](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/dns.htm).
  #
  class Core::Models::DhcpDnsOption < Core::Models::DhcpOption # rubocop:disable Metrics/LineLength
    SERVER_TYPE_ENUM = [
      SERVER_TYPE_VCN_LOCAL = 'VcnLocal'.freeze,
      SERVER_TYPE_VCN_LOCAL_PLUS_INTERNET = 'VcnLocalPlusInternet'.freeze,
      SERVER_TYPE_CUSTOM_DNS_SERVER = 'CustomDnsServer'.freeze,
      SERVER_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # If you set `serverType` to `CustomDnsServer`, specify the
    # IP address of at least one DNS server of your choice (three maximum). gd
    #
    # @return [Array<String>]
    attr_accessor :custom_dns_servers

    # **[Required]** * **VcnLocal:** Reserved for future use.
    #
    # * **VcnLocalPlusInternet:** Also referred to as \"Internet and VCN Resolver\".
    # Instances can resolve internet hostnames (no internet gateway is required),
    # and can resolve hostnames of instances in the VCN. This is the default
    # value in the default set of DHCP options in the VCN. For the Internet and
    # VCN Resolver to work across the VCN, there must also be a DNS label set for
    # the VCN, a DNS label set for each subnet, and a hostname for each instance.
    # The Internet and VCN Resolver also enables reverse DNS lookup, which lets
    # you determine the hostname corresponding to the private IP address. For more
    # information, see
    # [DNS in Your Virtual Cloud Network](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/dns.htm).
    #
    # * **CustomDnsServer:** Instances use a DNS server of your choice (three
    # maximum).
    #
    # @return [String]
    attr_reader :server_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'custom_dns_servers': :'customDnsServers',
        'server_type': :'serverType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'custom_dns_servers': :'Array<String>',
        'server_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :custom_dns_servers The value to assign to the {#custom_dns_servers} property
    # @option attributes [String] :server_type The value to assign to the {#server_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'DomainNameServer'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.custom_dns_servers = attributes[:'customDnsServers'] if attributes[:'customDnsServers']

      raise 'You cannot provide both :customDnsServers and :custom_dns_servers' if attributes.key?(:'customDnsServers') && attributes.key?(:'custom_dns_servers')

      self.custom_dns_servers = attributes[:'custom_dns_servers'] if attributes[:'custom_dns_servers']

      self.server_type = attributes[:'serverType'] if attributes[:'serverType']

      raise 'You cannot provide both :serverType and :server_type' if attributes.key?(:'serverType') && attributes.key?(:'server_type')

      self.server_type = attributes[:'server_type'] if attributes[:'server_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] server_type Object to be assigned
    def server_type=(server_type)
      # rubocop:disable Style/ConditionalAssignment
      if server_type && !SERVER_TYPE_ENUM.include?(server_type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'server_type' [" + server_type + "]. Mapping to 'SERVER_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @server_type = SERVER_TYPE_UNKNOWN_ENUM_VALUE
      else
        @server_type = server_type
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
        custom_dns_servers == other.custom_dns_servers &&
        server_type == other.server_type
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
      [type, custom_dns_servers, server_type].hash
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
