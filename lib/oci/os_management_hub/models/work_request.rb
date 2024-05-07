# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that defines a work request.
  class OsManagementHub::Models::WorkRequest
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_INSTALL_PACKAGES = 'INSTALL_PACKAGES'.freeze,
      OPERATION_TYPE_REMOVE_PACKAGES = 'REMOVE_PACKAGES'.freeze,
      OPERATION_TYPE_UPDATE_PACKAGES = 'UPDATE_PACKAGES'.freeze,
      OPERATION_TYPE_UPDATE_ALL_PACKAGES = 'UPDATE_ALL_PACKAGES'.freeze,
      OPERATION_TYPE_UPDATE_SECURITY = 'UPDATE_SECURITY'.freeze,
      OPERATION_TYPE_UPDATE_BUGFIX = 'UPDATE_BUGFIX'.freeze,
      OPERATION_TYPE_UPDATE_ENHANCEMENT = 'UPDATE_ENHANCEMENT'.freeze,
      OPERATION_TYPE_UPDATE_OTHER = 'UPDATE_OTHER'.freeze,
      OPERATION_TYPE_UPDATE_KSPLICE_KERNEL = 'UPDATE_KSPLICE_KERNEL'.freeze,
      OPERATION_TYPE_UPDATE_KSPLICE_USERSPACE = 'UPDATE_KSPLICE_USERSPACE'.freeze,
      OPERATION_TYPE_ENABLE_MODULE_STREAMS = 'ENABLE_MODULE_STREAMS'.freeze,
      OPERATION_TYPE_DISABLE_MODULE_STREAMS = 'DISABLE_MODULE_STREAMS'.freeze,
      OPERATION_TYPE_SWITCH_MODULE_STREAM = 'SWITCH_MODULE_STREAM'.freeze,
      OPERATION_TYPE_INSTALL_MODULE_PROFILES = 'INSTALL_MODULE_PROFILES'.freeze,
      OPERATION_TYPE_REMOVE_MODULE_PROFILES = 'REMOVE_MODULE_PROFILES'.freeze,
      OPERATION_TYPE_SET_SOFTWARE_SOURCES = 'SET_SOFTWARE_SOURCES'.freeze,
      OPERATION_TYPE_LIST_PACKAGES = 'LIST_PACKAGES'.freeze,
      OPERATION_TYPE_SET_MANAGEMENT_STATION_CONFIG = 'SET_MANAGEMENT_STATION_CONFIG'.freeze,
      OPERATION_TYPE_SYNC_MANAGEMENT_STATION_MIRROR = 'SYNC_MANAGEMENT_STATION_MIRROR'.freeze,
      OPERATION_TYPE_UPDATE_MANAGEMENT_STATION_SOFTWARE = 'UPDATE_MANAGEMENT_STATION_SOFTWARE'.freeze,
      OPERATION_TYPE_UPDATE = 'UPDATE'.freeze,
      OPERATION_TYPE_MODULE_ACTIONS = 'MODULE_ACTIONS'.freeze,
      OPERATION_TYPE_LIFECYCLE_PROMOTION = 'LIFECYCLE_PROMOTION'.freeze,
      OPERATION_TYPE_CREATE_SOFTWARE_SOURCE = 'CREATE_SOFTWARE_SOURCE'.freeze,
      OPERATION_TYPE_UPDATE_SOFTWARE_SOURCE = 'UPDATE_SOFTWARE_SOURCE'.freeze,
      OPERATION_TYPE_IMPORT_CONTENT = 'IMPORT_CONTENT'.freeze,
      OPERATION_TYPE_SYNC_AGENT_CONFIG = 'SYNC_AGENT_CONFIG'.freeze,
      OPERATION_TYPE_INSTALL_WINDOWS_UPDATES = 'INSTALL_WINDOWS_UPDATES'.freeze,
      OPERATION_TYPE_LIST_WINDOWS_UPDATE = 'LIST_WINDOWS_UPDATE'.freeze,
      OPERATION_TYPE_GET_WINDOWS_UPDATE_DETAILS = 'GET_WINDOWS_UPDATE_DETAILS'.freeze,
      OPERATION_TYPE_INSTALL_ALL_WINDOWS_UPDATES = 'INSTALL_ALL_WINDOWS_UPDATES'.freeze,
      OPERATION_TYPE_INSTALL_SECURITY_WINDOWS_UPDATES = 'INSTALL_SECURITY_WINDOWS_UPDATES'.freeze,
      OPERATION_TYPE_INSTALL_BUGFIX_WINDOWS_UPDATES = 'INSTALL_BUGFIX_WINDOWS_UPDATES'.freeze,
      OPERATION_TYPE_INSTALL_ENHANCEMENT_WINDOWS_UPDATES = 'INSTALL_ENHANCEMENT_WINDOWS_UPDATES'.freeze,
      OPERATION_TYPE_INSTALL_OTHER_WINDOWS_UPDATES = 'INSTALL_OTHER_WINDOWS_UPDATES'.freeze,
      OPERATION_TYPE_REMOVE_CONTENT = 'REMOVE_CONTENT'.freeze,
      OPERATION_TYPE_UNREGISTER_MANAGED_INSTANCE = 'UNREGISTER_MANAGED_INSTANCE'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Type of the work request.
    # @return [String]
    attr_reader :operation_type

    # **[Required]** Status of the work request.
    # @return [String]
    attr_reader :status

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the work request.
    # @return [String]
    attr_accessor :id

    # A short description about the work request.
    # @return [String]
    attr_accessor :description

    # A short display name for the work request.
    # @return [String]
    attr_accessor :display_name

    # A progress or error message, if there is any.
    # @return [String]
    attr_accessor :message

    # The OCID of the parent work request, if there is any.
    # @return [String]
    attr_accessor :parent_id

    # The list of OCIDs for the child work requests.
    # @return [Array<String>]
    attr_accessor :children_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the work request.
    # Work requests should be scoped to the same compartment as the resource it affects.
    # If the work request affects multiple resources the different compartments, the services selects the compartment of the primary resource.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The list of [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the resources affected by the work request.
    # @return [Array<OCI::OsManagementHub::Models::WorkRequestResource>]
    attr_accessor :resources

    # A list of package names to be installed, updated, or removed.
    # @return [Array<String>]
    attr_accessor :package_names

    # The UUIDs of the target Windows update (only used when operation type is INSTALL_WINDOWS_UPDATES).
    # @return [Array<String>]
    attr_accessor :windows_update_names

    # The list of appstream modules being operated on.
    # @return [Array<OCI::OsManagementHub::Models::ModuleSpecDetails>]
    attr_accessor :module_specs

    # **[Required]** The percentage complete of the operation tracked by this work request.
    # @return [Float]
    attr_accessor :percent_complete

    # **[Required]** The date and time the work request was created (in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) format).
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the work request started (in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) format).
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The date and time the work request started (in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) format).
    #
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time the work request completed (in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) format).
    #
    # @return [DateTime]
    attr_accessor :time_finished

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource that initiated the work request.
    # @return [String]
    attr_accessor :initiator_id

    # @return [OCI::OsManagementHub::Models::WorkRequestManagementStationDetails]
    attr_accessor :management_station

    # The scheduled date and time to retry the work request (in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) format).
    # @return [DateTime]
    attr_accessor :time_scheduled

    # The location of the bundle in the filesystem of the resource associated to this work request.
    #
    # @return [String]
    attr_accessor :content_location

    # The event id of the content. This property is required when the work request type is IMPORT_CONTENT or REMOVE_CONTENT.
    #
    # @return [String]
    attr_accessor :event_id

    # The EventFingerprint associated with the content. This property is required when the work request type is IMPORT_CONTENT or REMOVE_CONTENT.
    #
    # @return [String]
    attr_accessor :content_checksum

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the original work request that is being retried.
    #
    # @return [String]
    attr_accessor :retry_of_id

    # Indicates whether this work request is managed by the Autonomous Linux service.
    # @return [Array<Integer>]
    attr_accessor :retry_intervals

    # Indicates whether this work request is managed by the Autonomous Linux service.
    # @return [BOOLEAN]
    attr_accessor :is_managed_by_autonomous_linux

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_type': :'operationType',
        'status': :'status',
        'id': :'id',
        'description': :'description',
        'display_name': :'displayName',
        'message': :'message',
        'parent_id': :'parentId',
        'children_id': :'childrenId',
        'compartment_id': :'compartmentId',
        'resources': :'resources',
        'package_names': :'packageNames',
        'windows_update_names': :'windowsUpdateNames',
        'module_specs': :'moduleSpecs',
        'percent_complete': :'percentComplete',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'initiator_id': :'initiatorId',
        'management_station': :'managementStation',
        'time_scheduled': :'timeScheduled',
        'content_location': :'contentLocation',
        'event_id': :'eventId',
        'content_checksum': :'contentChecksum',
        'retry_of_id': :'retryOfId',
        'retry_intervals': :'retryIntervals',
        'is_managed_by_autonomous_linux': :'isManagedByAutonomousLinux'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_type': :'String',
        'status': :'String',
        'id': :'String',
        'description': :'String',
        'display_name': :'String',
        'message': :'String',
        'parent_id': :'String',
        'children_id': :'Array<String>',
        'compartment_id': :'String',
        'resources': :'Array<OCI::OsManagementHub::Models::WorkRequestResource>',
        'package_names': :'Array<String>',
        'windows_update_names': :'Array<String>',
        'module_specs': :'Array<OCI::OsManagementHub::Models::ModuleSpecDetails>',
        'percent_complete': :'Float',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'initiator_id': :'String',
        'management_station': :'OCI::OsManagementHub::Models::WorkRequestManagementStationDetails',
        'time_scheduled': :'DateTime',
        'content_location': :'String',
        'event_id': :'String',
        'content_checksum': :'String',
        'retry_of_id': :'String',
        'retry_intervals': :'Array<Integer>',
        'is_managed_by_autonomous_linux': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :message The value to assign to the {#message} property
    # @option attributes [String] :parent_id The value to assign to the {#parent_id} property
    # @option attributes [Array<String>] :children_id The value to assign to the {#children_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Array<OCI::OsManagementHub::Models::WorkRequestResource>] :resources The value to assign to the {#resources} property
    # @option attributes [Array<String>] :package_names The value to assign to the {#package_names} property
    # @option attributes [Array<String>] :windows_update_names The value to assign to the {#windows_update_names} property
    # @option attributes [Array<OCI::OsManagementHub::Models::ModuleSpecDetails>] :module_specs The value to assign to the {#module_specs} property
    # @option attributes [Float] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [String] :initiator_id The value to assign to the {#initiator_id} property
    # @option attributes [OCI::OsManagementHub::Models::WorkRequestManagementStationDetails] :management_station The value to assign to the {#management_station} property
    # @option attributes [DateTime] :time_scheduled The value to assign to the {#time_scheduled} property
    # @option attributes [String] :content_location The value to assign to the {#content_location} property
    # @option attributes [String] :event_id The value to assign to the {#event_id} property
    # @option attributes [String] :content_checksum The value to assign to the {#content_checksum} property
    # @option attributes [String] :retry_of_id The value to assign to the {#retry_of_id} property
    # @option attributes [Array<Integer>] :retry_intervals The value to assign to the {#retry_intervals} property
    # @option attributes [BOOLEAN] :is_managed_by_autonomous_linux The value to assign to the {#is_managed_by_autonomous_linux} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.status = attributes[:'status'] if attributes[:'status']

      self.id = attributes[:'id'] if attributes[:'id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.message = attributes[:'message'] if attributes[:'message']

      self.parent_id = attributes[:'parentId'] if attributes[:'parentId']

      raise 'You cannot provide both :parentId and :parent_id' if attributes.key?(:'parentId') && attributes.key?(:'parent_id')

      self.parent_id = attributes[:'parent_id'] if attributes[:'parent_id']

      self.children_id = attributes[:'childrenId'] if attributes[:'childrenId']

      raise 'You cannot provide both :childrenId and :children_id' if attributes.key?(:'childrenId') && attributes.key?(:'children_id')

      self.children_id = attributes[:'children_id'] if attributes[:'children_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.resources = attributes[:'resources'] if attributes[:'resources']

      self.package_names = attributes[:'packageNames'] if attributes[:'packageNames']

      raise 'You cannot provide both :packageNames and :package_names' if attributes.key?(:'packageNames') && attributes.key?(:'package_names')

      self.package_names = attributes[:'package_names'] if attributes[:'package_names']

      self.windows_update_names = attributes[:'windowsUpdateNames'] if attributes[:'windowsUpdateNames']

      raise 'You cannot provide both :windowsUpdateNames and :windows_update_names' if attributes.key?(:'windowsUpdateNames') && attributes.key?(:'windows_update_names')

      self.windows_update_names = attributes[:'windows_update_names'] if attributes[:'windows_update_names']

      self.module_specs = attributes[:'moduleSpecs'] if attributes[:'moduleSpecs']

      raise 'You cannot provide both :moduleSpecs and :module_specs' if attributes.key?(:'moduleSpecs') && attributes.key?(:'module_specs')

      self.module_specs = attributes[:'module_specs'] if attributes[:'module_specs']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.initiator_id = attributes[:'initiatorId'] if attributes[:'initiatorId']

      raise 'You cannot provide both :initiatorId and :initiator_id' if attributes.key?(:'initiatorId') && attributes.key?(:'initiator_id')

      self.initiator_id = attributes[:'initiator_id'] if attributes[:'initiator_id']

      self.management_station = attributes[:'managementStation'] if attributes[:'managementStation']

      raise 'You cannot provide both :managementStation and :management_station' if attributes.key?(:'managementStation') && attributes.key?(:'management_station')

      self.management_station = attributes[:'management_station'] if attributes[:'management_station']

      self.time_scheduled = attributes[:'timeScheduled'] if attributes[:'timeScheduled']

      raise 'You cannot provide both :timeScheduled and :time_scheduled' if attributes.key?(:'timeScheduled') && attributes.key?(:'time_scheduled')

      self.time_scheduled = attributes[:'time_scheduled'] if attributes[:'time_scheduled']

      self.content_location = attributes[:'contentLocation'] if attributes[:'contentLocation']

      raise 'You cannot provide both :contentLocation and :content_location' if attributes.key?(:'contentLocation') && attributes.key?(:'content_location')

      self.content_location = attributes[:'content_location'] if attributes[:'content_location']

      self.event_id = attributes[:'eventId'] if attributes[:'eventId']

      raise 'You cannot provide both :eventId and :event_id' if attributes.key?(:'eventId') && attributes.key?(:'event_id')

      self.event_id = attributes[:'event_id'] if attributes[:'event_id']

      self.content_checksum = attributes[:'contentChecksum'] if attributes[:'contentChecksum']

      raise 'You cannot provide both :contentChecksum and :content_checksum' if attributes.key?(:'contentChecksum') && attributes.key?(:'content_checksum')

      self.content_checksum = attributes[:'content_checksum'] if attributes[:'content_checksum']

      self.retry_of_id = attributes[:'retryOfId'] if attributes[:'retryOfId']

      raise 'You cannot provide both :retryOfId and :retry_of_id' if attributes.key?(:'retryOfId') && attributes.key?(:'retry_of_id')

      self.retry_of_id = attributes[:'retry_of_id'] if attributes[:'retry_of_id']

      self.retry_intervals = attributes[:'retryIntervals'] if attributes[:'retryIntervals']

      raise 'You cannot provide both :retryIntervals and :retry_intervals' if attributes.key?(:'retryIntervals') && attributes.key?(:'retry_intervals')

      self.retry_intervals = attributes[:'retry_intervals'] if attributes[:'retry_intervals']

      self.is_managed_by_autonomous_linux = attributes[:'isManagedByAutonomousLinux'] unless attributes[:'isManagedByAutonomousLinux'].nil?

      raise 'You cannot provide both :isManagedByAutonomousLinux and :is_managed_by_autonomous_linux' if attributes.key?(:'isManagedByAutonomousLinux') && attributes.key?(:'is_managed_by_autonomous_linux')

      self.is_managed_by_autonomous_linux = attributes[:'is_managed_by_autonomous_linux'] unless attributes[:'is_managed_by_autonomous_linux'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      # rubocop:disable Style/ConditionalAssignment
      if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)
        OCI.logger.debug("Unknown value for 'operation_type' [" + operation_type + "]. Mapping to 'OPERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_type = OPERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @operation_type = operation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation_type == other.operation_type &&
        status == other.status &&
        id == other.id &&
        description == other.description &&
        display_name == other.display_name &&
        message == other.message &&
        parent_id == other.parent_id &&
        children_id == other.children_id &&
        compartment_id == other.compartment_id &&
        resources == other.resources &&
        package_names == other.package_names &&
        windows_update_names == other.windows_update_names &&
        module_specs == other.module_specs &&
        percent_complete == other.percent_complete &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        initiator_id == other.initiator_id &&
        management_station == other.management_station &&
        time_scheduled == other.time_scheduled &&
        content_location == other.content_location &&
        event_id == other.event_id &&
        content_checksum == other.content_checksum &&
        retry_of_id == other.retry_of_id &&
        retry_intervals == other.retry_intervals &&
        is_managed_by_autonomous_linux == other.is_managed_by_autonomous_linux
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
      [operation_type, status, id, description, display_name, message, parent_id, children_id, compartment_id, resources, package_names, windows_update_names, module_specs, percent_complete, time_created, time_updated, time_started, time_finished, initiator_id, management_station, time_scheduled, content_location, event_id, content_checksum, retry_of_id, retry_intervals, is_managed_by_autonomous_linux].hash
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
