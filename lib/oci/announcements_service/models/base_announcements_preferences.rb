# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The object that contains the announcement email preferences configured for the tenancy (root compartment).
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class AnnouncementsService::Models::BaseAnnouncementsPreferences
    # **[Required]** The entity type, which specifies either an object or a summary object for announcement email preferences.
    # @return [String]
    attr_accessor :type

    # The OCID of the compartment for which the email preferences apply. Because announcements are
    # specific to a tenancy, specify the tenancy by providing the root compartment OCID.
    #
    # @return [String]
    attr_accessor :compartment_id

    # The ID of the preferences.
    # @return [String]
    attr_accessor :id

    # A Boolean value to indicate whether the specified compartment chooses to not to receive informational announcements by email.
    # (Manage preferences for receiving announcements by email by specifying the `preferenceType` attribute instead.)
    #
    # @return [BOOLEAN]
    attr_accessor :is_unsubscribed

    # When the preferences were set initially.
    # @return [DateTime]
    attr_accessor :time_created

    # When the preferences were last updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # The string representing the user's preference regarding receiving announcements by email.
    # @return [String]
    attr_accessor :preference_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'compartment_id': :'compartmentId',
        'id': :'id',
        'is_unsubscribed': :'isUnsubscribed',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'preference_type': :'preferenceType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'compartment_id': :'String',
        'id': :'String',
        'is_unsubscribed': :'BOOLEAN',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'preference_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::AnnouncementsService::Models::AnnouncementsPreferencesSummary' if type == 'AnnouncementsPreferencesSummary'
      return 'OCI::AnnouncementsService::Models::AnnouncementsPreferences' if type == 'AnnouncementsPreferences'

      # TODO: Log a warning when the subtype is not found.
      'OCI::AnnouncementsService::Models::BaseAnnouncementsPreferences'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [BOOLEAN] :is_unsubscribed The value to assign to the {#is_unsubscribed} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :preference_type The value to assign to the {#preference_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.id = attributes[:'id'] if attributes[:'id']

      self.is_unsubscribed = attributes[:'isUnsubscribed'] unless attributes[:'isUnsubscribed'].nil?

      raise 'You cannot provide both :isUnsubscribed and :is_unsubscribed' if attributes.key?(:'isUnsubscribed') && attributes.key?(:'is_unsubscribed')

      self.is_unsubscribed = attributes[:'is_unsubscribed'] unless attributes[:'is_unsubscribed'].nil?

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.preference_type = attributes[:'preferenceType'] if attributes[:'preferenceType']

      raise 'You cannot provide both :preferenceType and :preference_type' if attributes.key?(:'preferenceType') && attributes.key?(:'preference_type')

      self.preference_type = attributes[:'preference_type'] if attributes[:'preference_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        compartment_id == other.compartment_id &&
        id == other.id &&
        is_unsubscribed == other.is_unsubscribed &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        preference_type == other.preference_type
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
      [type, compartment_id, id, is_unsubscribed, time_created, time_updated, preference_type].hash
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
