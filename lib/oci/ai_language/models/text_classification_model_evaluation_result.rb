# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20221001
require 'date'
require_relative 'evaluation_result_summary'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Possible TXTC model error analysis
  class AiLanguage::Models::TextClassificationModelEvaluationResult < AiLanguage::Models::EvaluationResultSummary
    # **[Required]** For CSV format location is rowId(1 is header) and for JSONL location is jsonL line sequence(1 is metadata)
    # @return [String]
    attr_accessor :location

    # **[Required]** List of true(actual) labels in test data for multi class or multi label TextClassification
    # @return [Array<String>]
    attr_accessor :true_labels

    # List of predicted labels by custom multi class or multi label TextClassification model
    # @return [Array<String>]
    attr_accessor :predicted_labels

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'location': :'location',
        'true_labels': :'trueLabels',
        'predicted_labels': :'predictedLabels'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'location': :'String',
        'true_labels': :'Array<String>',
        'predicted_labels': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::AiLanguage::Models::EvaluationResultSummary#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::AiLanguage::Models::EvaluationResultSummary#defined_tags #defined_tags} proprety
    # @option attributes [String] :location The value to assign to the {#location} property
    # @option attributes [Array<String>] :true_labels The value to assign to the {#true_labels} property
    # @option attributes [Array<String>] :predicted_labels The value to assign to the {#predicted_labels} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'TEXT_CLASSIFICATION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.location = attributes[:'location'] if attributes[:'location']

      self.true_labels = attributes[:'trueLabels'] if attributes[:'trueLabels']

      raise 'You cannot provide both :trueLabels and :true_labels' if attributes.key?(:'trueLabels') && attributes.key?(:'true_labels')

      self.true_labels = attributes[:'true_labels'] if attributes[:'true_labels']

      self.predicted_labels = attributes[:'predictedLabels'] if attributes[:'predictedLabels']

      raise 'You cannot provide both :predictedLabels and :predicted_labels' if attributes.key?(:'predictedLabels') && attributes.key?(:'predicted_labels')

      self.predicted_labels = attributes[:'predicted_labels'] if attributes[:'predicted_labels']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        location == other.location &&
        true_labels == other.true_labels &&
        predicted_labels == other.predicted_labels
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
      [model_type, freeform_tags, defined_tags, location, true_labels, predicted_labels].hash
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