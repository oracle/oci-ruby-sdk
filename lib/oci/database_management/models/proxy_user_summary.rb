# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the proxy user.
  class DatabaseManagement::Models::ProxyUserSummary
    AUTHENTICATION_ENUM = [
      AUTHENTICATION_YES = 'YES'.freeze,
      AUTHENTICATION_NO = 'NO'.freeze,
      AUTHENTICATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    FLAGS_ENUM = [
      FLAGS_PROXY_MAY_ACTIVATE_ALL_CLIENT_ROLES = 'PROXY_MAY_ACTIVATE_ALL_CLIENT_ROLES'.freeze,
      FLAGS_NO_CLIENT_ROLES_MAY_BE_ACTIVATED = 'NO_CLIENT_ROLES_MAY_BE_ACTIVATED'.freeze,
      FLAGS_PROXY_MAY_ACTIVATE_ROLE = 'PROXY_MAY_ACTIVATE_ROLE'.freeze,
      FLAGS_PROXY_MAY_NOT_ACTIVATE_ROLE = 'PROXY_MAY_NOT_ACTIVATE_ROLE'.freeze,
      FLAGS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of a proxy user or the name of the client user.
    # @return [String]
    attr_accessor :name

    # Indicates whether the proxy is required to supply the client credentials (YES) or not (NO).
    # @return [String]
    attr_reader :authentication

    # The flags associated with the proxy/client pair.
    # @return [String]
    attr_reader :flags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'authentication': :'authentication',
        'flags': :'flags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'authentication': :'String',
        'flags': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :authentication The value to assign to the {#authentication} property
    # @option attributes [String] :flags The value to assign to the {#flags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.authentication = attributes[:'authentication'] if attributes[:'authentication']

      self.flags = attributes[:'flags'] if attributes[:'flags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] authentication Object to be assigned
    def authentication=(authentication)
      # rubocop:disable Style/ConditionalAssignment
      if authentication && !AUTHENTICATION_ENUM.include?(authentication)
        OCI.logger.debug("Unknown value for 'authentication' [" + authentication + "]. Mapping to 'AUTHENTICATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @authentication = AUTHENTICATION_UNKNOWN_ENUM_VALUE
      else
        @authentication = authentication
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] flags Object to be assigned
    def flags=(flags)
      # rubocop:disable Style/ConditionalAssignment
      if flags && !FLAGS_ENUM.include?(flags)
        OCI.logger.debug("Unknown value for 'flags' [" + flags + "]. Mapping to 'FLAGS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @flags = FLAGS_UNKNOWN_ENUM_VALUE
      else
        @flags = flags
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        authentication == other.authentication &&
        flags == other.flags
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
      [name, authentication, flags].hash
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
