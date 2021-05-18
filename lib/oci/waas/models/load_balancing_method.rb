# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LoadBalancingMethod model.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Waas::Models::LoadBalancingMethod
    METHOD_ENUM = [
      METHOD_IP_HASH = 'IP_HASH'.freeze,
      METHOD_ROUND_ROBIN = 'ROUND_ROBIN'.freeze,
      METHOD_STICKY_COOKIE = 'STICKY_COOKIE'.freeze,
      METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Load balancing methods are algorithms used to efficiently distribute traffic among origin servers.
    #
    # - **[IP_HASH](https://docs.cloud.oracle.com/iaas/api/#/en/waas/latest/datatypes/IPHashLoadBalancingMethod):** All the incoming requests from the same client IP address should go to the same content origination server. IP_HASH load balancing method uses origin weights when choosing which origin should the hash be assigned to initially.
    #
    # - **[ROUND_ROBIN](https://docs.cloud.oracle.com/iaas/api/#/en/waas/latest/datatypes/RoundRobinLoadBalancingMethod):** Forwards requests sequentially to the available origin servers. The first request - to the first origin server, the second request - to the next origin server, and so on. After it sends a request to the last origin server, it starts again with the first origin server. When using weights on origins, Weighted Round Robin assigns more requests to origins with a greater weight. Over a period of time, origins will receive a number of requests in proportion to their weight.
    #
    # - **[STICKY_COOKIE](https://docs.cloud.oracle.com/iaas/api/#/en/waas/latest/datatypes/StickyCookieLoadBalancingMethod):** Adds a session cookie to the first response from the origin server and identifies the server that sent the response. The client's next request contains the cookie value, and nginx routes the request to the origin server that responded to the first request. STICKY_COOKIE load balancing method falls back to Round Robin for the first request.
    # @return [String]
    attr_reader :method

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'method': :'method'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'method': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'method'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Waas::Models::RoundRobinLoadBalancingMethod' if type == 'ROUND_ROBIN'
      return 'OCI::Waas::Models::StickyCookieLoadBalancingMethod' if type == 'STICKY_COOKIE'
      return 'OCI::Waas::Models::IPHashLoadBalancingMethod' if type == 'IP_HASH'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Waas::Models::LoadBalancingMethod'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :method The value to assign to the {#method} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.method = attributes[:'method'] if attributes[:'method']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] method Object to be assigned
    def method=(method)
      # rubocop:disable Style/ConditionalAssignment
      if method && !METHOD_ENUM.include?(method)
        OCI.logger.debug("Unknown value for 'method' [" + method + "]. Mapping to 'METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @method = METHOD_UNKNOWN_ENUM_VALUE
      else
        @method = method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        method == other.method
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
      [method].hash
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
