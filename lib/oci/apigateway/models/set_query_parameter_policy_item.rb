# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Set will add a new query parameter if it was not in the original request.  If the parameter already exists on the
  # request, you can choose to override, append, or skip it.
  #
  class Apigateway::Models::SetQueryParameterPolicyItem
    IF_EXISTS_ENUM = [
      IF_EXISTS_OVERWRITE = 'OVERWRITE'.freeze,
      IF_EXISTS_APPEND = 'APPEND'.freeze,
      IF_EXISTS_SKIP = 'SKIP'.freeze,
      IF_EXISTS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The case-sensitive name of the query parameter.  This name must be unique across transformation policies.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** A list of new values.  Each value can be a constant or may include one or more expressions enclosed within
    # ${} delimiters.
    #
    # @return [Array<String>]
    attr_accessor :values

    # If a query parameter with the same name already exists in the request, OVERWRITE will overwrite the value,
    # APPEND will append to the existing value, or SKIP will keep the existing value.
    #
    # @return [String]
    attr_reader :if_exists

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'values': :'values',
        'if_exists': :'ifExists'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'values': :'Array<String>',
        'if_exists': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Array<String>] :values The value to assign to the {#values} property
    # @option attributes [String] :if_exists The value to assign to the {#if_exists} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.values = attributes[:'values'] if attributes[:'values']

      self.if_exists = attributes[:'ifExists'] if attributes[:'ifExists']
      self.if_exists = "OVERWRITE" if if_exists.nil? && !attributes.key?(:'ifExists') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :ifExists and :if_exists' if attributes.key?(:'ifExists') && attributes.key?(:'if_exists')

      self.if_exists = attributes[:'if_exists'] if attributes[:'if_exists']
      self.if_exists = "OVERWRITE" if if_exists.nil? && !attributes.key?(:'ifExists') && !attributes.key?(:'if_exists') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] if_exists Object to be assigned
    def if_exists=(if_exists)
      # rubocop:disable Style/ConditionalAssignment
      if if_exists && !IF_EXISTS_ENUM.include?(if_exists)
        OCI.logger.debug("Unknown value for 'if_exists' [" + if_exists + "]. Mapping to 'IF_EXISTS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @if_exists = IF_EXISTS_UNKNOWN_ENUM_VALUE
      else
        @if_exists = if_exists
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
        values == other.values &&
        if_exists == other.if_exists
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
      [name, values, if_exists].hash
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
