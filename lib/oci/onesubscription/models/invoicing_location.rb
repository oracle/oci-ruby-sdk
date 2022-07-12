# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Address location.
  #
  class Onesubscription::Models::InvoicingLocation
    # Address first line.
    #
    # @return [String]
    attr_accessor :address1

    # Address second line.
    #
    # @return [String]
    attr_accessor :address2

    # Postal code.
    #
    # @return [String]
    attr_accessor :postal_code

    # City.
    #
    # @return [String]
    attr_accessor :city

    # Country.
    #
    # @return [String]
    attr_accessor :country

    # Region.
    #
    # @return [String]
    attr_accessor :region

    # TCA Location identifier.
    #
    # @return [Integer]
    attr_accessor :tca_location_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'address1': :'address1',
        'address2': :'address2',
        'postal_code': :'postalCode',
        'city': :'city',
        'country': :'country',
        'region': :'region',
        'tca_location_id': :'tcaLocationId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'address1': :'String',
        'address2': :'String',
        'postal_code': :'String',
        'city': :'String',
        'country': :'String',
        'region': :'String',
        'tca_location_id': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :address1 The value to assign to the {#address1} property
    # @option attributes [String] :address2 The value to assign to the {#address2} property
    # @option attributes [String] :postal_code The value to assign to the {#postal_code} property
    # @option attributes [String] :city The value to assign to the {#city} property
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [String] :region The value to assign to the {#region} property
    # @option attributes [Integer] :tca_location_id The value to assign to the {#tca_location_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.address1 = attributes[:'address1'] if attributes[:'address1']

      self.address2 = attributes[:'address2'] if attributes[:'address2']

      self.postal_code = attributes[:'postalCode'] if attributes[:'postalCode']

      raise 'You cannot provide both :postalCode and :postal_code' if attributes.key?(:'postalCode') && attributes.key?(:'postal_code')

      self.postal_code = attributes[:'postal_code'] if attributes[:'postal_code']

      self.city = attributes[:'city'] if attributes[:'city']

      self.country = attributes[:'country'] if attributes[:'country']

      self.region = attributes[:'region'] if attributes[:'region']

      self.tca_location_id = attributes[:'tcaLocationId'] if attributes[:'tcaLocationId']

      raise 'You cannot provide both :tcaLocationId and :tca_location_id' if attributes.key?(:'tcaLocationId') && attributes.key?(:'tca_location_id')

      self.tca_location_id = attributes[:'tca_location_id'] if attributes[:'tca_location_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        postal_code == other.postal_code &&
        city == other.city &&
        country == other.country &&
        region == other.region &&
        tca_location_id == other.tca_location_id
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
      [address1, address2, postal_code, city, country, region, tca_location_id].hash
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
