# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Detailed information like statistics, metrics and status for a signal
  class AiAnomalyDetection::Models::PerSignalDetails
    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_DROPPED = 'DROPPED'.freeze,
      STATUS_OTHER = 'OTHER'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of a signal.
    # @return [String]
    attr_accessor :signal_name

    # The ratio of missing values in a signal filled/imputed by the IDP algorithm.
    # @return [Float]
    attr_accessor :mvi_ratio

    # A boolean value to indicate if a signal is quantized or not.
    # @return [BOOLEAN]
    attr_accessor :is_quantized

    # Accuracy metric for a signal.
    # @return [Float]
    attr_accessor :fap

    # **[Required]** Min value within a signal.
    # @return [Float]
    attr_accessor :min

    # **[Required]** Max value within a signal.
    # @return [Float]
    attr_accessor :max

    # **[Required]** Standard deviation of values within a signal.
    # @return [Float]
    attr_accessor :std

    # **[Required]** Status of the signal:
    #  * ACCEPTED - the signal is used for training the model
    #  * DROPPED - the signal does not meet requirement, and is dropped before training the model.
    #  * OTHER - placeholder for other status
    #
    # @return [String]
    attr_reader :status

    # detailed information for a signal.
    # @return [String]
    attr_accessor :details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'signal_name': :'signalName',
        'mvi_ratio': :'mviRatio',
        'is_quantized': :'isQuantized',
        'fap': :'fap',
        'min': :'min',
        'max': :'max',
        'std': :'std',
        'status': :'status',
        'details': :'details'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'signal_name': :'String',
        'mvi_ratio': :'Float',
        'is_quantized': :'BOOLEAN',
        'fap': :'Float',
        'min': :'Float',
        'max': :'Float',
        'std': :'Float',
        'status': :'String',
        'details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :signal_name The value to assign to the {#signal_name} property
    # @option attributes [Float] :mvi_ratio The value to assign to the {#mvi_ratio} property
    # @option attributes [BOOLEAN] :is_quantized The value to assign to the {#is_quantized} property
    # @option attributes [Float] :fap The value to assign to the {#fap} property
    # @option attributes [Float] :min The value to assign to the {#min} property
    # @option attributes [Float] :max The value to assign to the {#max} property
    # @option attributes [Float] :std The value to assign to the {#std} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :details The value to assign to the {#details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.signal_name = attributes[:'signalName'] if attributes[:'signalName']

      raise 'You cannot provide both :signalName and :signal_name' if attributes.key?(:'signalName') && attributes.key?(:'signal_name')

      self.signal_name = attributes[:'signal_name'] if attributes[:'signal_name']

      self.mvi_ratio = attributes[:'mviRatio'] if attributes[:'mviRatio']

      raise 'You cannot provide both :mviRatio and :mvi_ratio' if attributes.key?(:'mviRatio') && attributes.key?(:'mvi_ratio')

      self.mvi_ratio = attributes[:'mvi_ratio'] if attributes[:'mvi_ratio']

      self.is_quantized = attributes[:'isQuantized'] unless attributes[:'isQuantized'].nil?

      raise 'You cannot provide both :isQuantized and :is_quantized' if attributes.key?(:'isQuantized') && attributes.key?(:'is_quantized')

      self.is_quantized = attributes[:'is_quantized'] unless attributes[:'is_quantized'].nil?

      self.fap = attributes[:'fap'] if attributes[:'fap']

      self.min = attributes[:'min'] if attributes[:'min']

      self.max = attributes[:'max'] if attributes[:'max']

      self.std = attributes[:'std'] if attributes[:'std']

      self.status = attributes[:'status'] if attributes[:'status']

      self.details = attributes[:'details'] if attributes[:'details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        signal_name == other.signal_name &&
        mvi_ratio == other.mvi_ratio &&
        is_quantized == other.is_quantized &&
        fap == other.fap &&
        min == other.min &&
        max == other.max &&
        std == other.std &&
        status == other.status &&
        details == other.details
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
      [signal_name, mvi_ratio, is_quantized, fap, min, max, std, status, details].hash
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
