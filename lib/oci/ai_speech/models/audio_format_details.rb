# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Audio format details.
  class AiSpeech::Models::AudioFormatDetails
    # Input file format. Example - WAV.
    # @return [String]
    attr_accessor :format

    # Input file number of channels.
    # @return [Integer]
    attr_accessor :number_of_channels

    # Input file encoding. Example - PCM.
    # @return [String]
    attr_accessor :encoding

    # Input file sampleRate. Example - 16000
    # @return [Integer]
    attr_accessor :sample_rate_in_hz

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'format': :'format',
        'number_of_channels': :'numberOfChannels',
        'encoding': :'encoding',
        'sample_rate_in_hz': :'sampleRateInHz'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'format': :'String',
        'number_of_channels': :'Integer',
        'encoding': :'String',
        'sample_rate_in_hz': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :format The value to assign to the {#format} property
    # @option attributes [Integer] :number_of_channels The value to assign to the {#number_of_channels} property
    # @option attributes [String] :encoding The value to assign to the {#encoding} property
    # @option attributes [Integer] :sample_rate_in_hz The value to assign to the {#sample_rate_in_hz} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.format = attributes[:'format'] if attributes[:'format']

      self.number_of_channels = attributes[:'numberOfChannels'] if attributes[:'numberOfChannels']

      raise 'You cannot provide both :numberOfChannels and :number_of_channels' if attributes.key?(:'numberOfChannels') && attributes.key?(:'number_of_channels')

      self.number_of_channels = attributes[:'number_of_channels'] if attributes[:'number_of_channels']

      self.encoding = attributes[:'encoding'] if attributes[:'encoding']

      self.sample_rate_in_hz = attributes[:'sampleRateInHz'] if attributes[:'sampleRateInHz']

      raise 'You cannot provide both :sampleRateInHz and :sample_rate_in_hz' if attributes.key?(:'sampleRateInHz') && attributes.key?(:'sample_rate_in_hz')

      self.sample_rate_in_hz = attributes[:'sample_rate_in_hz'] if attributes[:'sample_rate_in_hz']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        format == other.format &&
        number_of_channels == other.number_of_channels &&
        encoding == other.encoding &&
        sample_rate_in_hz == other.sample_rate_in_hz
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
      [format, number_of_channels, encoding, sample_rate_in_hz].hash
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
