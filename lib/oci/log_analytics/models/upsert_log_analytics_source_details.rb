# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpsertLogAnalyticsSourceDetails
  class LogAnalytics::Models::UpsertLogAnalyticsSourceDetails
    # An array of source label conditions.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceLabelCondition>]
    attr_accessor :label_conditions

    # An array of data filter definitions.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceDataFilter>]
    attr_accessor :data_filter_definitions

    # The database credential name.
    # @return [String]
    attr_accessor :database_credential

    # An array of extended field definitions.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition>]
    attr_accessor :extended_field_definitions

    # A flag indicating whether or not this is a cloud source.
    #
    # @return [BOOLEAN]
    attr_accessor :is_for_cloud

    # An array of labels.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsLabelView>]
    attr_accessor :labels

    # An array of metric definitions.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsMetric>]
    attr_accessor :metric_definitions

    # An array of metrics.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceMetric>]
    attr_accessor :metrics

    # An array of built in source parsers.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>]
    attr_accessor :oob_parsers

    # An array of parameters.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParameter>]
    attr_accessor :parameters

    # An array of patterns.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourcePattern>]
    attr_accessor :patterns

    # The source description.
    # @return [String]
    attr_accessor :description

    # The source display name.
    # @return [String]
    attr_accessor :display_name

    # The source edit version.
    # @return [Integer]
    attr_accessor :edit_version

    # An array of source functions.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceFunction>]
    attr_accessor :functions

    # The source unique identifier.
    # @return [Integer]
    attr_accessor :source_id

    # The source internal name.
    # @return [String]
    attr_accessor :name

    # A flag indicating whether or not the source content is secure.
    #
    # @return [BOOLEAN]
    attr_accessor :is_secure_content

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # An array of parser.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>]
    attr_accessor :parsers

    # The rule unique identifier.
    # @return [Integer]
    attr_accessor :rule_id

    # The source type internal name.
    # @return [String]
    attr_accessor :type_name

    # The source warning configuration.
    # @return [Integer]
    attr_accessor :warning_config

    # An array of source metadata fields.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceMetadataField>]
    attr_accessor :metadata_fields

    # An array of labels.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsLabelDefinition>]
    attr_accessor :label_definitions

    # An array of entity types.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceEntityType>]
    attr_accessor :entity_types

    # A flag indicating whether or not the source has a time zone override.
    #
    # @return [BOOLEAN]
    attr_accessor :is_timezone_override

    # An array of custom parsers.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>]
    attr_accessor :user_parsers

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'label_conditions': :'labelConditions',
        'data_filter_definitions': :'dataFilterDefinitions',
        'database_credential': :'databaseCredential',
        'extended_field_definitions': :'extendedFieldDefinitions',
        'is_for_cloud': :'isForCloud',
        'labels': :'labels',
        'metric_definitions': :'metricDefinitions',
        'metrics': :'metrics',
        'oob_parsers': :'oobParsers',
        'parameters': :'parameters',
        'patterns': :'patterns',
        'description': :'description',
        'display_name': :'displayName',
        'edit_version': :'editVersion',
        'functions': :'functions',
        'source_id': :'sourceId',
        'name': :'name',
        'is_secure_content': :'isSecureContent',
        'is_system': :'isSystem',
        'parsers': :'parsers',
        'rule_id': :'ruleId',
        'type_name': :'typeName',
        'warning_config': :'warningConfig',
        'metadata_fields': :'metadataFields',
        'label_definitions': :'labelDefinitions',
        'entity_types': :'entityTypes',
        'is_timezone_override': :'isTimezoneOverride',
        'user_parsers': :'userParsers'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'label_conditions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceLabelCondition>',
        'data_filter_definitions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceDataFilter>',
        'database_credential': :'String',
        'extended_field_definitions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition>',
        'is_for_cloud': :'BOOLEAN',
        'labels': :'Array<OCI::LogAnalytics::Models::LogAnalyticsLabelView>',
        'metric_definitions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsMetric>',
        'metrics': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceMetric>',
        'oob_parsers': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParser>',
        'parameters': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParameter>',
        'patterns': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourcePattern>',
        'description': :'String',
        'display_name': :'String',
        'edit_version': :'Integer',
        'functions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceFunction>',
        'source_id': :'Integer',
        'name': :'String',
        'is_secure_content': :'BOOLEAN',
        'is_system': :'BOOLEAN',
        'parsers': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParser>',
        'rule_id': :'Integer',
        'type_name': :'String',
        'warning_config': :'Integer',
        'metadata_fields': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceMetadataField>',
        'label_definitions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsLabelDefinition>',
        'entity_types': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSourceEntityType>',
        'is_timezone_override': :'BOOLEAN',
        'user_parsers': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParser>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceLabelCondition>] :label_conditions The value to assign to the {#label_conditions} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceDataFilter>] :data_filter_definitions The value to assign to the {#data_filter_definitions} property
    # @option attributes [String] :database_credential The value to assign to the {#database_credential} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition>] :extended_field_definitions The value to assign to the {#extended_field_definitions} property
    # @option attributes [BOOLEAN] :is_for_cloud The value to assign to the {#is_for_cloud} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsLabelView>] :labels The value to assign to the {#labels} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsMetric>] :metric_definitions The value to assign to the {#metric_definitions} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceMetric>] :metrics The value to assign to the {#metrics} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>] :oob_parsers The value to assign to the {#oob_parsers} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParameter>] :parameters The value to assign to the {#parameters} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourcePattern>] :patterns The value to assign to the {#patterns} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceFunction>] :functions The value to assign to the {#functions} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [BOOLEAN] :is_secure_content The value to assign to the {#is_secure_content} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>] :parsers The value to assign to the {#parsers} property
    # @option attributes [Integer] :rule_id The value to assign to the {#rule_id} property
    # @option attributes [String] :type_name The value to assign to the {#type_name} property
    # @option attributes [Integer] :warning_config The value to assign to the {#warning_config} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceMetadataField>] :metadata_fields The value to assign to the {#metadata_fields} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsLabelDefinition>] :label_definitions The value to assign to the {#label_definitions} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSourceEntityType>] :entity_types The value to assign to the {#entity_types} property
    # @option attributes [BOOLEAN] :is_timezone_override The value to assign to the {#is_timezone_override} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>] :user_parsers The value to assign to the {#user_parsers} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.label_conditions = attributes[:'labelConditions'] if attributes[:'labelConditions']

      raise 'You cannot provide both :labelConditions and :label_conditions' if attributes.key?(:'labelConditions') && attributes.key?(:'label_conditions')

      self.label_conditions = attributes[:'label_conditions'] if attributes[:'label_conditions']

      self.data_filter_definitions = attributes[:'dataFilterDefinitions'] if attributes[:'dataFilterDefinitions']

      raise 'You cannot provide both :dataFilterDefinitions and :data_filter_definitions' if attributes.key?(:'dataFilterDefinitions') && attributes.key?(:'data_filter_definitions')

      self.data_filter_definitions = attributes[:'data_filter_definitions'] if attributes[:'data_filter_definitions']

      self.database_credential = attributes[:'databaseCredential'] if attributes[:'databaseCredential']

      raise 'You cannot provide both :databaseCredential and :database_credential' if attributes.key?(:'databaseCredential') && attributes.key?(:'database_credential')

      self.database_credential = attributes[:'database_credential'] if attributes[:'database_credential']

      self.extended_field_definitions = attributes[:'extendedFieldDefinitions'] if attributes[:'extendedFieldDefinitions']

      raise 'You cannot provide both :extendedFieldDefinitions and :extended_field_definitions' if attributes.key?(:'extendedFieldDefinitions') && attributes.key?(:'extended_field_definitions')

      self.extended_field_definitions = attributes[:'extended_field_definitions'] if attributes[:'extended_field_definitions']

      self.is_for_cloud = attributes[:'isForCloud'] unless attributes[:'isForCloud'].nil?

      raise 'You cannot provide both :isForCloud and :is_for_cloud' if attributes.key?(:'isForCloud') && attributes.key?(:'is_for_cloud')

      self.is_for_cloud = attributes[:'is_for_cloud'] unless attributes[:'is_for_cloud'].nil?

      self.labels = attributes[:'labels'] if attributes[:'labels']

      self.metric_definitions = attributes[:'metricDefinitions'] if attributes[:'metricDefinitions']

      raise 'You cannot provide both :metricDefinitions and :metric_definitions' if attributes.key?(:'metricDefinitions') && attributes.key?(:'metric_definitions')

      self.metric_definitions = attributes[:'metric_definitions'] if attributes[:'metric_definitions']

      self.metrics = attributes[:'metrics'] if attributes[:'metrics']

      self.oob_parsers = attributes[:'oobParsers'] if attributes[:'oobParsers']

      raise 'You cannot provide both :oobParsers and :oob_parsers' if attributes.key?(:'oobParsers') && attributes.key?(:'oob_parsers')

      self.oob_parsers = attributes[:'oob_parsers'] if attributes[:'oob_parsers']

      self.parameters = attributes[:'parameters'] if attributes[:'parameters']

      self.patterns = attributes[:'patterns'] if attributes[:'patterns']

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.functions = attributes[:'functions'] if attributes[:'functions']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.is_secure_content = attributes[:'isSecureContent'] unless attributes[:'isSecureContent'].nil?

      raise 'You cannot provide both :isSecureContent and :is_secure_content' if attributes.key?(:'isSecureContent') && attributes.key?(:'is_secure_content')

      self.is_secure_content = attributes[:'is_secure_content'] unless attributes[:'is_secure_content'].nil?

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.parsers = attributes[:'parsers'] if attributes[:'parsers']

      self.rule_id = attributes[:'ruleId'] if attributes[:'ruleId']

      raise 'You cannot provide both :ruleId and :rule_id' if attributes.key?(:'ruleId') && attributes.key?(:'rule_id')

      self.rule_id = attributes[:'rule_id'] if attributes[:'rule_id']

      self.type_name = attributes[:'typeName'] if attributes[:'typeName']

      raise 'You cannot provide both :typeName and :type_name' if attributes.key?(:'typeName') && attributes.key?(:'type_name')

      self.type_name = attributes[:'type_name'] if attributes[:'type_name']

      self.warning_config = attributes[:'warningConfig'] if attributes[:'warningConfig']

      raise 'You cannot provide both :warningConfig and :warning_config' if attributes.key?(:'warningConfig') && attributes.key?(:'warning_config')

      self.warning_config = attributes[:'warning_config'] if attributes[:'warning_config']

      self.metadata_fields = attributes[:'metadataFields'] if attributes[:'metadataFields']

      raise 'You cannot provide both :metadataFields and :metadata_fields' if attributes.key?(:'metadataFields') && attributes.key?(:'metadata_fields')

      self.metadata_fields = attributes[:'metadata_fields'] if attributes[:'metadata_fields']

      self.label_definitions = attributes[:'labelDefinitions'] if attributes[:'labelDefinitions']

      raise 'You cannot provide both :labelDefinitions and :label_definitions' if attributes.key?(:'labelDefinitions') && attributes.key?(:'label_definitions')

      self.label_definitions = attributes[:'label_definitions'] if attributes[:'label_definitions']

      self.entity_types = attributes[:'entityTypes'] if attributes[:'entityTypes']

      raise 'You cannot provide both :entityTypes and :entity_types' if attributes.key?(:'entityTypes') && attributes.key?(:'entity_types')

      self.entity_types = attributes[:'entity_types'] if attributes[:'entity_types']

      self.is_timezone_override = attributes[:'isTimezoneOverride'] unless attributes[:'isTimezoneOverride'].nil?

      raise 'You cannot provide both :isTimezoneOverride and :is_timezone_override' if attributes.key?(:'isTimezoneOverride') && attributes.key?(:'is_timezone_override')

      self.is_timezone_override = attributes[:'is_timezone_override'] unless attributes[:'is_timezone_override'].nil?

      self.user_parsers = attributes[:'userParsers'] if attributes[:'userParsers']

      raise 'You cannot provide both :userParsers and :user_parsers' if attributes.key?(:'userParsers') && attributes.key?(:'user_parsers')

      self.user_parsers = attributes[:'user_parsers'] if attributes[:'user_parsers']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        label_conditions == other.label_conditions &&
        data_filter_definitions == other.data_filter_definitions &&
        database_credential == other.database_credential &&
        extended_field_definitions == other.extended_field_definitions &&
        is_for_cloud == other.is_for_cloud &&
        labels == other.labels &&
        metric_definitions == other.metric_definitions &&
        metrics == other.metrics &&
        oob_parsers == other.oob_parsers &&
        parameters == other.parameters &&
        patterns == other.patterns &&
        description == other.description &&
        display_name == other.display_name &&
        edit_version == other.edit_version &&
        functions == other.functions &&
        source_id == other.source_id &&
        name == other.name &&
        is_secure_content == other.is_secure_content &&
        is_system == other.is_system &&
        parsers == other.parsers &&
        rule_id == other.rule_id &&
        type_name == other.type_name &&
        warning_config == other.warning_config &&
        metadata_fields == other.metadata_fields &&
        label_definitions == other.label_definitions &&
        entity_types == other.entity_types &&
        is_timezone_override == other.is_timezone_override &&
        user_parsers == other.user_parsers
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
      [label_conditions, data_filter_definitions, database_credential, extended_field_definitions, is_for_cloud, labels, metric_definitions, metrics, oob_parsers, parameters, patterns, description, display_name, edit_version, functions, source_id, name, is_secure_content, is_system, parsers, rule_id, type_name, warning_config, metadata_fields, label_definitions, entity_types, is_timezone_override, user_parsers].hash
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
