# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that represents the action of modifying a response header value. This rule applies only to HTTP listeners.
  #
  # This rule adds a prefix, a suffix, or both to the header value.
  #
  # **NOTES:**
  #
  # *  This rule requires a value for a prefix, suffix, or both.
  #
  # *  The system does not support this rule for headers with multiple values.
  #
  # *  The system does not distinquish between underscore and dash characters in headers. That is, it treats
  #    `example_header_name` and `example-header-name` as identical.  If two such headers appear in a request, the system
  #    applies the action to the first header it finds. The affected header cannot be determined in advance. Oracle
  #    recommends that you do not rely on underscore or dash characters to uniquely distinguish header names.
  #
  class LoadBalancer::Models::ExtendHttpResponseHeaderValueRule < LoadBalancer::Models::Rule
    # **[Required]** A header name that conforms to RFC 7230.
    #
    # Example: `example_header_name`
    #
    # @return [String]
    attr_accessor :header

    # A string to prepend to the header value. The resulting header value must still conform to RFC 7230.
    #
    # Example: `example_prefix_value`
    #
    # @return [String]
    attr_accessor :prefix

    # A string to append to the header value. The resulting header value must still conform to RFC 7230.
    #
    # Example: `example_suffix_value`
    #
    # @return [String]
    attr_accessor :suffix

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'action',
        'header': :'header',
        'prefix': :'prefix',
        'suffix': :'suffix'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'String',
        'header': :'String',
        'prefix': :'String',
        'suffix': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :header The value to assign to the {#header} property
    # @option attributes [String] :prefix The value to assign to the {#prefix} property
    # @option attributes [String] :suffix The value to assign to the {#suffix} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['action'] = 'EXTEND_HTTP_RESPONSE_HEADER_VALUE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.header = attributes[:'header'] if attributes[:'header']

      self.prefix = attributes[:'prefix'] if attributes[:'prefix']

      self.suffix = attributes[:'suffix'] if attributes[:'suffix']
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
        header == other.header &&
        prefix == other.prefix &&
        suffix == other.suffix
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
      [action, header, prefix, suffix].hash
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
