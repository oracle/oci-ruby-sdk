# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Incident information that forms the basis of an announcement. Avoid entering confidential information.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class AnnouncementsService::Models::BaseAnnouncement
    ANNOUNCEMENT_TYPE_ENUM = [
      ANNOUNCEMENT_TYPE_ACTION_RECOMMENDED = 'ACTION_RECOMMENDED'.freeze,
      ANNOUNCEMENT_TYPE_ACTION_REQUIRED = 'ACTION_REQUIRED'.freeze,
      ANNOUNCEMENT_TYPE_EMERGENCY_CHANGE = 'EMERGENCY_CHANGE'.freeze,
      ANNOUNCEMENT_TYPE_EMERGENCY_MAINTENANCE = 'EMERGENCY_MAINTENANCE'.freeze,
      ANNOUNCEMENT_TYPE_EMERGENCY_MAINTENANCE_COMPLETE = 'EMERGENCY_MAINTENANCE_COMPLETE'.freeze,
      ANNOUNCEMENT_TYPE_EMERGENCY_MAINTENANCE_EXTENDED = 'EMERGENCY_MAINTENANCE_EXTENDED'.freeze,
      ANNOUNCEMENT_TYPE_EMERGENCY_MAINTENANCE_RESCHEDULED = 'EMERGENCY_MAINTENANCE_RESCHEDULED'.freeze,
      ANNOUNCEMENT_TYPE_INFORMATION = 'INFORMATION'.freeze,
      ANNOUNCEMENT_TYPE_PLANNED_CHANGE = 'PLANNED_CHANGE'.freeze,
      ANNOUNCEMENT_TYPE_PLANNED_CHANGE_COMPLETE = 'PLANNED_CHANGE_COMPLETE'.freeze,
      ANNOUNCEMENT_TYPE_PLANNED_CHANGE_EXTENDED = 'PLANNED_CHANGE_EXTENDED'.freeze,
      ANNOUNCEMENT_TYPE_PLANNED_CHANGE_RESCHEDULED = 'PLANNED_CHANGE_RESCHEDULED'.freeze,
      ANNOUNCEMENT_TYPE_PRODUCTION_EVENT_NOTIFICATION = 'PRODUCTION_EVENT_NOTIFICATION'.freeze,
      ANNOUNCEMENT_TYPE_SCHEDULED_MAINTENANCE = 'SCHEDULED_MAINTENANCE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze
    ].freeze

    # **[Required]** The OCID of the announcement.
    # @return [String]
    attr_accessor :id

    # **[Required]** The entity type.
    # @return [String]
    attr_accessor :type

    # **[Required]** The reference Jira ticket number.
    # @return [String]
    attr_accessor :reference_ticket_number

    # **[Required]** A summary of the issue. A summary might appear in the console banner view of the announcement or in
    # an email subject line. Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :summary

    # The label associated with an initial time value.
    # Example: `Time Started`
    #
    # @return [String]
    attr_accessor :time_one_title

    # The actual value of the first time value for the event. Typically, this is the time an event started, but the meaning
    # can vary, depending on the announcement type.
    #
    # @return [DateTime]
    attr_accessor :time_one_value

    # The label associated with a second time value.
    # Example: `Time Ended`
    #
    # @return [String]
    attr_accessor :time_two_title

    # The actual value of the second time value. Typically, this is the time an event ended, but the meaning
    # can vary, depending on the announcement type.
    #
    # @return [DateTime]
    attr_accessor :time_two_value

    # **[Required]** Impacted Oracle Cloud Infrastructure services.
    # @return [Array<String>]
    attr_accessor :services

    # **[Required]** Impacted regions.
    # @return [Array<String>]
    attr_accessor :affected_regions

    # **[Required]** The type of announcement. An announcement's type signals its severity.
    # @return [String]
    attr_reader :announcement_type

    # **[Required]** The current lifecycle state of the announcement.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** Whether the announcement is displayed as a banner in the console.
    # @return [BOOLEAN]
    attr_accessor :is_banner

    # The date and time the announcement was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-01-01T17:43:01.389+0000`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the announcement was last updated, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-01-01T17:43:01.389+0000`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'type': :'type',
        'reference_ticket_number': :'referenceTicketNumber',
        'summary': :'summary',
        'time_one_title': :'timeOneTitle',
        'time_one_value': :'timeOneValue',
        'time_two_title': :'timeTwoTitle',
        'time_two_value': :'timeTwoValue',
        'services': :'services',
        'affected_regions': :'affectedRegions',
        'announcement_type': :'announcementType',
        'lifecycle_state': :'lifecycleState',
        'is_banner': :'isBanner',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'type': :'String',
        'reference_ticket_number': :'String',
        'summary': :'String',
        'time_one_title': :'String',
        'time_one_value': :'DateTime',
        'time_two_title': :'String',
        'time_two_value': :'DateTime',
        'services': :'Array<String>',
        'affected_regions': :'Array<String>',
        'announcement_type': :'String',
        'lifecycle_state': :'String',
        'is_banner': :'BOOLEAN',
        'time_created': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::AnnouncementsService::Models::AnnouncementSummary' if type == 'AnnouncementSummary'
      return 'OCI::AnnouncementsService::Models::Announcement' if type == 'Announcement'

      # TODO: Log a warning when the subtype is not found.
      'OCI::AnnouncementsService::Models::BaseAnnouncement'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :reference_ticket_number The value to assign to the {#reference_ticket_number} property
    # @option attributes [String] :summary The value to assign to the {#summary} property
    # @option attributes [String] :time_one_title The value to assign to the {#time_one_title} property
    # @option attributes [DateTime] :time_one_value The value to assign to the {#time_one_value} property
    # @option attributes [String] :time_two_title The value to assign to the {#time_two_title} property
    # @option attributes [DateTime] :time_two_value The value to assign to the {#time_two_value} property
    # @option attributes [Array<String>] :services The value to assign to the {#services} property
    # @option attributes [Array<String>] :affected_regions The value to assign to the {#affected_regions} property
    # @option attributes [String] :announcement_type The value to assign to the {#announcement_type} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_banner The value to assign to the {#is_banner} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.type = attributes[:'type'] if attributes[:'type']

      self.reference_ticket_number = attributes[:'referenceTicketNumber'] if attributes[:'referenceTicketNumber']

      raise 'You cannot provide both :referenceTicketNumber and :reference_ticket_number' if attributes.key?(:'referenceTicketNumber') && attributes.key?(:'reference_ticket_number')

      self.reference_ticket_number = attributes[:'reference_ticket_number'] if attributes[:'reference_ticket_number']

      self.summary = attributes[:'summary'] if attributes[:'summary']

      self.time_one_title = attributes[:'timeOneTitle'] if attributes[:'timeOneTitle']

      raise 'You cannot provide both :timeOneTitle and :time_one_title' if attributes.key?(:'timeOneTitle') && attributes.key?(:'time_one_title')

      self.time_one_title = attributes[:'time_one_title'] if attributes[:'time_one_title']

      self.time_one_value = attributes[:'timeOneValue'] if attributes[:'timeOneValue']

      raise 'You cannot provide both :timeOneValue and :time_one_value' if attributes.key?(:'timeOneValue') && attributes.key?(:'time_one_value')

      self.time_one_value = attributes[:'time_one_value'] if attributes[:'time_one_value']

      self.time_two_title = attributes[:'timeTwoTitle'] if attributes[:'timeTwoTitle']

      raise 'You cannot provide both :timeTwoTitle and :time_two_title' if attributes.key?(:'timeTwoTitle') && attributes.key?(:'time_two_title')

      self.time_two_title = attributes[:'time_two_title'] if attributes[:'time_two_title']

      self.time_two_value = attributes[:'timeTwoValue'] if attributes[:'timeTwoValue']

      raise 'You cannot provide both :timeTwoValue and :time_two_value' if attributes.key?(:'timeTwoValue') && attributes.key?(:'time_two_value')

      self.time_two_value = attributes[:'time_two_value'] if attributes[:'time_two_value']

      self.services = attributes[:'services'] if attributes[:'services']

      self.affected_regions = attributes[:'affectedRegions'] if attributes[:'affectedRegions']

      raise 'You cannot provide both :affectedRegions and :affected_regions' if attributes.key?(:'affectedRegions') && attributes.key?(:'affected_regions')

      self.affected_regions = attributes[:'affected_regions'] if attributes[:'affected_regions']

      self.announcement_type = attributes[:'announcementType'] if attributes[:'announcementType']

      raise 'You cannot provide both :announcementType and :announcement_type' if attributes.key?(:'announcementType') && attributes.key?(:'announcement_type')

      self.announcement_type = attributes[:'announcement_type'] if attributes[:'announcement_type']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_banner = attributes[:'isBanner'] unless attributes[:'isBanner'].nil?

      raise 'You cannot provide both :isBanner and :is_banner' if attributes.key?(:'isBanner') && attributes.key?(:'is_banner')

      self.is_banner = attributes[:'is_banner'] unless attributes[:'is_banner'].nil?

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] announcement_type Object to be assigned
    def announcement_type=(announcement_type)
      raise "Invalid value for 'announcement_type': this must be one of the values in ANNOUNCEMENT_TYPE_ENUM." if announcement_type && !ANNOUNCEMENT_TYPE_ENUM.include?(announcement_type)

      @announcement_type = announcement_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      raise "Invalid value for 'lifecycle_state': this must be one of the values in LIFECYCLE_STATE_ENUM." if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)

      @lifecycle_state = lifecycle_state
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        type == other.type &&
        reference_ticket_number == other.reference_ticket_number &&
        summary == other.summary &&
        time_one_title == other.time_one_title &&
        time_one_value == other.time_one_value &&
        time_two_title == other.time_two_title &&
        time_two_value == other.time_two_value &&
        services == other.services &&
        affected_regions == other.affected_regions &&
        announcement_type == other.announcement_type &&
        lifecycle_state == other.lifecycle_state &&
        is_banner == other.is_banner &&
        time_created == other.time_created &&
        time_updated == other.time_updated
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
      [id, type, reference_ticket_number, summary, time_one_title, time_one_value, time_two_title, time_two_value, services, affected_regions, announcement_type, lifecycle_state, is_banner, time_created, time_updated].hash
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
