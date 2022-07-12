# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a request to create a cluster kubeconfig.
  class ContainerEngine::Models::CreateClusterKubeconfigContentDetails
    ENDPOINT_ENUM = [
      ENDPOINT_LEGACY_KUBERNETES = 'LEGACY_KUBERNETES'.freeze,
      ENDPOINT_PUBLIC_ENDPOINT = 'PUBLIC_ENDPOINT'.freeze,
      ENDPOINT_PRIVATE_ENDPOINT = 'PRIVATE_ENDPOINT'.freeze,
      ENDPOINT_VCN_HOSTNAME = 'VCN_HOSTNAME'.freeze
    ].freeze

    # The version of the kubeconfig token. Supported value 2.0.0
    #
    # @return [String]
    attr_accessor :token_version

    # Deprecated. This field is no longer used.
    #
    # @return [Integer]
    attr_accessor :expiration

    # The endpoint to target. A cluster may have multiple endpoints exposed but the kubeconfig can only target one at a time.
    # @return [String]
    attr_reader :endpoint

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'token_version': :'tokenVersion',
        'expiration': :'expiration',
        'endpoint': :'endpoint'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'token_version': :'String',
        'expiration': :'Integer',
        'endpoint': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :token_version The value to assign to the {#token_version} property
    # @option attributes [Integer] :expiration The value to assign to the {#expiration} property
    # @option attributes [String] :endpoint The value to assign to the {#endpoint} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.token_version = attributes[:'tokenVersion'] if attributes[:'tokenVersion']
      self.token_version = "2.0.0" if token_version.nil? && !attributes.key?(:'tokenVersion') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :tokenVersion and :token_version' if attributes.key?(:'tokenVersion') && attributes.key?(:'token_version')

      self.token_version = attributes[:'token_version'] if attributes[:'token_version']
      self.token_version = "2.0.0" if token_version.nil? && !attributes.key?(:'tokenVersion') && !attributes.key?(:'token_version') # rubocop:disable Style/StringLiterals

      self.expiration = attributes[:'expiration'] if attributes[:'expiration']

      self.endpoint = attributes[:'endpoint'] if attributes[:'endpoint']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] endpoint Object to be assigned
    def endpoint=(endpoint)
      raise "Invalid value for 'endpoint': this must be one of the values in ENDPOINT_ENUM." if endpoint && !ENDPOINT_ENUM.include?(endpoint)

      @endpoint = endpoint
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        token_version == other.token_version &&
        expiration == other.expiration &&
        endpoint == other.endpoint
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
      [token_version, expiration, endpoint].hash
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
