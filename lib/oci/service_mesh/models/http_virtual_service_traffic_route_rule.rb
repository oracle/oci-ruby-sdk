# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220615
require 'date'
require 'logger'
require_relative 'virtual_service_traffic_route_rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Rule for routing incoming Virtual Service traffic with HTTP protocol
  class ServiceMesh::Models::HttpVirtualServiceTrafficRouteRule < ServiceMesh::Models::VirtualServiceTrafficRouteRule
    PATH_TYPE_ENUM = [
      PATH_TYPE_PREFIX = 'PREFIX'.freeze,
      PATH_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Route to match
    # @return [String]
    attr_accessor :path

    # Match type for the route
    # @return [String]
    attr_reader :path_type

    # If true, the rule will check that the content-type header has a application/grpc
    # or one of the various application/grpc+ values.
    #
    # @return [BOOLEAN]
    attr_accessor :is_grpc

    # The maximum duration in milliseconds for the target service to respond to a request.
    # If provided, the timeout value overrides the default timeout of 15 seconds for the HTTP based route rules, and disabled (no timeout) when 'isGrpc' is true.
    # The value 0 (zero) indicates that the timeout is disabled.
    # For streaming responses from the target service, consider either keeping the timeout disabled or set a sufficiently high value.
    #
    # @return [Integer]
    attr_accessor :request_timeout_in_ms

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'destinations': :'destinations',
        'path': :'path',
        'path_type': :'pathType',
        'is_grpc': :'isGrpc',
        'request_timeout_in_ms': :'requestTimeoutInMs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'destinations': :'Array<OCI::ServiceMesh::Models::VirtualDeploymentTrafficRuleTarget>',
        'path': :'String',
        'path_type': :'String',
        'is_grpc': :'BOOLEAN',
        'request_timeout_in_ms': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::ServiceMesh::Models::VirtualDeploymentTrafficRuleTarget>] :destinations The value to assign to the {OCI::ServiceMesh::Models::VirtualServiceTrafficRouteRule#destinations #destinations} proprety
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [String] :path_type The value to assign to the {#path_type} property
    # @option attributes [BOOLEAN] :is_grpc The value to assign to the {#is_grpc} property
    # @option attributes [Integer] :request_timeout_in_ms The value to assign to the {#request_timeout_in_ms} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'HTTP'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.path = attributes[:'path'] if attributes[:'path']
      self.path = "/" if path.nil? && !attributes.key?(:'path') # rubocop:disable Style/StringLiterals

      self.path_type = attributes[:'pathType'] if attributes[:'pathType']
      self.path_type = "PREFIX" if path_type.nil? && !attributes.key?(:'pathType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :pathType and :path_type' if attributes.key?(:'pathType') && attributes.key?(:'path_type')

      self.path_type = attributes[:'path_type'] if attributes[:'path_type']
      self.path_type = "PREFIX" if path_type.nil? && !attributes.key?(:'pathType') && !attributes.key?(:'path_type') # rubocop:disable Style/StringLiterals

      self.is_grpc = attributes[:'isGrpc'] unless attributes[:'isGrpc'].nil?
      self.is_grpc = false if is_grpc.nil? && !attributes.key?(:'isGrpc') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isGrpc and :is_grpc' if attributes.key?(:'isGrpc') && attributes.key?(:'is_grpc')

      self.is_grpc = attributes[:'is_grpc'] unless attributes[:'is_grpc'].nil?
      self.is_grpc = false if is_grpc.nil? && !attributes.key?(:'isGrpc') && !attributes.key?(:'is_grpc') # rubocop:disable Style/StringLiterals

      self.request_timeout_in_ms = attributes[:'requestTimeoutInMs'] if attributes[:'requestTimeoutInMs']

      raise 'You cannot provide both :requestTimeoutInMs and :request_timeout_in_ms' if attributes.key?(:'requestTimeoutInMs') && attributes.key?(:'request_timeout_in_ms')

      self.request_timeout_in_ms = attributes[:'request_timeout_in_ms'] if attributes[:'request_timeout_in_ms']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] path_type Object to be assigned
    def path_type=(path_type)
      # rubocop:disable Style/ConditionalAssignment
      if path_type && !PATH_TYPE_ENUM.include?(path_type)
        OCI.logger.debug("Unknown value for 'path_type' [" + path_type + "]. Mapping to 'PATH_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @path_type = PATH_TYPE_UNKNOWN_ENUM_VALUE
      else
        @path_type = path_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        destinations == other.destinations &&
        path == other.path &&
        path_type == other.path_type &&
        is_grpc == other.is_grpc &&
        request_timeout_in_ms == other.request_timeout_in_ms
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
      [type, destinations, path, path_type, is_grpc, request_timeout_in_ms].hash
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
