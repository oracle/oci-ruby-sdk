# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'unified_agent_parser'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Syslog Parser.
  class Logging::Models::UnifiedAgentSyslogParser < Logging::Models::UnifiedAgentParser
    MESSAGE_FORMAT_ENUM = [
      MESSAGE_FORMAT_RFC3164 = 'RFC3164'.freeze,
      MESSAGE_FORMAT_RFC5424 = 'RFC5424'.freeze,
      MESSAGE_FORMAT_AUTO = 'AUTO'.freeze,
      MESSAGE_FORMAT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SYSLOG_PARSER_TYPE_ENUM = [
      SYSLOG_PARSER_TYPE_STRING = 'STRING'.freeze,
      SYSLOG_PARSER_TYPE_REGEXP = 'REGEXP'.freeze,
      SYSLOG_PARSER_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [String]
    attr_accessor :time_format

    # @return [String]
    attr_accessor :rfc5424_time_format

    # @return [String]
    attr_reader :message_format

    # @return [BOOLEAN]
    attr_accessor :is_with_priority

    # @return [BOOLEAN]
    attr_accessor :is_support_colonless_ident

    # @return [String]
    attr_reader :syslog_parser_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_type': :'parserType',
        'field_time_key': :'fieldTimeKey',
        'types': :'types',
        'null_value_pattern': :'nullValuePattern',
        'is_null_empty_string': :'isNullEmptyString',
        'is_estimate_current_event': :'isEstimateCurrentEvent',
        'is_keep_time_key': :'isKeepTimeKey',
        'timeout_in_milliseconds': :'timeoutInMilliseconds',
        'time_format': :'timeFormat',
        'rfc5424_time_format': :'rfc5424TimeFormat',
        'message_format': :'messageFormat',
        'is_with_priority': :'isWithPriority',
        'is_support_colonless_ident': :'isSupportColonlessIdent',
        'syslog_parser_type': :'syslogParserType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_type': :'String',
        'field_time_key': :'String',
        'types': :'Hash<String, String>',
        'null_value_pattern': :'String',
        'is_null_empty_string': :'BOOLEAN',
        'is_estimate_current_event': :'BOOLEAN',
        'is_keep_time_key': :'BOOLEAN',
        'timeout_in_milliseconds': :'Integer',
        'time_format': :'String',
        'rfc5424_time_format': :'String',
        'message_format': :'String',
        'is_with_priority': :'BOOLEAN',
        'is_support_colonless_ident': :'BOOLEAN',
        'syslog_parser_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :field_time_key The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#field_time_key #field_time_key} proprety
    # @option attributes [Hash<String, String>] :types The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#types #types} proprety
    # @option attributes [String] :null_value_pattern The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#null_value_pattern #null_value_pattern} proprety
    # @option attributes [BOOLEAN] :is_null_empty_string The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#is_null_empty_string #is_null_empty_string} proprety
    # @option attributes [BOOLEAN] :is_estimate_current_event The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#is_estimate_current_event #is_estimate_current_event} proprety
    # @option attributes [BOOLEAN] :is_keep_time_key The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#is_keep_time_key #is_keep_time_key} proprety
    # @option attributes [Integer] :timeout_in_milliseconds The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#timeout_in_milliseconds #timeout_in_milliseconds} proprety
    # @option attributes [String] :time_format The value to assign to the {#time_format} property
    # @option attributes [String] :rfc5424_time_format The value to assign to the {#rfc5424_time_format} property
    # @option attributes [String] :message_format The value to assign to the {#message_format} property
    # @option attributes [BOOLEAN] :is_with_priority The value to assign to the {#is_with_priority} property
    # @option attributes [BOOLEAN] :is_support_colonless_ident The value to assign to the {#is_support_colonless_ident} property
    # @option attributes [String] :syslog_parser_type The value to assign to the {#syslog_parser_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['parserType'] = 'SYSLOG'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_format = attributes[:'timeFormat'] if attributes[:'timeFormat']

      raise 'You cannot provide both :timeFormat and :time_format' if attributes.key?(:'timeFormat') && attributes.key?(:'time_format')

      self.time_format = attributes[:'time_format'] if attributes[:'time_format']

      self.rfc5424_time_format = attributes[:'rfc5424TimeFormat'] if attributes[:'rfc5424TimeFormat']

      raise 'You cannot provide both :rfc5424TimeFormat and :rfc5424_time_format' if attributes.key?(:'rfc5424TimeFormat') && attributes.key?(:'rfc5424_time_format')

      self.rfc5424_time_format = attributes[:'rfc5424_time_format'] if attributes[:'rfc5424_time_format']

      self.message_format = attributes[:'messageFormat'] if attributes[:'messageFormat']

      raise 'You cannot provide both :messageFormat and :message_format' if attributes.key?(:'messageFormat') && attributes.key?(:'message_format')

      self.message_format = attributes[:'message_format'] if attributes[:'message_format']

      self.is_with_priority = attributes[:'isWithPriority'] unless attributes[:'isWithPriority'].nil?

      raise 'You cannot provide both :isWithPriority and :is_with_priority' if attributes.key?(:'isWithPriority') && attributes.key?(:'is_with_priority')

      self.is_with_priority = attributes[:'is_with_priority'] unless attributes[:'is_with_priority'].nil?

      self.is_support_colonless_ident = attributes[:'isSupportColonlessIdent'] unless attributes[:'isSupportColonlessIdent'].nil?

      raise 'You cannot provide both :isSupportColonlessIdent and :is_support_colonless_ident' if attributes.key?(:'isSupportColonlessIdent') && attributes.key?(:'is_support_colonless_ident')

      self.is_support_colonless_ident = attributes[:'is_support_colonless_ident'] unless attributes[:'is_support_colonless_ident'].nil?

      self.syslog_parser_type = attributes[:'syslogParserType'] if attributes[:'syslogParserType']

      raise 'You cannot provide both :syslogParserType and :syslog_parser_type' if attributes.key?(:'syslogParserType') && attributes.key?(:'syslog_parser_type')

      self.syslog_parser_type = attributes[:'syslog_parser_type'] if attributes[:'syslog_parser_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] message_format Object to be assigned
    def message_format=(message_format)
      # rubocop:disable Style/ConditionalAssignment
      if message_format && !MESSAGE_FORMAT_ENUM.include?(message_format)
        OCI.logger.debug("Unknown value for 'message_format' [" + message_format + "]. Mapping to 'MESSAGE_FORMAT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @message_format = MESSAGE_FORMAT_UNKNOWN_ENUM_VALUE
      else
        @message_format = message_format
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] syslog_parser_type Object to be assigned
    def syslog_parser_type=(syslog_parser_type)
      # rubocop:disable Style/ConditionalAssignment
      if syslog_parser_type && !SYSLOG_PARSER_TYPE_ENUM.include?(syslog_parser_type)
        OCI.logger.debug("Unknown value for 'syslog_parser_type' [" + syslog_parser_type + "]. Mapping to 'SYSLOG_PARSER_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @syslog_parser_type = SYSLOG_PARSER_TYPE_UNKNOWN_ENUM_VALUE
      else
        @syslog_parser_type = syslog_parser_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parser_type == other.parser_type &&
        field_time_key == other.field_time_key &&
        types == other.types &&
        null_value_pattern == other.null_value_pattern &&
        is_null_empty_string == other.is_null_empty_string &&
        is_estimate_current_event == other.is_estimate_current_event &&
        is_keep_time_key == other.is_keep_time_key &&
        timeout_in_milliseconds == other.timeout_in_milliseconds &&
        time_format == other.time_format &&
        rfc5424_time_format == other.rfc5424_time_format &&
        message_format == other.message_format &&
        is_with_priority == other.is_with_priority &&
        is_support_colonless_ident == other.is_support_colonless_ident &&
        syslog_parser_type == other.syslog_parser_type
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
      [parser_type, field_time_key, types, null_value_pattern, is_null_empty_string, is_estimate_current_event, is_keep_time_key, timeout_in_milliseconds, time_format, rfc5424_time_format, message_format, is_with_priority, is_support_colonless_ident, syslog_parser_type].hash
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
