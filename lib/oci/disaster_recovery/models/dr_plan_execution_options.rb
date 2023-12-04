# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220125
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The options for a plan execution.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DisasterRecovery::Models::DrPlanExecutionOptions
    PLAN_EXECUTION_TYPE_ENUM = [
      PLAN_EXECUTION_TYPE_SWITCHOVER = 'SWITCHOVER'.freeze,
      PLAN_EXECUTION_TYPE_SWITCHOVER_PRECHECK = 'SWITCHOVER_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_FAILOVER = 'FAILOVER'.freeze,
      PLAN_EXECUTION_TYPE_FAILOVER_PRECHECK = 'FAILOVER_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_START_DRILL_PRECHECK = 'START_DRILL_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_START_DRILL = 'START_DRILL'.freeze,
      PLAN_EXECUTION_TYPE_STOP_DRILL_PRECHECK = 'STOP_DRILL_PRECHECK'.freeze,
      PLAN_EXECUTION_TYPE_STOP_DRILL = 'STOP_DRILL'.freeze,
      PLAN_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of the plan execution.
    #
    # @return [String]
    attr_reader :plan_execution_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_execution_type': :'planExecutionType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_execution_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'planExecutionType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DisasterRecovery::Models::StopDrillExecutionOptions' if type == 'STOP_DRILL'
      return 'OCI::DisasterRecovery::Models::SwitchoverExecutionOptions' if type == 'SWITCHOVER'
      return 'OCI::DisasterRecovery::Models::FailoverPrecheckExecutionOptions' if type == 'FAILOVER_PRECHECK'
      return 'OCI::DisasterRecovery::Models::StartDrillExecutionOptions' if type == 'START_DRILL'
      return 'OCI::DisasterRecovery::Models::SwitchoverPrecheckExecutionOptions' if type == 'SWITCHOVER_PRECHECK'
      return 'OCI::DisasterRecovery::Models::StartDrillPrecheckExecutionOptions' if type == 'START_DRILL_PRECHECK'
      return 'OCI::DisasterRecovery::Models::StopDrillPrecheckExecutionOptions' if type == 'STOP_DRILL_PRECHECK'
      return 'OCI::DisasterRecovery::Models::FailoverExecutionOptions' if type == 'FAILOVER'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DisasterRecovery::Models::DrPlanExecutionOptions'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :plan_execution_type The value to assign to the {#plan_execution_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.plan_execution_type = attributes[:'planExecutionType'] if attributes[:'planExecutionType']

      raise 'You cannot provide both :planExecutionType and :plan_execution_type' if attributes.key?(:'planExecutionType') && attributes.key?(:'plan_execution_type')

      self.plan_execution_type = attributes[:'plan_execution_type'] if attributes[:'plan_execution_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] plan_execution_type Object to be assigned
    def plan_execution_type=(plan_execution_type)
      # rubocop:disable Style/ConditionalAssignment
      if plan_execution_type && !PLAN_EXECUTION_TYPE_ENUM.include?(plan_execution_type)
        OCI.logger.debug("Unknown value for 'plan_execution_type' [" + plan_execution_type + "]. Mapping to 'PLAN_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @plan_execution_type = PLAN_EXECUTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @plan_execution_type = plan_execution_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        plan_execution_type == other.plan_execution_type
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
      [plan_execution_type].hash
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
