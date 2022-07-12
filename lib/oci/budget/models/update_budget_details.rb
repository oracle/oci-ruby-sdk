# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The update budget details.
  class Budget::Models::UpdateBudgetDetails
    PROCESSING_PERIOD_TYPE_ENUM = [
      PROCESSING_PERIOD_TYPE_INVOICE = 'INVOICE'.freeze,
      PROCESSING_PERIOD_TYPE_MONTH = 'MONTH'.freeze
    ].freeze

    RESET_PERIOD_ENUM = [
      RESET_PERIOD_MONTHLY = 'MONTHLY'.freeze
    ].freeze

    # The displayName of the budget. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # The description of the budget.
    # @return [String]
    attr_accessor :description

    # The amount of the budget expressed as a whole number in the currency of the customer's rate card.
    #
    # @return [Float]
    attr_accessor :amount

    # The number of days offset from the first day of the month, at which the budget processing period starts. In months that have fewer days than this value, processing will begin on the last day of that month. For example, for a value of 12, processing starts every month on the 12th at midnight.
    # @return [Integer]
    attr_accessor :budget_processing_period_start_offset

    # The type of the budget processing period. Valid values are INVOICE and MONTH.
    #
    # @return [String]
    attr_reader :processing_period_type

    # The reset period for the budget.
    #
    # @return [String]
    attr_reader :reset_period

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'amount': :'amount',
        'budget_processing_period_start_offset': :'budgetProcessingPeriodStartOffset',
        'processing_period_type': :'processingPeriodType',
        'reset_period': :'resetPeriod',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'amount': :'Float',
        'budget_processing_period_start_offset': :'Integer',
        'processing_period_type': :'String',
        'reset_period': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Float] :amount The value to assign to the {#amount} property
    # @option attributes [Integer] :budget_processing_period_start_offset The value to assign to the {#budget_processing_period_start_offset} property
    # @option attributes [String] :processing_period_type The value to assign to the {#processing_period_type} property
    # @option attributes [String] :reset_period The value to assign to the {#reset_period} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.amount = attributes[:'amount'] if attributes[:'amount']

      self.budget_processing_period_start_offset = attributes[:'budgetProcessingPeriodStartOffset'] if attributes[:'budgetProcessingPeriodStartOffset']

      raise 'You cannot provide both :budgetProcessingPeriodStartOffset and :budget_processing_period_start_offset' if attributes.key?(:'budgetProcessingPeriodStartOffset') && attributes.key?(:'budget_processing_period_start_offset')

      self.budget_processing_period_start_offset = attributes[:'budget_processing_period_start_offset'] if attributes[:'budget_processing_period_start_offset']

      self.processing_period_type = attributes[:'processingPeriodType'] if attributes[:'processingPeriodType']

      raise 'You cannot provide both :processingPeriodType and :processing_period_type' if attributes.key?(:'processingPeriodType') && attributes.key?(:'processing_period_type')

      self.processing_period_type = attributes[:'processing_period_type'] if attributes[:'processing_period_type']

      self.reset_period = attributes[:'resetPeriod'] if attributes[:'resetPeriod']

      raise 'You cannot provide both :resetPeriod and :reset_period' if attributes.key?(:'resetPeriod') && attributes.key?(:'reset_period')

      self.reset_period = attributes[:'reset_period'] if attributes[:'reset_period']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] processing_period_type Object to be assigned
    def processing_period_type=(processing_period_type)
      raise "Invalid value for 'processing_period_type': this must be one of the values in PROCESSING_PERIOD_TYPE_ENUM." if processing_period_type && !PROCESSING_PERIOD_TYPE_ENUM.include?(processing_period_type)

      @processing_period_type = processing_period_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reset_period Object to be assigned
    def reset_period=(reset_period)
      raise "Invalid value for 'reset_period': this must be one of the values in RESET_PERIOD_ENUM." if reset_period && !RESET_PERIOD_ENUM.include?(reset_period)

      @reset_period = reset_period
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        description == other.description &&
        amount == other.amount &&
        budget_processing_period_start_offset == other.budget_processing_period_start_offset &&
        processing_period_type == other.processing_period_type &&
        reset_period == other.reset_period &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [display_name, description, amount, budget_processing_period_start_offset, processing_period_type, reset_period, freeform_tags, defined_tags].hash
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
