# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Order details.
  class TenantManagerControlPlane::Models::Order
    # **[Required]** Immutable and unique order number holding customer subscription information.
    # @return [String]
    attr_accessor :order_number

    # Order's data center region.
    # @return [String]
    attr_accessor :data_center_region

    # **[Required]** Administrator email owning the subscription.
    # @return [String]
    attr_accessor :admin_email

    # **[Required]** State of the order.
    # @return [String]
    attr_accessor :order_state

    # **[Required]** Array of subscriptions associated with the order.
    # @return [Array<OCI::TenantManagerControlPlane::Models::SubscriptionInfo>]
    attr_accessor :subscriptions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'order_number': :'orderNumber',
        'data_center_region': :'dataCenterRegion',
        'admin_email': :'adminEmail',
        'order_state': :'orderState',
        'subscriptions': :'subscriptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'order_number': :'String',
        'data_center_region': :'String',
        'admin_email': :'String',
        'order_state': :'String',
        'subscriptions': :'Array<OCI::TenantManagerControlPlane::Models::SubscriptionInfo>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :order_number The value to assign to the {#order_number} property
    # @option attributes [String] :data_center_region The value to assign to the {#data_center_region} property
    # @option attributes [String] :admin_email The value to assign to the {#admin_email} property
    # @option attributes [String] :order_state The value to assign to the {#order_state} property
    # @option attributes [Array<OCI::TenantManagerControlPlane::Models::SubscriptionInfo>] :subscriptions The value to assign to the {#subscriptions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.order_number = attributes[:'orderNumber'] if attributes[:'orderNumber']

      raise 'You cannot provide both :orderNumber and :order_number' if attributes.key?(:'orderNumber') && attributes.key?(:'order_number')

      self.order_number = attributes[:'order_number'] if attributes[:'order_number']

      self.data_center_region = attributes[:'dataCenterRegion'] if attributes[:'dataCenterRegion']

      raise 'You cannot provide both :dataCenterRegion and :data_center_region' if attributes.key?(:'dataCenterRegion') && attributes.key?(:'data_center_region')

      self.data_center_region = attributes[:'data_center_region'] if attributes[:'data_center_region']

      self.admin_email = attributes[:'adminEmail'] if attributes[:'adminEmail']

      raise 'You cannot provide both :adminEmail and :admin_email' if attributes.key?(:'adminEmail') && attributes.key?(:'admin_email')

      self.admin_email = attributes[:'admin_email'] if attributes[:'admin_email']

      self.order_state = attributes[:'orderState'] if attributes[:'orderState']

      raise 'You cannot provide both :orderState and :order_state' if attributes.key?(:'orderState') && attributes.key?(:'order_state')

      self.order_state = attributes[:'order_state'] if attributes[:'order_state']

      self.subscriptions = attributes[:'subscriptions'] if attributes[:'subscriptions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        order_number == other.order_number &&
        data_center_region == other.data_center_region &&
        admin_email == other.admin_email &&
        order_state == other.order_state &&
        subscriptions == other.subscriptions
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
      [order_number, data_center_region, admin_email, order_state, subscriptions].hash
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
