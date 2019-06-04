# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Represents the state of a single partition reservation.
  #
  class Streaming::Models::PartitionReservation
    # The partition for which the reservation applies.
    # @return [String]
    attr_accessor :partition

    # The latest offset which has been committed for this partition.
    # @return [Integer]
    attr_accessor :committed_offset

    # The consumer instance which currently has the partition reserved.
    # @return [String]
    attr_accessor :reserved_instance

    # A timestamp when the current reservation expires.
    # @return [DateTime]
    attr_accessor :time_reserved_until

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'partition': :'partition',
        'committed_offset': :'committedOffset',
        'reserved_instance': :'reservedInstance',
        'time_reserved_until': :'timeReservedUntil'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'partition': :'String',
        'committed_offset': :'Integer',
        'reserved_instance': :'String',
        'time_reserved_until': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :partition The value to assign to the {#partition} property
    # @option attributes [Integer] :committed_offset The value to assign to the {#committed_offset} property
    # @option attributes [String] :reserved_instance The value to assign to the {#reserved_instance} property
    # @option attributes [DateTime] :time_reserved_until The value to assign to the {#time_reserved_until} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.partition = attributes[:'partition'] if attributes[:'partition']

      self.committed_offset = attributes[:'committedOffset'] if attributes[:'committedOffset']

      raise 'You cannot provide both :committedOffset and :committed_offset' if attributes.key?(:'committedOffset') && attributes.key?(:'committed_offset')

      self.committed_offset = attributes[:'committed_offset'] if attributes[:'committed_offset']

      self.reserved_instance = attributes[:'reservedInstance'] if attributes[:'reservedInstance']

      raise 'You cannot provide both :reservedInstance and :reserved_instance' if attributes.key?(:'reservedInstance') && attributes.key?(:'reserved_instance')

      self.reserved_instance = attributes[:'reserved_instance'] if attributes[:'reserved_instance']

      self.time_reserved_until = attributes[:'timeReservedUntil'] if attributes[:'timeReservedUntil']

      raise 'You cannot provide both :timeReservedUntil and :time_reserved_until' if attributes.key?(:'timeReservedUntil') && attributes.key?(:'time_reserved_until')

      self.time_reserved_until = attributes[:'time_reserved_until'] if attributes[:'time_reserved_until']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        partition == other.partition &&
        committed_offset == other.committed_offset &&
        reserved_instance == other.reserved_instance &&
        time_reserved_until == other.time_reserved_until
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
      [partition, committed_offset, reserved_instance, time_reserved_until].hash
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
