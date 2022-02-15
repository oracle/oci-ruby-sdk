# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A recommendation for a given object in a SQL Tuning Task.
  #
  class DatabaseManagement::Models::SqlTuningAdvisorTaskRecommendationSummary
    RECOMMENDATION_TYPE_ENUM = [
      RECOMMENDATION_TYPE_STATISTICS = 'STATISTICS'.freeze,
      RECOMMENDATION_TYPE_INDEX = 'INDEX'.freeze,
      RECOMMENDATION_TYPE_SQL_PROFILE = 'SQL_PROFILE'.freeze,
      RECOMMENDATION_TYPE_RESTRUCTURE_SQL = 'RESTRUCTURE_SQL'.freeze,
      RECOMMENDATION_TYPE_ALTERNATIVE_PLANS = 'ALTERNATIVE_PLANS'.freeze,
      RECOMMENDATION_TYPE_ERROR = 'ERROR'.freeze,
      RECOMMENDATION_TYPE_MISCELLANEOUS = 'MISCELLANEOUS'.freeze,
      RECOMMENDATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique identifier of the task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [Integer]
    attr_accessor :sql_tuning_advisor_task_id

    # **[Required]** The key of the object to which these recommendations apply. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @return [Integer]
    attr_accessor :sql_tuning_advisor_task_object_id

    # **[Required]** The unique identifier of the recommendation in the scope of the task.
    # @return [Integer]
    attr_accessor :recommendation_key

    # **[Required]** Type of recommendation.
    # @return [String]
    attr_reader :recommendation_type

    # Summary of the issue found in the SQL statement.
    # @return [String]
    attr_accessor :finding

    # The recommendation for a specific finding.
    # @return [String]
    attr_accessor :recommendation

    # Describes the reasoning behind the recommendation and how it relates to the finding.
    # @return [String]
    attr_accessor :rationale

    # The percentage benefit of this implementation.
    # @return [Float]
    attr_accessor :benefit

    # Action sql to be implemented based on the recommendation result.
    # @return [String]
    attr_accessor :implement_action_sql

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_tuning_advisor_task_id': :'sqlTuningAdvisorTaskId',
        'sql_tuning_advisor_task_object_id': :'sqlTuningAdvisorTaskObjectId',
        'recommendation_key': :'recommendationKey',
        'recommendation_type': :'recommendationType',
        'finding': :'finding',
        'recommendation': :'recommendation',
        'rationale': :'rationale',
        'benefit': :'benefit',
        'implement_action_sql': :'implementActionSql'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_tuning_advisor_task_id': :'Integer',
        'sql_tuning_advisor_task_object_id': :'Integer',
        'recommendation_key': :'Integer',
        'recommendation_type': :'String',
        'finding': :'String',
        'recommendation': :'String',
        'rationale': :'String',
        'benefit': :'Float',
        'implement_action_sql': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :sql_tuning_advisor_task_id The value to assign to the {#sql_tuning_advisor_task_id} property
    # @option attributes [Integer] :sql_tuning_advisor_task_object_id The value to assign to the {#sql_tuning_advisor_task_object_id} property
    # @option attributes [Integer] :recommendation_key The value to assign to the {#recommendation_key} property
    # @option attributes [String] :recommendation_type The value to assign to the {#recommendation_type} property
    # @option attributes [String] :finding The value to assign to the {#finding} property
    # @option attributes [String] :recommendation The value to assign to the {#recommendation} property
    # @option attributes [String] :rationale The value to assign to the {#rationale} property
    # @option attributes [Float] :benefit The value to assign to the {#benefit} property
    # @option attributes [String] :implement_action_sql The value to assign to the {#implement_action_sql} property
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

      self.recommendation_key = attributes[:'recommendationKey'] if attributes[:'recommendationKey']

      raise 'You cannot provide both :recommendationKey and :recommendation_key' if attributes.key?(:'recommendationKey') && attributes.key?(:'recommendation_key')

      self.recommendation_key = attributes[:'recommendation_key'] if attributes[:'recommendation_key']

      self.recommendation_type = attributes[:'recommendationType'] if attributes[:'recommendationType']

      raise 'You cannot provide both :recommendationType and :recommendation_type' if attributes.key?(:'recommendationType') && attributes.key?(:'recommendation_type')

      self.recommendation_type = attributes[:'recommendation_type'] if attributes[:'recommendation_type']

      self.finding = attributes[:'finding'] if attributes[:'finding']

      self.recommendation = attributes[:'recommendation'] if attributes[:'recommendation']

      self.rationale = attributes[:'rationale'] if attributes[:'rationale']

      self.benefit = attributes[:'benefit'] if attributes[:'benefit']

      self.implement_action_sql = attributes[:'implementActionSql'] if attributes[:'implementActionSql']

      raise 'You cannot provide both :implementActionSql and :implement_action_sql' if attributes.key?(:'implementActionSql') && attributes.key?(:'implement_action_sql')

      self.implement_action_sql = attributes[:'implement_action_sql'] if attributes[:'implement_action_sql']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] recommendation_type Object to be assigned
    def recommendation_type=(recommendation_type)
      # rubocop:disable Style/ConditionalAssignment
      if recommendation_type && !RECOMMENDATION_TYPE_ENUM.include?(recommendation_type)
        OCI.logger.debug("Unknown value for 'recommendation_type' [" + recommendation_type + "]. Mapping to 'RECOMMENDATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @recommendation_type = RECOMMENDATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @recommendation_type = recommendation_type
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
        sql_tuning_advisor_task_object_id == other.sql_tuning_advisor_task_object_id &&
        recommendation_key == other.recommendation_key &&
        recommendation_type == other.recommendation_type &&
        finding == other.finding &&
        recommendation == other.recommendation &&
        rationale == other.rationale &&
        benefit == other.benefit &&
        implement_action_sql == other.implement_action_sql
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
      [sql_tuning_advisor_task_id, sql_tuning_advisor_task_object_id, recommendation_key, recommendation_type, finding, recommendation, rationale, benefit, implement_action_sql].hash
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
