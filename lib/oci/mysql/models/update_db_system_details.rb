# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details required to update a DB System.
  #
  class Mysql::Models::UpdateDbSystemDetails
    # The user-friendly name for the DB System. It does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # User-provided data about the DB System.
    # @return [String]
    attr_accessor :description

    # The OCID of the subnet the DB System is associated with.
    #
    # @return [String]
    attr_accessor :subnet_id

    # If the policy is to enable high availability of the instance, by
    # maintaining secondary/failover capacity as necessary.
    #
    # @return [BOOLEAN]
    attr_accessor :is_highly_available

    # The availability domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance.
    #
    # In a failover scenario, the Read/Write endpoint is redirected to one of the other availability domains
    # and the MySQL instance in that domain is promoted to the primary instance.
    # This redirection does not affect the IP address of the DB System in any way.
    #
    # For a standalone DB System, this defines the availability domain in which the DB System is placed.
    #
    # @return [String]
    attr_accessor :availability_domain

    # The fault domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance.
    #
    # In a failover scenario, the Read/Write endpoint is redirected to one of the other fault domains
    # and the MySQL instance in that domain is promoted to the primary instance.
    # This redirection does not affect the IP address of the DB System in any way.
    #
    # For a standalone DB System, this defines the fault domain in which the DB System is placed.
    #
    # @return [String]
    attr_accessor :fault_domain

    # The shape of the DB System. The shape determines resources
    # allocated to the DB System - CPU cores and memory for VM
    # shapes; CPU cores, memory and storage for non-VM (or bare metal)
    # shapes. To get a list of shapes, use the
    # {#list_shapes list_shapes}
    # operation.
    #
    # Changes in Shape will result in a downtime as the MySQL DB System is
    # migrated to the new Compute instance.
    #
    # @return [String]
    attr_accessor :shape_name

    # The specific MySQL version identifier.
    # @return [String]
    attr_accessor :mysql_version

    # The OCID of the Configuration to be used for Instances in this DB System.
    # @return [String]
    attr_accessor :configuration_id

    # The username for the administrative user for the MySQL Instance.
    # @return [String]
    attr_accessor :admin_username

    # The password for the administrative user. The password must be
    # between 8 and 32 characters long, and must contain at least 1
    # numeric character, 1 lowercase character, 1 uppercase character, and
    # 1 special (nonalphanumeric) character.
    #
    # @return [String]
    attr_accessor :admin_password

    # New size of the data volume in GBs that will be created and attached.
    #
    # Increases in data storage size will happen asynchronously and will require DB System downtime.
    #
    # Decreases in data storage size are not supported.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # The hostname for the primary endpoint of the DB System. Used for DNS.
    # The value is the hostname portion of the primary private IP's fully qualified domain name (FQDN)
    # (for example, \"dbsystem-1\" in FQDN \"dbsystem-1.subnet123.vcn1.oraclevcn.com\").
    # Must be unique across all VNICs in the subnet and comply with RFC 952 and RFC 1123.
    #
    # @return [String]
    attr_accessor :hostname_label

    # The IP address the DB System should be configured to listen on the provided subnet.
    # It must be a free private IP address within the subnet's CIDR. If you don't specify a
    # value, Oracle automatically assigns a private IP address from the subnet. This should
    # be a \"dotted-quad\" style IPv4 address.
    #
    # @return [String]
    attr_accessor :ip_address

    # The port for primary endpoint of the DB System to listen on.
    # @return [Integer]
    attr_accessor :port

    # The TCP network port on which X Plugin listens for connections. This is the X Plugin equivalent of port.
    #
    # @return [Integer]
    attr_accessor :port_x

    # @return [OCI::Mysql::Models::UpdateBackupPolicyDetails]
    attr_accessor :backup_policy

    # @return [OCI::Mysql::Models::UpdateMaintenanceDetails]
    attr_accessor :maintenance

    # Simple key-value pair applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'subnet_id': :'subnetId',
        'is_highly_available': :'isHighlyAvailable',
        'availability_domain': :'availabilityDomain',
        'fault_domain': :'faultDomain',
        'shape_name': :'shapeName',
        'mysql_version': :'mysqlVersion',
        'configuration_id': :'configurationId',
        'admin_username': :'adminUsername',
        'admin_password': :'adminPassword',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'hostname_label': :'hostnameLabel',
        'ip_address': :'ipAddress',
        'port': :'port',
        'port_x': :'portX',
        'backup_policy': :'backupPolicy',
        'maintenance': :'maintenance',
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
        'description': :'String',
        'subnet_id': :'String',
        'is_highly_available': :'BOOLEAN',
        'availability_domain': :'String',
        'fault_domain': :'String',
        'shape_name': :'String',
        'mysql_version': :'String',
        'configuration_id': :'String',
        'admin_username': :'String',
        'admin_password': :'String',
        'data_storage_size_in_gbs': :'Integer',
        'hostname_label': :'String',
        'ip_address': :'String',
        'port': :'Integer',
        'port_x': :'Integer',
        'backup_policy': :'OCI::Mysql::Models::UpdateBackupPolicyDetails',
        'maintenance': :'OCI::Mysql::Models::UpdateMaintenanceDetails',
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
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [BOOLEAN] :is_highly_available The value to assign to the {#is_highly_available} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [String] :mysql_version The value to assign to the {#mysql_version} property
    # @option attributes [String] :configuration_id The value to assign to the {#configuration_id} property
    # @option attributes [String] :admin_username The value to assign to the {#admin_username} property
    # @option attributes [String] :admin_password The value to assign to the {#admin_password} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [Integer] :port_x The value to assign to the {#port_x} property
    # @option attributes [OCI::Mysql::Models::UpdateBackupPolicyDetails] :backup_policy The value to assign to the {#backup_policy} property
    # @option attributes [OCI::Mysql::Models::UpdateMaintenanceDetails] :maintenance The value to assign to the {#maintenance} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.is_highly_available = attributes[:'isHighlyAvailable'] unless attributes[:'isHighlyAvailable'].nil?
      self.is_highly_available = true if is_highly_available.nil? && !attributes.key?(:'isHighlyAvailable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHighlyAvailable and :is_highly_available' if attributes.key?(:'isHighlyAvailable') && attributes.key?(:'is_highly_available')

      self.is_highly_available = attributes[:'is_highly_available'] unless attributes[:'is_highly_available'].nil?
      self.is_highly_available = true if is_highly_available.nil? && !attributes.key?(:'isHighlyAvailable') && !attributes.key?(:'is_highly_available') # rubocop:disable Style/StringLiterals

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.mysql_version = attributes[:'mysqlVersion'] if attributes[:'mysqlVersion']

      raise 'You cannot provide both :mysqlVersion and :mysql_version' if attributes.key?(:'mysqlVersion') && attributes.key?(:'mysql_version')

      self.mysql_version = attributes[:'mysql_version'] if attributes[:'mysql_version']

      self.configuration_id = attributes[:'configurationId'] if attributes[:'configurationId']

      raise 'You cannot provide both :configurationId and :configuration_id' if attributes.key?(:'configurationId') && attributes.key?(:'configuration_id')

      self.configuration_id = attributes[:'configuration_id'] if attributes[:'configuration_id']

      self.admin_username = attributes[:'adminUsername'] if attributes[:'adminUsername']

      raise 'You cannot provide both :adminUsername and :admin_username' if attributes.key?(:'adminUsername') && attributes.key?(:'admin_username')

      self.admin_username = attributes[:'admin_username'] if attributes[:'admin_username']

      self.admin_password = attributes[:'adminPassword'] if attributes[:'adminPassword']

      raise 'You cannot provide both :adminPassword and :admin_password' if attributes.key?(:'adminPassword') && attributes.key?(:'admin_password')

      self.admin_password = attributes[:'admin_password'] if attributes[:'admin_password']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.hostname_label = attributes[:'hostnameLabel'] if attributes[:'hostnameLabel']

      raise 'You cannot provide both :hostnameLabel and :hostname_label' if attributes.key?(:'hostnameLabel') && attributes.key?(:'hostname_label')

      self.hostname_label = attributes[:'hostname_label'] if attributes[:'hostname_label']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.port = attributes[:'port'] if attributes[:'port']

      self.port_x = attributes[:'portX'] if attributes[:'portX']

      raise 'You cannot provide both :portX and :port_x' if attributes.key?(:'portX') && attributes.key?(:'port_x')

      self.port_x = attributes[:'port_x'] if attributes[:'port_x']

      self.backup_policy = attributes[:'backupPolicy'] if attributes[:'backupPolicy']

      raise 'You cannot provide both :backupPolicy and :backup_policy' if attributes.key?(:'backupPolicy') && attributes.key?(:'backup_policy')

      self.backup_policy = attributes[:'backup_policy'] if attributes[:'backup_policy']

      self.maintenance = attributes[:'maintenance'] if attributes[:'maintenance']

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
        description == other.description &&
        subnet_id == other.subnet_id &&
        is_highly_available == other.is_highly_available &&
        availability_domain == other.availability_domain &&
        fault_domain == other.fault_domain &&
        shape_name == other.shape_name &&
        mysql_version == other.mysql_version &&
        configuration_id == other.configuration_id &&
        admin_username == other.admin_username &&
        admin_password == other.admin_password &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        hostname_label == other.hostname_label &&
        ip_address == other.ip_address &&
        port == other.port &&
        port_x == other.port_x &&
        backup_policy == other.backup_policy &&
        maintenance == other.maintenance &&
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
      [display_name, description, subnet_id, is_highly_available, availability_domain, fault_domain, shape_name, mysql_version, configuration_id, admin_username, admin_password, data_storage_size_in_gbs, hostname_label, ip_address, port, port_x, backup_policy, maintenance, freeform_tags, defined_tags].hash
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
