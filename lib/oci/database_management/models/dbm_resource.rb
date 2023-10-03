# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The base Exadata resource.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DatabaseManagement::Models::DbmResource
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze
    ].freeze

    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_INFRASTRUCTURE_SUMMARY = 'INFRASTRUCTURE_SUMMARY'.freeze,
      RESOURCE_TYPE_INFRASTRUCTURE = 'INFRASTRUCTURE'.freeze,
      RESOURCE_TYPE_STORAGE_SERVER_SUMMARY = 'STORAGE_SERVER_SUMMARY'.freeze,
      RESOURCE_TYPE_STORAGE_SERVER = 'STORAGE_SERVER'.freeze,
      RESOURCE_TYPE_STORAGE_GRID_SUMMARY = 'STORAGE_GRID_SUMMARY'.freeze,
      RESOURCE_TYPE_STORAGE_GRID = 'STORAGE_GRID'.freeze,
      RESOURCE_TYPE_STORAGE_CONNECTOR_SUMMARY = 'STORAGE_CONNECTOR_SUMMARY'.freeze,
      RESOURCE_TYPE_STORAGE_CONNECTOR = 'STORAGE_CONNECTOR'.freeze,
      RESOURCE_TYPE_DATABASE_SYSTEM_SUMMARY = 'DATABASE_SYSTEM_SUMMARY'.freeze,
      RESOURCE_TYPE_DATABASE_SUMMARY = 'DATABASE_SUMMARY'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exadata resource.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the Exadata resource. English letters, numbers, \"-\", \"_\" and \".\" only.
    # @return [String]
    attr_accessor :display_name

    # The version of the Exadata resource.
    # @return [String]
    attr_accessor :version

    # The internal ID of the Exadata resource.
    # @return [String]
    attr_accessor :internal_id

    # The status of the Exadata resource.
    # @return [String]
    attr_accessor :status

    # The current lifecycle state of the database resource.
    # @return [String]
    attr_reader :lifecycle_state

    # The timestamp of the creation of the Exadata resource.
    # @return [DateTime]
    attr_accessor :time_created

    # The timestamp of the last update of the Exadata resource.
    # @return [DateTime]
    attr_accessor :time_updated

    # The details of the lifecycle state of the Exadata resource.
    # @return [String]
    attr_accessor :lifecycle_details

    # The additional details of the resource defined in `{\"key\": \"value\"}` format.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :additional_details

    # **[Required]** The type of Exadata resource.
    # @return [String]
    attr_reader :resource_type

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
        'resource_type': :'resourceType'
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
        'resource_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'resourceType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DatabaseManagement::Models::ExternalExadataStorageConnector' if type == 'STORAGE_CONNECTOR'
      return 'OCI::DatabaseManagement::Models::ExternalExadataStorageGridSummary' if type == 'STORAGE_GRID_SUMMARY'
      return 'OCI::DatabaseManagement::Models::ExternalExadataStorageServer' if type == 'STORAGE_SERVER'
      return 'OCI::DatabaseManagement::Models::ExternalExadataInfrastructure' if type == 'INFRASTRUCTURE'
      return 'OCI::DatabaseManagement::Models::ExternalExadataStorageGrid' if type == 'STORAGE_GRID'
      return 'OCI::DatabaseManagement::Models::ExternalExadataInfrastructureSummary' if type == 'INFRASTRUCTURE_SUMMARY'
      return 'OCI::DatabaseManagement::Models::ExternalExadataDatabaseSystemSummary' if type == 'DATABASE_SYSTEM_SUMMARY'
      return 'OCI::DatabaseManagement::Models::ExternalExadataStorageConnectorSummary' if type == 'STORAGE_CONNECTOR_SUMMARY'
      return 'OCI::DatabaseManagement::Models::ExternalExadataStorageServerSummary' if type == 'STORAGE_SERVER_SUMMARY'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DatabaseManagement::Models::DbmResource'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [String] :internal_id The value to assign to the {#internal_id} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :additional_details The value to assign to the {#additional_details} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.version = attributes[:'version'] if attributes[:'version']

      self.internal_id = attributes[:'internalId'] if attributes[:'internalId']

      raise 'You cannot provide both :internalId and :internal_id' if attributes.key?(:'internalId') && attributes.key?(:'internal_id')

      self.internal_id = attributes[:'internal_id'] if attributes[:'internal_id']

      self.status = attributes[:'status'] if attributes[:'status']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.additional_details = attributes[:'additionalDetails'] if attributes[:'additionalDetails']

      raise 'You cannot provide both :additionalDetails and :additional_details' if attributes.key?(:'additionalDetails') && attributes.key?(:'additional_details')

      self.additional_details = attributes[:'additional_details'] if attributes[:'additional_details']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      raise "Invalid value for 'lifecycle_state': this must be one of the values in LIFECYCLE_STATE_ENUM." if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)

      @lifecycle_state = lifecycle_state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_type Object to be assigned
    def resource_type=(resource_type)
      raise "Invalid value for 'resource_type': this must be one of the values in RESOURCE_TYPE_ENUM." if resource_type && !RESOURCE_TYPE_ENUM.include?(resource_type)

      @resource_type = resource_type
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
        resource_type == other.resource_type
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
      [id, display_name, version, internal_id, status, lifecycle_state, time_created, time_updated, lifecycle_details, additional_details, resource_type].hash
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
