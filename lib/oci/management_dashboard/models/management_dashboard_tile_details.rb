# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties of dashboard tile representing a saved search.
  class ManagementDashboard::Models::ManagementDashboardTileDetails
    STATE_ENUM = [
      STATE_DELETED = 'DELETED'.freeze,
      STATE_UNAUTHORIZED = 'UNAUTHORIZED'.freeze,
      STATE_DEFAULT = 'DEFAULT'.freeze,
      STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Display name for saved search.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Id of saved search.
    # @return [String]
    attr_accessor :saved_search_id

    # **[Required]** Row, Y position
    # @return [Integer]
    attr_accessor :row

    # **[Required]** Column, X position
    # @return [Integer]
    attr_accessor :column

    # **[Required]** Height position
    # @return [Integer]
    attr_accessor :height

    # **[Required]** Width position
    # @return [Integer]
    attr_accessor :width

    # **[Required]** Json for internationalization.
    # @return [Object]
    attr_accessor :nls

    # **[Required]** Json to contain options for UI.
    # @return [Object]
    attr_accessor :ui_config

    # **[Required]** Array of Json to contain options for source of data.
    # @return [Array<Object>]
    attr_accessor :data_config

    # **[Required]** State of saved search.
    # @return [String]
    attr_reader :state

    # **[Required]** Drill down configuration
    # @return [Object]
    attr_accessor :drilldown_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'saved_search_id': :'savedSearchId',
        'row': :'row',
        'column': :'column',
        'height': :'height',
        'width': :'width',
        'nls': :'nls',
        'ui_config': :'uiConfig',
        'data_config': :'dataConfig',
        'state': :'state',
        'drilldown_config': :'drilldownConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'saved_search_id': :'String',
        'row': :'Integer',
        'column': :'Integer',
        'height': :'Integer',
        'width': :'Integer',
        'nls': :'Object',
        'ui_config': :'Object',
        'data_config': :'Array<Object>',
        'state': :'String',
        'drilldown_config': :'Object'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :saved_search_id The value to assign to the {#saved_search_id} property
    # @option attributes [Integer] :row The value to assign to the {#row} property
    # @option attributes [Integer] :column The value to assign to the {#column} property
    # @option attributes [Integer] :height The value to assign to the {#height} property
    # @option attributes [Integer] :width The value to assign to the {#width} property
    # @option attributes [Object] :nls The value to assign to the {#nls} property
    # @option attributes [Object] :ui_config The value to assign to the {#ui_config} property
    # @option attributes [Array<Object>] :data_config The value to assign to the {#data_config} property
    # @option attributes [String] :state The value to assign to the {#state} property
    # @option attributes [Object] :drilldown_config The value to assign to the {#drilldown_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.saved_search_id = attributes[:'savedSearchId'] if attributes[:'savedSearchId']

      raise 'You cannot provide both :savedSearchId and :saved_search_id' if attributes.key?(:'savedSearchId') && attributes.key?(:'saved_search_id')

      self.saved_search_id = attributes[:'saved_search_id'] if attributes[:'saved_search_id']

      self.row = attributes[:'row'] if attributes[:'row']

      self.column = attributes[:'column'] if attributes[:'column']

      self.height = attributes[:'height'] if attributes[:'height']

      self.width = attributes[:'width'] if attributes[:'width']

      self.nls = attributes[:'nls'] if attributes[:'nls']

      self.ui_config = attributes[:'uiConfig'] if attributes[:'uiConfig']

      raise 'You cannot provide both :uiConfig and :ui_config' if attributes.key?(:'uiConfig') && attributes.key?(:'ui_config')

      self.ui_config = attributes[:'ui_config'] if attributes[:'ui_config']

      self.data_config = attributes[:'dataConfig'] if attributes[:'dataConfig']

      raise 'You cannot provide both :dataConfig and :data_config' if attributes.key?(:'dataConfig') && attributes.key?(:'data_config')

      self.data_config = attributes[:'data_config'] if attributes[:'data_config']

      self.state = attributes[:'state'] if attributes[:'state']

      self.drilldown_config = attributes[:'drilldownConfig'] if attributes[:'drilldownConfig']

      raise 'You cannot provide both :drilldownConfig and :drilldown_config' if attributes.key?(:'drilldownConfig') && attributes.key?(:'drilldown_config')

      self.drilldown_config = attributes[:'drilldown_config'] if attributes[:'drilldown_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      # rubocop:disable Style/ConditionalAssignment
      if state && !STATE_ENUM.include?(state)
        OCI.logger.debug("Unknown value for 'state' [" + state + "]. Mapping to 'STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @state = STATE_UNKNOWN_ENUM_VALUE
      else
        @state = state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        saved_search_id == other.saved_search_id &&
        row == other.row &&
        column == other.column &&
        height == other.height &&
        width == other.width &&
        nls == other.nls &&
        ui_config == other.ui_config &&
        data_config == other.data_config &&
        state == other.state &&
        drilldown_config == other.drilldown_config
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
      [display_name, saved_search_id, row, column, height, width, nls, ui_config, data_config, state, drilldown_config].hash
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
