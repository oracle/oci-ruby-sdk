# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the current management agent plugins that agent is having.
  class ManagementAgent::Models::ManagementAgentPluginDetails
    # Plugin Id
    # @return [String]
    attr_accessor :plugin_id

    # **[Required]** Management Agent Plugin Name
    # @return [String]
    attr_accessor :plugin_name

    # Management Agent Plugin Identifier, can be renamed
    # @return [String]
    attr_accessor :plugin_display_name

    # Plugin Version
    # @return [String]
    attr_accessor :plugin_version

    # flag indicating whether the plugin is in enabled mode or disabled mode.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'plugin_id': :'pluginId',
        'plugin_name': :'pluginName',
        'plugin_display_name': :'pluginDisplayName',
        'plugin_version': :'pluginVersion',
        'is_enabled': :'isEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'plugin_id': :'String',
        'plugin_name': :'String',
        'plugin_display_name': :'String',
        'plugin_version': :'String',
        'is_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :plugin_id The value to assign to the {#plugin_id} property
    # @option attributes [String] :plugin_name The value to assign to the {#plugin_name} property
    # @option attributes [String] :plugin_display_name The value to assign to the {#plugin_display_name} property
    # @option attributes [String] :plugin_version The value to assign to the {#plugin_version} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.plugin_id = attributes[:'pluginId'] if attributes[:'pluginId']

      raise 'You cannot provide both :pluginId and :plugin_id' if attributes.key?(:'pluginId') && attributes.key?(:'plugin_id')

      self.plugin_id = attributes[:'plugin_id'] if attributes[:'plugin_id']

      self.plugin_name = attributes[:'pluginName'] if attributes[:'pluginName']

      raise 'You cannot provide both :pluginName and :plugin_name' if attributes.key?(:'pluginName') && attributes.key?(:'plugin_name')

      self.plugin_name = attributes[:'plugin_name'] if attributes[:'plugin_name']

      self.plugin_display_name = attributes[:'pluginDisplayName'] if attributes[:'pluginDisplayName']

      raise 'You cannot provide both :pluginDisplayName and :plugin_display_name' if attributes.key?(:'pluginDisplayName') && attributes.key?(:'plugin_display_name')

      self.plugin_display_name = attributes[:'plugin_display_name'] if attributes[:'plugin_display_name']

      self.plugin_version = attributes[:'pluginVersion'] if attributes[:'pluginVersion']

      raise 'You cannot provide both :pluginVersion and :plugin_version' if attributes.key?(:'pluginVersion') && attributes.key?(:'plugin_version')

      self.plugin_version = attributes[:'plugin_version'] if attributes[:'plugin_version']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        plugin_id == other.plugin_id &&
        plugin_name == other.plugin_name &&
        plugin_display_name == other.plugin_display_name &&
        plugin_version == other.plugin_version &&
        is_enabled == other.is_enabled
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
      [plugin_id, plugin_name, plugin_display_name, plugin_version, is_enabled].hash
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
