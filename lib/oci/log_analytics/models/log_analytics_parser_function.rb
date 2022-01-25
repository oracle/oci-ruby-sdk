# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsParserFunction
  class LogAnalytics::Models::LogAnalyticsParserFunction
    # @return [OCI::LogAnalytics::Models::LogAnalyticsParserMetaPlugin]
    attr_accessor :parser_meta_plugin

    # The parser function unique identifier.
    # @return [Integer]
    attr_accessor :parser_function_id

    # The parser function internal name.
    # @return [String]
    attr_accessor :parser_function_name

    # A flag inidcating whether or not the parser function is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # The associated parser unique identifier.
    # @return [Integer]
    attr_accessor :parser_id

    # The associated parser internal name.
    # @return [String]
    attr_accessor :parser_name

    # The plugin internal name.
    # @return [String]
    attr_accessor :parser_meta_plugin_name

    # The parser function priority.
    # @return [Integer]
    attr_accessor :parser_function_priority

    # The parser function parameter list.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParserFunctionParameter>]
    attr_accessor :parser_function_parameters

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_meta_plugin': :'parserMetaPlugin',
        'parser_function_id': :'parserFunctionId',
        'parser_function_name': :'parserFunctionName',
        'is_enabled': :'isEnabled',
        'is_system': :'isSystem',
        'parser_id': :'parserId',
        'parser_name': :'parserName',
        'parser_meta_plugin_name': :'parserMetaPluginName',
        'parser_function_priority': :'parserFunctionPriority',
        'parser_function_parameters': :'parserFunctionParameters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_meta_plugin': :'OCI::LogAnalytics::Models::LogAnalyticsParserMetaPlugin',
        'parser_function_id': :'Integer',
        'parser_function_name': :'String',
        'is_enabled': :'BOOLEAN',
        'is_system': :'BOOLEAN',
        'parser_id': :'Integer',
        'parser_name': :'String',
        'parser_meta_plugin_name': :'String',
        'parser_function_priority': :'Integer',
        'parser_function_parameters': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParserFunctionParameter>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsParserMetaPlugin] :parser_meta_plugin The value to assign to the {#parser_meta_plugin} property
    # @option attributes [Integer] :parser_function_id The value to assign to the {#parser_function_id} property
    # @option attributes [String] :parser_function_name The value to assign to the {#parser_function_name} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [Integer] :parser_id The value to assign to the {#parser_id} property
    # @option attributes [String] :parser_name The value to assign to the {#parser_name} property
    # @option attributes [String] :parser_meta_plugin_name The value to assign to the {#parser_meta_plugin_name} property
    # @option attributes [Integer] :parser_function_priority The value to assign to the {#parser_function_priority} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParserFunctionParameter>] :parser_function_parameters The value to assign to the {#parser_function_parameters} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parser_meta_plugin = attributes[:'parserMetaPlugin'] if attributes[:'parserMetaPlugin']

      raise 'You cannot provide both :parserMetaPlugin and :parser_meta_plugin' if attributes.key?(:'parserMetaPlugin') && attributes.key?(:'parser_meta_plugin')

      self.parser_meta_plugin = attributes[:'parser_meta_plugin'] if attributes[:'parser_meta_plugin']

      self.parser_function_id = attributes[:'parserFunctionId'] if attributes[:'parserFunctionId']

      raise 'You cannot provide both :parserFunctionId and :parser_function_id' if attributes.key?(:'parserFunctionId') && attributes.key?(:'parser_function_id')

      self.parser_function_id = attributes[:'parser_function_id'] if attributes[:'parser_function_id']

      self.parser_function_name = attributes[:'parserFunctionName'] if attributes[:'parserFunctionName']

      raise 'You cannot provide both :parserFunctionName and :parser_function_name' if attributes.key?(:'parserFunctionName') && attributes.key?(:'parser_function_name')

      self.parser_function_name = attributes[:'parser_function_name'] if attributes[:'parser_function_name']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.parser_id = attributes[:'parserId'] if attributes[:'parserId']

      raise 'You cannot provide both :parserId and :parser_id' if attributes.key?(:'parserId') && attributes.key?(:'parser_id')

      self.parser_id = attributes[:'parser_id'] if attributes[:'parser_id']

      self.parser_name = attributes[:'parserName'] if attributes[:'parserName']

      raise 'You cannot provide both :parserName and :parser_name' if attributes.key?(:'parserName') && attributes.key?(:'parser_name')

      self.parser_name = attributes[:'parser_name'] if attributes[:'parser_name']

      self.parser_meta_plugin_name = attributes[:'parserMetaPluginName'] if attributes[:'parserMetaPluginName']

      raise 'You cannot provide both :parserMetaPluginName and :parser_meta_plugin_name' if attributes.key?(:'parserMetaPluginName') && attributes.key?(:'parser_meta_plugin_name')

      self.parser_meta_plugin_name = attributes[:'parser_meta_plugin_name'] if attributes[:'parser_meta_plugin_name']

      self.parser_function_priority = attributes[:'parserFunctionPriority'] if attributes[:'parserFunctionPriority']

      raise 'You cannot provide both :parserFunctionPriority and :parser_function_priority' if attributes.key?(:'parserFunctionPriority') && attributes.key?(:'parser_function_priority')

      self.parser_function_priority = attributes[:'parser_function_priority'] if attributes[:'parser_function_priority']

      self.parser_function_parameters = attributes[:'parserFunctionParameters'] if attributes[:'parserFunctionParameters']

      raise 'You cannot provide both :parserFunctionParameters and :parser_function_parameters' if attributes.key?(:'parserFunctionParameters') && attributes.key?(:'parser_function_parameters')

      self.parser_function_parameters = attributes[:'parser_function_parameters'] if attributes[:'parser_function_parameters']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parser_meta_plugin == other.parser_meta_plugin &&
        parser_function_id == other.parser_function_id &&
        parser_function_name == other.parser_function_name &&
        is_enabled == other.is_enabled &&
        is_system == other.is_system &&
        parser_id == other.parser_id &&
        parser_name == other.parser_name &&
        parser_meta_plugin_name == other.parser_meta_plugin_name &&
        parser_function_priority == other.parser_function_priority &&
        parser_function_parameters == other.parser_function_parameters
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
      [parser_meta_plugin, parser_function_id, parser_function_name, is_enabled, is_system, parser_id, parser_name, parser_meta_plugin_name, parser_function_priority, parser_function_parameters].hash
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
