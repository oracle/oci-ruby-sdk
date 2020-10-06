# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'schedule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Fixed frequency schedule for a scheduled task.
  class LogAnalytics::Models::FixedFrequencySchedule < LogAnalytics::Models::Schedule
    # **[Required]** Recurring interval in ISO 8601 extended format as described in
    # https://en.wikipedia.org/wiki/ISO_8601#Durations.
    # The largest supported unit is D, e.g. P14D (not P2W).
    # The value must be at least 5 minutes (PT5M) and at most 3 weeks (P21D or PT30240M).
    #
    # @return [String]
    attr_accessor :recurring_interval

    # Number of times (0-based) to execute until auto-stop.
    # Default value -1 will execute indefinitely.
    # Value 0 will execute once.
    #
    # @return [Integer]
    attr_accessor :repeat_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'misfire_policy': :'misfirePolicy',
        'recurring_interval': :'recurringInterval',
        'repeat_count': :'repeatCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'misfire_policy': :'String',
        'recurring_interval': :'String',
        'repeat_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :misfire_policy The value to assign to the {OCI::LogAnalytics::Models::Schedule#misfire_policy #misfire_policy} proprety
    # @option attributes [String] :recurring_interval The value to assign to the {#recurring_interval} property
    # @option attributes [Integer] :repeat_count The value to assign to the {#repeat_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'FIXED_FREQUENCY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.recurring_interval = attributes[:'recurringInterval'] if attributes[:'recurringInterval']

      raise 'You cannot provide both :recurringInterval and :recurring_interval' if attributes.key?(:'recurringInterval') && attributes.key?(:'recurring_interval')

      self.recurring_interval = attributes[:'recurring_interval'] if attributes[:'recurring_interval']

      self.repeat_count = attributes[:'repeatCount'] if attributes[:'repeatCount']
      self.repeat_count = -1 if repeat_count.nil? && !attributes.key?(:'repeatCount') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :repeatCount and :repeat_count' if attributes.key?(:'repeatCount') && attributes.key?(:'repeat_count')

      self.repeat_count = attributes[:'repeat_count'] if attributes[:'repeat_count']
      self.repeat_count = -1 if repeat_count.nil? && !attributes.key?(:'repeatCount') && !attributes.key?(:'repeat_count') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        misfire_policy == other.misfire_policy &&
        recurring_interval == other.recurring_interval &&
        repeat_count == other.repeat_count
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
      [type, misfire_policy, recurring_interval, repeat_count].hash
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
