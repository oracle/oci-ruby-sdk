# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the details of the MSET model during the create call.
  class AiAnomalyDetection::Models::ModelTrainingDetails
    # A target model accuracy metric user provides as their requirement
    # @return [Float]
    attr_accessor :target_fap

    # Fraction of total data that is used for training the model. The remaining is used for validation of the model.
    # @return [Float]
    attr_accessor :training_fraction

    # **[Required]** The list of OCIDs of the data assets to train the model. The dataAssets have to be in the same project where the ai model would reside.
    # @return [Array<String>]
    attr_accessor :data_asset_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_fap': :'targetFap',
        'training_fraction': :'trainingFraction',
        'data_asset_ids': :'dataAssetIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_fap': :'Float',
        'training_fraction': :'Float',
        'data_asset_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :target_fap The value to assign to the {#target_fap} property
    # @option attributes [Float] :training_fraction The value to assign to the {#training_fraction} property
    # @option attributes [Array<String>] :data_asset_ids The value to assign to the {#data_asset_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.target_fap = attributes[:'targetFap'] if attributes[:'targetFap']
      self.target_fap = 0.01 if target_fap.nil? && !attributes.key?(:'targetFap') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :targetFap and :target_fap' if attributes.key?(:'targetFap') && attributes.key?(:'target_fap')

      self.target_fap = attributes[:'target_fap'] if attributes[:'target_fap']
      self.target_fap = 0.01 if target_fap.nil? && !attributes.key?(:'targetFap') && !attributes.key?(:'target_fap') # rubocop:disable Style/StringLiterals

      self.training_fraction = attributes[:'trainingFraction'] if attributes[:'trainingFraction']
      self.training_fraction = 0.7 if training_fraction.nil? && !attributes.key?(:'trainingFraction') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :trainingFraction and :training_fraction' if attributes.key?(:'trainingFraction') && attributes.key?(:'training_fraction')

      self.training_fraction = attributes[:'training_fraction'] if attributes[:'training_fraction']
      self.training_fraction = 0.7 if training_fraction.nil? && !attributes.key?(:'trainingFraction') && !attributes.key?(:'training_fraction') # rubocop:disable Style/StringLiterals

      self.data_asset_ids = attributes[:'dataAssetIds'] if attributes[:'dataAssetIds']

      raise 'You cannot provide both :dataAssetIds and :data_asset_ids' if attributes.key?(:'dataAssetIds') && attributes.key?(:'data_asset_ids')

      self.data_asset_ids = attributes[:'data_asset_ids'] if attributes[:'data_asset_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_fap == other.target_fap &&
        training_fraction == other.training_fraction &&
        data_asset_ids == other.data_asset_ids
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
      [target_fap, training_fraction, data_asset_ids].hash
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
