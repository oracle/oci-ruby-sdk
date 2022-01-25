# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Database Connection resource used for migrations.
  #
  class DatabaseMigration::Models::Connection
    DATABASE_TYPE_ENUM = [
      DATABASE_TYPE_MANUAL = 'MANUAL'.freeze,
      DATABASE_TYPE_AUTONOMOUS = 'AUTONOMOUS'.freeze,
      DATABASE_TYPE_USER_MANAGED_OCI = 'USER_MANAGED_OCI'.freeze,
      DATABASE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the resource
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** OCID of the compartment
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Database connection type.
    #
    # @return [String]
    attr_reader :database_type

    # **[Required]** Database Connection display name identifier.
    #
    # @return [String]
    attr_accessor :display_name

    # The OCID of the cloud database.
    #
    # @return [String]
    attr_accessor :database_id

    # @return [OCI::DatabaseMigration::Models::ConnectDescriptor]
    attr_accessor :connect_descriptor

    # OCID of the Secret in the OCI vault containing the Database Connection credentials.
    #
    # @return [String]
    attr_accessor :credentials_secret_id

    # This name is the distinguished name used while creating the certificate on target database.
    #
    # @return [String]
    attr_accessor :certificate_tdn

    # @return [OCI::DatabaseMigration::Models::SshDetails]
    attr_accessor :ssh_details

    # @return [OCI::DatabaseMigration::Models::AdminCredentials]
    attr_accessor :admin_credentials

    # @return [OCI::DatabaseMigration::Models::PrivateEndpointDetails]
    attr_accessor :private_endpoint

    # @return [OCI::DatabaseMigration::Models::VaultDetails]
    attr_accessor :vault_details

    # **[Required]** The current state of the Connection resource.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information
    # for a resource in Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The time the Connection resource was created. An RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time of the last Connection resource details update. An RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

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

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'database_type': :'databaseType',
        'display_name': :'displayName',
        'database_id': :'databaseId',
        'connect_descriptor': :'connectDescriptor',
        'credentials_secret_id': :'credentialsSecretId',
        'certificate_tdn': :'certificateTdn',
        'ssh_details': :'sshDetails',
        'admin_credentials': :'adminCredentials',
        'private_endpoint': :'privateEndpoint',
        'vault_details': :'vaultDetails',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'database_type': :'String',
        'display_name': :'String',
        'database_id': :'String',
        'connect_descriptor': :'OCI::DatabaseMigration::Models::ConnectDescriptor',
        'credentials_secret_id': :'String',
        'certificate_tdn': :'String',
        'ssh_details': :'OCI::DatabaseMigration::Models::SshDetails',
        'admin_credentials': :'OCI::DatabaseMigration::Models::AdminCredentials',
        'private_endpoint': :'OCI::DatabaseMigration::Models::PrivateEndpointDetails',
        'vault_details': :'OCI::DatabaseMigration::Models::VaultDetails',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [OCI::DatabaseMigration::Models::ConnectDescriptor] :connect_descriptor The value to assign to the {#connect_descriptor} property
    # @option attributes [String] :credentials_secret_id The value to assign to the {#credentials_secret_id} property
    # @option attributes [String] :certificate_tdn The value to assign to the {#certificate_tdn} property
    # @option attributes [OCI::DatabaseMigration::Models::SshDetails] :ssh_details The value to assign to the {#ssh_details} property
    # @option attributes [OCI::DatabaseMigration::Models::AdminCredentials] :admin_credentials The value to assign to the {#admin_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::PrivateEndpointDetails] :private_endpoint The value to assign to the {#private_endpoint} property
    # @option attributes [OCI::DatabaseMigration::Models::VaultDetails] :vault_details The value to assign to the {#vault_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.connect_descriptor = attributes[:'connectDescriptor'] if attributes[:'connectDescriptor']

      raise 'You cannot provide both :connectDescriptor and :connect_descriptor' if attributes.key?(:'connectDescriptor') && attributes.key?(:'connect_descriptor')

      self.connect_descriptor = attributes[:'connect_descriptor'] if attributes[:'connect_descriptor']

      self.credentials_secret_id = attributes[:'credentialsSecretId'] if attributes[:'credentialsSecretId']

      raise 'You cannot provide both :credentialsSecretId and :credentials_secret_id' if attributes.key?(:'credentialsSecretId') && attributes.key?(:'credentials_secret_id')

      self.credentials_secret_id = attributes[:'credentials_secret_id'] if attributes[:'credentials_secret_id']

      self.certificate_tdn = attributes[:'certificateTdn'] if attributes[:'certificateTdn']

      raise 'You cannot provide both :certificateTdn and :certificate_tdn' if attributes.key?(:'certificateTdn') && attributes.key?(:'certificate_tdn')

      self.certificate_tdn = attributes[:'certificate_tdn'] if attributes[:'certificate_tdn']

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

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_type Object to be assigned
    def database_type=(database_type)
      # rubocop:disable Style/ConditionalAssignment
      if database_type && !DATABASE_TYPE_ENUM.include?(database_type)
        OCI.logger.debug("Unknown value for 'database_type' [" + database_type + "]. Mapping to 'DATABASE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_type = DATABASE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @database_type = database_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        database_type == other.database_type &&
        display_name == other.display_name &&
        database_id == other.database_id &&
        connect_descriptor == other.connect_descriptor &&
        credentials_secret_id == other.credentials_secret_id &&
        certificate_tdn == other.certificate_tdn &&
        ssh_details == other.ssh_details &&
        admin_credentials == other.admin_credentials &&
        private_endpoint == other.private_endpoint &&
        vault_details == other.vault_details &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, compartment_id, database_type, display_name, database_id, connect_descriptor, credentials_secret_id, certificate_tdn, ssh_details, admin_credentials, private_endpoint, vault_details, lifecycle_state, lifecycle_details, time_created, time_updated, freeform_tags, defined_tags, system_tags].hash
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
