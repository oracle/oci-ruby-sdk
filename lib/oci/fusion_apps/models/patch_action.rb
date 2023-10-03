# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20211201
require 'date'
require 'logger'
require_relative 'action'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Monthly patch details.
  class FusionApps::Models::PatchAction < FusionApps::Models::Action
    MODE_ENUM = [
      MODE_HOT = 'HOT'.freeze,
      MODE_COLD = 'COLD'.freeze,
      MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CATEGORY_ENUM = [
      CATEGORY_MONTHLY = 'MONTHLY'.freeze,
      CATEGORY_WEEKLY = 'WEEKLY'.freeze,
      CATEGORY_ONEOFF = 'ONEOFF'.freeze,
      CATEGORY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # A string that describeds whether the change is applied hot or cold
    # @return [String]
    attr_reader :mode

    # patch artifact category
    # @return [String]
    attr_reader :category

    # patch bundle name
    # @return [String]
    attr_accessor :artifact

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'reference_key': :'referenceKey',
        'action_type': :'actionType',
        'state': :'state',
        'description': :'description',
        'mode': :'mode',
        'category': :'category',
        'artifact': :'artifact'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'reference_key': :'String',
        'action_type': :'String',
        'state': :'String',
        'description': :'String',
        'mode': :'String',
        'category': :'String',
        'artifact': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :reference_key The value to assign to the {OCI::FusionApps::Models::Action#reference_key #reference_key} proprety
    # @option attributes [String] :state The value to assign to the {OCI::FusionApps::Models::Action#state #state} proprety
    # @option attributes [String] :description The value to assign to the {OCI::FusionApps::Models::Action#description #description} proprety
    # @option attributes [String] :mode The value to assign to the {#mode} property
    # @option attributes [String] :category The value to assign to the {#category} property
    # @option attributes [String] :artifact The value to assign to the {#artifact} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['actionType'] = 'PATCH'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.mode = attributes[:'mode'] if attributes[:'mode']

      self.category = attributes[:'category'] if attributes[:'category']

      self.artifact = attributes[:'artifact'] if attributes[:'artifact']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] mode Object to be assigned
    def mode=(mode)
      # rubocop:disable Style/ConditionalAssignment
      if mode && !MODE_ENUM.include?(mode)
        OCI.logger.debug("Unknown value for 'mode' [" + mode + "]. Mapping to 'MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @mode = MODE_UNKNOWN_ENUM_VALUE
      else
        @mode = mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] category Object to be assigned
    def category=(category)
      # rubocop:disable Style/ConditionalAssignment
      if category && !CATEGORY_ENUM.include?(category)
        OCI.logger.debug("Unknown value for 'category' [" + category + "]. Mapping to 'CATEGORY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @category = CATEGORY_UNKNOWN_ENUM_VALUE
      else
        @category = category
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        reference_key == other.reference_key &&
        action_type == other.action_type &&
        state == other.state &&
        description == other.description &&
        mode == other.mode &&
        category == other.category &&
        artifact == other.artifact
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
      [reference_key, action_type, state, description, mode, category, artifact].hash
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
