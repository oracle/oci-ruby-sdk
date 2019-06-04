# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A detailed description of your web application's origin host server. An origin must be defined to set up WAF rules.
  class Waas::Models::Origin
    # **[Required]** The URI of the origin. Does not support paths. Port numbers should be specified in the `httpPort` and `httpsPort` fields.
    # @return [String]
    attr_accessor :uri

    # The HTTP port on the origin that the web application listens on. If unspecified, defaults to `80`.
    # @return [Integer]
    attr_accessor :http_port

    # The HTTPS port on the origin that the web application listens on. If unspecified, defaults to `443`.
    # @return [Integer]
    attr_accessor :https_port

    # A list of HTTP headers to forward to your origin.
    # @return [Array<OCI::Waas::Models::Header>]
    attr_accessor :custom_headers

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'uri': :'uri',
        'http_port': :'httpPort',
        'https_port': :'httpsPort',
        'custom_headers': :'customHeaders'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'uri': :'String',
        'http_port': :'Integer',
        'https_port': :'Integer',
        'custom_headers': :'Array<OCI::Waas::Models::Header>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [Integer] :http_port The value to assign to the {#http_port} property
    # @option attributes [Integer] :https_port The value to assign to the {#https_port} property
    # @option attributes [Array<OCI::Waas::Models::Header>] :custom_headers The value to assign to the {#custom_headers} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.uri = attributes[:'uri'] if attributes[:'uri']

      self.http_port = attributes[:'httpPort'] if attributes[:'httpPort']

      raise 'You cannot provide both :httpPort and :http_port' if attributes.key?(:'httpPort') && attributes.key?(:'http_port')

      self.http_port = attributes[:'http_port'] if attributes[:'http_port']

      self.https_port = attributes[:'httpsPort'] if attributes[:'httpsPort']

      raise 'You cannot provide both :httpsPort and :https_port' if attributes.key?(:'httpsPort') && attributes.key?(:'https_port')

      self.https_port = attributes[:'https_port'] if attributes[:'https_port']

      self.custom_headers = attributes[:'customHeaders'] if attributes[:'customHeaders']

      raise 'You cannot provide both :customHeaders and :custom_headers' if attributes.key?(:'customHeaders') && attributes.key?(:'custom_headers')

      self.custom_headers = attributes[:'custom_headers'] if attributes[:'custom_headers']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        uri == other.uri &&
        http_port == other.http_port &&
        https_port == other.https_port &&
        custom_headers == other.custom_headers
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
      [uri, http_port, https_port, custom_headers].hash
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
