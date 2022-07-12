# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a discovery job result.
  class DataSafe::Models::DiscoveryJobResultSummary
    OBJECT_TYPE_ENUM = [
      OBJECT_TYPE_TABLE = 'TABLE'.freeze,
      OBJECT_TYPE_EDITIONING_VIEW = 'EDITIONING_VIEW'.freeze,
      OBJECT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RELATION_TYPE_ENUM = [
      RELATION_TYPE_NONE = 'NONE'.freeze,
      RELATION_TYPE_APP_DEFINED = 'APP_DEFINED'.freeze,
      RELATION_TYPE_DB_DEFINED = 'DB_DEFINED'.freeze,
      RELATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique key that identifies the discovery result.
    # @return [String]
    attr_accessor :key

    # **[Required]** The type of the discovery result. It can be one of the following three types:
    # NEW: A new sensitive column in the target database that is not in the sensitive data model.
    # DELETED: A column that is present in the sensitive data model but has been deleted from the target database.
    # MODIFIED: A column that is present in the target database as well as the sensitive data model but some of its attributes have been modified.
    #
    # @return [String]
    attr_accessor :discovery_type

    # The unique key that identifies the sensitive column represented by the discovery result.
    # @return [String]
    attr_accessor :sensitive_columnkey

    # **[Required]** The database schema that contains the sensitive column.
    # @return [String]
    attr_accessor :schema_name

    # **[Required]** The database object that contains the sensitive column.
    # @return [String]
    attr_accessor :object_name

    # **[Required]** The name of the sensitive column.
    # @return [String]
    attr_accessor :column_name

    # **[Required]** The type of the database object that contains the sensitive column.
    # @return [String]
    attr_reader :object_type

    # **[Required]** The data type of the sensitive column.
    # @return [String]
    attr_accessor :data_type

    # The OCID of the sensitive type associated with the sensitive column.
    # @return [String]
    attr_accessor :sensitive_type_id

    # Unique keys identifying the columns that are parents of the sensitive column. At present, it tracks a single parent only.
    # @return [Array<String>]
    attr_accessor :parent_column_keys

    # **[Required]** The type of referential relationship the sensitive column has with its parent. NONE indicates that the sensitive
    # column does not have a parent. DB_DEFINED indicates that the relationship is defined in the database dictionary.
    # APP_DEFINED indicates that the relationship is defined at the application level and not in the database dictionary.
    #
    # @return [String]
    attr_reader :relation_type

    # **[Required]** The estimated number of data values the column has in the associated database.
    # @return [Integer]
    attr_accessor :estimated_data_value_count

    # Original data values collected for the sensitive column from the associated database. Sample data helps review
    # the column and ensure that it actually contains sensitive data. Note that sample data is retrieved by a data
    # discovery job only if the isSampleDataCollectionEnabled attribute is set to true. At present, only one data
    # value is collected per sensitive column.
    #
    # @return [Array<String>]
    attr_accessor :sample_data_values

    # **[Required]** Specifies how to process the discovery result. It's set to NONE by default. Use the PatchDiscoveryJobResults operation to update this attribute. You can choose one of the following options:
    # ACCEPT: To accept the discovery result and update the sensitive data model to reflect the changes.
    # REJECT: To reject the discovery result so that it doesn't change the sensitive data model.
    # INVALIDATE: To invalidate a newly discovered column. It adds the column to the sensitive data model but marks it as invalid. It helps track false positives and ensure that they aren't reported by future discovery jobs.
    # After specifying the planned action, you can use the ApplyDiscoveryJobResults operation to automatically process the discovery results.
    #
    # @return [String]
    attr_accessor :planned_action

    # **[Required]** Indicates if the discovery result has been processed. You can update this attribute using the PatchDiscoveryJobResults
    # operation to track whether the discovery result has already been processed and applied to the sensitive data model.
    #
    # @return [BOOLEAN]
    attr_accessor :is_result_applied

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'discovery_type': :'discoveryType',
        'sensitive_columnkey': :'sensitiveColumnkey',
        'schema_name': :'schemaName',
        'object_name': :'objectName',
        'column_name': :'columnName',
        'object_type': :'objectType',
        'data_type': :'dataType',
        'sensitive_type_id': :'sensitiveTypeId',
        'parent_column_keys': :'parentColumnKeys',
        'relation_type': :'relationType',
        'estimated_data_value_count': :'estimatedDataValueCount',
        'sample_data_values': :'sampleDataValues',
        'planned_action': :'plannedAction',
        'is_result_applied': :'isResultApplied'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'discovery_type': :'String',
        'sensitive_columnkey': :'String',
        'schema_name': :'String',
        'object_name': :'String',
        'column_name': :'String',
        'object_type': :'String',
        'data_type': :'String',
        'sensitive_type_id': :'String',
        'parent_column_keys': :'Array<String>',
        'relation_type': :'String',
        'estimated_data_value_count': :'Integer',
        'sample_data_values': :'Array<String>',
        'planned_action': :'String',
        'is_result_applied': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :discovery_type The value to assign to the {#discovery_type} property
    # @option attributes [String] :sensitive_columnkey The value to assign to the {#sensitive_columnkey} property
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [String] :sensitive_type_id The value to assign to the {#sensitive_type_id} property
    # @option attributes [Array<String>] :parent_column_keys The value to assign to the {#parent_column_keys} property
    # @option attributes [String] :relation_type The value to assign to the {#relation_type} property
    # @option attributes [Integer] :estimated_data_value_count The value to assign to the {#estimated_data_value_count} property
    # @option attributes [Array<String>] :sample_data_values The value to assign to the {#sample_data_values} property
    # @option attributes [String] :planned_action The value to assign to the {#planned_action} property
    # @option attributes [BOOLEAN] :is_result_applied The value to assign to the {#is_result_applied} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.discovery_type = attributes[:'discoveryType'] if attributes[:'discoveryType']

      raise 'You cannot provide both :discoveryType and :discovery_type' if attributes.key?(:'discoveryType') && attributes.key?(:'discovery_type')

      self.discovery_type = attributes[:'discovery_type'] if attributes[:'discovery_type']

      self.sensitive_columnkey = attributes[:'sensitiveColumnkey'] if attributes[:'sensitiveColumnkey']

      raise 'You cannot provide both :sensitiveColumnkey and :sensitive_columnkey' if attributes.key?(:'sensitiveColumnkey') && attributes.key?(:'sensitive_columnkey')

      self.sensitive_columnkey = attributes[:'sensitive_columnkey'] if attributes[:'sensitive_columnkey']

      self.schema_name = attributes[:'schemaName'] if attributes[:'schemaName']

      raise 'You cannot provide both :schemaName and :schema_name' if attributes.key?(:'schemaName') && attributes.key?(:'schema_name')

      self.schema_name = attributes[:'schema_name'] if attributes[:'schema_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.sensitive_type_id = attributes[:'sensitiveTypeId'] if attributes[:'sensitiveTypeId']

      raise 'You cannot provide both :sensitiveTypeId and :sensitive_type_id' if attributes.key?(:'sensitiveTypeId') && attributes.key?(:'sensitive_type_id')

      self.sensitive_type_id = attributes[:'sensitive_type_id'] if attributes[:'sensitive_type_id']

      self.parent_column_keys = attributes[:'parentColumnKeys'] if attributes[:'parentColumnKeys']

      raise 'You cannot provide both :parentColumnKeys and :parent_column_keys' if attributes.key?(:'parentColumnKeys') && attributes.key?(:'parent_column_keys')

      self.parent_column_keys = attributes[:'parent_column_keys'] if attributes[:'parent_column_keys']

      self.relation_type = attributes[:'relationType'] if attributes[:'relationType']

      raise 'You cannot provide both :relationType and :relation_type' if attributes.key?(:'relationType') && attributes.key?(:'relation_type')

      self.relation_type = attributes[:'relation_type'] if attributes[:'relation_type']

      self.estimated_data_value_count = attributes[:'estimatedDataValueCount'] if attributes[:'estimatedDataValueCount']

      raise 'You cannot provide both :estimatedDataValueCount and :estimated_data_value_count' if attributes.key?(:'estimatedDataValueCount') && attributes.key?(:'estimated_data_value_count')

      self.estimated_data_value_count = attributes[:'estimated_data_value_count'] if attributes[:'estimated_data_value_count']

      self.sample_data_values = attributes[:'sampleDataValues'] if attributes[:'sampleDataValues']

      raise 'You cannot provide both :sampleDataValues and :sample_data_values' if attributes.key?(:'sampleDataValues') && attributes.key?(:'sample_data_values')

      self.sample_data_values = attributes[:'sample_data_values'] if attributes[:'sample_data_values']

      self.planned_action = attributes[:'plannedAction'] if attributes[:'plannedAction']

      raise 'You cannot provide both :plannedAction and :planned_action' if attributes.key?(:'plannedAction') && attributes.key?(:'planned_action')

      self.planned_action = attributes[:'planned_action'] if attributes[:'planned_action']

      self.is_result_applied = attributes[:'isResultApplied'] unless attributes[:'isResultApplied'].nil?
      self.is_result_applied = false if is_result_applied.nil? && !attributes.key?(:'isResultApplied') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isResultApplied and :is_result_applied' if attributes.key?(:'isResultApplied') && attributes.key?(:'is_result_applied')

      self.is_result_applied = attributes[:'is_result_applied'] unless attributes[:'is_result_applied'].nil?
      self.is_result_applied = false if is_result_applied.nil? && !attributes.key?(:'isResultApplied') && !attributes.key?(:'is_result_applied') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] relation_type Object to be assigned
    def relation_type=(relation_type)
      # rubocop:disable Style/ConditionalAssignment
      if relation_type && !RELATION_TYPE_ENUM.include?(relation_type)
        OCI.logger.debug("Unknown value for 'relation_type' [" + relation_type + "]. Mapping to 'RELATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @relation_type = RELATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @relation_type = relation_type
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
        discovery_type == other.discovery_type &&
        sensitive_columnkey == other.sensitive_columnkey &&
        schema_name == other.schema_name &&
        object_name == other.object_name &&
        column_name == other.column_name &&
        object_type == other.object_type &&
        data_type == other.data_type &&
        sensitive_type_id == other.sensitive_type_id &&
        parent_column_keys == other.parent_column_keys &&
        relation_type == other.relation_type &&
        estimated_data_value_count == other.estimated_data_value_count &&
        sample_data_values == other.sample_data_values &&
        planned_action == other.planned_action &&
        is_result_applied == other.is_result_applied
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
      [key, discovery_type, sensitive_columnkey, schema_name, object_name, column_name, object_type, data_type, sensitive_type_id, parent_column_keys, relation_type, estimated_data_value_count, sample_data_values, planned_action, is_result_applied].hash
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