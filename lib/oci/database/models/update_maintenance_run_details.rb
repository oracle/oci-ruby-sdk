# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Describes the modification parameters for the maintenance run.
  #
  class Database::Models::UpdateMaintenanceRunDetails
    PATCHING_MODE_ENUM = [
      PATCHING_MODE_ROLLING = 'ROLLING'.freeze,
      PATCHING_MODE_NONROLLING = 'NONROLLING'.freeze
    ].freeze

    # If `FALSE`, skips the maintenance run.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The scheduled date and time of the maintenance run to update.
    # @return [DateTime]
    attr_accessor :time_scheduled

    # If set to `TRUE`, starts patching immediately.
    # @return [BOOLEAN]
    attr_accessor :is_patch_now_enabled

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch to be applied in the maintenance run.
    # @return [String]
    attr_accessor :patch_id

    # Cloud Exadata infrastructure node patching method, either \"ROLLING\" or \"NONROLLING\". Default value is ROLLING.
    #
    # *IMPORTANT*: Non-rolling infrastructure patching involves system down time. See [Oracle-Managed Infrastructure Maintenance Updates](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/examaintenance.htm#Oracle) for more information.
    #
    # @return [String]
    attr_reader :patching_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'isEnabled',
        'time_scheduled': :'timeScheduled',
        'is_patch_now_enabled': :'isPatchNowEnabled',
        'patch_id': :'patchId',
        'patching_mode': :'patchingMode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'BOOLEAN',
        'time_scheduled': :'DateTime',
        'is_patch_now_enabled': :'BOOLEAN',
        'patch_id': :'String',
        'patching_mode': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [DateTime] :time_scheduled The value to assign to the {#time_scheduled} property
    # @option attributes [BOOLEAN] :is_patch_now_enabled The value to assign to the {#is_patch_now_enabled} property
    # @option attributes [String] :patch_id The value to assign to the {#patch_id} property
    # @option attributes [String] :patching_mode The value to assign to the {#patching_mode} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.time_scheduled = attributes[:'timeScheduled'] if attributes[:'timeScheduled']

      raise 'You cannot provide both :timeScheduled and :time_scheduled' if attributes.key?(:'timeScheduled') && attributes.key?(:'time_scheduled')

      self.time_scheduled = attributes[:'time_scheduled'] if attributes[:'time_scheduled']

      self.is_patch_now_enabled = attributes[:'isPatchNowEnabled'] unless attributes[:'isPatchNowEnabled'].nil?

      raise 'You cannot provide both :isPatchNowEnabled and :is_patch_now_enabled' if attributes.key?(:'isPatchNowEnabled') && attributes.key?(:'is_patch_now_enabled')

      self.is_patch_now_enabled = attributes[:'is_patch_now_enabled'] unless attributes[:'is_patch_now_enabled'].nil?

      self.patch_id = attributes[:'patchId'] if attributes[:'patchId']

      raise 'You cannot provide both :patchId and :patch_id' if attributes.key?(:'patchId') && attributes.key?(:'patch_id')

      self.patch_id = attributes[:'patch_id'] if attributes[:'patch_id']

      self.patching_mode = attributes[:'patchingMode'] if attributes[:'patchingMode']

      raise 'You cannot provide both :patchingMode and :patching_mode' if attributes.key?(:'patchingMode') && attributes.key?(:'patching_mode')

      self.patching_mode = attributes[:'patching_mode'] if attributes[:'patching_mode']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patching_mode Object to be assigned
    def patching_mode=(patching_mode)
      raise "Invalid value for 'patching_mode': this must be one of the values in PATCHING_MODE_ENUM." if patching_mode && !PATCHING_MODE_ENUM.include?(patching_mode)

      @patching_mode = patching_mode
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_enabled == other.is_enabled &&
        time_scheduled == other.time_scheduled &&
        is_patch_now_enabled == other.is_patch_now_enabled &&
        patch_id == other.patch_id &&
        patching_mode == other.patching_mode
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
      [is_enabled, time_scheduled, is_patch_now_enabled, patch_id, patching_mode].hash
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
