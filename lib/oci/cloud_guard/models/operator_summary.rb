# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of Operator
  class CloudGuard::Models::OperatorSummary
    FILTER_TYPE_ENUM = [
      FILTER_TYPE_CONDITION = 'CONDITION'.freeze,
      FILTER_TYPE_CONFIG = 'CONFIG'.freeze,
      FILTER_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** name of the operand
    # @return [String]
    attr_accessor :name

    # **[Required]** display name of the operand
    # @return [String]
    attr_accessor :display_name

    # **[Required]** data type of operand
    # @return [String]
    attr_accessor :datatype

    # **[Required]** operand list type
    # @return [String]
    attr_accessor :managed_listtype

    # **[Required]** Filter type can be config filter or condition filter
    # @return [String]
    attr_reader :filter_type

    # **[Required]** List of parameters
    # @return [Array<OCI::CloudGuard::Models::ConditionOperator>]
    attr_accessor :operators

    # configuration value type list for multilist data type
    # @return [Array<String>]
    attr_accessor :multi_list_types

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'display_name': :'displayName',
        'datatype': :'datatype',
        'managed_listtype': :'managedListtype',
        'filter_type': :'filterType',
        'operators': :'operators',
        'multi_list_types': :'multiListTypes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_name': :'String',
        'datatype': :'String',
        'managed_listtype': :'String',
        'filter_type': :'String',
        'operators': :'Array<OCI::CloudGuard::Models::ConditionOperator>',
        'multi_list_types': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :datatype The value to assign to the {#datatype} property
    # @option attributes [String] :managed_listtype The value to assign to the {#managed_listtype} property
    # @option attributes [String] :filter_type The value to assign to the {#filter_type} property
    # @option attributes [Array<OCI::CloudGuard::Models::ConditionOperator>] :operators The value to assign to the {#operators} property
    # @option attributes [Array<String>] :multi_list_types The value to assign to the {#multi_list_types} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.datatype = attributes[:'datatype'] if attributes[:'datatype']

      self.managed_listtype = attributes[:'managedListtype'] if attributes[:'managedListtype']

      raise 'You cannot provide both :managedListtype and :managed_listtype' if attributes.key?(:'managedListtype') && attributes.key?(:'managed_listtype')

      self.managed_listtype = attributes[:'managed_listtype'] if attributes[:'managed_listtype']

      self.filter_type = attributes[:'filterType'] if attributes[:'filterType']

      raise 'You cannot provide both :filterType and :filter_type' if attributes.key?(:'filterType') && attributes.key?(:'filter_type')

      self.filter_type = attributes[:'filter_type'] if attributes[:'filter_type']

      self.operators = attributes[:'operators'] if attributes[:'operators']

      self.multi_list_types = attributes[:'multiListTypes'] if attributes[:'multiListTypes']

      raise 'You cannot provide both :multiListTypes and :multi_list_types' if attributes.key?(:'multiListTypes') && attributes.key?(:'multi_list_types')

      self.multi_list_types = attributes[:'multi_list_types'] if attributes[:'multi_list_types']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] filter_type Object to be assigned
    def filter_type=(filter_type)
      # rubocop:disable Style/ConditionalAssignment
      if filter_type && !FILTER_TYPE_ENUM.include?(filter_type)
        OCI.logger.debug("Unknown value for 'filter_type' [" + filter_type + "]. Mapping to 'FILTER_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @filter_type = FILTER_TYPE_UNKNOWN_ENUM_VALUE
      else
        @filter_type = filter_type
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
        display_name == other.display_name &&
        datatype == other.datatype &&
        managed_listtype == other.managed_listtype &&
        filter_type == other.filter_type &&
        operators == other.operators &&
        multi_list_types == other.multi_list_types
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
      [name, display_name, datatype, managed_listtype, filter_type, operators, multi_list_types].hash
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
