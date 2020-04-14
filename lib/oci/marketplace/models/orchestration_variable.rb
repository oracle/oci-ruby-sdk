# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model of a variable for an orchestration resource.
  class Marketplace::Models::OrchestrationVariable
    DATA_TYPE_ENUM = [
      DATA_TYPE_STRING = 'STRING'.freeze,
      DATA_TYPE_INTEGER = 'INTEGER'.freeze,
      DATA_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of the variable.
    # @return [String]
    attr_accessor :name

    # The variable's default value.
    # @return [String]
    attr_accessor :default_value

    # A description of the variable.
    # @return [String]
    attr_accessor :description

    # The data type of the variable.
    # @return [String]
    attr_reader :data_type

    # Whether the variable is mandatory.
    # @return [BOOLEAN]
    attr_accessor :is_mandatory

    # A brief textual description that helps to explain the variable.
    # @return [String]
    attr_accessor :hint_message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'default_value': :'defaultValue',
        'description': :'description',
        'data_type': :'dataType',
        'is_mandatory': :'isMandatory',
        'hint_message': :'hintMessage'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'default_value': :'String',
        'description': :'String',
        'data_type': :'String',
        'is_mandatory': :'BOOLEAN',
        'hint_message': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :default_value The value to assign to the {#default_value} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [BOOLEAN] :is_mandatory The value to assign to the {#is_mandatory} property
    # @option attributes [String] :hint_message The value to assign to the {#hint_message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.default_value = attributes[:'defaultValue'] if attributes[:'defaultValue']

      raise 'You cannot provide both :defaultValue and :default_value' if attributes.key?(:'defaultValue') && attributes.key?(:'default_value')

      self.default_value = attributes[:'default_value'] if attributes[:'default_value']

      self.description = attributes[:'description'] if attributes[:'description']

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.is_mandatory = attributes[:'isMandatory'] unless attributes[:'isMandatory'].nil?
      self.is_mandatory = false if is_mandatory.nil? && !attributes.key?(:'isMandatory') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMandatory and :is_mandatory' if attributes.key?(:'isMandatory') && attributes.key?(:'is_mandatory')

      self.is_mandatory = attributes[:'is_mandatory'] unless attributes[:'is_mandatory'].nil?
      self.is_mandatory = false if is_mandatory.nil? && !attributes.key?(:'isMandatory') && !attributes.key?(:'is_mandatory') # rubocop:disable Style/StringLiterals

      self.hint_message = attributes[:'hintMessage'] if attributes[:'hintMessage']

      raise 'You cannot provide both :hintMessage and :hint_message' if attributes.key?(:'hintMessage') && attributes.key?(:'hint_message')

      self.hint_message = attributes[:'hint_message'] if attributes[:'hint_message']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] data_type Object to be assigned
    def data_type=(data_type)
      # rubocop:disable Style/ConditionalAssignment
      if data_type && !DATA_TYPE_ENUM.include?(data_type)
        OCI.logger.debug("Unknown value for 'data_type' [" + data_type + "]. Mapping to 'DATA_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @data_type = DATA_TYPE_UNKNOWN_ENUM_VALUE
      else
        @data_type = data_type
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
        default_value == other.default_value &&
        description == other.description &&
        data_type == other.data_type &&
        is_mandatory == other.is_mandatory &&
        hint_message == other.hint_message
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
      [name, default_value, description, data_type, is_mandatory, hint_message].hash
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
