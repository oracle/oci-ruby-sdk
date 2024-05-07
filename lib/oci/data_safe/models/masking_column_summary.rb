# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a masking column.
  class DataSafe::Models::MaskingColumnSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OBJECT_TYPE_ENUM = [
      OBJECT_TYPE_TABLE = 'TABLE'.freeze,
      OBJECT_TYPE_EDITIONING_VIEW = 'EDITIONING_VIEW'.freeze,
      OBJECT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique key that identifies a masking column. The key is numeric and unique within a masking policy.
    # @return [String]
    attr_accessor :key

    # **[Required]** The OCID of the masking policy that contains the masking column.
    # @return [String]
    attr_accessor :masking_policy_id

    # **[Required]** The current state of the masking column.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the current state of the masking column.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The date and time the masking column was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the masking column was last updated, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The name of the schema that contains the database column.
    # @return [String]
    attr_accessor :schema_name

    # **[Required]** The name of the object (table or editioning view) that contains the database column.
    # @return [String]
    attr_accessor :object_name

    # The type of the object that contains the database column.
    # @return [String]
    attr_reader :object_type

    # **[Required]** The name of the database column. Note that the same name is used for the masking column.
    # There is no separate displayName attribute for the masking column.
    #
    # @return [String]
    attr_accessor :column_name

    # An array of child columns that are in referential relationship with the masking column.
    # @return [Array<String>]
    attr_accessor :child_columns

    # The group of the masking column. All the columns in a group are masked together to ensure
    # that the masked data across these columns continue
    # to retain the same logical relationship. For more details, check <a href=https://docs.oracle.com/en/cloud/paas/data-safe/udscs/group-masking1.html#GUID-755056B9-9540-48C0-9491-262A44A85037>Group Masking in the Data Safe documentation.</a>
    #
    # @return [String]
    attr_accessor :masking_column_group

    # The OCID of the sensitive type associated with the masking column.
    # @return [String]
    attr_accessor :sensitive_type_id

    # **[Required]** Indicates whether data masking is enabled for the masking column.
    # @return [BOOLEAN]
    attr_accessor :is_masking_enabled

    # The data type of the masking column.
    # @return [String]
    attr_accessor :data_type

    # An array of masking formats assigned to the masking column.
    # @return [Array<OCI::DataSafe::Models::MaskingFormat>]
    attr_accessor :masking_formats

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'masking_policy_id': :'maskingPolicyId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'schema_name': :'schemaName',
        'object_name': :'objectName',
        'object_type': :'objectType',
        'column_name': :'columnName',
        'child_columns': :'childColumns',
        'masking_column_group': :'maskingColumnGroup',
        'sensitive_type_id': :'sensitiveTypeId',
        'is_masking_enabled': :'isMaskingEnabled',
        'data_type': :'dataType',
        'masking_formats': :'maskingFormats'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'masking_policy_id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'schema_name': :'String',
        'object_name': :'String',
        'object_type': :'String',
        'column_name': :'String',
        'child_columns': :'Array<String>',
        'masking_column_group': :'String',
        'sensitive_type_id': :'String',
        'is_masking_enabled': :'BOOLEAN',
        'data_type': :'String',
        'masking_formats': :'Array<OCI::DataSafe::Models::MaskingFormat>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :masking_policy_id The value to assign to the {#masking_policy_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [Array<String>] :child_columns The value to assign to the {#child_columns} property
    # @option attributes [String] :masking_column_group The value to assign to the {#masking_column_group} property
    # @option attributes [String] :sensitive_type_id The value to assign to the {#sensitive_type_id} property
    # @option attributes [BOOLEAN] :is_masking_enabled The value to assign to the {#is_masking_enabled} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [Array<OCI::DataSafe::Models::MaskingFormat>] :masking_formats The value to assign to the {#masking_formats} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.masking_policy_id = attributes[:'maskingPolicyId'] if attributes[:'maskingPolicyId']

      raise 'You cannot provide both :maskingPolicyId and :masking_policy_id' if attributes.key?(:'maskingPolicyId') && attributes.key?(:'masking_policy_id')

      self.masking_policy_id = attributes[:'masking_policy_id'] if attributes[:'masking_policy_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.schema_name = attributes[:'schemaName'] if attributes[:'schemaName']

      raise 'You cannot provide both :schemaName and :schema_name' if attributes.key?(:'schemaName') && attributes.key?(:'schema_name')

      self.schema_name = attributes[:'schema_name'] if attributes[:'schema_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.child_columns = attributes[:'childColumns'] if attributes[:'childColumns']

      raise 'You cannot provide both :childColumns and :child_columns' if attributes.key?(:'childColumns') && attributes.key?(:'child_columns')

      self.child_columns = attributes[:'child_columns'] if attributes[:'child_columns']

      self.masking_column_group = attributes[:'maskingColumnGroup'] if attributes[:'maskingColumnGroup']

      raise 'You cannot provide both :maskingColumnGroup and :masking_column_group' if attributes.key?(:'maskingColumnGroup') && attributes.key?(:'masking_column_group')

      self.masking_column_group = attributes[:'masking_column_group'] if attributes[:'masking_column_group']

      self.sensitive_type_id = attributes[:'sensitiveTypeId'] if attributes[:'sensitiveTypeId']

      raise 'You cannot provide both :sensitiveTypeId and :sensitive_type_id' if attributes.key?(:'sensitiveTypeId') && attributes.key?(:'sensitive_type_id')

      self.sensitive_type_id = attributes[:'sensitive_type_id'] if attributes[:'sensitive_type_id']

      self.is_masking_enabled = attributes[:'isMaskingEnabled'] unless attributes[:'isMaskingEnabled'].nil?

      raise 'You cannot provide both :isMaskingEnabled and :is_masking_enabled' if attributes.key?(:'isMaskingEnabled') && attributes.key?(:'is_masking_enabled')

      self.is_masking_enabled = attributes[:'is_masking_enabled'] unless attributes[:'is_masking_enabled'].nil?

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.masking_formats = attributes[:'maskingFormats'] if attributes[:'maskingFormats']

      raise 'You cannot provide both :maskingFormats and :masking_formats' if attributes.key?(:'maskingFormats') && attributes.key?(:'masking_formats')

      self.masking_formats = attributes[:'masking_formats'] if attributes[:'masking_formats']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      # rubocop:disable Style/ConditionalAssignment
      if object_type && !OBJECT_TYPE_ENUM.include?(object_type)
        OCI.logger.debug("Unknown value for 'object_type' [" + object_type + "]. Mapping to 'OBJECT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @object_type = OBJECT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @object_type = object_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        masking_policy_id == other.masking_policy_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        schema_name == other.schema_name &&
        object_name == other.object_name &&
        object_type == other.object_type &&
        column_name == other.column_name &&
        child_columns == other.child_columns &&
        masking_column_group == other.masking_column_group &&
        sensitive_type_id == other.sensitive_type_id &&
        is_masking_enabled == other.is_masking_enabled &&
        data_type == other.data_type &&
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
      [key, masking_policy_id, lifecycle_state, lifecycle_details, time_created, time_updated, schema_name, object_name, object_type, column_name, child_columns, masking_column_group, sensitive_type_id, is_masking_enabled, data_type, masking_formats].hash
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
