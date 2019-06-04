# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The protection rule settings. Protection rules can allow, block, or trigger an alert if a request meets the parameters of an applied rule.
  class Waas::Models::ProtectionRule
    ACTION_ENUM = [
      ACTION_OFF = 'OFF'.freeze,
      ACTION_DETECT = 'DETECT'.freeze,
      ACTION_BLOCK = 'BLOCK'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The unique key of the protection rule.
    # @return [String]
    attr_accessor :key

    # The list of the ModSecurity rule IDs that apply to this protection rule. For more information about ModSecurity's open source WAF rules, see [Mod Security's documentation](https://www.modsecurity.org/CRS/Documentation/index.html).
    # @return [Array<String>]
    attr_accessor :mod_security_rule_ids

    # The name of the protection rule.
    # @return [String]
    attr_accessor :name

    # The description of the protection rule.
    # @return [String]
    attr_accessor :description

    # The action to take when the traffic is detected as malicious. If unspecified, defaults to `OFF`.
    # @return [String]
    attr_reader :action

    # The list of labels for the protection rule.
    #
    # **Note:** Protection rules with a `ResponseBody` label will have no effect unless `isResponseInspected` is true.
    # @return [Array<String>]
    attr_accessor :labels

    # @return [Array<OCI::Waas::Models::ProtectionRuleExclusion>]
    attr_accessor :exclusions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'mod_security_rule_ids': :'modSecurityRuleIds',
        'name': :'name',
        'description': :'description',
        'action': :'action',
        'labels': :'labels',
        'exclusions': :'exclusions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'mod_security_rule_ids': :'Array<String>',
        'name': :'String',
        'description': :'String',
        'action': :'String',
        'labels': :'Array<String>',
        'exclusions': :'Array<OCI::Waas::Models::ProtectionRuleExclusion>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [Array<String>] :mod_security_rule_ids The value to assign to the {#mod_security_rule_ids} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [Array<String>] :labels The value to assign to the {#labels} property
    # @option attributes [Array<OCI::Waas::Models::ProtectionRuleExclusion>] :exclusions The value to assign to the {#exclusions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.mod_security_rule_ids = attributes[:'modSecurityRuleIds'] if attributes[:'modSecurityRuleIds']

      raise 'You cannot provide both :modSecurityRuleIds and :mod_security_rule_ids' if attributes.key?(:'modSecurityRuleIds') && attributes.key?(:'mod_security_rule_ids')

      self.mod_security_rule_ids = attributes[:'mod_security_rule_ids'] if attributes[:'mod_security_rule_ids']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.action = attributes[:'action'] if attributes[:'action']

      self.labels = attributes[:'labels'] if attributes[:'labels']

      self.exclusions = attributes[:'exclusions'] if attributes[:'exclusions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
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
        mod_security_rule_ids == other.mod_security_rule_ids &&
        name == other.name &&
        description == other.description &&
        action == other.action &&
        labels == other.labels &&
        exclusions == other.exclusions
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
      [key, mod_security_rule_ids, name, description, action, labels, exclusions].hash
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
