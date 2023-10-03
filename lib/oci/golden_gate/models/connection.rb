# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Represents the metadata description of a connection used by deployments in the same compartment.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class GoldenGate::Models::Connection
    CONNECTION_TYPE_ENUM = [
      CONNECTION_TYPE_GOLDENGATE = 'GOLDENGATE'.freeze,
      CONNECTION_TYPE_KAFKA = 'KAFKA'.freeze,
      CONNECTION_TYPE_KAFKA_SCHEMA_REGISTRY = 'KAFKA_SCHEMA_REGISTRY'.freeze,
      CONNECTION_TYPE_MYSQL = 'MYSQL'.freeze,
      CONNECTION_TYPE_JAVA_MESSAGE_SERVICE = 'JAVA_MESSAGE_SERVICE'.freeze,
      CONNECTION_TYPE_MICROSOFT_SQLSERVER = 'MICROSOFT_SQLSERVER'.freeze,
      CONNECTION_TYPE_OCI_OBJECT_STORAGE = 'OCI_OBJECT_STORAGE'.freeze,
      CONNECTION_TYPE_ORACLE = 'ORACLE'.freeze,
      CONNECTION_TYPE_AZURE_DATA_LAKE_STORAGE = 'AZURE_DATA_LAKE_STORAGE'.freeze,
      CONNECTION_TYPE_POSTGRESQL = 'POSTGRESQL'.freeze,
      CONNECTION_TYPE_AZURE_SYNAPSE_ANALYTICS = 'AZURE_SYNAPSE_ANALYTICS'.freeze,
      CONNECTION_TYPE_SNOWFLAKE = 'SNOWFLAKE'.freeze,
      CONNECTION_TYPE_AMAZON_S3 = 'AMAZON_S3'.freeze,
      CONNECTION_TYPE_HDFS = 'HDFS'.freeze,
      CONNECTION_TYPE_ORACLE_NOSQL = 'ORACLE_NOSQL'.freeze,
      CONNECTION_TYPE_MONGODB = 'MONGODB'.freeze,
      CONNECTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The connection type.
    #
    # @return [String]
    attr_reader :connection_type

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the connection being
    # referenced.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** An object's Display Name.
    #
    # @return [String]
    attr_accessor :display_name

    # Metadata about this specific object.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment being referenced.
    #
    # @return [String]
    attr_accessor :compartment_id

    # A simple key-value pair that is applied without any predefined name, type, or scope. Exists
    # for cross-compatibility only.
    #
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Tags defined for this resource. Each key is predefined and scoped to a namespace.
    #
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The system tags associated with this resource, if any. The system tags are set by Oracle
    # Cloud Infrastructure services. Each key is predefined and scoped to namespaces.  For more
    # information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{orcl-cloud: {free-tier-retain: true}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # **[Required]** Possible lifecycle states for connection.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Describes the object's current state in detail. For example, it can be used to provide
    # actionable information for a resource in a Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The time the resource was created. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The time the resource was last updated. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Refers to the customer's vault OCID.
    # If provided, it references a vault where GoldenGate can manage secrets. Customers must add policies to permit GoldenGate
    # to manage secrets contained within this vault.
    #
    # @return [String]
    attr_accessor :vault_id

    # Refers to the customer's master key OCID.
    # If provided, it references a key to manage secrets. Customers must add policies to permit GoldenGate to use this key.
    #
    # @return [String]
    attr_accessor :key_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet being referenced.
    #
    # @return [String]
    attr_accessor :subnet_id

    # List of ingress IP addresses from where the GoldenGate deployment connects to this connection's privateIp.
    # Customers may optionally set up ingress security rules to restrict traffic from these IP addresses.
    #
    # @return [Array<OCI::GoldenGate::Models::IngressIpDetails>]
    attr_accessor :ingress_ips

    # An array of Network Security Group OCIDs used to define network access for either Deployments or Connections.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_type': :'connectionType',
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'vault_id': :'vaultId',
        'key_id': :'keyId',
        'subnet_id': :'subnetId',
        'ingress_ips': :'ingressIps',
        'nsg_ids': :'nsgIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_type': :'String',
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'vault_id': :'String',
        'key_id': :'String',
        'subnet_id': :'String',
        'ingress_ips': :'Array<OCI::GoldenGate::Models::IngressIpDetails>',
        'nsg_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'connectionType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::GoldenGate::Models::KafkaConnection' if type == 'KAFKA'
      return 'OCI::GoldenGate::Models::PostgresqlConnection' if type == 'POSTGRESQL'
      return 'OCI::GoldenGate::Models::JavaMessageServiceConnection' if type == 'JAVA_MESSAGE_SERVICE'
      return 'OCI::GoldenGate::Models::SnowflakeConnection' if type == 'SNOWFLAKE'
      return 'OCI::GoldenGate::Models::GoldenGateConnection' if type == 'GOLDENGATE'
      return 'OCI::GoldenGate::Models::MysqlConnection' if type == 'MYSQL'
      return 'OCI::GoldenGate::Models::AmazonS3Connection' if type == 'AMAZON_S3'
      return 'OCI::GoldenGate::Models::OracleConnection' if type == 'ORACLE'
      return 'OCI::GoldenGate::Models::AzureDataLakeStorageConnection' if type == 'AZURE_DATA_LAKE_STORAGE'
      return 'OCI::GoldenGate::Models::MongoDbConnection' if type == 'MONGODB'
      return 'OCI::GoldenGate::Models::HdfsConnection' if type == 'HDFS'
      return 'OCI::GoldenGate::Models::OciObjectStorageConnection' if type == 'OCI_OBJECT_STORAGE'
      return 'OCI::GoldenGate::Models::KafkaSchemaRegistryConnection' if type == 'KAFKA_SCHEMA_REGISTRY'
      return 'OCI::GoldenGate::Models::MicrosoftSqlserverConnection' if type == 'MICROSOFT_SQLSERVER'
      return 'OCI::GoldenGate::Models::OracleNosqlConnection' if type == 'ORACLE_NOSQL'
      return 'OCI::GoldenGate::Models::AzureSynapseConnection' if type == 'AZURE_SYNAPSE_ANALYTICS'

      # TODO: Log a warning when the subtype is not found.
      'OCI::GoldenGate::Models::Connection'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :connection_type The value to assign to the {#connection_type} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<OCI::GoldenGate::Models::IngressIpDetails>] :ingress_ips The value to assign to the {#ingress_ips} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.connection_type = attributes[:'connectionType'] if attributes[:'connectionType']

      raise 'You cannot provide both :connectionType and :connection_type' if attributes.key?(:'connectionType') && attributes.key?(:'connection_type')

      self.connection_type = attributes[:'connection_type'] if attributes[:'connection_type']

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

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

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.ingress_ips = attributes[:'ingressIps'] if attributes[:'ingressIps']

      raise 'You cannot provide both :ingressIps and :ingress_ips' if attributes.key?(:'ingressIps') && attributes.key?(:'ingress_ips')

      self.ingress_ips = attributes[:'ingress_ips'] if attributes[:'ingress_ips']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] connection_type Object to be assigned
    def connection_type=(connection_type)
      # rubocop:disable Style/ConditionalAssignment
      if connection_type && !CONNECTION_TYPE_ENUM.include?(connection_type)
        OCI.logger.debug("Unknown value for 'connection_type' [" + connection_type + "]. Mapping to 'CONNECTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @connection_type = CONNECTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @connection_type = connection_type
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
        connection_type == other.connection_type &&
        id == other.id &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        vault_id == other.vault_id &&
        key_id == other.key_id &&
        subnet_id == other.subnet_id &&
        ingress_ips == other.ingress_ips &&
        nsg_ids == other.nsg_ids
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
      [connection_type, id, display_name, description, compartment_id, freeform_tags, defined_tags, system_tags, lifecycle_state, lifecycle_details, time_created, time_updated, vault_id, key_id, subnet_id, ingress_ips, nsg_ids].hash
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
