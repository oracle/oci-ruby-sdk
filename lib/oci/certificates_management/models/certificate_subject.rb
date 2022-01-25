# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The subject of the certificate, which is a distinguished name that identifies the entity that owns the public key in the certificate.
  #
  class CertificatesManagement::Models::CertificateSubject
    # **[Required]** Common name or fully-qualified domain name (RDN CN).
    # @return [String]
    attr_accessor :common_name

    # Country name (RDN C).
    # @return [String]
    attr_accessor :country

    # Domain component (RDN DC).
    # @return [String]
    attr_accessor :domain_component

    # Distinguished name qualifier(RDN DNQ).
    # @return [String]
    attr_accessor :distinguished_name_qualifier

    # Personal generational qualifier (for example, Sr., Jr. 3rd, or IV).
    # @return [String]
    attr_accessor :generation_qualifier

    # Personal given name (RDN G or GN).
    # @return [String]
    attr_accessor :given_name

    # Personal initials.
    # @return [String]
    attr_accessor :initials

    # Locality (RDN L).
    # @return [String]
    attr_accessor :locality_name

    # Organization (RDN O).
    # @return [String]
    attr_accessor :organization

    # Organizational unit (RDN OU).
    # @return [String]
    attr_accessor :organizational_unit

    # Subject pseudonym.
    # @return [String]
    attr_accessor :pseudonym

    # Unique subject identifier, which is not the same as the certificate serial number (RDN SERIALNUMBER).
    # @return [String]
    attr_accessor :serial_number

    # State or province name (RDN ST or S).
    # @return [String]
    attr_accessor :state_or_province_name

    # Street address (RDN STREET).
    # @return [String]
    attr_accessor :street

    # Personal surname (RDN SN).
    # @return [String]
    attr_accessor :surname

    # Title (RDN T or TITLE).
    # @return [String]
    attr_accessor :title

    # User ID (RDN UID).
    # @return [String]
    attr_accessor :user_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'common_name': :'commonName',
        'country': :'country',
        'domain_component': :'domainComponent',
        'distinguished_name_qualifier': :'distinguishedNameQualifier',
        'generation_qualifier': :'generationQualifier',
        'given_name': :'givenName',
        'initials': :'initials',
        'locality_name': :'localityName',
        'organization': :'organization',
        'organizational_unit': :'organizationalUnit',
        'pseudonym': :'pseudonym',
        'serial_number': :'serialNumber',
        'state_or_province_name': :'stateOrProvinceName',
        'street': :'street',
        'surname': :'surname',
        'title': :'title',
        'user_id': :'userId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'common_name': :'String',
        'country': :'String',
        'domain_component': :'String',
        'distinguished_name_qualifier': :'String',
        'generation_qualifier': :'String',
        'given_name': :'String',
        'initials': :'String',
        'locality_name': :'String',
        'organization': :'String',
        'organizational_unit': :'String',
        'pseudonym': :'String',
        'serial_number': :'String',
        'state_or_province_name': :'String',
        'street': :'String',
        'surname': :'String',
        'title': :'String',
        'user_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :common_name The value to assign to the {#common_name} property
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [String] :domain_component The value to assign to the {#domain_component} property
    # @option attributes [String] :distinguished_name_qualifier The value to assign to the {#distinguished_name_qualifier} property
    # @option attributes [String] :generation_qualifier The value to assign to the {#generation_qualifier} property
    # @option attributes [String] :given_name The value to assign to the {#given_name} property
    # @option attributes [String] :initials The value to assign to the {#initials} property
    # @option attributes [String] :locality_name The value to assign to the {#locality_name} property
    # @option attributes [String] :organization The value to assign to the {#organization} property
    # @option attributes [String] :organizational_unit The value to assign to the {#organizational_unit} property
    # @option attributes [String] :pseudonym The value to assign to the {#pseudonym} property
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [String] :state_or_province_name The value to assign to the {#state_or_province_name} property
    # @option attributes [String] :street The value to assign to the {#street} property
    # @option attributes [String] :surname The value to assign to the {#surname} property
    # @option attributes [String] :title The value to assign to the {#title} property
    # @option attributes [String] :user_id The value to assign to the {#user_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.common_name = attributes[:'commonName'] if attributes[:'commonName']

      raise 'You cannot provide both :commonName and :common_name' if attributes.key?(:'commonName') && attributes.key?(:'common_name')

      self.common_name = attributes[:'common_name'] if attributes[:'common_name']

      self.country = attributes[:'country'] if attributes[:'country']
      self.country = "null" if country.nil? && !attributes.key?(:'country') # rubocop:disable Style/StringLiterals

      self.domain_component = attributes[:'domainComponent'] if attributes[:'domainComponent']
      self.domain_component = "null" if domain_component.nil? && !attributes.key?(:'domainComponent') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :domainComponent and :domain_component' if attributes.key?(:'domainComponent') && attributes.key?(:'domain_component')

      self.domain_component = attributes[:'domain_component'] if attributes[:'domain_component']
      self.domain_component = "null" if domain_component.nil? && !attributes.key?(:'domainComponent') && !attributes.key?(:'domain_component') # rubocop:disable Style/StringLiterals

      self.distinguished_name_qualifier = attributes[:'distinguishedNameQualifier'] if attributes[:'distinguishedNameQualifier']
      self.distinguished_name_qualifier = "null" if distinguished_name_qualifier.nil? && !attributes.key?(:'distinguishedNameQualifier') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :distinguishedNameQualifier and :distinguished_name_qualifier' if attributes.key?(:'distinguishedNameQualifier') && attributes.key?(:'distinguished_name_qualifier')

      self.distinguished_name_qualifier = attributes[:'distinguished_name_qualifier'] if attributes[:'distinguished_name_qualifier']
      self.distinguished_name_qualifier = "null" if distinguished_name_qualifier.nil? && !attributes.key?(:'distinguishedNameQualifier') && !attributes.key?(:'distinguished_name_qualifier') # rubocop:disable Style/StringLiterals

      self.generation_qualifier = attributes[:'generationQualifier'] if attributes[:'generationQualifier']
      self.generation_qualifier = "null" if generation_qualifier.nil? && !attributes.key?(:'generationQualifier') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :generationQualifier and :generation_qualifier' if attributes.key?(:'generationQualifier') && attributes.key?(:'generation_qualifier')

      self.generation_qualifier = attributes[:'generation_qualifier'] if attributes[:'generation_qualifier']
      self.generation_qualifier = "null" if generation_qualifier.nil? && !attributes.key?(:'generationQualifier') && !attributes.key?(:'generation_qualifier') # rubocop:disable Style/StringLiterals

      self.given_name = attributes[:'givenName'] if attributes[:'givenName']
      self.given_name = "null" if given_name.nil? && !attributes.key?(:'givenName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :givenName and :given_name' if attributes.key?(:'givenName') && attributes.key?(:'given_name')

      self.given_name = attributes[:'given_name'] if attributes[:'given_name']
      self.given_name = "null" if given_name.nil? && !attributes.key?(:'givenName') && !attributes.key?(:'given_name') # rubocop:disable Style/StringLiterals

      self.initials = attributes[:'initials'] if attributes[:'initials']
      self.initials = "null" if initials.nil? && !attributes.key?(:'initials') # rubocop:disable Style/StringLiterals

      self.locality_name = attributes[:'localityName'] if attributes[:'localityName']
      self.locality_name = "null" if locality_name.nil? && !attributes.key?(:'localityName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :localityName and :locality_name' if attributes.key?(:'localityName') && attributes.key?(:'locality_name')

      self.locality_name = attributes[:'locality_name'] if attributes[:'locality_name']
      self.locality_name = "null" if locality_name.nil? && !attributes.key?(:'localityName') && !attributes.key?(:'locality_name') # rubocop:disable Style/StringLiterals

      self.organization = attributes[:'organization'] if attributes[:'organization']
      self.organization = "null" if organization.nil? && !attributes.key?(:'organization') # rubocop:disable Style/StringLiterals

      self.organizational_unit = attributes[:'organizationalUnit'] if attributes[:'organizationalUnit']
      self.organizational_unit = "null" if organizational_unit.nil? && !attributes.key?(:'organizationalUnit') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :organizationalUnit and :organizational_unit' if attributes.key?(:'organizationalUnit') && attributes.key?(:'organizational_unit')

      self.organizational_unit = attributes[:'organizational_unit'] if attributes[:'organizational_unit']
      self.organizational_unit = "null" if organizational_unit.nil? && !attributes.key?(:'organizationalUnit') && !attributes.key?(:'organizational_unit') # rubocop:disable Style/StringLiterals

      self.pseudonym = attributes[:'pseudonym'] if attributes[:'pseudonym']
      self.pseudonym = "null" if pseudonym.nil? && !attributes.key?(:'pseudonym') # rubocop:disable Style/StringLiterals

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']
      self.serial_number = "null" if serial_number.nil? && !attributes.key?(:'serialNumber') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']
      self.serial_number = "null" if serial_number.nil? && !attributes.key?(:'serialNumber') && !attributes.key?(:'serial_number') # rubocop:disable Style/StringLiterals

      self.state_or_province_name = attributes[:'stateOrProvinceName'] if attributes[:'stateOrProvinceName']
      self.state_or_province_name = "null" if state_or_province_name.nil? && !attributes.key?(:'stateOrProvinceName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :stateOrProvinceName and :state_or_province_name' if attributes.key?(:'stateOrProvinceName') && attributes.key?(:'state_or_province_name')

      self.state_or_province_name = attributes[:'state_or_province_name'] if attributes[:'state_or_province_name']
      self.state_or_province_name = "null" if state_or_province_name.nil? && !attributes.key?(:'stateOrProvinceName') && !attributes.key?(:'state_or_province_name') # rubocop:disable Style/StringLiterals

      self.street = attributes[:'street'] if attributes[:'street']
      self.street = "null" if street.nil? && !attributes.key?(:'street') # rubocop:disable Style/StringLiterals

      self.surname = attributes[:'surname'] if attributes[:'surname']
      self.surname = "null" if surname.nil? && !attributes.key?(:'surname') # rubocop:disable Style/StringLiterals

      self.title = attributes[:'title'] if attributes[:'title']
      self.title = "null" if title.nil? && !attributes.key?(:'title') # rubocop:disable Style/StringLiterals

      self.user_id = attributes[:'userId'] if attributes[:'userId']
      self.user_id = "null" if user_id.nil? && !attributes.key?(:'userId') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :userId and :user_id' if attributes.key?(:'userId') && attributes.key?(:'user_id')

      self.user_id = attributes[:'user_id'] if attributes[:'user_id']
      self.user_id = "null" if user_id.nil? && !attributes.key?(:'userId') && !attributes.key?(:'user_id') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        common_name == other.common_name &&
        country == other.country &&
        domain_component == other.domain_component &&
        distinguished_name_qualifier == other.distinguished_name_qualifier &&
        generation_qualifier == other.generation_qualifier &&
        given_name == other.given_name &&
        initials == other.initials &&
        locality_name == other.locality_name &&
        organization == other.organization &&
        organizational_unit == other.organizational_unit &&
        pseudonym == other.pseudonym &&
        serial_number == other.serial_number &&
        state_or_province_name == other.state_or_province_name &&
        street == other.street &&
        surname == other.surname &&
        title == other.title &&
        user_id == other.user_id
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
      [common_name, country, domain_component, distinguished_name_qualifier, generation_qualifier, given_name, initials, locality_name, organization, organizational_unit, pseudonym, serial_number, state_or_province_name, street, surname, title, user_id].hash
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
