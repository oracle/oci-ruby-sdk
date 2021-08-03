# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'deploy_stage_execution_progress'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the manual approval stage specific execution details.
  class Devops::Models::ManualApprovalDeployStageExecutionProgress < Devops::Models::DeployStageExecutionProgress
    # @return [Array<OCI::Devops::Models::ApprovalAction>]
    attr_accessor :approval_actions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'deploy_stage_display_name': :'deployStageDisplayName',
        'deploy_stage_type': :'deployStageType',
        'deploy_stage_id': :'deployStageId',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'status': :'status',
        'deploy_stage_predecessors': :'deployStagePredecessors',
        'deploy_stage_execution_progress_details': :'deployStageExecutionProgressDetails',
        'approval_actions': :'approvalActions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'deploy_stage_display_name': :'String',
        'deploy_stage_type': :'String',
        'deploy_stage_id': :'String',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'status': :'String',
        'deploy_stage_predecessors': :'OCI::Devops::Models::DeployStagePredecessorCollection',
        'deploy_stage_execution_progress_details': :'Array<OCI::Devops::Models::DeployStageExecutionProgressDetails>',
        'approval_actions': :'Array<OCI::Devops::Models::ApprovalAction>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :deploy_stage_display_name The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#deploy_stage_display_name #deploy_stage_display_name} proprety
    # @option attributes [String] :deploy_stage_id The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#deploy_stage_id #deploy_stage_id} proprety
    # @option attributes [DateTime] :time_started The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#time_started #time_started} proprety
    # @option attributes [DateTime] :time_finished The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#time_finished #time_finished} proprety
    # @option attributes [String] :status The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#status #status} proprety
    # @option attributes [OCI::Devops::Models::DeployStagePredecessorCollection] :deploy_stage_predecessors The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#deploy_stage_predecessors #deploy_stage_predecessors} proprety
    # @option attributes [Array<OCI::Devops::Models::DeployStageExecutionProgressDetails>] :deploy_stage_execution_progress_details The value to assign to the {OCI::Devops::Models::DeployStageExecutionProgress#deploy_stage_execution_progress_details #deploy_stage_execution_progress_details} proprety
    # @option attributes [Array<OCI::Devops::Models::ApprovalAction>] :approval_actions The value to assign to the {#approval_actions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['deployStageType'] = 'MANUAL_APPROVAL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.approval_actions = attributes[:'approvalActions'] if attributes[:'approvalActions']

      raise 'You cannot provide both :approvalActions and :approval_actions' if attributes.key?(:'approvalActions') && attributes.key?(:'approval_actions')

      self.approval_actions = attributes[:'approval_actions'] if attributes[:'approval_actions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        deploy_stage_display_name == other.deploy_stage_display_name &&
        deploy_stage_type == other.deploy_stage_type &&
        deploy_stage_id == other.deploy_stage_id &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        status == other.status &&
        deploy_stage_predecessors == other.deploy_stage_predecessors &&
        deploy_stage_execution_progress_details == other.deploy_stage_execution_progress_details &&
        approval_actions == other.approval_actions
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
      [deploy_stage_display_name, deploy_stage_type, deploy_stage_id, time_started, time_finished, status, deploy_stage_predecessors, deploy_stage_execution_progress_details, approval_actions].hash
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
