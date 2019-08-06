# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that represents an action to apply to a listener.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class LoadBalancer::Models::Rule
    ACTION_ENUM = [
      ACTION_ADD_HTTP_REQUEST_HEADER = 'ADD_HTTP_REQUEST_HEADER'.freeze,
      ACTION_EXTEND_HTTP_REQUEST_HEADER_VALUE = 'EXTEND_HTTP_REQUEST_HEADER_VALUE'.freeze,
      ACTION_REMOVE_HTTP_REQUEST_HEADER = 'REMOVE_HTTP_REQUEST_HEADER'.freeze,
      ACTION_ADD_HTTP_RESPONSE_HEADER = 'ADD_HTTP_RESPONSE_HEADER'.freeze,
      ACTION_EXTEND_HTTP_RESPONSE_HEADER_VALUE = 'EXTEND_HTTP_RESPONSE_HEADER_VALUE'.freeze,
      ACTION_REMOVE_HTTP_RESPONSE_HEADER = 'REMOVE_HTTP_RESPONSE_HEADER'.freeze,
      ACTION_ALLOW = 'ALLOW'.freeze,
      ACTION_CONTROL_ACCESS_USING_HTTP_METHODS = 'CONTROL_ACCESS_USING_HTTP_METHODS'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # This attribute is required.
    # @return [String]
    attr_reader :action

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'action'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'action'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::LoadBalancer::Models::AddHttpRequestHeaderRule' if type == 'ADD_HTTP_REQUEST_HEADER'
      return 'OCI::LoadBalancer::Models::RemoveHttpRequestHeaderRule' if type == 'REMOVE_HTTP_REQUEST_HEADER'
      return 'OCI::LoadBalancer::Models::ExtendHttpRequestHeaderValueRule' if type == 'EXTEND_HTTP_REQUEST_HEADER_VALUE'
      return 'OCI::LoadBalancer::Models::RemoveHttpResponseHeaderRule' if type == 'REMOVE_HTTP_RESPONSE_HEADER'
      return 'OCI::LoadBalancer::Models::ControlAccessUsingHttpMethodsRule' if type == 'CONTROL_ACCESS_USING_HTTP_METHODS'
      return 'OCI::LoadBalancer::Models::AllowRule' if type == 'ALLOW'
      return 'OCI::LoadBalancer::Models::AddHttpResponseHeaderRule' if type == 'ADD_HTTP_RESPONSE_HEADER'
      return 'OCI::LoadBalancer::Models::ExtendHttpResponseHeaderValueRule' if type == 'EXTEND_HTTP_RESPONSE_HEADER_VALUE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::LoadBalancer::Models::Rule'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :action The value to assign to the {#action} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.action = attributes[:'action'] if attributes[:'action']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        action == other.action
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
      [action].hash
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
