# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20221109
require 'date'
require_relative 'model_metrics'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metrics for Document Key Value Detection Model.
  class AiDocument::Models::KeyValueDetectionModelMetrics < AiDocument::Models::ModelMetrics
    # **[Required]** List of metrics entries per label.
    # @return [Array<OCI::AiDocument::Models::KeyValueDetectionLabelMetricsReport>]
    attr_accessor :label_metrics_report

    # This attribute is required.
    # @return [OCI::AiDocument::Models::KeyValueDetectionOverallMetricsReport]
    attr_accessor :overall_metrics_report

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'dataset_summary': :'datasetSummary',
        'label_metrics_report': :'labelMetricsReport',
        'overall_metrics_report': :'overallMetricsReport'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'dataset_summary': :'OCI::AiDocument::Models::DatasetSummary',
        'label_metrics_report': :'Array<OCI::AiDocument::Models::KeyValueDetectionLabelMetricsReport>',
        'overall_metrics_report': :'OCI::AiDocument::Models::KeyValueDetectionOverallMetricsReport'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::AiDocument::Models::DatasetSummary] :dataset_summary The value to assign to the {OCI::AiDocument::Models::ModelMetrics#dataset_summary #dataset_summary} proprety
    # @option attributes [Array<OCI::AiDocument::Models::KeyValueDetectionLabelMetricsReport>] :label_metrics_report The value to assign to the {#label_metrics_report} property
    # @option attributes [OCI::AiDocument::Models::KeyValueDetectionOverallMetricsReport] :overall_metrics_report The value to assign to the {#overall_metrics_report} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'KEY_VALUE_EXTRACTION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.label_metrics_report = attributes[:'labelMetricsReport'] if attributes[:'labelMetricsReport']

      raise 'You cannot provide both :labelMetricsReport and :label_metrics_report' if attributes.key?(:'labelMetricsReport') && attributes.key?(:'label_metrics_report')

      self.label_metrics_report = attributes[:'label_metrics_report'] if attributes[:'label_metrics_report']

      self.overall_metrics_report = attributes[:'overallMetricsReport'] if attributes[:'overallMetricsReport']

      raise 'You cannot provide both :overallMetricsReport and :overall_metrics_report' if attributes.key?(:'overallMetricsReport') && attributes.key?(:'overall_metrics_report')

      self.overall_metrics_report = attributes[:'overall_metrics_report'] if attributes[:'overall_metrics_report']
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
        dataset_summary == other.dataset_summary &&
        label_metrics_report == other.label_metrics_report &&
        overall_metrics_report == other.overall_metrics_report
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
      [model_type, dataset_summary, label_metrics_report, overall_metrics_report].hash
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
