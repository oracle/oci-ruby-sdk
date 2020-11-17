# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Provide configuration information about the application in the target environment. Application Migration migrates the application to
  # the target environment only after you provide this information. The information that you must provide varies depending on the type of
  # application that you are migrating.
  #
  class ApplicationMigration::Models::ConfigurationField
    # The name of the configuration field.
    # @return [String]
    attr_accessor :name

    # The name of the group to which this field belongs, if any.
    # @return [String]
    attr_accessor :group

    # The type of the configuration field.
    # @return [String]
    attr_accessor :type

    # The value of the field.
    # @return [String]
    attr_accessor :value

    # Help text to guide the user in setting the configuration value.
    # @return [String]
    attr_accessor :description

    # Indicates whether or not the field is required (defaults to `true`).
    #
    # @return [BOOLEAN]
    attr_accessor :is_required

    # Indicates whether or not the field may be modified (defaults to `true`).
    #
    # @return [BOOLEAN]
    attr_accessor :is_mutable

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'group': :'group',
        'type': :'type',
        'value': :'value',
        'description': :'description',
        'is_required': :'isRequired',
        'is_mutable': :'isMutable'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'group': :'String',
        'type': :'String',
        'value': :'String',
        'description': :'String',
        'is_required': :'BOOLEAN',
        'is_mutable': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :group The value to assign to the {#group} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :value The value to assign to the {#value} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_required The value to assign to the {#is_required} property
    # @option attributes [BOOLEAN] :is_mutable The value to assign to the {#is_mutable} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.group = attributes[:'group'] if attributes[:'group']

      self.type = attributes[:'type'] if attributes[:'type']

      self.value = attributes[:'value'] if attributes[:'value']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_required = attributes[:'isRequired'] unless attributes[:'isRequired'].nil?
      self.is_required = true if is_required.nil? && !attributes.key?(:'isRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRequired and :is_required' if attributes.key?(:'isRequired') && attributes.key?(:'is_required')

      self.is_required = attributes[:'is_required'] unless attributes[:'is_required'].nil?
      self.is_required = true if is_required.nil? && !attributes.key?(:'isRequired') && !attributes.key?(:'is_required') # rubocop:disable Style/StringLiterals

      self.is_mutable = attributes[:'isMutable'] unless attributes[:'isMutable'].nil?
      self.is_mutable = true if is_mutable.nil? && !attributes.key?(:'isMutable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMutable and :is_mutable' if attributes.key?(:'isMutable') && attributes.key?(:'is_mutable')

      self.is_mutable = attributes[:'is_mutable'] unless attributes[:'is_mutable'].nil?
      self.is_mutable = true if is_mutable.nil? && !attributes.key?(:'isMutable') && !attributes.key?(:'is_mutable') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        group == other.group &&
        type == other.type &&
        value == other.value &&
        description == other.description &&
        is_required == other.is_required &&
        is_mutable == other.is_mutable
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
      [name, group, type, value, description, is_required, is_mutable].hash
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
