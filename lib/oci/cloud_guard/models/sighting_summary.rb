# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Sighting summary Definition.
  class CloudGuard::Models::SightingSummary
    CLASSIFICATION_STATUS_ENUM = [
      CLASSIFICATION_STATUS_FALSE_POSITIVE = 'FALSE_POSITIVE'.freeze,
      CLASSIFICATION_STATUS_FALSE_NEGATIVE = 'FALSE_NEGATIVE'.freeze,
      CLASSIFICATION_STATUS_TRUE_POSITIVE = 'TRUE_POSITIVE'.freeze,
      CLASSIFICATION_STATUS_TRUE_NEGATIVE = 'TRUE_NEGATIVE'.freeze,
      CLASSIFICATION_STATUS_NOT_CLASSIFIED = 'NOT_CLASSIFIED'.freeze,
      CLASSIFICATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SEVERITY_ENUM = [
      SEVERITY_CRITICAL = 'CRITICAL'.freeze,
      SEVERITY_HIGH = 'HIGH'.freeze,
      SEVERITY_MEDIUM = 'MEDIUM'.freeze,
      SEVERITY_LOW = 'LOW'.freeze,
      SEVERITY_MINOR = 'MINOR'.freeze,
      SEVERITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CONFIDENCE_ENUM = [
      CONFIDENCE_CRITICAL = 'CRITICAL'.freeze,
      CONFIDENCE_HIGH = 'HIGH'.freeze,
      CONFIDENCE_MEDIUM = 'MEDIUM'.freeze,
      CONFIDENCE_LOW = 'LOW'.freeze,
      CONFIDENCE_MINOR = 'MINOR'.freeze,
      CONFIDENCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier for finding event
    # @return [String]
    attr_accessor :id

    # **[Required]** Compartment Id where the resource is created
    # @return [String]
    attr_accessor :compartment_id

    # Problem Id to which the Sighting is associated
    # @return [String]
    attr_accessor :problem_id

    # Unique identifier for principal actor
    # @return [String]
    attr_accessor :actor_principal_id

    # Name of the principal actor
    # @return [String]
    attr_accessor :actor_principal_name

    # Type of the principal actor
    # @return [String]
    attr_accessor :actor_principal_type

    # **[Required]** Unique identifier of the rule
    # @return [String]
    attr_accessor :detector_rule_id

    # **[Required]** ClassificationStatus of the sighting event
    # @return [String]
    attr_reader :classification_status

    # **[Required]** Identifier for the sighting type
    # @return [String]
    attr_accessor :sighting_type

    # **[Required]** Name of the sighting type
    # @return [String]
    attr_accessor :sighting_type_display_name

    # **[Required]** Name of the Mitre att&ck tactic
    # @return [String]
    attr_accessor :tactic_name

    # **[Required]** Name of the Mitre att&ck technique
    # @return [String]
    attr_accessor :technique_name

    # **[Required]** Score for the sighting
    # @return [Integer]
    attr_accessor :sighting_score

    # **[Required]** Severity of the sighting
    # @return [String]
    attr_reader :severity

    # **[Required]** Confidence of the sighting
    # @return [String]
    attr_reader :confidence

    # **[Required]** The date and time the sighting was first detected. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_first_detected

    # **[Required]** The date and time the sighting was last detected. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_last_detected

    # **[Required]** Regions involved in the sighting
    # @return [Array<String>]
    attr_accessor :regions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'problem_id': :'problemId',
        'actor_principal_id': :'actorPrincipalId',
        'actor_principal_name': :'actorPrincipalName',
        'actor_principal_type': :'actorPrincipalType',
        'detector_rule_id': :'detectorRuleId',
        'classification_status': :'classificationStatus',
        'sighting_type': :'sightingType',
        'sighting_type_display_name': :'sightingTypeDisplayName',
        'tactic_name': :'tacticName',
        'technique_name': :'techniqueName',
        'sighting_score': :'sightingScore',
        'severity': :'severity',
        'confidence': :'confidence',
        'time_first_detected': :'timeFirstDetected',
        'time_last_detected': :'timeLastDetected',
        'regions': :'regions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'problem_id': :'String',
        'actor_principal_id': :'String',
        'actor_principal_name': :'String',
        'actor_principal_type': :'String',
        'detector_rule_id': :'String',
        'classification_status': :'String',
        'sighting_type': :'String',
        'sighting_type_display_name': :'String',
        'tactic_name': :'String',
        'technique_name': :'String',
        'sighting_score': :'Integer',
        'severity': :'String',
        'confidence': :'String',
        'time_first_detected': :'DateTime',
        'time_last_detected': :'DateTime',
        'regions': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :problem_id The value to assign to the {#problem_id} property
    # @option attributes [String] :actor_principal_id The value to assign to the {#actor_principal_id} property
    # @option attributes [String] :actor_principal_name The value to assign to the {#actor_principal_name} property
    # @option attributes [String] :actor_principal_type The value to assign to the {#actor_principal_type} property
    # @option attributes [String] :detector_rule_id The value to assign to the {#detector_rule_id} property
    # @option attributes [String] :classification_status The value to assign to the {#classification_status} property
    # @option attributes [String] :sighting_type The value to assign to the {#sighting_type} property
    # @option attributes [String] :sighting_type_display_name The value to assign to the {#sighting_type_display_name} property
    # @option attributes [String] :tactic_name The value to assign to the {#tactic_name} property
    # @option attributes [String] :technique_name The value to assign to the {#technique_name} property
    # @option attributes [Integer] :sighting_score The value to assign to the {#sighting_score} property
    # @option attributes [String] :severity The value to assign to the {#severity} property
    # @option attributes [String] :confidence The value to assign to the {#confidence} property
    # @option attributes [DateTime] :time_first_detected The value to assign to the {#time_first_detected} property
    # @option attributes [DateTime] :time_last_detected The value to assign to the {#time_last_detected} property
    # @option attributes [Array<String>] :regions The value to assign to the {#regions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.problem_id = attributes[:'problemId'] if attributes[:'problemId']

      raise 'You cannot provide both :problemId and :problem_id' if attributes.key?(:'problemId') && attributes.key?(:'problem_id')

      self.problem_id = attributes[:'problem_id'] if attributes[:'problem_id']

      self.actor_principal_id = attributes[:'actorPrincipalId'] if attributes[:'actorPrincipalId']

      raise 'You cannot provide both :actorPrincipalId and :actor_principal_id' if attributes.key?(:'actorPrincipalId') && attributes.key?(:'actor_principal_id')

      self.actor_principal_id = attributes[:'actor_principal_id'] if attributes[:'actor_principal_id']

      self.actor_principal_name = attributes[:'actorPrincipalName'] if attributes[:'actorPrincipalName']

      raise 'You cannot provide both :actorPrincipalName and :actor_principal_name' if attributes.key?(:'actorPrincipalName') && attributes.key?(:'actor_principal_name')

      self.actor_principal_name = attributes[:'actor_principal_name'] if attributes[:'actor_principal_name']

      self.actor_principal_type = attributes[:'actorPrincipalType'] if attributes[:'actorPrincipalType']

      raise 'You cannot provide both :actorPrincipalType and :actor_principal_type' if attributes.key?(:'actorPrincipalType') && attributes.key?(:'actor_principal_type')

      self.actor_principal_type = attributes[:'actor_principal_type'] if attributes[:'actor_principal_type']

      self.detector_rule_id = attributes[:'detectorRuleId'] if attributes[:'detectorRuleId']

      raise 'You cannot provide both :detectorRuleId and :detector_rule_id' if attributes.key?(:'detectorRuleId') && attributes.key?(:'detector_rule_id')

      self.detector_rule_id = attributes[:'detector_rule_id'] if attributes[:'detector_rule_id']

      self.classification_status = attributes[:'classificationStatus'] if attributes[:'classificationStatus']

      raise 'You cannot provide both :classificationStatus and :classification_status' if attributes.key?(:'classificationStatus') && attributes.key?(:'classification_status')

      self.classification_status = attributes[:'classification_status'] if attributes[:'classification_status']

      self.sighting_type = attributes[:'sightingType'] if attributes[:'sightingType']

      raise 'You cannot provide both :sightingType and :sighting_type' if attributes.key?(:'sightingType') && attributes.key?(:'sighting_type')

      self.sighting_type = attributes[:'sighting_type'] if attributes[:'sighting_type']

      self.sighting_type_display_name = attributes[:'sightingTypeDisplayName'] if attributes[:'sightingTypeDisplayName']

      raise 'You cannot provide both :sightingTypeDisplayName and :sighting_type_display_name' if attributes.key?(:'sightingTypeDisplayName') && attributes.key?(:'sighting_type_display_name')

      self.sighting_type_display_name = attributes[:'sighting_type_display_name'] if attributes[:'sighting_type_display_name']

      self.tactic_name = attributes[:'tacticName'] if attributes[:'tacticName']

      raise 'You cannot provide both :tacticName and :tactic_name' if attributes.key?(:'tacticName') && attributes.key?(:'tactic_name')

      self.tactic_name = attributes[:'tactic_name'] if attributes[:'tactic_name']

      self.technique_name = attributes[:'techniqueName'] if attributes[:'techniqueName']

      raise 'You cannot provide both :techniqueName and :technique_name' if attributes.key?(:'techniqueName') && attributes.key?(:'technique_name')

      self.technique_name = attributes[:'technique_name'] if attributes[:'technique_name']

      self.sighting_score = attributes[:'sightingScore'] if attributes[:'sightingScore']

      raise 'You cannot provide both :sightingScore and :sighting_score' if attributes.key?(:'sightingScore') && attributes.key?(:'sighting_score')

      self.sighting_score = attributes[:'sighting_score'] if attributes[:'sighting_score']

      self.severity = attributes[:'severity'] if attributes[:'severity']

      self.confidence = attributes[:'confidence'] if attributes[:'confidence']

      self.time_first_detected = attributes[:'timeFirstDetected'] if attributes[:'timeFirstDetected']

      raise 'You cannot provide both :timeFirstDetected and :time_first_detected' if attributes.key?(:'timeFirstDetected') && attributes.key?(:'time_first_detected')

      self.time_first_detected = attributes[:'time_first_detected'] if attributes[:'time_first_detected']

      self.time_last_detected = attributes[:'timeLastDetected'] if attributes[:'timeLastDetected']

      raise 'You cannot provide both :timeLastDetected and :time_last_detected' if attributes.key?(:'timeLastDetected') && attributes.key?(:'time_last_detected')

      self.time_last_detected = attributes[:'time_last_detected'] if attributes[:'time_last_detected']

      self.regions = attributes[:'regions'] if attributes[:'regions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] classification_status Object to be assigned
    def classification_status=(classification_status)
      # rubocop:disable Style/ConditionalAssignment
      if classification_status && !CLASSIFICATION_STATUS_ENUM.include?(classification_status)
        OCI.logger.debug("Unknown value for 'classification_status' [" + classification_status + "]. Mapping to 'CLASSIFICATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @classification_status = CLASSIFICATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @classification_status = classification_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] severity Object to be assigned
    def severity=(severity)
      # rubocop:disable Style/ConditionalAssignment
      if severity && !SEVERITY_ENUM.include?(severity)
        OCI.logger.debug("Unknown value for 'severity' [" + severity + "]. Mapping to 'SEVERITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @severity = SEVERITY_UNKNOWN_ENUM_VALUE
      else
        @severity = severity
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] confidence Object to be assigned
    def confidence=(confidence)
      # rubocop:disable Style/ConditionalAssignment
      if confidence && !CONFIDENCE_ENUM.include?(confidence)
        OCI.logger.debug("Unknown value for 'confidence' [" + confidence + "]. Mapping to 'CONFIDENCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @confidence = CONFIDENCE_UNKNOWN_ENUM_VALUE
      else
        @confidence = confidence
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
        problem_id == other.problem_id &&
        actor_principal_id == other.actor_principal_id &&
        actor_principal_name == other.actor_principal_name &&
        actor_principal_type == other.actor_principal_type &&
        detector_rule_id == other.detector_rule_id &&
        classification_status == other.classification_status &&
        sighting_type == other.sighting_type &&
        sighting_type_display_name == other.sighting_type_display_name &&
        tactic_name == other.tactic_name &&
        technique_name == other.technique_name &&
        sighting_score == other.sighting_score &&
        severity == other.severity &&
        confidence == other.confidence &&
        time_first_detected == other.time_first_detected &&
        time_last_detected == other.time_last_detected &&
        regions == other.regions
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
      [id, compartment_id, problem_id, actor_principal_id, actor_principal_name, actor_principal_type, detector_rule_id, classification_status, sighting_type, sighting_type_display_name, tactic_name, technique_name, sighting_score, severity, confidence, time_first_detected, time_last_detected, regions].hash
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