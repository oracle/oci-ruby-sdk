# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create a Database Connection resource.
  #
  class DatabaseMigration::Models::CreateConnectionDetails
    DATABASE_TYPE_ENUM = [
      DATABASE_TYPE_MANUAL = 'MANUAL'.freeze,
      DATABASE_TYPE_AUTONOMOUS = 'AUTONOMOUS'.freeze,
      DATABASE_TYPE_USER_MANAGED_OCI = 'USER_MANAGED_OCI'.freeze
    ].freeze

    MANUAL_DATABASE_SUB_TYPE_ENUM = [
      MANUAL_DATABASE_SUB_TYPE_ORACLE = 'ORACLE'.freeze,
      MANUAL_DATABASE_SUB_TYPE_RDS_ORACLE = 'RDS_ORACLE'.freeze
    ].freeze

    # **[Required]** OCID of the compartment
    #
    # @return [String]
    attr_accessor :compartment_id

    # Database Connection display name identifier.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Database connection type.
    #
    # @return [String]
    attr_reader :database_type

    # Database manual connection subtype. This value can only be specified for manual connections.
    #
    # @return [String]
    attr_reader :manual_database_sub_type

    # The OCID of the cloud database. Required if the database connection type is Autonomous.
    #
    # @return [String]
    attr_accessor :database_id

    # @return [OCI::DatabaseMigration::Models::CreateConnectDescriptor]
    attr_accessor :connect_descriptor

    # This name is the distinguished name used while creating the certificate on target database. Requires a TLS wallet to be specified.
    # Not required for source container database connections.
    #
    # @return [String]
    attr_accessor :certificate_tdn

    # cwallet.sso containing containing the TCPS/SSL certificate; base64 encoded String. Not required for source container database connections.
    #
    # @return [String]
    attr_accessor :tls_wallet

    # keystore.jks file contents; base64 encoded String. Requires a TLS wallet to be specified. Not required for source container database connections.
    #
    # @return [String]
    attr_accessor :tls_keystore

    # @return [OCI::DatabaseMigration::Models::CreateSshDetails]
    attr_accessor :ssh_details

    # This attribute is required.
    # @return [OCI::DatabaseMigration::Models::CreateAdminCredentials]
    attr_accessor :admin_credentials

    # @return [OCI::DatabaseMigration::Models::CreatePrivateEndpoint]
    attr_accessor :private_endpoint

    # This attribute is required.
    # @return [OCI::DatabaseMigration::Models::CreateVaultDetails]
    attr_accessor :vault_details

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
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'database_type': :'databaseType',
        'manual_database_sub_type': :'manualDatabaseSubType',
        'database_id': :'databaseId',
        'connect_descriptor': :'connectDescriptor',
        'certificate_tdn': :'certificateTdn',
        'tls_wallet': :'tlsWallet',
        'tls_keystore': :'tlsKeystore',
        'ssh_details': :'sshDetails',
        'admin_credentials': :'adminCredentials',
        'private_endpoint': :'privateEndpoint',
        'vault_details': :'vaultDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'database_type': :'String',
        'manual_database_sub_type': :'String',
        'database_id': :'String',
        'connect_descriptor': :'OCI::DatabaseMigration::Models::CreateConnectDescriptor',
        'certificate_tdn': :'String',
        'tls_wallet': :'String',
        'tls_keystore': :'String',
        'ssh_details': :'OCI::DatabaseMigration::Models::CreateSshDetails',
        'admin_credentials': :'OCI::DatabaseMigration::Models::CreateAdminCredentials',
        'private_endpoint': :'OCI::DatabaseMigration::Models::CreatePrivateEndpoint',
        'vault_details': :'OCI::DatabaseMigration::Models::CreateVaultDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :manual_database_sub_type The value to assign to the {#manual_database_sub_type} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateConnectDescriptor] :connect_descriptor The value to assign to the {#connect_descriptor} property
    # @option attributes [String] :certificate_tdn The value to assign to the {#certificate_tdn} property
    # @option attributes [String] :tls_wallet The value to assign to the {#tls_wallet} property
    # @option attributes [String] :tls_keystore The value to assign to the {#tls_keystore} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateSshDetails] :ssh_details The value to assign to the {#ssh_details} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateAdminCredentials] :admin_credentials The value to assign to the {#admin_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::CreatePrivateEndpoint] :private_endpoint The value to assign to the {#private_endpoint} property
    # @option attributes [OCI::DatabaseMigration::Models::CreateVaultDetails] :vault_details The value to assign to the {#vault_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.manual_database_sub_type = attributes[:'manualDatabaseSubType'] if attributes[:'manualDatabaseSubType']
      self.manual_database_sub_type = "ORACLE" if manual_database_sub_type.nil? && !attributes.key?(:'manualDatabaseSubType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :manualDatabaseSubType and :manual_database_sub_type' if attributes.key?(:'manualDatabaseSubType') && attributes.key?(:'manual_database_sub_type')

      self.manual_database_sub_type = attributes[:'manual_database_sub_type'] if attributes[:'manual_database_sub_type']
      self.manual_database_sub_type = "ORACLE" if manual_database_sub_type.nil? && !attributes.key?(:'manualDatabaseSubType') && !attributes.key?(:'manual_database_sub_type') # rubocop:disable Style/StringLiterals

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.connect_descriptor = attributes[:'connectDescriptor'] if attributes[:'connectDescriptor']

      raise 'You cannot provide both :connectDescriptor and :connect_descriptor' if attributes.key?(:'connectDescriptor') && attributes.key?(:'connect_descriptor')

      self.connect_descriptor = attributes[:'connect_descriptor'] if attributes[:'connect_descriptor']

      self.certificate_tdn = attributes[:'certificateTdn'] if attributes[:'certificateTdn']

      raise 'You cannot provide both :certificateTdn and :certificate_tdn' if attributes.key?(:'certificateTdn') && attributes.key?(:'certificate_tdn')

      self.certificate_tdn = attributes[:'certificate_tdn'] if attributes[:'certificate_tdn']

      self.tls_wallet = attributes[:'tlsWallet'] if attributes[:'tlsWallet']

      raise 'You cannot provide both :tlsWallet and :tls_wallet' if attributes.key?(:'tlsWallet') && attributes.key?(:'tls_wallet')

      self.tls_wallet = attributes[:'tls_wallet'] if attributes[:'tls_wallet']

      self.tls_keystore = attributes[:'tlsKeystore'] if attributes[:'tlsKeystore']

      raise 'You cannot provide both :tlsKeystore and :tls_keystore' if attributes.key?(:'tlsKeystore') && attributes.key?(:'tls_keystore')

      self.tls_keystore = attributes[:'tls_keystore'] if attributes[:'tls_keystore']

      self.ssh_details = attributes[:'sshDetails'] if attributes[:'sshDetails']

      raise 'You cannot provide both :sshDetails and :ssh_details' if attributes.key?(:'sshDetails') && attributes.key?(:'ssh_details')

      self.ssh_details = attributes[:'ssh_details'] if attributes[:'ssh_details']

      self.admin_credentials = attributes[:'adminCredentials'] if attributes[:'adminCredentials']

      raise 'You cannot provide both :adminCredentials and :admin_credentials' if attributes.key?(:'adminCredentials') && attributes.key?(:'admin_credentials')

      self.admin_credentials = attributes[:'admin_credentials'] if attributes[:'admin_credentials']

      self.private_endpoint = attributes[:'privateEndpoint'] if attributes[:'privateEndpoint']

      raise 'You cannot provide both :privateEndpoint and :private_endpoint' if attributes.key?(:'privateEndpoint') && attributes.key?(:'private_endpoint')

      self.private_endpoint = attributes[:'private_endpoint'] if attributes[:'private_endpoint']

      self.vault_details = attributes[:'vaultDetails'] if attributes[:'vaultDetails']

      raise 'You cannot provide both :vaultDetails and :vault_details' if attributes.key?(:'vaultDetails') && attributes.key?(:'vault_details')

      self.vault_details = attributes[:'vault_details'] if attributes[:'vault_details']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_type Object to be assigned
    def database_type=(database_type)
      raise "Invalid value for 'database_type': this must be one of the values in DATABASE_TYPE_ENUM." if database_type && !DATABASE_TYPE_ENUM.include?(database_type)

      @database_type = database_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] manual_database_sub_type Object to be assigned
    def manual_database_sub_type=(manual_database_sub_type)
      raise "Invalid value for 'manual_database_sub_type': this must be one of the values in MANUAL_DATABASE_SUB_TYPE_ENUM." if manual_database_sub_type && !MANUAL_DATABASE_SUB_TYPE_ENUM.include?(manual_database_sub_type)

      @manual_database_sub_type = manual_database_sub_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        database_type == other.database_type &&
        manual_database_sub_type == other.manual_database_sub_type &&
        database_id == other.database_id &&
        connect_descriptor == other.connect_descriptor &&
        certificate_tdn == other.certificate_tdn &&
        tls_wallet == other.tls_wallet &&
        tls_keystore == other.tls_keystore &&
        ssh_details == other.ssh_details &&
        admin_credentials == other.admin_credentials &&
        private_endpoint == other.private_endpoint &&
        vault_details == other.vault_details &&
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
      [compartment_id, display_name, database_type, manual_database_sub_type, database_id, connect_descriptor, certificate_tdn, tls_wallet, tls_keystore, ssh_details, admin_credentials, private_endpoint, vault_details, freeform_tags, defined_tags].hash
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
