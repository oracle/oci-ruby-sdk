# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'
require_relative 'base_announcement'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary representation of an announcement.
  #
  class AnnouncementsService::Models::AnnouncementSummary < AnnouncementsService::Models::BaseAnnouncement
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#id #id} proprety
    # @option attributes [String] :reference_ticket_number The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#reference_ticket_number #reference_ticket_number} proprety
    # @option attributes [String] :summary The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#summary #summary} proprety
    # @option attributes [String] :time_one_title The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#time_one_title #time_one_title} proprety
    # @option attributes [DateTime] :time_one_value The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#time_one_value #time_one_value} proprety
    # @option attributes [String] :time_two_title The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#time_two_title #time_two_title} proprety
    # @option attributes [DateTime] :time_two_value The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#time_two_value #time_two_value} proprety
    # @option attributes [Array<String>] :services The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#services #services} proprety
    # @option attributes [Array<String>] :affected_regions The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#affected_regions #affected_regions} proprety
    # @option attributes [String] :announcement_type The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#announcement_type #announcement_type} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#lifecycle_state #lifecycle_state} proprety
    # @option attributes [BOOLEAN] :is_banner The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#is_banner #is_banner} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::AnnouncementsService::Models::BaseAnnouncement#time_updated #time_updated} proprety
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'AnnouncementSummary'

      super(attributes)
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
