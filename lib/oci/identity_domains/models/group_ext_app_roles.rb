# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A list of appRoles that the user belongs to, either thorough direct membership, nested groups, or dynamically calculated
  #
  # **SCIM++ Properties:**
  #  - caseExact: false
  #  - idcsCompositeKey: [value]
  #  - idcsSearchable: true
  #  - multiValued: true
  #  - mutability: readOnly
  #  - required: false
  #  - returned: request
  #  - type: complex
  #  - uniqueness: none
  class IdentityDomains::Models::GroupExtAppRoles
    TYPE_ENUM = [
      TYPE_DIRECT = 'direct'.freeze,
      TYPE_INDIRECT = 'indirect'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The identifier of the appRole
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: true
    #  - returned: always
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :value

    # The URI of the corresponding appRole resource to which the user belongs
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: reference
    #  - uniqueness: none
    # @return [String]
    attr_accessor :ref

    # A human readable name, primarily used for display purposes. READ-ONLY.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :display

    # A label indicating the attribute's function; e.g., 'direct' or 'indirect'.
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_reader :type

    # ID of parent App. READ-ONLY.
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :app_id

    # Name of parent App. READ-ONLY.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :app_name

    # If true, then the role provides administrative access privileges. READ-ONLY.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :admin_role

    # The name of the legacy group associated with this AppRole.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :legacy_group_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'value': :'value',
        'ref': :'$ref',
        'display': :'display',
        'type': :'type',
        'app_id': :'appId',
        'app_name': :'appName',
        'admin_role': :'adminRole',
        'legacy_group_name': :'legacyGroupName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'value': :'String',
        'ref': :'String',
        'display': :'String',
        'type': :'String',
        'app_id': :'String',
        'app_name': :'String',
        'admin_role': :'BOOLEAN',
        'legacy_group_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :value The value to assign to the {#value} property
    # @option attributes [String] :ref The value to assign to the {#ref} property
    # @option attributes [String] :display The value to assign to the {#display} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :app_id The value to assign to the {#app_id} property
    # @option attributes [String] :app_name The value to assign to the {#app_name} property
    # @option attributes [BOOLEAN] :admin_role The value to assign to the {#admin_role} property
    # @option attributes [String] :legacy_group_name The value to assign to the {#legacy_group_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.value = attributes[:'value'] if attributes[:'value']

      self.ref = attributes[:'$ref'] if attributes[:'$ref']

      self.display = attributes[:'display'] if attributes[:'display']

      self.type = attributes[:'type'] if attributes[:'type']

      self.app_id = attributes[:'appId'] if attributes[:'appId']

      raise 'You cannot provide both :appId and :app_id' if attributes.key?(:'appId') && attributes.key?(:'app_id')

      self.app_id = attributes[:'app_id'] if attributes[:'app_id']

      self.app_name = attributes[:'appName'] if attributes[:'appName']

      raise 'You cannot provide both :appName and :app_name' if attributes.key?(:'appName') && attributes.key?(:'app_name')

      self.app_name = attributes[:'app_name'] if attributes[:'app_name']

      self.admin_role = attributes[:'adminRole'] unless attributes[:'adminRole'].nil?

      raise 'You cannot provide both :adminRole and :admin_role' if attributes.key?(:'adminRole') && attributes.key?(:'admin_role')

      self.admin_role = attributes[:'admin_role'] unless attributes[:'admin_role'].nil?

      self.legacy_group_name = attributes[:'legacyGroupName'] if attributes[:'legacyGroupName']

      raise 'You cannot provide both :legacyGroupName and :legacy_group_name' if attributes.key?(:'legacyGroupName') && attributes.key?(:'legacy_group_name')

      self.legacy_group_name = attributes[:'legacy_group_name'] if attributes[:'legacy_group_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        value == other.value &&
        ref == other.ref &&
        display == other.display &&
        type == other.type &&
        app_id == other.app_id &&
        app_name == other.app_name &&
        admin_role == other.admin_role &&
        legacy_group_name == other.legacy_group_name
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
      [value, ref, display, type, app_id, app_name, admin_role, legacy_group_name].hash
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
