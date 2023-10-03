# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A complex attribute that contains attributes representing the name
  #
  # **SCIM++ Properties:**
  #  - idcsCsvAttributeNameMappings: [[columnHeaderName:Formatted Name, mapsTo:name.formatted], [columnHeaderName:Honorific Prefix, mapsTo:name.honorificPrefix], [columnHeaderName:First Name, mapsTo:name.givenName], [columnHeaderName:Middle Name, mapsTo:name.middleName], [columnHeaderName:Last Name, mapsTo:name.familyName], [columnHeaderName:Honorific Suffix, mapsTo:name.honorificSuffix]]
  #  - idcsPii: true
  #  - multiValued: false
  #  - mutability: readWrite
  #  - required: true
  #  - returned: default
  #  - type: complex
  #  - uniqueness: none
  class IdentityDomains::Models::UserName
    # Full name
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :formatted

    # **[Required]** Last name
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsCsvAttributeName: Last Name
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: true
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :family_name

    # First name
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsCsvAttributeName: First Name
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :given_name

    # Middle name
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsCsvAttributeName: Middle Name
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :middle_name

    # Prefix
    #
    # **SCIM++ Properties:**
    #  - idcsCsvAttributeName: Honorific Prefix
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :honorific_prefix

    # Suffix
    #
    # **SCIM++ Properties:**
    #  - idcsCsvAttributeName: Honorific Suffix
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :honorific_suffix

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'formatted': :'formatted',
        'family_name': :'familyName',
        'given_name': :'givenName',
        'middle_name': :'middleName',
        'honorific_prefix': :'honorificPrefix',
        'honorific_suffix': :'honorificSuffix'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'formatted': :'String',
        'family_name': :'String',
        'given_name': :'String',
        'middle_name': :'String',
        'honorific_prefix': :'String',
        'honorific_suffix': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :formatted The value to assign to the {#formatted} property
    # @option attributes [String] :family_name The value to assign to the {#family_name} property
    # @option attributes [String] :given_name The value to assign to the {#given_name} property
    # @option attributes [String] :middle_name The value to assign to the {#middle_name} property
    # @option attributes [String] :honorific_prefix The value to assign to the {#honorific_prefix} property
    # @option attributes [String] :honorific_suffix The value to assign to the {#honorific_suffix} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.formatted = attributes[:'formatted'] if attributes[:'formatted']

      self.family_name = attributes[:'familyName'] if attributes[:'familyName']

      raise 'You cannot provide both :familyName and :family_name' if attributes.key?(:'familyName') && attributes.key?(:'family_name')

      self.family_name = attributes[:'family_name'] if attributes[:'family_name']

      self.given_name = attributes[:'givenName'] if attributes[:'givenName']

      raise 'You cannot provide both :givenName and :given_name' if attributes.key?(:'givenName') && attributes.key?(:'given_name')

      self.given_name = attributes[:'given_name'] if attributes[:'given_name']

      self.middle_name = attributes[:'middleName'] if attributes[:'middleName']

      raise 'You cannot provide both :middleName and :middle_name' if attributes.key?(:'middleName') && attributes.key?(:'middle_name')

      self.middle_name = attributes[:'middle_name'] if attributes[:'middle_name']

      self.honorific_prefix = attributes[:'honorificPrefix'] if attributes[:'honorificPrefix']

      raise 'You cannot provide both :honorificPrefix and :honorific_prefix' if attributes.key?(:'honorificPrefix') && attributes.key?(:'honorific_prefix')

      self.honorific_prefix = attributes[:'honorific_prefix'] if attributes[:'honorific_prefix']

      self.honorific_suffix = attributes[:'honorificSuffix'] if attributes[:'honorificSuffix']

      raise 'You cannot provide both :honorificSuffix and :honorific_suffix' if attributes.key?(:'honorificSuffix') && attributes.key?(:'honorific_suffix')

      self.honorific_suffix = attributes[:'honorific_suffix'] if attributes[:'honorific_suffix']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        formatted == other.formatted &&
        family_name == other.family_name &&
        given_name == other.given_name &&
        middle_name == other.middle_name &&
        honorific_prefix == other.honorific_prefix &&
        honorific_suffix == other.honorific_suffix
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
      [formatted, family_name, given_name, middle_name, honorific_prefix, honorific_suffix].hash
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
