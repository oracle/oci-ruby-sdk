# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'identity_provider'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A special type of {IdentityProvider} that
  # supports the SAML 2.0 protocol. For more information, see
  # [Identity Providers and Federation](https://docs.cloud.oracle.com/Content/Identity/Concepts/federation.htm).
  #
  class Identity::Models::Saml2IdentityProvider < Identity::Models::IdentityProvider
    # **[Required]** The URL for retrieving the identity provider's metadata, which
    # contains information required for federating.
    #
    # @return [String]
    attr_accessor :metadata_url

    # **[Required]** The identity provider's signing certificate used by the IAM Service
    # to validate the SAML2 token.
    #
    # @return [String]
    attr_accessor :signing_certificate

    # **[Required]** The URL to redirect federated users to for authentication with the
    # identity provider.
    #
    # @return [String]
    attr_accessor :redirect_url

    # Extra name value pairs associated with this identity provider.
    # Example: `{\"clientId\": \"app_sf3kdjf3\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_attributes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'description': :'description',
        'product_type': :'productType',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'inactive_status': :'inactiveStatus',
        'protocol': :'protocol',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'metadata_url': :'metadataUrl',
        'signing_certificate': :'signingCertificate',
        'redirect_url': :'redirectUrl',
        'freeform_attributes': :'freeformAttributes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'name': :'String',
        'description': :'String',
        'product_type': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'inactive_status': :'Integer',
        'protocol': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'metadata_url': :'String',
        'signing_certificate': :'String',
        'redirect_url': :'String',
        'freeform_attributes': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Identity::Models::IdentityProvider#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Identity::Models::IdentityProvider#compartment_id #compartment_id} proprety
    # @option attributes [String] :name The value to assign to the {OCI::Identity::Models::IdentityProvider#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Identity::Models::IdentityProvider#description #description} proprety
    # @option attributes [String] :product_type The value to assign to the {OCI::Identity::Models::IdentityProvider#product_type #product_type} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Identity::Models::IdentityProvider#time_created #time_created} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Identity::Models::IdentityProvider#lifecycle_state #lifecycle_state} proprety
    # @option attributes [Integer] :inactive_status The value to assign to the {OCI::Identity::Models::IdentityProvider#inactive_status #inactive_status} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Identity::Models::IdentityProvider#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Identity::Models::IdentityProvider#defined_tags #defined_tags} proprety
    # @option attributes [String] :metadata_url The value to assign to the {#metadata_url} property
    # @option attributes [String] :signing_certificate The value to assign to the {#signing_certificate} property
    # @option attributes [String] :redirect_url The value to assign to the {#redirect_url} property
    # @option attributes [Hash<String, String>] :freeform_attributes The value to assign to the {#freeform_attributes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['protocol'] = 'SAML2'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.metadata_url = attributes[:'metadataUrl'] if attributes[:'metadataUrl']

      raise 'You cannot provide both :metadataUrl and :metadata_url' if attributes.key?(:'metadataUrl') && attributes.key?(:'metadata_url')

      self.metadata_url = attributes[:'metadata_url'] if attributes[:'metadata_url']

      self.signing_certificate = attributes[:'signingCertificate'] if attributes[:'signingCertificate']

      raise 'You cannot provide both :signingCertificate and :signing_certificate' if attributes.key?(:'signingCertificate') && attributes.key?(:'signing_certificate')

      self.signing_certificate = attributes[:'signing_certificate'] if attributes[:'signing_certificate']

      self.redirect_url = attributes[:'redirectUrl'] if attributes[:'redirectUrl']

      raise 'You cannot provide both :redirectUrl and :redirect_url' if attributes.key?(:'redirectUrl') && attributes.key?(:'redirect_url')

      self.redirect_url = attributes[:'redirect_url'] if attributes[:'redirect_url']

      self.freeform_attributes = attributes[:'freeformAttributes'] if attributes[:'freeformAttributes']

      raise 'You cannot provide both :freeformAttributes and :freeform_attributes' if attributes.key?(:'freeformAttributes') && attributes.key?(:'freeform_attributes')

      self.freeform_attributes = attributes[:'freeform_attributes'] if attributes[:'freeform_attributes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        name == other.name &&
        description == other.description &&
        product_type == other.product_type &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        inactive_status == other.inactive_status &&
        protocol == other.protocol &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        metadata_url == other.metadata_url &&
        signing_certificate == other.signing_certificate &&
        redirect_url == other.redirect_url &&
        freeform_attributes == other.freeform_attributes
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
      [id, compartment_id, name, description, product_type, time_created, lifecycle_state, inactive_status, protocol, freeform_tags, defined_tags, metadata_url, signing_certificate, redirect_url, freeform_attributes].hash
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
