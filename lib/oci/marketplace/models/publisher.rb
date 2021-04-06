# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for a publisher.
  class Marketplace::Models::Publisher
    # Unique identifier for the publisher.
    # @return [String]
    attr_accessor :id

    # The name of the publisher.
    # @return [String]
    attr_accessor :name

    # A description of the publisher.
    # @return [String]
    attr_accessor :description

    # The year the publisher's company or organization was founded.
    # @return [Integer]
    attr_accessor :year_founded

    # The publisher's website.
    # @return [String]
    attr_accessor :website_url

    # The email address of the publisher.
    # @return [String]
    attr_accessor :contact_email

    # The phone number of the publisher.
    # @return [String]
    attr_accessor :contact_phone

    # The address of the publisher's headquarters.
    # @return [String]
    attr_accessor :hq_address

    # @return [OCI::Marketplace::Models::UploadData]
    attr_accessor :logo

    # Reference links.
    # @return [Array<OCI::Marketplace::Models::Link>]
    attr_accessor :links

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'description': :'description',
        'year_founded': :'yearFounded',
        'website_url': :'websiteUrl',
        'contact_email': :'contactEmail',
        'contact_phone': :'contactPhone',
        'hq_address': :'hqAddress',
        'logo': :'logo',
        'links': :'links'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'description': :'String',
        'year_founded': :'Integer',
        'website_url': :'String',
        'contact_email': :'String',
        'contact_phone': :'String',
        'hq_address': :'String',
        'logo': :'OCI::Marketplace::Models::UploadData',
        'links': :'Array<OCI::Marketplace::Models::Link>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :year_founded The value to assign to the {#year_founded} property
    # @option attributes [String] :website_url The value to assign to the {#website_url} property
    # @option attributes [String] :contact_email The value to assign to the {#contact_email} property
    # @option attributes [String] :contact_phone The value to assign to the {#contact_phone} property
    # @option attributes [String] :hq_address The value to assign to the {#hq_address} property
    # @option attributes [OCI::Marketplace::Models::UploadData] :logo The value to assign to the {#logo} property
    # @option attributes [Array<OCI::Marketplace::Models::Link>] :links The value to assign to the {#links} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.year_founded = attributes[:'yearFounded'] if attributes[:'yearFounded']

      raise 'You cannot provide both :yearFounded and :year_founded' if attributes.key?(:'yearFounded') && attributes.key?(:'year_founded')

      self.year_founded = attributes[:'year_founded'] if attributes[:'year_founded']

      self.website_url = attributes[:'websiteUrl'] if attributes[:'websiteUrl']

      raise 'You cannot provide both :websiteUrl and :website_url' if attributes.key?(:'websiteUrl') && attributes.key?(:'website_url')

      self.website_url = attributes[:'website_url'] if attributes[:'website_url']

      self.contact_email = attributes[:'contactEmail'] if attributes[:'contactEmail']

      raise 'You cannot provide both :contactEmail and :contact_email' if attributes.key?(:'contactEmail') && attributes.key?(:'contact_email')

      self.contact_email = attributes[:'contact_email'] if attributes[:'contact_email']

      self.contact_phone = attributes[:'contactPhone'] if attributes[:'contactPhone']

      raise 'You cannot provide both :contactPhone and :contact_phone' if attributes.key?(:'contactPhone') && attributes.key?(:'contact_phone')

      self.contact_phone = attributes[:'contact_phone'] if attributes[:'contact_phone']

      self.hq_address = attributes[:'hqAddress'] if attributes[:'hqAddress']

      raise 'You cannot provide both :hqAddress and :hq_address' if attributes.key?(:'hqAddress') && attributes.key?(:'hq_address')

      self.hq_address = attributes[:'hq_address'] if attributes[:'hq_address']

      self.logo = attributes[:'logo'] if attributes[:'logo']

      self.links = attributes[:'links'] if attributes[:'links']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        year_founded == other.year_founded &&
        website_url == other.website_url &&
        contact_email == other.contact_email &&
        contact_phone == other.contact_phone &&
        hq_address == other.hq_address &&
        logo == other.logo &&
        links == other.links
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
      [id, name, description, year_founded, website_url, contact_email, contact_phone, hq_address, logo, links].hash
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
