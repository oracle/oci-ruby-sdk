# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the OCI Function.
  class DataIntegration::Models::OciFunction
    # Ocid of the OCI Function.
    # @return [String]
    attr_accessor :function_id

    # Region where the OCI Function is deployed.
    # @return [String]
    attr_accessor :region_id

    # @return [OCI::DataIntegration::Models::ConfigDefinition]
    attr_accessor :fn_config_definition

    # @return [OCI::DataIntegration::Models::Shape]
    attr_accessor :input_shape

    # @return [OCI::DataIntegration::Models::Shape]
    attr_accessor :output_shape

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'function_id': :'functionId',
        'region_id': :'regionId',
        'fn_config_definition': :'fnConfigDefinition',
        'input_shape': :'inputShape',
        'output_shape': :'outputShape'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'function_id': :'String',
        'region_id': :'String',
        'fn_config_definition': :'OCI::DataIntegration::Models::ConfigDefinition',
        'input_shape': :'OCI::DataIntegration::Models::Shape',
        'output_shape': :'OCI::DataIntegration::Models::Shape'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :function_id The value to assign to the {#function_id} property
    # @option attributes [String] :region_id The value to assign to the {#region_id} property
    # @option attributes [OCI::DataIntegration::Models::ConfigDefinition] :fn_config_definition The value to assign to the {#fn_config_definition} property
    # @option attributes [OCI::DataIntegration::Models::Shape] :input_shape The value to assign to the {#input_shape} property
    # @option attributes [OCI::DataIntegration::Models::Shape] :output_shape The value to assign to the {#output_shape} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.function_id = attributes[:'functionId'] if attributes[:'functionId']

      raise 'You cannot provide both :functionId and :function_id' if attributes.key?(:'functionId') && attributes.key?(:'function_id')

      self.function_id = attributes[:'function_id'] if attributes[:'function_id']

      self.region_id = attributes[:'regionId'] if attributes[:'regionId']

      raise 'You cannot provide both :regionId and :region_id' if attributes.key?(:'regionId') && attributes.key?(:'region_id')

      self.region_id = attributes[:'region_id'] if attributes[:'region_id']

      self.fn_config_definition = attributes[:'fnConfigDefinition'] if attributes[:'fnConfigDefinition']

      raise 'You cannot provide both :fnConfigDefinition and :fn_config_definition' if attributes.key?(:'fnConfigDefinition') && attributes.key?(:'fn_config_definition')

      self.fn_config_definition = attributes[:'fn_config_definition'] if attributes[:'fn_config_definition']

      self.input_shape = attributes[:'inputShape'] if attributes[:'inputShape']

      raise 'You cannot provide both :inputShape and :input_shape' if attributes.key?(:'inputShape') && attributes.key?(:'input_shape')

      self.input_shape = attributes[:'input_shape'] if attributes[:'input_shape']

      self.output_shape = attributes[:'outputShape'] if attributes[:'outputShape']

      raise 'You cannot provide both :outputShape and :output_shape' if attributes.key?(:'outputShape') && attributes.key?(:'output_shape')

      self.output_shape = attributes[:'output_shape'] if attributes[:'output_shape']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        function_id == other.function_id &&
        region_id == other.region_id &&
        fn_config_definition == other.fn_config_definition &&
        input_shape == other.input_shape &&
        output_shape == other.output_shape
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
      [function_id, region_id, fn_config_definition, input_shape, output_shape].hash
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
