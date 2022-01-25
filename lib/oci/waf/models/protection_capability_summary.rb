# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of available OCI-managed protection capabilities in WebAppFirewallPolicy.
  # Protection capabilies checks HTTP requests/responses if they are malicious.
  #
  class Waf::Models::ProtectionCapabilitySummary
    TYPE_ENUM = [
      TYPE_REQUEST_PROTECTION_CAPABILITY = 'REQUEST_PROTECTION_CAPABILITY'.freeze,
      TYPE_RESPONSE_PROTECTION_CAPABILITY = 'RESPONSE_PROTECTION_CAPABILITY'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique key of protection capability.
    # @return [String]
    attr_accessor :key

    # **[Required]** The display name of protection capability.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The description of protection capability.
    # @return [String]
    attr_accessor :description

    # **[Required]** The version of protection capability.
    # @return [Integer]
    attr_accessor :version

    # **[Required]** The field that shows if this is the latest version of protection capability.
    # @return [BOOLEAN]
    attr_accessor :is_latest_version

    # The list of unique names protection capability group tags that are associated with this capability.
    # Example: [\"PCI\", \"Recommended\"]
    #
    # @return [Array<String>]
    attr_accessor :group_tags

    # **[Required]** The type of protection capability.
    #
    # * **REQUEST_PROTECTION_CAPABILITY** can only be used in `requestProtection` module of WebAppFirewallPolicy.
    #
    # * **RESPONSE_PROTECTION_CAPABILITY** can only be used in `responseProtection` module of WebAppFirewallPolicy.
    #
    # @return [String]
    attr_reader :type

    # The default collaborative action threshold for OCI-managed collaborative protection capability.
    # Collaborative protection capabilities are made of several simple, non-collaborative protection capabilities
    # (referred to as `contributing capabilities` later on) which have weights assigned to them. These weights can
    # be found in the `collaborativeWeights` array.
    # For incoming/outgoing HTTP messages, all contributing capabilities are executed and the sum of all triggered
    # contributing capabilities weights is calculated. Only if this sum is greater than or equal to
    # `collaborativeActionThreshold` is the incoming/outgoing HTTP message marked as malicious.
    #
    # This field is ignored for non-collaborative capabilities.
    #
    # @return [Integer]
    attr_accessor :collaborative_action_threshold

    # The weights of contributing capabilities.
    # Defines how much each contributing capability contributes towards the action threshold of a collaborative protection capability.
    #
    # This field is ignored for non-collaborative capabilities.
    #
    # @return [Array<OCI::Waf::Models::CollaborativeCapabilityWeight>]
    attr_accessor :collaborative_weights

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'description': :'description',
        'version': :'version',
        'is_latest_version': :'isLatestVersion',
        'group_tags': :'groupTags',
        'type': :'type',
        'collaborative_action_threshold': :'collaborativeActionThreshold',
        'collaborative_weights': :'collaborativeWeights'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'display_name': :'String',
        'description': :'String',
        'version': :'Integer',
        'is_latest_version': :'BOOLEAN',
        'group_tags': :'Array<String>',
        'type': :'String',
        'collaborative_action_threshold': :'Integer',
        'collaborative_weights': :'Array<OCI::Waf::Models::CollaborativeCapabilityWeight>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :version The value to assign to the {#version} property
    # @option attributes [BOOLEAN] :is_latest_version The value to assign to the {#is_latest_version} property
    # @option attributes [Array<String>] :group_tags The value to assign to the {#group_tags} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Integer] :collaborative_action_threshold The value to assign to the {#collaborative_action_threshold} property
    # @option attributes [Array<OCI::Waf::Models::CollaborativeCapabilityWeight>] :collaborative_weights The value to assign to the {#collaborative_weights} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.version = attributes[:'version'] if attributes[:'version']

      self.is_latest_version = attributes[:'isLatestVersion'] unless attributes[:'isLatestVersion'].nil?

      raise 'You cannot provide both :isLatestVersion and :is_latest_version' if attributes.key?(:'isLatestVersion') && attributes.key?(:'is_latest_version')

      self.is_latest_version = attributes[:'is_latest_version'] unless attributes[:'is_latest_version'].nil?

      self.group_tags = attributes[:'groupTags'] if attributes[:'groupTags']

      raise 'You cannot provide both :groupTags and :group_tags' if attributes.key?(:'groupTags') && attributes.key?(:'group_tags')

      self.group_tags = attributes[:'group_tags'] if attributes[:'group_tags']

      self.type = attributes[:'type'] if attributes[:'type']

      self.collaborative_action_threshold = attributes[:'collaborativeActionThreshold'] if attributes[:'collaborativeActionThreshold']

      raise 'You cannot provide both :collaborativeActionThreshold and :collaborative_action_threshold' if attributes.key?(:'collaborativeActionThreshold') && attributes.key?(:'collaborative_action_threshold')

      self.collaborative_action_threshold = attributes[:'collaborative_action_threshold'] if attributes[:'collaborative_action_threshold']

      self.collaborative_weights = attributes[:'collaborativeWeights'] if attributes[:'collaborativeWeights']

      raise 'You cannot provide both :collaborativeWeights and :collaborative_weights' if attributes.key?(:'collaborativeWeights') && attributes.key?(:'collaborative_weights')

      self.collaborative_weights = attributes[:'collaborative_weights'] if attributes[:'collaborative_weights']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        display_name == other.display_name &&
        description == other.description &&
        version == other.version &&
        is_latest_version == other.is_latest_version &&
        group_tags == other.group_tags &&
        type == other.type &&
        collaborative_action_threshold == other.collaborative_action_threshold &&
        collaborative_weights == other.collaborative_weights
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
      [key, display_name, description, version, is_latest_version, group_tags, type, collaborative_action_threshold, collaborative_weights].hash
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
