# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The scheduling details for the quarterly maintenance window. Patching and system updates take place during the maintenance window.
  #
  class Database::Models::DbServerPatchingDetails
    PATCHING_STATUS_ENUM = [
      PATCHING_STATUS_SCHEDULED = 'SCHEDULED'.freeze,
      PATCHING_STATUS_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      PATCHING_STATUS_FAILED = 'FAILED'.freeze,
      PATCHING_STATUS_COMPLETE = 'COMPLETE'.freeze,
      PATCHING_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Estimated time, in minutes, to patch one database server.
    # @return [Integer]
    attr_accessor :estimated_patch_duration

    # The status of the patching operation.
    # @return [String]
    attr_reader :patching_status

    # The time when the patching operation started.
    # @return [DateTime]
    attr_accessor :time_patching_started

    # The time when the patching operation ended.
    # @return [DateTime]
    attr_accessor :time_patching_ended

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'estimated_patch_duration': :'estimatedPatchDuration',
        'patching_status': :'patchingStatus',
        'time_patching_started': :'timePatchingStarted',
        'time_patching_ended': :'timePatchingEnded'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'estimated_patch_duration': :'Integer',
        'patching_status': :'String',
        'time_patching_started': :'DateTime',
        'time_patching_ended': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :estimated_patch_duration The value to assign to the {#estimated_patch_duration} property
    # @option attributes [String] :patching_status The value to assign to the {#patching_status} property
    # @option attributes [DateTime] :time_patching_started The value to assign to the {#time_patching_started} property
    # @option attributes [DateTime] :time_patching_ended The value to assign to the {#time_patching_ended} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.estimated_patch_duration = attributes[:'estimatedPatchDuration'] if attributes[:'estimatedPatchDuration']

      raise 'You cannot provide both :estimatedPatchDuration and :estimated_patch_duration' if attributes.key?(:'estimatedPatchDuration') && attributes.key?(:'estimated_patch_duration')

      self.estimated_patch_duration = attributes[:'estimated_patch_duration'] if attributes[:'estimated_patch_duration']

      self.patching_status = attributes[:'patchingStatus'] if attributes[:'patchingStatus']

      raise 'You cannot provide both :patchingStatus and :patching_status' if attributes.key?(:'patchingStatus') && attributes.key?(:'patching_status')

      self.patching_status = attributes[:'patching_status'] if attributes[:'patching_status']

      self.time_patching_started = attributes[:'timePatchingStarted'] if attributes[:'timePatchingStarted']

      raise 'You cannot provide both :timePatchingStarted and :time_patching_started' if attributes.key?(:'timePatchingStarted') && attributes.key?(:'time_patching_started')

      self.time_patching_started = attributes[:'time_patching_started'] if attributes[:'time_patching_started']

      self.time_patching_ended = attributes[:'timePatchingEnded'] if attributes[:'timePatchingEnded']

      raise 'You cannot provide both :timePatchingEnded and :time_patching_ended' if attributes.key?(:'timePatchingEnded') && attributes.key?(:'time_patching_ended')

      self.time_patching_ended = attributes[:'time_patching_ended'] if attributes[:'time_patching_ended']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patching_status Object to be assigned
    def patching_status=(patching_status)
      # rubocop:disable Style/ConditionalAssignment
      if patching_status && !PATCHING_STATUS_ENUM.include?(patching_status)
        OCI.logger.debug("Unknown value for 'patching_status' [" + patching_status + "]. Mapping to 'PATCHING_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @patching_status = PATCHING_STATUS_UNKNOWN_ENUM_VALUE
      else
        @patching_status = patching_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        estimated_patch_duration == other.estimated_patch_duration &&
        patching_status == other.patching_status &&
        time_patching_started == other.time_patching_started &&
        time_patching_ended == other.time_patching_ended
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
      [estimated_patch_duration, patching_status, time_patching_started, time_patching_ended].hash
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
