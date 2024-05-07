# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metadata required to import wallet to deployment
  #
  class GoldenGate::Models::ImportDeploymentWalletDetails
    # **[Required]** Refers to the customer's vault OCID.
    # If provided, it references a vault where GoldenGate can manage secrets. Customers must add policies to permit GoldenGate
    # to manage secrets contained within this vault.
    #
    # @return [String]
    attr_accessor :vault_id

    # **[Required]** The OCID of the customer's GoldenGate Service Secret.
    # If provided, it references a key that customers will be required to ensure the policies are established
    # to permit GoldenGate to use this Secret.
    #
    # @return [String]
    attr_accessor :new_wallet_secret_id

    # Name of the secret with which secret is shown in vault
    # @return [String]
    attr_accessor :wallet_backup_secret_name

    # Refers to the customer's master key OCID.
    # If provided, it references a key to manage secrets. Customers must add policies to permit GoldenGate to use this key.
    #
    # @return [String]
    attr_accessor :master_encryption_key_id

    # Metadata about this specific object.
    #
    # @return [String]
    attr_accessor :description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'vault_id': :'vaultId',
        'new_wallet_secret_id': :'newWalletSecretId',
        'wallet_backup_secret_name': :'walletBackupSecretName',
        'master_encryption_key_id': :'masterEncryptionKeyId',
        'description': :'description'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'vault_id': :'String',
        'new_wallet_secret_id': :'String',
        'wallet_backup_secret_name': :'String',
        'master_encryption_key_id': :'String',
        'description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :new_wallet_secret_id The value to assign to the {#new_wallet_secret_id} property
    # @option attributes [String] :wallet_backup_secret_name The value to assign to the {#wallet_backup_secret_name} property
    # @option attributes [String] :master_encryption_key_id The value to assign to the {#master_encryption_key_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.new_wallet_secret_id = attributes[:'newWalletSecretId'] if attributes[:'newWalletSecretId']

      raise 'You cannot provide both :newWalletSecretId and :new_wallet_secret_id' if attributes.key?(:'newWalletSecretId') && attributes.key?(:'new_wallet_secret_id')

      self.new_wallet_secret_id = attributes[:'new_wallet_secret_id'] if attributes[:'new_wallet_secret_id']

      self.wallet_backup_secret_name = attributes[:'walletBackupSecretName'] if attributes[:'walletBackupSecretName']

      raise 'You cannot provide both :walletBackupSecretName and :wallet_backup_secret_name' if attributes.key?(:'walletBackupSecretName') && attributes.key?(:'wallet_backup_secret_name')

      self.wallet_backup_secret_name = attributes[:'wallet_backup_secret_name'] if attributes[:'wallet_backup_secret_name']

      self.master_encryption_key_id = attributes[:'masterEncryptionKeyId'] if attributes[:'masterEncryptionKeyId']

      raise 'You cannot provide both :masterEncryptionKeyId and :master_encryption_key_id' if attributes.key?(:'masterEncryptionKeyId') && attributes.key?(:'master_encryption_key_id')

      self.master_encryption_key_id = attributes[:'master_encryption_key_id'] if attributes[:'master_encryption_key_id']

      self.description = attributes[:'description'] if attributes[:'description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        vault_id == other.vault_id &&
        new_wallet_secret_id == other.new_wallet_secret_id &&
        wallet_backup_secret_name == other.wallet_backup_secret_name &&
        master_encryption_key_id == other.master_encryption_key_id &&
        description == other.description
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
      [vault_id, new_wallet_secret_id, wallet_backup_secret_name, master_encryption_key_id, description].hash
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
