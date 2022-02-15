# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Payment option of a subscription.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class OspGateway::Models::PaymentOption
    PAYMENT_METHOD_ENUM = [
      PAYMENT_METHOD_CREDIT_CARD = 'CREDIT_CARD'.freeze,
      PAYMENT_METHOD_PAYPAL = 'PAYPAL'.freeze,
      PAYMENT_METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Wallet instrument internal id.
    # @return [String]
    attr_accessor :wallet_instrument_id

    # Wallet transaction id.
    # @return [String]
    attr_accessor :wallet_transaction_id

    # **[Required]** Payment method
    # @return [String]
    attr_reader :payment_method

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'wallet_instrument_id': :'walletInstrumentId',
        'wallet_transaction_id': :'walletTransactionId',
        'payment_method': :'paymentMethod'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'wallet_instrument_id': :'String',
        'wallet_transaction_id': :'String',
        'payment_method': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'paymentMethod'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::OspGateway::Models::CreditCardPaymentOption' if type == 'CREDIT_CARD'
      return 'OCI::OspGateway::Models::PaypalPaymentOption' if type == 'PAYPAL'

      # TODO: Log a warning when the subtype is not found.
      'OCI::OspGateway::Models::PaymentOption'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :wallet_instrument_id The value to assign to the {#wallet_instrument_id} property
    # @option attributes [String] :wallet_transaction_id The value to assign to the {#wallet_transaction_id} property
    # @option attributes [String] :payment_method The value to assign to the {#payment_method} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.wallet_instrument_id = attributes[:'walletInstrumentId'] if attributes[:'walletInstrumentId']

      raise 'You cannot provide both :walletInstrumentId and :wallet_instrument_id' if attributes.key?(:'walletInstrumentId') && attributes.key?(:'wallet_instrument_id')

      self.wallet_instrument_id = attributes[:'wallet_instrument_id'] if attributes[:'wallet_instrument_id']

      self.wallet_transaction_id = attributes[:'walletTransactionId'] if attributes[:'walletTransactionId']

      raise 'You cannot provide both :walletTransactionId and :wallet_transaction_id' if attributes.key?(:'walletTransactionId') && attributes.key?(:'wallet_transaction_id')

      self.wallet_transaction_id = attributes[:'wallet_transaction_id'] if attributes[:'wallet_transaction_id']

      self.payment_method = attributes[:'paymentMethod'] if attributes[:'paymentMethod']

      raise 'You cannot provide both :paymentMethod and :payment_method' if attributes.key?(:'paymentMethod') && attributes.key?(:'payment_method')

      self.payment_method = attributes[:'payment_method'] if attributes[:'payment_method']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] payment_method Object to be assigned
    def payment_method=(payment_method)
      # rubocop:disable Style/ConditionalAssignment
      if payment_method && !PAYMENT_METHOD_ENUM.include?(payment_method)
        OCI.logger.debug("Unknown value for 'payment_method' [" + payment_method + "]. Mapping to 'PAYMENT_METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @payment_method = PAYMENT_METHOD_UNKNOWN_ENUM_VALUE
      else
        @payment_method = payment_method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        wallet_instrument_id == other.wallet_instrument_id &&
        wallet_transaction_id == other.wallet_transaction_id &&
        payment_method == other.payment_method
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
      [wallet_instrument_id, wallet_transaction_id, payment_method].hash
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
