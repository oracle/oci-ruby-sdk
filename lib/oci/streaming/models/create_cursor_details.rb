# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Object used to create a cursor to consume messages in a stream.
  class Streaming::Models::CreateCursorDetails
    TYPE_ENUM = [
      TYPE_AFTER_OFFSET = 'AFTER_OFFSET'.freeze,
      TYPE_AT_OFFSET = 'AT_OFFSET'.freeze,
      TYPE_AT_TIME = 'AT_TIME'.freeze,
      TYPE_LATEST = 'LATEST'.freeze,
      TYPE_TRIM_HORIZON = 'TRIM_HORIZON'.freeze
    ].freeze

    # **[Required]** The partition to get messages from.
    # @return [String]
    attr_accessor :partition

    # **[Required]** The type of cursor, which determines the starting point from which the stream will be consumed:
    #
    # - `AFTER_OFFSET:` The partition position immediately following the offset you specify. (Offsets are assigned when you successfully append a message to a partition in a stream.)
    # - `AT_OFFSET:` The exact partition position indicated by the offset you specify.
    # - `AT_TIME:` A specific point in time.
    # - `LATEST:` The most recent message in the partition that was added after the cursor was created.
    # - `TRIM_HORIZON:` The oldest message in the partition that is within the retention period window.
    #
    # @return [String]
    attr_reader :type

    # The offset to consume from if the cursor type is `AT_OFFSET` or `AFTER_OFFSET`.
    # @return [Integer]
    attr_accessor :offset

    # The time to consume from if the cursor type is `AT_TIME`, expressed in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'partition': :'partition',
        'type': :'type',
        'offset': :'offset',
        'time': :'time'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'partition': :'String',
        'type': :'String',
        'offset': :'Integer',
        'time': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :partition The value to assign to the {#partition} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Integer] :offset The value to assign to the {#offset} property
    # @option attributes [DateTime] :time The value to assign to the {#time} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.partition = attributes[:'partition'] if attributes[:'partition']

      self.type = attributes[:'type'] if attributes[:'type']

      self.offset = attributes[:'offset'] if attributes[:'offset']

      self.time = attributes[:'time'] if attributes[:'time']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        partition == other.partition &&
        type == other.type &&
        offset == other.offset &&
        time == other.time
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
      [partition, type, offset, time].hash
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
