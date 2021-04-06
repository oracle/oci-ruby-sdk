# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Blockchain Platform details for creating a new service.
  class Blockchain::Models::CreateBlockchainPlatformDetails
    # **[Required]** Platform Instance Display name, can be renamed
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Compartment Identifier
    # @return [String]
    attr_accessor :compartment_id

    # Platform Instance Description
    # @return [String]
    attr_accessor :description

    # **[Required]** Role of platform - founder or participant
    # @return [String]
    attr_accessor :platform_role

    # **[Required]** Compute shape - STANDARD or ENTERPRISE_SMALL or ENTERPRISE_MEDIUM or ENTERPRISE_LARGE or ENTERPRISE_EXTRA_LARGE
    # @return [String]
    attr_accessor :compute_shape

    # Bring your own license
    # @return [BOOLEAN]
    attr_accessor :is_byol

    # **[Required]** IDCS access token with Identity Domain Administrator role
    # @return [String]
    attr_accessor :idcs_access_token

    # Identifier for a federated user
    # @return [String]
    attr_accessor :federated_user_id

    # Base64 encoded text in ASCII character set of a Thirdparty CA Certificates archive file.
    # The Archive file is a zip file containing third part CA Certificates,
    # the ca key and certificate files used when issuing enrollment certificates
    # (ECerts) and transaction certificates (TCerts). The chainfile (if it exists)
    # contains the certificate chain which should be trusted for this CA, where
    # the 1st in the chain is always the root CA certificate.
    # File list in zip file [ca-cert.pem,ca-key.pem,ca-chain.pem(optional)].
    #
    # @return [String]
    attr_accessor :ca_cert_archive_text

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'description': :'description',
        'platform_role': :'platformRole',
        'compute_shape': :'computeShape',
        'is_byol': :'isByol',
        'idcs_access_token': :'idcsAccessToken',
        'federated_user_id': :'federatedUserId',
        'ca_cert_archive_text': :'caCertArchiveText',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'compartment_id': :'String',
        'description': :'String',
        'platform_role': :'String',
        'compute_shape': :'String',
        'is_byol': :'BOOLEAN',
        'idcs_access_token': :'String',
        'federated_user_id': :'String',
        'ca_cert_archive_text': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :platform_role The value to assign to the {#platform_role} property
    # @option attributes [String] :compute_shape The value to assign to the {#compute_shape} property
    # @option attributes [BOOLEAN] :is_byol The value to assign to the {#is_byol} property
    # @option attributes [String] :idcs_access_token The value to assign to the {#idcs_access_token} property
    # @option attributes [String] :federated_user_id The value to assign to the {#federated_user_id} property
    # @option attributes [String] :ca_cert_archive_text The value to assign to the {#ca_cert_archive_text} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.platform_role = attributes[:'platformRole'] if attributes[:'platformRole']

      raise 'You cannot provide both :platformRole and :platform_role' if attributes.key?(:'platformRole') && attributes.key?(:'platform_role')

      self.platform_role = attributes[:'platform_role'] if attributes[:'platform_role']

      self.compute_shape = attributes[:'computeShape'] if attributes[:'computeShape']

      raise 'You cannot provide both :computeShape and :compute_shape' if attributes.key?(:'computeShape') && attributes.key?(:'compute_shape')

      self.compute_shape = attributes[:'compute_shape'] if attributes[:'compute_shape']

      self.is_byol = attributes[:'isByol'] unless attributes[:'isByol'].nil?
      self.is_byol = false if is_byol.nil? && !attributes.key?(:'isByol') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isByol and :is_byol' if attributes.key?(:'isByol') && attributes.key?(:'is_byol')

      self.is_byol = attributes[:'is_byol'] unless attributes[:'is_byol'].nil?
      self.is_byol = false if is_byol.nil? && !attributes.key?(:'isByol') && !attributes.key?(:'is_byol') # rubocop:disable Style/StringLiterals

      self.idcs_access_token = attributes[:'idcsAccessToken'] if attributes[:'idcsAccessToken']

      raise 'You cannot provide both :idcsAccessToken and :idcs_access_token' if attributes.key?(:'idcsAccessToken') && attributes.key?(:'idcs_access_token')

      self.idcs_access_token = attributes[:'idcs_access_token'] if attributes[:'idcs_access_token']

      self.federated_user_id = attributes[:'federatedUserId'] if attributes[:'federatedUserId']

      raise 'You cannot provide both :federatedUserId and :federated_user_id' if attributes.key?(:'federatedUserId') && attributes.key?(:'federated_user_id')

      self.federated_user_id = attributes[:'federated_user_id'] if attributes[:'federated_user_id']

      self.ca_cert_archive_text = attributes[:'caCertArchiveText'] if attributes[:'caCertArchiveText']

      raise 'You cannot provide both :caCertArchiveText and :ca_cert_archive_text' if attributes.key?(:'caCertArchiveText') && attributes.key?(:'ca_cert_archive_text')

      self.ca_cert_archive_text = attributes[:'ca_cert_archive_text'] if attributes[:'ca_cert_archive_text']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        description == other.description &&
        platform_role == other.platform_role &&
        compute_shape == other.compute_shape &&
        is_byol == other.is_byol &&
        idcs_access_token == other.idcs_access_token &&
        federated_user_id == other.federated_user_id &&
        ca_cert_archive_text == other.ca_cert_archive_text &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [display_name, compartment_id, description, platform_role, compute_shape, is_byol, idcs_access_token, federated_user_id, ca_cert_archive_text, freeform_tags, defined_tags].hash
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
