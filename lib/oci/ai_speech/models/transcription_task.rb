# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of Transcription Task.
  class AiSpeech::Models::TranscriptionTask
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACCEPTED = 'ACCEPTED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the task.
    # @return [String]
    attr_accessor :id

    # A user-friendly display name for the task.
    # @return [String]
    attr_accessor :display_name

    # Task started time.
    # @return [DateTime]
    attr_accessor :time_started

    # Task finished time.
    # @return [DateTime]
    attr_accessor :time_finished

    # How much progress the operation has made, vs the total amount of work that must be performed.
    # @return [Integer]
    attr_accessor :percent_complete

    # Time to live duration in days for tasks. Task will be available till max 90 days.
    # @return [Integer]
    attr_accessor :ttl_in_days

    # @return [OCI::AiSpeech::Models::TranscriptionModelDetails]
    attr_accessor :model_details

    # @return [OCI::AiSpeech::Models::AudioFormatDetails]
    attr_accessor :audio_format_details

    # Size of input file in Bytes.
    # @return [Integer]
    attr_accessor :file_size_in_bytes

    # Duration of input file in Seconds.
    # @return [Integer]
    attr_accessor :file_duration_in_seconds

    # @return [OCI::AiSpeech::Models::ObjectLocation]
    attr_accessor :input_location

    # @return [OCI::AiSpeech::Models::ObjectLocation]
    attr_accessor :output_location

    # The current state of the Task.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'percent_complete': :'percentComplete',
        'ttl_in_days': :'ttlInDays',
        'model_details': :'modelDetails',
        'audio_format_details': :'audioFormatDetails',
        'file_size_in_bytes': :'fileSizeInBytes',
        'file_duration_in_seconds': :'fileDurationInSeconds',
        'input_location': :'inputLocation',
        'output_location': :'outputLocation',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'percent_complete': :'Integer',
        'ttl_in_days': :'Integer',
        'model_details': :'OCI::AiSpeech::Models::TranscriptionModelDetails',
        'audio_format_details': :'OCI::AiSpeech::Models::AudioFormatDetails',
        'file_size_in_bytes': :'Integer',
        'file_duration_in_seconds': :'Integer',
        'input_location': :'OCI::AiSpeech::Models::ObjectLocation',
        'output_location': :'OCI::AiSpeech::Models::ObjectLocation',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [Integer] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [Integer] :ttl_in_days The value to assign to the {#ttl_in_days} property
    # @option attributes [OCI::AiSpeech::Models::TranscriptionModelDetails] :model_details The value to assign to the {#model_details} property
    # @option attributes [OCI::AiSpeech::Models::AudioFormatDetails] :audio_format_details The value to assign to the {#audio_format_details} property
    # @option attributes [Integer] :file_size_in_bytes The value to assign to the {#file_size_in_bytes} property
    # @option attributes [Integer] :file_duration_in_seconds The value to assign to the {#file_duration_in_seconds} property
    # @option attributes [OCI::AiSpeech::Models::ObjectLocation] :input_location The value to assign to the {#input_location} property
    # @option attributes [OCI::AiSpeech::Models::ObjectLocation] :output_location The value to assign to the {#output_location} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.ttl_in_days = attributes[:'ttlInDays'] if attributes[:'ttlInDays']

      raise 'You cannot provide both :ttlInDays and :ttl_in_days' if attributes.key?(:'ttlInDays') && attributes.key?(:'ttl_in_days')

      self.ttl_in_days = attributes[:'ttl_in_days'] if attributes[:'ttl_in_days']

      self.model_details = attributes[:'modelDetails'] if attributes[:'modelDetails']

      raise 'You cannot provide both :modelDetails and :model_details' if attributes.key?(:'modelDetails') && attributes.key?(:'model_details')

      self.model_details = attributes[:'model_details'] if attributes[:'model_details']

      self.audio_format_details = attributes[:'audioFormatDetails'] if attributes[:'audioFormatDetails']

      raise 'You cannot provide both :audioFormatDetails and :audio_format_details' if attributes.key?(:'audioFormatDetails') && attributes.key?(:'audio_format_details')

      self.audio_format_details = attributes[:'audio_format_details'] if attributes[:'audio_format_details']

      self.file_size_in_bytes = attributes[:'fileSizeInBytes'] if attributes[:'fileSizeInBytes']

      raise 'You cannot provide both :fileSizeInBytes and :file_size_in_bytes' if attributes.key?(:'fileSizeInBytes') && attributes.key?(:'file_size_in_bytes')

      self.file_size_in_bytes = attributes[:'file_size_in_bytes'] if attributes[:'file_size_in_bytes']

      self.file_duration_in_seconds = attributes[:'fileDurationInSeconds'] if attributes[:'fileDurationInSeconds']

      raise 'You cannot provide both :fileDurationInSeconds and :file_duration_in_seconds' if attributes.key?(:'fileDurationInSeconds') && attributes.key?(:'file_duration_in_seconds')

      self.file_duration_in_seconds = attributes[:'file_duration_in_seconds'] if attributes[:'file_duration_in_seconds']

      self.input_location = attributes[:'inputLocation'] if attributes[:'inputLocation']

      raise 'You cannot provide both :inputLocation and :input_location' if attributes.key?(:'inputLocation') && attributes.key?(:'input_location')

      self.input_location = attributes[:'input_location'] if attributes[:'input_location']

      self.output_location = attributes[:'outputLocation'] if attributes[:'outputLocation']

      raise 'You cannot provide both :outputLocation and :output_location' if attributes.key?(:'outputLocation') && attributes.key?(:'output_location')

      self.output_location = attributes[:'output_location'] if attributes[:'output_location']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']
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
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        percent_complete == other.percent_complete &&
        ttl_in_days == other.ttl_in_days &&
        model_details == other.model_details &&
        audio_format_details == other.audio_format_details &&
        file_size_in_bytes == other.file_size_in_bytes &&
        file_duration_in_seconds == other.file_duration_in_seconds &&
        input_location == other.input_location &&
        output_location == other.output_location &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details
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
      [id, display_name, time_started, time_finished, percent_complete, ttl_in_days, model_details, audio_format_details, file_size_in_bytes, file_duration_in_seconds, input_location, output_location, lifecycle_state, lifecycle_details].hash
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
