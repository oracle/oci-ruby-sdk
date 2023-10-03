# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210224
require 'date'
require_relative 'create_certificate_authority_config_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details for creating a private subordinate certificate authority (CA) which is issued by a private CA.
  class CertificatesManagement::Models::CreateSubordinateCaIssuedByInternalCaConfigDetails < CertificatesManagement::Models::CreateCertificateAuthorityConfigDetails
    SIGNING_ALGORITHM_ENUM = [
      SIGNING_ALGORITHM_SHA256_WITH_RSA = 'SHA256_WITH_RSA'.freeze,
      SIGNING_ALGORITHM_SHA384_WITH_RSA = 'SHA384_WITH_RSA'.freeze,
      SIGNING_ALGORITHM_SHA512_WITH_RSA = 'SHA512_WITH_RSA'.freeze,
      SIGNING_ALGORITHM_SHA256_WITH_ECDSA = 'SHA256_WITH_ECDSA'.freeze,
      SIGNING_ALGORITHM_SHA384_WITH_ECDSA = 'SHA384_WITH_ECDSA'.freeze,
      SIGNING_ALGORITHM_SHA512_WITH_ECDSA = 'SHA512_WITH_ECDSA'.freeze
    ].freeze

    # **[Required]** The OCID of the private CA.
    # @return [String]
    attr_accessor :issuer_certificate_authority_id

    # @return [OCI::CertificatesManagement::Models::Validity]
    attr_accessor :validity

    # The algorithm used to sign public key certificates that the CA issues.
    # @return [String]
    attr_reader :signing_algorithm

    # This attribute is required.
    # @return [OCI::CertificatesManagement::Models::CertificateSubject]
    attr_accessor :subject

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'configType',
        'version_name': :'versionName',
        'issuer_certificate_authority_id': :'issuerCertificateAuthorityId',
        'validity': :'validity',
        'signing_algorithm': :'signingAlgorithm',
        'subject': :'subject'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'String',
        'version_name': :'String',
        'issuer_certificate_authority_id': :'String',
        'validity': :'OCI::CertificatesManagement::Models::Validity',
        'signing_algorithm': :'String',
        'subject': :'OCI::CertificatesManagement::Models::CertificateSubject'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :version_name The value to assign to the {OCI::CertificatesManagement::Models::CreateCertificateAuthorityConfigDetails#version_name #version_name} proprety
    # @option attributes [String] :issuer_certificate_authority_id The value to assign to the {#issuer_certificate_authority_id} property
    # @option attributes [OCI::CertificatesManagement::Models::Validity] :validity The value to assign to the {#validity} property
    # @option attributes [String] :signing_algorithm The value to assign to the {#signing_algorithm} property
    # @option attributes [OCI::CertificatesManagement::Models::CertificateSubject] :subject The value to assign to the {#subject} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configType'] = 'SUBORDINATE_CA_ISSUED_BY_INTERNAL_CA'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.issuer_certificate_authority_id = attributes[:'issuerCertificateAuthorityId'] if attributes[:'issuerCertificateAuthorityId']

      raise 'You cannot provide both :issuerCertificateAuthorityId and :issuer_certificate_authority_id' if attributes.key?(:'issuerCertificateAuthorityId') && attributes.key?(:'issuer_certificate_authority_id')

      self.issuer_certificate_authority_id = attributes[:'issuer_certificate_authority_id'] if attributes[:'issuer_certificate_authority_id']

      self.validity = attributes[:'validity'] if attributes[:'validity']

      self.signing_algorithm = attributes[:'signingAlgorithm'] if attributes[:'signingAlgorithm']

      raise 'You cannot provide both :signingAlgorithm and :signing_algorithm' if attributes.key?(:'signingAlgorithm') && attributes.key?(:'signing_algorithm')

      self.signing_algorithm = attributes[:'signing_algorithm'] if attributes[:'signing_algorithm']

      self.subject = attributes[:'subject'] if attributes[:'subject']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] signing_algorithm Object to be assigned
    def signing_algorithm=(signing_algorithm)
      raise "Invalid value for 'signing_algorithm': this must be one of the values in SIGNING_ALGORITHM_ENUM." if signing_algorithm && !SIGNING_ALGORITHM_ENUM.include?(signing_algorithm)

      @signing_algorithm = signing_algorithm
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config_type == other.config_type &&
        version_name == other.version_name &&
        issuer_certificate_authority_id == other.issuer_certificate_authority_id &&
        validity == other.validity &&
        signing_algorithm == other.signing_algorithm &&
        subject == other.subject
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
      [config_type, version_name, issuer_certificate_authority_id, validity, signing_algorithm, subject].hash
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
