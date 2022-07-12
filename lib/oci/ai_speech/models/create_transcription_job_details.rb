# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about new Transcription Job.
  class AiSpeech::Models::CreateTranscriptionJobDetails
    ADDITIONAL_TRANSCRIPTION_FORMATS_ENUM = [
      ADDITIONAL_TRANSCRIPTION_FORMATS_SRT = 'SRT'.freeze
    ].freeze

    # A user-friendly display name for the job.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want to create the job.
    # @return [String]
    attr_accessor :compartment_id

    # A short description of the job.
    # @return [String]
    attr_accessor :description

    # Transcription Format. By default JSON format will be considered.
    # @return [Array<String>]
    attr_reader :additional_transcription_formats

    # @return [OCI::AiSpeech::Models::TranscriptionModelDetails]
    attr_accessor :model_details

    # @return [OCI::AiSpeech::Models::TranscriptionNormalization]
    attr_accessor :normalization

    # This attribute is required.
    # @return [OCI::AiSpeech::Models::InputLocation]
    attr_accessor :input_location

    # This attribute is required.
    # @return [OCI::AiSpeech::Models::OutputLocation]
    attr_accessor :output_location

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'description': :'description',
        'additional_transcription_formats': :'additionalTranscriptionFormats',
        'model_details': :'modelDetails',
        'normalization': :'normalization',
        'input_location': :'inputLocation',
        'output_location': :'outputLocation',
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
        'compartment_id': :'String',
        'description': :'String',
        'additional_transcription_formats': :'Array<String>',
        'model_details': :'OCI::AiSpeech::Models::TranscriptionModelDetails',
        'normalization': :'OCI::AiSpeech::Models::TranscriptionNormalization',
        'input_location': :'OCI::AiSpeech::Models::InputLocation',
        'output_location': :'OCI::AiSpeech::Models::OutputLocation',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<String>] :additional_transcription_formats The value to assign to the {#additional_transcription_formats} property
    # @option attributes [OCI::AiSpeech::Models::TranscriptionModelDetails] :model_details The value to assign to the {#model_details} property
    # @option attributes [OCI::AiSpeech::Models::TranscriptionNormalization] :normalization The value to assign to the {#normalization} property
    # @option attributes [OCI::AiSpeech::Models::InputLocation] :input_location The value to assign to the {#input_location} property
    # @option attributes [OCI::AiSpeech::Models::OutputLocation] :output_location The value to assign to the {#output_location} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.additional_transcription_formats = attributes[:'additionalTranscriptionFormats'] if attributes[:'additionalTranscriptionFormats']

      raise 'You cannot provide both :additionalTranscriptionFormats and :additional_transcription_formats' if attributes.key?(:'additionalTranscriptionFormats') && attributes.key?(:'additional_transcription_formats')

      self.additional_transcription_formats = attributes[:'additional_transcription_formats'] if attributes[:'additional_transcription_formats']

      self.model_details = attributes[:'modelDetails'] if attributes[:'modelDetails']

      raise 'You cannot provide both :modelDetails and :model_details' if attributes.key?(:'modelDetails') && attributes.key?(:'model_details')

      self.model_details = attributes[:'model_details'] if attributes[:'model_details']

      self.normalization = attributes[:'normalization'] if attributes[:'normalization']

      self.input_location = attributes[:'inputLocation'] if attributes[:'inputLocation']

      raise 'You cannot provide both :inputLocation and :input_location' if attributes.key?(:'inputLocation') && attributes.key?(:'input_location')

      self.input_location = attributes[:'input_location'] if attributes[:'input_location']

      self.output_location = attributes[:'outputLocation'] if attributes[:'outputLocation']

      raise 'You cannot provide both :outputLocation and :output_location' if attributes.key?(:'outputLocation') && attributes.key?(:'output_location')

      self.output_location = attributes[:'output_location'] if attributes[:'output_location']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] additional_transcription_formats Object to be assigned
    def additional_transcription_formats=(additional_transcription_formats)
      # rubocop:disable Style/ConditionalAssignment
      if additional_transcription_formats.nil?
        @additional_transcription_formats = nil
      else
        additional_transcription_formats.each do |item|
          raise "Invalid value for 'additional_transcription_formats': this must be one of the values in ADDITIONAL_TRANSCRIPTION_FORMATS_ENUM." unless ADDITIONAL_TRANSCRIPTION_FORMATS_ENUM.include?(item)
        end
        @additional_transcription_formats = additional_transcription_formats
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        description == other.description &&
        additional_transcription_formats == other.additional_transcription_formats &&
        model_details == other.model_details &&
        normalization == other.normalization &&
        input_location == other.input_location &&
        output_location == other.output_location &&
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
      [display_name, compartment_id, description, additional_transcription_formats, model_details, normalization, input_location, output_location, freeform_tags, defined_tags].hash
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
