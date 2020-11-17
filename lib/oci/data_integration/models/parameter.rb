# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'typed_object'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters are created and assigned values that can be configured for each integration task.
  class DataIntegration::Models::Parameter < DataIntegration::Models::TypedObject
    OUTPUT_AGGREGATION_TYPE_ENUM = [
      OUTPUT_AGGREGATION_TYPE_MIN = 'MIN'.freeze,
      OUTPUT_AGGREGATION_TYPE_MAX = 'MAX'.freeze,
      OUTPUT_AGGREGATION_TYPE_COUNT = 'COUNT'.freeze,
      OUTPUT_AGGREGATION_TYPE_SUM = 'SUM'.freeze,
      OUTPUT_AGGREGATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [OCI::DataIntegration::Models::BaseType]
    attr_accessor :type

    # The default value of the parameter.
    # @return [Object]
    attr_accessor :default_value

    # The default value of the parameter which can be an object in DIS, such as a data entity.
    # @return [Object]
    attr_accessor :root_object_default_value

    # Specifies whether the parameter is input value.
    # @return [BOOLEAN]
    attr_accessor :is_input

    # Specifies whether the parameter is output value.
    # @return [BOOLEAN]
    attr_accessor :is_output

    # The output aggregation type.
    # @return [String]
    attr_reader :output_aggregation_type

    # The type of value the parameter was created for.
    # @return [String]
    attr_accessor :type_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'config_values': :'configValues',
        'object_status': :'objectStatus',
        'name': :'name',
        'description': :'description',
        'type': :'type',
        'default_value': :'defaultValue',
        'root_object_default_value': :'rootObjectDefaultValue',
        'is_input': :'isInput',
        'is_output': :'isOutput',
        'output_aggregation_type': :'outputAggregationType',
        'type_name': :'typeName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataIntegration::Models::ParentReference',
        'config_values': :'OCI::DataIntegration::Models::ConfigValues',
        'object_status': :'Integer',
        'name': :'String',
        'description': :'String',
        'type': :'OCI::DataIntegration::Models::BaseType',
        'default_value': :'Object',
        'root_object_default_value': :'Object',
        'is_input': :'BOOLEAN',
        'is_output': :'BOOLEAN',
        'output_aggregation_type': :'String',
        'type_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {OCI::DataIntegration::Models::TypedObject#key #key} proprety
    # @option attributes [String] :model_version The value to assign to the {OCI::DataIntegration::Models::TypedObject#model_version #model_version} proprety
    # @option attributes [OCI::DataIntegration::Models::ParentReference] :parent_ref The value to assign to the {OCI::DataIntegration::Models::TypedObject#parent_ref #parent_ref} proprety
    # @option attributes [OCI::DataIntegration::Models::ConfigValues] :config_values The value to assign to the {OCI::DataIntegration::Models::TypedObject#config_values #config_values} proprety
    # @option attributes [Integer] :object_status The value to assign to the {OCI::DataIntegration::Models::TypedObject#object_status #object_status} proprety
    # @option attributes [String] :name The value to assign to the {OCI::DataIntegration::Models::TypedObject#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataIntegration::Models::TypedObject#description #description} proprety
    # @option attributes [OCI::DataIntegration::Models::BaseType] :type The value to assign to the {#type} property
    # @option attributes [Object] :default_value The value to assign to the {#default_value} property
    # @option attributes [Object] :root_object_default_value The value to assign to the {#root_object_default_value} property
    # @option attributes [BOOLEAN] :is_input The value to assign to the {#is_input} property
    # @option attributes [BOOLEAN] :is_output The value to assign to the {#is_output} property
    # @option attributes [String] :output_aggregation_type The value to assign to the {#output_aggregation_type} property
    # @option attributes [String] :type_name The value to assign to the {#type_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'PARAMETER'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.default_value = attributes[:'defaultValue'] if attributes[:'defaultValue']

      raise 'You cannot provide both :defaultValue and :default_value' if attributes.key?(:'defaultValue') && attributes.key?(:'default_value')

      self.default_value = attributes[:'default_value'] if attributes[:'default_value']

      self.root_object_default_value = attributes[:'rootObjectDefaultValue'] if attributes[:'rootObjectDefaultValue']

      raise 'You cannot provide both :rootObjectDefaultValue and :root_object_default_value' if attributes.key?(:'rootObjectDefaultValue') && attributes.key?(:'root_object_default_value')

      self.root_object_default_value = attributes[:'root_object_default_value'] if attributes[:'root_object_default_value']

      self.is_input = attributes[:'isInput'] unless attributes[:'isInput'].nil?

      raise 'You cannot provide both :isInput and :is_input' if attributes.key?(:'isInput') && attributes.key?(:'is_input')

      self.is_input = attributes[:'is_input'] unless attributes[:'is_input'].nil?

      self.is_output = attributes[:'isOutput'] unless attributes[:'isOutput'].nil?

      raise 'You cannot provide both :isOutput and :is_output' if attributes.key?(:'isOutput') && attributes.key?(:'is_output')

      self.is_output = attributes[:'is_output'] unless attributes[:'is_output'].nil?

      self.output_aggregation_type = attributes[:'outputAggregationType'] if attributes[:'outputAggregationType']

      raise 'You cannot provide both :outputAggregationType and :output_aggregation_type' if attributes.key?(:'outputAggregationType') && attributes.key?(:'output_aggregation_type')

      self.output_aggregation_type = attributes[:'output_aggregation_type'] if attributes[:'output_aggregation_type']

      self.type_name = attributes[:'typeName'] if attributes[:'typeName']

      raise 'You cannot provide both :typeName and :type_name' if attributes.key?(:'typeName') && attributes.key?(:'type_name')

      self.type_name = attributes[:'type_name'] if attributes[:'type_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] output_aggregation_type Object to be assigned
    def output_aggregation_type=(output_aggregation_type)
      # rubocop:disable Style/ConditionalAssignment
      if output_aggregation_type && !OUTPUT_AGGREGATION_TYPE_ENUM.include?(output_aggregation_type)
        OCI.logger.debug("Unknown value for 'output_aggregation_type' [" + output_aggregation_type + "]. Mapping to 'OUTPUT_AGGREGATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @output_aggregation_type = OUTPUT_AGGREGATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @output_aggregation_type = output_aggregation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        config_values == other.config_values &&
        object_status == other.object_status &&
        name == other.name &&
        description == other.description &&
        type == other.type &&
        default_value == other.default_value &&
        root_object_default_value == other.root_object_default_value &&
        is_input == other.is_input &&
        is_output == other.is_output &&
        output_aggregation_type == other.output_aggregation_type &&
        type_name == other.type_name
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
      [model_type, key, model_version, parent_ref, config_values, object_status, name, description, type, default_value, root_object_default_value, is_input, is_output, output_aggregation_type, type_name].hash
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