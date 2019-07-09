# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of a Maintenance Run.
  #
  class Database::Models::MaintenanceRunSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_SCHEDULED = 'SCHEDULED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_SKIPPED = 'SKIPPED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TARGET_RESOURCE_TYPE_ENUM = [
      TARGET_RESOURCE_TYPE_AUTONOMOUS_EXADATA_INFRASTRUCTURE = 'AUTONOMOUS_EXADATA_INFRASTRUCTURE'.freeze,
      TARGET_RESOURCE_TYPE_AUTONOMOUS_CONTAINER_DATABASE = 'AUTONOMOUS_CONTAINER_DATABASE'.freeze,
      TARGET_RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MAINTENANCE_TYPE_ENUM = [
      MAINTENANCE_TYPE_PLANNED = 'PLANNED'.freeze,
      MAINTENANCE_TYPE_UNPLANNED = 'UNPLANNED'.freeze,
      MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MAINTENANCE_SUBTYPE_ENUM = [
      MAINTENANCE_SUBTYPE_QUARTERLY = 'QUARTERLY'.freeze,
      MAINTENANCE_SUBTYPE_HARDWARE = 'HARDWARE'.freeze,
      MAINTENANCE_SUBTYPE_CRITICAL = 'CRITICAL'.freeze,
      MAINTENANCE_SUBTYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the Maintenance Run.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-friendly name for the Maintenance Run.
    # @return [String]
    attr_accessor :display_name

    # The text describing this Maintenance Run.
    # @return [String]
    attr_accessor :description

    # **[Required]** The current state of the Maintenance Run.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The date and time the Maintenance Run is scheduled for.
    # @return [DateTime]
    attr_accessor :time_scheduled

    # The date and time the Maintenance Run starts.
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time the Maintenance Run was completed.
    # @return [DateTime]
    attr_accessor :time_ended

    # The type of the target resource on which the Maintenance Run occurs.
    # @return [String]
    attr_reader :target_resource_type

    # The ID of the target resource on which the Maintenance Run occurs.
    # @return [String]
    attr_accessor :target_resource_id

    # Maintenance type.
    # @return [String]
    attr_reader :maintenance_type

    # Maintenance sub-type.
    # @return [String]
    attr_reader :maintenance_subtype

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_scheduled': :'timeScheduled',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded',
        'target_resource_type': :'targetResourceType',
        'target_resource_id': :'targetResourceId',
        'maintenance_type': :'maintenanceType',
        'maintenance_subtype': :'maintenanceSubtype'
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
        'description': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_scheduled': :'DateTime',
        'time_started': :'DateTime',
        'time_ended': :'DateTime',
        'target_resource_type': :'String',
        'target_resource_id': :'String',
        'maintenance_type': :'String',
        'maintenance_subtype': :'String'
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
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_scheduled The value to assign to the {#time_scheduled} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [String] :target_resource_type The value to assign to the {#target_resource_type} property
    # @option attributes [String] :target_resource_id The value to assign to the {#target_resource_id} property
    # @option attributes [String] :maintenance_type The value to assign to the {#maintenance_type} property
    # @option attributes [String] :maintenance_subtype The value to assign to the {#maintenance_subtype} property
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

      self.description = attributes[:'description'] if attributes[:'description']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_scheduled = attributes[:'timeScheduled'] if attributes[:'timeScheduled']

      raise 'You cannot provide both :timeScheduled and :time_scheduled' if attributes.key?(:'timeScheduled') && attributes.key?(:'time_scheduled')

      self.time_scheduled = attributes[:'time_scheduled'] if attributes[:'time_scheduled']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.target_resource_type = attributes[:'targetResourceType'] if attributes[:'targetResourceType']

      raise 'You cannot provide both :targetResourceType and :target_resource_type' if attributes.key?(:'targetResourceType') && attributes.key?(:'target_resource_type')

      self.target_resource_type = attributes[:'target_resource_type'] if attributes[:'target_resource_type']

      self.target_resource_id = attributes[:'targetResourceId'] if attributes[:'targetResourceId']

      raise 'You cannot provide both :targetResourceId and :target_resource_id' if attributes.key?(:'targetResourceId') && attributes.key?(:'target_resource_id')

      self.target_resource_id = attributes[:'target_resource_id'] if attributes[:'target_resource_id']

      self.maintenance_type = attributes[:'maintenanceType'] if attributes[:'maintenanceType']

      raise 'You cannot provide both :maintenanceType and :maintenance_type' if attributes.key?(:'maintenanceType') && attributes.key?(:'maintenance_type')

      self.maintenance_type = attributes[:'maintenance_type'] if attributes[:'maintenance_type']

      self.maintenance_subtype = attributes[:'maintenanceSubtype'] if attributes[:'maintenanceSubtype']

      raise 'You cannot provide both :maintenanceSubtype and :maintenance_subtype' if attributes.key?(:'maintenanceSubtype') && attributes.key?(:'maintenance_subtype')

      self.maintenance_subtype = attributes[:'maintenance_subtype'] if attributes[:'maintenance_subtype']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
    # @param [Object] target_resource_type Object to be assigned
    def target_resource_type=(target_resource_type)
      # rubocop:disable Style/ConditionalAssignment
      if target_resource_type && !TARGET_RESOURCE_TYPE_ENUM.include?(target_resource_type)
        OCI.logger.debug("Unknown value for 'target_resource_type' [" + target_resource_type + "]. Mapping to 'TARGET_RESOURCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @target_resource_type = TARGET_RESOURCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @target_resource_type = target_resource_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] maintenance_type Object to be assigned
    def maintenance_type=(maintenance_type)
      # rubocop:disable Style/ConditionalAssignment
      if maintenance_type && !MAINTENANCE_TYPE_ENUM.include?(maintenance_type)
        OCI.logger.debug("Unknown value for 'maintenance_type' [" + maintenance_type + "]. Mapping to 'MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @maintenance_type = MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @maintenance_type = maintenance_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] maintenance_subtype Object to be assigned
    def maintenance_subtype=(maintenance_subtype)
      # rubocop:disable Style/ConditionalAssignment
      if maintenance_subtype && !MAINTENANCE_SUBTYPE_ENUM.include?(maintenance_subtype)
        OCI.logger.debug("Unknown value for 'maintenance_subtype' [" + maintenance_subtype + "]. Mapping to 'MAINTENANCE_SUBTYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @maintenance_subtype = MAINTENANCE_SUBTYPE_UNKNOWN_ENUM_VALUE
      else
        @maintenance_subtype = maintenance_subtype
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
        description == other.description &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_scheduled == other.time_scheduled &&
        time_started == other.time_started &&
        time_ended == other.time_ended &&
        target_resource_type == other.target_resource_type &&
        target_resource_id == other.target_resource_id &&
        maintenance_type == other.maintenance_type &&
        maintenance_subtype == other.maintenance_subtype
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
      [id, compartment_id, display_name, description, lifecycle_state, lifecycle_details, time_scheduled, time_started, time_ended, target_resource_type, target_resource_id, maintenance_type, maintenance_subtype].hash
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
