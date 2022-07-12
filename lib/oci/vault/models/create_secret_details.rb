# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the secret that you want to create.
  class Vault::Models::CreateSecretDetails
    # **[Required]** The OCID of the compartment where you want to create the secret.
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A brief description of the secret. Avoid entering confidential information.
    # @return [String]
    attr_accessor :description

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The OCID of the master encryption key that is used to encrypt the secret. You must specify a symmetric key to encrypt the secret during import to the vault. You cannot encrypt secrets with asymmetric keys. Furthermore, the key must exist in the vault that you specify.
    #
    # @return [String]
    attr_accessor :key_id

    # Additional metadata that you can use to provide context about how to use the secret during rotation or
    # other administrative tasks. For example, for a secret that you use to connect to a database, the additional
    # metadata might specify the connection endpoint and the connection string. Provide additional metadata as key-value pairs.
    #
    # @return [Hash<String, Object>]
    attr_accessor :metadata

    # This attribute is required.
    # @return [OCI::Vault::Models::SecretContentDetails]
    attr_accessor :secret_content

    # **[Required]** A user-friendly name for the secret. Secret names should be unique within a vault. Avoid entering confidential information. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods.
    #
    # @return [String]
    attr_accessor :secret_name

    # A list of rules to control how the secret is used and managed.
    # @return [Array<OCI::Vault::Models::SecretRule>]
    attr_accessor :secret_rules

    # **[Required]** The OCID of the vault where you want to create the secret.
    # @return [String]
    attr_accessor :vault_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'description': :'description',
        'freeform_tags': :'freeformTags',
        'key_id': :'keyId',
        'metadata': :'metadata',
        'secret_content': :'secretContent',
        'secret_name': :'secretName',
        'secret_rules': :'secretRules',
        'vault_id': :'vaultId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'description': :'String',
        'freeform_tags': :'Hash<String, String>',
        'key_id': :'String',
        'metadata': :'Hash<String, Object>',
        'secret_content': :'OCI::Vault::Models::SecretContentDetails',
        'secret_name': :'String',
        'secret_rules': :'Array<OCI::Vault::Models::SecretRule>',
        'vault_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [Hash<String, Object>] :metadata The value to assign to the {#metadata} property
    # @option attributes [OCI::Vault::Models::SecretContentDetails] :secret_content The value to assign to the {#secret_content} property
    # @option attributes [String] :secret_name The value to assign to the {#secret_name} property
    # @option attributes [Array<OCI::Vault::Models::SecretRule>] :secret_rules The value to assign to the {#secret_rules} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.description = attributes[:'description'] if attributes[:'description']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.secret_content = attributes[:'secretContent'] if attributes[:'secretContent']

      raise 'You cannot provide both :secretContent and :secret_content' if attributes.key?(:'secretContent') && attributes.key?(:'secret_content')

      self.secret_content = attributes[:'secret_content'] if attributes[:'secret_content']

      self.secret_name = attributes[:'secretName'] if attributes[:'secretName']

      raise 'You cannot provide both :secretName and :secret_name' if attributes.key?(:'secretName') && attributes.key?(:'secret_name')

      self.secret_name = attributes[:'secret_name'] if attributes[:'secret_name']

      self.secret_rules = attributes[:'secretRules'] if attributes[:'secretRules']

      raise 'You cannot provide both :secretRules and :secret_rules' if attributes.key?(:'secretRules') && attributes.key?(:'secret_rules')

      self.secret_rules = attributes[:'secret_rules'] if attributes[:'secret_rules']

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        description == other.description &&
        freeform_tags == other.freeform_tags &&
        key_id == other.key_id &&
        metadata == other.metadata &&
        secret_content == other.secret_content &&
        secret_name == other.secret_name &&
        secret_rules == other.secret_rules &&
        vault_id == other.vault_id
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
      [compartment_id, defined_tags, description, freeform_tags, key_id, metadata, secret_content, secret_name, secret_rules, vault_id].hash
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
