# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20231130
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The text generated during each run.
  class GenerativeAiInference::Models::GeneratedText
    # **[Required]** A unique identifier for this text generation.
    # @return [String]
    attr_accessor :id

    # **[Required]** The generated text.
    # @return [String]
    attr_accessor :text

    # **[Required]** The overall likelihood of the generated text.
    #
    # When a large language model generates a new token for the output text, a likelihood is assigned to all tokens, where tokens with higher likelihoods are more likely to follow the current token. For example, it's more likely that the word favorite is followed by the word food or book rather than the word zebra. A lower likelihood means that it's less likely that token follows the current token.
    #
    # @return [Float]
    attr_accessor :likelihood

    # The reason why the model stopped generating tokens.
    #
    # A model stops generating tokens if the model hits a natural stop point or reaches a provided stop sequence.
    #
    # @return [String]
    attr_accessor :finish_reason

    # A collection of generated tokens and their corresponding likelihoods.
    # @return [Array<OCI::GenerativeAiInference::Models::TokenLikelihood>]
    attr_accessor :token_likelihoods

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'text': :'text',
        'likelihood': :'likelihood',
        'finish_reason': :'finishReason',
        'token_likelihoods': :'tokenLikelihoods'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'text': :'String',
        'likelihood': :'Float',
        'finish_reason': :'String',
        'token_likelihoods': :'Array<OCI::GenerativeAiInference::Models::TokenLikelihood>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :text The value to assign to the {#text} property
    # @option attributes [Float] :likelihood The value to assign to the {#likelihood} property
    # @option attributes [String] :finish_reason The value to assign to the {#finish_reason} property
    # @option attributes [Array<OCI::GenerativeAiInference::Models::TokenLikelihood>] :token_likelihoods The value to assign to the {#token_likelihoods} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.text = attributes[:'text'] if attributes[:'text']

      self.likelihood = attributes[:'likelihood'] if attributes[:'likelihood']

      self.finish_reason = attributes[:'finishReason'] if attributes[:'finishReason']

      raise 'You cannot provide both :finishReason and :finish_reason' if attributes.key?(:'finishReason') && attributes.key?(:'finish_reason')

      self.finish_reason = attributes[:'finish_reason'] if attributes[:'finish_reason']

      self.token_likelihoods = attributes[:'tokenLikelihoods'] if attributes[:'tokenLikelihoods']

      raise 'You cannot provide both :tokenLikelihoods and :token_likelihoods' if attributes.key?(:'tokenLikelihoods') && attributes.key?(:'token_likelihoods')

      self.token_likelihoods = attributes[:'token_likelihoods'] if attributes[:'token_likelihoods']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        text == other.text &&
        likelihood == other.likelihood &&
        finish_reason == other.finish_reason &&
        token_likelihoods == other.token_likelihoods
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
      [id, text, likelihood, finish_reason, token_likelihoods].hash
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
