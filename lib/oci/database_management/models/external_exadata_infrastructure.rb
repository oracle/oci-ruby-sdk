# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require 'logger'
require_relative 'dbm_resource'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the Exadata infrastructure.
  class DatabaseManagement::Models::ExternalExadataInfrastructure < DatabaseManagement::Models::DbmResource
    RACK_SIZE_ENUM = [
      RACK_SIZE_FULL = 'FULL'.freeze,
      RACK_SIZE_HALF = 'HALF'.freeze,
      RACK_SIZE_QUARTER = 'QUARTER'.freeze,
      RACK_SIZE_EIGHTH = 'EIGHTH'.freeze,
      RACK_SIZE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The rack size of the Exadata infrastructure.
    # @return [String]
    attr_reader :rack_size

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The Oracle license model that applies to the database management resources.
    #
    # @return [String]
    attr_reader :license_model

    # @return [OCI::DatabaseManagement::Models::ExternalExadataStorageGridSummary]
    attr_accessor :storage_grid

    # A list of DB systems.
    # @return [Array<OCI::DatabaseManagement::Models::ExternalExadataDatabaseSystemSummary>]
    attr_accessor :database_systems

    # The list of [OCIDs] (https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartments.
    # @return [Array<String>]
    attr_accessor :database_compartments

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # System tags can be viewed by users, but can only be created by the system.
    #
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
        'version': :'version',
        'internal_id': :'internalId',
        'status': :'status',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_details': :'lifecycleDetails',
        'additional_details': :'additionalDetails',
        'resource_type': :'resourceType',
        'rack_size': :'rackSize',
        'compartment_id': :'compartmentId',
        'license_model': :'licenseModel',
        'storage_grid': :'storageGrid',
        'database_systems': :'databaseSystems',
        'database_compartments': :'databaseCompartments',
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
        'version': :'String',
        'internal_id': :'String',
        'status': :'String',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_details': :'String',
        'additional_details': :'Hash<String, String>',
        'resource_type': :'String',
        'rack_size': :'String',
        'compartment_id': :'String',
        'license_model': :'String',
        'storage_grid': :'OCI::DatabaseManagement::Models::ExternalExadataStorageGridSummary',
        'database_systems': :'Array<OCI::DatabaseManagement::Models::ExternalExadataDatabaseSystemSummary>',
        'database_compartments': :'Array<String>',
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
    # @option attributes [String] :id The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#display_name #display_name} proprety
    # @option attributes [String] :version The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#version #version} proprety
    # @option attributes [String] :internal_id The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#internal_id #internal_id} proprety
    # @option attributes [String] :status The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#status #status} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#lifecycle_state #lifecycle_state} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#time_updated #time_updated} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#lifecycle_details #lifecycle_details} proprety
    # @option attributes [Hash<String, String>] :additional_details The value to assign to the {OCI::DatabaseManagement::Models::DbmResource#additional_details #additional_details} proprety
    # @option attributes [String] :rack_size The value to assign to the {#rack_size} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [OCI::DatabaseManagement::Models::ExternalExadataStorageGridSummary] :storage_grid The value to assign to the {#storage_grid} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::ExternalExadataDatabaseSystemSummary>] :database_systems The value to assign to the {#database_systems} property
    # @option attributes [Array<String>] :database_compartments The value to assign to the {#database_compartments} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['resourceType'] = 'INFRASTRUCTURE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.rack_size = attributes[:'rackSize'] if attributes[:'rackSize']

      raise 'You cannot provide both :rackSize and :rack_size' if attributes.key?(:'rackSize') && attributes.key?(:'rack_size')

      self.rack_size = attributes[:'rack_size'] if attributes[:'rack_size']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.storage_grid = attributes[:'storageGrid'] if attributes[:'storageGrid']

      raise 'You cannot provide both :storageGrid and :storage_grid' if attributes.key?(:'storageGrid') && attributes.key?(:'storage_grid')

      self.storage_grid = attributes[:'storage_grid'] if attributes[:'storage_grid']

      self.database_systems = attributes[:'databaseSystems'] if attributes[:'databaseSystems']

      raise 'You cannot provide both :databaseSystems and :database_systems' if attributes.key?(:'databaseSystems') && attributes.key?(:'database_systems')

      self.database_systems = attributes[:'database_systems'] if attributes[:'database_systems']

      self.database_compartments = attributes[:'databaseCompartments'] if attributes[:'databaseCompartments']

      raise 'You cannot provide both :databaseCompartments and :database_compartments' if attributes.key?(:'databaseCompartments') && attributes.key?(:'database_compartments')

      self.database_compartments = attributes[:'database_compartments'] if attributes[:'database_compartments']

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
    # @param [Object] rack_size Object to be assigned
    def rack_size=(rack_size)
      # rubocop:disable Style/ConditionalAssignment
      if rack_size && !RACK_SIZE_ENUM.include?(rack_size)
        OCI.logger.debug("Unknown value for 'rack_size' [" + rack_size + "]. Mapping to 'RACK_SIZE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @rack_size = RACK_SIZE_UNKNOWN_ENUM_VALUE
      else
        @rack_size = rack_size
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      # rubocop:disable Style/ConditionalAssignment
      if license_model && !LICENSE_MODEL_ENUM.include?(license_model)
        OCI.logger.debug("Unknown value for 'license_model' [" + license_model + "]. Mapping to 'LICENSE_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_model = LICENSE_MODEL_UNKNOWN_ENUM_VALUE
      else
        @license_model = license_model
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
        version == other.version &&
        internal_id == other.internal_id &&
        status == other.status &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_details == other.lifecycle_details &&
        additional_details == other.additional_details &&
        resource_type == other.resource_type &&
        rack_size == other.rack_size &&
        compartment_id == other.compartment_id &&
        license_model == other.license_model &&
        storage_grid == other.storage_grid &&
        database_systems == other.database_systems &&
        database_compartments == other.database_compartments &&
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
      [id, display_name, version, internal_id, status, lifecycle_state, time_created, time_updated, lifecycle_details, additional_details, resource_type, rack_size, compartment_id, license_model, storage_grid, database_systems, database_compartments, freeform_tags, defined_tags, system_tags].hash
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
