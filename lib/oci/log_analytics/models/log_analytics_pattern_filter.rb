# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsPatternFilter
  class LogAnalytics::Models::LogAnalyticsPatternFilter
    # @return [OCI::LogAnalytics::Models::LogAnalyticsSourcePattern]
    attr_accessor :pattern

    # The agent version.
    # @return [String]
    attr_accessor :agent_version

    # A flag indicating whether or not the pattern filter is currently
    # in use.
    #
    # @return [BOOLEAN]
    attr_accessor :is_in_use

    # The operating system.
    # @return [String]
    attr_accessor :operating_system

    # The pattern unique identifier.
    # @return [Integer]
    attr_accessor :pattern_id

    # The source unique identifier.
    # @return [Integer]
    attr_accessor :source_id

    # The pattern filter version.
    # @return [String]
    attr_accessor :version

    # @return [OCI::LogAnalytics::Models::LogAnalyticsSource]
    attr_accessor :source

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'pattern': :'pattern',
        'agent_version': :'agentVersion',
        'is_in_use': :'isInUse',
        'operating_system': :'operatingSystem',
        'pattern_id': :'patternId',
        'source_id': :'sourceId',
        'version': :'version',
        'source': :'source'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'pattern': :'OCI::LogAnalytics::Models::LogAnalyticsSourcePattern',
        'agent_version': :'String',
        'is_in_use': :'BOOLEAN',
        'operating_system': :'String',
        'pattern_id': :'Integer',
        'source_id': :'Integer',
        'version': :'String',
        'source': :'OCI::LogAnalytics::Models::LogAnalyticsSource'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsSourcePattern] :pattern The value to assign to the {#pattern} property
    # @option attributes [String] :agent_version The value to assign to the {#agent_version} property
    # @option attributes [BOOLEAN] :is_in_use The value to assign to the {#is_in_use} property
    # @option attributes [String] :operating_system The value to assign to the {#operating_system} property
    # @option attributes [Integer] :pattern_id The value to assign to the {#pattern_id} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsSource] :source The value to assign to the {#source} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.pattern = attributes[:'pattern'] if attributes[:'pattern']

      self.agent_version = attributes[:'agentVersion'] if attributes[:'agentVersion']

      raise 'You cannot provide both :agentVersion and :agent_version' if attributes.key?(:'agentVersion') && attributes.key?(:'agent_version')

      self.agent_version = attributes[:'agent_version'] if attributes[:'agent_version']

      self.is_in_use = attributes[:'isInUse'] unless attributes[:'isInUse'].nil?

      raise 'You cannot provide both :isInUse and :is_in_use' if attributes.key?(:'isInUse') && attributes.key?(:'is_in_use')

      self.is_in_use = attributes[:'is_in_use'] unless attributes[:'is_in_use'].nil?

      self.operating_system = attributes[:'operatingSystem'] if attributes[:'operatingSystem']

      raise 'You cannot provide both :operatingSystem and :operating_system' if attributes.key?(:'operatingSystem') && attributes.key?(:'operating_system')

      self.operating_system = attributes[:'operating_system'] if attributes[:'operating_system']

      self.pattern_id = attributes[:'patternId'] if attributes[:'patternId']

      raise 'You cannot provide both :patternId and :pattern_id' if attributes.key?(:'patternId') && attributes.key?(:'pattern_id')

      self.pattern_id = attributes[:'pattern_id'] if attributes[:'pattern_id']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.version = attributes[:'version'] if attributes[:'version']

      self.source = attributes[:'source'] if attributes[:'source']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        pattern == other.pattern &&
        agent_version == other.agent_version &&
        is_in_use == other.is_in_use &&
        operating_system == other.operating_system &&
        pattern_id == other.pattern_id &&
        source_id == other.source_id &&
        version == other.version &&
        source == other.source
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
      [pattern, agent_version, is_in_use, operating_system, pattern_id, source_id, version, source].hash
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
