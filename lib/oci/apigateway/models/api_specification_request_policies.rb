# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Global behavior applied to all requests received by the API.
  class Apigateway::Models::ApiSpecificationRequestPolicies
    # @return [OCI::Apigateway::Models::AuthenticationPolicy]
    attr_accessor :authentication

    # @return [OCI::Apigateway::Models::RateLimitingPolicy]
    attr_accessor :rate_limiting

    # @return [OCI::Apigateway::Models::CorsPolicy]
    attr_accessor :cors

    # @return [OCI::Apigateway::Models::MutualTlsDetails]
    attr_accessor :mutual_tls

    # @return [OCI::Apigateway::Models::UsagePlansPolicy]
    attr_accessor :usage_plans

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'authentication': :'authentication',
        'rate_limiting': :'rateLimiting',
        'cors': :'cors',
        'mutual_tls': :'mutualTls',
        'usage_plans': :'usagePlans'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'authentication': :'OCI::Apigateway::Models::AuthenticationPolicy',
        'rate_limiting': :'OCI::Apigateway::Models::RateLimitingPolicy',
        'cors': :'OCI::Apigateway::Models::CorsPolicy',
        'mutual_tls': :'OCI::Apigateway::Models::MutualTlsDetails',
        'usage_plans': :'OCI::Apigateway::Models::UsagePlansPolicy'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Apigateway::Models::AuthenticationPolicy] :authentication The value to assign to the {#authentication} property
    # @option attributes [OCI::Apigateway::Models::RateLimitingPolicy] :rate_limiting The value to assign to the {#rate_limiting} property
    # @option attributes [OCI::Apigateway::Models::CorsPolicy] :cors The value to assign to the {#cors} property
    # @option attributes [OCI::Apigateway::Models::MutualTlsDetails] :mutual_tls The value to assign to the {#mutual_tls} property
    # @option attributes [OCI::Apigateway::Models::UsagePlansPolicy] :usage_plans The value to assign to the {#usage_plans} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.authentication = attributes[:'authentication'] if attributes[:'authentication']

      self.rate_limiting = attributes[:'rateLimiting'] if attributes[:'rateLimiting']

      raise 'You cannot provide both :rateLimiting and :rate_limiting' if attributes.key?(:'rateLimiting') && attributes.key?(:'rate_limiting')

      self.rate_limiting = attributes[:'rate_limiting'] if attributes[:'rate_limiting']

      self.cors = attributes[:'cors'] if attributes[:'cors']

      self.mutual_tls = attributes[:'mutualTls'] if attributes[:'mutualTls']

      raise 'You cannot provide both :mutualTls and :mutual_tls' if attributes.key?(:'mutualTls') && attributes.key?(:'mutual_tls')

      self.mutual_tls = attributes[:'mutual_tls'] if attributes[:'mutual_tls']

      self.usage_plans = attributes[:'usagePlans'] if attributes[:'usagePlans']

      raise 'You cannot provide both :usagePlans and :usage_plans' if attributes.key?(:'usagePlans') && attributes.key?(:'usage_plans')

      self.usage_plans = attributes[:'usage_plans'] if attributes[:'usage_plans']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        authentication == other.authentication &&
        rate_limiting == other.rate_limiting &&
        cors == other.cors &&
        mutual_tls == other.mutual_tls &&
        usage_plans == other.usage_plans
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
      [authentication, rate_limiting, cors, mutual_tls, usage_plans].hash
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
