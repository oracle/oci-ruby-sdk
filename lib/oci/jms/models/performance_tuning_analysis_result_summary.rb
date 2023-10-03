# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210610
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a performance tuning analysis result. The actual output of the analysis is stored in the Object Storage object.
  class Jms::Models::PerformanceTuningAnalysisResultSummary
    RESULT_ENUM = [
      RESULT_ACTION_RECOMMENDED = 'ACTION_RECOMMENDED'.freeze,
      RESULT_NO_WARNINGS = 'NO_WARNINGS'.freeze,
      RESULT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID to identify this analysis results.
    # @return [String]
    attr_accessor :id

    # The OCID of the work request to start the analysis.
    # @return [String]
    attr_accessor :work_request_id

    # **[Required]** The fleet OCID.
    # @return [String]
    attr_accessor :fleet_id

    # **[Required]** The OCID of the application for which the report has been generated.
    # @return [String]
    attr_accessor :application_id

    # **[Required]** The internal identifier of the application installation for which the report has been generated.
    # @return [String]
    attr_accessor :application_installation_id

    # **[Required]** The installation path of the application for which the report has been generated.
    # @return [String]
    attr_accessor :application_installation_path

    # **[Required]** Total number of warnings reported by the analysis.
    # @return [Integer]
    attr_accessor :warning_count

    # **[Required]** Result of the analysis based on whether warnings have been found or not.
    # @return [String]
    attr_reader :result

    # **[Required]** The managed instance OCID.
    # @return [String]
    attr_accessor :managed_instance_id

    # **[Required]** The hostname of the managed instance.
    # @return [String]
    attr_accessor :host_name

    # **[Required]** The name of the application for which the report has been generated.
    # @return [String]
    attr_accessor :application_name

    # **[Required]** The Object Storage namespace of this analysis result.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The Object Storage bucket name of this analysis result.
    # @return [String]
    attr_accessor :bucket_name

    # **[Required]** The Object Storage object name of this analysis result.
    # @return [String]
    attr_accessor :object_name

    # **[Required]** The time the result is compiled.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The time the JFR capture started.
    # @return [DateTime]
    attr_accessor :time_started

    # **[Required]** The time the JFR capture finished.
    # @return [DateTime]
    attr_accessor :time_finished

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'work_request_id': :'workRequestId',
        'fleet_id': :'fleetId',
        'application_id': :'applicationId',
        'application_installation_id': :'applicationInstallationId',
        'application_installation_path': :'applicationInstallationPath',
        'warning_count': :'warningCount',
        'result': :'result',
        'managed_instance_id': :'managedInstanceId',
        'host_name': :'hostName',
        'application_name': :'applicationName',
        'namespace': :'namespace',
        'bucket_name': :'bucketName',
        'object_name': :'objectName',
        'time_created': :'timeCreated',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished'
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
        'application_id': :'String',
        'application_installation_id': :'String',
        'application_installation_path': :'String',
        'warning_count': :'Integer',
        'result': :'String',
        'managed_instance_id': :'String',
        'host_name': :'String',
        'application_name': :'String',
        'namespace': :'String',
        'bucket_name': :'String',
        'object_name': :'String',
        'time_created': :'DateTime',
        'time_started': :'DateTime',
        'time_finished': :'DateTime'
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
    # @option attributes [String] :application_id The value to assign to the {#application_id} property
    # @option attributes [String] :application_installation_id The value to assign to the {#application_installation_id} property
    # @option attributes [String] :application_installation_path The value to assign to the {#application_installation_path} property
    # @option attributes [Integer] :warning_count The value to assign to the {#warning_count} property
    # @option attributes [String] :result The value to assign to the {#result} property
    # @option attributes [String] :managed_instance_id The value to assign to the {#managed_instance_id} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :application_name The value to assign to the {#application_name} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.work_request_id = attributes[:'workRequestId'] if attributes[:'workRequestId']

      raise 'You cannot provide both :workRequestId and :work_request_id' if attributes.key?(:'workRequestId') && attributes.key?(:'work_request_id')

      self.work_request_id = attributes[:'work_request_id'] if attributes[:'work_request_id']

      self.fleet_id = attributes[:'fleetId'] if attributes[:'fleetId']

      raise 'You cannot provide both :fleetId and :fleet_id' if attributes.key?(:'fleetId') && attributes.key?(:'fleet_id')

      self.fleet_id = attributes[:'fleet_id'] if attributes[:'fleet_id']

      self.application_id = attributes[:'applicationId'] if attributes[:'applicationId']

      raise 'You cannot provide both :applicationId and :application_id' if attributes.key?(:'applicationId') && attributes.key?(:'application_id')

      self.application_id = attributes[:'application_id'] if attributes[:'application_id']

      self.application_installation_id = attributes[:'applicationInstallationId'] if attributes[:'applicationInstallationId']

      raise 'You cannot provide both :applicationInstallationId and :application_installation_id' if attributes.key?(:'applicationInstallationId') && attributes.key?(:'application_installation_id')

      self.application_installation_id = attributes[:'application_installation_id'] if attributes[:'application_installation_id']

      self.application_installation_path = attributes[:'applicationInstallationPath'] if attributes[:'applicationInstallationPath']

      raise 'You cannot provide both :applicationInstallationPath and :application_installation_path' if attributes.key?(:'applicationInstallationPath') && attributes.key?(:'application_installation_path')

      self.application_installation_path = attributes[:'application_installation_path'] if attributes[:'application_installation_path']

      self.warning_count = attributes[:'warningCount'] if attributes[:'warningCount']

      raise 'You cannot provide both :warningCount and :warning_count' if attributes.key?(:'warningCount') && attributes.key?(:'warning_count')

      self.warning_count = attributes[:'warning_count'] if attributes[:'warning_count']

      self.result = attributes[:'result'] if attributes[:'result']

      self.managed_instance_id = attributes[:'managedInstanceId'] if attributes[:'managedInstanceId']

      raise 'You cannot provide both :managedInstanceId and :managed_instance_id' if attributes.key?(:'managedInstanceId') && attributes.key?(:'managed_instance_id')

      self.managed_instance_id = attributes[:'managed_instance_id'] if attributes[:'managed_instance_id']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.application_name = attributes[:'applicationName'] if attributes[:'applicationName']

      raise 'You cannot provide both :applicationName and :application_name' if attributes.key?(:'applicationName') && attributes.key?(:'application_name')

      self.application_name = attributes[:'application_name'] if attributes[:'application_name']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] result Object to be assigned
    def result=(result)
      # rubocop:disable Style/ConditionalAssignment
      if result && !RESULT_ENUM.include?(result)
        OCI.logger.debug("Unknown value for 'result' [" + result + "]. Mapping to 'RESULT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @result = RESULT_UNKNOWN_ENUM_VALUE
      else
        @result = result
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
        application_id == other.application_id &&
        application_installation_id == other.application_installation_id &&
        application_installation_path == other.application_installation_path &&
        warning_count == other.warning_count &&
        result == other.result &&
        managed_instance_id == other.managed_instance_id &&
        host_name == other.host_name &&
        application_name == other.application_name &&
        namespace == other.namespace &&
        bucket_name == other.bucket_name &&
        object_name == other.object_name &&
        time_created == other.time_created &&
        time_started == other.time_started &&
        time_finished == other.time_finished
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
      [id, work_request_id, fleet_id, application_id, application_installation_id, application_installation_path, warning_count, result, managed_instance_id, host_name, application_name, namespace, bucket_name, object_name, time_created, time_started, time_finished].hash
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
