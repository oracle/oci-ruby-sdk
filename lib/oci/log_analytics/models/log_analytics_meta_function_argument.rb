# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsMetaFunctionArgument
  class LogAnalytics::Models::LogAnalyticsMetaFunctionArgument
    # override output fields
    # @return [BOOLEAN]
    attr_accessor :is_override_output_fields

    # argument display name
    # @return [String]
    attr_accessor :argument_display_name

    # argument example
    # @return [String]
    attr_accessor :argument_example

    # argument service
    # @return [String]
    attr_accessor :argument_service

    # argument data type
    # @return [String]
    attr_accessor :argument_data_type

    # argument description
    # @return [String]
    attr_accessor :argument_description

    # argument name
    # @return [String]
    attr_accessor :argument_name

    # argument order
    # @return [Integer]
    attr_accessor :argument_order

    # argument type
    # @return [Integer]
    attr_accessor :argument_type

    # meta function id
    # @return [Integer]
    attr_accessor :argument_id

    # column
    # @return [String]
    attr_accessor :argument_lookup_column

    # column position
    # @return [Integer]
    attr_accessor :argument_lookup_column_position

    # value
    # @return [String]
    attr_accessor :argument_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_override_output_fields': :'isOverrideOutputFields',
        'argument_display_name': :'argumentDisplayName',
        'argument_example': :'argumentExample',
        'argument_service': :'argumentService',
        'argument_data_type': :'argumentDataType',
        'argument_description': :'argumentDescription',
        'argument_name': :'argumentName',
        'argument_order': :'argumentOrder',
        'argument_type': :'argumentType',
        'argument_id': :'argumentId',
        'argument_lookup_column': :'argumentLookupColumn',
        'argument_lookup_column_position': :'argumentLookupColumnPosition',
        'argument_value': :'argumentValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_override_output_fields': :'BOOLEAN',
        'argument_display_name': :'String',
        'argument_example': :'String',
        'argument_service': :'String',
        'argument_data_type': :'String',
        'argument_description': :'String',
        'argument_name': :'String',
        'argument_order': :'Integer',
        'argument_type': :'Integer',
        'argument_id': :'Integer',
        'argument_lookup_column': :'String',
        'argument_lookup_column_position': :'Integer',
        'argument_value': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_override_output_fields The value to assign to the {#is_override_output_fields} property
    # @option attributes [String] :argument_display_name The value to assign to the {#argument_display_name} property
    # @option attributes [String] :argument_example The value to assign to the {#argument_example} property
    # @option attributes [String] :argument_service The value to assign to the {#argument_service} property
    # @option attributes [String] :argument_data_type The value to assign to the {#argument_data_type} property
    # @option attributes [String] :argument_description The value to assign to the {#argument_description} property
    # @option attributes [String] :argument_name The value to assign to the {#argument_name} property
    # @option attributes [Integer] :argument_order The value to assign to the {#argument_order} property
    # @option attributes [Integer] :argument_type The value to assign to the {#argument_type} property
    # @option attributes [Integer] :argument_id The value to assign to the {#argument_id} property
    # @option attributes [String] :argument_lookup_column The value to assign to the {#argument_lookup_column} property
    # @option attributes [Integer] :argument_lookup_column_position The value to assign to the {#argument_lookup_column_position} property
    # @option attributes [String] :argument_value The value to assign to the {#argument_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_override_output_fields = attributes[:'isOverrideOutputFields'] unless attributes[:'isOverrideOutputFields'].nil?

      raise 'You cannot provide both :isOverrideOutputFields and :is_override_output_fields' if attributes.key?(:'isOverrideOutputFields') && attributes.key?(:'is_override_output_fields')

      self.is_override_output_fields = attributes[:'is_override_output_fields'] unless attributes[:'is_override_output_fields'].nil?

      self.argument_display_name = attributes[:'argumentDisplayName'] if attributes[:'argumentDisplayName']

      raise 'You cannot provide both :argumentDisplayName and :argument_display_name' if attributes.key?(:'argumentDisplayName') && attributes.key?(:'argument_display_name')

      self.argument_display_name = attributes[:'argument_display_name'] if attributes[:'argument_display_name']

      self.argument_example = attributes[:'argumentExample'] if attributes[:'argumentExample']

      raise 'You cannot provide both :argumentExample and :argument_example' if attributes.key?(:'argumentExample') && attributes.key?(:'argument_example')

      self.argument_example = attributes[:'argument_example'] if attributes[:'argument_example']

      self.argument_service = attributes[:'argumentService'] if attributes[:'argumentService']

      raise 'You cannot provide both :argumentService and :argument_service' if attributes.key?(:'argumentService') && attributes.key?(:'argument_service')

      self.argument_service = attributes[:'argument_service'] if attributes[:'argument_service']

      self.argument_data_type = attributes[:'argumentDataType'] if attributes[:'argumentDataType']

      raise 'You cannot provide both :argumentDataType and :argument_data_type' if attributes.key?(:'argumentDataType') && attributes.key?(:'argument_data_type')

      self.argument_data_type = attributes[:'argument_data_type'] if attributes[:'argument_data_type']

      self.argument_description = attributes[:'argumentDescription'] if attributes[:'argumentDescription']

      raise 'You cannot provide both :argumentDescription and :argument_description' if attributes.key?(:'argumentDescription') && attributes.key?(:'argument_description')

      self.argument_description = attributes[:'argument_description'] if attributes[:'argument_description']

      self.argument_name = attributes[:'argumentName'] if attributes[:'argumentName']

      raise 'You cannot provide both :argumentName and :argument_name' if attributes.key?(:'argumentName') && attributes.key?(:'argument_name')

      self.argument_name = attributes[:'argument_name'] if attributes[:'argument_name']

      self.argument_order = attributes[:'argumentOrder'] if attributes[:'argumentOrder']

      raise 'You cannot provide both :argumentOrder and :argument_order' if attributes.key?(:'argumentOrder') && attributes.key?(:'argument_order')

      self.argument_order = attributes[:'argument_order'] if attributes[:'argument_order']

      self.argument_type = attributes[:'argumentType'] if attributes[:'argumentType']

      raise 'You cannot provide both :argumentType and :argument_type' if attributes.key?(:'argumentType') && attributes.key?(:'argument_type')

      self.argument_type = attributes[:'argument_type'] if attributes[:'argument_type']

      self.argument_id = attributes[:'argumentId'] if attributes[:'argumentId']

      raise 'You cannot provide both :argumentId and :argument_id' if attributes.key?(:'argumentId') && attributes.key?(:'argument_id')

      self.argument_id = attributes[:'argument_id'] if attributes[:'argument_id']

      self.argument_lookup_column = attributes[:'argumentLookupColumn'] if attributes[:'argumentLookupColumn']

      raise 'You cannot provide both :argumentLookupColumn and :argument_lookup_column' if attributes.key?(:'argumentLookupColumn') && attributes.key?(:'argument_lookup_column')

      self.argument_lookup_column = attributes[:'argument_lookup_column'] if attributes[:'argument_lookup_column']

      self.argument_lookup_column_position = attributes[:'argumentLookupColumnPosition'] if attributes[:'argumentLookupColumnPosition']

      raise 'You cannot provide both :argumentLookupColumnPosition and :argument_lookup_column_position' if attributes.key?(:'argumentLookupColumnPosition') && attributes.key?(:'argument_lookup_column_position')

      self.argument_lookup_column_position = attributes[:'argument_lookup_column_position'] if attributes[:'argument_lookup_column_position']

      self.argument_value = attributes[:'argumentValue'] if attributes[:'argumentValue']

      raise 'You cannot provide both :argumentValue and :argument_value' if attributes.key?(:'argumentValue') && attributes.key?(:'argument_value')

      self.argument_value = attributes[:'argument_value'] if attributes[:'argument_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_override_output_fields == other.is_override_output_fields &&
        argument_display_name == other.argument_display_name &&
        argument_example == other.argument_example &&
        argument_service == other.argument_service &&
        argument_data_type == other.argument_data_type &&
        argument_description == other.argument_description &&
        argument_name == other.argument_name &&
        argument_order == other.argument_order &&
        argument_type == other.argument_type &&
        argument_id == other.argument_id &&
        argument_lookup_column == other.argument_lookup_column &&
        argument_lookup_column_position == other.argument_lookup_column_position &&
        argument_value == other.argument_value
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
      [is_override_output_fields, argument_display_name, argument_example, argument_service, argument_data_type, argument_description, argument_name, argument_order, argument_type, argument_id, argument_lookup_column, argument_lookup_column_position, argument_value].hash
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
