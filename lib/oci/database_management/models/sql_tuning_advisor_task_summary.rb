# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of a SQL Tuning Advisor task.
  class DatabaseManagement::Models::SqlTuningAdvisorTaskSummary
    TASK_STATUS_ENUM = [
      TASK_STATUS_COMPLETED = 'COMPLETED'.freeze,
      TASK_STATUS_INITIAL = 'INITIAL'.freeze,
      TASK_STATUS_EXECUTING = 'EXECUTING'.freeze,
      TASK_STATUS_INTERRUPTED = 'INTERRUPTED'.freeze,
      TASK_STATUS_ERROR = 'ERROR'.freeze,
      TASK_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique identifier of the SQL Tuning Advisor task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [Integer]
    attr_accessor :sql_tuning_advisor_task_id

    # The instance ID of the SQL Tuning Advisor task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [Integer]
    attr_accessor :instance_id

    # The name of the SQL Tuning Advisor task.
    # @return [String]
    attr_accessor :name

    # The description of the SQL Tuning Advisor task.
    # @return [String]
    attr_accessor :description

    # The owner of the SQL Tuning Advisor task.
    # @return [String]
    attr_accessor :owner

    # The Creation date of the SQL Tuning Advisor task.
    # @return [DateTime]
    attr_accessor :time_created

    # The status of the SQL Tuning Advisor task.
    # @return [String]
    attr_reader :task_status

    # The number of days left before the task expires. If the value equals -1, then the task has no expiration time (UNLIMITED).
    # @return [Integer]
    attr_accessor :days_to_expire

    # The start time of the task execution.
    # @return [DateTime]
    attr_accessor :time_execution_started

    # The end time of the task execution.
    # @return [DateTime]
    attr_accessor :time_execution_ended

    # The total number of SQL statements related to the SQL Tuning Advisor task.
    # @return [Integer]
    attr_accessor :total_sql_statements

    # The number of recommendations provided for the SQL Tuning Advisor task.
    # @return [Integer]
    attr_accessor :recommendation_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_tuning_advisor_task_id': :'sqlTuningAdvisorTaskId',
        'instance_id': :'instanceId',
        'name': :'name',
        'description': :'description',
        'owner': :'owner',
        'time_created': :'timeCreated',
        'task_status': :'taskStatus',
        'days_to_expire': :'daysToExpire',
        'time_execution_started': :'timeExecutionStarted',
        'time_execution_ended': :'timeExecutionEnded',
        'total_sql_statements': :'totalSqlStatements',
        'recommendation_count': :'recommendationCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_tuning_advisor_task_id': :'Integer',
        'instance_id': :'Integer',
        'name': :'String',
        'description': :'String',
        'owner': :'String',
        'time_created': :'DateTime',
        'task_status': :'String',
        'days_to_expire': :'Integer',
        'time_execution_started': :'DateTime',
        'time_execution_ended': :'DateTime',
        'total_sql_statements': :'Integer',
        'recommendation_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :sql_tuning_advisor_task_id The value to assign to the {#sql_tuning_advisor_task_id} property
    # @option attributes [Integer] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :owner The value to assign to the {#owner} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :task_status The value to assign to the {#task_status} property
    # @option attributes [Integer] :days_to_expire The value to assign to the {#days_to_expire} property
    # @option attributes [DateTime] :time_execution_started The value to assign to the {#time_execution_started} property
    # @option attributes [DateTime] :time_execution_ended The value to assign to the {#time_execution_ended} property
    # @option attributes [Integer] :total_sql_statements The value to assign to the {#total_sql_statements} property
    # @option attributes [Integer] :recommendation_count The value to assign to the {#recommendation_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sql_tuning_advisor_task_id = attributes[:'sqlTuningAdvisorTaskId'] if attributes[:'sqlTuningAdvisorTaskId']

      raise 'You cannot provide both :sqlTuningAdvisorTaskId and :sql_tuning_advisor_task_id' if attributes.key?(:'sqlTuningAdvisorTaskId') && attributes.key?(:'sql_tuning_advisor_task_id')

      self.sql_tuning_advisor_task_id = attributes[:'sql_tuning_advisor_task_id'] if attributes[:'sql_tuning_advisor_task_id']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.owner = attributes[:'owner'] if attributes[:'owner']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.task_status = attributes[:'taskStatus'] if attributes[:'taskStatus']

      raise 'You cannot provide both :taskStatus and :task_status' if attributes.key?(:'taskStatus') && attributes.key?(:'task_status')

      self.task_status = attributes[:'task_status'] if attributes[:'task_status']

      self.days_to_expire = attributes[:'daysToExpire'] if attributes[:'daysToExpire']

      raise 'You cannot provide both :daysToExpire and :days_to_expire' if attributes.key?(:'daysToExpire') && attributes.key?(:'days_to_expire')

      self.days_to_expire = attributes[:'days_to_expire'] if attributes[:'days_to_expire']

      self.time_execution_started = attributes[:'timeExecutionStarted'] if attributes[:'timeExecutionStarted']

      raise 'You cannot provide both :timeExecutionStarted and :time_execution_started' if attributes.key?(:'timeExecutionStarted') && attributes.key?(:'time_execution_started')

      self.time_execution_started = attributes[:'time_execution_started'] if attributes[:'time_execution_started']

      self.time_execution_ended = attributes[:'timeExecutionEnded'] if attributes[:'timeExecutionEnded']

      raise 'You cannot provide both :timeExecutionEnded and :time_execution_ended' if attributes.key?(:'timeExecutionEnded') && attributes.key?(:'time_execution_ended')

      self.time_execution_ended = attributes[:'time_execution_ended'] if attributes[:'time_execution_ended']

      self.total_sql_statements = attributes[:'totalSqlStatements'] if attributes[:'totalSqlStatements']

      raise 'You cannot provide both :totalSqlStatements and :total_sql_statements' if attributes.key?(:'totalSqlStatements') && attributes.key?(:'total_sql_statements')

      self.total_sql_statements = attributes[:'total_sql_statements'] if attributes[:'total_sql_statements']

      self.recommendation_count = attributes[:'recommendationCount'] if attributes[:'recommendationCount']

      raise 'You cannot provide both :recommendationCount and :recommendation_count' if attributes.key?(:'recommendationCount') && attributes.key?(:'recommendation_count')

      self.recommendation_count = attributes[:'recommendation_count'] if attributes[:'recommendation_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] task_status Object to be assigned
    def task_status=(task_status)
      # rubocop:disable Style/ConditionalAssignment
      if task_status && !TASK_STATUS_ENUM.include?(task_status)
        OCI.logger.debug("Unknown value for 'task_status' [" + task_status + "]. Mapping to 'TASK_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @task_status = TASK_STATUS_UNKNOWN_ENUM_VALUE
      else
        @task_status = task_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sql_tuning_advisor_task_id == other.sql_tuning_advisor_task_id &&
        instance_id == other.instance_id &&
        name == other.name &&
        description == other.description &&
        owner == other.owner &&
        time_created == other.time_created &&
        task_status == other.task_status &&
        days_to_expire == other.days_to_expire &&
        time_execution_started == other.time_execution_started &&
        time_execution_ended == other.time_execution_ended &&
        total_sql_statements == other.total_sql_statements &&
        recommendation_count == other.recommendation_count
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
      [sql_tuning_advisor_task_id, instance_id, name, description, owner, time_created, task_status, days_to_expire, time_execution_started, time_execution_ended, total_sql_statements, recommendation_count].hash
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
