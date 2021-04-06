# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # source summary
  class LogAnalytics::Models::LabelSourceSummary
    # The source display name.
    # @return [String]
    attr_accessor :source_display_name

    # The source internal name.
    # @return [String]
    attr_accessor :source_name

    # The source unique identifier.
    # @return [Integer]
    attr_accessor :source_id

    # The label operator.
    # @return [String]
    attr_accessor :label_operator_name

    # The label condition.
    # @return [String]
    attr_accessor :label_condition

    # The label field display name.
    # @return [String]
    attr_accessor :label_field_displayname

    # The label field name.
    # @return [String]
    attr_accessor :label_field_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_display_name': :'sourceDisplayName',
        'source_name': :'sourceName',
        'source_id': :'sourceId',
        'label_operator_name': :'labelOperatorName',
        'label_condition': :'labelCondition',
        'label_field_displayname': :'labelFieldDisplayname',
        'label_field_name': :'labelFieldName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_display_name': :'String',
        'source_name': :'String',
        'source_id': :'Integer',
        'label_operator_name': :'String',
        'label_condition': :'String',
        'label_field_displayname': :'String',
        'label_field_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_display_name The value to assign to the {#source_display_name} property
    # @option attributes [String] :source_name The value to assign to the {#source_name} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :label_operator_name The value to assign to the {#label_operator_name} property
    # @option attributes [String] :label_condition The value to assign to the {#label_condition} property
    # @option attributes [String] :label_field_displayname The value to assign to the {#label_field_displayname} property
    # @option attributes [String] :label_field_name The value to assign to the {#label_field_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_display_name = attributes[:'sourceDisplayName'] if attributes[:'sourceDisplayName']

      raise 'You cannot provide both :sourceDisplayName and :source_display_name' if attributes.key?(:'sourceDisplayName') && attributes.key?(:'source_display_name')

      self.source_display_name = attributes[:'source_display_name'] if attributes[:'source_display_name']

      self.source_name = attributes[:'sourceName'] if attributes[:'sourceName']

      raise 'You cannot provide both :sourceName and :source_name' if attributes.key?(:'sourceName') && attributes.key?(:'source_name')

      self.source_name = attributes[:'source_name'] if attributes[:'source_name']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.label_operator_name = attributes[:'labelOperatorName'] if attributes[:'labelOperatorName']

      raise 'You cannot provide both :labelOperatorName and :label_operator_name' if attributes.key?(:'labelOperatorName') && attributes.key?(:'label_operator_name')

      self.label_operator_name = attributes[:'label_operator_name'] if attributes[:'label_operator_name']

      self.label_condition = attributes[:'labelCondition'] if attributes[:'labelCondition']

      raise 'You cannot provide both :labelCondition and :label_condition' if attributes.key?(:'labelCondition') && attributes.key?(:'label_condition')

      self.label_condition = attributes[:'label_condition'] if attributes[:'label_condition']

      self.label_field_displayname = attributes[:'labelFieldDisplayname'] if attributes[:'labelFieldDisplayname']

      raise 'You cannot provide both :labelFieldDisplayname and :label_field_displayname' if attributes.key?(:'labelFieldDisplayname') && attributes.key?(:'label_field_displayname')

      self.label_field_displayname = attributes[:'label_field_displayname'] if attributes[:'label_field_displayname']

      self.label_field_name = attributes[:'labelFieldName'] if attributes[:'labelFieldName']

      raise 'You cannot provide both :labelFieldName and :label_field_name' if attributes.key?(:'labelFieldName') && attributes.key?(:'label_field_name')

      self.label_field_name = attributes[:'label_field_name'] if attributes[:'label_field_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_display_name == other.source_display_name &&
        source_name == other.source_name &&
        source_id == other.source_id &&
        label_operator_name == other.label_operator_name &&
        label_condition == other.label_condition &&
        label_field_displayname == other.label_field_displayname &&
        label_field_name == other.label_field_name
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
      [source_display_name, source_name, source_id, label_operator_name, label_condition, label_field_displayname, label_field_name].hash
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
