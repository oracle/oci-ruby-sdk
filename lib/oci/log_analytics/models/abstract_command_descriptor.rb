# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Generic command descriptor defining all attributes common to all querylanguage commands for parse output.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class LogAnalytics::Models::AbstractCommandDescriptor
    NAME_ENUM = [
      NAME_COMMAND = 'COMMAND'.freeze,
      NAME_SEARCH = 'SEARCH'.freeze,
      NAME_STATS = 'STATS'.freeze,
      NAME_TIME_STATS = 'TIME_STATS'.freeze,
      NAME_SORT = 'SORT'.freeze,
      NAME_FIELDS = 'FIELDS'.freeze,
      NAME_ADD_FIELDS = 'ADD_FIELDS'.freeze,
      NAME_LINK = 'LINK'.freeze,
      NAME_LINK_DETAILS = 'LINK_DETAILS'.freeze,
      NAME_CLUSTER = 'CLUSTER'.freeze,
      NAME_CLUSTER_DETAILS = 'CLUSTER_DETAILS'.freeze,
      NAME_CLUSTER_SPLIT = 'CLUSTER_SPLIT'.freeze,
      NAME_EVAL = 'EVAL'.freeze,
      NAME_EXTRACT = 'EXTRACT'.freeze,
      NAME_EVENT_STATS = 'EVENT_STATS'.freeze,
      NAME_BUCKET = 'BUCKET'.freeze,
      NAME_CLASSIFY = 'CLASSIFY'.freeze,
      NAME_TOP = 'TOP'.freeze,
      NAME_BOTTOM = 'BOTTOM'.freeze,
      NAME_HEAD = 'HEAD'.freeze,
      NAME_TAIL = 'TAIL'.freeze,
      NAME_FIELD_SUMMARY = 'FIELD_SUMMARY'.freeze,
      NAME_REGEX = 'REGEX'.freeze,
      NAME_RENAME = 'RENAME'.freeze,
      NAME_TIME_COMPARE = 'TIME_COMPARE'.freeze,
      NAME_WHERE = 'WHERE'.freeze,
      NAME_CLUSTER_COMPARE = 'CLUSTER_COMPARE'.freeze,
      NAME_DELETE = 'DELETE'.freeze,
      NAME_DELTA = 'DELTA'.freeze,
      NAME_DISTINCT = 'DISTINCT'.freeze,
      NAME_SEARCH_LOOKUP = 'SEARCH_LOOKUP'.freeze,
      NAME_LOOKUP = 'LOOKUP'.freeze,
      NAME_DEMO_MODE = 'DEMO_MODE'.freeze,
      NAME_MACRO = 'MACRO'.freeze,
      NAME_MULTI_SEARCH = 'MULTI_SEARCH'.freeze,
      NAME_HIGHLIGHT = 'HIGHLIGHT'.freeze,
      NAME_HIGHLIGHT_ROWS = 'HIGHLIGHT_ROWS'.freeze,
      NAME_HIGHLIGHT_GROUPS = 'HIGHLIGHT_GROUPS'.freeze,
      NAME_CREATE_VIEW = 'CREATE_VIEW'.freeze,
      NAME_MAP = 'MAP'.freeze,
      NAME_NLP = 'NLP'.freeze,
      NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of querylanguage command
    #
    # @return [String]
    attr_reader :name

    # **[Required]** Command fragment display string from user specified query string formatted by query builder.
    #
    # @return [String]
    attr_accessor :display_query_string

    # **[Required]** Command fragment internal string from user specified query string formatted by query builder.
    #
    # @return [String]
    attr_accessor :internal_query_string

    # querylanguage command designation for example; reporting vs filtering
    #
    # @return [String]
    attr_accessor :category

    # Fields referenced in command fragment from user specified query string.
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractField>]
    attr_accessor :referenced_fields

    # Fields declared in command fragment from user specified query string.
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractField>]
    attr_accessor :declared_fields

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'display_query_string': :'displayQueryString',
        'internal_query_string': :'internalQueryString',
        'category': :'category',
        'referenced_fields': :'referencedFields',
        'declared_fields': :'declaredFields'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_query_string': :'String',
        'internal_query_string': :'String',
        'category': :'String',
        'referenced_fields': :'Array<OCI::LogAnalytics::Models::AbstractField>',
        'declared_fields': :'Array<OCI::LogAnalytics::Models::AbstractField>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'name'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::LogAnalytics::Models::TopCommandDescriptor' if type == 'TOP'
      return 'OCI::LogAnalytics::Models::HighlightCommandDescriptor' if type == 'HIGHLIGHT'
      return 'OCI::LogAnalytics::Models::MultiSearchCommandDescriptor' if type == 'MULTI_SEARCH'
      return 'OCI::LogAnalytics::Models::StatsCommandDescriptor' if type == 'STATS'
      return 'OCI::LogAnalytics::Models::TimeCompareCommandDescriptor' if type == 'TIME_COMPARE'
      return 'OCI::LogAnalytics::Models::TailCommandDescriptor' if type == 'TAIL'
      return 'OCI::LogAnalytics::Models::RegexCommandDescriptor' if type == 'REGEX'
      return 'OCI::LogAnalytics::Models::DeltaCommandDescriptor' if type == 'DELTA'
      return 'OCI::LogAnalytics::Models::LookupCommandDescriptor' if type == 'LOOKUP'
      return 'OCI::LogAnalytics::Models::DemoModeCommandDescriptor' if type == 'DEMO_MODE'
      return 'OCI::LogAnalytics::Models::FieldSummaryCommandDescriptor' if type == 'FIELD_SUMMARY'
      return 'OCI::LogAnalytics::Models::MapCommandDescriptor' if type == 'MAP'
      return 'OCI::LogAnalytics::Models::EventStatsCommandDescriptor' if type == 'EVENT_STATS'
      return 'OCI::LogAnalytics::Models::HighlightGroupsCommandDescriptor' if type == 'HIGHLIGHT_GROUPS'
      return 'OCI::LogAnalytics::Models::WhereCommandDescriptor' if type == 'WHERE'
      return 'OCI::LogAnalytics::Models::ClusterSplitCommandDescriptor' if type == 'CLUSTER_SPLIT'
      return 'OCI::LogAnalytics::Models::TimeStatsCommandDescriptor' if type == 'TIME_STATS'
      return 'OCI::LogAnalytics::Models::ClusterCommandDescriptor' if type == 'CLUSTER'
      return 'OCI::LogAnalytics::Models::ClusterDetailsCommandDescriptor' if type == 'CLUSTER_DETAILS'
      return 'OCI::LogAnalytics::Models::DeleteCommandDescriptor' if type == 'DELETE'
      return 'OCI::LogAnalytics::Models::ClusterCompareCommandDescriptor' if type == 'CLUSTER_COMPARE'
      return 'OCI::LogAnalytics::Models::SearchCommandDescriptor' if type == 'SEARCH'
      return 'OCI::LogAnalytics::Models::BucketCommandDescriptor' if type == 'BUCKET'
      return 'OCI::LogAnalytics::Models::CommandDescriptor' if type == 'COMMAND'
      return 'OCI::LogAnalytics::Models::DistinctCommandDescriptor' if type == 'DISTINCT'
      return 'OCI::LogAnalytics::Models::LinkCommandDescriptor' if type == 'LINK'
      return 'OCI::LogAnalytics::Models::SortCommandDescriptor' if type == 'SORT'
      return 'OCI::LogAnalytics::Models::ExtractCommandDescriptor' if type == 'EXTRACT'
      return 'OCI::LogAnalytics::Models::NlpCommandDescriptor' if type == 'NLP'
      return 'OCI::LogAnalytics::Models::BottomCommandDescriptor' if type == 'BOTTOM'
      return 'OCI::LogAnalytics::Models::FieldsCommandDescriptor' if type == 'FIELDS'
      return 'OCI::LogAnalytics::Models::HighlightRowsCommandDescriptor' if type == 'HIGHLIGHT_ROWS'
      return 'OCI::LogAnalytics::Models::MacroCommandDescriptor' if type == 'MACRO'
      return 'OCI::LogAnalytics::Models::ClassifyCommandDescriptor' if type == 'CLASSIFY'
      return 'OCI::LogAnalytics::Models::LinkDetailsCommandDescriptor' if type == 'LINK_DETAILS'
      return 'OCI::LogAnalytics::Models::SearchLookupCommandDescriptor' if type == 'SEARCH_LOOKUP'
      return 'OCI::LogAnalytics::Models::HeadCommandDescriptor' if type == 'HEAD'
      return 'OCI::LogAnalytics::Models::CreateViewCommandDescriptor' if type == 'CREATE_VIEW'
      return 'OCI::LogAnalytics::Models::AddFieldsCommandDescriptor' if type == 'ADD_FIELDS'
      return 'OCI::LogAnalytics::Models::EvalCommandDescriptor' if type == 'EVAL'
      return 'OCI::LogAnalytics::Models::RenameCommandDescriptor' if type == 'RENAME'

      # TODO: Log a warning when the subtype is not found.
      'OCI::LogAnalytics::Models::AbstractCommandDescriptor'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_query_string The value to assign to the {#display_query_string} property
    # @option attributes [String] :internal_query_string The value to assign to the {#internal_query_string} property
    # @option attributes [String] :category The value to assign to the {#category} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractField>] :referenced_fields The value to assign to the {#referenced_fields} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractField>] :declared_fields The value to assign to the {#declared_fields} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_query_string = attributes[:'displayQueryString'] if attributes[:'displayQueryString']

      raise 'You cannot provide both :displayQueryString and :display_query_string' if attributes.key?(:'displayQueryString') && attributes.key?(:'display_query_string')

      self.display_query_string = attributes[:'display_query_string'] if attributes[:'display_query_string']

      self.internal_query_string = attributes[:'internalQueryString'] if attributes[:'internalQueryString']

      raise 'You cannot provide both :internalQueryString and :internal_query_string' if attributes.key?(:'internalQueryString') && attributes.key?(:'internal_query_string')

      self.internal_query_string = attributes[:'internal_query_string'] if attributes[:'internal_query_string']

      self.category = attributes[:'category'] if attributes[:'category']

      self.referenced_fields = attributes[:'referencedFields'] if attributes[:'referencedFields']

      raise 'You cannot provide both :referencedFields and :referenced_fields' if attributes.key?(:'referencedFields') && attributes.key?(:'referenced_fields')

      self.referenced_fields = attributes[:'referenced_fields'] if attributes[:'referenced_fields']

      self.declared_fields = attributes[:'declaredFields'] if attributes[:'declaredFields']

      raise 'You cannot provide both :declaredFields and :declared_fields' if attributes.key?(:'declaredFields') && attributes.key?(:'declared_fields')

      self.declared_fields = attributes[:'declared_fields'] if attributes[:'declared_fields']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] name Object to be assigned
    def name=(name)
      # rubocop:disable Style/ConditionalAssignment
      if name && !NAME_ENUM.include?(name)
        OCI.logger.debug("Unknown value for 'name' [" + name + "]. Mapping to 'NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @name = NAME_UNKNOWN_ENUM_VALUE
      else
        @name = name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        display_query_string == other.display_query_string &&
        internal_query_string == other.internal_query_string &&
        category == other.category &&
        referenced_fields == other.referenced_fields &&
        declared_fields == other.declared_fields
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
      [name, display_query_string, internal_query_string, category, referenced_fields, declared_fields].hash
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
