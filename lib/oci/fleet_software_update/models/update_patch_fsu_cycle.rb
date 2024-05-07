# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220528
require 'date'
require_relative 'update_fsu_cycle_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Update Patch Exadata Fleet Update Cycle resource details.
  #
  class FleetSoftwareUpdate::Models::UpdatePatchFsuCycle < FleetSoftwareUpdate::Models::UpdateFsuCycleDetails
    # Ignore all patches between the source and target homes during patching.
    #
    # @return [BOOLEAN]
    attr_accessor :is_ignore_patches

    # List of patch IDs to ignore.
    # An empty array removes the previously stored patch IDs in the Maintenance Cycle properties.
    #
    # @return [Array<String>]
    attr_accessor :is_ignore_missing_patches

    # Service drain timeout specified in seconds.
    #
    # @return [Integer]
    attr_accessor :max_drain_timeout_in_seconds

    # Ensure that services of administrator-managed Oracle RAC or Oracle RAC One databases are running on the same
    # instances before and after the move operation.
    #
    # @return [BOOLEAN]
    attr_accessor :is_keep_placement

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'type': :'type',
        'goal_version_details': :'goalVersionDetails',
        'batching_strategy': :'batchingStrategy',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'is_ignore_patches': :'isIgnorePatches',
        'is_ignore_missing_patches': :'isIgnoreMissingPatches',
        'max_drain_timeout_in_seconds': :'maxDrainTimeoutInSeconds',
        'is_keep_placement': :'isKeepPlacement'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'type': :'String',
        'goal_version_details': :'OCI::FleetSoftwareUpdate::Models::FsuGoalVersionDetails',
        'batching_strategy': :'OCI::FleetSoftwareUpdate::Models::UpdateBatchingStrategyDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'is_ignore_patches': :'BOOLEAN',
        'is_ignore_missing_patches': :'Array<String>',
        'max_drain_timeout_in_seconds': :'Integer',
        'is_keep_placement': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::FleetSoftwareUpdate::Models::UpdateFsuCycleDetails#display_name #display_name} proprety
    # @option attributes [OCI::FleetSoftwareUpdate::Models::FsuGoalVersionDetails] :goal_version_details The value to assign to the {OCI::FleetSoftwareUpdate::Models::UpdateFsuCycleDetails#goal_version_details #goal_version_details} proprety
    # @option attributes [OCI::FleetSoftwareUpdate::Models::UpdateBatchingStrategyDetails] :batching_strategy The value to assign to the {OCI::FleetSoftwareUpdate::Models::UpdateFsuCycleDetails#batching_strategy #batching_strategy} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::FleetSoftwareUpdate::Models::UpdateFsuCycleDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::FleetSoftwareUpdate::Models::UpdateFsuCycleDetails#defined_tags #defined_tags} proprety
    # @option attributes [BOOLEAN] :is_ignore_patches The value to assign to the {#is_ignore_patches} property
    # @option attributes [Array<String>] :is_ignore_missing_patches The value to assign to the {#is_ignore_missing_patches} property
    # @option attributes [Integer] :max_drain_timeout_in_seconds The value to assign to the {#max_drain_timeout_in_seconds} property
    # @option attributes [BOOLEAN] :is_keep_placement The value to assign to the {#is_keep_placement} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'PATCH'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_ignore_patches = attributes[:'isIgnorePatches'] unless attributes[:'isIgnorePatches'].nil?
      self.is_ignore_patches = false if is_ignore_patches.nil? && !attributes.key?(:'isIgnorePatches') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isIgnorePatches and :is_ignore_patches' if attributes.key?(:'isIgnorePatches') && attributes.key?(:'is_ignore_patches')

      self.is_ignore_patches = attributes[:'is_ignore_patches'] unless attributes[:'is_ignore_patches'].nil?
      self.is_ignore_patches = false if is_ignore_patches.nil? && !attributes.key?(:'isIgnorePatches') && !attributes.key?(:'is_ignore_patches') # rubocop:disable Style/StringLiterals

      self.is_ignore_missing_patches = attributes[:'isIgnoreMissingPatches'] if attributes[:'isIgnoreMissingPatches']

      raise 'You cannot provide both :isIgnoreMissingPatches and :is_ignore_missing_patches' if attributes.key?(:'isIgnoreMissingPatches') && attributes.key?(:'is_ignore_missing_patches')

      self.is_ignore_missing_patches = attributes[:'is_ignore_missing_patches'] if attributes[:'is_ignore_missing_patches']

      self.max_drain_timeout_in_seconds = attributes[:'maxDrainTimeoutInSeconds'] if attributes[:'maxDrainTimeoutInSeconds']

      raise 'You cannot provide both :maxDrainTimeoutInSeconds and :max_drain_timeout_in_seconds' if attributes.key?(:'maxDrainTimeoutInSeconds') && attributes.key?(:'max_drain_timeout_in_seconds')

      self.max_drain_timeout_in_seconds = attributes[:'max_drain_timeout_in_seconds'] if attributes[:'max_drain_timeout_in_seconds']

      self.is_keep_placement = attributes[:'isKeepPlacement'] unless attributes[:'isKeepPlacement'].nil?

      raise 'You cannot provide both :isKeepPlacement and :is_keep_placement' if attributes.key?(:'isKeepPlacement') && attributes.key?(:'is_keep_placement')

      self.is_keep_placement = attributes[:'is_keep_placement'] unless attributes[:'is_keep_placement'].nil?
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
        type == other.type &&
        goal_version_details == other.goal_version_details &&
        batching_strategy == other.batching_strategy &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        is_ignore_patches == other.is_ignore_patches &&
        is_ignore_missing_patches == other.is_ignore_missing_patches &&
        max_drain_timeout_in_seconds == other.max_drain_timeout_in_seconds &&
        is_keep_placement == other.is_keep_placement
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
      [display_name, type, goal_version_details, batching_strategy, freeform_tags, defined_tags, is_ignore_patches, is_ignore_missing_patches, max_drain_timeout_in_seconds, is_keep_placement].hash
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
