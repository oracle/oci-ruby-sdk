# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Geographic information about a vantage point.
  class Healthchecks::Models::Geolocation
    # An opaque identifier for the geographic location of the vantage point.
    # @return [String]
    attr_accessor :geo_key

    # The ISO 3166-2 code for this location's first-level administrative
    # division, either a US state or Canadian province. Only included for locations
    # in the US or Canada. For a list of codes, see
    # [Country Codes](https://www.iso.org/obp/ui/#search).
    #
    # @return [String]
    attr_accessor :admin_div_code

    # Common English-language name for the city.
    #
    # @return [String]
    attr_accessor :city_name

    # The ISO 3166-1 alpha-2 country code. For a list of codes,
    # see [Country Codes](https://www.iso.org/obp/ui/#search).
    #
    # @return [String]
    attr_accessor :country_code

    # The common English-language name for the country.
    #
    # @return [String]
    attr_accessor :country_name

    # Degrees north of the Equator.
    #
    # @return [Float]
    attr_accessor :latitude

    # Degrees east of the prime meridian.
    #
    # @return [Float]
    attr_accessor :longitude

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'geo_key': :'geoKey',
        'admin_div_code': :'adminDivCode',
        'city_name': :'cityName',
        'country_code': :'countryCode',
        'country_name': :'countryName',
        'latitude': :'latitude',
        'longitude': :'longitude'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'geo_key': :'String',
        'admin_div_code': :'String',
        'city_name': :'String',
        'country_code': :'String',
        'country_name': :'String',
        'latitude': :'Float',
        'longitude': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :geo_key The value to assign to the {#geo_key} property
    # @option attributes [String] :admin_div_code The value to assign to the {#admin_div_code} property
    # @option attributes [String] :city_name The value to assign to the {#city_name} property
    # @option attributes [String] :country_code The value to assign to the {#country_code} property
    # @option attributes [String] :country_name The value to assign to the {#country_name} property
    # @option attributes [Float] :latitude The value to assign to the {#latitude} property
    # @option attributes [Float] :longitude The value to assign to the {#longitude} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.geo_key = attributes[:'geoKey'] if attributes[:'geoKey']

      raise 'You cannot provide both :geoKey and :geo_key' if attributes.key?(:'geoKey') && attributes.key?(:'geo_key')

      self.geo_key = attributes[:'geo_key'] if attributes[:'geo_key']

      self.admin_div_code = attributes[:'adminDivCode'] if attributes[:'adminDivCode']

      raise 'You cannot provide both :adminDivCode and :admin_div_code' if attributes.key?(:'adminDivCode') && attributes.key?(:'admin_div_code')

      self.admin_div_code = attributes[:'admin_div_code'] if attributes[:'admin_div_code']

      self.city_name = attributes[:'cityName'] if attributes[:'cityName']

      raise 'You cannot provide both :cityName and :city_name' if attributes.key?(:'cityName') && attributes.key?(:'city_name')

      self.city_name = attributes[:'city_name'] if attributes[:'city_name']

      self.country_code = attributes[:'countryCode'] if attributes[:'countryCode']

      raise 'You cannot provide both :countryCode and :country_code' if attributes.key?(:'countryCode') && attributes.key?(:'country_code')

      self.country_code = attributes[:'country_code'] if attributes[:'country_code']

      self.country_name = attributes[:'countryName'] if attributes[:'countryName']

      raise 'You cannot provide both :countryName and :country_name' if attributes.key?(:'countryName') && attributes.key?(:'country_name')

      self.country_name = attributes[:'country_name'] if attributes[:'country_name']

      self.latitude = attributes[:'latitude'] if attributes[:'latitude']

      self.longitude = attributes[:'longitude'] if attributes[:'longitude']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        geo_key == other.geo_key &&
        admin_div_code == other.admin_div_code &&
        city_name == other.city_name &&
        country_code == other.country_code &&
        country_name == other.country_name &&
        latitude == other.latitude &&
        longitude == other.longitude
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
      [geo_key, admin_div_code, city_name, country_code, country_name, latitude, longitude].hash
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
