# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Attribute
  class LogAnalytics::Models::Attribute
    MAXIMUM_LEN_ENUM = [
      MAXIMUM_LEN_LENGTH_FIVE = 'LENGTH_FIVE'.freeze,
      MAXIMUM_LEN_LENGTH_SIXTEEN = 'LENGTH_SIXTEEN'.freeze,
      MAXIMUM_LEN_LENGTH_THIRTYTWO = 'LENGTH_THIRTYTWO'.freeze,
      MAXIMUM_LEN_LENGTH_SIXTYFOUR = 'LENGTH_SIXTYFOUR'.freeze,
      MAXIMUM_LEN_LENGTH_ONETWOEIGHT = 'LENGTH_ONETWOEIGHT'.freeze,
      MAXIMUM_LEN_LENGTH_TWOFIFTYSIX = 'LENGTH_TWOFIFTYSIX'.freeze,
      MAXIMUM_LEN_LENGTH_FIVETWELVE = 'LENGTH_FIVETWELVE'.freeze,
      MAXIMUM_LEN_LENGTH_SEVENFIFTY = 'LENGTH_SEVENFIFTY'.freeze,
      MAXIMUM_LEN_LENGTH_ONE_THOUSAND = 'LENGTH_ONE_THOUSAND'.freeze,
      MAXIMUM_LEN_LENGTH_TWO_THOUSAND = 'LENGTH_TWO_THOUSAND'.freeze,
      MAXIMUM_LEN_LENGTH_FOUR_THOUSAND = 'LENGTH_FOUR_THOUSAND'.freeze,
      MAXIMUM_LEN_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    POPULATED_BY_ENUM = [
      POPULATED_BY_BACKEND_GEN = 'BACKEND_GEN'.freeze,
      POPULATED_BY_CALLER_GEN = 'CALLER_GEN'.freeze,
      POPULATED_BY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REQUIRED_IN_JSON_ENUM = [
      REQUIRED_IN_JSON_MANDATORY = 'MANDATORY'.freeze,
      REQUIRED_IN_JSON_OPTIONAL = 'OPTIONAL'.freeze,
      REQUIRED_IN_JSON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    USAGE_SENARIO_ENUM = [
      USAGE_SENARIO_CREATE = 'CREATE'.freeze,
      USAGE_SENARIO_UPDATE = 'UPDATE'.freeze,
      USAGE_SENARIO_CREATE_AND_UPDATE = 'CREATE_AND_UPDATE'.freeze,
      USAGE_SENARIO_DELETE = 'DELETE'.freeze,
      USAGE_SENARIO_RE_CREATE = 'RE_CREATE'.freeze,
      USAGE_SENARIO_DETAIL = 'DETAIL'.freeze,
      USAGE_SENARIO_LIST = 'LIST'.freeze,
      USAGE_SENARIO_FUNCTION_WITH_LOOKUP = 'FUNCTION_WITH_LOOKUP'.freeze,
      USAGE_SENARIO_DB_PATTERN = 'DB_PATTERN'.freeze,
      USAGE_SENARIO_CREATE_FIRSTTIME_T1 = 'CREATE_FIRSTTIME_T1'.freeze,
      USAGE_SENARIO_UPDATE_OOB_METRIC = 'UPDATE_OOB_METRIC'.freeze,
      USAGE_SENARIO_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VALUE_DATA_TYPE_ENUM = [
      VALUE_DATA_TYPE_INTEGER = 'INTEGER'.freeze,
      VALUE_DATA_TYPE_LONG = 'LONG'.freeze,
      VALUE_DATA_TYPE_FLOAT = 'FLOAT'.freeze,
      VALUE_DATA_TYPE_STRING = 'STRING'.freeze,
      VALUE_DATA_TYPE_TIMESTAMP = 'TIMESTAMP'.freeze,
      VALUE_DATA_TYPE_DATE = 'DATE'.freeze,
      VALUE_DATA_TYPE_CLOB = 'CLOB'.freeze,
      VALUE_DATA_TYPE_TAG_REF = 'TAG_REF'.freeze,
      VALUE_DATA_TYPE_PARSER_REF = 'PARSER_REF'.freeze,
      VALUE_DATA_TYPE_STT_REF = 'STT_REF'.freeze,
      VALUE_DATA_TYPE_LOOKUP_REF = 'LOOKUP_REF'.freeze,
      VALUE_DATA_TYPE_META_FUNCTION_REF = 'META_FUNCTION_REF'.freeze,
      VALUE_DATA_TYPE_COMMON_FIELD_REF = 'COMMON_FIELD_REF'.freeze,
      VALUE_DATA_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VALUE_POPULATION_PRIORITY_ENUM = [
      VALUE_POPULATION_PRIORITY_NONE = 'NONE'.freeze,
      VALUE_POPULATION_PRIORITY_LOW = 'LOW'.freeze,
      VALUE_POPULATION_PRIORITY_HIGH = 'HIGH'.freeze,
      VALUE_POPULATION_PRIORITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # default value
    # @return [Object]
    attr_accessor :default_value

    # dynamic value range reference attribute
    # @return [String]
    attr_accessor :dynamic_value_range_ref_attr

    # maximum length
    # @return [String]
    attr_reader :maximum_len

    # name
    # @return [String]
    attr_accessor :name

    # populated by
    # @return [String]
    attr_reader :populated_by

    # required in JSON
    # @return [String]
    attr_reader :required_in_json

    # schema column
    # @return [String]
    attr_accessor :schema_column

    # is string exceed maximum length
    # @return [BOOLEAN]
    attr_accessor :is_string_exceed_maximum_length

    # usage senario
    # @return [String]
    attr_reader :usage_senario

    # value data type
    # @return [String]
    attr_reader :value_data_type

    # value population priority
    # @return [String]
    attr_reader :value_population_priority

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'default_value': :'defaultValue',
        'dynamic_value_range_ref_attr': :'dynamicValueRangeRefAttr',
        'maximum_len': :'maximumLen',
        'name': :'name',
        'populated_by': :'populatedBy',
        'required_in_json': :'requiredInJSON',
        'schema_column': :'schemaColumn',
        'is_string_exceed_maximum_length': :'isStringExceedMaximumLength',
        'usage_senario': :'usageSenario',
        'value_data_type': :'valueDataType',
        'value_population_priority': :'valuePopulationPriority'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'default_value': :'Object',
        'dynamic_value_range_ref_attr': :'String',
        'maximum_len': :'String',
        'name': :'String',
        'populated_by': :'String',
        'required_in_json': :'String',
        'schema_column': :'String',
        'is_string_exceed_maximum_length': :'BOOLEAN',
        'usage_senario': :'String',
        'value_data_type': :'String',
        'value_population_priority': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Object] :default_value The value to assign to the {#default_value} property
    # @option attributes [String] :dynamic_value_range_ref_attr The value to assign to the {#dynamic_value_range_ref_attr} property
    # @option attributes [String] :maximum_len The value to assign to the {#maximum_len} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :populated_by The value to assign to the {#populated_by} property
    # @option attributes [String] :required_in_json The value to assign to the {#required_in_json} property
    # @option attributes [String] :schema_column The value to assign to the {#schema_column} property
    # @option attributes [BOOLEAN] :is_string_exceed_maximum_length The value to assign to the {#is_string_exceed_maximum_length} property
    # @option attributes [String] :usage_senario The value to assign to the {#usage_senario} property
    # @option attributes [String] :value_data_type The value to assign to the {#value_data_type} property
    # @option attributes [String] :value_population_priority The value to assign to the {#value_population_priority} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.default_value = attributes[:'defaultValue'] if attributes[:'defaultValue']

      raise 'You cannot provide both :defaultValue and :default_value' if attributes.key?(:'defaultValue') && attributes.key?(:'default_value')

      self.default_value = attributes[:'default_value'] if attributes[:'default_value']

      self.dynamic_value_range_ref_attr = attributes[:'dynamicValueRangeRefAttr'] if attributes[:'dynamicValueRangeRefAttr']

      raise 'You cannot provide both :dynamicValueRangeRefAttr and :dynamic_value_range_ref_attr' if attributes.key?(:'dynamicValueRangeRefAttr') && attributes.key?(:'dynamic_value_range_ref_attr')

      self.dynamic_value_range_ref_attr = attributes[:'dynamic_value_range_ref_attr'] if attributes[:'dynamic_value_range_ref_attr']

      self.maximum_len = attributes[:'maximumLen'] if attributes[:'maximumLen']

      raise 'You cannot provide both :maximumLen and :maximum_len' if attributes.key?(:'maximumLen') && attributes.key?(:'maximum_len')

      self.maximum_len = attributes[:'maximum_len'] if attributes[:'maximum_len']

      self.name = attributes[:'name'] if attributes[:'name']

      self.populated_by = attributes[:'populatedBy'] if attributes[:'populatedBy']

      raise 'You cannot provide both :populatedBy and :populated_by' if attributes.key?(:'populatedBy') && attributes.key?(:'populated_by')

      self.populated_by = attributes[:'populated_by'] if attributes[:'populated_by']

      self.required_in_json = attributes[:'requiredInJSON'] if attributes[:'requiredInJSON']

      raise 'You cannot provide both :requiredInJSON and :required_in_json' if attributes.key?(:'requiredInJSON') && attributes.key?(:'required_in_json')

      self.required_in_json = attributes[:'required_in_json'] if attributes[:'required_in_json']

      self.schema_column = attributes[:'schemaColumn'] if attributes[:'schemaColumn']

      raise 'You cannot provide both :schemaColumn and :schema_column' if attributes.key?(:'schemaColumn') && attributes.key?(:'schema_column')

      self.schema_column = attributes[:'schema_column'] if attributes[:'schema_column']

      self.is_string_exceed_maximum_length = attributes[:'isStringExceedMaximumLength'] unless attributes[:'isStringExceedMaximumLength'].nil?

      raise 'You cannot provide both :isStringExceedMaximumLength and :is_string_exceed_maximum_length' if attributes.key?(:'isStringExceedMaximumLength') && attributes.key?(:'is_string_exceed_maximum_length')

      self.is_string_exceed_maximum_length = attributes[:'is_string_exceed_maximum_length'] unless attributes[:'is_string_exceed_maximum_length'].nil?

      self.usage_senario = attributes[:'usageSenario'] if attributes[:'usageSenario']

      raise 'You cannot provide both :usageSenario and :usage_senario' if attributes.key?(:'usageSenario') && attributes.key?(:'usage_senario')

      self.usage_senario = attributes[:'usage_senario'] if attributes[:'usage_senario']

      self.value_data_type = attributes[:'valueDataType'] if attributes[:'valueDataType']

      raise 'You cannot provide both :valueDataType and :value_data_type' if attributes.key?(:'valueDataType') && attributes.key?(:'value_data_type')

      self.value_data_type = attributes[:'value_data_type'] if attributes[:'value_data_type']

      self.value_population_priority = attributes[:'valuePopulationPriority'] if attributes[:'valuePopulationPriority']

      raise 'You cannot provide both :valuePopulationPriority and :value_population_priority' if attributes.key?(:'valuePopulationPriority') && attributes.key?(:'value_population_priority')

      self.value_population_priority = attributes[:'value_population_priority'] if attributes[:'value_population_priority']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] maximum_len Object to be assigned
    def maximum_len=(maximum_len)
      # rubocop:disable Style/ConditionalAssignment
      if maximum_len && !MAXIMUM_LEN_ENUM.include?(maximum_len)
        OCI.logger.debug("Unknown value for 'maximum_len' [" + maximum_len + "]. Mapping to 'MAXIMUM_LEN_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @maximum_len = MAXIMUM_LEN_UNKNOWN_ENUM_VALUE
      else
        @maximum_len = maximum_len
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] populated_by Object to be assigned
    def populated_by=(populated_by)
      # rubocop:disable Style/ConditionalAssignment
      if populated_by && !POPULATED_BY_ENUM.include?(populated_by)
        OCI.logger.debug("Unknown value for 'populated_by' [" + populated_by + "]. Mapping to 'POPULATED_BY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @populated_by = POPULATED_BY_UNKNOWN_ENUM_VALUE
      else
        @populated_by = populated_by
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] required_in_json Object to be assigned
    def required_in_json=(required_in_json)
      # rubocop:disable Style/ConditionalAssignment
      if required_in_json && !REQUIRED_IN_JSON_ENUM.include?(required_in_json)
        OCI.logger.debug("Unknown value for 'required_in_json' [" + required_in_json + "]. Mapping to 'REQUIRED_IN_JSON_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @required_in_json = REQUIRED_IN_JSON_UNKNOWN_ENUM_VALUE
      else
        @required_in_json = required_in_json
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] usage_senario Object to be assigned
    def usage_senario=(usage_senario)
      # rubocop:disable Style/ConditionalAssignment
      if usage_senario && !USAGE_SENARIO_ENUM.include?(usage_senario)
        OCI.logger.debug("Unknown value for 'usage_senario' [" + usage_senario + "]. Mapping to 'USAGE_SENARIO_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @usage_senario = USAGE_SENARIO_UNKNOWN_ENUM_VALUE
      else
        @usage_senario = usage_senario
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] value_data_type Object to be assigned
    def value_data_type=(value_data_type)
      # rubocop:disable Style/ConditionalAssignment
      if value_data_type && !VALUE_DATA_TYPE_ENUM.include?(value_data_type)
        OCI.logger.debug("Unknown value for 'value_data_type' [" + value_data_type + "]. Mapping to 'VALUE_DATA_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @value_data_type = VALUE_DATA_TYPE_UNKNOWN_ENUM_VALUE
      else
        @value_data_type = value_data_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] value_population_priority Object to be assigned
    def value_population_priority=(value_population_priority)
      # rubocop:disable Style/ConditionalAssignment
      if value_population_priority && !VALUE_POPULATION_PRIORITY_ENUM.include?(value_population_priority)
        OCI.logger.debug("Unknown value for 'value_population_priority' [" + value_population_priority + "]. Mapping to 'VALUE_POPULATION_PRIORITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @value_population_priority = VALUE_POPULATION_PRIORITY_UNKNOWN_ENUM_VALUE
      else
        @value_population_priority = value_population_priority
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        default_value == other.default_value &&
        dynamic_value_range_ref_attr == other.dynamic_value_range_ref_attr &&
        maximum_len == other.maximum_len &&
        name == other.name &&
        populated_by == other.populated_by &&
        required_in_json == other.required_in_json &&
        schema_column == other.schema_column &&
        is_string_exceed_maximum_length == other.is_string_exceed_maximum_length &&
        usage_senario == other.usage_senario &&
        value_data_type == other.value_data_type &&
        value_population_priority == other.value_population_priority
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
      [default_value, dynamic_value_range_ref_attr, maximum_len, name, populated_by, required_in_json, schema_column, is_string_exceed_maximum_length, usage_senario, value_data_type, value_population_priority].hash
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
