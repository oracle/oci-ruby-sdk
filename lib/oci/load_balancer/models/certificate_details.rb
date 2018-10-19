# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The configuration details for a certificate bundle.
  # For more information on SSL certficate configuration, see
  # [Managing SSL Certificates](https://docs.us-phoenix-1.oraclecloud.com/Content/Balance/Tasks/managingcertificates.htm).
  #
  class LoadBalancer::Models::CertificateDetails # rubocop:disable Metrics/LineLength
    # The Certificate Authority certificate, or any interim certificate, that you received from your SSL certificate provider.
    #
    # Example:
    #
    #     -----BEGIN CERTIFICATE-----
    #     MIIEczCCA1ugAwIBAgIBADANBgkqhkiG9w0BAQQFAD..AkGA1UEBhMCR0Ix
    #     EzARBgNVBAgTClNvbWUtU3RhdGUxFDASBgNVBAoTC0..0EgTHRkMTcwNQYD
    #     VQQLEy5DbGFzcyAxIFB1YmxpYyBQcmltYXJ5IENlcn..XRpb24gQXV0aG9y
    #     aXR5MRQwEgYDVQQDEwtCZXN0IENBIEx0ZDAeFw0wMD..TUwMTZaFw0wMTAy
    #     ...
    #     -----END CERTIFICATE-----
    #
    # @return [String]
    attr_accessor :ca_certificate

    # **[Required]** A friendly name for the certificate bundle. It must be unique and it cannot be changed.
    # Valid certificate bundle names include only alphanumeric characters, dashes, and underscores.
    # Certificate bundle names cannot contain spaces. Avoid entering confidential information.
    #
    # Example: `example_certificate_bundle`
    #
    # @return [String]
    attr_accessor :certificate_name

    # A passphrase for encrypted private keys. This is needed only if you created your certificate with a passphrase.
    #
    # @return [String]
    attr_accessor :passphrase

    # The SSL private key for your certificate, in PEM format.
    #
    # Example:
    #
    #     -----BEGIN RSA PRIVATE KEY-----
    #     jO1O1v2ftXMsawM90tnXwc6xhOAT1gDBC9S8DKeca..JZNUgYYwNS0dP2UK
    #     tmyN+XqVcAKw4HqVmChXy5b5msu8eIq3uc2NqNVtR..2ksSLukP8pxXcHyb
    #     +sEwvM4uf8qbnHAqwnOnP9+KV9vds6BaH1eRA4CHz..n+NVZlzBsTxTlS16
    #     /Umr7wJzVrMqK5sDiSu4WuaaBdqMGfL5hLsTjcBFD..Da2iyQmSKuVD4lIZ
    #     ...
    #     -----END RSA PRIVATE KEY-----
    #
    # @return [String]
    attr_accessor :private_key

    # The public certificate, in PEM format, that you received from your SSL certificate provider.
    #
    # Example:
    #
    #     -----BEGIN CERTIFICATE-----
    #     MIIC2jCCAkMCAg38MA0GCSqGSIb3DQEBBQUAMIGbMQswCQYDVQQGEwJKUDEOMAwG
    #     A1UECBMFVG9reW8xEDAOBgNVBAcTB0NodW8ta3UxETAPBgNVBAoTCEZyYW5rNERE
    #     MRgwFgYDVQQLEw9XZWJDZXJ0IFN1cHBvcnQxGDAWBgNVBAMTD0ZyYW5rNEREIFdl
    #     YiBDQTEjMCEGCSqGSIb3DQEJARYUc3VwcG9ydEBmcmFuazRkZC5jb20wHhcNMTIw
    #     ...
    #     -----END CERTIFICATE-----
    #
    # @return [String]
    attr_accessor :public_certificate

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'ca_certificate': :'caCertificate',
        'certificate_name': :'certificateName',
        'passphrase': :'passphrase',
        'private_key': :'privateKey',
        'public_certificate': :'publicCertificate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'ca_certificate': :'String',
        'certificate_name': :'String',
        'passphrase': :'String',
        'private_key': :'String',
        'public_certificate': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :ca_certificate The value to assign to the {#ca_certificate} property
    # @option attributes [String] :certificate_name The value to assign to the {#certificate_name} property
    # @option attributes [String] :passphrase The value to assign to the {#passphrase} property
    # @option attributes [String] :private_key The value to assign to the {#private_key} property
    # @option attributes [String] :public_certificate The value to assign to the {#public_certificate} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.ca_certificate = attributes[:'caCertificate'] if attributes[:'caCertificate']

      raise 'You cannot provide both :caCertificate and :ca_certificate' if attributes.key?(:'caCertificate') && attributes.key?(:'ca_certificate')

      self.ca_certificate = attributes[:'ca_certificate'] if attributes[:'ca_certificate']

      self.certificate_name = attributes[:'certificateName'] if attributes[:'certificateName']

      raise 'You cannot provide both :certificateName and :certificate_name' if attributes.key?(:'certificateName') && attributes.key?(:'certificate_name')

      self.certificate_name = attributes[:'certificate_name'] if attributes[:'certificate_name']

      self.passphrase = attributes[:'passphrase'] if attributes[:'passphrase']

      self.private_key = attributes[:'privateKey'] if attributes[:'privateKey']

      raise 'You cannot provide both :privateKey and :private_key' if attributes.key?(:'privateKey') && attributes.key?(:'private_key')

      self.private_key = attributes[:'private_key'] if attributes[:'private_key']

      self.public_certificate = attributes[:'publicCertificate'] if attributes[:'publicCertificate']

      raise 'You cannot provide both :publicCertificate and :public_certificate' if attributes.key?(:'publicCertificate') && attributes.key?(:'public_certificate')

      self.public_certificate = attributes[:'public_certificate'] if attributes[:'public_certificate']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        ca_certificate == other.ca_certificate &&
        certificate_name == other.certificate_name &&
        passphrase == other.passphrase &&
        private_key == other.private_key &&
        public_certificate == other.public_certificate
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
      [ca_certificate, certificate_name, passphrase, private_key, public_certificate].hash
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
