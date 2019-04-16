# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # An Oracle Autonomous Database.
  #
  class Database::Models::AutonomousDatabase # rubocop:disable Metrics/LineLength
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_STATE_STOPPED = 'STOPPED'.freeze,
      LIFECYCLE_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNAVAILABLE = 'UNAVAILABLE'.freeze,
      LIFECYCLE_STATE_RESTORE_IN_PROGRESS = 'RESTORE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_RESTORE_FAILED = 'RESTORE_FAILED'.freeze,
      LIFECYCLE_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_SCALE_IN_PROGRESS = 'SCALE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_AVAILABLE_NEEDS_ATTENTION = 'AVAILABLE_NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DB_WORKLOAD_ENUM = [
      DB_WORKLOAD_OLTP = 'OLTP'.freeze,
      DB_WORKLOAD_DW = 'DW'.freeze,
      DB_WORKLOAD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous Database.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The current state of the database.
    # @return [String]
    attr_reader :lifecycle_state

    # Information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The database name.
    # @return [String]
    attr_accessor :db_name

    # **[Required]** The number of CPU cores to be made available to the database.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # **[Required]** The quantity of data in the database, in terabytes.
    # @return [Integer]
    attr_accessor :data_storage_size_in_tbs

    # The date and time the database was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The user-friendly name for the Autonomous Database. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The URL of the Service Console for the Autonomous Database.
    # @return [String]
    attr_accessor :service_console_url

    # The connection string used to connect to the Autonomous Database. The username for the Service Console is ADMIN. Use the password you entered when creating the Autonomous Database for the password value.
    # @return [OCI::Database::Models::AutonomousDatabaseConnectionStrings]
    attr_accessor :connection_strings

    # The Oracle license model that applies to the Oracle Autonomous Database. The default is BRING_YOUR_OWN_LICENSE.
    #
    # @return [String]
    attr_reader :license_model

    # The amount of storage that has been used, in terabytes.
    # @return [Integer]
    attr_accessor :used_data_storage_size_in_tbs

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A valid Oracle Database version for Autonomous Database.
    # @return [String]
    attr_accessor :db_version

    # The Autonomous Database workload type. OLTP indicates an Autonomous Transaction Processing database and DW indicates an Autonomous Data Warehouse database.
    # @return [String]
    attr_reader :db_workload

    # The client IP access control list (ACL). Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance. This is an array of CIDR (Classless Inter-Domain Routing) notations for a subnet.
    # @return [Array<String>]
    attr_accessor :whitelisted_ips

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'db_name': :'dbName',
        'cpu_core_count': :'cpuCoreCount',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'time_created': :'timeCreated',
        'display_name': :'displayName',
        'service_console_url': :'serviceConsoleUrl',
        'connection_strings': :'connectionStrings',
        'license_model': :'licenseModel',
        'used_data_storage_size_in_tbs': :'usedDataStorageSizeInTBs',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'db_version': :'dbVersion',
        'db_workload': :'dbWorkload',
        'whitelisted_ips': :'whitelistedIps'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'db_name': :'String',
        'cpu_core_count': :'Integer',
        'data_storage_size_in_tbs': :'Integer',
        'time_created': :'DateTime',
        'display_name': :'String',
        'service_console_url': :'String',
        'connection_strings': :'OCI::Database::Models::AutonomousDatabaseConnectionStrings',
        'license_model': :'String',
        'used_data_storage_size_in_tbs': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'db_version': :'String',
        'db_workload': :'String',
        'whitelisted_ips': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :service_console_url The value to assign to the {#service_console_url} property
    # @option attributes [OCI::Database::Models::AutonomousDatabaseConnectionStrings] :connection_strings The value to assign to the {#connection_strings} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Integer] :used_data_storage_size_in_tbs The value to assign to the {#used_data_storage_size_in_tbs} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [Array<String>] :whitelisted_ips The value to assign to the {#whitelisted_ips} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.service_console_url = attributes[:'serviceConsoleUrl'] if attributes[:'serviceConsoleUrl']

      raise 'You cannot provide both :serviceConsoleUrl and :service_console_url' if attributes.key?(:'serviceConsoleUrl') && attributes.key?(:'service_console_url')

      self.service_console_url = attributes[:'service_console_url'] if attributes[:'service_console_url']

      self.connection_strings = attributes[:'connectionStrings'] if attributes[:'connectionStrings']

      raise 'You cannot provide both :connectionStrings and :connection_strings' if attributes.key?(:'connectionStrings') && attributes.key?(:'connection_strings')

      self.connection_strings = attributes[:'connection_strings'] if attributes[:'connection_strings']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.used_data_storage_size_in_tbs = attributes[:'usedDataStorageSizeInTBs'] if attributes[:'usedDataStorageSizeInTBs']

      raise 'You cannot provide both :usedDataStorageSizeInTBs and :used_data_storage_size_in_tbs' if attributes.key?(:'usedDataStorageSizeInTBs') && attributes.key?(:'used_data_storage_size_in_tbs')

      self.used_data_storage_size_in_tbs = attributes[:'used_data_storage_size_in_tbs'] if attributes[:'used_data_storage_size_in_tbs']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.whitelisted_ips = attributes[:'whitelistedIps'] if attributes[:'whitelistedIps']

      raise 'You cannot provide both :whitelistedIps and :whitelisted_ips' if attributes.key?(:'whitelistedIps') && attributes.key?(:'whitelisted_ips')

      self.whitelisted_ips = attributes[:'whitelisted_ips'] if attributes[:'whitelisted_ips']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      # rubocop:disable Style/ConditionalAssignment
      if license_model && !LICENSE_MODEL_ENUM.include?(license_model)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'license_model' [" + license_model + "]. Mapping to 'LICENSE_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @license_model = LICENSE_MODEL_UNKNOWN_ENUM_VALUE
      else
        @license_model = license_model
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] db_workload Object to be assigned
    def db_workload=(db_workload)
      # rubocop:disable Style/ConditionalAssignment
      if db_workload && !DB_WORKLOAD_ENUM.include?(db_workload)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'db_workload' [" + db_workload + "]. Mapping to 'DB_WORKLOAD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @db_workload = DB_WORKLOAD_UNKNOWN_ENUM_VALUE
      else
        @db_workload = db_workload
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        db_name == other.db_name &&
        cpu_core_count == other.cpu_core_count &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        time_created == other.time_created &&
        display_name == other.display_name &&
        service_console_url == other.service_console_url &&
        connection_strings == other.connection_strings &&
        license_model == other.license_model &&
        used_data_storage_size_in_tbs == other.used_data_storage_size_in_tbs &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        db_version == other.db_version &&
        db_workload == other.db_workload &&
        whitelisted_ips == other.whitelisted_ips
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
      [id, compartment_id, lifecycle_state, lifecycle_details, db_name, cpu_core_count, data_storage_size_in_tbs, time_created, display_name, service_console_url, connection_strings, license_model, used_data_storage_size_in_tbs, freeform_tags, defined_tags, db_version, db_workload, whitelisted_ips].hash
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
