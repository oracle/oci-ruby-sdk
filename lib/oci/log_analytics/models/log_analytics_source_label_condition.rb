# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsSourceLabelCondition
  class LogAnalytics::Models::LogAnalyticsSourceLabelCondition
    # The message.
    # @return [String]
    attr_accessor :message

    # A flag indicating whether or not the label condition is visible.
    #
    # @return [BOOLEAN]
    attr_accessor :is_visible

    # The block condition field.
    # @return [String]
    attr_accessor :block_condition_field

    # The block condition operator.
    # @return [String]
    attr_accessor :block_condition_operator

    # The block condition value.
    # @return [String]
    attr_accessor :block_condition_value

    # The condition value.
    # @return [String]
    attr_accessor :label_condition_value

    # A list of condition values.
    # @return [Array<String>]
    attr_accessor :label_condition_values

    # The content example.
    # @return [String]
    attr_accessor :content_example

    # A flag inidcating whether or not the condition is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The internal field name.
    # @return [String]
    attr_accessor :field_name

    # The unique identifier of the condition.
    # @return [Integer]
    attr_accessor :label_condition_id

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # The condition operator.
    # @return [String]
    attr_accessor :label_condition_operator

    # The unique identifier of the source.
    # @return [Integer]
    attr_accessor :source_id

    # The label display name.
    # @return [String]
    attr_accessor :label_display_name

    # The label storage field.
    # @return [String]
    attr_accessor :storage_field

    # The label name.
    # @return [String]
    attr_accessor :label_name

    # A flag indicating whether or not the inline label exists in the database.
    #
    # @return [BOOLEAN]
    attr_accessor :is_inline_label_existing_in_database

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'message': :'message',
        'is_visible': :'isVisible',
        'block_condition_field': :'blockConditionField',
        'block_condition_operator': :'blockConditionOperator',
        'block_condition_value': :'blockConditionValue',
        'label_condition_value': :'labelConditionValue',
        'label_condition_values': :'labelConditionValues',
        'content_example': :'contentExample',
        'is_enabled': :'isEnabled',
        'field_name': :'fieldName',
        'label_condition_id': :'labelConditionId',
        'is_system': :'isSystem',
        'label_condition_operator': :'labelConditionOperator',
        'source_id': :'sourceId',
        'label_display_name': :'labelDisplayName',
        'storage_field': :'storageField',
        'label_name': :'labelName',
        'is_inline_label_existing_in_database': :'isInlineLabelExistingInDatabase'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'message': :'String',
        'is_visible': :'BOOLEAN',
        'block_condition_field': :'String',
        'block_condition_operator': :'String',
        'block_condition_value': :'String',
        'label_condition_value': :'String',
        'label_condition_values': :'Array<String>',
        'content_example': :'String',
        'is_enabled': :'BOOLEAN',
        'field_name': :'String',
        'label_condition_id': :'Integer',
        'is_system': :'BOOLEAN',
        'label_condition_operator': :'String',
        'source_id': :'Integer',
        'label_display_name': :'String',
        'storage_field': :'String',
        'label_name': :'String',
        'is_inline_label_existing_in_database': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :message The value to assign to the {#message} property
    # @option attributes [BOOLEAN] :is_visible The value to assign to the {#is_visible} property
    # @option attributes [String] :block_condition_field The value to assign to the {#block_condition_field} property
    # @option attributes [String] :block_condition_operator The value to assign to the {#block_condition_operator} property
    # @option attributes [String] :block_condition_value The value to assign to the {#block_condition_value} property
    # @option attributes [String] :label_condition_value The value to assign to the {#label_condition_value} property
    # @option attributes [Array<String>] :label_condition_values The value to assign to the {#label_condition_values} property
    # @option attributes [String] :content_example The value to assign to the {#content_example} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :field_name The value to assign to the {#field_name} property
    # @option attributes [Integer] :label_condition_id The value to assign to the {#label_condition_id} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [String] :label_condition_operator The value to assign to the {#label_condition_operator} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :label_display_name The value to assign to the {#label_display_name} property
    # @option attributes [String] :storage_field The value to assign to the {#storage_field} property
    # @option attributes [String] :label_name The value to assign to the {#label_name} property
    # @option attributes [BOOLEAN] :is_inline_label_existing_in_database The value to assign to the {#is_inline_label_existing_in_database} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.message = attributes[:'message'] if attributes[:'message']

      self.is_visible = attributes[:'isVisible'] unless attributes[:'isVisible'].nil?

      raise 'You cannot provide both :isVisible and :is_visible' if attributes.key?(:'isVisible') && attributes.key?(:'is_visible')

      self.is_visible = attributes[:'is_visible'] unless attributes[:'is_visible'].nil?

      self.block_condition_field = attributes[:'blockConditionField'] if attributes[:'blockConditionField']

      raise 'You cannot provide both :blockConditionField and :block_condition_field' if attributes.key?(:'blockConditionField') && attributes.key?(:'block_condition_field')

      self.block_condition_field = attributes[:'block_condition_field'] if attributes[:'block_condition_field']

      self.block_condition_operator = attributes[:'blockConditionOperator'] if attributes[:'blockConditionOperator']

      raise 'You cannot provide both :blockConditionOperator and :block_condition_operator' if attributes.key?(:'blockConditionOperator') && attributes.key?(:'block_condition_operator')

      self.block_condition_operator = attributes[:'block_condition_operator'] if attributes[:'block_condition_operator']

      self.block_condition_value = attributes[:'blockConditionValue'] if attributes[:'blockConditionValue']

      raise 'You cannot provide both :blockConditionValue and :block_condition_value' if attributes.key?(:'blockConditionValue') && attributes.key?(:'block_condition_value')

      self.block_condition_value = attributes[:'block_condition_value'] if attributes[:'block_condition_value']

      self.label_condition_value = attributes[:'labelConditionValue'] if attributes[:'labelConditionValue']

      raise 'You cannot provide both :labelConditionValue and :label_condition_value' if attributes.key?(:'labelConditionValue') && attributes.key?(:'label_condition_value')

      self.label_condition_value = attributes[:'label_condition_value'] if attributes[:'label_condition_value']

      self.label_condition_values = attributes[:'labelConditionValues'] if attributes[:'labelConditionValues']

      raise 'You cannot provide both :labelConditionValues and :label_condition_values' if attributes.key?(:'labelConditionValues') && attributes.key?(:'label_condition_values')

      self.label_condition_values = attributes[:'label_condition_values'] if attributes[:'label_condition_values']

      self.content_example = attributes[:'contentExample'] if attributes[:'contentExample']

      raise 'You cannot provide both :contentExample and :content_example' if attributes.key?(:'contentExample') && attributes.key?(:'content_example')

      self.content_example = attributes[:'content_example'] if attributes[:'content_example']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.field_name = attributes[:'fieldName'] if attributes[:'fieldName']

      raise 'You cannot provide both :fieldName and :field_name' if attributes.key?(:'fieldName') && attributes.key?(:'field_name')

      self.field_name = attributes[:'field_name'] if attributes[:'field_name']

      self.label_condition_id = attributes[:'labelConditionId'] if attributes[:'labelConditionId']

      raise 'You cannot provide both :labelConditionId and :label_condition_id' if attributes.key?(:'labelConditionId') && attributes.key?(:'label_condition_id')

      self.label_condition_id = attributes[:'label_condition_id'] if attributes[:'label_condition_id']

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.label_condition_operator = attributes[:'labelConditionOperator'] if attributes[:'labelConditionOperator']

      raise 'You cannot provide both :labelConditionOperator and :label_condition_operator' if attributes.key?(:'labelConditionOperator') && attributes.key?(:'label_condition_operator')

      self.label_condition_operator = attributes[:'label_condition_operator'] if attributes[:'label_condition_operator']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.label_display_name = attributes[:'labelDisplayName'] if attributes[:'labelDisplayName']

      raise 'You cannot provide both :labelDisplayName and :label_display_name' if attributes.key?(:'labelDisplayName') && attributes.key?(:'label_display_name')

      self.label_display_name = attributes[:'label_display_name'] if attributes[:'label_display_name']

      self.storage_field = attributes[:'storageField'] if attributes[:'storageField']

      raise 'You cannot provide both :storageField and :storage_field' if attributes.key?(:'storageField') && attributes.key?(:'storage_field')

      self.storage_field = attributes[:'storage_field'] if attributes[:'storage_field']

      self.label_name = attributes[:'labelName'] if attributes[:'labelName']

      raise 'You cannot provide both :labelName and :label_name' if attributes.key?(:'labelName') && attributes.key?(:'label_name')

      self.label_name = attributes[:'label_name'] if attributes[:'label_name']

      self.is_inline_label_existing_in_database = attributes[:'isInlineLabelExistingInDatabase'] unless attributes[:'isInlineLabelExistingInDatabase'].nil?

      raise 'You cannot provide both :isInlineLabelExistingInDatabase and :is_inline_label_existing_in_database' if attributes.key?(:'isInlineLabelExistingInDatabase') && attributes.key?(:'is_inline_label_existing_in_database')

      self.is_inline_label_existing_in_database = attributes[:'is_inline_label_existing_in_database'] unless attributes[:'is_inline_label_existing_in_database'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        message == other.message &&
        is_visible == other.is_visible &&
        block_condition_field == other.block_condition_field &&
        block_condition_operator == other.block_condition_operator &&
        block_condition_value == other.block_condition_value &&
        label_condition_value == other.label_condition_value &&
        label_condition_values == other.label_condition_values &&
        content_example == other.content_example &&
        is_enabled == other.is_enabled &&
        field_name == other.field_name &&
        label_condition_id == other.label_condition_id &&
        is_system == other.is_system &&
        label_condition_operator == other.label_condition_operator &&
        source_id == other.source_id &&
        label_display_name == other.label_display_name &&
        storage_field == other.storage_field &&
        label_name == other.label_name &&
        is_inline_label_existing_in_database == other.is_inline_label_existing_in_database
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
      [message, is_visible, block_condition_field, block_condition_operator, block_condition_value, label_condition_value, label_condition_values, content_example, is_enabled, field_name, label_condition_id, is_system, label_condition_operator, source_id, label_display_name, storage_field, label_name, is_inline_label_existing_in_database].hash
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
