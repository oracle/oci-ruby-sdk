# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210610
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Result of the Java migration analysis. The analysis result is stored in an Object Storage bucket.
  class Jms::Models::JavaMigrationAnalysisResult
    APPLICATION_EXECUTION_TYPE_ENUM = [
      APPLICATION_EXECUTION_TYPE_INSTALLED = 'INSTALLED'.freeze,
      APPLICATION_EXECUTION_TYPE_DEPLOYED = 'DEPLOYED'.freeze,
      APPLICATION_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the migration analysis report.
    # @return [String]
    attr_accessor :id

    # The OCID of the work request of this analysis.
    # @return [String]
    attr_accessor :work_request_id

    # **[Required]** The fleet OCID.
    # @return [String]
    attr_accessor :fleet_id

    # The unique key that identifies the application.
    # @return [String]
    attr_accessor :application_key

    # **[Required]** The name of the application for which the Java migration analysis was performed.
    # @return [String]
    attr_accessor :application_name

    # **[Required]** The installation path of the application for which the Java migration analysis was performed.
    # @return [String]
    attr_accessor :application_path

    # **[Required]** Execution type of the application for an application type, such as WAR and EAR, that is deployed or installed.
    # @return [String]
    attr_reader :application_execution_type

    # **[Required]** The source JDK version of the application that's currently running.
    # @return [String]
    attr_accessor :source_jdk_version

    # **[Required]** The target JDK version of the application to be migrated.
    # @return [String]
    attr_accessor :target_jdk_version

    # The managed instance OCID.
    # @return [String]
    attr_accessor :managed_instance_id

    # The hostname of the managed instance that hosts the application for which the Java migration analysis was performed.
    # @return [String]
    attr_accessor :host_name

    # The time the result is compiled.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The object storage namespace that contains the results of the migration analysis.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The name of the object storage bucket that contains the results of the migration analysis.
    # @return [String]
    attr_accessor :bucket_name

    # **[Required]** The directory path of the object storage bucket that contains the results of the migration analysis.
    # @return [String]
    attr_accessor :object_storage_upload_dir_path

    # **[Required]** The names of the object storage objects that contain the results of the migration analysis.
    # @return [Array<String>]
    attr_accessor :object_list

    # **[Required]** Additional info reserved for future use.
    # @return [String]
    attr_accessor :metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'work_request_id': :'workRequestId',
        'fleet_id': :'fleetId',
        'application_key': :'applicationKey',
        'application_name': :'applicationName',
        'application_path': :'applicationPath',
        'application_execution_type': :'applicationExecutionType',
        'source_jdk_version': :'sourceJdkVersion',
        'target_jdk_version': :'targetJdkVersion',
        'managed_instance_id': :'managedInstanceId',
        'host_name': :'hostName',
        'time_created': :'timeCreated',
        'namespace': :'namespace',
        'bucket_name': :'bucketName',
        'object_storage_upload_dir_path': :'objectStorageUploadDirPath',
        'object_list': :'objectList',
        'metadata': :'metadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'work_request_id': :'String',
        'fleet_id': :'String',
        'application_key': :'String',
        'application_name': :'String',
        'application_path': :'String',
        'application_execution_type': :'String',
        'source_jdk_version': :'String',
        'target_jdk_version': :'String',
        'managed_instance_id': :'String',
        'host_name': :'String',
        'time_created': :'DateTime',
        'namespace': :'String',
        'bucket_name': :'String',
        'object_storage_upload_dir_path': :'String',
        'object_list': :'Array<String>',
        'metadata': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :work_request_id The value to assign to the {#work_request_id} property
    # @option attributes [String] :fleet_id The value to assign to the {#fleet_id} property
    # @option attributes [String] :application_key The value to assign to the {#application_key} property
    # @option attributes [String] :application_name The value to assign to the {#application_name} property
    # @option attributes [String] :application_path The value to assign to the {#application_path} property
    # @option attributes [String] :application_execution_type The value to assign to the {#application_execution_type} property
    # @option attributes [String] :source_jdk_version The value to assign to the {#source_jdk_version} property
    # @option attributes [String] :target_jdk_version The value to assign to the {#target_jdk_version} property
    # @option attributes [String] :managed_instance_id The value to assign to the {#managed_instance_id} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :object_storage_upload_dir_path The value to assign to the {#object_storage_upload_dir_path} property
    # @option attributes [Array<String>] :object_list The value to assign to the {#object_list} property
    # @option attributes [String] :metadata The value to assign to the {#metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.work_request_id = attributes[:'workRequestId'] if attributes[:'workRequestId']

      raise 'You cannot provide both :workRequestId and :work_request_id' if attributes.key?(:'workRequestId') && attributes.key?(:'work_request_id')

      self.work_request_id = attributes[:'work_request_id'] if attributes[:'work_request_id']

      self.fleet_id = attributes[:'fleetId'] if attributes[:'fleetId']

      raise 'You cannot provide both :fleetId and :fleet_id' if attributes.key?(:'fleetId') && attributes.key?(:'fleet_id')

      self.fleet_id = attributes[:'fleet_id'] if attributes[:'fleet_id']

      self.application_key = attributes[:'applicationKey'] if attributes[:'applicationKey']

      raise 'You cannot provide both :applicationKey and :application_key' if attributes.key?(:'applicationKey') && attributes.key?(:'application_key')

      self.application_key = attributes[:'application_key'] if attributes[:'application_key']

      self.application_name = attributes[:'applicationName'] if attributes[:'applicationName']

      raise 'You cannot provide both :applicationName and :application_name' if attributes.key?(:'applicationName') && attributes.key?(:'application_name')

      self.application_name = attributes[:'application_name'] if attributes[:'application_name']

      self.application_path = attributes[:'applicationPath'] if attributes[:'applicationPath']

      raise 'You cannot provide both :applicationPath and :application_path' if attributes.key?(:'applicationPath') && attributes.key?(:'application_path')

      self.application_path = attributes[:'application_path'] if attributes[:'application_path']

      self.application_execution_type = attributes[:'applicationExecutionType'] if attributes[:'applicationExecutionType']

      raise 'You cannot provide both :applicationExecutionType and :application_execution_type' if attributes.key?(:'applicationExecutionType') && attributes.key?(:'application_execution_type')

      self.application_execution_type = attributes[:'application_execution_type'] if attributes[:'application_execution_type']

      self.source_jdk_version = attributes[:'sourceJdkVersion'] if attributes[:'sourceJdkVersion']

      raise 'You cannot provide both :sourceJdkVersion and :source_jdk_version' if attributes.key?(:'sourceJdkVersion') && attributes.key?(:'source_jdk_version')

      self.source_jdk_version = attributes[:'source_jdk_version'] if attributes[:'source_jdk_version']

      self.target_jdk_version = attributes[:'targetJdkVersion'] if attributes[:'targetJdkVersion']

      raise 'You cannot provide both :targetJdkVersion and :target_jdk_version' if attributes.key?(:'targetJdkVersion') && attributes.key?(:'target_jdk_version')

      self.target_jdk_version = attributes[:'target_jdk_version'] if attributes[:'target_jdk_version']

      self.managed_instance_id = attributes[:'managedInstanceId'] if attributes[:'managedInstanceId']

      raise 'You cannot provide both :managedInstanceId and :managed_instance_id' if attributes.key?(:'managedInstanceId') && attributes.key?(:'managed_instance_id')

      self.managed_instance_id = attributes[:'managed_instance_id'] if attributes[:'managed_instance_id']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.object_storage_upload_dir_path = attributes[:'objectStorageUploadDirPath'] if attributes[:'objectStorageUploadDirPath']

      raise 'You cannot provide both :objectStorageUploadDirPath and :object_storage_upload_dir_path' if attributes.key?(:'objectStorageUploadDirPath') && attributes.key?(:'object_storage_upload_dir_path')

      self.object_storage_upload_dir_path = attributes[:'object_storage_upload_dir_path'] if attributes[:'object_storage_upload_dir_path']

      self.object_list = attributes[:'objectList'] if attributes[:'objectList']

      raise 'You cannot provide both :objectList and :object_list' if attributes.key?(:'objectList') && attributes.key?(:'object_list')

      self.object_list = attributes[:'object_list'] if attributes[:'object_list']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] application_execution_type Object to be assigned
    def application_execution_type=(application_execution_type)
      # rubocop:disable Style/ConditionalAssignment
      if application_execution_type && !APPLICATION_EXECUTION_TYPE_ENUM.include?(application_execution_type)
        OCI.logger.debug("Unknown value for 'application_execution_type' [" + application_execution_type + "]. Mapping to 'APPLICATION_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @application_execution_type = APPLICATION_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @application_execution_type = application_execution_type
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
        work_request_id == other.work_request_id &&
        fleet_id == other.fleet_id &&
        application_key == other.application_key &&
        application_name == other.application_name &&
        application_path == other.application_path &&
        application_execution_type == other.application_execution_type &&
        source_jdk_version == other.source_jdk_version &&
        target_jdk_version == other.target_jdk_version &&
        managed_instance_id == other.managed_instance_id &&
        host_name == other.host_name &&
        time_created == other.time_created &&
        namespace == other.namespace &&
        bucket_name == other.bucket_name &&
        object_storage_upload_dir_path == other.object_storage_upload_dir_path &&
        object_list == other.object_list &&
        metadata == other.metadata
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
      [id, work_request_id, fleet_id, application_key, application_name, application_path, application_execution_type, source_jdk_version, target_jdk_version, managed_instance_id, host_name, time_created, namespace, bucket_name, object_storage_upload_dir_path, object_list, metadata].hash
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