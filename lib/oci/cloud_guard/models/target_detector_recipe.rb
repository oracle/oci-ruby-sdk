# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Target Detector recipe
  class CloudGuard::Models::TargetDetectorRecipe
    OWNER_ENUM = [
      OWNER_CUSTOMER = 'CUSTOMER'.freeze,
      OWNER_ORACLE = 'ORACLE'.freeze,
      OWNER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DETECTOR_ENUM = [
      DETECTOR_IAAS_ACTIVITY_DETECTOR = 'IAAS_ACTIVITY_DETECTOR'.freeze,
      DETECTOR_IAAS_CONFIGURATION_DETECTOR = 'IAAS_CONFIGURATION_DETECTOR'.freeze,
      DETECTOR_IAAS_THREAT_DETECTOR = 'IAAS_THREAT_DETECTOR'.freeze,
      DETECTOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Ocid for detector recipe
    # @return [String]
    attr_accessor :id

    # **[Required]** Display name of detector recipe.
    # @return [String]
    attr_accessor :display_name

    # Detector recipe description.
    # @return [String]
    attr_accessor :description

    # **[Required]** compartmentId of detector recipe
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Unique identifier for Detector Recipe of which this is an extension
    # @return [String]
    attr_accessor :detector_recipe_id

    # **[Required]** Owner of detector recipe
    # @return [String]
    attr_reader :owner

    # **[Required]** Type of detector
    # @return [String]
    attr_reader :detector

    # List of detector rules for the detector type for recipe - user input
    # @return [Array<OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule>]
    attr_accessor :detector_rules

    # List of effective detector rules for the detector type for recipe after applying defaults
    # @return [Array<OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule>]
    attr_accessor :effective_detector_rules

    # The date and time the target detector recipe was created. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the target detector recipe was updated. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the resource.
    # @return [String]
    attr_reader :lifecycle_state

    # The number of days for which source data is retained
    # @return [Integer]
    attr_accessor :source_data_retention

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'detector_recipe_id': :'detectorRecipeId',
        'owner': :'owner',
        'detector': :'detector',
        'detector_rules': :'detectorRules',
        'effective_detector_rules': :'effectiveDetectorRules',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'source_data_retention': :'sourceDataRetention'
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
        'detector_recipe_id': :'String',
        'owner': :'String',
        'detector': :'String',
        'detector_rules': :'Array<OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule>',
        'effective_detector_rules': :'Array<OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'source_data_retention': :'Integer'
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
    # @option attributes [String] :detector_recipe_id The value to assign to the {#detector_recipe_id} property
    # @option attributes [String] :owner The value to assign to the {#owner} property
    # @option attributes [String] :detector The value to assign to the {#detector} property
    # @option attributes [Array<OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule>] :detector_rules The value to assign to the {#detector_rules} property
    # @option attributes [Array<OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule>] :effective_detector_rules The value to assign to the {#effective_detector_rules} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Integer] :source_data_retention The value to assign to the {#source_data_retention} property
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

      self.detector_recipe_id = attributes[:'detectorRecipeId'] if attributes[:'detectorRecipeId']

      raise 'You cannot provide both :detectorRecipeId and :detector_recipe_id' if attributes.key?(:'detectorRecipeId') && attributes.key?(:'detector_recipe_id')

      self.detector_recipe_id = attributes[:'detector_recipe_id'] if attributes[:'detector_recipe_id']

      self.owner = attributes[:'owner'] if attributes[:'owner']

      self.detector = attributes[:'detector'] if attributes[:'detector']

      self.detector_rules = attributes[:'detectorRules'] if attributes[:'detectorRules']

      raise 'You cannot provide both :detectorRules and :detector_rules' if attributes.key?(:'detectorRules') && attributes.key?(:'detector_rules')

      self.detector_rules = attributes[:'detector_rules'] if attributes[:'detector_rules']

      self.effective_detector_rules = attributes[:'effectiveDetectorRules'] if attributes[:'effectiveDetectorRules']

      raise 'You cannot provide both :effectiveDetectorRules and :effective_detector_rules' if attributes.key?(:'effectiveDetectorRules') && attributes.key?(:'effective_detector_rules')

      self.effective_detector_rules = attributes[:'effective_detector_rules'] if attributes[:'effective_detector_rules']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.source_data_retention = attributes[:'sourceDataRetention'] if attributes[:'sourceDataRetention']

      raise 'You cannot provide both :sourceDataRetention and :source_data_retention' if attributes.key?(:'sourceDataRetention') && attributes.key?(:'source_data_retention')

      self.source_data_retention = attributes[:'source_data_retention'] if attributes[:'source_data_retention']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] owner Object to be assigned
    def owner=(owner)
      # rubocop:disable Style/ConditionalAssignment
      if owner && !OWNER_ENUM.include?(owner)
        OCI.logger.debug("Unknown value for 'owner' [" + owner + "]. Mapping to 'OWNER_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @owner = OWNER_UNKNOWN_ENUM_VALUE
      else
        @owner = owner
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] detector Object to be assigned
    def detector=(detector)
      # rubocop:disable Style/ConditionalAssignment
      if detector && !DETECTOR_ENUM.include?(detector)
        OCI.logger.debug("Unknown value for 'detector' [" + detector + "]. Mapping to 'DETECTOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @detector = DETECTOR_UNKNOWN_ENUM_VALUE
      else
        @detector = detector
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
        detector_recipe_id == other.detector_recipe_id &&
        owner == other.owner &&
        detector == other.detector &&
        detector_rules == other.detector_rules &&
        effective_detector_rules == other.effective_detector_rules &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        source_data_retention == other.source_data_retention
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
      [id, display_name, description, compartment_id, detector_recipe_id, owner, detector, detector_rules, effective_detector_rules, time_created, time_updated, lifecycle_state, source_data_retention].hash
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
