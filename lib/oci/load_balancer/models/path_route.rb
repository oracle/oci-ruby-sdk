# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A \"path route rule\" to evaluate an incoming URI path, and then route a matching request to the specified backend set.
  #
  # Path route rules apply only to HTTP and HTTPS requests. They have no effect on TCP requests.
  #
  class LoadBalancer::Models::PathRoute # rubocop:disable Metrics/LineLength
    # **[Required]** The name of the target backend set for requests where the incoming URI matches the specified path.
    #
    # Example: `example_backend_set`
    #
    # @return [String]
    attr_accessor :backend_set_name

    # **[Required]** The path string to match against the incoming URI path.
    #
    # *  Path strings are case-insensitive.
    #
    # *  Asterisk (*) wildcards are not supported.
    #
    # *  Regular expressions are not supported.
    #
    # Example: `/example/video/123`
    #
    # @return [String]
    attr_accessor :path

    # **[Required]** The type of matching to apply to incoming URIs.
    # @return [OCI::LoadBalancer::Models::PathMatchType]
    attr_accessor :path_match_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'backend_set_name': :'backendSetName',
        'path': :'path',
        'path_match_type': :'pathMatchType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'backend_set_name': :'String',
        'path': :'String',
        'path_match_type': :'OCI::LoadBalancer::Models::PathMatchType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :backend_set_name The value to assign to the {#backend_set_name} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [OCI::LoadBalancer::Models::PathMatchType] :path_match_type The value to assign to the {#path_match_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.backend_set_name = attributes[:'backendSetName'] if attributes[:'backendSetName']

      raise 'You cannot provide both :backendSetName and :backend_set_name' if attributes.key?(:'backendSetName') && attributes.key?(:'backend_set_name')

      self.backend_set_name = attributes[:'backend_set_name'] if attributes[:'backend_set_name']

      self.path = attributes[:'path'] if attributes[:'path']

      self.path_match_type = attributes[:'pathMatchType'] if attributes[:'pathMatchType']

      raise 'You cannot provide both :pathMatchType and :path_match_type' if attributes.key?(:'pathMatchType') && attributes.key?(:'path_match_type')

      self.path_match_type = attributes[:'path_match_type'] if attributes[:'path_match_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        backend_set_name == other.backend_set_name &&
        path == other.path &&
        path_match_type == other.path_match_type
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [backend_set_name, path, path_match_type].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
