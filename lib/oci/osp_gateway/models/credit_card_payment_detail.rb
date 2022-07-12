# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'payment_detail'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Credit card Payment related details
  class OspGateway::Models::CreditCardPaymentDetail < OspGateway::Models::PaymentDetail
    CREDIT_CARD_TYPE_ENUM = [
      CREDIT_CARD_TYPE_VISA = 'VISA'.freeze,
      CREDIT_CARD_TYPE_AMEX = 'AMEX'.freeze,
      CREDIT_CARD_TYPE_MASTERCARD = 'MASTERCARD'.freeze,
      CREDIT_CARD_TYPE_DISCOVER = 'DISCOVER'.freeze,
      CREDIT_CARD_TYPE_JCB = 'JCB'.freeze,
      CREDIT_CARD_TYPE_DINER = 'DINER'.freeze,
      CREDIT_CARD_TYPE_ELO = 'ELO'.freeze,
      CREDIT_CARD_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Name on the credit card
    # @return [String]
    attr_accessor :name_on_card

    # Credit card type
    # @return [String]
    attr_reader :credit_card_type

    # Last four digits of the card
    # @return [String]
    attr_accessor :last_digits

    # Expired date of the credit card
    # @return [DateTime]
    attr_accessor :time_expiration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_paid_on': :'timePaidOn',
        'paid_by': :'paidBy',
        'payment_method': :'paymentMethod',
        'amount_paid': :'amountPaid',
        'name_on_card': :'nameOnCard',
        'credit_card_type': :'creditCardType',
        'last_digits': :'lastDigits',
        'time_expiration': :'timeExpiration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_paid_on': :'DateTime',
        'paid_by': :'String',
        'payment_method': :'String',
        'amount_paid': :'Float',
        'name_on_card': :'String',
        'credit_card_type': :'String',
        'last_digits': :'String',
        'time_expiration': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_paid_on The value to assign to the {OCI::OspGateway::Models::PaymentDetail#time_paid_on #time_paid_on} proprety
    # @option attributes [String] :paid_by The value to assign to the {OCI::OspGateway::Models::PaymentDetail#paid_by #paid_by} proprety
    # @option attributes [Float] :amount_paid The value to assign to the {OCI::OspGateway::Models::PaymentDetail#amount_paid #amount_paid} proprety
    # @option attributes [String] :name_on_card The value to assign to the {#name_on_card} property
    # @option attributes [String] :credit_card_type The value to assign to the {#credit_card_type} property
    # @option attributes [String] :last_digits The value to assign to the {#last_digits} property
    # @option attributes [DateTime] :time_expiration The value to assign to the {#time_expiration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['paymentMethod'] = 'CREDIT_CARD'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name_on_card = attributes[:'nameOnCard'] if attributes[:'nameOnCard']

      raise 'You cannot provide both :nameOnCard and :name_on_card' if attributes.key?(:'nameOnCard') && attributes.key?(:'name_on_card')

      self.name_on_card = attributes[:'name_on_card'] if attributes[:'name_on_card']

      self.credit_card_type = attributes[:'creditCardType'] if attributes[:'creditCardType']

      raise 'You cannot provide both :creditCardType and :credit_card_type' if attributes.key?(:'creditCardType') && attributes.key?(:'credit_card_type')

      self.credit_card_type = attributes[:'credit_card_type'] if attributes[:'credit_card_type']

      self.last_digits = attributes[:'lastDigits'] if attributes[:'lastDigits']

      raise 'You cannot provide both :lastDigits and :last_digits' if attributes.key?(:'lastDigits') && attributes.key?(:'last_digits')

      self.last_digits = attributes[:'last_digits'] if attributes[:'last_digits']

      self.time_expiration = attributes[:'timeExpiration'] if attributes[:'timeExpiration']

      raise 'You cannot provide both :timeExpiration and :time_expiration' if attributes.key?(:'timeExpiration') && attributes.key?(:'time_expiration')

      self.time_expiration = attributes[:'time_expiration'] if attributes[:'time_expiration']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] credit_card_type Object to be assigned
    def credit_card_type=(credit_card_type)
      # rubocop:disable Style/ConditionalAssignment
      if credit_card_type && !CREDIT_CARD_TYPE_ENUM.include?(credit_card_type)
        OCI.logger.debug("Unknown value for 'credit_card_type' [" + credit_card_type + "]. Mapping to 'CREDIT_CARD_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @credit_card_type = CREDIT_CARD_TYPE_UNKNOWN_ENUM_VALUE
      else
        @credit_card_type = credit_card_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_paid_on == other.time_paid_on &&
        paid_by == other.paid_by &&
        payment_method == other.payment_method &&
        amount_paid == other.amount_paid &&
        name_on_card == other.name_on_card &&
        credit_card_type == other.credit_card_type &&
        last_digits == other.last_digits &&
        time_expiration == other.time_expiration
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
      [time_paid_on, paid_by, payment_method, amount_paid, name_on_card, credit_card_type, last_digits, time_expiration].hash
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
