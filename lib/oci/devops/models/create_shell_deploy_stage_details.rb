# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210630
require 'date'
require_relative 'create_deploy_stage_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the shell stage.
  class Devops::Models::CreateShellDeployStageDetails < Devops::Models::CreateDeployStageDetails
    # This attribute is required.
    # @return [OCI::Devops::Models::ContainerConfig]
    attr_accessor :container_config

    # **[Required]** The OCID of the artifact that contains the command specification.
    # @return [String]
    attr_accessor :command_spec_deploy_artifact_id

    # Time to wait for execution of a shell stage. Defaults to 36000 seconds.
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'display_name': :'displayName',
        'deploy_stage_type': :'deployStageType',
        'deploy_pipeline_id': :'deployPipelineId',
        'deploy_stage_predecessor_collection': :'deployStagePredecessorCollection',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'container_config': :'containerConfig',
        'command_spec_deploy_artifact_id': :'commandSpecDeployArtifactId',
        'timeout_in_seconds': :'timeoutInSeconds'
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
        'deploy_pipeline_id': :'String',
        'deploy_stage_predecessor_collection': :'OCI::Devops::Models::DeployStagePredecessorCollection',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'container_config': :'OCI::Devops::Models::ContainerConfig',
        'command_spec_deploy_artifact_id': :'String',
        'timeout_in_seconds': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {OCI::Devops::Models::CreateDeployStageDetails#description #description} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Devops::Models::CreateDeployStageDetails#display_name #display_name} proprety
    # @option attributes [String] :deploy_pipeline_id The value to assign to the {OCI::Devops::Models::CreateDeployStageDetails#deploy_pipeline_id #deploy_pipeline_id} proprety
    # @option attributes [OCI::Devops::Models::DeployStagePredecessorCollection] :deploy_stage_predecessor_collection The value to assign to the {OCI::Devops::Models::CreateDeployStageDetails#deploy_stage_predecessor_collection #deploy_stage_predecessor_collection} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Devops::Models::CreateDeployStageDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Devops::Models::CreateDeployStageDetails#defined_tags #defined_tags} proprety
    # @option attributes [OCI::Devops::Models::ContainerConfig] :container_config The value to assign to the {#container_config} property
    # @option attributes [String] :command_spec_deploy_artifact_id The value to assign to the {#command_spec_deploy_artifact_id} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['deployStageType'] = 'SHELL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.container_config = attributes[:'containerConfig'] if attributes[:'containerConfig']

      raise 'You cannot provide both :containerConfig and :container_config' if attributes.key?(:'containerConfig') && attributes.key?(:'container_config')

      self.container_config = attributes[:'container_config'] if attributes[:'container_config']

      self.command_spec_deploy_artifact_id = attributes[:'commandSpecDeployArtifactId'] if attributes[:'commandSpecDeployArtifactId']

      raise 'You cannot provide both :commandSpecDeployArtifactId and :command_spec_deploy_artifact_id' if attributes.key?(:'commandSpecDeployArtifactId') && attributes.key?(:'command_spec_deploy_artifact_id')

      self.command_spec_deploy_artifact_id = attributes[:'command_spec_deploy_artifact_id'] if attributes[:'command_spec_deploy_artifact_id']

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']
      self.timeout_in_seconds = 36000 if timeout_in_seconds.nil? && !attributes.key?(:'timeoutInSeconds') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']
      self.timeout_in_seconds = 36000 if timeout_in_seconds.nil? && !attributes.key?(:'timeoutInSeconds') && !attributes.key?(:'timeout_in_seconds') # rubocop:disable Style/StringLiterals
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
        deploy_pipeline_id == other.deploy_pipeline_id &&
        deploy_stage_predecessor_collection == other.deploy_stage_predecessor_collection &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        container_config == other.container_config &&
        command_spec_deploy_artifact_id == other.command_spec_deploy_artifact_id &&
        timeout_in_seconds == other.timeout_in_seconds
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
      [description, display_name, deploy_stage_type, deploy_pipeline_id, deploy_stage_predecessor_collection, freeform_tags, defined_tags, container_config, command_spec_deploy_artifact_id, timeout_in_seconds].hash
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
