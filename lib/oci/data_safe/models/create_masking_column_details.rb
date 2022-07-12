# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create a new masking column. You can use this to add a parent column only.
  # It automatically adds the child columns from the associated sensitive data model or
  # target database. If you provide the sensitiveTypeId attribute but not the maskingFormats
  # attribute, it automatically assigns the default masking format associated with the
  # specified sensitive type. Alternatively, if you provide the maskingFormats attribute,
  # the specified masking formats are assigned to the column.
  #
  # Using the maskingFormats attribute, you can assign one or more masking formats to a
  # column. You can specify a condition as part of each masking format. It enables you
  # to do <a href=\"https://docs.oracle.com/en/cloud/paas/data-safe/udscs/conditional-masking.html\">conditional masking</a>
  # so that you can mask the column data values differently using different masking formats
  # and the associated conditions. A masking format can have one or more format entries.
  # The combined output of all the format entries is used for masking. It provides the
  # flexibility to define a masking format that can generate different parts of a data
  # value separately and then combine them to get the final data value for masking.
  #
  # You can use the maskingColumnGroup attribute to group the columns that you would like
  # to mask together. It enables you to do
  # <a href=\"https://docs.oracle.com/en/cloud/paas/data-safe/udscs/group-masking1.html#GUID-755056B9-9540-48C0-9491-262A44A85037\">group or compound masking</a>
  # that ensures that the masked data across the columns in a group continue to retain
  # the same logical relationship.
  #
  class DataSafe::Models::CreateMaskingColumnDetails
    OBJECT_TYPE_ENUM = [
      OBJECT_TYPE_TABLE = 'TABLE'.freeze,
      OBJECT_TYPE_EDITIONING_VIEW = 'EDITIONING_VIEW'.freeze
    ].freeze

    # **[Required]** The name of the schema that contains the database column. This attribute cannot be updated for an existing masking column.
    # @return [String]
    attr_accessor :schema_name

    # **[Required]** The name of the object (table or editioning view) that contains the database column. This attribute cannot be updated for an existing masking column.
    # @return [String]
    attr_accessor :object_name

    # The type of the object that contains the database column.
    # @return [String]
    attr_reader :object_type

    # **[Required]** The name of the database column. This attribute cannot be updated for an existing
    #  masking column. Note that the same name is used for the masking column. There
    #  is no separate displayName attribute for the masking column.
    #
    # @return [String]
    attr_accessor :column_name

    # The group of the masking column. It's a masking group identifier and can be any string
    # of acceptable length. All the columns in a group are masked together to ensure that
    # the masked data across these columns continue to retain the same logical relationship.
    # For more details, check
    # <a href=https://docs.oracle.com/en/cloud/paas/data-safe/udscs/group-masking1.html#GUID-755056B9-9540-48C0-9491-262A44A85037>Group Masking in the Data Safe documentation.</a>
    #
    # @return [String]
    attr_accessor :masking_column_group

    # The OCID of the sensitive type to be associated with the masking column. Note that
    # if the maskingFormats attribute isn't provided while creating a masking column,
    # the default masking format associated with the specified sensitive type is assigned
    # to the masking column.
    #
    # @return [String]
    attr_accessor :sensitive_type_id

    # Indicates if data masking is enabled for the masking column. Set it to false if
    # you don't want to mask the column.
    #
    # @return [BOOLEAN]
    attr_accessor :is_masking_enabled

    # The masking formats to be assigned to the masking column. You can specify a condition
    # as part of each masking format. It enables you to do
    # <a href=\"https://docs.oracle.com/en/cloud/paas/data-safe/udscs/conditional-masking.html\">conditional masking</a>
    # so that you can mask the column data values differently using different masking
    # formats and the associated conditions. A masking format can have one or more format
    # entries. The combined output of all the format entries is used for masking. It
    # provides the flexibility to define a masking format that can generate different parts
    # of a data value separately and then combine them to get the final data value for masking.
    #
    # @return [Array<OCI::DataSafe::Models::MaskingFormat>]
    attr_accessor :masking_formats

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'schema_name': :'schemaName',
        'object_name': :'objectName',
        'object_type': :'objectType',
        'column_name': :'columnName',
        'masking_column_group': :'maskingColumnGroup',
        'sensitive_type_id': :'sensitiveTypeId',
        'is_masking_enabled': :'isMaskingEnabled',
        'masking_formats': :'maskingFormats'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'schema_name': :'String',
        'object_name': :'String',
        'object_type': :'String',
        'column_name': :'String',
        'masking_column_group': :'String',
        'sensitive_type_id': :'String',
        'is_masking_enabled': :'BOOLEAN',
        'masking_formats': :'Array<OCI::DataSafe::Models::MaskingFormat>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [String] :masking_column_group The value to assign to the {#masking_column_group} property
    # @option attributes [String] :sensitive_type_id The value to assign to the {#sensitive_type_id} property
    # @option attributes [BOOLEAN] :is_masking_enabled The value to assign to the {#is_masking_enabled} property
    # @option attributes [Array<OCI::DataSafe::Models::MaskingFormat>] :masking_formats The value to assign to the {#masking_formats} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.schema_name = attributes[:'schemaName'] if attributes[:'schemaName']

      raise 'You cannot provide both :schemaName and :schema_name' if attributes.key?(:'schemaName') && attributes.key?(:'schema_name')

      self.schema_name = attributes[:'schema_name'] if attributes[:'schema_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']
      self.object_type = "TABLE" if object_type.nil? && !attributes.key?(:'objectType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']
      self.object_type = "TABLE" if object_type.nil? && !attributes.key?(:'objectType') && !attributes.key?(:'object_type') # rubocop:disable Style/StringLiterals

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.masking_column_group = attributes[:'maskingColumnGroup'] if attributes[:'maskingColumnGroup']

      raise 'You cannot provide both :maskingColumnGroup and :masking_column_group' if attributes.key?(:'maskingColumnGroup') && attributes.key?(:'masking_column_group')

      self.masking_column_group = attributes[:'masking_column_group'] if attributes[:'masking_column_group']

      self.sensitive_type_id = attributes[:'sensitiveTypeId'] if attributes[:'sensitiveTypeId']

      raise 'You cannot provide both :sensitiveTypeId and :sensitive_type_id' if attributes.key?(:'sensitiveTypeId') && attributes.key?(:'sensitive_type_id')

      self.sensitive_type_id = attributes[:'sensitive_type_id'] if attributes[:'sensitive_type_id']

      self.is_masking_enabled = attributes[:'isMaskingEnabled'] unless attributes[:'isMaskingEnabled'].nil?
      self.is_masking_enabled = true if is_masking_enabled.nil? && !attributes.key?(:'isMaskingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMaskingEnabled and :is_masking_enabled' if attributes.key?(:'isMaskingEnabled') && attributes.key?(:'is_masking_enabled')

      self.is_masking_enabled = attributes[:'is_masking_enabled'] unless attributes[:'is_masking_enabled'].nil?
      self.is_masking_enabled = true if is_masking_enabled.nil? && !attributes.key?(:'isMaskingEnabled') && !attributes.key?(:'is_masking_enabled') # rubocop:disable Style/StringLiterals

      self.masking_formats = attributes[:'maskingFormats'] if attributes[:'maskingFormats']

      raise 'You cannot provide both :maskingFormats and :masking_formats' if attributes.key?(:'maskingFormats') && attributes.key?(:'masking_formats')

      self.masking_formats = attributes[:'masking_formats'] if attributes[:'masking_formats']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      raise "Invalid value for 'object_type': this must be one of the values in OBJECT_TYPE_ENUM." if object_type && !OBJECT_TYPE_ENUM.include?(object_type)

      @object_type = object_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        schema_name == other.schema_name &&
        object_name == other.object_name &&
        object_type == other.object_type &&
        column_name == other.column_name &&
        masking_column_group == other.masking_column_group &&
        sensitive_type_id == other.sensitive_type_id &&
        is_masking_enabled == other.is_masking_enabled &&
        masking_formats == other.masking_formats
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
      [schema_name, object_name, object_type, column_name, masking_column_group, sensitive_type_id, is_masking_enabled, masking_formats].hash
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