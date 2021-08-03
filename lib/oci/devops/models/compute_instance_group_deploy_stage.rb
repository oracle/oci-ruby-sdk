# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'deploy_stage'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the instance group rolling deployment stage.
  class Devops::Models::ComputeInstanceGroupDeployStage < Devops::Models::DeployStage
    # **[Required]** A compute instance group environment OCID for rolling deployment.
    # @return [String]
    attr_accessor :compute_instance_group_deploy_environment_id

    # **[Required]** The OCID of the artifact that contains the deployment specification.
    # @return [String]
    attr_accessor :deployment_spec_deploy_artifact_id

    # Additional file artifact OCIDs.
    # @return [Array<String>]
    attr_accessor :deploy_artifact_ids

    # This attribute is required.
    # @return [OCI::Devops::Models::ComputeInstanceGroupRolloutPolicy]
    attr_accessor :rollout_policy

    # @return [OCI::Devops::Models::DeployStageRollbackPolicy]
    attr_accessor :rollback_policy

    # @return [OCI::Devops::Models::ComputeInstanceGroupFailurePolicy]
    attr_accessor :failure_policy

    # @return [OCI::Devops::Models::LoadBalancerConfig]
    attr_accessor :load_balancer_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'description': :'description',
        'display_name': :'displayName',
        'project_id': :'projectId',
        'deploy_pipeline_id': :'deployPipelineId',
        'compartment_id': :'compartmentId',
        'deploy_stage_type': :'deployStageType',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'deploy_stage_predecessor_collection': :'deployStagePredecessorCollection',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'compute_instance_group_deploy_environment_id': :'computeInstanceGroupDeployEnvironmentId',
        'deployment_spec_deploy_artifact_id': :'deploymentSpecDeployArtifactId',
        'deploy_artifact_ids': :'deployArtifactIds',
        'rollout_policy': :'rolloutPolicy',
        'rollback_policy': :'rollbackPolicy',
        'failure_policy': :'failurePolicy',
        'load_balancer_config': :'loadBalancerConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'description': :'String',
        'display_name': :'String',
        'project_id': :'String',
        'deploy_pipeline_id': :'String',
        'compartment_id': :'String',
        'deploy_stage_type': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'deploy_stage_predecessor_collection': :'OCI::Devops::Models::DeployStagePredecessorCollection',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'compute_instance_group_deploy_environment_id': :'String',
        'deployment_spec_deploy_artifact_id': :'String',
        'deploy_artifact_ids': :'Array<String>',
        'rollout_policy': :'OCI::Devops::Models::ComputeInstanceGroupRolloutPolicy',
        'rollback_policy': :'OCI::Devops::Models::DeployStageRollbackPolicy',
        'failure_policy': :'OCI::Devops::Models::ComputeInstanceGroupFailurePolicy',
        'load_balancer_config': :'OCI::Devops::Models::LoadBalancerConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Devops::Models::DeployStage#id #id} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Devops::Models::DeployStage#description #description} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Devops::Models::DeployStage#display_name #display_name} proprety
    # @option attributes [String] :project_id The value to assign to the {OCI::Devops::Models::DeployStage#project_id #project_id} proprety
    # @option attributes [String] :deploy_pipeline_id The value to assign to the {OCI::Devops::Models::DeployStage#deploy_pipeline_id #deploy_pipeline_id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Devops::Models::DeployStage#compartment_id #compartment_id} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Devops::Models::DeployStage#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Devops::Models::DeployStage#time_updated #time_updated} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Devops::Models::DeployStage#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::Devops::Models::DeployStage#lifecycle_details #lifecycle_details} proprety
    # @option attributes [OCI::Devops::Models::DeployStagePredecessorCollection] :deploy_stage_predecessor_collection The value to assign to the {OCI::Devops::Models::DeployStage#deploy_stage_predecessor_collection #deploy_stage_predecessor_collection} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Devops::Models::DeployStage#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Devops::Models::DeployStage#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::Devops::Models::DeployStage#system_tags #system_tags} proprety
    # @option attributes [String] :compute_instance_group_deploy_environment_id The value to assign to the {#compute_instance_group_deploy_environment_id} property
    # @option attributes [String] :deployment_spec_deploy_artifact_id The value to assign to the {#deployment_spec_deploy_artifact_id} property
    # @option attributes [Array<String>] :deploy_artifact_ids The value to assign to the {#deploy_artifact_ids} property
    # @option attributes [OCI::Devops::Models::ComputeInstanceGroupRolloutPolicy] :rollout_policy The value to assign to the {#rollout_policy} property
    # @option attributes [OCI::Devops::Models::DeployStageRollbackPolicy] :rollback_policy The value to assign to the {#rollback_policy} property
    # @option attributes [OCI::Devops::Models::ComputeInstanceGroupFailurePolicy] :failure_policy The value to assign to the {#failure_policy} property
    # @option attributes [OCI::Devops::Models::LoadBalancerConfig] :load_balancer_config The value to assign to the {#load_balancer_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['deployStageType'] = 'COMPUTE_INSTANCE_GROUP_ROLLING_DEPLOYMENT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compute_instance_group_deploy_environment_id = attributes[:'computeInstanceGroupDeployEnvironmentId'] if attributes[:'computeInstanceGroupDeployEnvironmentId']

      raise 'You cannot provide both :computeInstanceGroupDeployEnvironmentId and :compute_instance_group_deploy_environment_id' if attributes.key?(:'computeInstanceGroupDeployEnvironmentId') && attributes.key?(:'compute_instance_group_deploy_environment_id')

      self.compute_instance_group_deploy_environment_id = attributes[:'compute_instance_group_deploy_environment_id'] if attributes[:'compute_instance_group_deploy_environment_id']

      self.deployment_spec_deploy_artifact_id = attributes[:'deploymentSpecDeployArtifactId'] if attributes[:'deploymentSpecDeployArtifactId']

      raise 'You cannot provide both :deploymentSpecDeployArtifactId and :deployment_spec_deploy_artifact_id' if attributes.key?(:'deploymentSpecDeployArtifactId') && attributes.key?(:'deployment_spec_deploy_artifact_id')

      self.deployment_spec_deploy_artifact_id = attributes[:'deployment_spec_deploy_artifact_id'] if attributes[:'deployment_spec_deploy_artifact_id']

      self.deploy_artifact_ids = attributes[:'deployArtifactIds'] if attributes[:'deployArtifactIds']

      raise 'You cannot provide both :deployArtifactIds and :deploy_artifact_ids' if attributes.key?(:'deployArtifactIds') && attributes.key?(:'deploy_artifact_ids')

      self.deploy_artifact_ids = attributes[:'deploy_artifact_ids'] if attributes[:'deploy_artifact_ids']

      self.rollout_policy = attributes[:'rolloutPolicy'] if attributes[:'rolloutPolicy']

      raise 'You cannot provide both :rolloutPolicy and :rollout_policy' if attributes.key?(:'rolloutPolicy') && attributes.key?(:'rollout_policy')

      self.rollout_policy = attributes[:'rollout_policy'] if attributes[:'rollout_policy']

      self.rollback_policy = attributes[:'rollbackPolicy'] if attributes[:'rollbackPolicy']

      raise 'You cannot provide both :rollbackPolicy and :rollback_policy' if attributes.key?(:'rollbackPolicy') && attributes.key?(:'rollback_policy')

      self.rollback_policy = attributes[:'rollback_policy'] if attributes[:'rollback_policy']

      self.failure_policy = attributes[:'failurePolicy'] if attributes[:'failurePolicy']

      raise 'You cannot provide both :failurePolicy and :failure_policy' if attributes.key?(:'failurePolicy') && attributes.key?(:'failure_policy')

      self.failure_policy = attributes[:'failure_policy'] if attributes[:'failure_policy']

      self.load_balancer_config = attributes[:'loadBalancerConfig'] if attributes[:'loadBalancerConfig']

      raise 'You cannot provide both :loadBalancerConfig and :load_balancer_config' if attributes.key?(:'loadBalancerConfig') && attributes.key?(:'load_balancer_config')

      self.load_balancer_config = attributes[:'load_balancer_config'] if attributes[:'load_balancer_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        description == other.description &&
        display_name == other.display_name &&
        project_id == other.project_id &&
        deploy_pipeline_id == other.deploy_pipeline_id &&
        compartment_id == other.compartment_id &&
        deploy_stage_type == other.deploy_stage_type &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        deploy_stage_predecessor_collection == other.deploy_stage_predecessor_collection &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        compute_instance_group_deploy_environment_id == other.compute_instance_group_deploy_environment_id &&
        deployment_spec_deploy_artifact_id == other.deployment_spec_deploy_artifact_id &&
        deploy_artifact_ids == other.deploy_artifact_ids &&
        rollout_policy == other.rollout_policy &&
        rollback_policy == other.rollback_policy &&
        failure_policy == other.failure_policy &&
        load_balancer_config == other.load_balancer_config
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
      [id, description, display_name, project_id, deploy_pipeline_id, compartment_id, deploy_stage_type, time_created, time_updated, lifecycle_state, lifecycle_details, deploy_stage_predecessor_collection, freeform_tags, defined_tags, system_tags, compute_instance_group_deploy_environment_id, deployment_spec_deploy_artifact_id, deploy_artifact_ids, rollout_policy, rollback_policy, failure_policy, load_balancer_config].hash
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
