# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Inventory details.
  class Opsi::Models::SqlInsightThresholds
    # **[Required]** Degradation Percent Threshold is used to derive degrading SQLs.
    #
    # @return [Integer]
    attr_accessor :degradation_in_pct

    # **[Required]** Variability Percent Threshold is used to derive variant SQLs.
    #
    # @return [Float]
    attr_accessor :variability

    # **[Required]** Inefficiency Percent Threshold is used to derive inefficient SQLs.
    #
    # @return [Integer]
    attr_accessor :inefficiency_in_pct

    # **[Required]** PctIncreaseInIO is used for deriving insights for SQLs which are degrading or
    # variant or inefficient. And these SQLs should also have increasing change in IO Time
    # beyond threshold. Insights are derived using linear regression.
    #
    # @return [Integer]
    attr_accessor :increase_in_io_in_pct

    # **[Required]** PctIncreaseInCPU is used for deriving insights for SQLs which are degrading or
    # variant or inefficient. And these SQLs should also have increasing change in CPU Time
    # beyond threshold. Insights are derived using linear regression.
    #
    # @return [Integer]
    attr_accessor :increase_in_cpu_in_pct

    # **[Required]** PctIncreaseInIO is used for deriving insights for SQLs which are degrading or
    # variant or inefficient. And these SQLs should also have increasing change in
    # Other Wait Time beyond threshold. Insights are derived using linear regression.
    #
    # @return [Integer]
    attr_accessor :increase_in_inefficient_wait_in_pct

    # **[Required]** Improved Percent Threshold is used to derive improving SQLs.
    #
    # @return [Integer]
    attr_accessor :improved_in_pct

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'degradation_in_pct': :'degradationInPct',
        'variability': :'variability',
        'inefficiency_in_pct': :'inefficiencyInPct',
        'increase_in_io_in_pct': :'increaseInIOInPct',
        'increase_in_cpu_in_pct': :'increaseInCPUInPct',
        'increase_in_inefficient_wait_in_pct': :'increaseInInefficientWaitInPct',
        'improved_in_pct': :'improvedInPct'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'degradation_in_pct': :'Integer',
        'variability': :'Float',
        'inefficiency_in_pct': :'Integer',
        'increase_in_io_in_pct': :'Integer',
        'increase_in_cpu_in_pct': :'Integer',
        'increase_in_inefficient_wait_in_pct': :'Integer',
        'improved_in_pct': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :degradation_in_pct The value to assign to the {#degradation_in_pct} property
    # @option attributes [Float] :variability The value to assign to the {#variability} property
    # @option attributes [Integer] :inefficiency_in_pct The value to assign to the {#inefficiency_in_pct} property
    # @option attributes [Integer] :increase_in_io_in_pct The value to assign to the {#increase_in_io_in_pct} property
    # @option attributes [Integer] :increase_in_cpu_in_pct The value to assign to the {#increase_in_cpu_in_pct} property
    # @option attributes [Integer] :increase_in_inefficient_wait_in_pct The value to assign to the {#increase_in_inefficient_wait_in_pct} property
    # @option attributes [Integer] :improved_in_pct The value to assign to the {#improved_in_pct} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.degradation_in_pct = attributes[:'degradationInPct'] if attributes[:'degradationInPct']
      self.degradation_in_pct = 20 if degradation_in_pct.nil? && !attributes.key?(:'degradationInPct') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :degradationInPct and :degradation_in_pct' if attributes.key?(:'degradationInPct') && attributes.key?(:'degradation_in_pct')

      self.degradation_in_pct = attributes[:'degradation_in_pct'] if attributes[:'degradation_in_pct']
      self.degradation_in_pct = 20 if degradation_in_pct.nil? && !attributes.key?(:'degradationInPct') && !attributes.key?(:'degradation_in_pct') # rubocop:disable Style/StringLiterals

      self.variability = attributes[:'variability'] if attributes[:'variability']
      self.variability = 1.66 if variability.nil? && !attributes.key?(:'variability') # rubocop:disable Style/StringLiterals

      self.inefficiency_in_pct = attributes[:'inefficiencyInPct'] if attributes[:'inefficiencyInPct']
      self.inefficiency_in_pct = 20 if inefficiency_in_pct.nil? && !attributes.key?(:'inefficiencyInPct') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :inefficiencyInPct and :inefficiency_in_pct' if attributes.key?(:'inefficiencyInPct') && attributes.key?(:'inefficiency_in_pct')

      self.inefficiency_in_pct = attributes[:'inefficiency_in_pct'] if attributes[:'inefficiency_in_pct']
      self.inefficiency_in_pct = 20 if inefficiency_in_pct.nil? && !attributes.key?(:'inefficiencyInPct') && !attributes.key?(:'inefficiency_in_pct') # rubocop:disable Style/StringLiterals

      self.increase_in_io_in_pct = attributes[:'increaseInIOInPct'] if attributes[:'increaseInIOInPct']
      self.increase_in_io_in_pct = 50 if increase_in_io_in_pct.nil? && !attributes.key?(:'increaseInIOInPct') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :increaseInIOInPct and :increase_in_io_in_pct' if attributes.key?(:'increaseInIOInPct') && attributes.key?(:'increase_in_io_in_pct')

      self.increase_in_io_in_pct = attributes[:'increase_in_io_in_pct'] if attributes[:'increase_in_io_in_pct']
      self.increase_in_io_in_pct = 50 if increase_in_io_in_pct.nil? && !attributes.key?(:'increaseInIOInPct') && !attributes.key?(:'increase_in_io_in_pct') # rubocop:disable Style/StringLiterals

      self.increase_in_cpu_in_pct = attributes[:'increaseInCPUInPct'] if attributes[:'increaseInCPUInPct']
      self.increase_in_cpu_in_pct = 50 if increase_in_cpu_in_pct.nil? && !attributes.key?(:'increaseInCPUInPct') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :increaseInCPUInPct and :increase_in_cpu_in_pct' if attributes.key?(:'increaseInCPUInPct') && attributes.key?(:'increase_in_cpu_in_pct')

      self.increase_in_cpu_in_pct = attributes[:'increase_in_cpu_in_pct'] if attributes[:'increase_in_cpu_in_pct']
      self.increase_in_cpu_in_pct = 50 if increase_in_cpu_in_pct.nil? && !attributes.key?(:'increaseInCPUInPct') && !attributes.key?(:'increase_in_cpu_in_pct') # rubocop:disable Style/StringLiterals

      self.increase_in_inefficient_wait_in_pct = attributes[:'increaseInInefficientWaitInPct'] if attributes[:'increaseInInefficientWaitInPct']
      self.increase_in_inefficient_wait_in_pct = 50 if increase_in_inefficient_wait_in_pct.nil? && !attributes.key?(:'increaseInInefficientWaitInPct') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :increaseInInefficientWaitInPct and :increase_in_inefficient_wait_in_pct' if attributes.key?(:'increaseInInefficientWaitInPct') && attributes.key?(:'increase_in_inefficient_wait_in_pct')

      self.increase_in_inefficient_wait_in_pct = attributes[:'increase_in_inefficient_wait_in_pct'] if attributes[:'increase_in_inefficient_wait_in_pct']
      self.increase_in_inefficient_wait_in_pct = 50 if increase_in_inefficient_wait_in_pct.nil? && !attributes.key?(:'increaseInInefficientWaitInPct') && !attributes.key?(:'increase_in_inefficient_wait_in_pct') # rubocop:disable Style/StringLiterals

      self.improved_in_pct = attributes[:'improvedInPct'] if attributes[:'improvedInPct']
      self.improved_in_pct = 20 if improved_in_pct.nil? && !attributes.key?(:'improvedInPct') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :improvedInPct and :improved_in_pct' if attributes.key?(:'improvedInPct') && attributes.key?(:'improved_in_pct')

      self.improved_in_pct = attributes[:'improved_in_pct'] if attributes[:'improved_in_pct']
      self.improved_in_pct = 20 if improved_in_pct.nil? && !attributes.key?(:'improvedInPct') && !attributes.key?(:'improved_in_pct') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        degradation_in_pct == other.degradation_in_pct &&
        variability == other.variability &&
        inefficiency_in_pct == other.inefficiency_in_pct &&
        increase_in_io_in_pct == other.increase_in_io_in_pct &&
        increase_in_cpu_in_pct == other.increase_in_cpu_in_pct &&
        increase_in_inefficient_wait_in_pct == other.increase_in_inefficient_wait_in_pct &&
        improved_in_pct == other.improved_in_pct
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
      [degradation_in_pct, variability, inefficiency_in_pct, increase_in_io_in_pct, increase_in_cpu_in_pct, increase_in_inefficient_wait_in_pct, improved_in_pct].hash
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
