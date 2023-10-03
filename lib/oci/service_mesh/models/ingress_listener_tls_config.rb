# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220615
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # TLS enforcement config for the ingress listener.
  class ServiceMesh::Models::IngressListenerTlsConfig
    MODE_ENUM = [
      MODE_DISABLED = 'DISABLED'.freeze,
      MODE_PERMISSIVE = 'PERMISSIVE'.freeze,
      MODE_TLS = 'TLS'.freeze,
      MODE_MUTUAL_TLS = 'MUTUAL_TLS'.freeze,
      MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** DISABLED: Connection can only be plaintext.
    # PERMISSIVE: Connection can be either plaintext or TLS/mTLS. If the clientValidation.trustedCaBundle property is configured for the listener, mTLS is performed and the client's certificates are validated by the gateway.
    # TLS: Connection can only be TLS.
    # MUTUAL_TLS: Connection can only be MTLS.
    #
    # @return [String]
    attr_reader :mode

    # @return [OCI::ServiceMesh::Models::TlsCertificate]
    attr_accessor :server_certificate

    # @return [OCI::ServiceMesh::Models::IngressListenerClientValidationConfig]
    attr_accessor :client_validation

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'mode': :'mode',
        'server_certificate': :'serverCertificate',
        'client_validation': :'clientValidation'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'mode': :'String',
        'server_certificate': :'OCI::ServiceMesh::Models::TlsCertificate',
        'client_validation': :'OCI::ServiceMesh::Models::IngressListenerClientValidationConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :mode The value to assign to the {#mode} property
    # @option attributes [OCI::ServiceMesh::Models::TlsCertificate] :server_certificate The value to assign to the {#server_certificate} property
    # @option attributes [OCI::ServiceMesh::Models::IngressListenerClientValidationConfig] :client_validation The value to assign to the {#client_validation} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.mode = attributes[:'mode'] if attributes[:'mode']

      self.server_certificate = attributes[:'serverCertificate'] if attributes[:'serverCertificate']

      raise 'You cannot provide both :serverCertificate and :server_certificate' if attributes.key?(:'serverCertificate') && attributes.key?(:'server_certificate')

      self.server_certificate = attributes[:'server_certificate'] if attributes[:'server_certificate']

      self.client_validation = attributes[:'clientValidation'] if attributes[:'clientValidation']

      raise 'You cannot provide both :clientValidation and :client_validation' if attributes.key?(:'clientValidation') && attributes.key?(:'client_validation')

      self.client_validation = attributes[:'client_validation'] if attributes[:'client_validation']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] mode Object to be assigned
    def mode=(mode)
      # rubocop:disable Style/ConditionalAssignment
      if mode && !MODE_ENUM.include?(mode)
        OCI.logger.debug("Unknown value for 'mode' [" + mode + "]. Mapping to 'MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @mode = MODE_UNKNOWN_ENUM_VALUE
      else
        @mode = mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        mode == other.mode &&
        server_certificate == other.server_certificate &&
        client_validation == other.client_validation
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
      [mode, server_certificate, client_validation].hash
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
