# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about stage execution for each target environment.
  class Devops::Models::DeployStageExecutionProgressDetails
    # The function ID, instance ID or the cluster ID. For Wait stage it will be the stage ID.
    # @return [String]
    attr_accessor :target_id

    # Group for the target environment for example, the batch number for an Instance Group deployment.
    # @return [String]
    attr_accessor :target_group

    # Details about all the steps for one target environment.
    # @return [Array<OCI::Devops::Models::DeployStageExecutionStep>]
    attr_accessor :steps

    # Details about all the rollback steps for one target environment.
    # @return [Array<OCI::Devops::Models::DeployStageExecutionStep>]
    attr_accessor :rollback_steps

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_id': :'targetId',
        'target_group': :'targetGroup',
        'steps': :'steps',
        'rollback_steps': :'rollbackSteps'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_id': :'String',
        'target_group': :'String',
        'steps': :'Array<OCI::Devops::Models::DeployStageExecutionStep>',
        'rollback_steps': :'Array<OCI::Devops::Models::DeployStageExecutionStep>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :target_group The value to assign to the {#target_group} property
    # @option attributes [Array<OCI::Devops::Models::DeployStageExecutionStep>] :steps The value to assign to the {#steps} property
    # @option attributes [Array<OCI::Devops::Models::DeployStageExecutionStep>] :rollback_steps The value to assign to the {#rollback_steps} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.target_group = attributes[:'targetGroup'] if attributes[:'targetGroup']

      raise 'You cannot provide both :targetGroup and :target_group' if attributes.key?(:'targetGroup') && attributes.key?(:'target_group')

      self.target_group = attributes[:'target_group'] if attributes[:'target_group']

      self.steps = attributes[:'steps'] if attributes[:'steps']

      self.rollback_steps = attributes[:'rollbackSteps'] if attributes[:'rollbackSteps']

      raise 'You cannot provide both :rollbackSteps and :rollback_steps' if attributes.key?(:'rollbackSteps') && attributes.key?(:'rollback_steps')

      self.rollback_steps = attributes[:'rollback_steps'] if attributes[:'rollback_steps']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_id == other.target_id &&
        target_group == other.target_group &&
        steps == other.steps &&
        rollback_steps == other.rollback_steps
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
      [target_id, target_group, steps, rollback_steps].hash
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
