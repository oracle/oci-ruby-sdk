# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the details for an Anomaly Detection model trained with MSET.
  class AiAnomalyDetection::Models::ModelTrainingResults
    # **[Required]** The final-achieved model accuracy metric on individual value level
    # @return [Float]
    attr_accessor :fap

    # The model accuracy metric on timestamp level.
    # @return [Float]
    attr_accessor :multivariate_fap

    # A boolean value to indicate if train goal/targetFap is achieved for trained model
    # @return [BOOLEAN]
    attr_accessor :is_training_goal_achieved

    # A warning message to explain the reason when targetFap cannot be achieved for trained model
    # @return [String]
    attr_accessor :warning

    # The list of signal details.
    # @return [Array<OCI::AiAnomalyDetection::Models::PerSignalDetails>]
    attr_accessor :signal_details

    # @return [OCI::AiAnomalyDetection::Models::RowReductionDetails]
    attr_accessor :row_reduction_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'fap': :'fap',
        'multivariate_fap': :'multivariateFap',
        'is_training_goal_achieved': :'isTrainingGoalAchieved',
        'warning': :'warning',
        'signal_details': :'signalDetails',
        'row_reduction_details': :'rowReductionDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'fap': :'Float',
        'multivariate_fap': :'Float',
        'is_training_goal_achieved': :'BOOLEAN',
        'warning': :'String',
        'signal_details': :'Array<OCI::AiAnomalyDetection::Models::PerSignalDetails>',
        'row_reduction_details': :'OCI::AiAnomalyDetection::Models::RowReductionDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :fap The value to assign to the {#fap} property
    # @option attributes [Float] :multivariate_fap The value to assign to the {#multivariate_fap} property
    # @option attributes [BOOLEAN] :is_training_goal_achieved The value to assign to the {#is_training_goal_achieved} property
    # @option attributes [String] :warning The value to assign to the {#warning} property
    # @option attributes [Array<OCI::AiAnomalyDetection::Models::PerSignalDetails>] :signal_details The value to assign to the {#signal_details} property
    # @option attributes [OCI::AiAnomalyDetection::Models::RowReductionDetails] :row_reduction_details The value to assign to the {#row_reduction_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.fap = attributes[:'fap'] if attributes[:'fap']

      self.multivariate_fap = attributes[:'multivariateFap'] if attributes[:'multivariateFap']

      raise 'You cannot provide both :multivariateFap and :multivariate_fap' if attributes.key?(:'multivariateFap') && attributes.key?(:'multivariate_fap')

      self.multivariate_fap = attributes[:'multivariate_fap'] if attributes[:'multivariate_fap']

      self.is_training_goal_achieved = attributes[:'isTrainingGoalAchieved'] unless attributes[:'isTrainingGoalAchieved'].nil?

      raise 'You cannot provide both :isTrainingGoalAchieved and :is_training_goal_achieved' if attributes.key?(:'isTrainingGoalAchieved') && attributes.key?(:'is_training_goal_achieved')

      self.is_training_goal_achieved = attributes[:'is_training_goal_achieved'] unless attributes[:'is_training_goal_achieved'].nil?

      self.warning = attributes[:'warning'] if attributes[:'warning']

      self.signal_details = attributes[:'signalDetails'] if attributes[:'signalDetails']

      raise 'You cannot provide both :signalDetails and :signal_details' if attributes.key?(:'signalDetails') && attributes.key?(:'signal_details')

      self.signal_details = attributes[:'signal_details'] if attributes[:'signal_details']

      self.row_reduction_details = attributes[:'rowReductionDetails'] if attributes[:'rowReductionDetails']

      raise 'You cannot provide both :rowReductionDetails and :row_reduction_details' if attributes.key?(:'rowReductionDetails') && attributes.key?(:'row_reduction_details')

      self.row_reduction_details = attributes[:'row_reduction_details'] if attributes[:'row_reduction_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        fap == other.fap &&
        multivariate_fap == other.multivariate_fap &&
        is_training_goal_achieved == other.is_training_goal_achieved &&
        warning == other.warning &&
        signal_details == other.signal_details &&
        row_reduction_details == other.row_reduction_details
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
      [fap, multivariate_fap, is_training_goal_achieved, warning, signal_details, row_reduction_details].hash
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
