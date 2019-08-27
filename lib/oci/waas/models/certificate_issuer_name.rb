# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The issuer of the certificate.
  class Waas::Models::CertificateIssuerName
    # ISO 3166-1 alpha-2 code of the country where the organization is located. For a list of codes, see [ISO's website](https://www.iso.org/obp/ui/#search/code/).
    # @return [String]
    attr_accessor :country

    # The province where the organization is located.
    # @return [String]
    attr_accessor :state_province

    # The city in which the organization is located.
    # @return [String]
    attr_accessor :locality

    # The organization name.
    # @return [String]
    attr_accessor :organization

    # The field to differentiate between divisions within an organization.
    # @return [String]
    attr_accessor :organizational_unit

    # The Certificate Authority (CA) name.
    # @return [String]
    attr_accessor :common_name

    # The email address of the server's administrator.
    # @return [String]
    attr_accessor :email_address

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'country': :'country',
        'state_province': :'stateProvince',
        'locality': :'locality',
        'organization': :'organization',
        'organizational_unit': :'organizationalUnit',
        'common_name': :'commonName',
        'email_address': :'emailAddress'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'country': :'String',
        'state_province': :'String',
        'locality': :'String',
        'organization': :'String',
        'organizational_unit': :'String',
        'common_name': :'String',
        'email_address': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [String] :state_province The value to assign to the {#state_province} property
    # @option attributes [String] :locality The value to assign to the {#locality} property
    # @option attributes [String] :organization The value to assign to the {#organization} property
    # @option attributes [String] :organizational_unit The value to assign to the {#organizational_unit} property
    # @option attributes [String] :common_name The value to assign to the {#common_name} property
    # @option attributes [String] :email_address The value to assign to the {#email_address} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.country = attributes[:'country'] if attributes[:'country']

      self.state_province = attributes[:'stateProvince'] if attributes[:'stateProvince']

      raise 'You cannot provide both :stateProvince and :state_province' if attributes.key?(:'stateProvince') && attributes.key?(:'state_province')

      self.state_province = attributes[:'state_province'] if attributes[:'state_province']

      self.locality = attributes[:'locality'] if attributes[:'locality']

      self.organization = attributes[:'organization'] if attributes[:'organization']

      self.organizational_unit = attributes[:'organizationalUnit'] if attributes[:'organizationalUnit']

      raise 'You cannot provide both :organizationalUnit and :organizational_unit' if attributes.key?(:'organizationalUnit') && attributes.key?(:'organizational_unit')

      self.organizational_unit = attributes[:'organizational_unit'] if attributes[:'organizational_unit']

      self.common_name = attributes[:'commonName'] if attributes[:'commonName']

      raise 'You cannot provide both :commonName and :common_name' if attributes.key?(:'commonName') && attributes.key?(:'common_name')

      self.common_name = attributes[:'common_name'] if attributes[:'common_name']

      self.email_address = attributes[:'emailAddress'] if attributes[:'emailAddress']

      raise 'You cannot provide both :emailAddress and :email_address' if attributes.key?(:'emailAddress') && attributes.key?(:'email_address')

      self.email_address = attributes[:'email_address'] if attributes[:'email_address']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        country == other.country &&
        state_province == other.state_province &&
        locality == other.locality &&
        organization == other.organization &&
        organizational_unit == other.organizational_unit &&
        common_name == other.common_name &&
        email_address == other.email_address
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
      [country, state_province, locality, organization, organizational_unit, common_name, email_address].hash
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
