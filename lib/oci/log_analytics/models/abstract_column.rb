# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Generic column defining all attributes common to all querylanguage columns.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class LogAnalytics::Models::AbstractColumn
    TYPE_ENUM = [
      TYPE_COLUMN = 'COLUMN'.freeze,
      TYPE_CHART_COLUMN = 'CHART_COLUMN'.freeze,
      TYPE_CHART_DATA_COLUMN = 'CHART_DATA_COLUMN'.freeze,
      TYPE_TIME_COLUMN = 'TIME_COLUMN'.freeze,
      TYPE_TREND_COLUMN = 'TREND_COLUMN'.freeze,
      TYPE_CLASSIFY_COLUMN = 'CLASSIFY_COLUMN'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SUB_SYSTEM_ENUM = [
      SUB_SYSTEM_LOG = 'LOG'.freeze,
      SUB_SYSTEM_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VALUE_TYPE_ENUM = [
      VALUE_TYPE_BOOLEAN = 'BOOLEAN'.freeze,
      VALUE_TYPE_STRING = 'STRING'.freeze,
      VALUE_TYPE_DOUBLE = 'DOUBLE'.freeze,
      VALUE_TYPE_FLOAT = 'FLOAT'.freeze,
      VALUE_TYPE_LONG = 'LONG'.freeze,
      VALUE_TYPE_INTEGER = 'INTEGER'.freeze,
      VALUE_TYPE_TIMESTAMP = 'TIMESTAMP'.freeze,
      VALUE_TYPE_FACET = 'FACET'.freeze,
      VALUE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Column classification when column requires special designation.
    #
    # @return [String]
    attr_reader :type

    # Column display name - will be alias if column is renamed by queryStrng.
    #
    # @return [String]
    attr_accessor :display_name

    # Subsystem column belongs to.
    #
    # @return [String]
    attr_reader :sub_system

    # If the column is a 'List of Values' column, this array contains the field values that are applicable to query results or all if no filters applied.
    #
    # @return [Array<OCI::LogAnalytics::Models::FieldValue>]
    attr_accessor :values

    # Identifies if all values in this column come from a pre-defined list of values.
    #
    # @return [BOOLEAN]
    attr_accessor :is_list_of_values

    # Identifies if this column allows multiple values to exist in a single row.
    #
    # @return [BOOLEAN]
    attr_accessor :is_multi_valued

    # Identifies if this column can be used as a grouping field in any grouping command.
    #
    # @return [BOOLEAN]
    attr_accessor :is_groupable

    # Identifies if this column can be used as an expression parameter in any command that accepts querylanguage expressions.
    #
    # @return [BOOLEAN]
    attr_accessor :is_evaluable

    # Field denoting column data type.
    #
    # @return [String]
    attr_reader :value_type

    # Same as displayName unless column renamed in which case this will hold the original display name for the column.
    #
    # @return [String]
    attr_accessor :original_display_name

    # Internal identifier for the column.
    #
    # @return [String]
    attr_accessor :internal_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'display_name': :'displayName',
        'sub_system': :'subSystem',
        'values': :'values',
        'is_list_of_values': :'isListOfValues',
        'is_multi_valued': :'isMultiValued',
        'is_groupable': :'isGroupable',
        'is_evaluable': :'isEvaluable',
        'value_type': :'valueType',
        'original_display_name': :'originalDisplayName',
        'internal_name': :'internalName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'display_name': :'String',
        'sub_system': :'String',
        'values': :'Array<OCI::LogAnalytics::Models::FieldValue>',
        'is_list_of_values': :'BOOLEAN',
        'is_multi_valued': :'BOOLEAN',
        'is_groupable': :'BOOLEAN',
        'is_evaluable': :'BOOLEAN',
        'value_type': :'String',
        'original_display_name': :'String',
        'internal_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::LogAnalytics::Models::TimeColumn' if type == 'TIME_COLUMN'
      return 'OCI::LogAnalytics::Models::ClassifyColumn' if type == 'CLASSIFY_COLUMN'
      return 'OCI::LogAnalytics::Models::TrendColumn' if type == 'TREND_COLUMN'
      return 'OCI::LogAnalytics::Models::Column' if type == 'COLUMN'
      return 'OCI::LogAnalytics::Models::ChartColumn' if type == 'CHART_COLUMN'
      return 'OCI::LogAnalytics::Models::ChartDataColumn' if type == 'CHART_DATA_COLUMN'

      # TODO: Log a warning when the subtype is not found.
      'OCI::LogAnalytics::Models::AbstractColumn'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :sub_system The value to assign to the {#sub_system} property
    # @option attributes [Array<OCI::LogAnalytics::Models::FieldValue>] :values The value to assign to the {#values} property
    # @option attributes [BOOLEAN] :is_list_of_values The value to assign to the {#is_list_of_values} property
    # @option attributes [BOOLEAN] :is_multi_valued The value to assign to the {#is_multi_valued} property
    # @option attributes [BOOLEAN] :is_groupable The value to assign to the {#is_groupable} property
    # @option attributes [BOOLEAN] :is_evaluable The value to assign to the {#is_evaluable} property
    # @option attributes [String] :value_type The value to assign to the {#value_type} property
    # @option attributes [String] :original_display_name The value to assign to the {#original_display_name} property
    # @option attributes [String] :internal_name The value to assign to the {#internal_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.sub_system = attributes[:'subSystem'] if attributes[:'subSystem']

      raise 'You cannot provide both :subSystem and :sub_system' if attributes.key?(:'subSystem') && attributes.key?(:'sub_system')

      self.sub_system = attributes[:'sub_system'] if attributes[:'sub_system']

      self.values = attributes[:'values'] if attributes[:'values']

      self.is_list_of_values = attributes[:'isListOfValues'] unless attributes[:'isListOfValues'].nil?

      raise 'You cannot provide both :isListOfValues and :is_list_of_values' if attributes.key?(:'isListOfValues') && attributes.key?(:'is_list_of_values')

      self.is_list_of_values = attributes[:'is_list_of_values'] unless attributes[:'is_list_of_values'].nil?

      self.is_multi_valued = attributes[:'isMultiValued'] unless attributes[:'isMultiValued'].nil?

      raise 'You cannot provide both :isMultiValued and :is_multi_valued' if attributes.key?(:'isMultiValued') && attributes.key?(:'is_multi_valued')

      self.is_multi_valued = attributes[:'is_multi_valued'] unless attributes[:'is_multi_valued'].nil?

      self.is_groupable = attributes[:'isGroupable'] unless attributes[:'isGroupable'].nil?

      raise 'You cannot provide both :isGroupable and :is_groupable' if attributes.key?(:'isGroupable') && attributes.key?(:'is_groupable')

      self.is_groupable = attributes[:'is_groupable'] unless attributes[:'is_groupable'].nil?

      self.is_evaluable = attributes[:'isEvaluable'] unless attributes[:'isEvaluable'].nil?

      raise 'You cannot provide both :isEvaluable and :is_evaluable' if attributes.key?(:'isEvaluable') && attributes.key?(:'is_evaluable')

      self.is_evaluable = attributes[:'is_evaluable'] unless attributes[:'is_evaluable'].nil?

      self.value_type = attributes[:'valueType'] if attributes[:'valueType']

      raise 'You cannot provide both :valueType and :value_type' if attributes.key?(:'valueType') && attributes.key?(:'value_type')

      self.value_type = attributes[:'value_type'] if attributes[:'value_type']

      self.original_display_name = attributes[:'originalDisplayName'] if attributes[:'originalDisplayName']

      raise 'You cannot provide both :originalDisplayName and :original_display_name' if attributes.key?(:'originalDisplayName') && attributes.key?(:'original_display_name')

      self.original_display_name = attributes[:'original_display_name'] if attributes[:'original_display_name']

      self.internal_name = attributes[:'internalName'] if attributes[:'internalName']

      raise 'You cannot provide both :internalName and :internal_name' if attributes.key?(:'internalName') && attributes.key?(:'internal_name')

      self.internal_name = attributes[:'internal_name'] if attributes[:'internal_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sub_system Object to be assigned
    def sub_system=(sub_system)
      # rubocop:disable Style/ConditionalAssignment
      if sub_system && !SUB_SYSTEM_ENUM.include?(sub_system)
        OCI.logger.debug("Unknown value for 'sub_system' [" + sub_system + "]. Mapping to 'SUB_SYSTEM_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @sub_system = SUB_SYSTEM_UNKNOWN_ENUM_VALUE
      else
        @sub_system = sub_system
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] value_type Object to be assigned
    def value_type=(value_type)
      # rubocop:disable Style/ConditionalAssignment
      if value_type && !VALUE_TYPE_ENUM.include?(value_type)
        OCI.logger.debug("Unknown value for 'value_type' [" + value_type + "]. Mapping to 'VALUE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @value_type = VALUE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @value_type = value_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        display_name == other.display_name &&
        sub_system == other.sub_system &&
        values == other.values &&
        is_list_of_values == other.is_list_of_values &&
        is_multi_valued == other.is_multi_valued &&
        is_groupable == other.is_groupable &&
        is_evaluable == other.is_evaluable &&
        value_type == other.value_type &&
        original_display_name == other.original_display_name &&
        internal_name == other.internal_name
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
      [type, display_name, sub_system, values, is_list_of_values, is_multi_valued, is_groupable, is_evaluable, value_type, original_display_name, internal_name].hash
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
