# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An alarm history entry indicating a description of the entry and the time that the entry occurred.
  # If the entry corresponds to a state transition, such as OK to Firing, then the entry also includes a transition timestamp.
  #
  class Monitoring::Models::AlarmHistoryEntry
    # **[Required]** Description for this alarm history entry. Avoid entering confidential information.
    #
    # Example 1 - alarm state history entry: `The alarm state is FIRING`
    #
    # Example 2 - alarm state transition history entry: `State transitioned from OK to Firing`
    #
    # @return [String]
    attr_accessor :summary

    # **[Required]** Timestamp for this alarm history entry. Format defined by RFC3339.
    #
    # Example: `2019-02-01T01:02:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :timestamp

    # Timestamp for the transition of the alarm state. For example, the time when the alarm transitioned from OK to Firing.
    # Available for state transition entries only. Note: A three-minute lag for this value accounts for any late-arriving metrics.
    #
    # Example: `2019-02-01T0:59:00.789Z`
    #
    # @return [DateTime]
    attr_accessor :timestamp_triggered

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'summary': :'summary',
        'timestamp': :'timestamp',
        'timestamp_triggered': :'timestampTriggered'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'summary': :'String',
        'timestamp': :'DateTime',
        'timestamp_triggered': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :summary The value to assign to the {#summary} property
    # @option attributes [DateTime] :timestamp The value to assign to the {#timestamp} property
    # @option attributes [DateTime] :timestamp_triggered The value to assign to the {#timestamp_triggered} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.summary = attributes[:'summary'] if attributes[:'summary']

      self.timestamp = attributes[:'timestamp'] if attributes[:'timestamp']

      self.timestamp_triggered = attributes[:'timestampTriggered'] if attributes[:'timestampTriggered']

      raise 'You cannot provide both :timestampTriggered and :timestamp_triggered' if attributes.key?(:'timestampTriggered') && attributes.key?(:'timestamp_triggered')

      self.timestamp_triggered = attributes[:'timestamp_triggered'] if attributes[:'timestamp_triggered']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        summary == other.summary &&
        timestamp == other.timestamp &&
        timestamp_triggered == other.timestamp_triggered
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
      [summary, timestamp, timestamp_triggered].hash
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
