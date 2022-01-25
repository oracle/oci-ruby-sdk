# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # AutonomousPatch model.
  class Database::Models::AutonomousPatch
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_SUCCESS = 'SUCCESS'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PATCH_MODEL_ENUM = [
      PATCH_MODEL_RELEASE_UPDATES = 'RELEASE_UPDATES'.freeze,
      PATCH_MODEL_RELEASE_UPDATE_REVISIONS = 'RELEASE_UPDATE_REVISIONS'.freeze,
      PATCH_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch.
    # @return [String]
    attr_accessor :id

    # **[Required]** The text describing this patch package.
    # @return [String]
    attr_accessor :description

    # **[Required]** The type of patch. BUNDLE is one example.
    # @return [String]
    attr_accessor :type

    # A descriptive text associated with the lifecycleState.
    # Typically can contain additional displayable text.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # The current state of the patch as a result of lastAction.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The date and time that the patch was released.
    # @return [DateTime]
    attr_accessor :time_released

    # **[Required]** The version of this patch package.
    # @return [String]
    attr_accessor :version

    # Database patching model preference. See [My Oracle Support note 2285040.1](https://support.oracle.com/rs?type=doc&id=2285040.1) for information on the Release Update (RU) and Release Update Revision (RUR) patching models.
    # @return [String]
    attr_reader :patch_model

    # First month of the quarter in which the patch was released.
    # @return [String]
    attr_accessor :quarter

    # Year in which the patch was released.
    # @return [String]
    attr_accessor :year

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'description': :'description',
        'type': :'type',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'time_released': :'timeReleased',
        'version': :'version',
        'patch_model': :'patchModel',
        'quarter': :'quarter',
        'year': :'year'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'description': :'String',
        'type': :'String',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'time_released': :'DateTime',
        'version': :'String',
        'patch_model': :'String',
        'quarter': :'String',
        'year': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_released The value to assign to the {#time_released} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [String] :patch_model The value to assign to the {#patch_model} property
    # @option attributes [String] :quarter The value to assign to the {#quarter} property
    # @option attributes [String] :year The value to assign to the {#year} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.type = attributes[:'type'] if attributes[:'type']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_released = attributes[:'timeReleased'] if attributes[:'timeReleased']

      raise 'You cannot provide both :timeReleased and :time_released' if attributes.key?(:'timeReleased') && attributes.key?(:'time_released')

      self.time_released = attributes[:'time_released'] if attributes[:'time_released']

      self.version = attributes[:'version'] if attributes[:'version']

      self.patch_model = attributes[:'patchModel'] if attributes[:'patchModel']

      raise 'You cannot provide both :patchModel and :patch_model' if attributes.key?(:'patchModel') && attributes.key?(:'patch_model')

      self.patch_model = attributes[:'patch_model'] if attributes[:'patch_model']

      self.quarter = attributes[:'quarter'] if attributes[:'quarter']

      self.year = attributes[:'year'] if attributes[:'year']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patch_model Object to be assigned
    def patch_model=(patch_model)
      # rubocop:disable Style/ConditionalAssignment
      if patch_model && !PATCH_MODEL_ENUM.include?(patch_model)
        OCI.logger.debug("Unknown value for 'patch_model' [" + patch_model + "]. Mapping to 'PATCH_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @patch_model = PATCH_MODEL_UNKNOWN_ENUM_VALUE
      else
        @patch_model = patch_model
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
        description == other.description &&
        type == other.type &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        time_released == other.time_released &&
        version == other.version &&
        patch_model == other.patch_model &&
        quarter == other.quarter &&
        year == other.year
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
      [id, description, type, lifecycle_details, lifecycle_state, time_released, version, patch_model, quarter, year].hash
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
