# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The configuration details for the WAAS policy.
  class Waas::Models::PolicyConfig # rubocop:disable Metrics/LineLength
    # The OCID of the SSL certificate to use if HTTPS is supported.
    # @return [String]
    attr_accessor :certificate_id

    # Enable or disable HTTPS support. If true, a `certificateId` is required. If unspecified, defaults to `false`.
    # @return [BOOLEAN]
    attr_accessor :is_https_enabled

    # Force HTTP to HTTPS redirection. If unspecified, defaults to `false`.
    # @return [BOOLEAN]
    attr_accessor :is_https_forced

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_id': :'certificateId',
        'is_https_enabled': :'isHttpsEnabled',
        'is_https_forced': :'isHttpsForced'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_id': :'String',
        'is_https_enabled': :'BOOLEAN',
        'is_https_forced': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :certificate_id The value to assign to the {#certificate_id} property
    # @option attributes [BOOLEAN] :is_https_enabled The value to assign to the {#is_https_enabled} property
    # @option attributes [BOOLEAN] :is_https_forced The value to assign to the {#is_https_forced} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.certificate_id = attributes[:'certificateId'] if attributes[:'certificateId']

      raise 'You cannot provide both :certificateId and :certificate_id' if attributes.key?(:'certificateId') && attributes.key?(:'certificate_id')

      self.certificate_id = attributes[:'certificate_id'] if attributes[:'certificate_id']

      self.is_https_enabled = attributes[:'isHttpsEnabled'] unless attributes[:'isHttpsEnabled'].nil?

      raise 'You cannot provide both :isHttpsEnabled and :is_https_enabled' if attributes.key?(:'isHttpsEnabled') && attributes.key?(:'is_https_enabled')

      self.is_https_enabled = attributes[:'is_https_enabled'] unless attributes[:'is_https_enabled'].nil?

      self.is_https_forced = attributes[:'isHttpsForced'] unless attributes[:'isHttpsForced'].nil?

      raise 'You cannot provide both :isHttpsForced and :is_https_forced' if attributes.key?(:'isHttpsForced') && attributes.key?(:'is_https_forced')

      self.is_https_forced = attributes[:'is_https_forced'] unless attributes[:'is_https_forced'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        certificate_id == other.certificate_id &&
        is_https_enabled == other.is_https_enabled &&
        is_https_forced == other.is_https_forced
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [certificate_id, is_https_enabled, is_https_forced].hash
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
