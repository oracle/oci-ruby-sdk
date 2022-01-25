# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Input payload to create a vanity url.
  #
  class Analytics::Models::CreateVanityUrlDetails
    # Optional description.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** List of fully qualified hostnames supported by this vanity URL definition (max of 3).
    #
    # @return [Array<String>]
    attr_accessor :hosts

    # Passphrase for the PEM Private key (if any).
    #
    # @return [String]
    attr_accessor :passphrase

    # **[Required]** PEM Private key for HTTPS connections.
    #
    # @return [String]
    attr_accessor :private_key

    # **[Required]** PEM certificate for HTTPS connections.
    #
    # @return [String]
    attr_accessor :public_certificate

    # **[Required]** PEM CA certificate(s) for HTTPS connections. This may include multiple PEM certificates.
    #
    # @return [String]
    attr_accessor :ca_certificate

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'hosts': :'hosts',
        'passphrase': :'passphrase',
        'private_key': :'privateKey',
        'public_certificate': :'publicCertificate',
        'ca_certificate': :'caCertificate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'hosts': :'Array<String>',
        'passphrase': :'String',
        'private_key': :'String',
        'public_certificate': :'String',
        'ca_certificate': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<String>] :hosts The value to assign to the {#hosts} property
    # @option attributes [String] :passphrase The value to assign to the {#passphrase} property
    # @option attributes [String] :private_key The value to assign to the {#private_key} property
    # @option attributes [String] :public_certificate The value to assign to the {#public_certificate} property
    # @option attributes [String] :ca_certificate The value to assign to the {#ca_certificate} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.hosts = attributes[:'hosts'] if attributes[:'hosts']

      self.passphrase = attributes[:'passphrase'] if attributes[:'passphrase']

      self.private_key = attributes[:'privateKey'] if attributes[:'privateKey']

      raise 'You cannot provide both :privateKey and :private_key' if attributes.key?(:'privateKey') && attributes.key?(:'private_key')

      self.private_key = attributes[:'private_key'] if attributes[:'private_key']

      self.public_certificate = attributes[:'publicCertificate'] if attributes[:'publicCertificate']

      raise 'You cannot provide both :publicCertificate and :public_certificate' if attributes.key?(:'publicCertificate') && attributes.key?(:'public_certificate')

      self.public_certificate = attributes[:'public_certificate'] if attributes[:'public_certificate']

      self.ca_certificate = attributes[:'caCertificate'] if attributes[:'caCertificate']

      raise 'You cannot provide both :caCertificate and :ca_certificate' if attributes.key?(:'caCertificate') && attributes.key?(:'ca_certificate')

      self.ca_certificate = attributes[:'ca_certificate'] if attributes[:'ca_certificate']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        hosts == other.hosts &&
        passphrase == other.passphrase &&
        private_key == other.private_key &&
        public_certificate == other.public_certificate &&
        ca_certificate == other.ca_certificate
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
      [description, hosts, passphrase, private_key, public_certificate, ca_certificate].hash
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
