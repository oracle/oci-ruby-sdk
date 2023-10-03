# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200430
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Import metadata object response.
  class DataIntegration::Models::ImportRequest
    STATUS_ENUM = [
      STATUS_SUCCESSFUL = 'SUCCESSFUL'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_TERMINATING = 'TERMINATING'.freeze,
      STATUS_TERMINATED = 'TERMINATED'.freeze,
      STATUS_QUEUED = 'QUEUED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Import object request key
    # @return [String]
    attr_accessor :key

    # The name of the Object Storage Bucket where the objects will be imported from
    # @return [String]
    attr_accessor :bucket_name

    # Name of the zip file from which objects will be imported.
    # @return [String]
    attr_accessor :file_name

    # Optional parameter to point to object storage tenancy (if using Object Storage of different tenancy)
    # @return [String]
    attr_accessor :object_storage_tenancy_id

    # Region of the object storage (if using object storage of different region)
    # @return [String]
    attr_accessor :object_storage_region

    # Key of the object inside which all the objects will be imported
    # @return [String]
    attr_accessor :object_key_for_import

    # @return [OCI::DataIntegration::Models::ImportConflictResolution]
    attr_accessor :import_conflict_resolution

    # Import Objects request status.
    # @return [String]
    attr_reader :status

    # Name of the user who initiated import request.
    # @return [String]
    attr_accessor :created_by

    # Number of objects that are imported.
    # @return [Integer]
    attr_accessor :total_imported_object_count

    # Time at which the request started getting processed.
    # @return [Integer]
    attr_accessor :time_started_in_millis

    # Time at which the request was completely processed.
    # @return [Integer]
    attr_accessor :time_ended_in_millis

    # Contains key of the error
    # @return [Hash<String, String>]
    attr_accessor :error_messages

    # The array of imported object details.
    # @return [Array<OCI::DataIntegration::Models::ImportObjectMetadataSummary>]
    attr_accessor :imported_objects

    # Name of the import request.
    # @return [String]
    attr_accessor :name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'bucket_name': :'bucketName',
        'file_name': :'fileName',
        'object_storage_tenancy_id': :'objectStorageTenancyId',
        'object_storage_region': :'objectStorageRegion',
        'object_key_for_import': :'objectKeyForImport',
        'import_conflict_resolution': :'importConflictResolution',
        'status': :'status',
        'created_by': :'createdBy',
        'total_imported_object_count': :'totalImportedObjectCount',
        'time_started_in_millis': :'timeStartedInMillis',
        'time_ended_in_millis': :'timeEndedInMillis',
        'error_messages': :'errorMessages',
        'imported_objects': :'importedObjects',
        'name': :'name'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'bucket_name': :'String',
        'file_name': :'String',
        'object_storage_tenancy_id': :'String',
        'object_storage_region': :'String',
        'object_key_for_import': :'String',
        'import_conflict_resolution': :'OCI::DataIntegration::Models::ImportConflictResolution',
        'status': :'String',
        'created_by': :'String',
        'total_imported_object_count': :'Integer',
        'time_started_in_millis': :'Integer',
        'time_ended_in_millis': :'Integer',
        'error_messages': :'Hash<String, String>',
        'imported_objects': :'Array<OCI::DataIntegration::Models::ImportObjectMetadataSummary>',
        'name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :file_name The value to assign to the {#file_name} property
    # @option attributes [String] :object_storage_tenancy_id The value to assign to the {#object_storage_tenancy_id} property
    # @option attributes [String] :object_storage_region The value to assign to the {#object_storage_region} property
    # @option attributes [String] :object_key_for_import The value to assign to the {#object_key_for_import} property
    # @option attributes [OCI::DataIntegration::Models::ImportConflictResolution] :import_conflict_resolution The value to assign to the {#import_conflict_resolution} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [Integer] :total_imported_object_count The value to assign to the {#total_imported_object_count} property
    # @option attributes [Integer] :time_started_in_millis The value to assign to the {#time_started_in_millis} property
    # @option attributes [Integer] :time_ended_in_millis The value to assign to the {#time_ended_in_millis} property
    # @option attributes [Hash<String, String>] :error_messages The value to assign to the {#error_messages} property
    # @option attributes [Array<OCI::DataIntegration::Models::ImportObjectMetadataSummary>] :imported_objects The value to assign to the {#imported_objects} property
    # @option attributes [String] :name The value to assign to the {#name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.file_name = attributes[:'fileName'] if attributes[:'fileName']

      raise 'You cannot provide both :fileName and :file_name' if attributes.key?(:'fileName') && attributes.key?(:'file_name')

      self.file_name = attributes[:'file_name'] if attributes[:'file_name']

      self.object_storage_tenancy_id = attributes[:'objectStorageTenancyId'] if attributes[:'objectStorageTenancyId']

      raise 'You cannot provide both :objectStorageTenancyId and :object_storage_tenancy_id' if attributes.key?(:'objectStorageTenancyId') && attributes.key?(:'object_storage_tenancy_id')

      self.object_storage_tenancy_id = attributes[:'object_storage_tenancy_id'] if attributes[:'object_storage_tenancy_id']

      self.object_storage_region = attributes[:'objectStorageRegion'] if attributes[:'objectStorageRegion']

      raise 'You cannot provide both :objectStorageRegion and :object_storage_region' if attributes.key?(:'objectStorageRegion') && attributes.key?(:'object_storage_region')

      self.object_storage_region = attributes[:'object_storage_region'] if attributes[:'object_storage_region']

      self.object_key_for_import = attributes[:'objectKeyForImport'] if attributes[:'objectKeyForImport']

      raise 'You cannot provide both :objectKeyForImport and :object_key_for_import' if attributes.key?(:'objectKeyForImport') && attributes.key?(:'object_key_for_import')

      self.object_key_for_import = attributes[:'object_key_for_import'] if attributes[:'object_key_for_import']

      self.import_conflict_resolution = attributes[:'importConflictResolution'] if attributes[:'importConflictResolution']

      raise 'You cannot provide both :importConflictResolution and :import_conflict_resolution' if attributes.key?(:'importConflictResolution') && attributes.key?(:'import_conflict_resolution')

      self.import_conflict_resolution = attributes[:'import_conflict_resolution'] if attributes[:'import_conflict_resolution']

      self.status = attributes[:'status'] if attributes[:'status']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.total_imported_object_count = attributes[:'totalImportedObjectCount'] if attributes[:'totalImportedObjectCount']

      raise 'You cannot provide both :totalImportedObjectCount and :total_imported_object_count' if attributes.key?(:'totalImportedObjectCount') && attributes.key?(:'total_imported_object_count')

      self.total_imported_object_count = attributes[:'total_imported_object_count'] if attributes[:'total_imported_object_count']

      self.time_started_in_millis = attributes[:'timeStartedInMillis'] if attributes[:'timeStartedInMillis']

      raise 'You cannot provide both :timeStartedInMillis and :time_started_in_millis' if attributes.key?(:'timeStartedInMillis') && attributes.key?(:'time_started_in_millis')

      self.time_started_in_millis = attributes[:'time_started_in_millis'] if attributes[:'time_started_in_millis']

      self.time_ended_in_millis = attributes[:'timeEndedInMillis'] if attributes[:'timeEndedInMillis']

      raise 'You cannot provide both :timeEndedInMillis and :time_ended_in_millis' if attributes.key?(:'timeEndedInMillis') && attributes.key?(:'time_ended_in_millis')

      self.time_ended_in_millis = attributes[:'time_ended_in_millis'] if attributes[:'time_ended_in_millis']

      self.error_messages = attributes[:'errorMessages'] if attributes[:'errorMessages']

      raise 'You cannot provide both :errorMessages and :error_messages' if attributes.key?(:'errorMessages') && attributes.key?(:'error_messages')

      self.error_messages = attributes[:'error_messages'] if attributes[:'error_messages']

      self.imported_objects = attributes[:'importedObjects'] if attributes[:'importedObjects']

      raise 'You cannot provide both :importedObjects and :imported_objects' if attributes.key?(:'importedObjects') && attributes.key?(:'imported_objects')

      self.imported_objects = attributes[:'imported_objects'] if attributes[:'imported_objects']

      self.name = attributes[:'name'] if attributes[:'name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        bucket_name == other.bucket_name &&
        file_name == other.file_name &&
        object_storage_tenancy_id == other.object_storage_tenancy_id &&
        object_storage_region == other.object_storage_region &&
        object_key_for_import == other.object_key_for_import &&
        import_conflict_resolution == other.import_conflict_resolution &&
        status == other.status &&
        created_by == other.created_by &&
        total_imported_object_count == other.total_imported_object_count &&
        time_started_in_millis == other.time_started_in_millis &&
        time_ended_in_millis == other.time_ended_in_millis &&
        error_messages == other.error_messages &&
        imported_objects == other.imported_objects &&
        name == other.name
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
      [key, bucket_name, file_name, object_storage_tenancy_id, object_storage_region, object_key_for_import, import_conflict_resolution, status, created_by, total_imported_object_count, time_started_in_millis, time_ended_in_millis, error_messages, imported_objects, name].hash
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
