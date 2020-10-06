# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # AbstractParserTestResultLogEntry
  class LogAnalytics::Models::AbstractParserTestResultLogEntry
    # extra info attributes
    # @return [Hash<String, String>]
    attr_accessor :extra_info_attributes

    # field name value map
    # @return [Hash<String, String>]
    attr_accessor :field_name_value_map

    # field position value map
    # @return [Hash<String, String>]
    attr_accessor :field_position_value_map

    # fields
    # @return [Hash<String, String>]
    attr_accessor :fields

    # log entry
    # @return [String]
    attr_accessor :log_entry

    # match status
    # @return [String]
    attr_accessor :match_status

    # match status description
    # @return [String]
    attr_accessor :match_status_description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'extra_info_attributes': :'extraInfoAttributes',
        'field_name_value_map': :'fieldNameValueMap',
        'field_position_value_map': :'fieldPositionValueMap',
        'fields': :'fields',
        'log_entry': :'logEntry',
        'match_status': :'matchStatus',
        'match_status_description': :'matchStatusDescription'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'extra_info_attributes': :'Hash<String, String>',
        'field_name_value_map': :'Hash<String, String>',
        'field_position_value_map': :'Hash<String, String>',
        'fields': :'Hash<String, String>',
        'log_entry': :'String',
        'match_status': :'String',
        'match_status_description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, String>] :extra_info_attributes The value to assign to the {#extra_info_attributes} property
    # @option attributes [Hash<String, String>] :field_name_value_map The value to assign to the {#field_name_value_map} property
    # @option attributes [Hash<String, String>] :field_position_value_map The value to assign to the {#field_position_value_map} property
    # @option attributes [Hash<String, String>] :fields The value to assign to the {#fields} property
    # @option attributes [String] :log_entry The value to assign to the {#log_entry} property
    # @option attributes [String] :match_status The value to assign to the {#match_status} property
    # @option attributes [String] :match_status_description The value to assign to the {#match_status_description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.extra_info_attributes = attributes[:'extraInfoAttributes'] if attributes[:'extraInfoAttributes']

      raise 'You cannot provide both :extraInfoAttributes and :extra_info_attributes' if attributes.key?(:'extraInfoAttributes') && attributes.key?(:'extra_info_attributes')

      self.extra_info_attributes = attributes[:'extra_info_attributes'] if attributes[:'extra_info_attributes']

      self.field_name_value_map = attributes[:'fieldNameValueMap'] if attributes[:'fieldNameValueMap']

      raise 'You cannot provide both :fieldNameValueMap and :field_name_value_map' if attributes.key?(:'fieldNameValueMap') && attributes.key?(:'field_name_value_map')

      self.field_name_value_map = attributes[:'field_name_value_map'] if attributes[:'field_name_value_map']

      self.field_position_value_map = attributes[:'fieldPositionValueMap'] if attributes[:'fieldPositionValueMap']

      raise 'You cannot provide both :fieldPositionValueMap and :field_position_value_map' if attributes.key?(:'fieldPositionValueMap') && attributes.key?(:'field_position_value_map')

      self.field_position_value_map = attributes[:'field_position_value_map'] if attributes[:'field_position_value_map']

      self.fields = attributes[:'fields'] if attributes[:'fields']

      self.log_entry = attributes[:'logEntry'] if attributes[:'logEntry']

      raise 'You cannot provide both :logEntry and :log_entry' if attributes.key?(:'logEntry') && attributes.key?(:'log_entry')

      self.log_entry = attributes[:'log_entry'] if attributes[:'log_entry']

      self.match_status = attributes[:'matchStatus'] if attributes[:'matchStatus']

      raise 'You cannot provide both :matchStatus and :match_status' if attributes.key?(:'matchStatus') && attributes.key?(:'match_status')

      self.match_status = attributes[:'match_status'] if attributes[:'match_status']

      self.match_status_description = attributes[:'matchStatusDescription'] if attributes[:'matchStatusDescription']

      raise 'You cannot provide both :matchStatusDescription and :match_status_description' if attributes.key?(:'matchStatusDescription') && attributes.key?(:'match_status_description')

      self.match_status_description = attributes[:'match_status_description'] if attributes[:'match_status_description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        extra_info_attributes == other.extra_info_attributes &&
        field_name_value_map == other.field_name_value_map &&
        field_position_value_map == other.field_position_value_map &&
        fields == other.fields &&
        log_entry == other.log_entry &&
        match_status == other.match_status &&
        match_status_description == other.match_status_description
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
      [extra_info_attributes, field_name_value_map, field_position_value_map, fields, log_entry, match_status, match_status_description].hash
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
