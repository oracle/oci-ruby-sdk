# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration of the sorting and filtering behaviors in a steering policy. Rules can
  # filter and sort answers based on weight, priority, endpoint health, and other data.
  #
  #
  # A rule may optionally include a sequence of cases, each with an optional `caseCondition`
  # expression. Cases allow a sequence of conditions to be defined that will apply different
  # parameters to the rule when the conditions are met. For more information about cases,
  # see [Traffic Management API Guide](https://docs.cloud.oracle.com/iaas/Content/TrafficManagement/Concepts/trafficmanagementapi.htm).
  #
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Dns::Models::SteeringPolicyRule
    RULE_TYPE_ENUM = [
      RULE_TYPE_FILTER = 'FILTER'.freeze,
      RULE_TYPE_HEALTH = 'HEALTH'.freeze,
      RULE_TYPE_WEIGHTED = 'WEIGHTED'.freeze,
      RULE_TYPE_PRIORITY = 'PRIORITY'.freeze,
      RULE_TYPE_LIMIT = 'LIMIT'.freeze,
      RULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # A user-defined description of the rule's purpose or behavior.
    # @return [String]
    attr_accessor :description

    # **[Required]** The type of a rule determines its sorting/filtering behavior.
    # * `FILTER` - Filters the list of answers based on their defined boolean data. Answers remain
    #   only if their `shouldKeep` value is `true`.
    #
    #
    # * `HEALTH` - Removes answers from the list if their `rdata` matches a target in the
    #   health check monitor referenced by the steering policy and the target is reported down.
    #
    #
    # * `WEIGHTED` - Uses a number between 0 and 255 to determine how often an answer will be served
    #   in relation to other answers. Anwers with a higher weight will be served more frequently.
    #
    #
    # * `PRIORITY` - Uses a defined rank value of answers to determine which answer to serve,
    #   moving those with the lowest values to the beginning of the list without changing the
    #   relative order of those with the same value. Answers can be given a value between `0` and `255`.
    #
    #
    # * `LIMIT` - Filters answers that are too far down the list. Parameter `defaultCount`
    #   specifies how many answers to keep. **Example:** If `defaultCount` has a value of `2` and
    #   there are five answers left, when the `LIMIT` rule is processed, only the first two answers
    #   will remain in the list.
    #
    # @return [String]
    attr_reader :rule_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'rule_type': :'ruleType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'rule_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'ruleType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Dns::Models::SteeringPolicyFilterRule' if type == 'FILTER'
      return 'OCI::Dns::Models::SteeringPolicyWeightedRule' if type == 'WEIGHTED'
      return 'OCI::Dns::Models::SteeringPolicyLimitRule' if type == 'LIMIT'
      return 'OCI::Dns::Models::SteeringPolicyHealthRule' if type == 'HEALTH'
      return 'OCI::Dns::Models::SteeringPolicyPriorityRule' if type == 'PRIORITY'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Dns::Models::SteeringPolicyRule'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :rule_type The value to assign to the {#rule_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.rule_type = attributes[:'ruleType'] if attributes[:'ruleType']

      raise 'You cannot provide both :ruleType and :rule_type' if attributes.key?(:'ruleType') && attributes.key?(:'rule_type')

      self.rule_type = attributes[:'rule_type'] if attributes[:'rule_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] rule_type Object to be assigned
    def rule_type=(rule_type)
      # rubocop:disable Style/ConditionalAssignment
      if rule_type && !RULE_TYPE_ENUM.include?(rule_type)
        OCI.logger.debug("Unknown value for 'rule_type' [" + rule_type + "]. Mapping to 'RULE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @rule_type = RULE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @rule_type = rule_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        rule_type == other.rule_type
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
      [description, rule_type].hash
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
