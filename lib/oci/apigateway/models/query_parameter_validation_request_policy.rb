# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190501
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Validate the URL query parameters on the incoming API requests on a specific route.
  class Apigateway::Models::QueryParameterValidationRequestPolicy
    VALIDATION_MODE_ENUM = [
      VALIDATION_MODE_ENFORCING = 'ENFORCING'.freeze,
      VALIDATION_MODE_PERMISSIVE = 'PERMISSIVE'.freeze,
      VALIDATION_MODE_DISABLED = 'DISABLED'.freeze,
      VALIDATION_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [Array<OCI::Apigateway::Models::QueryParameterValidationItem>]
    attr_accessor :parameters

    # Validation behavior mode.
    #
    # In `ENFORCING` mode, upon a validation failure, the request will be rejected with a 4xx response
    # and not sent to the backend.
    #
    # In `PERMISSIVE` mode, the result of the validation will be exposed as metrics while the request
    # will follow the normal path.
    #
    # `DISABLED` type turns the validation off.
    #
    # @return [String]
    attr_reader :validation_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parameters': :'parameters',
        'validation_mode': :'validationMode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parameters': :'Array<OCI::Apigateway::Models::QueryParameterValidationItem>',
        'validation_mode': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Apigateway::Models::QueryParameterValidationItem>] :parameters The value to assign to the {#parameters} property
    # @option attributes [String] :validation_mode The value to assign to the {#validation_mode} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parameters = attributes[:'parameters'] if attributes[:'parameters']

      self.validation_mode = attributes[:'validationMode'] if attributes[:'validationMode']
      self.validation_mode = "ENFORCING" if validation_mode.nil? && !attributes.key?(:'validationMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :validationMode and :validation_mode' if attributes.key?(:'validationMode') && attributes.key?(:'validation_mode')

      self.validation_mode = attributes[:'validation_mode'] if attributes[:'validation_mode']
      self.validation_mode = "ENFORCING" if validation_mode.nil? && !attributes.key?(:'validationMode') && !attributes.key?(:'validation_mode') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] validation_mode Object to be assigned
    def validation_mode=(validation_mode)
      # rubocop:disable Style/ConditionalAssignment
      if validation_mode && !VALIDATION_MODE_ENUM.include?(validation_mode)
        OCI.logger.debug("Unknown value for 'validation_mode' [" + validation_mode + "]. Mapping to 'VALIDATION_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @validation_mode = VALIDATION_MODE_UNKNOWN_ENUM_VALUE
      else
        @validation_mode = validation_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parameters == other.parameters &&
        validation_mode == other.validation_mode
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
      [parameters, validation_mode].hash
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
