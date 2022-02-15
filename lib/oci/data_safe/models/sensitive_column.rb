# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A sensitive column is a resource corresponding to a database column that is considered sensitive.
  # It's a subresource of sensitive data model resource and is always associated with a sensitive data model.
  # Note that referential relationships are also managed as part of sensitive columns.
  #
  class DataSafe::Models::SensitiveColumn
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OBJECT_TYPE_ENUM = [
      OBJECT_TYPE_TABLE = 'TABLE'.freeze,
      OBJECT_TYPE_EDITIONING_VIEW = 'EDITIONING_VIEW'.freeze,
      OBJECT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_VALID = 'VALID'.freeze,
      STATUS_INVALID = 'INVALID'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SOURCE_ENUM = [
      SOURCE_MANUAL = 'MANUAL'.freeze,
      SOURCE_DISCOVERY = 'DISCOVERY'.freeze,
      SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RELATION_TYPE_ENUM = [
      RELATION_TYPE_NONE = 'NONE'.freeze,
      RELATION_TYPE_APP_DEFINED = 'APP_DEFINED'.freeze,
      RELATION_TYPE_DB_DEFINED = 'DB_DEFINED'.freeze,
      RELATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique key that identifies the sensitive column. It's numeric and unique within a sensitive data model.
    # @return [String]
    attr_accessor :key

    # **[Required]** The OCID of the sensitive data model that contains the sensitive column.
    # @return [String]
    attr_accessor :sensitive_data_model_id

    # **[Required]** The date and time, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339),
    # the sensitive column was created in the sensitive data model.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339),
    # the sensitive column was last updated in the sensitive data model.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the sensitive column.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the current state of the sensitive column.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The name of the application associated with the sensitive column. It's useful when the application name is
    # different from the schema name. Otherwise, it can be ignored.
    #
    # @return [String]
    attr_accessor :app_name

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

    # **[Required]** The status of the sensitive column. VALID means the column is considered sensitive. INVALID means the column
    # is not considered sensitive. Tracking invalid columns in a sensitive data model helps ensure that an
    # incremental data discovery job does not identify these columns as sensitive again.
    #
    # @return [String]
    attr_reader :status

    # The OCID of the sensitive type associated with the sensitive column.
    # @return [String]
    attr_accessor :sensitive_type_id

    # **[Required]** The source of the sensitive column. DISCOVERY indicates that the column was added to the sensitive data model
    # using a data discovery job. MANUAL indicates that the column was added manually.
    #
    # @return [String]
    attr_reader :source

    # Unique keys identifying the columns that are parents of the sensitive column. At present, it tracks a single parent only.
    # @return [Array<String>]
    attr_accessor :parent_column_keys

    # **[Required]** The type of referential relationship the sensitive column has with its parent. NONE indicates that the
    # sensitive column does not have a parent. DB_DEFINED indicates that the relationship is defined in the database
    # dictionary. APP_DEFINED indicates that the relationship is defined at the application level and not in the database dictionary.
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

    # Unique keys identifying the columns that are application-level (non-dictionary) children of the sensitive column.
    # @return [Array<String>]
    attr_accessor :app_defined_child_column_keys

    # Unique keys identifying the columns that are database-level (dictionary-defined) children of the sensitive column.
    # @return [Array<String>]
    attr_accessor :db_defined_child_column_keys

    # The composite key groups to which the sensitive column belongs. If the column is part of a composite key,
    # it's assigned a column group. It helps identify and manage referential relationships that involve composite keys.
    #
    # @return [Array<String>]
    attr_accessor :column_groups

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'sensitive_data_model_id': :'sensitiveDataModelId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'app_name': :'appName',
        'schema_name': :'schemaName',
        'object_name': :'objectName',
        'column_name': :'columnName',
        'object_type': :'objectType',
        'data_type': :'dataType',
        'status': :'status',
        'sensitive_type_id': :'sensitiveTypeId',
        'source': :'source',
        'parent_column_keys': :'parentColumnKeys',
        'relation_type': :'relationType',
        'estimated_data_value_count': :'estimatedDataValueCount',
        'sample_data_values': :'sampleDataValues',
        'app_defined_child_column_keys': :'appDefinedChildColumnKeys',
        'db_defined_child_column_keys': :'dbDefinedChildColumnKeys',
        'column_groups': :'columnGroups'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'sensitive_data_model_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'app_name': :'String',
        'schema_name': :'String',
        'object_name': :'String',
        'column_name': :'String',
        'object_type': :'String',
        'data_type': :'String',
        'status': :'String',
        'sensitive_type_id': :'String',
        'source': :'String',
        'parent_column_keys': :'Array<String>',
        'relation_type': :'String',
        'estimated_data_value_count': :'Integer',
        'sample_data_values': :'Array<String>',
        'app_defined_child_column_keys': :'Array<String>',
        'db_defined_child_column_keys': :'Array<String>',
        'column_groups': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :sensitive_data_model_id The value to assign to the {#sensitive_data_model_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :app_name The value to assign to the {#app_name} property
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :sensitive_type_id The value to assign to the {#sensitive_type_id} property
    # @option attributes [String] :source The value to assign to the {#source} property
    # @option attributes [Array<String>] :parent_column_keys The value to assign to the {#parent_column_keys} property
    # @option attributes [String] :relation_type The value to assign to the {#relation_type} property
    # @option attributes [Integer] :estimated_data_value_count The value to assign to the {#estimated_data_value_count} property
    # @option attributes [Array<String>] :sample_data_values The value to assign to the {#sample_data_values} property
    # @option attributes [Array<String>] :app_defined_child_column_keys The value to assign to the {#app_defined_child_column_keys} property
    # @option attributes [Array<String>] :db_defined_child_column_keys The value to assign to the {#db_defined_child_column_keys} property
    # @option attributes [Array<String>] :column_groups The value to assign to the {#column_groups} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.sensitive_data_model_id = attributes[:'sensitiveDataModelId'] if attributes[:'sensitiveDataModelId']

      raise 'You cannot provide both :sensitiveDataModelId and :sensitive_data_model_id' if attributes.key?(:'sensitiveDataModelId') && attributes.key?(:'sensitive_data_model_id')

      self.sensitive_data_model_id = attributes[:'sensitive_data_model_id'] if attributes[:'sensitive_data_model_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.app_name = attributes[:'appName'] if attributes[:'appName']

      raise 'You cannot provide both :appName and :app_name' if attributes.key?(:'appName') && attributes.key?(:'app_name')

      self.app_name = attributes[:'app_name'] if attributes[:'app_name']

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

      self.status = attributes[:'status'] if attributes[:'status']

      self.sensitive_type_id = attributes[:'sensitiveTypeId'] if attributes[:'sensitiveTypeId']

      raise 'You cannot provide both :sensitiveTypeId and :sensitive_type_id' if attributes.key?(:'sensitiveTypeId') && attributes.key?(:'sensitive_type_id')

      self.sensitive_type_id = attributes[:'sensitive_type_id'] if attributes[:'sensitive_type_id']

      self.source = attributes[:'source'] if attributes[:'source']

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

      self.app_defined_child_column_keys = attributes[:'appDefinedChildColumnKeys'] if attributes[:'appDefinedChildColumnKeys']

      raise 'You cannot provide both :appDefinedChildColumnKeys and :app_defined_child_column_keys' if attributes.key?(:'appDefinedChildColumnKeys') && attributes.key?(:'app_defined_child_column_keys')

      self.app_defined_child_column_keys = attributes[:'app_defined_child_column_keys'] if attributes[:'app_defined_child_column_keys']

      self.db_defined_child_column_keys = attributes[:'dbDefinedChildColumnKeys'] if attributes[:'dbDefinedChildColumnKeys']

      raise 'You cannot provide both :dbDefinedChildColumnKeys and :db_defined_child_column_keys' if attributes.key?(:'dbDefinedChildColumnKeys') && attributes.key?(:'db_defined_child_column_keys')

      self.db_defined_child_column_keys = attributes[:'db_defined_child_column_keys'] if attributes[:'db_defined_child_column_keys']

      self.column_groups = attributes[:'columnGroups'] if attributes[:'columnGroups']

      raise 'You cannot provide both :columnGroups and :column_groups' if attributes.key?(:'columnGroups') && attributes.key?(:'column_groups')

      self.column_groups = attributes[:'column_groups'] if attributes[:'column_groups']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source Object to be assigned
    def source=(source)
      # rubocop:disable Style/ConditionalAssignment
      if source && !SOURCE_ENUM.include?(source)
        OCI.logger.debug("Unknown value for 'source' [" + source + "]. Mapping to 'SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @source = SOURCE_UNKNOWN_ENUM_VALUE
      else
        @source = source
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
        sensitive_data_model_id == other.sensitive_data_model_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        app_name == other.app_name &&
        schema_name == other.schema_name &&
        object_name == other.object_name &&
        column_name == other.column_name &&
        object_type == other.object_type &&
        data_type == other.data_type &&
        status == other.status &&
        sensitive_type_id == other.sensitive_type_id &&
        source == other.source &&
        parent_column_keys == other.parent_column_keys &&
        relation_type == other.relation_type &&
        estimated_data_value_count == other.estimated_data_value_count &&
        sample_data_values == other.sample_data_values &&
        app_defined_child_column_keys == other.app_defined_child_column_keys &&
        db_defined_child_column_keys == other.db_defined_child_column_keys &&
        column_groups == other.column_groups
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
      [key, sensitive_data_model_id, time_created, time_updated, lifecycle_state, lifecycle_details, app_name, schema_name, object_name, column_name, object_type, data_type, status, sensitive_type_id, source, parent_column_keys, relation_type, estimated_data_value_count, sample_data_values, app_defined_child_column_keys, db_defined_child_column_keys, column_groups].hash
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
