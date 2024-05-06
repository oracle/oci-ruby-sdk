# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20211201
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # kmsKeyInfo
  class FusionApps::Models::KmsKeyInfo
    SCHEDULED_KEY_STATUS_ENUM = [
      SCHEDULED_KEY_STATUS_SCHEDULING = 'SCHEDULING'.freeze,
      SCHEDULED_KEY_STATUS_UPDATING = 'UPDATING'.freeze,
      SCHEDULED_KEY_STATUS_FAILED = 'FAILED'.freeze,
      SCHEDULED_KEY_STATUS_NONE = 'NONE'.freeze
    ].freeze

    # current BYOK keyId facp is using
    # @return [String]
    attr_accessor :active_key_id

    # current key version facp is using
    # @return [String]
    attr_accessor :active_key_version

    # scheduled keyId to be updated
    # @return [String]
    attr_accessor :scheduled_key_id

    # scheduled key version to be updated.
    # @return [String]
    attr_accessor :scheduled_key_version

    # current key lifeCycleState
    # @return [String]
    attr_accessor :current_key_lifecycle_state

    # scheduled key lifeCycle state to be updated.
    # @return [String]
    attr_accessor :scheduled_lifecycle_state

    # the scheduled key status
    # @return [String]
    attr_reader :scheduled_key_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'active_key_id': :'activeKeyId',
        'active_key_version': :'activeKeyVersion',
        'scheduled_key_id': :'scheduledKeyId',
        'scheduled_key_version': :'scheduledKeyVersion',
        'current_key_lifecycle_state': :'currentKeyLifecycleState',
        'scheduled_lifecycle_state': :'scheduledLifecycleState',
        'scheduled_key_status': :'scheduledKeyStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'active_key_id': :'String',
        'active_key_version': :'String',
        'scheduled_key_id': :'String',
        'scheduled_key_version': :'String',
        'current_key_lifecycle_state': :'String',
        'scheduled_lifecycle_state': :'String',
        'scheduled_key_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :active_key_id The value to assign to the {#active_key_id} property
    # @option attributes [String] :active_key_version The value to assign to the {#active_key_version} property
    # @option attributes [String] :scheduled_key_id The value to assign to the {#scheduled_key_id} property
    # @option attributes [String] :scheduled_key_version The value to assign to the {#scheduled_key_version} property
    # @option attributes [String] :current_key_lifecycle_state The value to assign to the {#current_key_lifecycle_state} property
    # @option attributes [String] :scheduled_lifecycle_state The value to assign to the {#scheduled_lifecycle_state} property
    # @option attributes [String] :scheduled_key_status The value to assign to the {#scheduled_key_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.active_key_id = attributes[:'activeKeyId'] if attributes[:'activeKeyId']

      raise 'You cannot provide both :activeKeyId and :active_key_id' if attributes.key?(:'activeKeyId') && attributes.key?(:'active_key_id')

      self.active_key_id = attributes[:'active_key_id'] if attributes[:'active_key_id']

      self.active_key_version = attributes[:'activeKeyVersion'] if attributes[:'activeKeyVersion']

      raise 'You cannot provide both :activeKeyVersion and :active_key_version' if attributes.key?(:'activeKeyVersion') && attributes.key?(:'active_key_version')

      self.active_key_version = attributes[:'active_key_version'] if attributes[:'active_key_version']

      self.scheduled_key_id = attributes[:'scheduledKeyId'] if attributes[:'scheduledKeyId']

      raise 'You cannot provide both :scheduledKeyId and :scheduled_key_id' if attributes.key?(:'scheduledKeyId') && attributes.key?(:'scheduled_key_id')

      self.scheduled_key_id = attributes[:'scheduled_key_id'] if attributes[:'scheduled_key_id']

      self.scheduled_key_version = attributes[:'scheduledKeyVersion'] if attributes[:'scheduledKeyVersion']

      raise 'You cannot provide both :scheduledKeyVersion and :scheduled_key_version' if attributes.key?(:'scheduledKeyVersion') && attributes.key?(:'scheduled_key_version')

      self.scheduled_key_version = attributes[:'scheduled_key_version'] if attributes[:'scheduled_key_version']

      self.current_key_lifecycle_state = attributes[:'currentKeyLifecycleState'] if attributes[:'currentKeyLifecycleState']

      raise 'You cannot provide both :currentKeyLifecycleState and :current_key_lifecycle_state' if attributes.key?(:'currentKeyLifecycleState') && attributes.key?(:'current_key_lifecycle_state')

      self.current_key_lifecycle_state = attributes[:'current_key_lifecycle_state'] if attributes[:'current_key_lifecycle_state']

      self.scheduled_lifecycle_state = attributes[:'scheduledLifecycleState'] if attributes[:'scheduledLifecycleState']

      raise 'You cannot provide both :scheduledLifecycleState and :scheduled_lifecycle_state' if attributes.key?(:'scheduledLifecycleState') && attributes.key?(:'scheduled_lifecycle_state')

      self.scheduled_lifecycle_state = attributes[:'scheduled_lifecycle_state'] if attributes[:'scheduled_lifecycle_state']

      self.scheduled_key_status = attributes[:'scheduledKeyStatus'] if attributes[:'scheduledKeyStatus']

      raise 'You cannot provide both :scheduledKeyStatus and :scheduled_key_status' if attributes.key?(:'scheduledKeyStatus') && attributes.key?(:'scheduled_key_status')

      self.scheduled_key_status = attributes[:'scheduled_key_status'] if attributes[:'scheduled_key_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] scheduled_key_status Object to be assigned
    def scheduled_key_status=(scheduled_key_status)
      raise "Invalid value for 'scheduled_key_status': this must be one of the values in SCHEDULED_KEY_STATUS_ENUM." if scheduled_key_status && !SCHEDULED_KEY_STATUS_ENUM.include?(scheduled_key_status)

      @scheduled_key_status = scheduled_key_status
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        active_key_id == other.active_key_id &&
        active_key_version == other.active_key_version &&
        scheduled_key_id == other.scheduled_key_id &&
        scheduled_key_version == other.scheduled_key_version &&
        current_key_lifecycle_state == other.current_key_lifecycle_state &&
        scheduled_lifecycle_state == other.scheduled_lifecycle_state &&
        scheduled_key_status == other.scheduled_key_status
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
      [active_key_id, active_key_version, scheduled_key_id, scheduled_key_version, current_key_lifecycle_state, scheduled_lifecycle_state, scheduled_key_status].hash
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