# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration of a network load balancer backend set.
  # For more information about backend set configuration, see
  # [Managing Backend Sets](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingbackendsets.htm).
  #
  # **Caution:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class NetworkLoadBalancer::Models::BackendSetDetails
    POLICY_ENUM = [
      POLICY_TWO_TUPLE = 'TWO_TUPLE'.freeze,
      POLICY_THREE_TUPLE = 'THREE_TUPLE'.freeze,
      POLICY_FIVE_TUPLE = 'FIVE_TUPLE'.freeze
    ].freeze

    # The network load balancer policy for the backend set.
    #
    # Example: `FIVE_TUPLE`
    #
    # @return [String]
    attr_reader :policy

    # If this parameter is enabled, then the network load balancer preserves the source IP of the packet when it is forwarded to backends.
    # Backends see the original source IP. If the isPreserveSourceDestination parameter is enabled for the network load balancer resource, then this parameter cannot be disabled.
    # The value is true by default.
    #
    # @return [BOOLEAN]
    attr_accessor :is_preserve_source

    # An array of backends.
    #
    # @return [Array<OCI::NetworkLoadBalancer::Models::Backend>]
    attr_accessor :backends

    # This attribute is required.
    # @return [OCI::NetworkLoadBalancer::Models::HealthChecker]
    attr_accessor :health_checker

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'policy': :'policy',
        'is_preserve_source': :'isPreserveSource',
        'backends': :'backends',
        'health_checker': :'healthChecker'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'policy': :'String',
        'is_preserve_source': :'BOOLEAN',
        'backends': :'Array<OCI::NetworkLoadBalancer::Models::Backend>',
        'health_checker': :'OCI::NetworkLoadBalancer::Models::HealthChecker'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :policy The value to assign to the {#policy} property
    # @option attributes [BOOLEAN] :is_preserve_source The value to assign to the {#is_preserve_source} property
    # @option attributes [Array<OCI::NetworkLoadBalancer::Models::Backend>] :backends The value to assign to the {#backends} property
    # @option attributes [OCI::NetworkLoadBalancer::Models::HealthChecker] :health_checker The value to assign to the {#health_checker} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.policy = attributes[:'policy'] if attributes[:'policy']
      self.policy = "FIVE_TUPLE" if policy.nil? && !attributes.key?(:'policy') # rubocop:disable Style/StringLiterals

      self.is_preserve_source = attributes[:'isPreserveSource'] unless attributes[:'isPreserveSource'].nil?
      self.is_preserve_source = true if is_preserve_source.nil? && !attributes.key?(:'isPreserveSource') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPreserveSource and :is_preserve_source' if attributes.key?(:'isPreserveSource') && attributes.key?(:'is_preserve_source')

      self.is_preserve_source = attributes[:'is_preserve_source'] unless attributes[:'is_preserve_source'].nil?
      self.is_preserve_source = true if is_preserve_source.nil? && !attributes.key?(:'isPreserveSource') && !attributes.key?(:'is_preserve_source') # rubocop:disable Style/StringLiterals

      self.backends = attributes[:'backends'] if attributes[:'backends']

      self.health_checker = attributes[:'healthChecker'] if attributes[:'healthChecker']

      raise 'You cannot provide both :healthChecker and :health_checker' if attributes.key?(:'healthChecker') && attributes.key?(:'health_checker')

      self.health_checker = attributes[:'health_checker'] if attributes[:'health_checker']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] policy Object to be assigned
    def policy=(policy)
      raise "Invalid value for 'policy': this must be one of the values in POLICY_ENUM." if policy && !POLICY_ENUM.include?(policy)

      @policy = policy
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        policy == other.policy &&
        is_preserve_source == other.is_preserve_source &&
        backends == other.backends &&
        health_checker == other.health_checker
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
      [policy, is_preserve_source, backends, health_checker].hash
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
