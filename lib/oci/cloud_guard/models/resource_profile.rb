# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Resource profile details
  class CloudGuard::Models::ResourceProfile
    RISK_LEVEL_ENUM = [
      RISK_LEVEL_CRITICAL = 'CRITICAL'.freeze,
      RISK_LEVEL_HIGH = 'HIGH'.freeze,
      RISK_LEVEL_MEDIUM = 'MEDIUM'.freeze,
      RISK_LEVEL_LOW = 'LOW'.freeze,
      RISK_LEVEL_MINOR = 'MINOR'.freeze,
      RISK_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Number of sightings associated with this resource profile
    # @return [Integer]
    attr_accessor :sightings_count

    # **[Required]** Unique identifier for resource profile
    # @return [String]
    attr_accessor :id

    # **[Required]** Unique identifier for resource profile
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** Resource name for resource profile
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Resource type for resource profile
    # @return [String]
    attr_accessor :type

    # List of Problems associated with the resource profile.
    # @return [Array<String>]
    attr_accessor :problem_ids

    # **[Required]** Compartment Id for resource profile
    # @return [String]
    attr_accessor :compartment_id

    # Target Id for resource profile
    # @return [String]
    attr_accessor :target_id

    # **[Required]** Risk Score for the resource profile
    # @return [Float]
    attr_accessor :risk_score

    # Risk Level associated with resource profile
    # @return [String]
    attr_reader :risk_level

    # Peak Risk Score for the resource profile
    # @return [Float]
    attr_accessor :peak_risk_score

    # The date and time for peak risk score. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_peak_score

    # **[Required]** The date and time the resource profile was first detected. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_first_detected

    # **[Required]** The date and time the resource profile was last detected. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_last_detected

    # **[Required]** List of tactic summary associated with the resource profile.
    # @return [Array<OCI::CloudGuard::Models::TacticSummary>]
    attr_accessor :tactics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sightings_count': :'sightingsCount',
        'id': :'id',
        'resource_id': :'resourceId',
        'display_name': :'displayName',
        'type': :'type',
        'problem_ids': :'problemIds',
        'compartment_id': :'compartmentId',
        'target_id': :'targetId',
        'risk_score': :'riskScore',
        'risk_level': :'riskLevel',
        'peak_risk_score': :'peakRiskScore',
        'time_peak_score': :'timePeakScore',
        'time_first_detected': :'timeFirstDetected',
        'time_last_detected': :'timeLastDetected',
        'tactics': :'tactics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sightings_count': :'Integer',
        'id': :'String',
        'resource_id': :'String',
        'display_name': :'String',
        'type': :'String',
        'problem_ids': :'Array<String>',
        'compartment_id': :'String',
        'target_id': :'String',
        'risk_score': :'Float',
        'risk_level': :'String',
        'peak_risk_score': :'Float',
        'time_peak_score': :'DateTime',
        'time_first_detected': :'DateTime',
        'time_last_detected': :'DateTime',
        'tactics': :'Array<OCI::CloudGuard::Models::TacticSummary>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :sightings_count The value to assign to the {#sightings_count} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Array<String>] :problem_ids The value to assign to the {#problem_ids} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [Float] :risk_score The value to assign to the {#risk_score} property
    # @option attributes [String] :risk_level The value to assign to the {#risk_level} property
    # @option attributes [Float] :peak_risk_score The value to assign to the {#peak_risk_score} property
    # @option attributes [DateTime] :time_peak_score The value to assign to the {#time_peak_score} property
    # @option attributes [DateTime] :time_first_detected The value to assign to the {#time_first_detected} property
    # @option attributes [DateTime] :time_last_detected The value to assign to the {#time_last_detected} property
    # @option attributes [Array<OCI::CloudGuard::Models::TacticSummary>] :tactics The value to assign to the {#tactics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sightings_count = attributes[:'sightingsCount'] if attributes[:'sightingsCount']

      raise 'You cannot provide both :sightingsCount and :sightings_count' if attributes.key?(:'sightingsCount') && attributes.key?(:'sightings_count')

      self.sightings_count = attributes[:'sightings_count'] if attributes[:'sightings_count']

      self.id = attributes[:'id'] if attributes[:'id']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.problem_ids = attributes[:'problemIds'] if attributes[:'problemIds']

      raise 'You cannot provide both :problemIds and :problem_ids' if attributes.key?(:'problemIds') && attributes.key?(:'problem_ids')

      self.problem_ids = attributes[:'problem_ids'] if attributes[:'problem_ids']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.risk_score = attributes[:'riskScore'] if attributes[:'riskScore']

      raise 'You cannot provide both :riskScore and :risk_score' if attributes.key?(:'riskScore') && attributes.key?(:'risk_score')

      self.risk_score = attributes[:'risk_score'] if attributes[:'risk_score']

      self.risk_level = attributes[:'riskLevel'] if attributes[:'riskLevel']

      raise 'You cannot provide both :riskLevel and :risk_level' if attributes.key?(:'riskLevel') && attributes.key?(:'risk_level')

      self.risk_level = attributes[:'risk_level'] if attributes[:'risk_level']

      self.peak_risk_score = attributes[:'peakRiskScore'] if attributes[:'peakRiskScore']

      raise 'You cannot provide both :peakRiskScore and :peak_risk_score' if attributes.key?(:'peakRiskScore') && attributes.key?(:'peak_risk_score')

      self.peak_risk_score = attributes[:'peak_risk_score'] if attributes[:'peak_risk_score']

      self.time_peak_score = attributes[:'timePeakScore'] if attributes[:'timePeakScore']

      raise 'You cannot provide both :timePeakScore and :time_peak_score' if attributes.key?(:'timePeakScore') && attributes.key?(:'time_peak_score')

      self.time_peak_score = attributes[:'time_peak_score'] if attributes[:'time_peak_score']

      self.time_first_detected = attributes[:'timeFirstDetected'] if attributes[:'timeFirstDetected']

      raise 'You cannot provide both :timeFirstDetected and :time_first_detected' if attributes.key?(:'timeFirstDetected') && attributes.key?(:'time_first_detected')

      self.time_first_detected = attributes[:'time_first_detected'] if attributes[:'time_first_detected']

      self.time_last_detected = attributes[:'timeLastDetected'] if attributes[:'timeLastDetected']

      raise 'You cannot provide both :timeLastDetected and :time_last_detected' if attributes.key?(:'timeLastDetected') && attributes.key?(:'time_last_detected')

      self.time_last_detected = attributes[:'time_last_detected'] if attributes[:'time_last_detected']

      self.tactics = attributes[:'tactics'] if attributes[:'tactics']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] risk_level Object to be assigned
    def risk_level=(risk_level)
      # rubocop:disable Style/ConditionalAssignment
      if risk_level && !RISK_LEVEL_ENUM.include?(risk_level)
        OCI.logger.debug("Unknown value for 'risk_level' [" + risk_level + "]. Mapping to 'RISK_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @risk_level = RISK_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @risk_level = risk_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sightings_count == other.sightings_count &&
        id == other.id &&
        resource_id == other.resource_id &&
        display_name == other.display_name &&
        type == other.type &&
        problem_ids == other.problem_ids &&
        compartment_id == other.compartment_id &&
        target_id == other.target_id &&
        risk_score == other.risk_score &&
        risk_level == other.risk_level &&
        peak_risk_score == other.peak_risk_score &&
        time_peak_score == other.time_peak_score &&
        time_first_detected == other.time_first_detected &&
        time_last_detected == other.time_last_detected &&
        tactics == other.tactics
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
      [sightings_count, id, resource_id, display_name, type, problem_ids, compartment_id, target_id, risk_score, risk_level, peak_risk_score, time_peak_score, time_first_detected, time_last_detected, tactics].hash
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