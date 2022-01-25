# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A dataset is a logical collection of records. The dataset contains all the information necessary to describe a record's source, format, type of annotations allowed on these records, and labels allowed on annotations.
  #
  class DataLabelingService::Models::Dataset
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the Dataset.
    # @return [String]
    attr_accessor :id

    # A user-friendly display name for the resource.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment of the resource.
    # @return [String]
    attr_accessor :compartment_id

    # A user provided description of the dataset
    # @return [String]
    attr_accessor :description

    # **[Required]** The date and time the resource was created, in the timestamp format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the resource was last updated, in the timestamp format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The state of a dataset.
    # CREATING - The dataset is being created.  It will transition to ACTIVE when it is ready for labeling.
    # ACTIVE   - The dataset is ready for labeling.
    # UPDATING - The dataset is being updated.  It and its related resources may be unavailable for other updates until it returns to ACTIVE.
    # NEEDS_ATTENTION - A dataset updation operation has failed due to validation or other errors and needs attention.
    # DELETING - The dataset and its related resources are being deleted.
    # DELETED  - The dataset has been deleted and is no longer available.
    # FAILED   - The dataset has failed due to validation or other errors.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, it can be used to provide actionable information for a resource in FAILED or NEEDS_ATTENTION state.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The annotation format name required for labeling records.
    # @return [String]
    attr_accessor :annotation_format

    # This attribute is required.
    # @return [OCI::DataLabelingService::Models::DatasetSourceDetails]
    attr_accessor :dataset_source_details

    # This attribute is required.
    # @return [OCI::DataLabelingService::Models::DatasetFormatDetails]
    attr_accessor :dataset_format_details

    # This attribute is required.
    # @return [OCI::DataLabelingService::Models::LabelSet]
    attr_accessor :label_set

    # @return [OCI::DataLabelingService::Models::InitialRecordGenerationConfiguration]
    attr_accessor :initial_record_generation_configuration

    # The labeling instructions for human labelers in rich text format
    # @return [String]
    attr_accessor :labeling_instructions

    # A simple key-value pair that is applied without any predefined name, type, or scope. It exists for cross-compatibility only.
    # For example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The usage of system tag keys. These predefined keys are scoped to namespaces.
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
        'compartment_id': :'compartmentId',
        'description': :'description',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'annotation_format': :'annotationFormat',
        'dataset_source_details': :'datasetSourceDetails',
        'dataset_format_details': :'datasetFormatDetails',
        'label_set': :'labelSet',
        'initial_record_generation_configuration': :'initialRecordGenerationConfiguration',
        'labeling_instructions': :'labelingInstructions',
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
        'compartment_id': :'String',
        'description': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'annotation_format': :'String',
        'dataset_source_details': :'OCI::DataLabelingService::Models::DatasetSourceDetails',
        'dataset_format_details': :'OCI::DataLabelingService::Models::DatasetFormatDetails',
        'label_set': :'OCI::DataLabelingService::Models::LabelSet',
        'initial_record_generation_configuration': :'OCI::DataLabelingService::Models::InitialRecordGenerationConfiguration',
        'labeling_instructions': :'String',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :annotation_format The value to assign to the {#annotation_format} property
    # @option attributes [OCI::DataLabelingService::Models::DatasetSourceDetails] :dataset_source_details The value to assign to the {#dataset_source_details} property
    # @option attributes [OCI::DataLabelingService::Models::DatasetFormatDetails] :dataset_format_details The value to assign to the {#dataset_format_details} property
    # @option attributes [OCI::DataLabelingService::Models::LabelSet] :label_set The value to assign to the {#label_set} property
    # @option attributes [OCI::DataLabelingService::Models::InitialRecordGenerationConfiguration] :initial_record_generation_configuration The value to assign to the {#initial_record_generation_configuration} property
    # @option attributes [String] :labeling_instructions The value to assign to the {#labeling_instructions} property
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

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

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

      self.annotation_format = attributes[:'annotationFormat'] if attributes[:'annotationFormat']

      raise 'You cannot provide both :annotationFormat and :annotation_format' if attributes.key?(:'annotationFormat') && attributes.key?(:'annotation_format')

      self.annotation_format = attributes[:'annotation_format'] if attributes[:'annotation_format']

      self.dataset_source_details = attributes[:'datasetSourceDetails'] if attributes[:'datasetSourceDetails']

      raise 'You cannot provide both :datasetSourceDetails and :dataset_source_details' if attributes.key?(:'datasetSourceDetails') && attributes.key?(:'dataset_source_details')

      self.dataset_source_details = attributes[:'dataset_source_details'] if attributes[:'dataset_source_details']

      self.dataset_format_details = attributes[:'datasetFormatDetails'] if attributes[:'datasetFormatDetails']

      raise 'You cannot provide both :datasetFormatDetails and :dataset_format_details' if attributes.key?(:'datasetFormatDetails') && attributes.key?(:'dataset_format_details')

      self.dataset_format_details = attributes[:'dataset_format_details'] if attributes[:'dataset_format_details']

      self.label_set = attributes[:'labelSet'] if attributes[:'labelSet']

      raise 'You cannot provide both :labelSet and :label_set' if attributes.key?(:'labelSet') && attributes.key?(:'label_set')

      self.label_set = attributes[:'label_set'] if attributes[:'label_set']

      self.initial_record_generation_configuration = attributes[:'initialRecordGenerationConfiguration'] if attributes[:'initialRecordGenerationConfiguration']

      raise 'You cannot provide both :initialRecordGenerationConfiguration and :initial_record_generation_configuration' if attributes.key?(:'initialRecordGenerationConfiguration') && attributes.key?(:'initial_record_generation_configuration')

      self.initial_record_generation_configuration = attributes[:'initial_record_generation_configuration'] if attributes[:'initial_record_generation_configuration']

      self.labeling_instructions = attributes[:'labelingInstructions'] if attributes[:'labelingInstructions']

      raise 'You cannot provide both :labelingInstructions and :labeling_instructions' if attributes.key?(:'labelingInstructions') && attributes.key?(:'labeling_instructions')

      self.labeling_instructions = attributes[:'labeling_instructions'] if attributes[:'labeling_instructions']

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
        compartment_id == other.compartment_id &&
        description == other.description &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        annotation_format == other.annotation_format &&
        dataset_source_details == other.dataset_source_details &&
        dataset_format_details == other.dataset_format_details &&
        label_set == other.label_set &&
        initial_record_generation_configuration == other.initial_record_generation_configuration &&
        labeling_instructions == other.labeling_instructions &&
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
      [id, display_name, compartment_id, description, time_created, time_updated, lifecycle_state, lifecycle_details, annotation_format, dataset_source_details, dataset_format_details, label_set, initial_record_generation_configuration, labeling_instructions, freeform_tags, defined_tags, system_tags].hash
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
