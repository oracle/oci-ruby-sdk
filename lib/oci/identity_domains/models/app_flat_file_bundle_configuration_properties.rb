# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Flat file connector bundle configuration properties
  #
  # **SCIM++ Properties:**
  #  - idcsCompositeKey: [name]
  #  - idcsSearchable: true
  #  - multiValued: true
  #  - mutability: readWrite
  #  - required: false
  #  - returned: default
  #  - type: complex
  #  - uniqueness: none
  class IdentityDomains::Models::AppFlatFileBundleConfigurationProperties
    ICF_TYPE_ENUM = [
      ICF_TYPE_LONG = 'Long'.freeze,
      ICF_TYPE_STRING = 'String'.freeze,
      ICF_TYPE_CHARACTER = 'Character'.freeze,
      ICF_TYPE_DOUBLE = 'Double'.freeze,
      ICF_TYPE_FLOAT = 'Float'.freeze,
      ICF_TYPE_INTEGER = 'Integer'.freeze,
      ICF_TYPE_BOOLEAN = 'Boolean'.freeze,
      ICF_TYPE_URI = 'URI'.freeze,
      ICF_TYPE_FILE = 'File'.freeze,
      ICF_TYPE_GUARDED_BYTE_ARRAY = 'GuardedByteArray'.freeze,
      ICF_TYPE_GUARDED_STRING = 'GuardedString'.freeze,
      ICF_TYPE_ARRAY_OF_LONG = 'ArrayOfLong'.freeze,
      ICF_TYPE_ARRAY_OF_STRING = 'ArrayOfString'.freeze,
      ICF_TYPE_ARRAY_OF_CHARACTER = 'ArrayOfCharacter'.freeze,
      ICF_TYPE_ARRAY_OF_DOUBLE = 'ArrayOfDouble'.freeze,
      ICF_TYPE_ARRAY_OF_FLOAT = 'ArrayOfFloat'.freeze,
      ICF_TYPE_ARRAY_OF_INTEGER = 'ArrayOfInteger'.freeze,
      ICF_TYPE_ARRAY_OF_BOOLEAN = 'ArrayOfBoolean'.freeze,
      ICF_TYPE_ARRAY_OF_URI = 'ArrayOfURI'.freeze,
      ICF_TYPE_ARRAY_OF_FILE = 'ArrayOfFile'.freeze,
      ICF_TYPE_ARRAY_OF_GUARDED_BYTE_ARRAY = 'ArrayOfGuardedByteArray'.freeze,
      ICF_TYPE_ARRAY_OF_GUARDED_STRING = 'ArrayOfGuardedString'.freeze,
      ICF_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of the flatfile bundle configuration property. This attribute maps to \\\"name\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: true
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :name

    # Display name of the flatfile bundle configuration property. This attribute maps to \\\"displayName\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :display_name

    # **[Required]** ICF data type of flatfile the bundle configuration property. This attribute maps to \\\"type\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: true
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_reader :icf_type

    # Value of the flatfile bundle configuration property. This attribute maps to \\\"value\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - idcsSensitive: encrypt
    #  - multiValued: true
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [Array<String>]
    attr_accessor :value

    # Display sequence of the bundle configuration property.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: integer
    #  - uniqueness: none
    # @return [Integer]
    attr_accessor :order

    # Help message of the flatfile bundle configuration property. This attribute maps to \\\"helpMessage\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :help_message

    # **[Required]** If true, this flatfile bundle configuration property is required to connect to the target connected managed app. This attribute maps to \\\"isRequired\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: true
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :required

    # If true, this flatfile bundle configuration property value is confidential and will be encrypted in Oracle Identity Cloud Service. This attribute maps to \\\"isConfidential\\\" attribute in \\\"ConfigurationProperty\\\" in ICF.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :confidential

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'display_name': :'displayName',
        'icf_type': :'icfType',
        'value': :'value',
        'order': :'order',
        'help_message': :'helpMessage',
        'required': :'required',
        'confidential': :'confidential'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_name': :'String',
        'icf_type': :'String',
        'value': :'Array<String>',
        'order': :'Integer',
        'help_message': :'String',
        'required': :'BOOLEAN',
        'confidential': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :icf_type The value to assign to the {#icf_type} property
    # @option attributes [Array<String>] :value The value to assign to the {#value} property
    # @option attributes [Integer] :order The value to assign to the {#order} property
    # @option attributes [String] :help_message The value to assign to the {#help_message} property
    # @option attributes [BOOLEAN] :required The value to assign to the {#required} property
    # @option attributes [BOOLEAN] :confidential The value to assign to the {#confidential} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.icf_type = attributes[:'icfType'] if attributes[:'icfType']

      raise 'You cannot provide both :icfType and :icf_type' if attributes.key?(:'icfType') && attributes.key?(:'icf_type')

      self.icf_type = attributes[:'icf_type'] if attributes[:'icf_type']

      self.value = attributes[:'value'] if attributes[:'value']

      self.order = attributes[:'order'] if attributes[:'order']

      self.help_message = attributes[:'helpMessage'] if attributes[:'helpMessage']

      raise 'You cannot provide both :helpMessage and :help_message' if attributes.key?(:'helpMessage') && attributes.key?(:'help_message')

      self.help_message = attributes[:'help_message'] if attributes[:'help_message']

      self.required = attributes[:'required'] unless attributes[:'required'].nil?

      self.confidential = attributes[:'confidential'] unless attributes[:'confidential'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] icf_type Object to be assigned
    def icf_type=(icf_type)
      # rubocop:disable Style/ConditionalAssignment
      if icf_type && !ICF_TYPE_ENUM.include?(icf_type)
        OCI.logger.debug("Unknown value for 'icf_type' [" + icf_type + "]. Mapping to 'ICF_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @icf_type = ICF_TYPE_UNKNOWN_ENUM_VALUE
      else
        @icf_type = icf_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        display_name == other.display_name &&
        icf_type == other.icf_type &&
        value == other.value &&
        order == other.order &&
        help_message == other.help_message &&
        required == other.required &&
        confidential == other.confidential
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
      [name, display_name, icf_type, value, order, help_message, required, confidential].hash
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
