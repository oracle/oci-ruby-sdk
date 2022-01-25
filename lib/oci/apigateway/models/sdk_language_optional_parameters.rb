# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # List of additional applicable parameters for any given target language.
  class Apigateway::Models::SdkLanguageOptionalParameters
    INPUT_TYPE_ENUM = [
      INPUT_TYPE_ENUM_VALUE = 'ENUM'.freeze,
      INPUT_TYPE_EMAIL = 'EMAIL'.freeze,
      INPUT_TYPE_URI = 'URI'.freeze,
      INPUT_TYPE_STRING = 'STRING'.freeze,
      INPUT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of the parameter.
    #
    # @return [String]
    attr_accessor :param_name

    # Display name of the parameter.
    #
    # @return [String]
    attr_accessor :display_name

    # Description for the parameter.
    #
    # @return [String]
    attr_accessor :description

    # Information on whether the parameter is required or not.
    #
    # @return [BOOLEAN]
    attr_accessor :is_required

    # Maximum size as input value for this parameter.
    #
    # @return [Float]
    attr_accessor :max_size

    # The input type for this param.
    # - Input type is ENUM when only specific list of input strings are allowed.
    # - Input type is EMAIL when input type is an email ID.
    # - Input type is URI when input type is an URI.
    # - Input type is STRING in all other cases.
    #
    # @return [String]
    attr_reader :input_type

    # List of allowed input values.
    # Example: `[{\"name\": \"name1\", \"description\": \"description1\"}, ...]`
    #
    # @return [Array<OCI::Apigateway::Models::SdkLanguageOptionalParametersAllowedValue>]
    attr_accessor :allowed_values

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'param_name': :'paramName',
        'display_name': :'displayName',
        'description': :'description',
        'is_required': :'isRequired',
        'max_size': :'maxSize',
        'input_type': :'inputType',
        'allowed_values': :'allowedValues'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'param_name': :'String',
        'display_name': :'String',
        'description': :'String',
        'is_required': :'BOOLEAN',
        'max_size': :'Float',
        'input_type': :'String',
        'allowed_values': :'Array<OCI::Apigateway::Models::SdkLanguageOptionalParametersAllowedValue>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :param_name The value to assign to the {#param_name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_required The value to assign to the {#is_required} property
    # @option attributes [Float] :max_size The value to assign to the {#max_size} property
    # @option attributes [String] :input_type The value to assign to the {#input_type} property
    # @option attributes [Array<OCI::Apigateway::Models::SdkLanguageOptionalParametersAllowedValue>] :allowed_values The value to assign to the {#allowed_values} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.param_name = attributes[:'paramName'] if attributes[:'paramName']

      raise 'You cannot provide both :paramName and :param_name' if attributes.key?(:'paramName') && attributes.key?(:'param_name')

      self.param_name = attributes[:'param_name'] if attributes[:'param_name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_required = attributes[:'isRequired'] unless attributes[:'isRequired'].nil?
      self.is_required = false if is_required.nil? && !attributes.key?(:'isRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRequired and :is_required' if attributes.key?(:'isRequired') && attributes.key?(:'is_required')

      self.is_required = attributes[:'is_required'] unless attributes[:'is_required'].nil?
      self.is_required = false if is_required.nil? && !attributes.key?(:'isRequired') && !attributes.key?(:'is_required') # rubocop:disable Style/StringLiterals

      self.max_size = attributes[:'maxSize'] if attributes[:'maxSize']

      raise 'You cannot provide both :maxSize and :max_size' if attributes.key?(:'maxSize') && attributes.key?(:'max_size')

      self.max_size = attributes[:'max_size'] if attributes[:'max_size']

      self.input_type = attributes[:'inputType'] if attributes[:'inputType']

      raise 'You cannot provide both :inputType and :input_type' if attributes.key?(:'inputType') && attributes.key?(:'input_type')

      self.input_type = attributes[:'input_type'] if attributes[:'input_type']

      self.allowed_values = attributes[:'allowedValues'] if attributes[:'allowedValues']

      raise 'You cannot provide both :allowedValues and :allowed_values' if attributes.key?(:'allowedValues') && attributes.key?(:'allowed_values')

      self.allowed_values = attributes[:'allowed_values'] if attributes[:'allowed_values']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] input_type Object to be assigned
    def input_type=(input_type)
      # rubocop:disable Style/ConditionalAssignment
      if input_type && !INPUT_TYPE_ENUM.include?(input_type)
        OCI.logger.debug("Unknown value for 'input_type' [" + input_type + "]. Mapping to 'INPUT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @input_type = INPUT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @input_type = input_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        param_name == other.param_name &&
        display_name == other.display_name &&
        description == other.description &&
        is_required == other.is_required &&
        max_size == other.max_size &&
        input_type == other.input_type &&
        allowed_values == other.allowed_values
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
      [param_name, display_name, description, is_required, max_size, input_type, allowed_values].hash
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
