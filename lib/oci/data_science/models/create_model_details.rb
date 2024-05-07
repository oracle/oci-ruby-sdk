# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters needed to create a new model. Models are mathematical representations of the relationships between data. Models are represented by their associated metadata and artifact.
  class DataScience::Models::CreateModelDetails
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment to create the model in.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the project to associate with the model.
    # @return [String]
    attr_accessor :project_id

    # A user-friendly display name for the resource. It does not have to be unique and can be modified. Avoid entering confidential information.
    # Example: `My Model`
    #
    # @return [String]
    attr_accessor :display_name

    # A short description of the model.
    # @return [String]
    attr_accessor :description

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # An array of custom metadata details for the model.
    # @return [Array<OCI::DataScience::Models::Metadata>]
    attr_accessor :custom_metadata_list

    # An array of defined metadata details for the model.
    # @return [Array<OCI::DataScience::Models::Metadata>]
    attr_accessor :defined_metadata_list

    # Input schema file content in String format
    # @return [String]
    attr_accessor :input_schema

    # Output schema file content in String format
    # @return [String]
    attr_accessor :output_schema

    # The OCID of the model version set that the model is associated to.
    # @return [String]
    attr_accessor :model_version_set_id

    # The version label can add an additional description of the lifecycle state of the model or the application using/training the model.
    # @return [String]
    attr_accessor :version_label

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'project_id': :'projectId',
        'display_name': :'displayName',
        'description': :'description',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'custom_metadata_list': :'customMetadataList',
        'defined_metadata_list': :'definedMetadataList',
        'input_schema': :'inputSchema',
        'output_schema': :'outputSchema',
        'model_version_set_id': :'modelVersionSetId',
        'version_label': :'versionLabel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'project_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'custom_metadata_list': :'Array<OCI::DataScience::Models::Metadata>',
        'defined_metadata_list': :'Array<OCI::DataScience::Models::Metadata>',
        'input_schema': :'String',
        'output_schema': :'String',
        'model_version_set_id': :'String',
        'version_label': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Array<OCI::DataScience::Models::Metadata>] :custom_metadata_list The value to assign to the {#custom_metadata_list} property
    # @option attributes [Array<OCI::DataScience::Models::Metadata>] :defined_metadata_list The value to assign to the {#defined_metadata_list} property
    # @option attributes [String] :input_schema The value to assign to the {#input_schema} property
    # @option attributes [String] :output_schema The value to assign to the {#output_schema} property
    # @option attributes [String] :model_version_set_id The value to assign to the {#model_version_set_id} property
    # @option attributes [String] :version_label The value to assign to the {#version_label} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.custom_metadata_list = attributes[:'customMetadataList'] if attributes[:'customMetadataList']

      raise 'You cannot provide both :customMetadataList and :custom_metadata_list' if attributes.key?(:'customMetadataList') && attributes.key?(:'custom_metadata_list')

      self.custom_metadata_list = attributes[:'custom_metadata_list'] if attributes[:'custom_metadata_list']

      self.defined_metadata_list = attributes[:'definedMetadataList'] if attributes[:'definedMetadataList']

      raise 'You cannot provide both :definedMetadataList and :defined_metadata_list' if attributes.key?(:'definedMetadataList') && attributes.key?(:'defined_metadata_list')

      self.defined_metadata_list = attributes[:'defined_metadata_list'] if attributes[:'defined_metadata_list']

      self.input_schema = attributes[:'inputSchema'] if attributes[:'inputSchema']

      raise 'You cannot provide both :inputSchema and :input_schema' if attributes.key?(:'inputSchema') && attributes.key?(:'input_schema')

      self.input_schema = attributes[:'input_schema'] if attributes[:'input_schema']

      self.output_schema = attributes[:'outputSchema'] if attributes[:'outputSchema']

      raise 'You cannot provide both :outputSchema and :output_schema' if attributes.key?(:'outputSchema') && attributes.key?(:'output_schema')

      self.output_schema = attributes[:'output_schema'] if attributes[:'output_schema']

      self.model_version_set_id = attributes[:'modelVersionSetId'] if attributes[:'modelVersionSetId']

      raise 'You cannot provide both :modelVersionSetId and :model_version_set_id' if attributes.key?(:'modelVersionSetId') && attributes.key?(:'model_version_set_id')

      self.model_version_set_id = attributes[:'model_version_set_id'] if attributes[:'model_version_set_id']

      self.version_label = attributes[:'versionLabel'] if attributes[:'versionLabel']

      raise 'You cannot provide both :versionLabel and :version_label' if attributes.key?(:'versionLabel') && attributes.key?(:'version_label')

      self.version_label = attributes[:'version_label'] if attributes[:'version_label']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        project_id == other.project_id &&
        display_name == other.display_name &&
        description == other.description &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        custom_metadata_list == other.custom_metadata_list &&
        defined_metadata_list == other.defined_metadata_list &&
        input_schema == other.input_schema &&
        output_schema == other.output_schema &&
        model_version_set_id == other.model_version_set_id &&
        version_label == other.version_label
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
      [compartment_id, project_id, display_name, description, freeform_tags, defined_tags, custom_metadata_list, defined_metadata_list, input_schema, output_schema, model_version_set_id, version_label].hash
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
