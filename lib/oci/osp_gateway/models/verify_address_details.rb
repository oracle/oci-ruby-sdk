# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20191001
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Verify address related details
  class OspGateway::Models::VerifyAddressDetails
    # Address identifier.
    # @return [String]
    attr_accessor :address_key

    # Address line 1.
    # @return [String]
    attr_accessor :line1

    # Address line 2.
    # @return [String]
    attr_accessor :line2

    # Address line 3.
    # @return [String]
    attr_accessor :line3

    # Address line 4.
    # @return [String]
    attr_accessor :line4

    # Street name of the address.
    # @return [String]
    attr_accessor :street_name

    # Street number of the address.
    # @return [String]
    attr_accessor :street_number

    # Name of the city.
    # @return [String]
    attr_accessor :city

    # County of the address.
    # @return [String]
    attr_accessor :county

    # Country of the address.
    # @return [String]
    attr_accessor :country

    # Province of the address.
    # @return [String]
    attr_accessor :province

    # Post code of the address.
    # @return [String]
    attr_accessor :postal_code

    # State of the address.
    # @return [String]
    attr_accessor :state

    # Contact person email address.
    # @return [String]
    attr_accessor :email_address

    # Name of the customer company.
    # @return [String]
    attr_accessor :company_name

    # First name of the contact person.
    # @return [String]
    attr_accessor :first_name

    # Middle name of the contact person.
    # @return [String]
    attr_accessor :middle_name

    # Last name of the contact person.
    # @return [String]
    attr_accessor :last_name

    # Phone country code of the contact person.
    # @return [String]
    attr_accessor :phone_country_code

    # Phone number of the contact person.
    # @return [String]
    attr_accessor :phone_number

    # Job title of the contact person.
    # @return [String]
    attr_accessor :job_title

    # Department name of the customer company.
    # @return [String]
    attr_accessor :department_name

    # Internal number of the customer company.
    # @return [String]
    attr_accessor :internal_number

    # Contributor class of the customer company.
    # @return [String]
    attr_accessor :contributor_class

    # State Inscription.
    # @return [String]
    attr_accessor :state_inscription

    # Municipal Inscription.
    # @return [String]
    attr_accessor :municipal_inscription

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'address_key': :'addressKey',
        'line1': :'line1',
        'line2': :'line2',
        'line3': :'line3',
        'line4': :'line4',
        'street_name': :'streetName',
        'street_number': :'streetNumber',
        'city': :'city',
        'county': :'county',
        'country': :'country',
        'province': :'province',
        'postal_code': :'postalCode',
        'state': :'state',
        'email_address': :'emailAddress',
        'company_name': :'companyName',
        'first_name': :'firstName',
        'middle_name': :'middleName',
        'last_name': :'lastName',
        'phone_country_code': :'phoneCountryCode',
        'phone_number': :'phoneNumber',
        'job_title': :'jobTitle',
        'department_name': :'departmentName',
        'internal_number': :'internalNumber',
        'contributor_class': :'contributorClass',
        'state_inscription': :'stateInscription',
        'municipal_inscription': :'municipalInscription'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'address_key': :'String',
        'line1': :'String',
        'line2': :'String',
        'line3': :'String',
        'line4': :'String',
        'street_name': :'String',
        'street_number': :'String',
        'city': :'String',
        'county': :'String',
        'country': :'String',
        'province': :'String',
        'postal_code': :'String',
        'state': :'String',
        'email_address': :'String',
        'company_name': :'String',
        'first_name': :'String',
        'middle_name': :'String',
        'last_name': :'String',
        'phone_country_code': :'String',
        'phone_number': :'String',
        'job_title': :'String',
        'department_name': :'String',
        'internal_number': :'String',
        'contributor_class': :'String',
        'state_inscription': :'String',
        'municipal_inscription': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :address_key The value to assign to the {#address_key} property
    # @option attributes [String] :line1 The value to assign to the {#line1} property
    # @option attributes [String] :line2 The value to assign to the {#line2} property
    # @option attributes [String] :line3 The value to assign to the {#line3} property
    # @option attributes [String] :line4 The value to assign to the {#line4} property
    # @option attributes [String] :street_name The value to assign to the {#street_name} property
    # @option attributes [String] :street_number The value to assign to the {#street_number} property
    # @option attributes [String] :city The value to assign to the {#city} property
    # @option attributes [String] :county The value to assign to the {#county} property
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [String] :province The value to assign to the {#province} property
    # @option attributes [String] :postal_code The value to assign to the {#postal_code} property
    # @option attributes [String] :state The value to assign to the {#state} property
    # @option attributes [String] :email_address The value to assign to the {#email_address} property
    # @option attributes [String] :company_name The value to assign to the {#company_name} property
    # @option attributes [String] :first_name The value to assign to the {#first_name} property
    # @option attributes [String] :middle_name The value to assign to the {#middle_name} property
    # @option attributes [String] :last_name The value to assign to the {#last_name} property
    # @option attributes [String] :phone_country_code The value to assign to the {#phone_country_code} property
    # @option attributes [String] :phone_number The value to assign to the {#phone_number} property
    # @option attributes [String] :job_title The value to assign to the {#job_title} property
    # @option attributes [String] :department_name The value to assign to the {#department_name} property
    # @option attributes [String] :internal_number The value to assign to the {#internal_number} property
    # @option attributes [String] :contributor_class The value to assign to the {#contributor_class} property
    # @option attributes [String] :state_inscription The value to assign to the {#state_inscription} property
    # @option attributes [String] :municipal_inscription The value to assign to the {#municipal_inscription} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.address_key = attributes[:'addressKey'] if attributes[:'addressKey']

      raise 'You cannot provide both :addressKey and :address_key' if attributes.key?(:'addressKey') && attributes.key?(:'address_key')

      self.address_key = attributes[:'address_key'] if attributes[:'address_key']

      self.line1 = attributes[:'line1'] if attributes[:'line1']

      self.line2 = attributes[:'line2'] if attributes[:'line2']

      self.line3 = attributes[:'line3'] if attributes[:'line3']

      self.line4 = attributes[:'line4'] if attributes[:'line4']

      self.street_name = attributes[:'streetName'] if attributes[:'streetName']

      raise 'You cannot provide both :streetName and :street_name' if attributes.key?(:'streetName') && attributes.key?(:'street_name')

      self.street_name = attributes[:'street_name'] if attributes[:'street_name']

      self.street_number = attributes[:'streetNumber'] if attributes[:'streetNumber']

      raise 'You cannot provide both :streetNumber and :street_number' if attributes.key?(:'streetNumber') && attributes.key?(:'street_number')

      self.street_number = attributes[:'street_number'] if attributes[:'street_number']

      self.city = attributes[:'city'] if attributes[:'city']

      self.county = attributes[:'county'] if attributes[:'county']

      self.country = attributes[:'country'] if attributes[:'country']

      self.province = attributes[:'province'] if attributes[:'province']

      self.postal_code = attributes[:'postalCode'] if attributes[:'postalCode']

      raise 'You cannot provide both :postalCode and :postal_code' if attributes.key?(:'postalCode') && attributes.key?(:'postal_code')

      self.postal_code = attributes[:'postal_code'] if attributes[:'postal_code']

      self.state = attributes[:'state'] if attributes[:'state']

      self.email_address = attributes[:'emailAddress'] if attributes[:'emailAddress']

      raise 'You cannot provide both :emailAddress and :email_address' if attributes.key?(:'emailAddress') && attributes.key?(:'email_address')

      self.email_address = attributes[:'email_address'] if attributes[:'email_address']

      self.company_name = attributes[:'companyName'] if attributes[:'companyName']

      raise 'You cannot provide both :companyName and :company_name' if attributes.key?(:'companyName') && attributes.key?(:'company_name')

      self.company_name = attributes[:'company_name'] if attributes[:'company_name']

      self.first_name = attributes[:'firstName'] if attributes[:'firstName']

      raise 'You cannot provide both :firstName and :first_name' if attributes.key?(:'firstName') && attributes.key?(:'first_name')

      self.first_name = attributes[:'first_name'] if attributes[:'first_name']

      self.middle_name = attributes[:'middleName'] if attributes[:'middleName']

      raise 'You cannot provide both :middleName and :middle_name' if attributes.key?(:'middleName') && attributes.key?(:'middle_name')

      self.middle_name = attributes[:'middle_name'] if attributes[:'middle_name']

      self.last_name = attributes[:'lastName'] if attributes[:'lastName']

      raise 'You cannot provide both :lastName and :last_name' if attributes.key?(:'lastName') && attributes.key?(:'last_name')

      self.last_name = attributes[:'last_name'] if attributes[:'last_name']

      self.phone_country_code = attributes[:'phoneCountryCode'] if attributes[:'phoneCountryCode']

      raise 'You cannot provide both :phoneCountryCode and :phone_country_code' if attributes.key?(:'phoneCountryCode') && attributes.key?(:'phone_country_code')

      self.phone_country_code = attributes[:'phone_country_code'] if attributes[:'phone_country_code']

      self.phone_number = attributes[:'phoneNumber'] if attributes[:'phoneNumber']

      raise 'You cannot provide both :phoneNumber and :phone_number' if attributes.key?(:'phoneNumber') && attributes.key?(:'phone_number')

      self.phone_number = attributes[:'phone_number'] if attributes[:'phone_number']

      self.job_title = attributes[:'jobTitle'] if attributes[:'jobTitle']

      raise 'You cannot provide both :jobTitle and :job_title' if attributes.key?(:'jobTitle') && attributes.key?(:'job_title')

      self.job_title = attributes[:'job_title'] if attributes[:'job_title']

      self.department_name = attributes[:'departmentName'] if attributes[:'departmentName']

      raise 'You cannot provide both :departmentName and :department_name' if attributes.key?(:'departmentName') && attributes.key?(:'department_name')

      self.department_name = attributes[:'department_name'] if attributes[:'department_name']

      self.internal_number = attributes[:'internalNumber'] if attributes[:'internalNumber']

      raise 'You cannot provide both :internalNumber and :internal_number' if attributes.key?(:'internalNumber') && attributes.key?(:'internal_number')

      self.internal_number = attributes[:'internal_number'] if attributes[:'internal_number']

      self.contributor_class = attributes[:'contributorClass'] if attributes[:'contributorClass']

      raise 'You cannot provide both :contributorClass and :contributor_class' if attributes.key?(:'contributorClass') && attributes.key?(:'contributor_class')

      self.contributor_class = attributes[:'contributor_class'] if attributes[:'contributor_class']

      self.state_inscription = attributes[:'stateInscription'] if attributes[:'stateInscription']

      raise 'You cannot provide both :stateInscription and :state_inscription' if attributes.key?(:'stateInscription') && attributes.key?(:'state_inscription')

      self.state_inscription = attributes[:'state_inscription'] if attributes[:'state_inscription']

      self.municipal_inscription = attributes[:'municipalInscription'] if attributes[:'municipalInscription']

      raise 'You cannot provide both :municipalInscription and :municipal_inscription' if attributes.key?(:'municipalInscription') && attributes.key?(:'municipal_inscription')

      self.municipal_inscription = attributes[:'municipal_inscription'] if attributes[:'municipal_inscription']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        address_key == other.address_key &&
        line1 == other.line1 &&
        line2 == other.line2 &&
        line3 == other.line3 &&
        line4 == other.line4 &&
        street_name == other.street_name &&
        street_number == other.street_number &&
        city == other.city &&
        county == other.county &&
        country == other.country &&
        province == other.province &&
        postal_code == other.postal_code &&
        state == other.state &&
        email_address == other.email_address &&
        company_name == other.company_name &&
        first_name == other.first_name &&
        middle_name == other.middle_name &&
        last_name == other.last_name &&
        phone_country_code == other.phone_country_code &&
        phone_number == other.phone_number &&
        job_title == other.job_title &&
        department_name == other.department_name &&
        internal_number == other.internal_number &&
        contributor_class == other.contributor_class &&
        state_inscription == other.state_inscription &&
        municipal_inscription == other.municipal_inscription
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
      [address_key, line1, line2, line3, line4, street_name, street_number, city, county, country, province, postal_code, state, email_address, company_name, first_name, middle_name, last_name, phone_country_code, phone_number, job_title, department_name, internal_number, contributor_class, state_inscription, municipal_inscription].hash
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
