# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Subscribed service commitment details
  #
  class OsubSubscription::Models::Commitment
    # Commitment start date
    #
    # @return [DateTime]
    attr_accessor :time_start

    # Commitment end date
    #
    # @return [DateTime]
    attr_accessor :time_end

    # Commitment quantity
    #
    # @return [String]
    attr_accessor :quantity

    # Commitment available amount
    #
    # @return [String]
    attr_accessor :available_amount

    # Commitment line net amount
    #
    # @return [String]
    attr_accessor :line_net_amount

    # Funded Allocation line value
    #
    # @return [String]
    attr_accessor :funded_allocation_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'quantity': :'quantity',
        'available_amount': :'availableAmount',
        'line_net_amount': :'lineNetAmount',
        'funded_allocation_value': :'fundedAllocationValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'quantity': :'String',
        'available_amount': :'String',
        'line_net_amount': :'String',
        'funded_allocation_value': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [String] :quantity The value to assign to the {#quantity} property
    # @option attributes [String] :available_amount The value to assign to the {#available_amount} property
    # @option attributes [String] :line_net_amount The value to assign to the {#line_net_amount} property
    # @option attributes [String] :funded_allocation_value The value to assign to the {#funded_allocation_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.available_amount = attributes[:'availableAmount'] if attributes[:'availableAmount']

      raise 'You cannot provide both :availableAmount and :available_amount' if attributes.key?(:'availableAmount') && attributes.key?(:'available_amount')

      self.available_amount = attributes[:'available_amount'] if attributes[:'available_amount']

      self.line_net_amount = attributes[:'lineNetAmount'] if attributes[:'lineNetAmount']

      raise 'You cannot provide both :lineNetAmount and :line_net_amount' if attributes.key?(:'lineNetAmount') && attributes.key?(:'line_net_amount')

      self.line_net_amount = attributes[:'line_net_amount'] if attributes[:'line_net_amount']

      self.funded_allocation_value = attributes[:'fundedAllocationValue'] if attributes[:'fundedAllocationValue']

      raise 'You cannot provide both :fundedAllocationValue and :funded_allocation_value' if attributes.key?(:'fundedAllocationValue') && attributes.key?(:'funded_allocation_value')

      self.funded_allocation_value = attributes[:'funded_allocation_value'] if attributes[:'funded_allocation_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        quantity == other.quantity &&
        available_amount == other.available_amount &&
        line_net_amount == other.line_net_amount &&
        funded_allocation_value == other.funded_allocation_value
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
      [time_start, time_end, quantity, available_amount, line_net_amount, funded_allocation_value].hash
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
