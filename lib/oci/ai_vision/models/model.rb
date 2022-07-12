# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Machine-learned Model.
  class AiVision::Models::Model
    MODEL_TYPE_ENUM = [
      MODEL_TYPE_IMAGE_CLASSIFICATION = 'IMAGE_CLASSIFICATION'.freeze,
      MODEL_TYPE_OBJECT_DETECTION = 'OBJECT_DETECTION'.freeze,
      MODEL_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** A unique identifier that is immutable after creation.
    # @return [String]
    attr_accessor :id

    # A human-friendly name for the model, which can be changed.
    # @return [String]
    attr_accessor :display_name

    # An optional description of the model.
    # @return [String]
    attr_accessor :description

    # **[Required]** The compartment identifier.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** What type of Vision model this is.
    # @return [String]
    attr_reader :model_type

    # Set to true when experimenting with a new model type or dataset, so model training is quick, with a predefined low number of passes through the training data.
    # @return [BOOLEAN]
    attr_accessor :is_quick_mode

    # The maximum model training duration in hours, expressed as a decimal fraction.
    # @return [Float]
    attr_accessor :max_training_duration_in_hours

    # The total hours actually used for model training.
    # @return [Float]
    attr_accessor :trained_duration_in_hours

    # This attribute is required.
    # @return [OCI::AiVision::Models::Dataset]
    attr_accessor :training_dataset

    # @return [OCI::AiVision::Models::Dataset]
    attr_accessor :testing_dataset

    # @return [OCI::AiVision::Models::Dataset]
    attr_accessor :validation_dataset

    # **[Required]** The version of the model.
    # @return [String]
    attr_accessor :model_version

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the project that contains the model.
    # @return [String]
    attr_accessor :project_id

    # **[Required]** When the model was created, as an RFC3339 datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # When the model was updated, as an RFC3339 datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the model.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail, that can provide actionable information if training failed.
    # @return [String]
    attr_accessor :lifecycle_details

    # The precision of the trained model.
    # @return [Float]
    attr_accessor :precision

    # Recall of the trained model.
    # @return [Float]
    attr_accessor :recall

    # The mean average precision of the trained model.
    # @return [Float]
    attr_accessor :average_precision

    # The intersection over the union threshold used for calculating precision and recall.
    # @return [Float]
    attr_accessor :confidence_threshold

    # The number of images in the dataset used to train, validate, and test the model.
    # @return [Integer]
    attr_accessor :total_image_count

    # The number of images set aside for evaluating model performance metrics after training.
    # @return [Integer]
    attr_accessor :test_image_count

    # The complete set of per-label metrics for successfully trained models.
    # @return [String]
    attr_accessor :metrics

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

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # For example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'model_type': :'modelType',
        'is_quick_mode': :'isQuickMode',
        'max_training_duration_in_hours': :'maxTrainingDurationInHours',
        'trained_duration_in_hours': :'trainedDurationInHours',
        'training_dataset': :'trainingDataset',
        'testing_dataset': :'testingDataset',
        'validation_dataset': :'validationDataset',
        'model_version': :'modelVersion',
        'project_id': :'projectId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'precision': :'precision',
        'recall': :'recall',
        'average_precision': :'averagePrecision',
        'confidence_threshold': :'confidenceThreshold',
        'total_image_count': :'totalImageCount',
        'test_image_count': :'testImageCount',
        'metrics': :'metrics',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'model_type': :'String',
        'is_quick_mode': :'BOOLEAN',
        'max_training_duration_in_hours': :'Float',
        'trained_duration_in_hours': :'Float',
        'training_dataset': :'OCI::AiVision::Models::Dataset',
        'testing_dataset': :'OCI::AiVision::Models::Dataset',
        'validation_dataset': :'OCI::AiVision::Models::Dataset',
        'model_version': :'String',
        'project_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'precision': :'Float',
        'recall': :'Float',
        'average_precision': :'Float',
        'confidence_threshold': :'Float',
        'total_image_count': :'Integer',
        'test_image_count': :'Integer',
        'metrics': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :model_type The value to assign to the {#model_type} property
    # @option attributes [BOOLEAN] :is_quick_mode The value to assign to the {#is_quick_mode} property
    # @option attributes [Float] :max_training_duration_in_hours The value to assign to the {#max_training_duration_in_hours} property
    # @option attributes [Float] :trained_duration_in_hours The value to assign to the {#trained_duration_in_hours} property
    # @option attributes [OCI::AiVision::Models::Dataset] :training_dataset The value to assign to the {#training_dataset} property
    # @option attributes [OCI::AiVision::Models::Dataset] :testing_dataset The value to assign to the {#testing_dataset} property
    # @option attributes [OCI::AiVision::Models::Dataset] :validation_dataset The value to assign to the {#validation_dataset} property
    # @option attributes [String] :model_version The value to assign to the {#model_version} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Float] :precision The value to assign to the {#precision} property
    # @option attributes [Float] :recall The value to assign to the {#recall} property
    # @option attributes [Float] :average_precision The value to assign to the {#average_precision} property
    # @option attributes [Float] :confidence_threshold The value to assign to the {#confidence_threshold} property
    # @option attributes [Integer] :total_image_count The value to assign to the {#total_image_count} property
    # @option attributes [Integer] :test_image_count The value to assign to the {#test_image_count} property
    # @option attributes [String] :metrics The value to assign to the {#metrics} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.model_type = attributes[:'modelType'] if attributes[:'modelType']

      raise 'You cannot provide both :modelType and :model_type' if attributes.key?(:'modelType') && attributes.key?(:'model_type')

      self.model_type = attributes[:'model_type'] if attributes[:'model_type']

      self.is_quick_mode = attributes[:'isQuickMode'] unless attributes[:'isQuickMode'].nil?
      self.is_quick_mode = false if is_quick_mode.nil? && !attributes.key?(:'isQuickMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isQuickMode and :is_quick_mode' if attributes.key?(:'isQuickMode') && attributes.key?(:'is_quick_mode')

      self.is_quick_mode = attributes[:'is_quick_mode'] unless attributes[:'is_quick_mode'].nil?
      self.is_quick_mode = false if is_quick_mode.nil? && !attributes.key?(:'isQuickMode') && !attributes.key?(:'is_quick_mode') # rubocop:disable Style/StringLiterals

      self.max_training_duration_in_hours = attributes[:'maxTrainingDurationInHours'] if attributes[:'maxTrainingDurationInHours']

      raise 'You cannot provide both :maxTrainingDurationInHours and :max_training_duration_in_hours' if attributes.key?(:'maxTrainingDurationInHours') && attributes.key?(:'max_training_duration_in_hours')

      self.max_training_duration_in_hours = attributes[:'max_training_duration_in_hours'] if attributes[:'max_training_duration_in_hours']

      self.trained_duration_in_hours = attributes[:'trainedDurationInHours'] if attributes[:'trainedDurationInHours']

      raise 'You cannot provide both :trainedDurationInHours and :trained_duration_in_hours' if attributes.key?(:'trainedDurationInHours') && attributes.key?(:'trained_duration_in_hours')

      self.trained_duration_in_hours = attributes[:'trained_duration_in_hours'] if attributes[:'trained_duration_in_hours']

      self.training_dataset = attributes[:'trainingDataset'] if attributes[:'trainingDataset']

      raise 'You cannot provide both :trainingDataset and :training_dataset' if attributes.key?(:'trainingDataset') && attributes.key?(:'training_dataset')

      self.training_dataset = attributes[:'training_dataset'] if attributes[:'training_dataset']

      self.testing_dataset = attributes[:'testingDataset'] if attributes[:'testingDataset']

      raise 'You cannot provide both :testingDataset and :testing_dataset' if attributes.key?(:'testingDataset') && attributes.key?(:'testing_dataset')

      self.testing_dataset = attributes[:'testing_dataset'] if attributes[:'testing_dataset']

      self.validation_dataset = attributes[:'validationDataset'] if attributes[:'validationDataset']

      raise 'You cannot provide both :validationDataset and :validation_dataset' if attributes.key?(:'validationDataset') && attributes.key?(:'validation_dataset')

      self.validation_dataset = attributes[:'validation_dataset'] if attributes[:'validation_dataset']

      self.model_version = attributes[:'modelVersion'] if attributes[:'modelVersion']

      raise 'You cannot provide both :modelVersion and :model_version' if attributes.key?(:'modelVersion') && attributes.key?(:'model_version')

      self.model_version = attributes[:'model_version'] if attributes[:'model_version']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.precision = attributes[:'precision'] if attributes[:'precision']

      self.recall = attributes[:'recall'] if attributes[:'recall']

      self.average_precision = attributes[:'averagePrecision'] if attributes[:'averagePrecision']

      raise 'You cannot provide both :averagePrecision and :average_precision' if attributes.key?(:'averagePrecision') && attributes.key?(:'average_precision')

      self.average_precision = attributes[:'average_precision'] if attributes[:'average_precision']

      self.confidence_threshold = attributes[:'confidenceThreshold'] if attributes[:'confidenceThreshold']

      raise 'You cannot provide both :confidenceThreshold and :confidence_threshold' if attributes.key?(:'confidenceThreshold') && attributes.key?(:'confidence_threshold')

      self.confidence_threshold = attributes[:'confidence_threshold'] if attributes[:'confidence_threshold']

      self.total_image_count = attributes[:'totalImageCount'] if attributes[:'totalImageCount']

      raise 'You cannot provide both :totalImageCount and :total_image_count' if attributes.key?(:'totalImageCount') && attributes.key?(:'total_image_count')

      self.total_image_count = attributes[:'total_image_count'] if attributes[:'total_image_count']

      self.test_image_count = attributes[:'testImageCount'] if attributes[:'testImageCount']

      raise 'You cannot provide both :testImageCount and :test_image_count' if attributes.key?(:'testImageCount') && attributes.key?(:'test_image_count')

      self.test_image_count = attributes[:'test_image_count'] if attributes[:'test_image_count']

      self.metrics = attributes[:'metrics'] if attributes[:'metrics']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] model_type Object to be assigned
    def model_type=(model_type)
      # rubocop:disable Style/ConditionalAssignment
      if model_type && !MODEL_TYPE_ENUM.include?(model_type)
        OCI.logger.debug("Unknown value for 'model_type' [" + model_type + "]. Mapping to 'MODEL_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @model_type = MODEL_TYPE_UNKNOWN_ENUM_VALUE
      else
        @model_type = model_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        model_type == other.model_type &&
        is_quick_mode == other.is_quick_mode &&
        max_training_duration_in_hours == other.max_training_duration_in_hours &&
        trained_duration_in_hours == other.trained_duration_in_hours &&
        training_dataset == other.training_dataset &&
        testing_dataset == other.testing_dataset &&
        validation_dataset == other.validation_dataset &&
        model_version == other.model_version &&
        project_id == other.project_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        precision == other.precision &&
        recall == other.recall &&
        average_precision == other.average_precision &&
        confidence_threshold == other.confidence_threshold &&
        total_image_count == other.total_image_count &&
        test_image_count == other.test_image_count &&
        metrics == other.metrics &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, display_name, description, compartment_id, model_type, is_quick_mode, max_training_duration_in_hours, trained_duration_in_hours, training_dataset, testing_dataset, validation_dataset, model_version, project_id, time_created, time_updated, lifecycle_state, lifecycle_details, precision, recall, average_precision, confidence_threshold, total_image_count, test_image_count, metrics, freeform_tags, defined_tags, system_tags].hash
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
