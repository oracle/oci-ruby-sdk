# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20180917
require 'date'
require 'logger'
require_relative 'job_operation_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Job details that are specific to apply operations.
  #
  class ResourceManager::Models::ApplyJobOperationDetails < ResourceManager::Models::JobOperationDetails
    EXECUTION_PLAN_STRATEGY_ENUM = [
      EXECUTION_PLAN_STRATEGY_FROM_PLAN_JOB_ID = 'FROM_PLAN_JOB_ID'.freeze,
      EXECUTION_PLAN_STRATEGY_FROM_LATEST_PLAN_JOB = 'FROM_LATEST_PLAN_JOB'.freeze,
      EXECUTION_PLAN_STRATEGY_AUTO_APPROVED = 'AUTO_APPROVED'.freeze,
      EXECUTION_PLAN_STRATEGY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [OCI::ResourceManager::Models::TerraformAdvancedOptions]
    attr_accessor :terraform_advanced_options

    # **[Required]** Specifies the source of the execution plan to apply.
    # Use `AUTO_APPROVED` to run the job without an execution plan.
    #
    # @return [String]
    attr_reader :execution_plan_strategy

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the plan job that contains the execution plan used for this job,
    # or `null` if no execution plan was used.
    #
    # @return [String]
    attr_accessor :execution_plan_job_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation': :'operation',
        'terraform_advanced_options': :'terraformAdvancedOptions',
        'execution_plan_strategy': :'executionPlanStrategy',
        'execution_plan_job_id': :'executionPlanJobId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation': :'String',
        'terraform_advanced_options': :'OCI::ResourceManager::Models::TerraformAdvancedOptions',
        'execution_plan_strategy': :'String',
        'execution_plan_job_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::ResourceManager::Models::TerraformAdvancedOptions] :terraform_advanced_options The value to assign to the {#terraform_advanced_options} property
    # @option attributes [String] :execution_plan_strategy The value to assign to the {#execution_plan_strategy} property
    # @option attributes [String] :execution_plan_job_id The value to assign to the {#execution_plan_job_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['operation'] = 'APPLY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.terraform_advanced_options = attributes[:'terraformAdvancedOptions'] if attributes[:'terraformAdvancedOptions']

      raise 'You cannot provide both :terraformAdvancedOptions and :terraform_advanced_options' if attributes.key?(:'terraformAdvancedOptions') && attributes.key?(:'terraform_advanced_options')

      self.terraform_advanced_options = attributes[:'terraform_advanced_options'] if attributes[:'terraform_advanced_options']

      self.execution_plan_strategy = attributes[:'executionPlanStrategy'] if attributes[:'executionPlanStrategy']

      raise 'You cannot provide both :executionPlanStrategy and :execution_plan_strategy' if attributes.key?(:'executionPlanStrategy') && attributes.key?(:'execution_plan_strategy')

      self.execution_plan_strategy = attributes[:'execution_plan_strategy'] if attributes[:'execution_plan_strategy']

      self.execution_plan_job_id = attributes[:'executionPlanJobId'] if attributes[:'executionPlanJobId']

      raise 'You cannot provide both :executionPlanJobId and :execution_plan_job_id' if attributes.key?(:'executionPlanJobId') && attributes.key?(:'execution_plan_job_id')

      self.execution_plan_job_id = attributes[:'execution_plan_job_id'] if attributes[:'execution_plan_job_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] execution_plan_strategy Object to be assigned
    def execution_plan_strategy=(execution_plan_strategy)
      # rubocop:disable Style/ConditionalAssignment
      if execution_plan_strategy && !EXECUTION_PLAN_STRATEGY_ENUM.include?(execution_plan_strategy)
        OCI.logger.debug("Unknown value for 'execution_plan_strategy' [" + execution_plan_strategy + "]. Mapping to 'EXECUTION_PLAN_STRATEGY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @execution_plan_strategy = EXECUTION_PLAN_STRATEGY_UNKNOWN_ENUM_VALUE
      else
        @execution_plan_strategy = execution_plan_strategy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation == other.operation &&
        terraform_advanced_options == other.terraform_advanced_options &&
        execution_plan_strategy == other.execution_plan_strategy &&
        execution_plan_job_id == other.execution_plan_job_id
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
      [operation, terraform_advanced_options, execution_plan_strategy, execution_plan_job_id].hash
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
