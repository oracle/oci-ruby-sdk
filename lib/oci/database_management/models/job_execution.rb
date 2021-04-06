# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of a job execution.
  class DatabaseManagement::Models::JobExecution
    STATUS_ENUM = [
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The identifier of the job execution.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the job execution.
    # @return [String]
    attr_accessor :name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which the parent job resides.
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group where the parent job has to be executed.
    # @return [String]
    attr_accessor :managed_database_group_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database associated with the job execution.
    # @return [String]
    attr_accessor :managed_database_id

    # **[Required]** The name of the Managed Database associated with the job execution.
    # @return [String]
    attr_accessor :managed_database_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the parent job.
    # @return [String]
    attr_accessor :job_id

    # **[Required]** The name of the parent job.
    # @return [String]
    attr_accessor :job_name

    # **[Required]** The identifier of the associated job run.
    # @return [String]
    attr_accessor :job_run_id

    # **[Required]** The status of the job execution.
    # @return [String]
    attr_reader :status

    # The error message that is returned if the job execution fails. Null is returned if the job is
    # still running or if the job execution is successful.
    #
    # @return [String]
    attr_accessor :error_message

    # @return [OCI::DatabaseManagement::Models::JobExecutionResultDetails]
    attr_accessor :result_details

    # **[Required]** The date and time when the job execution was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time when the job execution completed.
    # @return [DateTime]
    attr_accessor :time_completed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'managed_database_group_id': :'managedDatabaseGroupId',
        'managed_database_id': :'managedDatabaseId',
        'managed_database_name': :'managedDatabaseName',
        'job_id': :'jobId',
        'job_name': :'jobName',
        'job_run_id': :'jobRunId',
        'status': :'status',
        'error_message': :'errorMessage',
        'result_details': :'resultDetails',
        'time_created': :'timeCreated',
        'time_completed': :'timeCompleted'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'managed_database_group_id': :'String',
        'managed_database_id': :'String',
        'managed_database_name': :'String',
        'job_id': :'String',
        'job_name': :'String',
        'job_run_id': :'String',
        'status': :'String',
        'error_message': :'String',
        'result_details': :'OCI::DatabaseManagement::Models::JobExecutionResultDetails',
        'time_created': :'DateTime',
        'time_completed': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :managed_database_group_id The value to assign to the {#managed_database_group_id} property
    # @option attributes [String] :managed_database_id The value to assign to the {#managed_database_id} property
    # @option attributes [String] :managed_database_name The value to assign to the {#managed_database_name} property
    # @option attributes [String] :job_id The value to assign to the {#job_id} property
    # @option attributes [String] :job_name The value to assign to the {#job_name} property
    # @option attributes [String] :job_run_id The value to assign to the {#job_run_id} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [OCI::DatabaseManagement::Models::JobExecutionResultDetails] :result_details The value to assign to the {#result_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_completed The value to assign to the {#time_completed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.managed_database_group_id = attributes[:'managedDatabaseGroupId'] if attributes[:'managedDatabaseGroupId']

      raise 'You cannot provide both :managedDatabaseGroupId and :managed_database_group_id' if attributes.key?(:'managedDatabaseGroupId') && attributes.key?(:'managed_database_group_id')

      self.managed_database_group_id = attributes[:'managed_database_group_id'] if attributes[:'managed_database_group_id']

      self.managed_database_id = attributes[:'managedDatabaseId'] if attributes[:'managedDatabaseId']

      raise 'You cannot provide both :managedDatabaseId and :managed_database_id' if attributes.key?(:'managedDatabaseId') && attributes.key?(:'managed_database_id')

      self.managed_database_id = attributes[:'managed_database_id'] if attributes[:'managed_database_id']

      self.managed_database_name = attributes[:'managedDatabaseName'] if attributes[:'managedDatabaseName']

      raise 'You cannot provide both :managedDatabaseName and :managed_database_name' if attributes.key?(:'managedDatabaseName') && attributes.key?(:'managed_database_name')

      self.managed_database_name = attributes[:'managed_database_name'] if attributes[:'managed_database_name']

      self.job_id = attributes[:'jobId'] if attributes[:'jobId']

      raise 'You cannot provide both :jobId and :job_id' if attributes.key?(:'jobId') && attributes.key?(:'job_id')

      self.job_id = attributes[:'job_id'] if attributes[:'job_id']

      self.job_name = attributes[:'jobName'] if attributes[:'jobName']

      raise 'You cannot provide both :jobName and :job_name' if attributes.key?(:'jobName') && attributes.key?(:'job_name')

      self.job_name = attributes[:'job_name'] if attributes[:'job_name']

      self.job_run_id = attributes[:'jobRunId'] if attributes[:'jobRunId']

      raise 'You cannot provide both :jobRunId and :job_run_id' if attributes.key?(:'jobRunId') && attributes.key?(:'job_run_id')

      self.job_run_id = attributes[:'job_run_id'] if attributes[:'job_run_id']

      self.status = attributes[:'status'] if attributes[:'status']

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.result_details = attributes[:'resultDetails'] if attributes[:'resultDetails']

      raise 'You cannot provide both :resultDetails and :result_details' if attributes.key?(:'resultDetails') && attributes.key?(:'result_details')

      self.result_details = attributes[:'result_details'] if attributes[:'result_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_completed = attributes[:'timeCompleted'] if attributes[:'timeCompleted']

      raise 'You cannot provide both :timeCompleted and :time_completed' if attributes.key?(:'timeCompleted') && attributes.key?(:'time_completed')

      self.time_completed = attributes[:'time_completed'] if attributes[:'time_completed']
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
        id == other.id &&
        name == other.name &&
        compartment_id == other.compartment_id &&
        managed_database_group_id == other.managed_database_group_id &&
        managed_database_id == other.managed_database_id &&
        managed_database_name == other.managed_database_name &&
        job_id == other.job_id &&
        job_name == other.job_name &&
        job_run_id == other.job_run_id &&
        status == other.status &&
        error_message == other.error_message &&
        result_details == other.result_details &&
        time_created == other.time_created &&
        time_completed == other.time_completed
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
      [id, name, compartment_id, managed_database_group_id, managed_database_id, managed_database_name, job_id, job_name, job_run_id, status, error_message, result_details, time_created, time_completed].hash
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
