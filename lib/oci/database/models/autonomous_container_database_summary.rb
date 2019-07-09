# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An Autonomous Container Database is a container database service that enables the customer to host one or more databases within the container database. A basic container database runs on a single Autonomous Exadata Infrastructure from an availability domain without the Extreme Availability features enabled.
  #
  class Database::Models::AutonomousContainerDatabaseSummary
    SERVICE_LEVEL_AGREEMENT_TYPE_ENUM = [
      SERVICE_LEVEL_AGREEMENT_TYPE_STANDARD = 'STANDARD'.freeze,
      SERVICE_LEVEL_AGREEMENT_TYPE_MISSION_CRITICAL = 'MISSION_CRITICAL'.freeze,
      SERVICE_LEVEL_AGREEMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_RESTORING = 'RESTORING'.freeze,
      LIFECYCLE_STATE_RESTORE_FAILED = 'RESTORE_FAILED'.freeze,
      LIFECYCLE_STATE_RESTARTING = 'RESTARTING'.freeze,
      LIFECYCLE_STATE_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PATCH_MODEL_ENUM = [
      PATCH_MODEL_RELEASE_UPDATES = 'RELEASE_UPDATES'.freeze,
      PATCH_MODEL_RELEASE_UPDATE_REVISIONS = 'RELEASE_UPDATE_REVISIONS'.freeze,
      PATCH_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the Autonomous Container Database.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-provided name for the Autonomous Container Database.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The service level agreement type of the container database. The default is STANDARD.
    # @return [String]
    attr_reader :service_level_agreement_type

    # **[Required]** The OCID of the Autonomous Exadata Infrastructure.
    # @return [String]
    attr_accessor :autonomous_exadata_infrastructure_id

    # **[Required]** The current state of the Autonomous Container Database.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # The date and time the Autonomous was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** Database Patch model preference.
    # @return [String]
    attr_reader :patch_model

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last maintenance run.
    # @return [String]
    attr_accessor :last_maintenance_run_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the next maintenance run.
    # @return [String]
    attr_accessor :next_maintenance_run_id

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

    # The availability domain of the Autonomous Container Database.
    # @return [String]
    attr_accessor :availability_domain

    # @return [OCI::Database::Models::AutonomousContainerDatabaseBackupConfig]
    attr_accessor :backup_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'service_level_agreement_type': :'serviceLevelAgreementType',
        'autonomous_exadata_infrastructure_id': :'autonomousExadataInfrastructureId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'patch_model': :'patchModel',
        'last_maintenance_run_id': :'lastMaintenanceRunId',
        'next_maintenance_run_id': :'nextMaintenanceRunId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'availability_domain': :'availabilityDomain',
        'backup_config': :'backupConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'service_level_agreement_type': :'String',
        'autonomous_exadata_infrastructure_id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'patch_model': :'String',
        'last_maintenance_run_id': :'String',
        'next_maintenance_run_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'availability_domain': :'String',
        'backup_config': :'OCI::Database::Models::AutonomousContainerDatabaseBackupConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :service_level_agreement_type The value to assign to the {#service_level_agreement_type} property
    # @option attributes [String] :autonomous_exadata_infrastructure_id The value to assign to the {#autonomous_exadata_infrastructure_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :patch_model The value to assign to the {#patch_model} property
    # @option attributes [String] :last_maintenance_run_id The value to assign to the {#last_maintenance_run_id} property
    # @option attributes [String] :next_maintenance_run_id The value to assign to the {#next_maintenance_run_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [OCI::Database::Models::AutonomousContainerDatabaseBackupConfig] :backup_config The value to assign to the {#backup_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.service_level_agreement_type = attributes[:'serviceLevelAgreementType'] if attributes[:'serviceLevelAgreementType']

      raise 'You cannot provide both :serviceLevelAgreementType and :service_level_agreement_type' if attributes.key?(:'serviceLevelAgreementType') && attributes.key?(:'service_level_agreement_type')

      self.service_level_agreement_type = attributes[:'service_level_agreement_type'] if attributes[:'service_level_agreement_type']

      self.autonomous_exadata_infrastructure_id = attributes[:'autonomousExadataInfrastructureId'] if attributes[:'autonomousExadataInfrastructureId']

      raise 'You cannot provide both :autonomousExadataInfrastructureId and :autonomous_exadata_infrastructure_id' if attributes.key?(:'autonomousExadataInfrastructureId') && attributes.key?(:'autonomous_exadata_infrastructure_id')

      self.autonomous_exadata_infrastructure_id = attributes[:'autonomous_exadata_infrastructure_id'] if attributes[:'autonomous_exadata_infrastructure_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.patch_model = attributes[:'patchModel'] if attributes[:'patchModel']

      raise 'You cannot provide both :patchModel and :patch_model' if attributes.key?(:'patchModel') && attributes.key?(:'patch_model')

      self.patch_model = attributes[:'patch_model'] if attributes[:'patch_model']

      self.last_maintenance_run_id = attributes[:'lastMaintenanceRunId'] if attributes[:'lastMaintenanceRunId']

      raise 'You cannot provide both :lastMaintenanceRunId and :last_maintenance_run_id' if attributes.key?(:'lastMaintenanceRunId') && attributes.key?(:'last_maintenance_run_id')

      self.last_maintenance_run_id = attributes[:'last_maintenance_run_id'] if attributes[:'last_maintenance_run_id']

      self.next_maintenance_run_id = attributes[:'nextMaintenanceRunId'] if attributes[:'nextMaintenanceRunId']

      raise 'You cannot provide both :nextMaintenanceRunId and :next_maintenance_run_id' if attributes.key?(:'nextMaintenanceRunId') && attributes.key?(:'next_maintenance_run_id')

      self.next_maintenance_run_id = attributes[:'next_maintenance_run_id'] if attributes[:'next_maintenance_run_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.backup_config = attributes[:'backupConfig'] if attributes[:'backupConfig']

      raise 'You cannot provide both :backupConfig and :backup_config' if attributes.key?(:'backupConfig') && attributes.key?(:'backup_config')

      self.backup_config = attributes[:'backup_config'] if attributes[:'backup_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] service_level_agreement_type Object to be assigned
    def service_level_agreement_type=(service_level_agreement_type)
      # rubocop:disable Style/ConditionalAssignment
      if service_level_agreement_type && !SERVICE_LEVEL_AGREEMENT_TYPE_ENUM.include?(service_level_agreement_type)
        OCI.logger.debug("Unknown value for 'service_level_agreement_type' [" + service_level_agreement_type + "]. Mapping to 'SERVICE_LEVEL_AGREEMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @service_level_agreement_type = SERVICE_LEVEL_AGREEMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @service_level_agreement_type = service_level_agreement_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patch_model Object to be assigned
    def patch_model=(patch_model)
      # rubocop:disable Style/ConditionalAssignment
      if patch_model && !PATCH_MODEL_ENUM.include?(patch_model)
        OCI.logger.debug("Unknown value for 'patch_model' [" + patch_model + "]. Mapping to 'PATCH_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @patch_model = PATCH_MODEL_UNKNOWN_ENUM_VALUE
      else
        @patch_model = patch_model
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
        display_name == other.display_name &&
        service_level_agreement_type == other.service_level_agreement_type &&
        autonomous_exadata_infrastructure_id == other.autonomous_exadata_infrastructure_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        patch_model == other.patch_model &&
        last_maintenance_run_id == other.last_maintenance_run_id &&
        next_maintenance_run_id == other.next_maintenance_run_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        availability_domain == other.availability_domain &&
        backup_config == other.backup_config
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
      [id, compartment_id, display_name, service_level_agreement_type, autonomous_exadata_infrastructure_id, lifecycle_state, lifecycle_details, time_created, patch_model, last_maintenance_run_id, next_maintenance_run_id, freeform_tags, defined_tags, availability_domain, backup_config].hash
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
