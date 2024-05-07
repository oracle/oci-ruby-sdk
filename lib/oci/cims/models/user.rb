# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181231
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about the user.
  class Cims::Models::User
    PROBLEM_TYPE_ENUM = [
      PROBLEM_TYPE_LIMIT = 'LIMIT'.freeze,
      PROBLEM_TYPE_LEGACY_LIMIT = 'LEGACY_LIMIT'.freeze,
      PROBLEM_TYPE_TECH = 'TECH'.freeze,
      PROBLEM_TYPE_ACCOUNT = 'ACCOUNT'.freeze,
      PROBLEM_TYPE_TAXONOMY = 'TAXONOMY'.freeze,
      PROBLEM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** A unique identifier for the user.
    # @return [String]
    attr_accessor :key

    # The user's first name.
    # @return [String]
    attr_accessor :first_name

    # The user's last name.
    # @return [String]
    attr_accessor :last_name

    # The country of the user.
    # @return [String]
    attr_accessor :country

    # The CSI associated with the user.
    # @return [String]
    attr_accessor :csi

    # The user's contact phone number.
    # @return [String]
    attr_accessor :phone

    # The timezone of the user.
    # @return [String]
    attr_accessor :timezone

    # The company that the user belongs to.
    # @return [String]
    attr_accessor :organization_name

    # The OCID of the tenancy.
    # @return [String]
    attr_accessor :compartment_id

    # The email of the contact person.
    # @return [String]
    attr_accessor :contact_email

    # The kind of support ticket, such as a technical support request or a limit increase request.
    # @return [String]
    attr_reader :problem_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'first_name': :'firstName',
        'last_name': :'lastName',
        'country': :'country',
        'csi': :'csi',
        'phone': :'phone',
        'timezone': :'timezone',
        'organization_name': :'organizationName',
        'compartment_id': :'compartmentId',
        'contact_email': :'contactEmail',
        'problem_type': :'problemType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'first_name': :'String',
        'last_name': :'String',
        'country': :'String',
        'csi': :'String',
        'phone': :'String',
        'timezone': :'String',
        'organization_name': :'String',
        'compartment_id': :'String',
        'contact_email': :'String',
        'problem_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :first_name The value to assign to the {#first_name} property
    # @option attributes [String] :last_name The value to assign to the {#last_name} property
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [String] :csi The value to assign to the {#csi} property
    # @option attributes [String] :phone The value to assign to the {#phone} property
    # @option attributes [String] :timezone The value to assign to the {#timezone} property
    # @option attributes [String] :organization_name The value to assign to the {#organization_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :contact_email The value to assign to the {#contact_email} property
    # @option attributes [String] :problem_type The value to assign to the {#problem_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.first_name = attributes[:'firstName'] if attributes[:'firstName']

      raise 'You cannot provide both :firstName and :first_name' if attributes.key?(:'firstName') && attributes.key?(:'first_name')

      self.first_name = attributes[:'first_name'] if attributes[:'first_name']

      self.last_name = attributes[:'lastName'] if attributes[:'lastName']

      raise 'You cannot provide both :lastName and :last_name' if attributes.key?(:'lastName') && attributes.key?(:'last_name')

      self.last_name = attributes[:'last_name'] if attributes[:'last_name']

      self.country = attributes[:'country'] if attributes[:'country']

      self.csi = attributes[:'csi'] if attributes[:'csi']

      self.phone = attributes[:'phone'] if attributes[:'phone']

      self.timezone = attributes[:'timezone'] if attributes[:'timezone']

      self.organization_name = attributes[:'organizationName'] if attributes[:'organizationName']

      raise 'You cannot provide both :organizationName and :organization_name' if attributes.key?(:'organizationName') && attributes.key?(:'organization_name')

      self.organization_name = attributes[:'organization_name'] if attributes[:'organization_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.contact_email = attributes[:'contactEmail'] if attributes[:'contactEmail']

      raise 'You cannot provide both :contactEmail and :contact_email' if attributes.key?(:'contactEmail') && attributes.key?(:'contact_email')

      self.contact_email = attributes[:'contact_email'] if attributes[:'contact_email']

      self.problem_type = attributes[:'problemType'] if attributes[:'problemType']

      raise 'You cannot provide both :problemType and :problem_type' if attributes.key?(:'problemType') && attributes.key?(:'problem_type')

      self.problem_type = attributes[:'problem_type'] if attributes[:'problem_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] problem_type Object to be assigned
    def problem_type=(problem_type)
      # rubocop:disable Style/ConditionalAssignment
      if problem_type && !PROBLEM_TYPE_ENUM.include?(problem_type)
        OCI.logger.debug("Unknown value for 'problem_type' [" + problem_type + "]. Mapping to 'PROBLEM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @problem_type = PROBLEM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @problem_type = problem_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        country == other.country &&
        csi == other.csi &&
        phone == other.phone &&
        timezone == other.timezone &&
        organization_name == other.organization_name &&
        compartment_id == other.compartment_id &&
        contact_email == other.contact_email &&
        problem_type == other.problem_type
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
      [key, first_name, last_name, country, csi, phone, timezone, organization_name, compartment_id, contact_email, problem_type].hash
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
