# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of an autoscale policy.
  #
  # You can create following types of autoscaling policies:
  #
  # - **MetricBasedVerticalScalingPolicy:** Vertical autoscaling action is triggered when a performance metric exceeds a threshold
  # - **MetricBasedHorizontalScalingPolicy:** Horizontal autoscaling action is triggered when a performance metric exceeds a threshold
  # - **ScheduleBasedVerticalScalingPolicy:** Vertical autoscaling action is triggered at the specific times that you schedule.
  # - **ScheduleBasedHorizontalScalingPolicy:** Horizontal autoscaling action is triggered at the specific times that you schedule.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Bds::Models::AutoScalePolicyDetails
    POLICY_TYPE_ENUM = [
      POLICY_TYPE_METRIC_BASED_VERTICAL_SCALING_POLICY = 'METRIC_BASED_VERTICAL_SCALING_POLICY'.freeze,
      POLICY_TYPE_METRIC_BASED_HORIZONTAL_SCALING_POLICY = 'METRIC_BASED_HORIZONTAL_SCALING_POLICY'.freeze,
      POLICY_TYPE_SCHEDULE_BASED_VERTICAL_SCALING_POLICY = 'SCHEDULE_BASED_VERTICAL_SCALING_POLICY'.freeze,
      POLICY_TYPE_SCHEDULE_BASED_HORIZONTAL_SCALING_POLICY = 'SCHEDULE_BASED_HORIZONTAL_SCALING_POLICY'.freeze,
      POLICY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRIGGER_TYPE_ENUM = [
      TRIGGER_TYPE_METRIC_BASED = 'METRIC_BASED'.freeze,
      TRIGGER_TYPE_SCHEDULE_BASED = 'SCHEDULE_BASED'.freeze,
      TRIGGER_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ACTION_TYPE_ENUM = [
      ACTION_TYPE_VERTICAL_SCALING = 'VERTICAL_SCALING'.freeze,
      ACTION_TYPE_HORIZONTAL_SCALING = 'HORIZONTAL_SCALING'.freeze,
      ACTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Type of autoscaling policy.
    # @return [String]
    attr_reader :policy_type

    # **[Required]** The type of autoscaling trigger.
    # @return [String]
    attr_reader :trigger_type

    # **[Required]** The type of autoscaling action to take.
    # @return [String]
    attr_reader :action_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'policy_type': :'policyType',
        'trigger_type': :'triggerType',
        'action_type': :'actionType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'policy_type': :'String',
        'trigger_type': :'String',
        'action_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'policyType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Bds::Models::MetricBasedVerticalScalingPolicyDetails' if type == 'METRIC_BASED_VERTICAL_SCALING_POLICY'
      return 'OCI::Bds::Models::ScheduleBasedVerticalScalingPolicyDetails' if type == 'SCHEDULE_BASED_VERTICAL_SCALING_POLICY'
      return 'OCI::Bds::Models::ScheduleBasedHorizontalScalingPolicyDetails' if type == 'SCHEDULE_BASED_HORIZONTAL_SCALING_POLICY'
      return 'OCI::Bds::Models::MetricBasedHorizontalScalingPolicyDetails' if type == 'METRIC_BASED_HORIZONTAL_SCALING_POLICY'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Bds::Models::AutoScalePolicyDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :policy_type The value to assign to the {#policy_type} property
    # @option attributes [String] :trigger_type The value to assign to the {#trigger_type} property
    # @option attributes [String] :action_type The value to assign to the {#action_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.policy_type = attributes[:'policyType'] if attributes[:'policyType']

      raise 'You cannot provide both :policyType and :policy_type' if attributes.key?(:'policyType') && attributes.key?(:'policy_type')

      self.policy_type = attributes[:'policy_type'] if attributes[:'policy_type']

      self.trigger_type = attributes[:'triggerType'] if attributes[:'triggerType']

      raise 'You cannot provide both :triggerType and :trigger_type' if attributes.key?(:'triggerType') && attributes.key?(:'trigger_type')

      self.trigger_type = attributes[:'trigger_type'] if attributes[:'trigger_type']

      self.action_type = attributes[:'actionType'] if attributes[:'actionType']

      raise 'You cannot provide both :actionType and :action_type' if attributes.key?(:'actionType') && attributes.key?(:'action_type')

      self.action_type = attributes[:'action_type'] if attributes[:'action_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] policy_type Object to be assigned
    def policy_type=(policy_type)
      # rubocop:disable Style/ConditionalAssignment
      if policy_type && !POLICY_TYPE_ENUM.include?(policy_type)
        OCI.logger.debug("Unknown value for 'policy_type' [" + policy_type + "]. Mapping to 'POLICY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @policy_type = POLICY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @policy_type = policy_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] trigger_type Object to be assigned
    def trigger_type=(trigger_type)
      # rubocop:disable Style/ConditionalAssignment
      if trigger_type && !TRIGGER_TYPE_ENUM.include?(trigger_type)
        OCI.logger.debug("Unknown value for 'trigger_type' [" + trigger_type + "]. Mapping to 'TRIGGER_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @trigger_type = TRIGGER_TYPE_UNKNOWN_ENUM_VALUE
      else
        @trigger_type = trigger_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action_type Object to be assigned
    def action_type=(action_type)
      # rubocop:disable Style/ConditionalAssignment
      if action_type && !ACTION_TYPE_ENUM.include?(action_type)
        OCI.logger.debug("Unknown value for 'action_type' [" + action_type + "]. Mapping to 'ACTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action_type = ACTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @action_type = action_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        policy_type == other.policy_type &&
        trigger_type == other.trigger_type &&
        action_type == other.action_type
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
      [policy_type, trigger_type, action_type].hash
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