# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'create_data_guard_association_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for creating a Data Guard association for a bare metal DB system or virtual machine DB system database. A new DB system will be launched to create the standby database.
  #
  # **NOTE** - You must use this subtype to create a Data Guard association for a database in a virtual machine DB system.
  #
  class Database::Models::CreateDataGuardAssociationWithNewDbSystemDetails < Database::Models::CreateDataGuardAssociationDetails
    # The user-friendly name of the DB system that will contain the the standby database. The display name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The name of the availability domain that the standby database DB system will be located in. For example- \"Uocm:PHX-AD-1\".
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the subnet the DB system is associated with.
    # **Subnet Restrictions:**
    # - For 1- and 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.16.16/28
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this DB system belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that the backup network of this DB system belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm). Applicable only to Exadata DB systems.
    #
    # @return [Array<String>]
    attr_accessor :backup_network_nsg_ids

    # The hostname for the DB node.
    # @return [String]
    attr_accessor :hostname

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_admin_password': :'databaseAdminPassword',
        'protection_mode': :'protectionMode',
        'transport_type': :'transportType',
        'creation_type': :'creationType',
        'display_name': :'displayName',
        'availability_domain': :'availabilityDomain',
        'subnet_id': :'subnetId',
        'nsg_ids': :'nsgIds',
        'backup_network_nsg_ids': :'backupNetworkNsgIds',
        'hostname': :'hostname'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_admin_password': :'String',
        'protection_mode': :'String',
        'transport_type': :'String',
        'creation_type': :'String',
        'display_name': :'String',
        'availability_domain': :'String',
        'subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'backup_network_nsg_ids': :'Array<String>',
        'hostname': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :database_admin_password The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#database_admin_password #database_admin_password} proprety
    # @option attributes [String] :protection_mode The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#protection_mode #protection_mode} proprety
    # @option attributes [String] :transport_type The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#transport_type #transport_type} proprety
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [Array<String>] :backup_network_nsg_ids The value to assign to the {#backup_network_nsg_ids} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['creationType'] = 'NewDbSystem'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.backup_network_nsg_ids = attributes[:'backupNetworkNsgIds'] if attributes[:'backupNetworkNsgIds']

      raise 'You cannot provide both :backupNetworkNsgIds and :backup_network_nsg_ids' if attributes.key?(:'backupNetworkNsgIds') && attributes.key?(:'backup_network_nsg_ids')

      self.backup_network_nsg_ids = attributes[:'backup_network_nsg_ids'] if attributes[:'backup_network_nsg_ids']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        database_admin_password == other.database_admin_password &&
        protection_mode == other.protection_mode &&
        transport_type == other.transport_type &&
        creation_type == other.creation_type &&
        display_name == other.display_name &&
        availability_domain == other.availability_domain &&
        subnet_id == other.subnet_id &&
        nsg_ids == other.nsg_ids &&
        backup_network_nsg_ids == other.backup_network_nsg_ids &&
        hostname == other.hostname
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
      [database_admin_password, protection_mode, transport_type, creation_type, display_name, availability_domain, subnet_id, nsg_ids, backup_network_nsg_ids, hostname].hash
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
