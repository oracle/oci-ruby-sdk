# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_build_pipeline_stage_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the build stage.
  class Devops::Models::CreateBuildStageDetails < Devops::Models::CreateBuildPipelineStageDetails
    # **[Required]** Image name for the build environment
    # @return [String]
    attr_accessor :image

    # The path to the build specification file for this environment. The default location of the file if not specified is build_spec.yaml.
    # @return [String]
    attr_accessor :build_spec_file

    # Timeout for the build stage execution. Specify value in seconds.
    # @return [Integer]
    attr_accessor :stage_execution_timeout_in_seconds

    # This attribute is required.
    # @return [OCI::Devops::Models::BuildSourceCollection]
    attr_accessor :build_source_collection

    # Name of the build source where the build_spec.yml file is located. If not specified, the first entry in the build source collection is chosen as primary build source.
    # @return [String]
    attr_accessor :primary_build_source

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'build_pipeline_stage_type': :'buildPipelineStageType',
        'build_pipeline_id': :'buildPipelineId',
        'build_pipeline_stage_predecessor_collection': :'buildPipelineStagePredecessorCollection',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'image': :'image',
        'build_spec_file': :'buildSpecFile',
        'stage_execution_timeout_in_seconds': :'stageExecutionTimeoutInSeconds',
        'build_source_collection': :'buildSourceCollection',
        'primary_build_source': :'primaryBuildSource'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'build_pipeline_stage_type': :'String',
        'build_pipeline_id': :'String',
        'build_pipeline_stage_predecessor_collection': :'OCI::Devops::Models::BuildPipelineStagePredecessorCollection',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'image': :'String',
        'build_spec_file': :'String',
        'stage_execution_timeout_in_seconds': :'Integer',
        'build_source_collection': :'OCI::Devops::Models::BuildSourceCollection',
        'primary_build_source': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::Devops::Models::CreateBuildPipelineStageDetails#display_name #display_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Devops::Models::CreateBuildPipelineStageDetails#description #description} proprety
    # @option attributes [String] :build_pipeline_id The value to assign to the {OCI::Devops::Models::CreateBuildPipelineStageDetails#build_pipeline_id #build_pipeline_id} proprety
    # @option attributes [OCI::Devops::Models::BuildPipelineStagePredecessorCollection] :build_pipeline_stage_predecessor_collection The value to assign to the {OCI::Devops::Models::CreateBuildPipelineStageDetails#build_pipeline_stage_predecessor_collection #build_pipeline_stage_predecessor_collection} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Devops::Models::CreateBuildPipelineStageDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Devops::Models::CreateBuildPipelineStageDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :image The value to assign to the {#image} property
    # @option attributes [String] :build_spec_file The value to assign to the {#build_spec_file} property
    # @option attributes [Integer] :stage_execution_timeout_in_seconds The value to assign to the {#stage_execution_timeout_in_seconds} property
    # @option attributes [OCI::Devops::Models::BuildSourceCollection] :build_source_collection The value to assign to the {#build_source_collection} property
    # @option attributes [String] :primary_build_source The value to assign to the {#primary_build_source} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['buildPipelineStageType'] = 'BUILD'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.image = attributes[:'image'] if attributes[:'image']

      self.build_spec_file = attributes[:'buildSpecFile'] if attributes[:'buildSpecFile']

      raise 'You cannot provide both :buildSpecFile and :build_spec_file' if attributes.key?(:'buildSpecFile') && attributes.key?(:'build_spec_file')

      self.build_spec_file = attributes[:'build_spec_file'] if attributes[:'build_spec_file']

      self.stage_execution_timeout_in_seconds = attributes[:'stageExecutionTimeoutInSeconds'] if attributes[:'stageExecutionTimeoutInSeconds']

      raise 'You cannot provide both :stageExecutionTimeoutInSeconds and :stage_execution_timeout_in_seconds' if attributes.key?(:'stageExecutionTimeoutInSeconds') && attributes.key?(:'stage_execution_timeout_in_seconds')

      self.stage_execution_timeout_in_seconds = attributes[:'stage_execution_timeout_in_seconds'] if attributes[:'stage_execution_timeout_in_seconds']

      self.build_source_collection = attributes[:'buildSourceCollection'] if attributes[:'buildSourceCollection']

      raise 'You cannot provide both :buildSourceCollection and :build_source_collection' if attributes.key?(:'buildSourceCollection') && attributes.key?(:'build_source_collection')

      self.build_source_collection = attributes[:'build_source_collection'] if attributes[:'build_source_collection']

      self.primary_build_source = attributes[:'primaryBuildSource'] if attributes[:'primaryBuildSource']

      raise 'You cannot provide both :primaryBuildSource and :primary_build_source' if attributes.key?(:'primaryBuildSource') && attributes.key?(:'primary_build_source')

      self.primary_build_source = attributes[:'primary_build_source'] if attributes[:'primary_build_source']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        description == other.description &&
        build_pipeline_stage_type == other.build_pipeline_stage_type &&
        build_pipeline_id == other.build_pipeline_id &&
        build_pipeline_stage_predecessor_collection == other.build_pipeline_stage_predecessor_collection &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        image == other.image &&
        build_spec_file == other.build_spec_file &&
        stage_execution_timeout_in_seconds == other.stage_execution_timeout_in_seconds &&
        build_source_collection == other.build_source_collection &&
        primary_build_source == other.primary_build_source
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
      [display_name, description, build_pipeline_stage_type, build_pipeline_id, build_pipeline_stage_predecessor_collection, freeform_tags, defined_tags, image, build_spec_file, stage_execution_timeout_in_seconds, build_source_collection, primary_build_source].hash
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
