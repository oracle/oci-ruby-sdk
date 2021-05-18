# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of a job. Jobs are scheduled instances of a job definition.
  class DataCatalog::Models::Job
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_EXPIRED = 'EXPIRED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    JOB_TYPE_ENUM = [
      JOB_TYPE_HARVEST = 'HARVEST'.freeze,
      JOB_TYPE_PROFILING = 'PROFILING'.freeze,
      JOB_TYPE_SAMPLING = 'SAMPLING'.freeze,
      JOB_TYPE_PREVIEW = 'PREVIEW'.freeze,
      JOB_TYPE_IMPORT = 'IMPORT'.freeze,
      JOB_TYPE_EXPORT = 'EXPORT'.freeze,
      JOB_TYPE_IMPORT_GLOSSARY = 'IMPORT_GLOSSARY'.freeze,
      JOB_TYPE_EXPORT_GLOSSARY = 'EXPORT_GLOSSARY'.freeze,
      JOB_TYPE_INTERNAL = 'INTERNAL'.freeze,
      JOB_TYPE_PURGE = 'PURGE'.freeze,
      JOB_TYPE_IMMEDIATE = 'IMMEDIATE'.freeze,
      JOB_TYPE_SCHEDULED = 'SCHEDULED'.freeze,
      JOB_TYPE_IMMEDIATE_EXECUTION = 'IMMEDIATE_EXECUTION'.freeze,
      JOB_TYPE_SCHEDULED_EXECUTION = 'SCHEDULED_EXECUTION'.freeze,
      JOB_TYPE_SCHEDULED_EXECUTION_INSTANCE = 'SCHEDULED_EXECUTION_INSTANCE'.freeze,
      JOB_TYPE_ASYNC_DELETE = 'ASYNC_DELETE'.freeze,
      JOB_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SCHEDULE_TYPE_ENUM = [
      SCHEDULE_TYPE_SCHEDULED = 'SCHEDULED'.freeze,
      SCHEDULE_TYPE_IMMEDIATE = 'IMMEDIATE'.freeze,
      SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique key of the job resource.
    # @return [String]
    attr_accessor :key

    # A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of the job.
    # @return [String]
    attr_accessor :description

    # The data catalog's OCID.
    # @return [String]
    attr_accessor :catalog_id

    # Lifecycle state for job.
    # @return [String]
    attr_reader :lifecycle_state

    # The date and time the job was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Time that this job was last updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # Type of the job.
    # @return [String]
    attr_reader :job_type

    # Schedule specified in the cron expression format that has seven fields for second, minute, hour, day-of-month, month, day-of-week, year.
    # It can also include special characters like * for all and ? for any. There are also pre-defined schedules that can be specified using
    # special strings. For example, @hourly will run the job every hour.
    #
    # @return [String]
    attr_accessor :schedule_cron_expression

    # Date that the schedule should be operational. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_schedule_begin

    # Date that the schedule should end from being operational. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_schedule_end

    # Type of job schedule that is inferred from the scheduling properties.
    # @return [String]
    attr_reader :schedule_type

    # The key of the connection used by the job. This connection will override the default connection specified in
    # the associated job definition. All executions will use this connection.
    #
    # @return [String]
    attr_accessor :connection_key

    # The unique key of the job definition resource that defined the scope of this job.
    # @return [String]
    attr_accessor :job_definition_key

    # Internal version of the job resource.
    # @return [String]
    attr_accessor :internal_version

    # The total number of executions for this job schedule.
    #
    # @return [Integer]
    attr_accessor :execution_count

    # The date and time of the most recent execution for this Job, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_of_latest_execution

    # OCID of the user who created this job.
    # @return [String]
    attr_accessor :created_by_id

    # OCID of the user who updated this job.
    # @return [String]
    attr_accessor :updated_by_id

    # The display name of the job definition resource that defined the scope of this job.
    # @return [String]
    attr_accessor :job_definition_name

    # Unique key of the data asset to which this job applies, if the job involves a data asset.
    # @return [String]
    attr_accessor :data_asset_key

    # Error code returned from the latest job execution for this job. Useful when the latest Job execution is in FAILED state.
    #
    # @return [String]
    attr_accessor :error_code

    # Error message returned from the latest job execution for this job. Useful when the latest Job Execution is in a FAILED state.
    #
    # @return [String]
    attr_accessor :error_message

    # URI to the job instance in the API.
    # @return [String]
    attr_accessor :uri

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'description': :'description',
        'catalog_id': :'catalogId',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'job_type': :'jobType',
        'schedule_cron_expression': :'scheduleCronExpression',
        'time_schedule_begin': :'timeScheduleBegin',
        'time_schedule_end': :'timeScheduleEnd',
        'schedule_type': :'scheduleType',
        'connection_key': :'connectionKey',
        'job_definition_key': :'jobDefinitionKey',
        'internal_version': :'internalVersion',
        'execution_count': :'executionCount',
        'time_of_latest_execution': :'timeOfLatestExecution',
        'created_by_id': :'createdById',
        'updated_by_id': :'updatedById',
        'job_definition_name': :'jobDefinitionName',
        'data_asset_key': :'dataAssetKey',
        'error_code': :'errorCode',
        'error_message': :'errorMessage',
        'uri': :'uri'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'display_name': :'String',
        'description': :'String',
        'catalog_id': :'String',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'job_type': :'String',
        'schedule_cron_expression': :'String',
        'time_schedule_begin': :'DateTime',
        'time_schedule_end': :'DateTime',
        'schedule_type': :'String',
        'connection_key': :'String',
        'job_definition_key': :'String',
        'internal_version': :'String',
        'execution_count': :'Integer',
        'time_of_latest_execution': :'DateTime',
        'created_by_id': :'String',
        'updated_by_id': :'String',
        'job_definition_name': :'String',
        'data_asset_key': :'String',
        'error_code': :'String',
        'error_message': :'String',
        'uri': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :catalog_id The value to assign to the {#catalog_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :job_type The value to assign to the {#job_type} property
    # @option attributes [String] :schedule_cron_expression The value to assign to the {#schedule_cron_expression} property
    # @option attributes [DateTime] :time_schedule_begin The value to assign to the {#time_schedule_begin} property
    # @option attributes [DateTime] :time_schedule_end The value to assign to the {#time_schedule_end} property
    # @option attributes [String] :schedule_type The value to assign to the {#schedule_type} property
    # @option attributes [String] :connection_key The value to assign to the {#connection_key} property
    # @option attributes [String] :job_definition_key The value to assign to the {#job_definition_key} property
    # @option attributes [String] :internal_version The value to assign to the {#internal_version} property
    # @option attributes [Integer] :execution_count The value to assign to the {#execution_count} property
    # @option attributes [DateTime] :time_of_latest_execution The value to assign to the {#time_of_latest_execution} property
    # @option attributes [String] :created_by_id The value to assign to the {#created_by_id} property
    # @option attributes [String] :updated_by_id The value to assign to the {#updated_by_id} property
    # @option attributes [String] :job_definition_name The value to assign to the {#job_definition_name} property
    # @option attributes [String] :data_asset_key The value to assign to the {#data_asset_key} property
    # @option attributes [String] :error_code The value to assign to the {#error_code} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.catalog_id = attributes[:'catalogId'] if attributes[:'catalogId']

      raise 'You cannot provide both :catalogId and :catalog_id' if attributes.key?(:'catalogId') && attributes.key?(:'catalog_id')

      self.catalog_id = attributes[:'catalog_id'] if attributes[:'catalog_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.job_type = attributes[:'jobType'] if attributes[:'jobType']

      raise 'You cannot provide both :jobType and :job_type' if attributes.key?(:'jobType') && attributes.key?(:'job_type')

      self.job_type = attributes[:'job_type'] if attributes[:'job_type']

      self.schedule_cron_expression = attributes[:'scheduleCronExpression'] if attributes[:'scheduleCronExpression']

      raise 'You cannot provide both :scheduleCronExpression and :schedule_cron_expression' if attributes.key?(:'scheduleCronExpression') && attributes.key?(:'schedule_cron_expression')

      self.schedule_cron_expression = attributes[:'schedule_cron_expression'] if attributes[:'schedule_cron_expression']

      self.time_schedule_begin = attributes[:'timeScheduleBegin'] if attributes[:'timeScheduleBegin']

      raise 'You cannot provide both :timeScheduleBegin and :time_schedule_begin' if attributes.key?(:'timeScheduleBegin') && attributes.key?(:'time_schedule_begin')

      self.time_schedule_begin = attributes[:'time_schedule_begin'] if attributes[:'time_schedule_begin']

      self.time_schedule_end = attributes[:'timeScheduleEnd'] if attributes[:'timeScheduleEnd']

      raise 'You cannot provide both :timeScheduleEnd and :time_schedule_end' if attributes.key?(:'timeScheduleEnd') && attributes.key?(:'time_schedule_end')

      self.time_schedule_end = attributes[:'time_schedule_end'] if attributes[:'time_schedule_end']

      self.schedule_type = attributes[:'scheduleType'] if attributes[:'scheduleType']

      raise 'You cannot provide both :scheduleType and :schedule_type' if attributes.key?(:'scheduleType') && attributes.key?(:'schedule_type')

      self.schedule_type = attributes[:'schedule_type'] if attributes[:'schedule_type']

      self.connection_key = attributes[:'connectionKey'] if attributes[:'connectionKey']

      raise 'You cannot provide both :connectionKey and :connection_key' if attributes.key?(:'connectionKey') && attributes.key?(:'connection_key')

      self.connection_key = attributes[:'connection_key'] if attributes[:'connection_key']

      self.job_definition_key = attributes[:'jobDefinitionKey'] if attributes[:'jobDefinitionKey']

      raise 'You cannot provide both :jobDefinitionKey and :job_definition_key' if attributes.key?(:'jobDefinitionKey') && attributes.key?(:'job_definition_key')

      self.job_definition_key = attributes[:'job_definition_key'] if attributes[:'job_definition_key']

      self.internal_version = attributes[:'internalVersion'] if attributes[:'internalVersion']

      raise 'You cannot provide both :internalVersion and :internal_version' if attributes.key?(:'internalVersion') && attributes.key?(:'internal_version')

      self.internal_version = attributes[:'internal_version'] if attributes[:'internal_version']

      self.execution_count = attributes[:'executionCount'] if attributes[:'executionCount']

      raise 'You cannot provide both :executionCount and :execution_count' if attributes.key?(:'executionCount') && attributes.key?(:'execution_count')

      self.execution_count = attributes[:'execution_count'] if attributes[:'execution_count']

      self.time_of_latest_execution = attributes[:'timeOfLatestExecution'] if attributes[:'timeOfLatestExecution']

      raise 'You cannot provide both :timeOfLatestExecution and :time_of_latest_execution' if attributes.key?(:'timeOfLatestExecution') && attributes.key?(:'time_of_latest_execution')

      self.time_of_latest_execution = attributes[:'time_of_latest_execution'] if attributes[:'time_of_latest_execution']

      self.created_by_id = attributes[:'createdById'] if attributes[:'createdById']

      raise 'You cannot provide both :createdById and :created_by_id' if attributes.key?(:'createdById') && attributes.key?(:'created_by_id')

      self.created_by_id = attributes[:'created_by_id'] if attributes[:'created_by_id']

      self.updated_by_id = attributes[:'updatedById'] if attributes[:'updatedById']

      raise 'You cannot provide both :updatedById and :updated_by_id' if attributes.key?(:'updatedById') && attributes.key?(:'updated_by_id')

      self.updated_by_id = attributes[:'updated_by_id'] if attributes[:'updated_by_id']

      self.job_definition_name = attributes[:'jobDefinitionName'] if attributes[:'jobDefinitionName']

      raise 'You cannot provide both :jobDefinitionName and :job_definition_name' if attributes.key?(:'jobDefinitionName') && attributes.key?(:'job_definition_name')

      self.job_definition_name = attributes[:'job_definition_name'] if attributes[:'job_definition_name']

      self.data_asset_key = attributes[:'dataAssetKey'] if attributes[:'dataAssetKey']

      raise 'You cannot provide both :dataAssetKey and :data_asset_key' if attributes.key?(:'dataAssetKey') && attributes.key?(:'data_asset_key')

      self.data_asset_key = attributes[:'data_asset_key'] if attributes[:'data_asset_key']

      self.error_code = attributes[:'errorCode'] if attributes[:'errorCode']

      raise 'You cannot provide both :errorCode and :error_code' if attributes.key?(:'errorCode') && attributes.key?(:'error_code')

      self.error_code = attributes[:'error_code'] if attributes[:'error_code']

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.uri = attributes[:'uri'] if attributes[:'uri']
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
    # @param [Object] job_type Object to be assigned
    def job_type=(job_type)
      # rubocop:disable Style/ConditionalAssignment
      if job_type && !JOB_TYPE_ENUM.include?(job_type)
        OCI.logger.debug("Unknown value for 'job_type' [" + job_type + "]. Mapping to 'JOB_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @job_type = JOB_TYPE_UNKNOWN_ENUM_VALUE
      else
        @job_type = job_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] schedule_type Object to be assigned
    def schedule_type=(schedule_type)
      # rubocop:disable Style/ConditionalAssignment
      if schedule_type && !SCHEDULE_TYPE_ENUM.include?(schedule_type)
        OCI.logger.debug("Unknown value for 'schedule_type' [" + schedule_type + "]. Mapping to 'SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @schedule_type = SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @schedule_type = schedule_type
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
        display_name == other.display_name &&
        description == other.description &&
        catalog_id == other.catalog_id &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        job_type == other.job_type &&
        schedule_cron_expression == other.schedule_cron_expression &&
        time_schedule_begin == other.time_schedule_begin &&
        time_schedule_end == other.time_schedule_end &&
        schedule_type == other.schedule_type &&
        connection_key == other.connection_key &&
        job_definition_key == other.job_definition_key &&
        internal_version == other.internal_version &&
        execution_count == other.execution_count &&
        time_of_latest_execution == other.time_of_latest_execution &&
        created_by_id == other.created_by_id &&
        updated_by_id == other.updated_by_id &&
        job_definition_name == other.job_definition_name &&
        data_asset_key == other.data_asset_key &&
        error_code == other.error_code &&
        error_message == other.error_message &&
        uri == other.uri
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
      [key, display_name, description, catalog_id, lifecycle_state, time_created, time_updated, job_type, schedule_cron_expression, time_schedule_begin, time_schedule_end, schedule_type, connection_key, job_definition_key, internal_version, execution_count, time_of_latest_execution, created_by_id, updated_by_id, job_definition_name, data_asset_key, error_code, error_message, uri].hash
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
