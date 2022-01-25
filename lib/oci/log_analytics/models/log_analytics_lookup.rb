# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsLookup
  class LogAnalytics::Models::LogAnalyticsLookup
    TYPE_ENUM = [
      TYPE_LOOKUP = 'Lookup'.freeze,
      TYPE_DICTIONARY = 'Dictionary'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The active edit version.
    # @return [Integer]
    attr_accessor :active_edit_version

    # The canonical link.
    # @return [String]
    attr_accessor :canonical_link

    # The lookup description.
    # @return [String]
    attr_accessor :description

    # The edit version.
    # @return [Integer]
    attr_accessor :edit_version

    # The lookup fields.
    # @return [Array<OCI::LogAnalytics::Models::LookupField>]
    attr_accessor :fields

    # The lookup reference as an integer.
    # @return [Integer]
    attr_accessor :lookup_reference

    # The lookup reference as a string.
    # @return [String]
    attr_accessor :lookup_reference_string

    # The lookup type.  Valid values are LOOKUP or DICTIONARY.
    # @return [String]
    attr_reader :type

    # The lookup name.
    # @return [String]
    attr_accessor :name

    # A flag indicating if the lookup is custom (user-defined) or
    # built in.
    #
    # @return [Integer]
    attr_accessor :is_built_in

    # A flag indicating if the lookup is hidden or not.  A hidden lookup will
    # not be returned in list operations by default.
    #
    # @return [BOOLEAN]
    attr_accessor :is_hidden

    # The lookup display name.
    # @return [String]
    attr_accessor :lookup_display_name

    # @return [OCI::LogAnalytics::Models::AutoLookups]
    attr_accessor :referring_sources

    # @return [OCI::LogAnalytics::Models::StatusSummary]
    attr_accessor :status_summary

    # The last updated date.
    # @return [DateTime]
    attr_accessor :time_updated

    # An array of categories assigned to this lookup.
    # The isSystem flag denotes if each category assignment is user-created or Oracle-defined.
    #
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsCategory>]
    attr_accessor :categories

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'active_edit_version': :'activeEditVersion',
        'canonical_link': :'canonicalLink',
        'description': :'description',
        'edit_version': :'editVersion',
        'fields': :'fields',
        'lookup_reference': :'lookupReference',
        'lookup_reference_string': :'lookupReferenceString',
        'type': :'type',
        'name': :'name',
        'is_built_in': :'isBuiltIn',
        'is_hidden': :'isHidden',
        'lookup_display_name': :'lookupDisplayName',
        'referring_sources': :'referringSources',
        'status_summary': :'statusSummary',
        'time_updated': :'timeUpdated',
        'categories': :'categories'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'active_edit_version': :'Integer',
        'canonical_link': :'String',
        'description': :'String',
        'edit_version': :'Integer',
        'fields': :'Array<OCI::LogAnalytics::Models::LookupField>',
        'lookup_reference': :'Integer',
        'lookup_reference_string': :'String',
        'type': :'String',
        'name': :'String',
        'is_built_in': :'Integer',
        'is_hidden': :'BOOLEAN',
        'lookup_display_name': :'String',
        'referring_sources': :'OCI::LogAnalytics::Models::AutoLookups',
        'status_summary': :'OCI::LogAnalytics::Models::StatusSummary',
        'time_updated': :'DateTime',
        'categories': :'Array<OCI::LogAnalytics::Models::LogAnalyticsCategory>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :active_edit_version The value to assign to the {#active_edit_version} property
    # @option attributes [String] :canonical_link The value to assign to the {#canonical_link} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LookupField>] :fields The value to assign to the {#fields} property
    # @option attributes [Integer] :lookup_reference The value to assign to the {#lookup_reference} property
    # @option attributes [String] :lookup_reference_string The value to assign to the {#lookup_reference_string} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :is_built_in The value to assign to the {#is_built_in} property
    # @option attributes [BOOLEAN] :is_hidden The value to assign to the {#is_hidden} property
    # @option attributes [String] :lookup_display_name The value to assign to the {#lookup_display_name} property
    # @option attributes [OCI::LogAnalytics::Models::AutoLookups] :referring_sources The value to assign to the {#referring_sources} property
    # @option attributes [OCI::LogAnalytics::Models::StatusSummary] :status_summary The value to assign to the {#status_summary} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsCategory>] :categories The value to assign to the {#categories} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.active_edit_version = attributes[:'activeEditVersion'] if attributes[:'activeEditVersion']

      raise 'You cannot provide both :activeEditVersion and :active_edit_version' if attributes.key?(:'activeEditVersion') && attributes.key?(:'active_edit_version')

      self.active_edit_version = attributes[:'active_edit_version'] if attributes[:'active_edit_version']

      self.canonical_link = attributes[:'canonicalLink'] if attributes[:'canonicalLink']

      raise 'You cannot provide both :canonicalLink and :canonical_link' if attributes.key?(:'canonicalLink') && attributes.key?(:'canonical_link')

      self.canonical_link = attributes[:'canonical_link'] if attributes[:'canonical_link']

      self.description = attributes[:'description'] if attributes[:'description']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.fields = attributes[:'fields'] if attributes[:'fields']

      self.lookup_reference = attributes[:'lookupReference'] if attributes[:'lookupReference']

      raise 'You cannot provide both :lookupReference and :lookup_reference' if attributes.key?(:'lookupReference') && attributes.key?(:'lookup_reference')

      self.lookup_reference = attributes[:'lookup_reference'] if attributes[:'lookup_reference']

      self.lookup_reference_string = attributes[:'lookupReferenceString'] if attributes[:'lookupReferenceString']

      raise 'You cannot provide both :lookupReferenceString and :lookup_reference_string' if attributes.key?(:'lookupReferenceString') && attributes.key?(:'lookup_reference_string')

      self.lookup_reference_string = attributes[:'lookup_reference_string'] if attributes[:'lookup_reference_string']

      self.type = attributes[:'type'] if attributes[:'type']
      self.type = "Lookup" if type.nil? && !attributes.key?(:'type') # rubocop:disable Style/StringLiterals

      self.name = attributes[:'name'] if attributes[:'name']

      self.is_built_in = attributes[:'isBuiltIn'] if attributes[:'isBuiltIn']

      raise 'You cannot provide both :isBuiltIn and :is_built_in' if attributes.key?(:'isBuiltIn') && attributes.key?(:'is_built_in')

      self.is_built_in = attributes[:'is_built_in'] if attributes[:'is_built_in']

      self.is_hidden = attributes[:'isHidden'] unless attributes[:'isHidden'].nil?

      raise 'You cannot provide both :isHidden and :is_hidden' if attributes.key?(:'isHidden') && attributes.key?(:'is_hidden')

      self.is_hidden = attributes[:'is_hidden'] unless attributes[:'is_hidden'].nil?

      self.lookup_display_name = attributes[:'lookupDisplayName'] if attributes[:'lookupDisplayName']

      raise 'You cannot provide both :lookupDisplayName and :lookup_display_name' if attributes.key?(:'lookupDisplayName') && attributes.key?(:'lookup_display_name')

      self.lookup_display_name = attributes[:'lookup_display_name'] if attributes[:'lookup_display_name']

      self.referring_sources = attributes[:'referringSources'] if attributes[:'referringSources']

      raise 'You cannot provide both :referringSources and :referring_sources' if attributes.key?(:'referringSources') && attributes.key?(:'referring_sources')

      self.referring_sources = attributes[:'referring_sources'] if attributes[:'referring_sources']

      self.status_summary = attributes[:'statusSummary'] if attributes[:'statusSummary']

      raise 'You cannot provide both :statusSummary and :status_summary' if attributes.key?(:'statusSummary') && attributes.key?(:'status_summary')

      self.status_summary = attributes[:'status_summary'] if attributes[:'status_summary']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.categories = attributes[:'categories'] if attributes[:'categories']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        active_edit_version == other.active_edit_version &&
        canonical_link == other.canonical_link &&
        description == other.description &&
        edit_version == other.edit_version &&
        fields == other.fields &&
        lookup_reference == other.lookup_reference &&
        lookup_reference_string == other.lookup_reference_string &&
        type == other.type &&
        name == other.name &&
        is_built_in == other.is_built_in &&
        is_hidden == other.is_hidden &&
        lookup_display_name == other.lookup_display_name &&
        referring_sources == other.referring_sources &&
        status_summary == other.status_summary &&
        time_updated == other.time_updated &&
        categories == other.categories
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
      [active_edit_version, canonical_link, description, edit_version, fields, lookup_reference, lookup_reference_string, type, name, is_built_in, is_hidden, lookup_display_name, referring_sources, status_summary, time_updated, categories].hash
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
