# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20180222
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The range of kubernetes versions an addon can be configured.
  class ContainerEngine::Models::KubernetesVersionsFilters
    # The earliest kubernetes version.
    # @return [String]
    attr_accessor :minimal_version

    # The latest kubernetes version.
    # @return [String]
    attr_accessor :maximum_version

    # The exact version of kubernetes that are compatible.
    #
    # @return [Array<String>]
    attr_accessor :exact_kubernetes_versions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'minimal_version': :'minimalVersion',
        'maximum_version': :'maximumVersion',
        'exact_kubernetes_versions': :'exactKubernetesVersions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'minimal_version': :'String',
        'maximum_version': :'String',
        'exact_kubernetes_versions': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :minimal_version The value to assign to the {#minimal_version} property
    # @option attributes [String] :maximum_version The value to assign to the {#maximum_version} property
    # @option attributes [Array<String>] :exact_kubernetes_versions The value to assign to the {#exact_kubernetes_versions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.minimal_version = attributes[:'minimalVersion'] if attributes[:'minimalVersion']

      raise 'You cannot provide both :minimalVersion and :minimal_version' if attributes.key?(:'minimalVersion') && attributes.key?(:'minimal_version')

      self.minimal_version = attributes[:'minimal_version'] if attributes[:'minimal_version']

      self.maximum_version = attributes[:'maximumVersion'] if attributes[:'maximumVersion']

      raise 'You cannot provide both :maximumVersion and :maximum_version' if attributes.key?(:'maximumVersion') && attributes.key?(:'maximum_version')

      self.maximum_version = attributes[:'maximum_version'] if attributes[:'maximum_version']

      self.exact_kubernetes_versions = attributes[:'exactKubernetesVersions'] if attributes[:'exactKubernetesVersions']

      raise 'You cannot provide both :exactKubernetesVersions and :exact_kubernetes_versions' if attributes.key?(:'exactKubernetesVersions') && attributes.key?(:'exact_kubernetes_versions')

      self.exact_kubernetes_versions = attributes[:'exact_kubernetes_versions'] if attributes[:'exact_kubernetes_versions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        minimal_version == other.minimal_version &&
        maximum_version == other.maximum_version &&
        exact_kubernetes_versions == other.exact_kubernetes_versions
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
      [minimal_version, maximum_version, exact_kubernetes_versions].hash
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
