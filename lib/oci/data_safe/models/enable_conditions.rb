# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the audit policy provisioning conditions.
  class DataSafe::Models::EnableConditions
    ENTITY_SELECTION_ENUM = [
      ENTITY_SELECTION_INCLUDE = 'INCLUDE'.freeze,
      ENTITY_SELECTION_EXCLUDE = 'EXCLUDE'.freeze,
      ENTITY_SELECTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ENTITY_TYPE_ENUM = [
      ENTITY_TYPE_USER = 'USER'.freeze,
      ENTITY_TYPE_ROLE = 'ROLE'.freeze,
      ENTITY_TYPE_ALL_USERS = 'ALL_USERS'.freeze,
      ENTITY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_STATUS_ENUM = [
      OPERATION_STATUS_SUCCESS = 'SUCCESS'.freeze,
      OPERATION_STATUS_FAILURE = 'FAILURE'.freeze,
      OPERATION_STATUS_BOTH = 'BOTH'.freeze,
      OPERATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The entity include or exclude selection.
    # @return [String]
    attr_reader :entity_selection

    # **[Required]** The entity type that the policy must be enabled for.
    # @return [String]
    attr_reader :entity_type

    # **[Required]** The operation status that the policy must be enabled for.
    # @return [String]
    attr_reader :operation_status

    # List of users or roles that the policy must be enabled for.
    # @return [Array<String>]
    attr_accessor :entity_names

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_selection': :'entitySelection',
        'entity_type': :'entityType',
        'operation_status': :'operationStatus',
        'entity_names': :'entityNames'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_selection': :'String',
        'entity_type': :'String',
        'operation_status': :'String',
        'entity_names': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :entity_selection The value to assign to the {#entity_selection} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [String] :operation_status The value to assign to the {#operation_status} property
    # @option attributes [Array<String>] :entity_names The value to assign to the {#entity_names} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_selection = attributes[:'entitySelection'] if attributes[:'entitySelection']

      raise 'You cannot provide both :entitySelection and :entity_selection' if attributes.key?(:'entitySelection') && attributes.key?(:'entity_selection')

      self.entity_selection = attributes[:'entity_selection'] if attributes[:'entity_selection']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.operation_status = attributes[:'operationStatus'] if attributes[:'operationStatus']

      raise 'You cannot provide both :operationStatus and :operation_status' if attributes.key?(:'operationStatus') && attributes.key?(:'operation_status')

      self.operation_status = attributes[:'operation_status'] if attributes[:'operation_status']

      self.entity_names = attributes[:'entityNames'] if attributes[:'entityNames']

      raise 'You cannot provide both :entityNames and :entity_names' if attributes.key?(:'entityNames') && attributes.key?(:'entity_names')

      self.entity_names = attributes[:'entity_names'] if attributes[:'entity_names']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_selection Object to be assigned
    def entity_selection=(entity_selection)
      # rubocop:disable Style/ConditionalAssignment
      if entity_selection && !ENTITY_SELECTION_ENUM.include?(entity_selection)
        OCI.logger.debug("Unknown value for 'entity_selection' [" + entity_selection + "]. Mapping to 'ENTITY_SELECTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_selection = ENTITY_SELECTION_UNKNOWN_ENUM_VALUE
      else
        @entity_selection = entity_selection
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_type Object to be assigned
    def entity_type=(entity_type)
      # rubocop:disable Style/ConditionalAssignment
      if entity_type && !ENTITY_TYPE_ENUM.include?(entity_type)
        OCI.logger.debug("Unknown value for 'entity_type' [" + entity_type + "]. Mapping to 'ENTITY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_type = ENTITY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @entity_type = entity_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_status Object to be assigned
    def operation_status=(operation_status)
      # rubocop:disable Style/ConditionalAssignment
      if operation_status && !OPERATION_STATUS_ENUM.include?(operation_status)
        OCI.logger.debug("Unknown value for 'operation_status' [" + operation_status + "]. Mapping to 'OPERATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_status = OPERATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @operation_status = operation_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_selection == other.entity_selection &&
        entity_type == other.entity_type &&
        operation_status == other.operation_status &&
        entity_names == other.entity_names
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
      [entity_selection, entity_type, operation_status, entity_names].hash
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
