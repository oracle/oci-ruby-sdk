# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20211201
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the scheduled activity for a Fusion environment.
  class FusionApps::Models::ScheduledActivitySummary
    # **[Required]** Unique identifier that is immutable on creation.
    # @return [String]
    attr_accessor :id

    # **[Required]** A friendly name for the scheduled activity. Can be changed later.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The run cadence of this scheduled activity. Valid values are Quarterly, Monthly, OneOff, and Vertex.
    # @return [String]
    attr_accessor :run_cycle

    # **[Required]** The OCID of the Fusion environment for the scheduled activity.
    # @return [String]
    attr_accessor :fusion_environment_id

    # **[Required]** The current state of the scheduled activity. Valid values are Scheduled, In progress , Failed, Completed.
    # @return [String]
    attr_accessor :lifecycle_state

    # List of actions
    # @return [Array<OCI::FusionApps::Models::Action>]
    attr_accessor :actions

    # **[Required]** Current time the scheduled activity is scheduled to start. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_scheduled_start

    # **[Required]** Current time the scheduled activity is scheduled to end. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_expected_finish

    # The time the scheduled activity actually completed / cancelled / failed. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_finished

    # Cumulative delay hours
    # @return [Integer]
    attr_accessor :delay_in_hours

    # **[Required]** Service availability / impact during scheduled activity execution, up down
    # @return [String]
    attr_accessor :service_availability

    # The time the scheduled activity record was created. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_accepted

    # The time the scheduled activity record was updated. An RFC3339 formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** A property describing the phase of the scheduled activity.
    # @return [String]
    attr_accessor :scheduled_activity_phase

    # **[Required]** The unique identifier that associates a scheduled activity with others in one complete maintenance. For example, with ZDT, a complete upgrade maintenance includes 5 scheduled activities - PREPARE, EXECUTE, POST, PRE_MAINTENANCE, and POST_MAINTENANCE. All of them share the same unique identifier - scheduledActivityAssociationId.
    # @return [String]
    attr_accessor :scheduled_activity_association_id

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
        'id': :'id',
        'display_name': :'displayName',
        'run_cycle': :'runCycle',
        'fusion_environment_id': :'fusionEnvironmentId',
        'lifecycle_state': :'lifecycleState',
        'actions': :'actions',
        'time_scheduled_start': :'timeScheduledStart',
        'time_expected_finish': :'timeExpectedFinish',
        'time_finished': :'timeFinished',
        'delay_in_hours': :'delayInHours',
        'service_availability': :'serviceAvailability',
        'time_accepted': :'timeAccepted',
        'time_updated': :'timeUpdated',
        'lifecycle_details': :'lifecycleDetails',
        'scheduled_activity_phase': :'scheduledActivityPhase',
        'scheduled_activity_association_id': :'scheduledActivityAssociationId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'run_cycle': :'String',
        'fusion_environment_id': :'String',
        'lifecycle_state': :'String',
        'actions': :'Array<OCI::FusionApps::Models::Action>',
        'time_scheduled_start': :'DateTime',
        'time_expected_finish': :'DateTime',
        'time_finished': :'DateTime',
        'delay_in_hours': :'Integer',
        'service_availability': :'String',
        'time_accepted': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_details': :'String',
        'scheduled_activity_phase': :'String',
        'scheduled_activity_association_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :run_cycle The value to assign to the {#run_cycle} property
    # @option attributes [String] :fusion_environment_id The value to assign to the {#fusion_environment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Array<OCI::FusionApps::Models::Action>] :actions The value to assign to the {#actions} property
    # @option attributes [DateTime] :time_scheduled_start The value to assign to the {#time_scheduled_start} property
    # @option attributes [DateTime] :time_expected_finish The value to assign to the {#time_expected_finish} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [Integer] :delay_in_hours The value to assign to the {#delay_in_hours} property
    # @option attributes [String] :service_availability The value to assign to the {#service_availability} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :scheduled_activity_phase The value to assign to the {#scheduled_activity_phase} property
    # @option attributes [String] :scheduled_activity_association_id The value to assign to the {#scheduled_activity_association_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.run_cycle = attributes[:'runCycle'] if attributes[:'runCycle']

      raise 'You cannot provide both :runCycle and :run_cycle' if attributes.key?(:'runCycle') && attributes.key?(:'run_cycle')

      self.run_cycle = attributes[:'run_cycle'] if attributes[:'run_cycle']

      self.fusion_environment_id = attributes[:'fusionEnvironmentId'] if attributes[:'fusionEnvironmentId']

      raise 'You cannot provide both :fusionEnvironmentId and :fusion_environment_id' if attributes.key?(:'fusionEnvironmentId') && attributes.key?(:'fusion_environment_id')

      self.fusion_environment_id = attributes[:'fusion_environment_id'] if attributes[:'fusion_environment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.actions = attributes[:'actions'] if attributes[:'actions']

      self.time_scheduled_start = attributes[:'timeScheduledStart'] if attributes[:'timeScheduledStart']

      raise 'You cannot provide both :timeScheduledStart and :time_scheduled_start' if attributes.key?(:'timeScheduledStart') && attributes.key?(:'time_scheduled_start')

      self.time_scheduled_start = attributes[:'time_scheduled_start'] if attributes[:'time_scheduled_start']

      self.time_expected_finish = attributes[:'timeExpectedFinish'] if attributes[:'timeExpectedFinish']

      raise 'You cannot provide both :timeExpectedFinish and :time_expected_finish' if attributes.key?(:'timeExpectedFinish') && attributes.key?(:'time_expected_finish')

      self.time_expected_finish = attributes[:'time_expected_finish'] if attributes[:'time_expected_finish']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.delay_in_hours = attributes[:'delayInHours'] if attributes[:'delayInHours']

      raise 'You cannot provide both :delayInHours and :delay_in_hours' if attributes.key?(:'delayInHours') && attributes.key?(:'delay_in_hours')

      self.delay_in_hours = attributes[:'delay_in_hours'] if attributes[:'delay_in_hours']

      self.service_availability = attributes[:'serviceAvailability'] if attributes[:'serviceAvailability']

      raise 'You cannot provide both :serviceAvailability and :service_availability' if attributes.key?(:'serviceAvailability') && attributes.key?(:'service_availability')

      self.service_availability = attributes[:'service_availability'] if attributes[:'service_availability']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.scheduled_activity_phase = attributes[:'scheduledActivityPhase'] if attributes[:'scheduledActivityPhase']

      raise 'You cannot provide both :scheduledActivityPhase and :scheduled_activity_phase' if attributes.key?(:'scheduledActivityPhase') && attributes.key?(:'scheduled_activity_phase')

      self.scheduled_activity_phase = attributes[:'scheduled_activity_phase'] if attributes[:'scheduled_activity_phase']

      self.scheduled_activity_association_id = attributes[:'scheduledActivityAssociationId'] if attributes[:'scheduledActivityAssociationId']

      raise 'You cannot provide both :scheduledActivityAssociationId and :scheduled_activity_association_id' if attributes.key?(:'scheduledActivityAssociationId') && attributes.key?(:'scheduled_activity_association_id')

      self.scheduled_activity_association_id = attributes[:'scheduled_activity_association_id'] if attributes[:'scheduled_activity_association_id']

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
        id == other.id &&
        display_name == other.display_name &&
        run_cycle == other.run_cycle &&
        fusion_environment_id == other.fusion_environment_id &&
        lifecycle_state == other.lifecycle_state &&
        actions == other.actions &&
        time_scheduled_start == other.time_scheduled_start &&
        time_expected_finish == other.time_expected_finish &&
        time_finished == other.time_finished &&
        delay_in_hours == other.delay_in_hours &&
        service_availability == other.service_availability &&
        time_accepted == other.time_accepted &&
        time_updated == other.time_updated &&
        lifecycle_details == other.lifecycle_details &&
        scheduled_activity_phase == other.scheduled_activity_phase &&
        scheduled_activity_association_id == other.scheduled_activity_association_id &&
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
      [id, display_name, run_cycle, fusion_environment_id, lifecycle_state, actions, time_scheduled_start, time_expected_finish, time_finished, delay_in_hours, service_availability, time_accepted, time_updated, lifecycle_details, scheduled_activity_phase, scheduled_activity_association_id, freeform_tags, defined_tags].hash
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