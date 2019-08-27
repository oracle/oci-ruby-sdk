# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # ShippingAddress model.
  class Dts::Models::ShippingAddress
    # @return [String]
    attr_accessor :addressee

    # @return [String]
    attr_accessor :care_of

    # @return [String]
    attr_accessor :address1

    # @return [String]
    attr_accessor :address2

    # @return [String]
    attr_accessor :address3

    # @return [String]
    attr_accessor :address4

    # @return [String]
    attr_accessor :city_or_locality

    # @return [String]
    attr_accessor :state_or_region

    # @return [String]
    attr_accessor :zipcode

    # @return [String]
    attr_accessor :country

    # @return [String]
    attr_accessor :phone_number

    # @return [String]
    attr_accessor :email

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'addressee': :'addressee',
        'care_of': :'careOf',
        'address1': :'address1',
        'address2': :'address2',
        'address3': :'address3',
        'address4': :'address4',
        'city_or_locality': :'cityOrLocality',
        'state_or_region': :'stateOrRegion',
        'zipcode': :'zipcode',
        'country': :'country',
        'phone_number': :'phoneNumber',
        'email': :'email'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'addressee': :'String',
        'care_of': :'String',
        'address1': :'String',
        'address2': :'String',
        'address3': :'String',
        'address4': :'String',
        'city_or_locality': :'String',
        'state_or_region': :'String',
        'zipcode': :'String',
        'country': :'String',
        'phone_number': :'String',
        'email': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :addressee The value to assign to the {#addressee} property
    # @option attributes [String] :care_of The value to assign to the {#care_of} property
    # @option attributes [String] :address1 The value to assign to the {#address1} property
    # @option attributes [String] :address2 The value to assign to the {#address2} property
    # @option attributes [String] :address3 The value to assign to the {#address3} property
    # @option attributes [String] :address4 The value to assign to the {#address4} property
    # @option attributes [String] :city_or_locality The value to assign to the {#city_or_locality} property
    # @option attributes [String] :state_or_region The value to assign to the {#state_or_region} property
    # @option attributes [String] :zipcode The value to assign to the {#zipcode} property
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [String] :phone_number The value to assign to the {#phone_number} property
    # @option attributes [String] :email The value to assign to the {#email} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.addressee = attributes[:'addressee'] if attributes[:'addressee']

      self.care_of = attributes[:'careOf'] if attributes[:'careOf']

      raise 'You cannot provide both :careOf and :care_of' if attributes.key?(:'careOf') && attributes.key?(:'care_of')

      self.care_of = attributes[:'care_of'] if attributes[:'care_of']

      self.address1 = attributes[:'address1'] if attributes[:'address1']

      self.address2 = attributes[:'address2'] if attributes[:'address2']

      self.address3 = attributes[:'address3'] if attributes[:'address3']

      self.address4 = attributes[:'address4'] if attributes[:'address4']

      self.city_or_locality = attributes[:'cityOrLocality'] if attributes[:'cityOrLocality']

      raise 'You cannot provide both :cityOrLocality and :city_or_locality' if attributes.key?(:'cityOrLocality') && attributes.key?(:'city_or_locality')

      self.city_or_locality = attributes[:'city_or_locality'] if attributes[:'city_or_locality']

      self.state_or_region = attributes[:'stateOrRegion'] if attributes[:'stateOrRegion']

      raise 'You cannot provide both :stateOrRegion and :state_or_region' if attributes.key?(:'stateOrRegion') && attributes.key?(:'state_or_region')

      self.state_or_region = attributes[:'state_or_region'] if attributes[:'state_or_region']

      self.zipcode = attributes[:'zipcode'] if attributes[:'zipcode']

      self.country = attributes[:'country'] if attributes[:'country']

      self.phone_number = attributes[:'phoneNumber'] if attributes[:'phoneNumber']

      raise 'You cannot provide both :phoneNumber and :phone_number' if attributes.key?(:'phoneNumber') && attributes.key?(:'phone_number')

      self.phone_number = attributes[:'phone_number'] if attributes[:'phone_number']

      self.email = attributes[:'email'] if attributes[:'email']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        addressee == other.addressee &&
        care_of == other.care_of &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        address3 == other.address3 &&
        address4 == other.address4 &&
        city_or_locality == other.city_or_locality &&
        state_or_region == other.state_or_region &&
        zipcode == other.zipcode &&
        country == other.country &&
        phone_number == other.phone_number &&
        email == other.email
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
      [addressee, care_of, address1, address2, address3, address4, city_or_locality, state_or_region, zipcode, country, phone_number, email].hash
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
