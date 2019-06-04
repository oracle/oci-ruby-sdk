# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The load balancer's SSL handling configuration details.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class LoadBalancer::Models::SSLConfigurationDetails
    # **[Required]** A friendly name for the certificate bundle. It must be unique and it cannot be changed.
    # Valid certificate bundle names include only alphanumeric characters, dashes, and underscores.
    # Certificate bundle names cannot contain spaces. Avoid entering confidential information.
    #
    # Example: `example_certificate_bundle`
    #
    # @return [String]
    attr_accessor :certificate_name

    # Whether the load balancer listener should verify peer certificates.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :verify_peer_certificate

    # The maximum depth for peer certificate chain verification.
    #
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :verify_depth

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_name': :'certificateName',
        'verify_peer_certificate': :'verifyPeerCertificate',
        'verify_depth': :'verifyDepth'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_name': :'String',
        'verify_peer_certificate': :'BOOLEAN',
        'verify_depth': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :certificate_name The value to assign to the {#certificate_name} property
    # @option attributes [BOOLEAN] :verify_peer_certificate The value to assign to the {#verify_peer_certificate} property
    # @option attributes [Integer] :verify_depth The value to assign to the {#verify_depth} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.certificate_name = attributes[:'certificateName'] if attributes[:'certificateName']

      raise 'You cannot provide both :certificateName and :certificate_name' if attributes.key?(:'certificateName') && attributes.key?(:'certificate_name')

      self.certificate_name = attributes[:'certificate_name'] if attributes[:'certificate_name']

      self.verify_peer_certificate = attributes[:'verifyPeerCertificate'] unless attributes[:'verifyPeerCertificate'].nil?
      self.verify_peer_certificate = false if verify_peer_certificate.nil? && !attributes.key?(:'verifyPeerCertificate') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :verifyPeerCertificate and :verify_peer_certificate' if attributes.key?(:'verifyPeerCertificate') && attributes.key?(:'verify_peer_certificate')

      self.verify_peer_certificate = attributes[:'verify_peer_certificate'] unless attributes[:'verify_peer_certificate'].nil?
      self.verify_peer_certificate = false if verify_peer_certificate.nil? && !attributes.key?(:'verifyPeerCertificate') && !attributes.key?(:'verify_peer_certificate') # rubocop:disable Style/StringLiterals

      self.verify_depth = attributes[:'verifyDepth'] if attributes[:'verifyDepth']

      raise 'You cannot provide both :verifyDepth and :verify_depth' if attributes.key?(:'verifyDepth') && attributes.key?(:'verify_depth')

      self.verify_depth = attributes[:'verify_depth'] if attributes[:'verify_depth']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        certificate_name == other.certificate_name &&
        verify_peer_certificate == other.verify_peer_certificate &&
        verify_depth == other.verify_depth
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
      [certificate_name, verify_peer_certificate, verify_depth].hash
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
