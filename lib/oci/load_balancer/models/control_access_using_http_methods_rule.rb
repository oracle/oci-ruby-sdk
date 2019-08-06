# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that represents the action of returning a specified response code when the requested HTTP method is not in
  # the list of allowed methods for the listener. The load balancer does not forward a disallowed request to the back end
  # servers. The default response code is `405 Method Not Allowed`.
  #
  # If you set the response code to `405` or leave it blank, the system adds an \"allow\" response header that contains a
  # list of the allowed methods for the listener. If you set the response code to anything other than `405` (or blank),
  # the system does not add the \"allow\" response header with a list of allowed methods.
  #
  # This rule applies only to HTTP listeners. No more than one `ControlAccessUsingHttpMethodsRule` object can be present in
  # a given listener.
  #
  class LoadBalancer::Models::ControlAccessUsingHttpMethodsRule < LoadBalancer::Models::Rule
    # **[Required]** The list of HTTP methods allowed for this listener.
    #
    # By default, you can specify only the standard HTTP methods defined in the
    # [HTTP Method Registry](http://www.iana.org/assignments/http-methods/http-methods.xhtml). You can also
    # see a list of supported standard HTTP methods in the Load Balancing service documentation at
    # [Managing Rule Sets](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingrulesets.htm).
    #
    # Your backend application must be able to handle the methods specified in this list.
    #
    # The list of HTTP methods is extensible. If you need to configure custom HTTP methods, contact
    # [My Oracle Support](http://support.oracle.com/) to remove the restriction for your tenancy.
    #
    # Example: [\"GET\", \"PUT\", \"POST\", \"PROPFIND\"]
    #
    # @return [Array<String>]
    attr_accessor :allowed_methods

    # The HTTP status code to return when the requested HTTP method is not in the list of allowed methods.
    # The associated status line returned with the code is mapped from the standard HTTP specification. The
    # default value is `405 (Method Not Allowed)`.
    #
    # Example: 403
    #
    # @return [Integer]
    attr_accessor :status_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'action',
        'allowed_methods': :'allowedMethods',
        'status_code': :'statusCode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'String',
        'allowed_methods': :'Array<String>',
        'status_code': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :allowed_methods The value to assign to the {#allowed_methods} property
    # @option attributes [Integer] :status_code The value to assign to the {#status_code} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['action'] = 'CONTROL_ACCESS_USING_HTTP_METHODS'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.allowed_methods = attributes[:'allowedMethods'] if attributes[:'allowedMethods']

      raise 'You cannot provide both :allowedMethods and :allowed_methods' if attributes.key?(:'allowedMethods') && attributes.key?(:'allowed_methods')

      self.allowed_methods = attributes[:'allowed_methods'] if attributes[:'allowed_methods']

      self.status_code = attributes[:'statusCode'] if attributes[:'statusCode']
      self.status_code = 405 if status_code.nil? && !attributes.key?(:'statusCode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :statusCode and :status_code' if attributes.key?(:'statusCode') && attributes.key?(:'status_code')

      self.status_code = attributes[:'status_code'] if attributes[:'status_code']
      self.status_code = 405 if status_code.nil? && !attributes.key?(:'statusCode') && !attributes.key?(:'status_code') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        action == other.action &&
        allowed_methods == other.allowed_methods &&
        status_code == other.status_code
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
      [action, allowed_methods, status_code].hash
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
