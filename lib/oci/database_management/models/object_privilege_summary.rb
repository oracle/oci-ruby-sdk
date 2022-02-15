# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of object privileges.
  class DatabaseManagement::Models::ObjectPrivilegeSummary
    HIERARCHY_ENUM = [
      HIERARCHY_YES = 'YES'.freeze,
      HIERARCHY_NO = 'NO'.freeze,
      HIERARCHY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    GRANT_OPTION_ENUM = [
      GRANT_OPTION_YES = 'YES'.freeze,
      GRANT_OPTION_NO = 'NO'.freeze,
      GRANT_OPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    COMMON_ENUM = [
      COMMON_YES = 'YES'.freeze,
      COMMON_NO = 'NO'.freeze,
      COMMON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INHERITED_ENUM = [
      INHERITED_YES = 'YES'.freeze,
      INHERITED_NO = 'NO'.freeze,
      INHERITED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of the privilege on the object.
    # @return [String]
    attr_accessor :name

    # The type of object.
    # @return [String]
    attr_accessor :schema_type

    # The owner of the object.
    # @return [String]
    attr_accessor :owner

    # The name of the user who granted the object privilege.
    # @return [String]
    attr_accessor :grantor

    # Indicates whether the privilege is granted with the HIERARCHY OPTION (YES) or not (NO).
    # @return [String]
    attr_reader :hierarchy

    # The name of the object. The object can be any object, including tables, packages, indexes, sequences, and so on.
    # @return [String]
    attr_accessor :object

    # Indicates whether the privilege is granted with the GRANT OPTION (YES) or not (NO).
    # @return [String]
    attr_reader :grant_option

    # Indicates how the object privilege was granted. Possible values:
    # YES if the role is granted commonly (CONTAINER=ALL is used)
    # NO if the role is granted locally (CONTAINER=ALL is not used)
    #
    # @return [String]
    attr_reader :common

    # Indicates whether the granted privilege is inherited from another container (YES) or not (NO).
    # @return [String]
    attr_reader :inherited

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'schema_type': :'schemaType',
        'owner': :'owner',
        'grantor': :'grantor',
        'hierarchy': :'hierarchy',
        'object': :'object',
        'grant_option': :'grantOption',
        'common': :'common',
        'inherited': :'inherited'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'schema_type': :'String',
        'owner': :'String',
        'grantor': :'String',
        'hierarchy': :'String',
        'object': :'String',
        'grant_option': :'String',
        'common': :'String',
        'inherited': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :schema_type The value to assign to the {#schema_type} property
    # @option attributes [String] :owner The value to assign to the {#owner} property
    # @option attributes [String] :grantor The value to assign to the {#grantor} property
    # @option attributes [String] :hierarchy The value to assign to the {#hierarchy} property
    # @option attributes [String] :object The value to assign to the {#object} property
    # @option attributes [String] :grant_option The value to assign to the {#grant_option} property
    # @option attributes [String] :common The value to assign to the {#common} property
    # @option attributes [String] :inherited The value to assign to the {#inherited} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.schema_type = attributes[:'schemaType'] if attributes[:'schemaType']

      raise 'You cannot provide both :schemaType and :schema_type' if attributes.key?(:'schemaType') && attributes.key?(:'schema_type')

      self.schema_type = attributes[:'schema_type'] if attributes[:'schema_type']

      self.owner = attributes[:'owner'] if attributes[:'owner']

      self.grantor = attributes[:'grantor'] if attributes[:'grantor']

      self.hierarchy = attributes[:'hierarchy'] if attributes[:'hierarchy']

      self.object = attributes[:'object'] if attributes[:'object']

      self.grant_option = attributes[:'grantOption'] if attributes[:'grantOption']

      raise 'You cannot provide both :grantOption and :grant_option' if attributes.key?(:'grantOption') && attributes.key?(:'grant_option')

      self.grant_option = attributes[:'grant_option'] if attributes[:'grant_option']

      self.common = attributes[:'common'] if attributes[:'common']

      self.inherited = attributes[:'inherited'] if attributes[:'inherited']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] hierarchy Object to be assigned
    def hierarchy=(hierarchy)
      # rubocop:disable Style/ConditionalAssignment
      if hierarchy && !HIERARCHY_ENUM.include?(hierarchy)
        OCI.logger.debug("Unknown value for 'hierarchy' [" + hierarchy + "]. Mapping to 'HIERARCHY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @hierarchy = HIERARCHY_UNKNOWN_ENUM_VALUE
      else
        @hierarchy = hierarchy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] grant_option Object to be assigned
    def grant_option=(grant_option)
      # rubocop:disable Style/ConditionalAssignment
      if grant_option && !GRANT_OPTION_ENUM.include?(grant_option)
        OCI.logger.debug("Unknown value for 'grant_option' [" + grant_option + "]. Mapping to 'GRANT_OPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @grant_option = GRANT_OPTION_UNKNOWN_ENUM_VALUE
      else
        @grant_option = grant_option
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] common Object to be assigned
    def common=(common)
      # rubocop:disable Style/ConditionalAssignment
      if common && !COMMON_ENUM.include?(common)
        OCI.logger.debug("Unknown value for 'common' [" + common + "]. Mapping to 'COMMON_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @common = COMMON_UNKNOWN_ENUM_VALUE
      else
        @common = common
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] inherited Object to be assigned
    def inherited=(inherited)
      # rubocop:disable Style/ConditionalAssignment
      if inherited && !INHERITED_ENUM.include?(inherited)
        OCI.logger.debug("Unknown value for 'inherited' [" + inherited + "]. Mapping to 'INHERITED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @inherited = INHERITED_UNKNOWN_ENUM_VALUE
      else
        @inherited = inherited
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
        schema_type == other.schema_type &&
        owner == other.owner &&
        grantor == other.grantor &&
        hierarchy == other.hierarchy &&
        object == other.object &&
        grant_option == other.grant_option &&
        common == other.common &&
        inherited == other.inherited
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
      [name, schema_type, owner, grantor, hierarchy, object, grant_option, common, inherited].hash
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
