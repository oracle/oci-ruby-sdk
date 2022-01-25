# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The contents of the certificate, properties of the certificate (and certificate version), and user-provided contextual metadata for the certificate.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Certificates::Models::CertificateBundle
    CERTIFICATE_BUNDLE_TYPE_ENUM = [
      CERTIFICATE_BUNDLE_TYPE_CERTIFICATE_CONTENT_PUBLIC_ONLY = 'CERTIFICATE_CONTENT_PUBLIC_ONLY'.freeze,
      CERTIFICATE_BUNDLE_TYPE_CERTIFICATE_CONTENT_WITH_PRIVATE_KEY = 'CERTIFICATE_CONTENT_WITH_PRIVATE_KEY'.freeze,
      CERTIFICATE_BUNDLE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STAGES_ENUM = [
      STAGES_CURRENT = 'CURRENT'.freeze,
      STAGES_PENDING = 'PENDING'.freeze,
      STAGES_LATEST = 'LATEST'.freeze,
      STAGES_PREVIOUS = 'PREVIOUS'.freeze,
      STAGES_DEPRECATED = 'DEPRECATED'.freeze,
      STAGES_FAILED = 'FAILED'.freeze,
      STAGES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of certificate bundle, which indicates whether the private key fields are included.
    # @return [String]
    attr_reader :certificate_bundle_type

    # **[Required]** The OCID of the certificate.
    # @return [String]
    attr_accessor :certificate_id

    # **[Required]** The name of the certificate.
    # @return [String]
    attr_accessor :certificate_name

    # **[Required]** The version number of the certificate.
    # @return [Integer]
    attr_accessor :version_number

    # **[Required]** A unique certificate identifier used in certificate revocation tracking, formatted as octets.
    # Example: `03 AC FC FA CC B3 CB 02 B8 F8 DE F5 85 E7 7B FF`
    #
    # @return [String]
    attr_accessor :serial_number

    # The certificate in PEM format.
    # @return [String]
    attr_accessor :certificate_pem

    # The certificate chain (in PEM format) for the certificate bundle.
    # @return [String]
    attr_accessor :cert_chain_pem

    # **[Required]** An optional property indicating when the certificate version was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # This attribute is required.
    # @return [OCI::Certificates::Models::Validity]
    attr_accessor :validity

    # The name of the certificate version.
    # @return [String]
    attr_accessor :version_name

    # **[Required]** A list of rotation states for the certificate bundle.
    # @return [Array<String>]
    attr_reader :stages

    # @return [OCI::Certificates::Models::RevocationStatus]
    attr_accessor :revocation_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_bundle_type': :'certificateBundleType',
        'certificate_id': :'certificateId',
        'certificate_name': :'certificateName',
        'version_number': :'versionNumber',
        'serial_number': :'serialNumber',
        'certificate_pem': :'certificatePem',
        'cert_chain_pem': :'certChainPem',
        'time_created': :'timeCreated',
        'validity': :'validity',
        'version_name': :'versionName',
        'stages': :'stages',
        'revocation_status': :'revocationStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_bundle_type': :'String',
        'certificate_id': :'String',
        'certificate_name': :'String',
        'version_number': :'Integer',
        'serial_number': :'String',
        'certificate_pem': :'String',
        'cert_chain_pem': :'String',
        'time_created': :'DateTime',
        'validity': :'OCI::Certificates::Models::Validity',
        'version_name': :'String',
        'stages': :'Array<String>',
        'revocation_status': :'OCI::Certificates::Models::RevocationStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'certificateBundleType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Certificates::Models::CertificateBundlePublicOnly' if type == 'CERTIFICATE_CONTENT_PUBLIC_ONLY'
      return 'OCI::Certificates::Models::CertificateBundleWithPrivateKey' if type == 'CERTIFICATE_CONTENT_WITH_PRIVATE_KEY'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Certificates::Models::CertificateBundle'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :certificate_bundle_type The value to assign to the {#certificate_bundle_type} property
    # @option attributes [String] :certificate_id The value to assign to the {#certificate_id} property
    # @option attributes [String] :certificate_name The value to assign to the {#certificate_name} property
    # @option attributes [Integer] :version_number The value to assign to the {#version_number} property
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [String] :certificate_pem The value to assign to the {#certificate_pem} property
    # @option attributes [String] :cert_chain_pem The value to assign to the {#cert_chain_pem} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [OCI::Certificates::Models::Validity] :validity The value to assign to the {#validity} property
    # @option attributes [String] :version_name The value to assign to the {#version_name} property
    # @option attributes [Array<String>] :stages The value to assign to the {#stages} property
    # @option attributes [OCI::Certificates::Models::RevocationStatus] :revocation_status The value to assign to the {#revocation_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.certificate_bundle_type = attributes[:'certificateBundleType'] if attributes[:'certificateBundleType']

      raise 'You cannot provide both :certificateBundleType and :certificate_bundle_type' if attributes.key?(:'certificateBundleType') && attributes.key?(:'certificate_bundle_type')

      self.certificate_bundle_type = attributes[:'certificate_bundle_type'] if attributes[:'certificate_bundle_type']

      self.certificate_id = attributes[:'certificateId'] if attributes[:'certificateId']

      raise 'You cannot provide both :certificateId and :certificate_id' if attributes.key?(:'certificateId') && attributes.key?(:'certificate_id')

      self.certificate_id = attributes[:'certificate_id'] if attributes[:'certificate_id']

      self.certificate_name = attributes[:'certificateName'] if attributes[:'certificateName']

      raise 'You cannot provide both :certificateName and :certificate_name' if attributes.key?(:'certificateName') && attributes.key?(:'certificate_name')

      self.certificate_name = attributes[:'certificate_name'] if attributes[:'certificate_name']

      self.version_number = attributes[:'versionNumber'] if attributes[:'versionNumber']

      raise 'You cannot provide both :versionNumber and :version_number' if attributes.key?(:'versionNumber') && attributes.key?(:'version_number')

      self.version_number = attributes[:'version_number'] if attributes[:'version_number']

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.certificate_pem = attributes[:'certificatePem'] if attributes[:'certificatePem']
      self.certificate_pem = "null" if certificate_pem.nil? && !attributes.key?(:'certificatePem') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :certificatePem and :certificate_pem' if attributes.key?(:'certificatePem') && attributes.key?(:'certificate_pem')

      self.certificate_pem = attributes[:'certificate_pem'] if attributes[:'certificate_pem']
      self.certificate_pem = "null" if certificate_pem.nil? && !attributes.key?(:'certificatePem') && !attributes.key?(:'certificate_pem') # rubocop:disable Style/StringLiterals

      self.cert_chain_pem = attributes[:'certChainPem'] if attributes[:'certChainPem']
      self.cert_chain_pem = "null" if cert_chain_pem.nil? && !attributes.key?(:'certChainPem') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :certChainPem and :cert_chain_pem' if attributes.key?(:'certChainPem') && attributes.key?(:'cert_chain_pem')

      self.cert_chain_pem = attributes[:'cert_chain_pem'] if attributes[:'cert_chain_pem']
      self.cert_chain_pem = "null" if cert_chain_pem.nil? && !attributes.key?(:'certChainPem') && !attributes.key?(:'cert_chain_pem') # rubocop:disable Style/StringLiterals

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.validity = attributes[:'validity'] if attributes[:'validity']

      self.version_name = attributes[:'versionName'] if attributes[:'versionName']
      self.version_name = "null" if version_name.nil? && !attributes.key?(:'versionName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :versionName and :version_name' if attributes.key?(:'versionName') && attributes.key?(:'version_name')

      self.version_name = attributes[:'version_name'] if attributes[:'version_name']
      self.version_name = "null" if version_name.nil? && !attributes.key?(:'versionName') && !attributes.key?(:'version_name') # rubocop:disable Style/StringLiterals

      self.stages = attributes[:'stages'] if attributes[:'stages']

      self.revocation_status = attributes[:'revocationStatus'] if attributes[:'revocationStatus']

      raise 'You cannot provide both :revocationStatus and :revocation_status' if attributes.key?(:'revocationStatus') && attributes.key?(:'revocation_status')

      self.revocation_status = attributes[:'revocation_status'] if attributes[:'revocation_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] certificate_bundle_type Object to be assigned
    def certificate_bundle_type=(certificate_bundle_type)
      # rubocop:disable Style/ConditionalAssignment
      if certificate_bundle_type && !CERTIFICATE_BUNDLE_TYPE_ENUM.include?(certificate_bundle_type)
        OCI.logger.debug("Unknown value for 'certificate_bundle_type' [" + certificate_bundle_type + "]. Mapping to 'CERTIFICATE_BUNDLE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @certificate_bundle_type = CERTIFICATE_BUNDLE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @certificate_bundle_type = certificate_bundle_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] stages Object to be assigned
    def stages=(stages)
      # rubocop:disable Style/ConditionalAssignment
      if stages.nil?
        @stages = nil
      else
        @stages =
          stages.collect do |item|
            if STAGES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'stages' [#{item}]. Mapping to 'STAGES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              STAGES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        certificate_bundle_type == other.certificate_bundle_type &&
        certificate_id == other.certificate_id &&
        certificate_name == other.certificate_name &&
        version_number == other.version_number &&
        serial_number == other.serial_number &&
        certificate_pem == other.certificate_pem &&
        cert_chain_pem == other.cert_chain_pem &&
        time_created == other.time_created &&
        validity == other.validity &&
        version_name == other.version_name &&
        stages == other.stages &&
        revocation_status == other.revocation_status
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
      [certificate_bundle_type, certificate_id, certificate_name, version_number, serial_number, certificate_pem, cert_chain_pem, time_created, validity, version_name, stages, revocation_status].hash
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
