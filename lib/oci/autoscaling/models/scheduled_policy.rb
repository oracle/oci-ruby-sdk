# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'auto_scaling_policy'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An autoscaling policy that defines execution schedules for an autoscaling configuration.
  class Autoscaling::Models::ScheduledPolicy < Autoscaling::Models::AutoScalingPolicy
    # **[Required]** The schedule for executing the autoscaling policy.
    # @return [OCI::Autoscaling::Models::ExecutionSchedule]
    attr_accessor :execution_schedule

    # @return [OCI::Autoscaling::Models::ResourceAction]
    attr_accessor :resource_action

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'capacity': :'capacity',
        'id': :'id',
        'display_name': :'displayName',
        'policy_type': :'policyType',
        'time_created': :'timeCreated',
        'is_enabled': :'isEnabled',
        'execution_schedule': :'executionSchedule',
        'resource_action': :'resourceAction'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'capacity': :'OCI::Autoscaling::Models::Capacity',
        'id': :'String',
        'display_name': :'String',
        'policy_type': :'String',
        'time_created': :'DateTime',
        'is_enabled': :'BOOLEAN',
        'execution_schedule': :'OCI::Autoscaling::Models::ExecutionSchedule',
        'resource_action': :'OCI::Autoscaling::Models::ResourceAction'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Autoscaling::Models::Capacity] :capacity The value to assign to the {OCI::Autoscaling::Models::AutoScalingPolicy#capacity #capacity} proprety
    # @option attributes [String] :id The value to assign to the {OCI::Autoscaling::Models::AutoScalingPolicy#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Autoscaling::Models::AutoScalingPolicy#display_name #display_name} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Autoscaling::Models::AutoScalingPolicy#time_created #time_created} proprety
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {OCI::Autoscaling::Models::AutoScalingPolicy#is_enabled #is_enabled} proprety
    # @option attributes [OCI::Autoscaling::Models::ExecutionSchedule] :execution_schedule The value to assign to the {#execution_schedule} property
    # @option attributes [OCI::Autoscaling::Models::ResourceAction] :resource_action The value to assign to the {#resource_action} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['policyType'] = 'scheduled'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.execution_schedule = attributes[:'executionSchedule'] if attributes[:'executionSchedule']

      raise 'You cannot provide both :executionSchedule and :execution_schedule' if attributes.key?(:'executionSchedule') && attributes.key?(:'execution_schedule')

      self.execution_schedule = attributes[:'execution_schedule'] if attributes[:'execution_schedule']

      self.resource_action = attributes[:'resourceAction'] if attributes[:'resourceAction']

      raise 'You cannot provide both :resourceAction and :resource_action' if attributes.key?(:'resourceAction') && attributes.key?(:'resource_action')

      self.resource_action = attributes[:'resource_action'] if attributes[:'resource_action']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        capacity == other.capacity &&
        id == other.id &&
        display_name == other.display_name &&
        policy_type == other.policy_type &&
        time_created == other.time_created &&
        is_enabled == other.is_enabled &&
        execution_schedule == other.execution_schedule &&
        resource_action == other.resource_action
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
      [capacity, id, display_name, policy_type, time_created, is_enabled, execution_schedule, resource_action].hash
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
