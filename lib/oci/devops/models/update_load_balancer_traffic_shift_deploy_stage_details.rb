# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'update_deploy_stage_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies load balancer traffic shift stage.
  class Devops::Models::UpdateLoadBalancerTrafficShiftDeployStageDetails < Devops::Models::UpdateDeployStageDetails
    # @return [OCI::Devops::Models::BackendSetIpCollection]
    attr_accessor :blue_backend_ips

    # @return [OCI::Devops::Models::BackendSetIpCollection]
    attr_accessor :green_backend_ips

    # Specifies the target or destination backend set.
    # @return [String]
    attr_accessor :traffic_shift_target

    # @return [OCI::Devops::Models::LoadBalancerTrafficShiftRolloutPolicy]
    attr_accessor :rollout_policy

    # @return [OCI::Devops::Models::LoadBalancerConfig]
    attr_accessor :load_balancer_config

    # @return [OCI::Devops::Models::DeployStageRollbackPolicy]
    attr_accessor :rollback_policy

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'display_name': :'displayName',
        'deploy_stage_type': :'deployStageType',
        'deploy_stage_predecessor_collection': :'deployStagePredecessorCollection',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'blue_backend_ips': :'blueBackendIps',
        'green_backend_ips': :'greenBackendIps',
        'traffic_shift_target': :'trafficShiftTarget',
        'rollout_policy': :'rolloutPolicy',
        'load_balancer_config': :'loadBalancerConfig',
        'rollback_policy': :'rollbackPolicy'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'display_name': :'String',
        'deploy_stage_type': :'String',
        'deploy_stage_predecessor_collection': :'OCI::Devops::Models::DeployStagePredecessorCollection',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'blue_backend_ips': :'OCI::Devops::Models::BackendSetIpCollection',
        'green_backend_ips': :'OCI::Devops::Models::BackendSetIpCollection',
        'traffic_shift_target': :'String',
        'rollout_policy': :'OCI::Devops::Models::LoadBalancerTrafficShiftRolloutPolicy',
        'load_balancer_config': :'OCI::Devops::Models::LoadBalancerConfig',
        'rollback_policy': :'OCI::Devops::Models::DeployStageRollbackPolicy'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {OCI::Devops::Models::UpdateDeployStageDetails#description #description} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Devops::Models::UpdateDeployStageDetails#display_name #display_name} proprety
    # @option attributes [OCI::Devops::Models::DeployStagePredecessorCollection] :deploy_stage_predecessor_collection The value to assign to the {OCI::Devops::Models::UpdateDeployStageDetails#deploy_stage_predecessor_collection #deploy_stage_predecessor_collection} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Devops::Models::UpdateDeployStageDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Devops::Models::UpdateDeployStageDetails#defined_tags #defined_tags} proprety
    # @option attributes [OCI::Devops::Models::BackendSetIpCollection] :blue_backend_ips The value to assign to the {#blue_backend_ips} property
    # @option attributes [OCI::Devops::Models::BackendSetIpCollection] :green_backend_ips The value to assign to the {#green_backend_ips} property
    # @option attributes [String] :traffic_shift_target The value to assign to the {#traffic_shift_target} property
    # @option attributes [OCI::Devops::Models::LoadBalancerTrafficShiftRolloutPolicy] :rollout_policy The value to assign to the {#rollout_policy} property
    # @option attributes [OCI::Devops::Models::LoadBalancerConfig] :load_balancer_config The value to assign to the {#load_balancer_config} property
    # @option attributes [OCI::Devops::Models::DeployStageRollbackPolicy] :rollback_policy The value to assign to the {#rollback_policy} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['deployStageType'] = 'LOAD_BALANCER_TRAFFIC_SHIFT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.blue_backend_ips = attributes[:'blueBackendIps'] if attributes[:'blueBackendIps']

      raise 'You cannot provide both :blueBackendIps and :blue_backend_ips' if attributes.key?(:'blueBackendIps') && attributes.key?(:'blue_backend_ips')

      self.blue_backend_ips = attributes[:'blue_backend_ips'] if attributes[:'blue_backend_ips']

      self.green_backend_ips = attributes[:'greenBackendIps'] if attributes[:'greenBackendIps']

      raise 'You cannot provide both :greenBackendIps and :green_backend_ips' if attributes.key?(:'greenBackendIps') && attributes.key?(:'green_backend_ips')

      self.green_backend_ips = attributes[:'green_backend_ips'] if attributes[:'green_backend_ips']

      self.traffic_shift_target = attributes[:'trafficShiftTarget'] if attributes[:'trafficShiftTarget']

      raise 'You cannot provide both :trafficShiftTarget and :traffic_shift_target' if attributes.key?(:'trafficShiftTarget') && attributes.key?(:'traffic_shift_target')

      self.traffic_shift_target = attributes[:'traffic_shift_target'] if attributes[:'traffic_shift_target']

      self.rollout_policy = attributes[:'rolloutPolicy'] if attributes[:'rolloutPolicy']

      raise 'You cannot provide both :rolloutPolicy and :rollout_policy' if attributes.key?(:'rolloutPolicy') && attributes.key?(:'rollout_policy')

      self.rollout_policy = attributes[:'rollout_policy'] if attributes[:'rollout_policy']

      self.load_balancer_config = attributes[:'loadBalancerConfig'] if attributes[:'loadBalancerConfig']

      raise 'You cannot provide both :loadBalancerConfig and :load_balancer_config' if attributes.key?(:'loadBalancerConfig') && attributes.key?(:'load_balancer_config')

      self.load_balancer_config = attributes[:'load_balancer_config'] if attributes[:'load_balancer_config']

      self.rollback_policy = attributes[:'rollbackPolicy'] if attributes[:'rollbackPolicy']

      raise 'You cannot provide both :rollbackPolicy and :rollback_policy' if attributes.key?(:'rollbackPolicy') && attributes.key?(:'rollback_policy')

      self.rollback_policy = attributes[:'rollback_policy'] if attributes[:'rollback_policy']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        display_name == other.display_name &&
        deploy_stage_type == other.deploy_stage_type &&
        deploy_stage_predecessor_collection == other.deploy_stage_predecessor_collection &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        blue_backend_ips == other.blue_backend_ips &&
        green_backend_ips == other.green_backend_ips &&
        traffic_shift_target == other.traffic_shift_target &&
        rollout_policy == other.rollout_policy &&
        load_balancer_config == other.load_balancer_config &&
        rollback_policy == other.rollback_policy
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
      [description, display_name, deploy_stage_type, deploy_stage_predecessor_collection, freeform_tags, defined_tags, blue_backend_ips, green_backend_ips, traffic_shift_target, rollout_policy, load_balancer_config, rollback_policy].hash
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
