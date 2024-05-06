# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a SDM masking policy difference column.
  class DataSafe::Models::DifferenceColumnSummary
    # **[Required]** The unique key that identifies the SDM masking policy difference column.
    # @return [String]
    attr_accessor :key

    # **[Required]** The type of the SDM masking policy difference column. It can be one of the following three types:
    # NEW: A new sensitive column in the sensitive data model that is not in the masking policy.
    # DELETED: A column that is present in the masking policy but has been deleted from the sensitive data model.
    # MODIFIED: A column that is present in the masking policy as well as the sensitive data model but some of its attributes have been modified.
    #
    # @return [String]
    attr_accessor :difference_type

    # The unique key that identifies the sensitive column represented by the SDM masking policy difference column.
    # @return [String]
    attr_accessor :sensitive_columnkey

    # The unique key that identifies the masking column represented by the SDM masking policy difference column.
    # @return [String]
    attr_accessor :masking_columnkey

    # **[Required]** The database schema that contains the difference column.
    # @return [String]
    attr_accessor :schema_name

    # **[Required]** The database object that contains the difference column.
    # @return [String]
    attr_accessor :object_name

    # **[Required]** The name of the difference column.
    # @return [String]
    attr_accessor :column_name

    # The OCID of the sensitive type associated with the difference column.
    # @return [String]
    attr_accessor :sensitive_type_id

    # **[Required]** Specifies how to process the difference column. It's set to SYNC by default. Use the PatchSdmMaskingPolicyDifferenceColumns operation to update this attribute. You can choose one of the following options:
    # SYNC: To sync the difference column and update the masking policy to reflect the changes.
    # NO_SYNC: To not sync the difference column so that it doesn't change the masking policy.
    # After specifying the planned action, you can use the ApplySdmMaskingPolicyDifference operation to automatically process the difference columns.
    #
    # @return [String]
    attr_accessor :planned_action

    # **[Required]** Indicates if the difference column has been processed.Use GetDifferenceColumn operation to track whether the difference column has
    # already been processed and applied to the masking policy.
    #
    # @return [String]
    attr_accessor :sync_status

    # The date and time the SDM masking policy difference column was last synced, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_last_synced

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'difference_type': :'differenceType',
        'sensitive_columnkey': :'sensitiveColumnkey',
        'masking_columnkey': :'maskingColumnkey',
        'schema_name': :'schemaName',
        'object_name': :'objectName',
        'column_name': :'columnName',
        'sensitive_type_id': :'sensitiveTypeId',
        'planned_action': :'plannedAction',
        'sync_status': :'syncStatus',
        'time_last_synced': :'timeLastSynced'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'difference_type': :'String',
        'sensitive_columnkey': :'String',
        'masking_columnkey': :'String',
        'schema_name': :'String',
        'object_name': :'String',
        'column_name': :'String',
        'sensitive_type_id': :'String',
        'planned_action': :'String',
        'sync_status': :'String',
        'time_last_synced': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :difference_type The value to assign to the {#difference_type} property
    # @option attributes [String] :sensitive_columnkey The value to assign to the {#sensitive_columnkey} property
    # @option attributes [String] :masking_columnkey The value to assign to the {#masking_columnkey} property
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [String] :sensitive_type_id The value to assign to the {#sensitive_type_id} property
    # @option attributes [String] :planned_action The value to assign to the {#planned_action} property
    # @option attributes [String] :sync_status The value to assign to the {#sync_status} property
    # @option attributes [DateTime] :time_last_synced The value to assign to the {#time_last_synced} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.difference_type = attributes[:'differenceType'] if attributes[:'differenceType']

      raise 'You cannot provide both :differenceType and :difference_type' if attributes.key?(:'differenceType') && attributes.key?(:'difference_type')

      self.difference_type = attributes[:'difference_type'] if attributes[:'difference_type']

      self.sensitive_columnkey = attributes[:'sensitiveColumnkey'] if attributes[:'sensitiveColumnkey']

      raise 'You cannot provide both :sensitiveColumnkey and :sensitive_columnkey' if attributes.key?(:'sensitiveColumnkey') && attributes.key?(:'sensitive_columnkey')

      self.sensitive_columnkey = attributes[:'sensitive_columnkey'] if attributes[:'sensitive_columnkey']

      self.masking_columnkey = attributes[:'maskingColumnkey'] if attributes[:'maskingColumnkey']

      raise 'You cannot provide both :maskingColumnkey and :masking_columnkey' if attributes.key?(:'maskingColumnkey') && attributes.key?(:'masking_columnkey')

      self.masking_columnkey = attributes[:'masking_columnkey'] if attributes[:'masking_columnkey']

      self.schema_name = attributes[:'schemaName'] if attributes[:'schemaName']

      raise 'You cannot provide both :schemaName and :schema_name' if attributes.key?(:'schemaName') && attributes.key?(:'schema_name')

      self.schema_name = attributes[:'schema_name'] if attributes[:'schema_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.sensitive_type_id = attributes[:'sensitiveTypeId'] if attributes[:'sensitiveTypeId']

      raise 'You cannot provide both :sensitiveTypeId and :sensitive_type_id' if attributes.key?(:'sensitiveTypeId') && attributes.key?(:'sensitive_type_id')

      self.sensitive_type_id = attributes[:'sensitive_type_id'] if attributes[:'sensitive_type_id']

      self.planned_action = attributes[:'plannedAction'] if attributes[:'plannedAction']

      raise 'You cannot provide both :plannedAction and :planned_action' if attributes.key?(:'plannedAction') && attributes.key?(:'planned_action')

      self.planned_action = attributes[:'planned_action'] if attributes[:'planned_action']

      self.sync_status = attributes[:'syncStatus'] if attributes[:'syncStatus']

      raise 'You cannot provide both :syncStatus and :sync_status' if attributes.key?(:'syncStatus') && attributes.key?(:'sync_status')

      self.sync_status = attributes[:'sync_status'] if attributes[:'sync_status']

      self.time_last_synced = attributes[:'timeLastSynced'] if attributes[:'timeLastSynced']

      raise 'You cannot provide both :timeLastSynced and :time_last_synced' if attributes.key?(:'timeLastSynced') && attributes.key?(:'time_last_synced')

      self.time_last_synced = attributes[:'time_last_synced'] if attributes[:'time_last_synced']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        difference_type == other.difference_type &&
        sensitive_columnkey == other.sensitive_columnkey &&
        masking_columnkey == other.masking_columnkey &&
        schema_name == other.schema_name &&
        object_name == other.object_name &&
        column_name == other.column_name &&
        sensitive_type_id == other.sensitive_type_id &&
        planned_action == other.planned_action &&
        sync_status == other.sync_status &&
        time_last_synced == other.time_last_synced
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
      [key, difference_type, sensitive_columnkey, masking_columnkey, schema_name, object_name, column_name, sensitive_type_id, planned_action, sync_status, time_last_synced].hash
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