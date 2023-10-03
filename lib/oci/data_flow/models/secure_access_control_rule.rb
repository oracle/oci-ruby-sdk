# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200129
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The access control rule for SECURE_ACCESS network type selection.
  class DataFlow::Models::SecureAccessControlRule
    IP_NOTATION_ENUM = [
      IP_NOTATION_IP_ADDRESS = 'IP_ADDRESS'.freeze,
      IP_NOTATION_CIDR = 'CIDR'.freeze,
      IP_NOTATION_VCN = 'VCN'.freeze,
      IP_NOTATION_VCN_OCID = 'VCN_OCID'.freeze,
      IP_NOTATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of IP notation.
    # @return [String]
    attr_reader :ip_notation

    # **[Required]** The associated value of the selected IP notation.
    # @return [String]
    attr_accessor :value

    # A comma-separated IP or CIDR address for VCN OCID IP notation selection.
    # @return [String]
    attr_accessor :vcn_ips

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'ip_notation': :'ipNotation',
        'value': :'value',
        'vcn_ips': :'vcnIps'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'ip_notation': :'String',
        'value': :'String',
        'vcn_ips': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :ip_notation The value to assign to the {#ip_notation} property
    # @option attributes [String] :value The value to assign to the {#value} property
    # @option attributes [String] :vcn_ips The value to assign to the {#vcn_ips} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.ip_notation = attributes[:'ipNotation'] if attributes[:'ipNotation']

      raise 'You cannot provide both :ipNotation and :ip_notation' if attributes.key?(:'ipNotation') && attributes.key?(:'ip_notation')

      self.ip_notation = attributes[:'ip_notation'] if attributes[:'ip_notation']

      self.value = attributes[:'value'] if attributes[:'value']

      self.vcn_ips = attributes[:'vcnIps'] if attributes[:'vcnIps']

      raise 'You cannot provide both :vcnIps and :vcn_ips' if attributes.key?(:'vcnIps') && attributes.key?(:'vcn_ips')

      self.vcn_ips = attributes[:'vcn_ips'] if attributes[:'vcn_ips']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ip_notation Object to be assigned
    def ip_notation=(ip_notation)
      # rubocop:disable Style/ConditionalAssignment
      if ip_notation && !IP_NOTATION_ENUM.include?(ip_notation)
        OCI.logger.debug("Unknown value for 'ip_notation' [" + ip_notation + "]. Mapping to 'IP_NOTATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @ip_notation = IP_NOTATION_UNKNOWN_ENUM_VALUE
      else
        @ip_notation = ip_notation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        ip_notation == other.ip_notation &&
        value == other.value &&
        vcn_ips == other.vcn_ips
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
      [ip_notation, value, vcn_ips].hash
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
