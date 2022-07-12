# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A sensitive data model is a collection of sensitive columns and their referential relationships. It helps
  # understand the sensitive data landscape, track changes, and efficiently enable security controls such as data
  # masking. It can be managed either manually or by performing sensitive data discovery on a reference target
  # database. [Learn more](https://docs.oracle.com/en/cloud/paas/data-safe/udscs/sensitive-data-models1.html#GUID-849CA7D2-1809-40DD-B6D7-44E46EFF7EB5).
  #
  class DataSafe::Models::SensitiveDataModel
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the sensitive data model.
    # @return [String]
    attr_accessor :id

    # **[Required]** The display name of the sensitive data model.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment that contains the sensitive data model.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the reference target database associated with the sensitive data model. All operations such as
    # performing data discovery and adding columns manually are done in the context of the associated target database.
    #
    # @return [String]
    attr_accessor :target_id

    # **[Required]** The date and time the sensitive data model was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the sensitive data model was last updated, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the sensitive data model.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The application suite name identifying a collection of applications. The default value is GENERIC. It's useful
    # only if maintaining a sensitive data model for a suite of applications.
    #
    # @return [String]
    attr_accessor :app_suite_name

    # The description of the sensitive data model.
    # @return [String]
    attr_accessor :description

    # The schemas to be scanned by data discovery jobs.
    # @return [Array<String>]
    attr_accessor :schemas_for_discovery

    # The OCIDs of the sensitive types to be used by data discovery jobs.
    # @return [Array<String>]
    attr_accessor :sensitive_type_ids_for_discovery

    # **[Required]** Indicates if data discovery jobs should collect and store sample data values for the discovered columns.
    # Sample data helps review the discovered columns and ensure that they actually contain sensitive data.
    # As it collects original data from the target database, it's disabled by default and should be used only if
    # it's acceptable to store sample data in Data Safe's repository in Oracle Cloud. Note that sample data values
    # are not collected for columns with the following data types: LONG, LOB, RAW, XMLTYPE and BFILE.
    #
    # @return [BOOLEAN]
    attr_accessor :is_sample_data_collection_enabled

    # **[Required]** Indicates if data discovery jobs should identify potential application-level (non-dictionary) referential
    # relationships between columns. Note that data discovery automatically identifies and adds database-level (dictionary-defined)
    # relationships. This option helps identify application-level relationships that are not defined in the database dictionary,
    # which in turn, helps identify additional sensitive columns and preserve referential integrity during data masking.
    # It's disabled by default and should be used only if there is a need to identify application-level relationships.
    #
    # @return [BOOLEAN]
    attr_accessor :is_app_defined_relation_discovery_enabled

    # **[Required]** Indicates if all the schemas in the associated target database should be scanned by data discovery jobs.
    # If it's set to true, the schemasForDiscovery attribute is ignored and all schemas are used for data discovery.
    #
    # @return [BOOLEAN]
    attr_accessor :is_include_all_schemas

    # **[Required]** Indicates if all the existing sensitive types should be used by data discovery jobs.If it's set to true, the
    # sensitiveTypeIdsForDiscovery attribute is ignored and all sensitive types are used for data discovery.
    #
    # @return [BOOLEAN]
    attr_accessor :is_include_all_sensitive_types

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace. For more information, see Resource Tags.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'target_id': :'targetId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'app_suite_name': :'appSuiteName',
        'description': :'description',
        'schemas_for_discovery': :'schemasForDiscovery',
        'sensitive_type_ids_for_discovery': :'sensitiveTypeIdsForDiscovery',
        'is_sample_data_collection_enabled': :'isSampleDataCollectionEnabled',
        'is_app_defined_relation_discovery_enabled': :'isAppDefinedRelationDiscoveryEnabled',
        'is_include_all_schemas': :'isIncludeAllSchemas',
        'is_include_all_sensitive_types': :'isIncludeAllSensitiveTypes',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'target_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'app_suite_name': :'String',
        'description': :'String',
        'schemas_for_discovery': :'Array<String>',
        'sensitive_type_ids_for_discovery': :'Array<String>',
        'is_sample_data_collection_enabled': :'BOOLEAN',
        'is_app_defined_relation_discovery_enabled': :'BOOLEAN',
        'is_include_all_schemas': :'BOOLEAN',
        'is_include_all_sensitive_types': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :app_suite_name The value to assign to the {#app_suite_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<String>] :schemas_for_discovery The value to assign to the {#schemas_for_discovery} property
    # @option attributes [Array<String>] :sensitive_type_ids_for_discovery The value to assign to the {#sensitive_type_ids_for_discovery} property
    # @option attributes [BOOLEAN] :is_sample_data_collection_enabled The value to assign to the {#is_sample_data_collection_enabled} property
    # @option attributes [BOOLEAN] :is_app_defined_relation_discovery_enabled The value to assign to the {#is_app_defined_relation_discovery_enabled} property
    # @option attributes [BOOLEAN] :is_include_all_schemas The value to assign to the {#is_include_all_schemas} property
    # @option attributes [BOOLEAN] :is_include_all_sensitive_types The value to assign to the {#is_include_all_sensitive_types} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.app_suite_name = attributes[:'appSuiteName'] if attributes[:'appSuiteName']

      raise 'You cannot provide both :appSuiteName and :app_suite_name' if attributes.key?(:'appSuiteName') && attributes.key?(:'app_suite_name')

      self.app_suite_name = attributes[:'app_suite_name'] if attributes[:'app_suite_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.schemas_for_discovery = attributes[:'schemasForDiscovery'] if attributes[:'schemasForDiscovery']

      raise 'You cannot provide both :schemasForDiscovery and :schemas_for_discovery' if attributes.key?(:'schemasForDiscovery') && attributes.key?(:'schemas_for_discovery')

      self.schemas_for_discovery = attributes[:'schemas_for_discovery'] if attributes[:'schemas_for_discovery']

      self.sensitive_type_ids_for_discovery = attributes[:'sensitiveTypeIdsForDiscovery'] if attributes[:'sensitiveTypeIdsForDiscovery']

      raise 'You cannot provide both :sensitiveTypeIdsForDiscovery and :sensitive_type_ids_for_discovery' if attributes.key?(:'sensitiveTypeIdsForDiscovery') && attributes.key?(:'sensitive_type_ids_for_discovery')

      self.sensitive_type_ids_for_discovery = attributes[:'sensitive_type_ids_for_discovery'] if attributes[:'sensitive_type_ids_for_discovery']

      self.is_sample_data_collection_enabled = attributes[:'isSampleDataCollectionEnabled'] unless attributes[:'isSampleDataCollectionEnabled'].nil?

      raise 'You cannot provide both :isSampleDataCollectionEnabled and :is_sample_data_collection_enabled' if attributes.key?(:'isSampleDataCollectionEnabled') && attributes.key?(:'is_sample_data_collection_enabled')

      self.is_sample_data_collection_enabled = attributes[:'is_sample_data_collection_enabled'] unless attributes[:'is_sample_data_collection_enabled'].nil?

      self.is_app_defined_relation_discovery_enabled = attributes[:'isAppDefinedRelationDiscoveryEnabled'] unless attributes[:'isAppDefinedRelationDiscoveryEnabled'].nil?

      raise 'You cannot provide both :isAppDefinedRelationDiscoveryEnabled and :is_app_defined_relation_discovery_enabled' if attributes.key?(:'isAppDefinedRelationDiscoveryEnabled') && attributes.key?(:'is_app_defined_relation_discovery_enabled')

      self.is_app_defined_relation_discovery_enabled = attributes[:'is_app_defined_relation_discovery_enabled'] unless attributes[:'is_app_defined_relation_discovery_enabled'].nil?

      self.is_include_all_schemas = attributes[:'isIncludeAllSchemas'] unless attributes[:'isIncludeAllSchemas'].nil?

      raise 'You cannot provide both :isIncludeAllSchemas and :is_include_all_schemas' if attributes.key?(:'isIncludeAllSchemas') && attributes.key?(:'is_include_all_schemas')

      self.is_include_all_schemas = attributes[:'is_include_all_schemas'] unless attributes[:'is_include_all_schemas'].nil?

      self.is_include_all_sensitive_types = attributes[:'isIncludeAllSensitiveTypes'] unless attributes[:'isIncludeAllSensitiveTypes'].nil?

      raise 'You cannot provide both :isIncludeAllSensitiveTypes and :is_include_all_sensitive_types' if attributes.key?(:'isIncludeAllSensitiveTypes') && attributes.key?(:'is_include_all_sensitive_types')

      self.is_include_all_sensitive_types = attributes[:'is_include_all_sensitive_types'] unless attributes[:'is_include_all_sensitive_types'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        target_id == other.target_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        app_suite_name == other.app_suite_name &&
        description == other.description &&
        schemas_for_discovery == other.schemas_for_discovery &&
        sensitive_type_ids_for_discovery == other.sensitive_type_ids_for_discovery &&
        is_sample_data_collection_enabled == other.is_sample_data_collection_enabled &&
        is_app_defined_relation_discovery_enabled == other.is_app_defined_relation_discovery_enabled &&
        is_include_all_schemas == other.is_include_all_schemas &&
        is_include_all_sensitive_types == other.is_include_all_sensitive_types &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, display_name, compartment_id, target_id, time_created, time_updated, lifecycle_state, app_suite_name, description, schemas_for_discovery, sensitive_type_ids_for_discovery, is_sample_data_collection_enabled, is_app_defined_relation_discovery_enabled, is_include_all_schemas, is_include_all_sensitive_types, freeform_tags, defined_tags, system_tags].hash
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