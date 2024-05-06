# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details of SQL plan baselines. The details include:
  #
  # - whether automatic initial plan capture is enabled or disabled
  # - whether use of SQL plan baselines is enabled or disabled
  # - whether Automatic SPM Evolve Advisor task is enabled or disabled
  # - whether high-frequency Automatic SPM Evolve Advisor task is enabled or disabled
  # - filters for the automatic initial plan capture
  # - parameters for the Automatic SPM Evolve Advisor task
  # - plan retention and allocated space for the plan baselines
  #
  class DatabaseManagement::Models::SqlPlanBaselineConfiguration
    # **[Required]** Indicates whether the automatic capture of SQL plan baselines is enabled (`true`) or not (`false`).
    # @return [BOOLEAN]
    attr_accessor :is_automatic_initial_plan_capture_enabled

    # **[Required]** Indicates whether the database uses SQL plan baselines (`true`) or not (`false`).
    # @return [BOOLEAN]
    attr_accessor :is_sql_plan_baselines_usage_enabled

    # **[Required]** Indicates whether the Automatic SPM Evolve Advisor task is enabled (`true`) or not (`false`).
    # @return [BOOLEAN]
    attr_accessor :is_auto_spm_evolve_task_enabled

    # **[Required]** Indicates whether the high frequency Automatic SPM Evolve Advisor task is enabled (`true`) or not (`false`).
    # @return [BOOLEAN]
    attr_accessor :is_high_frequency_auto_spm_evolve_task_enabled

    # **[Required]** The number of weeks to retain unused plans before they are purged.
    # @return [Integer]
    attr_accessor :plan_retention_weeks

    # **[Required]** The maximum percent of `SYSAUX` space that can be used for SQL Management Base.
    # @return [Float]
    attr_accessor :space_budget_percent

    # The maximum `SYSAUX` space that can be used for SQL Management Base in MB.
    # @return [Float]
    attr_accessor :space_budget_mb

    # The space used by SQL Management Base in MB.
    # @return [Float]
    attr_accessor :space_used_mb

    # The capture filters used in automatic initial plan capture.
    # @return [Array<OCI::DatabaseManagement::Models::AutomaticCaptureFilter>]
    attr_accessor :auto_capture_filters

    # @return [OCI::DatabaseManagement::Models::SpmEvolveTaskParameters]
    attr_accessor :auto_spm_evolve_task_parameters

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_automatic_initial_plan_capture_enabled': :'isAutomaticInitialPlanCaptureEnabled',
        'is_sql_plan_baselines_usage_enabled': :'isSqlPlanBaselinesUsageEnabled',
        'is_auto_spm_evolve_task_enabled': :'isAutoSpmEvolveTaskEnabled',
        'is_high_frequency_auto_spm_evolve_task_enabled': :'isHighFrequencyAutoSpmEvolveTaskEnabled',
        'plan_retention_weeks': :'planRetentionWeeks',
        'space_budget_percent': :'spaceBudgetPercent',
        'space_budget_mb': :'spaceBudgetMB',
        'space_used_mb': :'spaceUsedMB',
        'auto_capture_filters': :'autoCaptureFilters',
        'auto_spm_evolve_task_parameters': :'autoSpmEvolveTaskParameters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_automatic_initial_plan_capture_enabled': :'BOOLEAN',
        'is_sql_plan_baselines_usage_enabled': :'BOOLEAN',
        'is_auto_spm_evolve_task_enabled': :'BOOLEAN',
        'is_high_frequency_auto_spm_evolve_task_enabled': :'BOOLEAN',
        'plan_retention_weeks': :'Integer',
        'space_budget_percent': :'Float',
        'space_budget_mb': :'Float',
        'space_used_mb': :'Float',
        'auto_capture_filters': :'Array<OCI::DatabaseManagement::Models::AutomaticCaptureFilter>',
        'auto_spm_evolve_task_parameters': :'OCI::DatabaseManagement::Models::SpmEvolveTaskParameters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_automatic_initial_plan_capture_enabled The value to assign to the {#is_automatic_initial_plan_capture_enabled} property
    # @option attributes [BOOLEAN] :is_sql_plan_baselines_usage_enabled The value to assign to the {#is_sql_plan_baselines_usage_enabled} property
    # @option attributes [BOOLEAN] :is_auto_spm_evolve_task_enabled The value to assign to the {#is_auto_spm_evolve_task_enabled} property
    # @option attributes [BOOLEAN] :is_high_frequency_auto_spm_evolve_task_enabled The value to assign to the {#is_high_frequency_auto_spm_evolve_task_enabled} property
    # @option attributes [Integer] :plan_retention_weeks The value to assign to the {#plan_retention_weeks} property
    # @option attributes [Float] :space_budget_percent The value to assign to the {#space_budget_percent} property
    # @option attributes [Float] :space_budget_mb The value to assign to the {#space_budget_mb} property
    # @option attributes [Float] :space_used_mb The value to assign to the {#space_used_mb} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::AutomaticCaptureFilter>] :auto_capture_filters The value to assign to the {#auto_capture_filters} property
    # @option attributes [OCI::DatabaseManagement::Models::SpmEvolveTaskParameters] :auto_spm_evolve_task_parameters The value to assign to the {#auto_spm_evolve_task_parameters} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_automatic_initial_plan_capture_enabled = attributes[:'isAutomaticInitialPlanCaptureEnabled'] unless attributes[:'isAutomaticInitialPlanCaptureEnabled'].nil?

      raise 'You cannot provide both :isAutomaticInitialPlanCaptureEnabled and :is_automatic_initial_plan_capture_enabled' if attributes.key?(:'isAutomaticInitialPlanCaptureEnabled') && attributes.key?(:'is_automatic_initial_plan_capture_enabled')

      self.is_automatic_initial_plan_capture_enabled = attributes[:'is_automatic_initial_plan_capture_enabled'] unless attributes[:'is_automatic_initial_plan_capture_enabled'].nil?

      self.is_sql_plan_baselines_usage_enabled = attributes[:'isSqlPlanBaselinesUsageEnabled'] unless attributes[:'isSqlPlanBaselinesUsageEnabled'].nil?

      raise 'You cannot provide both :isSqlPlanBaselinesUsageEnabled and :is_sql_plan_baselines_usage_enabled' if attributes.key?(:'isSqlPlanBaselinesUsageEnabled') && attributes.key?(:'is_sql_plan_baselines_usage_enabled')

      self.is_sql_plan_baselines_usage_enabled = attributes[:'is_sql_plan_baselines_usage_enabled'] unless attributes[:'is_sql_plan_baselines_usage_enabled'].nil?

      self.is_auto_spm_evolve_task_enabled = attributes[:'isAutoSpmEvolveTaskEnabled'] unless attributes[:'isAutoSpmEvolveTaskEnabled'].nil?

      raise 'You cannot provide both :isAutoSpmEvolveTaskEnabled and :is_auto_spm_evolve_task_enabled' if attributes.key?(:'isAutoSpmEvolveTaskEnabled') && attributes.key?(:'is_auto_spm_evolve_task_enabled')

      self.is_auto_spm_evolve_task_enabled = attributes[:'is_auto_spm_evolve_task_enabled'] unless attributes[:'is_auto_spm_evolve_task_enabled'].nil?

      self.is_high_frequency_auto_spm_evolve_task_enabled = attributes[:'isHighFrequencyAutoSpmEvolveTaskEnabled'] unless attributes[:'isHighFrequencyAutoSpmEvolveTaskEnabled'].nil?

      raise 'You cannot provide both :isHighFrequencyAutoSpmEvolveTaskEnabled and :is_high_frequency_auto_spm_evolve_task_enabled' if attributes.key?(:'isHighFrequencyAutoSpmEvolveTaskEnabled') && attributes.key?(:'is_high_frequency_auto_spm_evolve_task_enabled')

      self.is_high_frequency_auto_spm_evolve_task_enabled = attributes[:'is_high_frequency_auto_spm_evolve_task_enabled'] unless attributes[:'is_high_frequency_auto_spm_evolve_task_enabled'].nil?

      self.plan_retention_weeks = attributes[:'planRetentionWeeks'] if attributes[:'planRetentionWeeks']

      raise 'You cannot provide both :planRetentionWeeks and :plan_retention_weeks' if attributes.key?(:'planRetentionWeeks') && attributes.key?(:'plan_retention_weeks')

      self.plan_retention_weeks = attributes[:'plan_retention_weeks'] if attributes[:'plan_retention_weeks']

      self.space_budget_percent = attributes[:'spaceBudgetPercent'] if attributes[:'spaceBudgetPercent']

      raise 'You cannot provide both :spaceBudgetPercent and :space_budget_percent' if attributes.key?(:'spaceBudgetPercent') && attributes.key?(:'space_budget_percent')

      self.space_budget_percent = attributes[:'space_budget_percent'] if attributes[:'space_budget_percent']

      self.space_budget_mb = attributes[:'spaceBudgetMB'] if attributes[:'spaceBudgetMB']

      raise 'You cannot provide both :spaceBudgetMB and :space_budget_mb' if attributes.key?(:'spaceBudgetMB') && attributes.key?(:'space_budget_mb')

      self.space_budget_mb = attributes[:'space_budget_mb'] if attributes[:'space_budget_mb']

      self.space_used_mb = attributes[:'spaceUsedMB'] if attributes[:'spaceUsedMB']

      raise 'You cannot provide both :spaceUsedMB and :space_used_mb' if attributes.key?(:'spaceUsedMB') && attributes.key?(:'space_used_mb')

      self.space_used_mb = attributes[:'space_used_mb'] if attributes[:'space_used_mb']

      self.auto_capture_filters = attributes[:'autoCaptureFilters'] if attributes[:'autoCaptureFilters']

      raise 'You cannot provide both :autoCaptureFilters and :auto_capture_filters' if attributes.key?(:'autoCaptureFilters') && attributes.key?(:'auto_capture_filters')

      self.auto_capture_filters = attributes[:'auto_capture_filters'] if attributes[:'auto_capture_filters']

      self.auto_spm_evolve_task_parameters = attributes[:'autoSpmEvolveTaskParameters'] if attributes[:'autoSpmEvolveTaskParameters']

      raise 'You cannot provide both :autoSpmEvolveTaskParameters and :auto_spm_evolve_task_parameters' if attributes.key?(:'autoSpmEvolveTaskParameters') && attributes.key?(:'auto_spm_evolve_task_parameters')

      self.auto_spm_evolve_task_parameters = attributes[:'auto_spm_evolve_task_parameters'] if attributes[:'auto_spm_evolve_task_parameters']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_automatic_initial_plan_capture_enabled == other.is_automatic_initial_plan_capture_enabled &&
        is_sql_plan_baselines_usage_enabled == other.is_sql_plan_baselines_usage_enabled &&
        is_auto_spm_evolve_task_enabled == other.is_auto_spm_evolve_task_enabled &&
        is_high_frequency_auto_spm_evolve_task_enabled == other.is_high_frequency_auto_spm_evolve_task_enabled &&
        plan_retention_weeks == other.plan_retention_weeks &&
        space_budget_percent == other.space_budget_percent &&
        space_budget_mb == other.space_budget_mb &&
        space_used_mb == other.space_used_mb &&
        auto_capture_filters == other.auto_capture_filters &&
        auto_spm_evolve_task_parameters == other.auto_spm_evolve_task_parameters
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
      [is_automatic_initial_plan_capture_enabled, is_sql_plan_baselines_usage_enabled, is_auto_spm_evolve_task_enabled, is_high_frequency_auto_spm_evolve_task_enabled, plan_retention_weeks, space_budget_percent, space_budget_mb, space_used_mb, auto_capture_filters, auto_spm_evolve_task_parameters].hash
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