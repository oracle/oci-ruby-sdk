# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20191001
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Address verficiation result
  class OspGateway::Models::VerifyAddressReceipt
    QUALITY_ENUM = [
      QUALITY_EXCELLENT = 'EXCELLENT'.freeze,
      QUALITY_GOOD = 'GOOD'.freeze,
      QUALITY_AVERAGE = 'AVERAGE'.freeze,
      QUALITY_POOR = 'POOR'.freeze,
      QUALITY_BAD = 'BAD'.freeze,
      QUALITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VERIFICATION_CODE_ENUM = [
      VERIFICATION_CODE_VERIFIED = 'VERIFIED'.freeze,
      VERIFICATION_CODE_PARTIALLY_VERIFIED = 'PARTIALLY_VERIFIED'.freeze,
      VERIFICATION_CODE_AMBIGUOUS = 'AMBIGUOUS'.freeze,
      VERIFICATION_CODE_REVERTED = 'REVERTED'.freeze,
      VERIFICATION_CODE_UNVERIFIED = 'UNVERIFIED'.freeze,
      VERIFICATION_CODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # This attribute is required.
    # @return [OCI::OspGateway::Models::Address]
    attr_accessor :address

    # **[Required]** Address quality type.
    # @return [String]
    attr_reader :quality

    # **[Required]** Address verification code.
    # @return [String]
    attr_reader :verification_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'address': :'address',
        'quality': :'quality',
        'verification_code': :'verificationCode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'address': :'OCI::OspGateway::Models::Address',
        'quality': :'String',
        'verification_code': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::OspGateway::Models::Address] :address The value to assign to the {#address} property
    # @option attributes [String] :quality The value to assign to the {#quality} property
    # @option attributes [String] :verification_code The value to assign to the {#verification_code} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.address = attributes[:'address'] if attributes[:'address']

      self.quality = attributes[:'quality'] if attributes[:'quality']

      self.verification_code = attributes[:'verificationCode'] if attributes[:'verificationCode']

      raise 'You cannot provide both :verificationCode and :verification_code' if attributes.key?(:'verificationCode') && attributes.key?(:'verification_code')

      self.verification_code = attributes[:'verification_code'] if attributes[:'verification_code']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] quality Object to be assigned
    def quality=(quality)
      # rubocop:disable Style/ConditionalAssignment
      if quality && !QUALITY_ENUM.include?(quality)
        OCI.logger.debug("Unknown value for 'quality' [" + quality + "]. Mapping to 'QUALITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @quality = QUALITY_UNKNOWN_ENUM_VALUE
      else
        @quality = quality
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] verification_code Object to be assigned
    def verification_code=(verification_code)
      # rubocop:disable Style/ConditionalAssignment
      if verification_code && !VERIFICATION_CODE_ENUM.include?(verification_code)
        OCI.logger.debug("Unknown value for 'verification_code' [" + verification_code + "]. Mapping to 'VERIFICATION_CODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @verification_code = VERIFICATION_CODE_UNKNOWN_ENUM_VALUE
      else
        @verification_code = verification_code
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        address == other.address &&
        quality == other.quality &&
        verification_code == other.verification_code
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
      [address, quality, verification_code].hash
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
