# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the findings of the objects in a tuning task that match a given filter.
  # This includes the kind of findings that were reported, whether the benefits were analyzed, and the number of benefits obtained.
  #
  class DatabaseManagement::Models::SqlTuningAdvisorTaskFindingSummary
    # **[Required]** The unique identifier of the SQL Tuning Advisor task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [Integer]
    attr_accessor :sql_tuning_advisor_task_id

    # **[Required]** The key of the object to which these recommendations apply.
    # This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @return [Integer]
    attr_accessor :sql_tuning_advisor_task_object_id

    # **[Required]** The execution id of the analyzed SQL object. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [Integer]
    attr_accessor :sql_tuning_advisor_task_object_execution_id

    # **[Required]** The text of the SQL statement.
    # @return [String]
    attr_accessor :sql_text

    # **[Required]** The parsing schema of the object.
    # @return [String]
    attr_accessor :parsing_schema

    # **[Required]** The unique key of this SQL statement.
    # @return [String]
    attr_accessor :sql_key

    # The time benefit (in seconds) for the highest-rated finding for this object.
    # @return [Float]
    attr_accessor :db_time_benefit

    # The per-execution percentage benefit.
    # @return [Integer]
    attr_accessor :per_execution_percentage

    # Indicates whether a statistics recommendation was reported for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_stats_finding_present

    # Indicates whether a SQL Profile recommendation was reported for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_sql_profile_finding_present

    # Indicates whether a SQL Profile recommendation has been implemented for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_sql_profile_finding_implemented

    # Indicates whether an index recommendation was reported for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_index_finding_present

    # Indicates whether a restructure SQL recommendation was reported for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_restructure_sql_finding_present

    # Indicates whether an alternative execution plan was reported for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_alternative_plan_finding_present

    # Indicates whether a miscellaneous finding was reported for this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_miscellaneous_finding_present

    # Indicates whether there is an error in this SQL statement.
    # @return [BOOLEAN]
    attr_accessor :is_error_finding_present

    # Indicates whether the task timed out.
    # @return [BOOLEAN]
    attr_accessor :is_timeout_finding_present

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_tuning_advisor_task_id': :'sqlTuningAdvisorTaskId',
        'sql_tuning_advisor_task_object_id': :'sqlTuningAdvisorTaskObjectId',
        'sql_tuning_advisor_task_object_execution_id': :'sqlTuningAdvisorTaskObjectExecutionId',
        'sql_text': :'sqlText',
        'parsing_schema': :'parsingSchema',
        'sql_key': :'sqlKey',
        'db_time_benefit': :'dbTimeBenefit',
        'per_execution_percentage': :'perExecutionPercentage',
        'is_stats_finding_present': :'isStatsFindingPresent',
        'is_sql_profile_finding_present': :'isSqlProfileFindingPresent',
        'is_sql_profile_finding_implemented': :'isSqlProfileFindingImplemented',
        'is_index_finding_present': :'isIndexFindingPresent',
        'is_restructure_sql_finding_present': :'isRestructureSqlFindingPresent',
        'is_alternative_plan_finding_present': :'isAlternativePlanFindingPresent',
        'is_miscellaneous_finding_present': :'isMiscellaneousFindingPresent',
        'is_error_finding_present': :'isErrorFindingPresent',
        'is_timeout_finding_present': :'isTimeoutFindingPresent'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_tuning_advisor_task_id': :'Integer',
        'sql_tuning_advisor_task_object_id': :'Integer',
        'sql_tuning_advisor_task_object_execution_id': :'Integer',
        'sql_text': :'String',
        'parsing_schema': :'String',
        'sql_key': :'String',
        'db_time_benefit': :'Float',
        'per_execution_percentage': :'Integer',
        'is_stats_finding_present': :'BOOLEAN',
        'is_sql_profile_finding_present': :'BOOLEAN',
        'is_sql_profile_finding_implemented': :'BOOLEAN',
        'is_index_finding_present': :'BOOLEAN',
        'is_restructure_sql_finding_present': :'BOOLEAN',
        'is_alternative_plan_finding_present': :'BOOLEAN',
        'is_miscellaneous_finding_present': :'BOOLEAN',
        'is_error_finding_present': :'BOOLEAN',
        'is_timeout_finding_present': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :sql_tuning_advisor_task_id The value to assign to the {#sql_tuning_advisor_task_id} property
    # @option attributes [Integer] :sql_tuning_advisor_task_object_id The value to assign to the {#sql_tuning_advisor_task_object_id} property
    # @option attributes [Integer] :sql_tuning_advisor_task_object_execution_id The value to assign to the {#sql_tuning_advisor_task_object_execution_id} property
    # @option attributes [String] :sql_text The value to assign to the {#sql_text} property
    # @option attributes [String] :parsing_schema The value to assign to the {#parsing_schema} property
    # @option attributes [String] :sql_key The value to assign to the {#sql_key} property
    # @option attributes [Float] :db_time_benefit The value to assign to the {#db_time_benefit} property
    # @option attributes [Integer] :per_execution_percentage The value to assign to the {#per_execution_percentage} property
    # @option attributes [BOOLEAN] :is_stats_finding_present The value to assign to the {#is_stats_finding_present} property
    # @option attributes [BOOLEAN] :is_sql_profile_finding_present The value to assign to the {#is_sql_profile_finding_present} property
    # @option attributes [BOOLEAN] :is_sql_profile_finding_implemented The value to assign to the {#is_sql_profile_finding_implemented} property
    # @option attributes [BOOLEAN] :is_index_finding_present The value to assign to the {#is_index_finding_present} property
    # @option attributes [BOOLEAN] :is_restructure_sql_finding_present The value to assign to the {#is_restructure_sql_finding_present} property
    # @option attributes [BOOLEAN] :is_alternative_plan_finding_present The value to assign to the {#is_alternative_plan_finding_present} property
    # @option attributes [BOOLEAN] :is_miscellaneous_finding_present The value to assign to the {#is_miscellaneous_finding_present} property
    # @option attributes [BOOLEAN] :is_error_finding_present The value to assign to the {#is_error_finding_present} property
    # @option attributes [BOOLEAN] :is_timeout_finding_present The value to assign to the {#is_timeout_finding_present} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sql_tuning_advisor_task_id = attributes[:'sqlTuningAdvisorTaskId'] if attributes[:'sqlTuningAdvisorTaskId']

      raise 'You cannot provide both :sqlTuningAdvisorTaskId and :sql_tuning_advisor_task_id' if attributes.key?(:'sqlTuningAdvisorTaskId') && attributes.key?(:'sql_tuning_advisor_task_id')

      self.sql_tuning_advisor_task_id = attributes[:'sql_tuning_advisor_task_id'] if attributes[:'sql_tuning_advisor_task_id']

      self.sql_tuning_advisor_task_object_id = attributes[:'sqlTuningAdvisorTaskObjectId'] if attributes[:'sqlTuningAdvisorTaskObjectId']

      raise 'You cannot provide both :sqlTuningAdvisorTaskObjectId and :sql_tuning_advisor_task_object_id' if attributes.key?(:'sqlTuningAdvisorTaskObjectId') && attributes.key?(:'sql_tuning_advisor_task_object_id')

      self.sql_tuning_advisor_task_object_id = attributes[:'sql_tuning_advisor_task_object_id'] if attributes[:'sql_tuning_advisor_task_object_id']

      self.sql_tuning_advisor_task_object_execution_id = attributes[:'sqlTuningAdvisorTaskObjectExecutionId'] if attributes[:'sqlTuningAdvisorTaskObjectExecutionId']

      raise 'You cannot provide both :sqlTuningAdvisorTaskObjectExecutionId and :sql_tuning_advisor_task_object_execution_id' if attributes.key?(:'sqlTuningAdvisorTaskObjectExecutionId') && attributes.key?(:'sql_tuning_advisor_task_object_execution_id')

      self.sql_tuning_advisor_task_object_execution_id = attributes[:'sql_tuning_advisor_task_object_execution_id'] if attributes[:'sql_tuning_advisor_task_object_execution_id']

      self.sql_text = attributes[:'sqlText'] if attributes[:'sqlText']

      raise 'You cannot provide both :sqlText and :sql_text' if attributes.key?(:'sqlText') && attributes.key?(:'sql_text')

      self.sql_text = attributes[:'sql_text'] if attributes[:'sql_text']

      self.parsing_schema = attributes[:'parsingSchema'] if attributes[:'parsingSchema']

      raise 'You cannot provide both :parsingSchema and :parsing_schema' if attributes.key?(:'parsingSchema') && attributes.key?(:'parsing_schema')

      self.parsing_schema = attributes[:'parsing_schema'] if attributes[:'parsing_schema']

      self.sql_key = attributes[:'sqlKey'] if attributes[:'sqlKey']

      raise 'You cannot provide both :sqlKey and :sql_key' if attributes.key?(:'sqlKey') && attributes.key?(:'sql_key')

      self.sql_key = attributes[:'sql_key'] if attributes[:'sql_key']

      self.db_time_benefit = attributes[:'dbTimeBenefit'] if attributes[:'dbTimeBenefit']

      raise 'You cannot provide both :dbTimeBenefit and :db_time_benefit' if attributes.key?(:'dbTimeBenefit') && attributes.key?(:'db_time_benefit')

      self.db_time_benefit = attributes[:'db_time_benefit'] if attributes[:'db_time_benefit']

      self.per_execution_percentage = attributes[:'perExecutionPercentage'] if attributes[:'perExecutionPercentage']

      raise 'You cannot provide both :perExecutionPercentage and :per_execution_percentage' if attributes.key?(:'perExecutionPercentage') && attributes.key?(:'per_execution_percentage')

      self.per_execution_percentage = attributes[:'per_execution_percentage'] if attributes[:'per_execution_percentage']

      self.is_stats_finding_present = attributes[:'isStatsFindingPresent'] unless attributes[:'isStatsFindingPresent'].nil?

      raise 'You cannot provide both :isStatsFindingPresent and :is_stats_finding_present' if attributes.key?(:'isStatsFindingPresent') && attributes.key?(:'is_stats_finding_present')

      self.is_stats_finding_present = attributes[:'is_stats_finding_present'] unless attributes[:'is_stats_finding_present'].nil?

      self.is_sql_profile_finding_present = attributes[:'isSqlProfileFindingPresent'] unless attributes[:'isSqlProfileFindingPresent'].nil?

      raise 'You cannot provide both :isSqlProfileFindingPresent and :is_sql_profile_finding_present' if attributes.key?(:'isSqlProfileFindingPresent') && attributes.key?(:'is_sql_profile_finding_present')

      self.is_sql_profile_finding_present = attributes[:'is_sql_profile_finding_present'] unless attributes[:'is_sql_profile_finding_present'].nil?

      self.is_sql_profile_finding_implemented = attributes[:'isSqlProfileFindingImplemented'] unless attributes[:'isSqlProfileFindingImplemented'].nil?

      raise 'You cannot provide both :isSqlProfileFindingImplemented and :is_sql_profile_finding_implemented' if attributes.key?(:'isSqlProfileFindingImplemented') && attributes.key?(:'is_sql_profile_finding_implemented')

      self.is_sql_profile_finding_implemented = attributes[:'is_sql_profile_finding_implemented'] unless attributes[:'is_sql_profile_finding_implemented'].nil?

      self.is_index_finding_present = attributes[:'isIndexFindingPresent'] unless attributes[:'isIndexFindingPresent'].nil?

      raise 'You cannot provide both :isIndexFindingPresent and :is_index_finding_present' if attributes.key?(:'isIndexFindingPresent') && attributes.key?(:'is_index_finding_present')

      self.is_index_finding_present = attributes[:'is_index_finding_present'] unless attributes[:'is_index_finding_present'].nil?

      self.is_restructure_sql_finding_present = attributes[:'isRestructureSqlFindingPresent'] unless attributes[:'isRestructureSqlFindingPresent'].nil?

      raise 'You cannot provide both :isRestructureSqlFindingPresent and :is_restructure_sql_finding_present' if attributes.key?(:'isRestructureSqlFindingPresent') && attributes.key?(:'is_restructure_sql_finding_present')

      self.is_restructure_sql_finding_present = attributes[:'is_restructure_sql_finding_present'] unless attributes[:'is_restructure_sql_finding_present'].nil?

      self.is_alternative_plan_finding_present = attributes[:'isAlternativePlanFindingPresent'] unless attributes[:'isAlternativePlanFindingPresent'].nil?

      raise 'You cannot provide both :isAlternativePlanFindingPresent and :is_alternative_plan_finding_present' if attributes.key?(:'isAlternativePlanFindingPresent') && attributes.key?(:'is_alternative_plan_finding_present')

      self.is_alternative_plan_finding_present = attributes[:'is_alternative_plan_finding_present'] unless attributes[:'is_alternative_plan_finding_present'].nil?

      self.is_miscellaneous_finding_present = attributes[:'isMiscellaneousFindingPresent'] unless attributes[:'isMiscellaneousFindingPresent'].nil?

      raise 'You cannot provide both :isMiscellaneousFindingPresent and :is_miscellaneous_finding_present' if attributes.key?(:'isMiscellaneousFindingPresent') && attributes.key?(:'is_miscellaneous_finding_present')

      self.is_miscellaneous_finding_present = attributes[:'is_miscellaneous_finding_present'] unless attributes[:'is_miscellaneous_finding_present'].nil?

      self.is_error_finding_present = attributes[:'isErrorFindingPresent'] unless attributes[:'isErrorFindingPresent'].nil?

      raise 'You cannot provide both :isErrorFindingPresent and :is_error_finding_present' if attributes.key?(:'isErrorFindingPresent') && attributes.key?(:'is_error_finding_present')

      self.is_error_finding_present = attributes[:'is_error_finding_present'] unless attributes[:'is_error_finding_present'].nil?

      self.is_timeout_finding_present = attributes[:'isTimeoutFindingPresent'] unless attributes[:'isTimeoutFindingPresent'].nil?

      raise 'You cannot provide both :isTimeoutFindingPresent and :is_timeout_finding_present' if attributes.key?(:'isTimeoutFindingPresent') && attributes.key?(:'is_timeout_finding_present')

      self.is_timeout_finding_present = attributes[:'is_timeout_finding_present'] unless attributes[:'is_timeout_finding_present'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sql_tuning_advisor_task_id == other.sql_tuning_advisor_task_id &&
        sql_tuning_advisor_task_object_id == other.sql_tuning_advisor_task_object_id &&
        sql_tuning_advisor_task_object_execution_id == other.sql_tuning_advisor_task_object_execution_id &&
        sql_text == other.sql_text &&
        parsing_schema == other.parsing_schema &&
        sql_key == other.sql_key &&
        db_time_benefit == other.db_time_benefit &&
        per_execution_percentage == other.per_execution_percentage &&
        is_stats_finding_present == other.is_stats_finding_present &&
        is_sql_profile_finding_present == other.is_sql_profile_finding_present &&
        is_sql_profile_finding_implemented == other.is_sql_profile_finding_implemented &&
        is_index_finding_present == other.is_index_finding_present &&
        is_restructure_sql_finding_present == other.is_restructure_sql_finding_present &&
        is_alternative_plan_finding_present == other.is_alternative_plan_finding_present &&
        is_miscellaneous_finding_present == other.is_miscellaneous_finding_present &&
        is_error_finding_present == other.is_error_finding_present &&
        is_timeout_finding_present == other.is_timeout_finding_present
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
      [sql_tuning_advisor_task_id, sql_tuning_advisor_task_object_id, sql_tuning_advisor_task_object_execution_id, sql_text, parsing_schema, sql_key, db_time_benefit, per_execution_percentage, is_stats_finding_present, is_sql_profile_finding_present, is_sql_profile_finding_implemented, is_index_finding_present, is_restructure_sql_finding_present, is_alternative_plan_finding_present, is_miscellaneous_finding_present, is_error_finding_present, is_timeout_finding_present].hash
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
