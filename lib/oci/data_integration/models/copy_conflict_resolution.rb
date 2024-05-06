# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200430
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Copy Object Conflict resolution.
  class DataIntegration::Models::CopyConflictResolution
    REQUEST_TYPE_ENUM = [
      REQUEST_TYPE_RETAIN = 'RETAIN'.freeze,
      REQUEST_TYPE_DUPLICATE = 'DUPLICATE'.freeze,
      REQUEST_TYPE_REPLACE = 'REPLACE'.freeze,
      REQUEST_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # In case of DUPLICATE mode, this prefix will be used to disambiguate the object.
    # @return [String]
    attr_accessor :duplicate_prefix

    # In case of DUPLICATE mode, this suffix will be used to disambiguate the object.
    # @return [String]
    attr_accessor :duplicate_suffix

    # **[Required]** Copy Object Conflict Resolution Type (RETAIN/DUPLICATE/REPLACE).
    # @return [String]
    attr_reader :request_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'duplicate_prefix': :'duplicatePrefix',
        'duplicate_suffix': :'duplicateSuffix',
        'request_type': :'requestType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'duplicate_prefix': :'String',
        'duplicate_suffix': :'String',
        'request_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :duplicate_prefix The value to assign to the {#duplicate_prefix} property
    # @option attributes [String] :duplicate_suffix The value to assign to the {#duplicate_suffix} property
    # @option attributes [String] :request_type The value to assign to the {#request_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.duplicate_prefix = attributes[:'duplicatePrefix'] if attributes[:'duplicatePrefix']
      self.duplicate_prefix = "" if duplicate_prefix.nil? && !attributes.key?(:'duplicatePrefix') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :duplicatePrefix and :duplicate_prefix' if attributes.key?(:'duplicatePrefix') && attributes.key?(:'duplicate_prefix')

      self.duplicate_prefix = attributes[:'duplicate_prefix'] if attributes[:'duplicate_prefix']
      self.duplicate_prefix = "" if duplicate_prefix.nil? && !attributes.key?(:'duplicatePrefix') && !attributes.key?(:'duplicate_prefix') # rubocop:disable Style/StringLiterals

      self.duplicate_suffix = attributes[:'duplicateSuffix'] if attributes[:'duplicateSuffix']
      self.duplicate_suffix = "" if duplicate_suffix.nil? && !attributes.key?(:'duplicateSuffix') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :duplicateSuffix and :duplicate_suffix' if attributes.key?(:'duplicateSuffix') && attributes.key?(:'duplicate_suffix')

      self.duplicate_suffix = attributes[:'duplicate_suffix'] if attributes[:'duplicate_suffix']
      self.duplicate_suffix = "" if duplicate_suffix.nil? && !attributes.key?(:'duplicateSuffix') && !attributes.key?(:'duplicate_suffix') # rubocop:disable Style/StringLiterals

      self.request_type = attributes[:'requestType'] if attributes[:'requestType']
      self.request_type = "RETAIN" if request_type.nil? && !attributes.key?(:'requestType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :requestType and :request_type' if attributes.key?(:'requestType') && attributes.key?(:'request_type')

      self.request_type = attributes[:'request_type'] if attributes[:'request_type']
      self.request_type = "RETAIN" if request_type.nil? && !attributes.key?(:'requestType') && !attributes.key?(:'request_type') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] request_type Object to be assigned
    def request_type=(request_type)
      # rubocop:disable Style/ConditionalAssignment
      if request_type && !REQUEST_TYPE_ENUM.include?(request_type)
        OCI.logger.debug("Unknown value for 'request_type' [" + request_type + "]. Mapping to 'REQUEST_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @request_type = REQUEST_TYPE_UNKNOWN_ENUM_VALUE
      else
        @request_type = request_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        duplicate_prefix == other.duplicate_prefix &&
        duplicate_suffix == other.duplicate_suffix &&
        request_type == other.request_type
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
      [duplicate_prefix, duplicate_suffix, request_type].hash
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