# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'steering_policy_rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SteeringPolicyLimitRule model.
  class Dns::Models::SteeringPolicyLimitRule < Dns::Models::SteeringPolicyRule
    # An array of `caseConditions`. A rule may optionally include a sequence of cases defining alternate
    # configurations for how it should behave during processing for any given DNS query. When a rule has
    # no sequence of `cases`, it is always evaluated with the same configuration during processing. When
    # a rule has an empty sequence of `cases`, it is always ignored during processing. When a rule has a
    # non-empty sequence of `cases`, its behavior during processing is configured by the first matching
    # `case` in the sequence. When a rule has no matching cases the rule is ignored. A rule case with no
    # `caseCondition` always matches. A rule case with a `caseCondition` matches only when that expression
    # evaluates to true for the given query.
    #
    # @return [Array<OCI::Dns::Models::SteeringPolicyLimitRuleCase>]
    attr_accessor :cases

    # Defines a default count if `cases` is not defined for the rule or a matching case does
    # not define `count`. `defaultCount` is **not** applied if `cases` is defined and there
    # are no matching cases. In this scenario, the next rule will be processed. If no rules
    # remain to be processed, the answer will be chosen from the remaining list of answers.
    #
    # @return [Integer]
    attr_accessor :default_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'rule_type': :'ruleType',
        'cases': :'cases',
        'default_count': :'defaultCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'rule_type': :'String',
        'cases': :'Array<OCI::Dns::Models::SteeringPolicyLimitRuleCase>',
        'default_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {OCI::Dns::Models::SteeringPolicyRule#description #description} proprety
    # @option attributes [Array<OCI::Dns::Models::SteeringPolicyLimitRuleCase>] :cases The value to assign to the {#cases} property
    # @option attributes [Integer] :default_count The value to assign to the {#default_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['ruleType'] = 'LIMIT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cases = attributes[:'cases'] if attributes[:'cases']

      self.default_count = attributes[:'defaultCount'] if attributes[:'defaultCount']
      self.default_count = 65535 if default_count.nil? && !attributes.key?(:'defaultCount') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :defaultCount and :default_count' if attributes.key?(:'defaultCount') && attributes.key?(:'default_count')

      self.default_count = attributes[:'default_count'] if attributes[:'default_count']
      self.default_count = 65535 if default_count.nil? && !attributes.key?(:'defaultCount') && !attributes.key?(:'default_count') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        rule_type == other.rule_type &&
        cases == other.cases &&
        default_count == other.default_count
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
      [description, rule_type, cases, default_count].hash
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
