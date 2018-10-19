# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The status of the cross-connect.
  class Core::Models::CrossConnectStatus # rubocop:disable Metrics/LineLength
    INTERFACE_STATE_ENUM = [
      INTERFACE_STATE_UP = 'UP'.freeze,
      INTERFACE_STATE_DOWN = 'DOWN'.freeze,
      INTERFACE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIGHT_LEVEL_INDICATOR_ENUM = [
      LIGHT_LEVEL_INDICATOR_NO_LIGHT = 'NO_LIGHT'.freeze,
      LIGHT_LEVEL_INDICATOR_LOW_WARN = 'LOW_WARN'.freeze,
      LIGHT_LEVEL_INDICATOR_HIGH_WARN = 'HIGH_WARN'.freeze,
      LIGHT_LEVEL_INDICATOR_BAD = 'BAD'.freeze,
      LIGHT_LEVEL_INDICATOR_GOOD = 'GOOD'.freeze,
      LIGHT_LEVEL_INDICATOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the cross-connect.
    # @return [String]
    attr_accessor :cross_connect_id

    # Whether Oracle's side of the interface is up or down.
    # @return [String]
    attr_reader :interface_state

    # The light level of the cross-connect (in dBm).
    #
    # Example: `14.0`
    #
    # @return [Float]
    attr_accessor :light_level_ind_bm

    # Status indicator corresponding to the light level.
    #
    #   * **NO_LIGHT:** No measurable light
    #
    #   * **LOW_WARN:** There's measurable light but it's too low
    #
    #   * **HIGH_WARN:** Light level is too high
    #
    #   * **BAD:** There's measurable light but the signal-to-noise ratio is bad
    #
    #   * **GOOD:** Good light level
    #
    # @return [String]
    attr_reader :light_level_indicator

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cross_connect_id': :'crossConnectId',
        'interface_state': :'interfaceState',
        'light_level_ind_bm': :'lightLevelIndBm',
        'light_level_indicator': :'lightLevelIndicator'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cross_connect_id': :'String',
        'interface_state': :'String',
        'light_level_ind_bm': :'Float',
        'light_level_indicator': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cross_connect_id The value to assign to the {#cross_connect_id} property
    # @option attributes [String] :interface_state The value to assign to the {#interface_state} property
    # @option attributes [Float] :light_level_ind_bm The value to assign to the {#light_level_ind_bm} property
    # @option attributes [String] :light_level_indicator The value to assign to the {#light_level_indicator} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cross_connect_id = attributes[:'crossConnectId'] if attributes[:'crossConnectId']

      raise 'You cannot provide both :crossConnectId and :cross_connect_id' if attributes.key?(:'crossConnectId') && attributes.key?(:'cross_connect_id')

      self.cross_connect_id = attributes[:'cross_connect_id'] if attributes[:'cross_connect_id']

      self.interface_state = attributes[:'interfaceState'] if attributes[:'interfaceState']

      raise 'You cannot provide both :interfaceState and :interface_state' if attributes.key?(:'interfaceState') && attributes.key?(:'interface_state')

      self.interface_state = attributes[:'interface_state'] if attributes[:'interface_state']

      self.light_level_ind_bm = attributes[:'lightLevelIndBm'] if attributes[:'lightLevelIndBm']

      raise 'You cannot provide both :lightLevelIndBm and :light_level_ind_bm' if attributes.key?(:'lightLevelIndBm') && attributes.key?(:'light_level_ind_bm')

      self.light_level_ind_bm = attributes[:'light_level_ind_bm'] if attributes[:'light_level_ind_bm']

      self.light_level_indicator = attributes[:'lightLevelIndicator'] if attributes[:'lightLevelIndicator']

      raise 'You cannot provide both :lightLevelIndicator and :light_level_indicator' if attributes.key?(:'lightLevelIndicator') && attributes.key?(:'light_level_indicator')

      self.light_level_indicator = attributes[:'light_level_indicator'] if attributes[:'light_level_indicator']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] interface_state Object to be assigned
    def interface_state=(interface_state)
      # rubocop:disable Style/ConditionalAssignment
      if interface_state && !INTERFACE_STATE_ENUM.include?(interface_state)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'interface_state' [" + interface_state + "]. Mapping to 'INTERFACE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @interface_state = INTERFACE_STATE_UNKNOWN_ENUM_VALUE
      else
        @interface_state = interface_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] light_level_indicator Object to be assigned
    def light_level_indicator=(light_level_indicator)
      # rubocop:disable Style/ConditionalAssignment
      if light_level_indicator && !LIGHT_LEVEL_INDICATOR_ENUM.include?(light_level_indicator)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'light_level_indicator' [" + light_level_indicator + "]. Mapping to 'LIGHT_LEVEL_INDICATOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @light_level_indicator = LIGHT_LEVEL_INDICATOR_UNKNOWN_ENUM_VALUE
      else
        @light_level_indicator = light_level_indicator
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        cross_connect_id == other.cross_connect_id &&
        interface_state == other.interface_state &&
        light_level_ind_bm == other.light_level_ind_bm &&
        light_level_indicator == other.light_level_indicator
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [cross_connect_id, interface_state, light_level_ind_bm, light_level_indicator].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
