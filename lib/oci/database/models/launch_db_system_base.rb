# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # Parameters for provisioning a bare metal, virtual machine, or Exadata DB system.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Database::Models::LaunchDbSystemBase # rubocop:disable Metrics/LineLength
    SOURCE_ENUM = [
      SOURCE_NONE = 'NONE'.freeze,
      SOURCE_DB_BACKUP = 'DB_BACKUP'.freeze
    ].freeze

    # **[Required]** The availability domain where the DB system is located.
    # @return [String]
    attr_accessor :availability_domain

    # The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the backup network subnet the DB system is associated with. Applicable only to Exadata DB systems.
    #
    # **Subnet Restrictions:** See the subnet restrictions information for **subnetId**.
    #
    # @return [String]
    attr_accessor :backup_subnet_id

    # The cluster name for Exadata and 2-node RAC virtual machine DB systems. The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive.
    #
    # @return [String]
    attr_accessor :cluster_name

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the compartment the DB system  belongs in.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The number of CPU cores to enable for a bare metal or Exadata DB system. The valid values depend on the specified shape:
    #
    # - BM.DenseIO1.36 - Specify a multiple of 2, from 2 to 36.
    # - BM.DenseIO2.52 - Specify a multiple of 2, from 2 to 52.
    # - Exadata.Quarter1.84 - Specify a multiple of 2, from 22 to 84.
    # - Exadata.Half1.168 - Specify a multiple of 4, from 44 to 168.
    # - Exadata.Full1.336 - Specify a multiple of 8, from 88 to 336.
    # - Exadata.Quarter2.92 - Specify a multiple of 2, from 0 to 92.
    # - Exadata.Half2.184 - Specify a multiple of 4, from 0 to 184.
    # - Exadata.Full2.368 - Specify a multiple of 8, from 0 to 368.
    #
    # This parameter is not used for virtual machine DB systems because virtual machine DB systems have a set number of cores for each shape.
    # For information about the number of cores for a virtual machine DB system shape, see [Virtual Machine DB Systems](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/Concepts/overview.htm#virtualmachine)
    #
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The percentage assigned to DATA storage (user data and database files).
    # The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups).
    # Specify 80 or 40. The default is 80 percent assigned to DATA storage. Not applicable for virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :data_storage_percentage

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The user-friendly name for the DB system. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # A domain name used for the DB system. If the Oracle-provided Internet and VCN
    # Resolver is enabled for the specified subnet, the domain name for the subnet is used
    # (do not provide one). Otherwise, provide a valid DNS domain name. Hyphens (-) are not permitted.
    #
    # @return [String]
    attr_accessor :domain

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The hostname for the DB system. The hostname must begin with an alphabetic character and
    # can contain a maximum of 30 alphanumeric characters, including hyphens (-).
    #
    # The maximum length of the combined hostname and domain is 63 characters.
    #
    # **Note:** The hostname must be unique within the subnet. If it is not unique,
    # the DB system will fail to provision.
    #
    # @return [String]
    attr_accessor :hostname

    # Size (in GB) of the initial data volume that will be created and attached to a virtual machine DB system. You can scale up storage after provisioning, as needed. Note that the total storage size attached will be more than the amount you specify to allow for REDO/RECO space and software volume.
    #
    # @return [Integer]
    attr_accessor :initial_data_storage_size_in_gb

    # The number of nodes to launch for a 2-node RAC virtual machine DB system.
    #
    # @return [Integer]
    attr_accessor :node_count

    # **[Required]** The shape of the DB system. The shape determines resources allocated to the DB system.
    # - For virtual machine shapes, the number of CPU cores and memory
    # - For bare metal and Exadata shapes, the number of CPU cores, memory, and storage
    #
    # To get a list of shapes, use the {#list_db_system_shapes list_db_system_shapes} operation.
    #
    # @return [String]
    attr_accessor :shape

    # The source of the database:
    #   NONE for creating a new database. DB_BACKUP for creating a new database by restoring from a backup. The default is NONE.
    #
    # @return [String]
    attr_reader :source

    # **[Required]** The public key portion of the key pair to use for SSH access to the DB system. Multiple public keys can be provided. The length of the combined keys cannot exceed 10,000 characters.
    # @return [Array<String>]
    attr_accessor :ssh_public_keys

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the subnet the DB system is associated with.
    #
    # **Subnet Restrictions:**
    # - For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
    # - For Exadata and virtual machine 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.128.0/20.
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and the backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'backup_subnet_id': :'backupSubnetId',
        'cluster_name': :'clusterName',
        'compartment_id': :'compartmentId',
        'cpu_core_count': :'cpuCoreCount',
        'data_storage_percentage': :'dataStoragePercentage',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'domain': :'domain',
        'freeform_tags': :'freeformTags',
        'hostname': :'hostname',
        'initial_data_storage_size_in_gb': :'initialDataStorageSizeInGB',
        'node_count': :'nodeCount',
        'shape': :'shape',
        'source': :'source',
        'ssh_public_keys': :'sshPublicKeys',
        'subnet_id': :'subnetId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'backup_subnet_id': :'String',
        'cluster_name': :'String',
        'compartment_id': :'String',
        'cpu_core_count': :'Integer',
        'data_storage_percentage': :'Integer',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'domain': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname': :'String',
        'initial_data_storage_size_in_gb': :'Integer',
        'node_count': :'Integer',
        'shape': :'String',
        'source': :'String',
        'ssh_public_keys': :'Array<String>',
        'subnet_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'source'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Database::Models::LaunchDbSystemDetails' if type == 'NONE'
      return 'OCI::Database::Models::LaunchDbSystemFromBackupDetails' if type == 'DB_BACKUP'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Database::Models::LaunchDbSystemBase'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :backup_subnet_id The value to assign to the {#backup_subnet_id} property
    # @option attributes [String] :cluster_name The value to assign to the {#cluster_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :data_storage_percentage The value to assign to the {#data_storage_percentage} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [Integer] :initial_data_storage_size_in_gb The value to assign to the {#initial_data_storage_size_in_gb} property
    # @option attributes [Integer] :node_count The value to assign to the {#node_count} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [String] :source The value to assign to the {#source} property
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {#ssh_public_keys} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.backup_subnet_id = attributes[:'backupSubnetId'] if attributes[:'backupSubnetId']

      raise 'You cannot provide both :backupSubnetId and :backup_subnet_id' if attributes.key?(:'backupSubnetId') && attributes.key?(:'backup_subnet_id')

      self.backup_subnet_id = attributes[:'backup_subnet_id'] if attributes[:'backup_subnet_id']

      self.cluster_name = attributes[:'clusterName'] if attributes[:'clusterName']

      raise 'You cannot provide both :clusterName and :cluster_name' if attributes.key?(:'clusterName') && attributes.key?(:'cluster_name')

      self.cluster_name = attributes[:'cluster_name'] if attributes[:'cluster_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.data_storage_percentage = attributes[:'dataStoragePercentage'] if attributes[:'dataStoragePercentage']

      raise 'You cannot provide both :dataStoragePercentage and :data_storage_percentage' if attributes.key?(:'dataStoragePercentage') && attributes.key?(:'data_storage_percentage')

      self.data_storage_percentage = attributes[:'data_storage_percentage'] if attributes[:'data_storage_percentage']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.initial_data_storage_size_in_gb = attributes[:'initialDataStorageSizeInGB'] if attributes[:'initialDataStorageSizeInGB']

      raise 'You cannot provide both :initialDataStorageSizeInGB and :initial_data_storage_size_in_gb' if attributes.key?(:'initialDataStorageSizeInGB') && attributes.key?(:'initial_data_storage_size_in_gb')

      self.initial_data_storage_size_in_gb = attributes[:'initial_data_storage_size_in_gb'] if attributes[:'initial_data_storage_size_in_gb']

      self.node_count = attributes[:'nodeCount'] if attributes[:'nodeCount']

      raise 'You cannot provide both :nodeCount and :node_count' if attributes.key?(:'nodeCount') && attributes.key?(:'node_count')

      self.node_count = attributes[:'node_count'] if attributes[:'node_count']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.source = attributes[:'source'] if attributes[:'source']
      self.source = "NONE" if source.nil? && !attributes.key?(:'source') # rubocop:disable Style/StringLiterals

      self.ssh_public_keys = attributes[:'sshPublicKeys'] if attributes[:'sshPublicKeys']

      raise 'You cannot provide both :sshPublicKeys and :ssh_public_keys' if attributes.key?(:'sshPublicKeys') && attributes.key?(:'ssh_public_keys')

      self.ssh_public_keys = attributes[:'ssh_public_keys'] if attributes[:'ssh_public_keys']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source Object to be assigned
    def source=(source)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'source': this must be one of the values in SOURCE_ENUM." if source && !SOURCE_ENUM.include?(source)

      # rubocop: enable Metrics/LineLength
      @source = source
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_domain == other.availability_domain &&
        backup_subnet_id == other.backup_subnet_id &&
        cluster_name == other.cluster_name &&
        compartment_id == other.compartment_id &&
        cpu_core_count == other.cpu_core_count &&
        data_storage_percentage == other.data_storage_percentage &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        domain == other.domain &&
        freeform_tags == other.freeform_tags &&
        hostname == other.hostname &&
        initial_data_storage_size_in_gb == other.initial_data_storage_size_in_gb &&
        node_count == other.node_count &&
        shape == other.shape &&
        source == other.source &&
        ssh_public_keys == other.ssh_public_keys &&
        subnet_id == other.subnet_id
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [availability_domain, backup_subnet_id, cluster_name, compartment_id, cpu_core_count, data_storage_percentage, defined_tags, display_name, domain, freeform_tags, hostname, initial_data_storage_size_in_gb, node_count, shape, source, ssh_public_keys, subnet_id].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
