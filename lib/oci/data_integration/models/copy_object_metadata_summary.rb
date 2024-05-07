# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200430
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of copied objects.
  class DataIntegration::Models::CopyObjectMetadataSummary
    RESOLUTION_ACTION_ENUM = [
      RESOLUTION_ACTION_CREATED = 'CREATED'.freeze,
      RESOLUTION_ACTION_RETAINED = 'RETAINED'.freeze,
      RESOLUTION_ACTION_DUPLICATED = 'DUPLICATED'.freeze,
      RESOLUTION_ACTION_REPLACED = 'REPLACED'.freeze,
      RESOLUTION_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Old key of the object from where the object was copied. For example a dataflow key within the project being copied.
    # @return [String]
    attr_accessor :old_key

    # New key of the object to identify the copied object. For example the new dataflow key.
    # @return [String]
    attr_accessor :new_key

    # Name of the object.
    # @return [String]
    attr_accessor :name

    # Object identifier.
    # @return [String]
    attr_accessor :identifier

    # Object type.
    # @return [String]
    attr_accessor :object_type

    # Object version.
    # @return [String]
    attr_accessor :object_version

    # Aggregator key
    # @return [String]
    attr_accessor :aggregator_key

    # Object name path.
    # @return [String]
    attr_accessor :name_path

    # time at which this object was last updated.
    # @return [Integer]
    attr_accessor :time_updated_in_millis

    # Object resolution action.
    # @return [String]
    attr_reader :resolution_action

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'old_key': :'oldKey',
        'new_key': :'newKey',
        'name': :'name',
        'identifier': :'identifier',
        'object_type': :'objectType',
        'object_version': :'objectVersion',
        'aggregator_key': :'aggregatorKey',
        'name_path': :'namePath',
        'time_updated_in_millis': :'timeUpdatedInMillis',
        'resolution_action': :'resolutionAction'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'old_key': :'String',
        'new_key': :'String',
        'name': :'String',
        'identifier': :'String',
        'object_type': :'String',
        'object_version': :'String',
        'aggregator_key': :'String',
        'name_path': :'String',
        'time_updated_in_millis': :'Integer',
        'resolution_action': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :old_key The value to assign to the {#old_key} property
    # @option attributes [String] :new_key The value to assign to the {#new_key} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :identifier The value to assign to the {#identifier} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :object_version The value to assign to the {#object_version} property
    # @option attributes [String] :aggregator_key The value to assign to the {#aggregator_key} property
    # @option attributes [String] :name_path The value to assign to the {#name_path} property
    # @option attributes [Integer] :time_updated_in_millis The value to assign to the {#time_updated_in_millis} property
    # @option attributes [String] :resolution_action The value to assign to the {#resolution_action} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.old_key = attributes[:'oldKey'] if attributes[:'oldKey']

      raise 'You cannot provide both :oldKey and :old_key' if attributes.key?(:'oldKey') && attributes.key?(:'old_key')

      self.old_key = attributes[:'old_key'] if attributes[:'old_key']

      self.new_key = attributes[:'newKey'] if attributes[:'newKey']

      raise 'You cannot provide both :newKey and :new_key' if attributes.key?(:'newKey') && attributes.key?(:'new_key')

      self.new_key = attributes[:'new_key'] if attributes[:'new_key']

      self.name = attributes[:'name'] if attributes[:'name']

      self.identifier = attributes[:'identifier'] if attributes[:'identifier']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.object_version = attributes[:'objectVersion'] if attributes[:'objectVersion']

      raise 'You cannot provide both :objectVersion and :object_version' if attributes.key?(:'objectVersion') && attributes.key?(:'object_version')

      self.object_version = attributes[:'object_version'] if attributes[:'object_version']

      self.aggregator_key = attributes[:'aggregatorKey'] if attributes[:'aggregatorKey']

      raise 'You cannot provide both :aggregatorKey and :aggregator_key' if attributes.key?(:'aggregatorKey') && attributes.key?(:'aggregator_key')

      self.aggregator_key = attributes[:'aggregator_key'] if attributes[:'aggregator_key']

      self.name_path = attributes[:'namePath'] if attributes[:'namePath']

      raise 'You cannot provide both :namePath and :name_path' if attributes.key?(:'namePath') && attributes.key?(:'name_path')

      self.name_path = attributes[:'name_path'] if attributes[:'name_path']

      self.time_updated_in_millis = attributes[:'timeUpdatedInMillis'] if attributes[:'timeUpdatedInMillis']

      raise 'You cannot provide both :timeUpdatedInMillis and :time_updated_in_millis' if attributes.key?(:'timeUpdatedInMillis') && attributes.key?(:'time_updated_in_millis')

      self.time_updated_in_millis = attributes[:'time_updated_in_millis'] if attributes[:'time_updated_in_millis']

      self.resolution_action = attributes[:'resolutionAction'] if attributes[:'resolutionAction']

      raise 'You cannot provide both :resolutionAction and :resolution_action' if attributes.key?(:'resolutionAction') && attributes.key?(:'resolution_action')

      self.resolution_action = attributes[:'resolution_action'] if attributes[:'resolution_action']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resolution_action Object to be assigned
    def resolution_action=(resolution_action)
      # rubocop:disable Style/ConditionalAssignment
      if resolution_action && !RESOLUTION_ACTION_ENUM.include?(resolution_action)
        OCI.logger.debug("Unknown value for 'resolution_action' [" + resolution_action + "]. Mapping to 'RESOLUTION_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resolution_action = RESOLUTION_ACTION_UNKNOWN_ENUM_VALUE
      else
        @resolution_action = resolution_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        old_key == other.old_key &&
        new_key == other.new_key &&
        name == other.name &&
        identifier == other.identifier &&
        object_type == other.object_type &&
        object_version == other.object_version &&
        aggregator_key == other.aggregator_key &&
        name_path == other.name_path &&
        time_updated_in_millis == other.time_updated_in_millis &&
        resolution_action == other.resolution_action
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
      [old_key, new_key, name, identifier, object_type, object_version, aggregator_key, name_path, time_updated_in_millis, resolution_action].hash
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
