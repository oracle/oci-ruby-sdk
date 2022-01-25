# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Currency details model
  class OspGateway::Models::Currency
    # Currency code
    # @return [String]
    attr_accessor :currency_code

    # Currency symbol
    # @return [String]
    attr_accessor :currency_symbol

    # Name of the currency
    # @return [String]
    attr_accessor :name

    # USD conversion rate of the currency
    # @return [Float]
    attr_accessor :usd_conversion

    # Round decimal point
    # @return [Float]
    attr_accessor :round_decimal_point

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'currency_code': :'currencyCode',
        'currency_symbol': :'currencySymbol',
        'name': :'name',
        'usd_conversion': :'usdConversion',
        'round_decimal_point': :'roundDecimalPoint'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'currency_code': :'String',
        'currency_symbol': :'String',
        'name': :'String',
        'usd_conversion': :'Float',
        'round_decimal_point': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :currency_code The value to assign to the {#currency_code} property
    # @option attributes [String] :currency_symbol The value to assign to the {#currency_symbol} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Float] :usd_conversion The value to assign to the {#usd_conversion} property
    # @option attributes [Float] :round_decimal_point The value to assign to the {#round_decimal_point} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.currency_code = attributes[:'currencyCode'] if attributes[:'currencyCode']

      raise 'You cannot provide both :currencyCode and :currency_code' if attributes.key?(:'currencyCode') && attributes.key?(:'currency_code')

      self.currency_code = attributes[:'currency_code'] if attributes[:'currency_code']

      self.currency_symbol = attributes[:'currencySymbol'] if attributes[:'currencySymbol']

      raise 'You cannot provide both :currencySymbol and :currency_symbol' if attributes.key?(:'currencySymbol') && attributes.key?(:'currency_symbol')

      self.currency_symbol = attributes[:'currency_symbol'] if attributes[:'currency_symbol']

      self.name = attributes[:'name'] if attributes[:'name']

      self.usd_conversion = attributes[:'usdConversion'] if attributes[:'usdConversion']

      raise 'You cannot provide both :usdConversion and :usd_conversion' if attributes.key?(:'usdConversion') && attributes.key?(:'usd_conversion')

      self.usd_conversion = attributes[:'usd_conversion'] if attributes[:'usd_conversion']

      self.round_decimal_point = attributes[:'roundDecimalPoint'] if attributes[:'roundDecimalPoint']

      raise 'You cannot provide both :roundDecimalPoint and :round_decimal_point' if attributes.key?(:'roundDecimalPoint') && attributes.key?(:'round_decimal_point')

      self.round_decimal_point = attributes[:'round_decimal_point'] if attributes[:'round_decimal_point']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        currency_code == other.currency_code &&
        currency_symbol == other.currency_symbol &&
        name == other.name &&
        usd_conversion == other.usd_conversion &&
        round_decimal_point == other.round_decimal_point
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
      [currency_code, currency_symbol, name, usd_conversion, round_decimal_point].hash
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
