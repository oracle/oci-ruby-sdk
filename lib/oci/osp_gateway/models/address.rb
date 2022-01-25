# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Address details model
  class OspGateway::Models::Address
    # Name of the contact person
    # @return [String]
    attr_accessor :contact_name

    # Name of the customer company
    # @return [String]
    attr_accessor :company_name

    # Address line 1
    # @return [String]
    attr_accessor :address_line1

    # Address line 2
    # @return [String]
    attr_accessor :address_line2

    # Address line 3
    # @return [String]
    attr_accessor :address_line3

    # Address line 4
    # @return [String]
    attr_accessor :address_line4

    # Street name
    # @return [String]
    attr_accessor :street_name

    # House no
    # @return [String]
    attr_accessor :street_number

    # Name of the city
    # @return [String]
    attr_accessor :city

    # @return [OCI::OspGateway::Models::Country]
    attr_accessor :country

    # County name
    # @return [String]
    attr_accessor :county

    # Name of the state
    # @return [String]
    attr_accessor :state

    # ZIP no
    # @return [String]
    attr_accessor :postal_code

    # Name of the province
    # @return [String]
    attr_accessor :province

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'contact_name': :'contactName',
        'company_name': :'companyName',
        'address_line1': :'addressLine1',
        'address_line2': :'addressLine2',
        'address_line3': :'addressLine3',
        'address_line4': :'addressLine4',
        'street_name': :'streetName',
        'street_number': :'streetNumber',
        'city': :'city',
        'country': :'country',
        'county': :'county',
        'state': :'state',
        'postal_code': :'postalCode',
        'province': :'province'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'contact_name': :'String',
        'company_name': :'String',
        'address_line1': :'String',
        'address_line2': :'String',
        'address_line3': :'String',
        'address_line4': :'String',
        'street_name': :'String',
        'street_number': :'String',
        'city': :'String',
        'country': :'OCI::OspGateway::Models::Country',
        'county': :'String',
        'state': :'String',
        'postal_code': :'String',
        'province': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :contact_name The value to assign to the {#contact_name} property
    # @option attributes [String] :company_name The value to assign to the {#company_name} property
    # @option attributes [String] :address_line1 The value to assign to the {#address_line1} property
    # @option attributes [String] :address_line2 The value to assign to the {#address_line2} property
    # @option attributes [String] :address_line3 The value to assign to the {#address_line3} property
    # @option attributes [String] :address_line4 The value to assign to the {#address_line4} property
    # @option attributes [String] :street_name The value to assign to the {#street_name} property
    # @option attributes [String] :street_number The value to assign to the {#street_number} property
    # @option attributes [String] :city The value to assign to the {#city} property
    # @option attributes [OCI::OspGateway::Models::Country] :country The value to assign to the {#country} property
    # @option attributes [String] :county The value to assign to the {#county} property
    # @option attributes [String] :state The value to assign to the {#state} property
    # @option attributes [String] :postal_code The value to assign to the {#postal_code} property
    # @option attributes [String] :province The value to assign to the {#province} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.contact_name = attributes[:'contactName'] if attributes[:'contactName']

      raise 'You cannot provide both :contactName and :contact_name' if attributes.key?(:'contactName') && attributes.key?(:'contact_name')

      self.contact_name = attributes[:'contact_name'] if attributes[:'contact_name']

      self.company_name = attributes[:'companyName'] if attributes[:'companyName']

      raise 'You cannot provide both :companyName and :company_name' if attributes.key?(:'companyName') && attributes.key?(:'company_name')

      self.company_name = attributes[:'company_name'] if attributes[:'company_name']

      self.address_line1 = attributes[:'addressLine1'] if attributes[:'addressLine1']

      raise 'You cannot provide both :addressLine1 and :address_line1' if attributes.key?(:'addressLine1') && attributes.key?(:'address_line1')

      self.address_line1 = attributes[:'address_line1'] if attributes[:'address_line1']

      self.address_line2 = attributes[:'addressLine2'] if attributes[:'addressLine2']

      raise 'You cannot provide both :addressLine2 and :address_line2' if attributes.key?(:'addressLine2') && attributes.key?(:'address_line2')

      self.address_line2 = attributes[:'address_line2'] if attributes[:'address_line2']

      self.address_line3 = attributes[:'addressLine3'] if attributes[:'addressLine3']

      raise 'You cannot provide both :addressLine3 and :address_line3' if attributes.key?(:'addressLine3') && attributes.key?(:'address_line3')

      self.address_line3 = attributes[:'address_line3'] if attributes[:'address_line3']

      self.address_line4 = attributes[:'addressLine4'] if attributes[:'addressLine4']

      raise 'You cannot provide both :addressLine4 and :address_line4' if attributes.key?(:'addressLine4') && attributes.key?(:'address_line4')

      self.address_line4 = attributes[:'address_line4'] if attributes[:'address_line4']

      self.street_name = attributes[:'streetName'] if attributes[:'streetName']

      raise 'You cannot provide both :streetName and :street_name' if attributes.key?(:'streetName') && attributes.key?(:'street_name')

      self.street_name = attributes[:'street_name'] if attributes[:'street_name']

      self.street_number = attributes[:'streetNumber'] if attributes[:'streetNumber']

      raise 'You cannot provide both :streetNumber and :street_number' if attributes.key?(:'streetNumber') && attributes.key?(:'street_number')

      self.street_number = attributes[:'street_number'] if attributes[:'street_number']

      self.city = attributes[:'city'] if attributes[:'city']

      self.country = attributes[:'country'] if attributes[:'country']

      self.county = attributes[:'county'] if attributes[:'county']

      self.state = attributes[:'state'] if attributes[:'state']

      self.postal_code = attributes[:'postalCode'] if attributes[:'postalCode']

      raise 'You cannot provide both :postalCode and :postal_code' if attributes.key?(:'postalCode') && attributes.key?(:'postal_code')

      self.postal_code = attributes[:'postal_code'] if attributes[:'postal_code']

      self.province = attributes[:'province'] if attributes[:'province']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        contact_name == other.contact_name &&
        company_name == other.company_name &&
        address_line1 == other.address_line1 &&
        address_line2 == other.address_line2 &&
        address_line3 == other.address_line3 &&
        address_line4 == other.address_line4 &&
        street_name == other.street_name &&
        street_number == other.street_number &&
        city == other.city &&
        country == other.country &&
        county == other.county &&
        state == other.state &&
        postal_code == other.postal_code &&
        province == other.province
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
      [contact_name, company_name, address_line1, address_line2, address_line3, address_line4, street_name, street_number, city, country, county, state, postal_code, province].hash
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
