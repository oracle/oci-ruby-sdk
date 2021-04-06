# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # While creating a migration, specify the source and the application that you want migrate.
  # Each migration moves a single application from a specified source to a specified Oracle Cloud Infrastructure tenancy.
  # If required, provide the credentials of the application administrator in the source environment.
  # Application Migration uses this information to access the application, as well as discover application artifacts,
  # such as the complete domain configuration along with data sources and other dependencies.
  #
  # You must also assign a name and provide a description for the migration.
  # This helps you to identify the appropriate source environment when you have multiple sources defined.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class ApplicationMigration::Models::CreateMigrationDetails
    PRE_CREATED_TARGET_DATABASE_TYPE_ENUM = [
      PRE_CREATED_TARGET_DATABASE_TYPE_DATABASE_SYSTEM = 'DATABASE_SYSTEM'.freeze,
      PRE_CREATED_TARGET_DATABASE_TYPE_NOT_SET = 'NOT_SET'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the source.
    #
    # @return [String]
    attr_accessor :compartment_id

    # User-friendly name of the application. This will be the name of the migrated application in Oracle Cloud Infrastructure.
    # @return [String]
    attr_accessor :display_name

    # Description of the application that you are migrating.
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the source.
    # @return [String]
    attr_accessor :source_id

    # **[Required]** Name of the application that you want to migrate from the source environment.
    # @return [String]
    attr_accessor :application_name

    # This attribute is required.
    # @return [OCI::ApplicationMigration::Models::DiscoveryDetails]
    attr_accessor :discovery_details

    # The pre-existing database type to be used in this migration. Currently, Application migration only supports Oracle Cloud
    # Infrastructure databases and this option is currently available only for `JAVA_CLOUD_SERVICE` and `WEBLOGIC_CLOUD_SERVICE` target instance types.
    #
    # @return [String]
    attr_reader :pre_created_target_database_type

    # If set to `true`, Application Migration migrates the application resources selectively depending on the source.
    #
    # @return [BOOLEAN]
    attr_accessor :is_selective_migration

    # Configuration required to migrate the application. In addition to the key and value, additional fields are provided
    # to describe type type and purpose of each field. Only the value for each key is required when passing configuration to the
    # CreateMigration operation.
    #
    # @return [Hash<String, OCI::ApplicationMigration::Models::ConfigurationField>]
    attr_accessor :service_config

    # Configuration required to migrate the application. In addition to the key and value, additional fields are provided
    # to describe type type and purpose of each field. Only the value for each key is required when passing configuration to the
    # CreateMigration operation.
    #
    # @return [Hash<String, OCI::ApplicationMigration::Models::ConfigurationField>]
    attr_accessor :application_config

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'source_id': :'sourceId',
        'application_name': :'applicationName',
        'discovery_details': :'discoveryDetails',
        'pre_created_target_database_type': :'preCreatedTargetDatabaseType',
        'is_selective_migration': :'isSelectiveMigration',
        'service_config': :'serviceConfig',
        'application_config': :'applicationConfig',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'source_id': :'String',
        'application_name': :'String',
        'discovery_details': :'OCI::ApplicationMigration::Models::DiscoveryDetails',
        'pre_created_target_database_type': :'String',
        'is_selective_migration': :'BOOLEAN',
        'service_config': :'Hash<String, OCI::ApplicationMigration::Models::ConfigurationField>',
        'application_config': :'Hash<String, OCI::ApplicationMigration::Models::ConfigurationField>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :application_name The value to assign to the {#application_name} property
    # @option attributes [OCI::ApplicationMigration::Models::DiscoveryDetails] :discovery_details The value to assign to the {#discovery_details} property
    # @option attributes [String] :pre_created_target_database_type The value to assign to the {#pre_created_target_database_type} property
    # @option attributes [BOOLEAN] :is_selective_migration The value to assign to the {#is_selective_migration} property
    # @option attributes [Hash<String, OCI::ApplicationMigration::Models::ConfigurationField>] :service_config The value to assign to the {#service_config} property
    # @option attributes [Hash<String, OCI::ApplicationMigration::Models::ConfigurationField>] :application_config The value to assign to the {#application_config} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.application_name = attributes[:'applicationName'] if attributes[:'applicationName']

      raise 'You cannot provide both :applicationName and :application_name' if attributes.key?(:'applicationName') && attributes.key?(:'application_name')

      self.application_name = attributes[:'application_name'] if attributes[:'application_name']

      self.discovery_details = attributes[:'discoveryDetails'] if attributes[:'discoveryDetails']

      raise 'You cannot provide both :discoveryDetails and :discovery_details' if attributes.key?(:'discoveryDetails') && attributes.key?(:'discovery_details')

      self.discovery_details = attributes[:'discovery_details'] if attributes[:'discovery_details']

      self.pre_created_target_database_type = attributes[:'preCreatedTargetDatabaseType'] if attributes[:'preCreatedTargetDatabaseType']

      raise 'You cannot provide both :preCreatedTargetDatabaseType and :pre_created_target_database_type' if attributes.key?(:'preCreatedTargetDatabaseType') && attributes.key?(:'pre_created_target_database_type')

      self.pre_created_target_database_type = attributes[:'pre_created_target_database_type'] if attributes[:'pre_created_target_database_type']

      self.is_selective_migration = attributes[:'isSelectiveMigration'] unless attributes[:'isSelectiveMigration'].nil?
      self.is_selective_migration = false if is_selective_migration.nil? && !attributes.key?(:'isSelectiveMigration') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSelectiveMigration and :is_selective_migration' if attributes.key?(:'isSelectiveMigration') && attributes.key?(:'is_selective_migration')

      self.is_selective_migration = attributes[:'is_selective_migration'] unless attributes[:'is_selective_migration'].nil?
      self.is_selective_migration = false if is_selective_migration.nil? && !attributes.key?(:'isSelectiveMigration') && !attributes.key?(:'is_selective_migration') # rubocop:disable Style/StringLiterals

      self.service_config = attributes[:'serviceConfig'] if attributes[:'serviceConfig']

      raise 'You cannot provide both :serviceConfig and :service_config' if attributes.key?(:'serviceConfig') && attributes.key?(:'service_config')

      self.service_config = attributes[:'service_config'] if attributes[:'service_config']

      self.application_config = attributes[:'applicationConfig'] if attributes[:'applicationConfig']

      raise 'You cannot provide both :applicationConfig and :application_config' if attributes.key?(:'applicationConfig') && attributes.key?(:'application_config')

      self.application_config = attributes[:'application_config'] if attributes[:'application_config']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] pre_created_target_database_type Object to be assigned
    def pre_created_target_database_type=(pre_created_target_database_type)
      raise "Invalid value for 'pre_created_target_database_type': this must be one of the values in PRE_CREATED_TARGET_DATABASE_TYPE_ENUM." if pre_created_target_database_type && !PRE_CREATED_TARGET_DATABASE_TYPE_ENUM.include?(pre_created_target_database_type)

      @pre_created_target_database_type = pre_created_target_database_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        source_id == other.source_id &&
        application_name == other.application_name &&
        discovery_details == other.discovery_details &&
        pre_created_target_database_type == other.pre_created_target_database_type &&
        is_selective_migration == other.is_selective_migration &&
        service_config == other.service_config &&
        application_config == other.application_config &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [compartment_id, display_name, description, source_id, application_name, discovery_details, pre_created_target_database_type, is_selective_migration, service_config, application_config, freeform_tags, defined_tags].hash
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
