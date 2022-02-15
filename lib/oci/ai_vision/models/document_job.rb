# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Job details for a batch document analysis.
  class AiVision::Models::DocumentJob
    LANGUAGE_ENUM = [
      LANGUAGE_ENG = 'ENG'.freeze,
      LANGUAGE_CES = 'CES'.freeze,
      LANGUAGE_DAN = 'DAN'.freeze,
      LANGUAGE_NLD = 'NLD'.freeze,
      LANGUAGE_FIN = 'FIN'.freeze,
      LANGUAGE_FRA = 'FRA'.freeze,
      LANGUAGE_DEU = 'DEU'.freeze,
      LANGUAGE_ELL = 'ELL'.freeze,
      LANGUAGE_HUN = 'HUN'.freeze,
      LANGUAGE_ITA = 'ITA'.freeze,
      LANGUAGE_NOR = 'NOR'.freeze,
      LANGUAGE_POL = 'POL'.freeze,
      LANGUAGE_POR = 'POR'.freeze,
      LANGUAGE_RON = 'RON'.freeze,
      LANGUAGE_RUS = 'RUS'.freeze,
      LANGUAGE_SLK = 'SLK'.freeze,
      LANGUAGE_SPA = 'SPA'.freeze,
      LANGUAGE_SWE = 'SWE'.freeze,
      LANGUAGE_TUR = 'TUR'.freeze,
      LANGUAGE_ARA = 'ARA'.freeze,
      LANGUAGE_CHI_SIM = 'CHI_SIM'.freeze,
      LANGUAGE_HIN = 'HIN'.freeze,
      LANGUAGE_JPN = 'JPN'.freeze,
      LANGUAGE_KOR = 'KOR'.freeze,
      LANGUAGE_OTHERS = 'OTHERS'.freeze,
      LANGUAGE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DOCUMENT_TYPE_ENUM = [
      DOCUMENT_TYPE_INVOICE = 'INVOICE'.freeze,
      DOCUMENT_TYPE_RECEIPT = 'RECEIPT'.freeze,
      DOCUMENT_TYPE_RESUME = 'RESUME'.freeze,
      DOCUMENT_TYPE_TAX_FORM = 'TAX_FORM'.freeze,
      DOCUMENT_TYPE_DRIVER_LICENSE = 'DRIVER_LICENSE'.freeze,
      DOCUMENT_TYPE_PASSPORT = 'PASSPORT'.freeze,
      DOCUMENT_TYPE_BANK_STATEMENT = 'BANK_STATEMENT'.freeze,
      DOCUMENT_TYPE_CHECK = 'CHECK'.freeze,
      DOCUMENT_TYPE_PAYSLIP = 'PAYSLIP'.freeze,
      DOCUMENT_TYPE_OTHERS = 'OTHERS'.freeze,
      DOCUMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_ACCEPTED = 'ACCEPTED'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_CANCELING = 'CANCELING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_DETAILS_ENUM = [
      LIFECYCLE_DETAILS_PARTIALLY_SUCCEEDED = 'PARTIALLY_SUCCEEDED'.freeze,
      LIFECYCLE_DETAILS_COMPLETELY_FAILED = 'COMPLETELY_FAILED'.freeze,
      LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Job id.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment that starts the job.
    # @return [String]
    attr_accessor :compartment_id

    # Document job display name.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** List of document analysis types requested.
    # @return [Array<OCI::AiVision::Models::DocumentFeature>]
    attr_accessor :features

    # Language of the document, abbreviated according to ISO 639-2.
    # @return [String]
    attr_reader :language

    # The type of documents.
    # @return [String]
    attr_reader :document_type

    # @return [OCI::AiVision::Models::InputLocation]
    attr_accessor :input_location

    # **[Required]** Job accepted time.
    # @return [DateTime]
    attr_accessor :time_accepted

    # Job started time.
    # @return [DateTime]
    attr_accessor :time_started

    # Job finished time.
    # @return [DateTime]
    attr_accessor :time_finished

    # How much progress the operation has made, vs the total amount of work that must be performed.
    # @return [Float]
    attr_accessor :percent_complete

    # This attribute is required.
    # @return [OCI::AiVision::Models::OutputLocation]
    attr_accessor :output_location

    # **[Required]** The current state of the batch document job.
    # @return [String]
    attr_reader :lifecycle_state

    # Whether to generate a Zip file containing the results.
    # @return [BOOLEAN]
    attr_accessor :is_zip_output_enabled

    # Detailed status of FAILED state.
    # @return [String]
    attr_reader :lifecycle_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'features': :'features',
        'language': :'language',
        'document_type': :'documentType',
        'input_location': :'inputLocation',
        'time_accepted': :'timeAccepted',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'percent_complete': :'percentComplete',
        'output_location': :'outputLocation',
        'lifecycle_state': :'lifecycleState',
        'is_zip_output_enabled': :'isZipOutputEnabled',
        'lifecycle_details': :'lifecycleDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'features': :'Array<OCI::AiVision::Models::DocumentFeature>',
        'language': :'String',
        'document_type': :'String',
        'input_location': :'OCI::AiVision::Models::InputLocation',
        'time_accepted': :'DateTime',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'percent_complete': :'Float',
        'output_location': :'OCI::AiVision::Models::OutputLocation',
        'lifecycle_state': :'String',
        'is_zip_output_enabled': :'BOOLEAN',
        'lifecycle_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Array<OCI::AiVision::Models::DocumentFeature>] :features The value to assign to the {#features} property
    # @option attributes [String] :language The value to assign to the {#language} property
    # @option attributes [String] :document_type The value to assign to the {#document_type} property
    # @option attributes [OCI::AiVision::Models::InputLocation] :input_location The value to assign to the {#input_location} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [Float] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [OCI::AiVision::Models::OutputLocation] :output_location The value to assign to the {#output_location} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_zip_output_enabled The value to assign to the {#is_zip_output_enabled} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.features = attributes[:'features'] if attributes[:'features']

      self.language = attributes[:'language'] if attributes[:'language']

      self.document_type = attributes[:'documentType'] if attributes[:'documentType']

      raise 'You cannot provide both :documentType and :document_type' if attributes.key?(:'documentType') && attributes.key?(:'document_type')

      self.document_type = attributes[:'document_type'] if attributes[:'document_type']

      self.input_location = attributes[:'inputLocation'] if attributes[:'inputLocation']

      raise 'You cannot provide both :inputLocation and :input_location' if attributes.key?(:'inputLocation') && attributes.key?(:'input_location')

      self.input_location = attributes[:'input_location'] if attributes[:'input_location']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.output_location = attributes[:'outputLocation'] if attributes[:'outputLocation']

      raise 'You cannot provide both :outputLocation and :output_location' if attributes.key?(:'outputLocation') && attributes.key?(:'output_location')

      self.output_location = attributes[:'output_location'] if attributes[:'output_location']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_zip_output_enabled = attributes[:'isZipOutputEnabled'] unless attributes[:'isZipOutputEnabled'].nil?
      self.is_zip_output_enabled = false if is_zip_output_enabled.nil? && !attributes.key?(:'isZipOutputEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isZipOutputEnabled and :is_zip_output_enabled' if attributes.key?(:'isZipOutputEnabled') && attributes.key?(:'is_zip_output_enabled')

      self.is_zip_output_enabled = attributes[:'is_zip_output_enabled'] unless attributes[:'is_zip_output_enabled'].nil?
      self.is_zip_output_enabled = false if is_zip_output_enabled.nil? && !attributes.key?(:'isZipOutputEnabled') && !attributes.key?(:'is_zip_output_enabled') # rubocop:disable Style/StringLiterals

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] language Object to be assigned
    def language=(language)
      # rubocop:disable Style/ConditionalAssignment
      if language && !LANGUAGE_ENUM.include?(language)
        OCI.logger.debug("Unknown value for 'language' [" + language + "]. Mapping to 'LANGUAGE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @language = LANGUAGE_UNKNOWN_ENUM_VALUE
      else
        @language = language
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] document_type Object to be assigned
    def document_type=(document_type)
      # rubocop:disable Style/ConditionalAssignment
      if document_type && !DOCUMENT_TYPE_ENUM.include?(document_type)
        OCI.logger.debug("Unknown value for 'document_type' [" + document_type + "]. Mapping to 'DOCUMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @document_type = DOCUMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @document_type = document_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_details Object to be assigned
    def lifecycle_details=(lifecycle_details)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_details && !LIFECYCLE_DETAILS_ENUM.include?(lifecycle_details)
        OCI.logger.debug("Unknown value for 'lifecycle_details' [" + lifecycle_details + "]. Mapping to 'LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_details = LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_details = lifecycle_details
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        features == other.features &&
        language == other.language &&
        document_type == other.document_type &&
        input_location == other.input_location &&
        time_accepted == other.time_accepted &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        percent_complete == other.percent_complete &&
        output_location == other.output_location &&
        lifecycle_state == other.lifecycle_state &&
        is_zip_output_enabled == other.is_zip_output_enabled &&
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
      [id, compartment_id, display_name, features, language, document_type, input_location, time_accepted, time_started, time_finished, percent_complete, output_location, lifecycle_state, is_zip_output_enabled, lifecycle_details].hash
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
