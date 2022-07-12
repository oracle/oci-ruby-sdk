# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information needed to create a new model.
  class AiVision::Models::CreateModelDetails
    # A human-friendly name for the model, which can be changed.
    # @return [String]
    attr_accessor :display_name

    # An optional description of the model.
    # @return [String]
    attr_accessor :description

    # The model version
    # @return [String]
    attr_accessor :model_version

    # **[Required]** Which type of Vision model this is.
    # @return [String]
    attr_accessor :model_type

    # **[Required]** The compartment identifier.
    # @return [String]
    attr_accessor :compartment_id

    # Set to true when experimenting with a new model type or dataset, so the model training is quick, with a predefined low number of passes through the training data.
    # @return [BOOLEAN]
    attr_accessor :is_quick_mode

    # The maximum model training duration in hours, expressed as a decimal fraction.
    # @return [Float]
    attr_accessor :max_training_duration_in_hours

    # This attribute is required.
    # @return [OCI::AiVision::Models::Dataset]
    attr_accessor :training_dataset

    # @return [OCI::AiVision::Models::Dataset]
    attr_accessor :testing_dataset

    # @return [OCI::AiVision::Models::Dataset]
    attr_accessor :validation_dataset

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the project that contains the model.
    # @return [String]
    attr_accessor :project_id

    # A simple key-value pair that is applied without any predefined name, type, or scope. It exists for cross-compatibility only.
    # For example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'model_version': :'modelVersion',
        'model_type': :'modelType',
        'compartment_id': :'compartmentId',
        'is_quick_mode': :'isQuickMode',
        'max_training_duration_in_hours': :'maxTrainingDurationInHours',
        'training_dataset': :'trainingDataset',
        'testing_dataset': :'testingDataset',
        'validation_dataset': :'validationDataset',
        'project_id': :'projectId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'model_version': :'String',
        'model_type': :'String',
        'compartment_id': :'String',
        'is_quick_mode': :'BOOLEAN',
        'max_training_duration_in_hours': :'Float',
        'training_dataset': :'OCI::AiVision::Models::Dataset',
        'testing_dataset': :'OCI::AiVision::Models::Dataset',
        'validation_dataset': :'OCI::AiVision::Models::Dataset',
        'project_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :model_version The value to assign to the {#model_version} property
    # @option attributes [String] :model_type The value to assign to the {#model_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_quick_mode The value to assign to the {#is_quick_mode} property
    # @option attributes [Float] :max_training_duration_in_hours The value to assign to the {#max_training_duration_in_hours} property
    # @option attributes [OCI::AiVision::Models::Dataset] :training_dataset The value to assign to the {#training_dataset} property
    # @option attributes [OCI::AiVision::Models::Dataset] :testing_dataset The value to assign to the {#testing_dataset} property
    # @option attributes [OCI::AiVision::Models::Dataset] :validation_dataset The value to assign to the {#validation_dataset} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']
      self.display_name = "" if display_name.nil? && !attributes.key?(:'displayName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']
      self.display_name = "" if display_name.nil? && !attributes.key?(:'displayName') && !attributes.key?(:'display_name') # rubocop:disable Style/StringLiterals

      self.description = attributes[:'description'] if attributes[:'description']
      self.description = "The description of the Model." if description.nil? && !attributes.key?(:'description') # rubocop:disable Style/StringLiterals

      self.model_version = attributes[:'modelVersion'] if attributes[:'modelVersion']

      raise 'You cannot provide both :modelVersion and :model_version' if attributes.key?(:'modelVersion') && attributes.key?(:'model_version')

      self.model_version = attributes[:'model_version'] if attributes[:'model_version']

      self.model_type = attributes[:'modelType'] if attributes[:'modelType']

      raise 'You cannot provide both :modelType and :model_type' if attributes.key?(:'modelType') && attributes.key?(:'model_type')

      self.model_type = attributes[:'model_type'] if attributes[:'model_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_quick_mode = attributes[:'isQuickMode'] unless attributes[:'isQuickMode'].nil?
      self.is_quick_mode = false if is_quick_mode.nil? && !attributes.key?(:'isQuickMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isQuickMode and :is_quick_mode' if attributes.key?(:'isQuickMode') && attributes.key?(:'is_quick_mode')

      self.is_quick_mode = attributes[:'is_quick_mode'] unless attributes[:'is_quick_mode'].nil?
      self.is_quick_mode = false if is_quick_mode.nil? && !attributes.key?(:'isQuickMode') && !attributes.key?(:'is_quick_mode') # rubocop:disable Style/StringLiterals

      self.max_training_duration_in_hours = attributes[:'maxTrainingDurationInHours'] if attributes[:'maxTrainingDurationInHours']

      raise 'You cannot provide both :maxTrainingDurationInHours and :max_training_duration_in_hours' if attributes.key?(:'maxTrainingDurationInHours') && attributes.key?(:'max_training_duration_in_hours')

      self.max_training_duration_in_hours = attributes[:'max_training_duration_in_hours'] if attributes[:'max_training_duration_in_hours']

      self.training_dataset = attributes[:'trainingDataset'] if attributes[:'trainingDataset']

      raise 'You cannot provide both :trainingDataset and :training_dataset' if attributes.key?(:'trainingDataset') && attributes.key?(:'training_dataset')

      self.training_dataset = attributes[:'training_dataset'] if attributes[:'training_dataset']

      self.testing_dataset = attributes[:'testingDataset'] if attributes[:'testingDataset']

      raise 'You cannot provide both :testingDataset and :testing_dataset' if attributes.key?(:'testingDataset') && attributes.key?(:'testing_dataset')

      self.testing_dataset = attributes[:'testing_dataset'] if attributes[:'testing_dataset']

      self.validation_dataset = attributes[:'validationDataset'] if attributes[:'validationDataset']

      raise 'You cannot provide both :validationDataset and :validation_dataset' if attributes.key?(:'validationDataset') && attributes.key?(:'validation_dataset')

      self.validation_dataset = attributes[:'validation_dataset'] if attributes[:'validation_dataset']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
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
        model_version == other.model_version &&
        model_type == other.model_type &&
        compartment_id == other.compartment_id &&
        is_quick_mode == other.is_quick_mode &&
        max_training_duration_in_hours == other.max_training_duration_in_hours &&
        training_dataset == other.training_dataset &&
        testing_dataset == other.testing_dataset &&
        validation_dataset == other.validation_dataset &&
        project_id == other.project_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [display_name, description, model_version, model_type, compartment_id, is_quick_mode, max_training_duration_in_hours, training_dataset, testing_dataset, validation_dataset, project_id, freeform_tags, defined_tags].hash
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
