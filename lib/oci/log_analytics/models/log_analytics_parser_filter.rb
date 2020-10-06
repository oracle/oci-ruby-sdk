# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsParserFilter
  class LogAnalytics::Models::LogAnalyticsParserFilter
    # id
    # @return [Object]
    attr_accessor :id

    # @return [OCI::LogAnalytics::Models::LogAnalyticsParser]
    attr_accessor :parser

    # agent version
    # @return [String]
    attr_accessor :agent_version

    # is in use flag
    # @return [Integer]
    attr_accessor :is_in_use

    # operating system
    # @return [String]
    attr_accessor :operating_system

    # parser Id
    # @return [Integer]
    attr_accessor :parser_id

    # version
    # @return [String]
    attr_accessor :version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'parser': :'parser',
        'agent_version': :'agentVersion',
        'is_in_use': :'isInUse',
        'operating_system': :'operatingSystem',
        'parser_id': :'parserId',
        'version': :'version'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'Object',
        'parser': :'OCI::LogAnalytics::Models::LogAnalyticsParser',
        'agent_version': :'String',
        'is_in_use': :'Integer',
        'operating_system': :'String',
        'parser_id': :'Integer',
        'version': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Object] :id The value to assign to the {#id} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsParser] :parser The value to assign to the {#parser} property
    # @option attributes [String] :agent_version The value to assign to the {#agent_version} property
    # @option attributes [Integer] :is_in_use The value to assign to the {#is_in_use} property
    # @option attributes [String] :operating_system The value to assign to the {#operating_system} property
    # @option attributes [Integer] :parser_id The value to assign to the {#parser_id} property
    # @option attributes [String] :version The value to assign to the {#version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.parser = attributes[:'parser'] if attributes[:'parser']

      self.agent_version = attributes[:'agentVersion'] if attributes[:'agentVersion']

      raise 'You cannot provide both :agentVersion and :agent_version' if attributes.key?(:'agentVersion') && attributes.key?(:'agent_version')

      self.agent_version = attributes[:'agent_version'] if attributes[:'agent_version']

      self.is_in_use = attributes[:'isInUse'] if attributes[:'isInUse']

      raise 'You cannot provide both :isInUse and :is_in_use' if attributes.key?(:'isInUse') && attributes.key?(:'is_in_use')

      self.is_in_use = attributes[:'is_in_use'] if attributes[:'is_in_use']

      self.operating_system = attributes[:'operatingSystem'] if attributes[:'operatingSystem']

      raise 'You cannot provide both :operatingSystem and :operating_system' if attributes.key?(:'operatingSystem') && attributes.key?(:'operating_system')

      self.operating_system = attributes[:'operating_system'] if attributes[:'operating_system']

      self.parser_id = attributes[:'parserId'] if attributes[:'parserId']

      raise 'You cannot provide both :parserId and :parser_id' if attributes.key?(:'parserId') && attributes.key?(:'parser_id')

      self.parser_id = attributes[:'parser_id'] if attributes[:'parser_id']

      self.version = attributes[:'version'] if attributes[:'version']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        parser == other.parser &&
        agent_version == other.agent_version &&
        is_in_use == other.is_in_use &&
        operating_system == other.operating_system &&
        parser_id == other.parser_id &&
        version == other.version
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
      [id, parser, agent_version, is_in_use, operating_system, parser_id, version].hash
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
