# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LoganParserDetails
  class LogAnalytics::Models::LogAnalyticsParser
    TYPE_ENUM = [
      TYPE_XML = 'XML'.freeze,
      TYPE_JSON = 'JSON'.freeze,
      TYPE_REGEX = 'REGEX'.freeze,
      TYPE_ODL = 'ODL'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # content
    # @return [String]
    attr_accessor :content

    # description
    # @return [String]
    attr_accessor :description

    # display name
    # @return [String]
    attr_accessor :display_name

    # edit version
    # @return [Integer]
    attr_accessor :edit_version

    # encoding
    # @return [String]
    attr_accessor :encoding

    # example content
    # @return [String]
    attr_accessor :example_content

    # fields Maps
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParserField>]
    attr_accessor :field_maps

    # footer regular expression
    # @return [String]
    attr_accessor :footer_content

    # header content
    # @return [String]
    attr_accessor :header_content

    # Name
    # @return [String]
    attr_accessor :name

    # is default flag
    # @return [BOOLEAN]
    attr_accessor :is_default

    # is single line content
    # @return [BOOLEAN]
    attr_accessor :is_single_line_content

    # is system flag
    # @return [BOOLEAN]
    attr_accessor :is_system

    # language
    # @return [String]
    attr_accessor :language

    # last updated date
    # @return [DateTime]
    attr_accessor :time_updated

    # log type test request version
    # @return [Integer]
    attr_accessor :log_type_test_request_version

    # mapped parser list
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>]
    attr_accessor :mapped_parsers

    # parser ignore line characters
    # @return [String]
    attr_accessor :parser_ignoreline_characters

    # is hidden flag
    # @return [BOOLEAN]
    attr_accessor :is_hidden

    # sequence
    # @return [Integer]
    attr_accessor :parser_sequence

    # time zone
    # @return [String]
    attr_accessor :parser_timezone

    # @return [OCI::LogAnalytics::Models::LogAnalyticsParserFilter]
    attr_accessor :parser_filter

    # write once
    # @return [BOOLEAN]
    attr_accessor :is_parser_written_once

    # plugin instance list
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsParserFunction>]
    attr_accessor :parser_functions

    # sources using this parser
    # @return [Integer]
    attr_accessor :sources_count

    # sources using list
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsSource>]
    attr_accessor :sources

    # tokenize original text
    # @return [BOOLEAN]
    attr_accessor :should_tokenize_original_text

    # type
    # @return [String]
    attr_reader :type

    # user deleted flag
    # @return [BOOLEAN]
    attr_accessor :is_user_deleted

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'content': :'content',
        'description': :'description',
        'display_name': :'displayName',
        'edit_version': :'editVersion',
        'encoding': :'encoding',
        'example_content': :'exampleContent',
        'field_maps': :'fieldMaps',
        'footer_content': :'footerContent',
        'header_content': :'headerContent',
        'name': :'name',
        'is_default': :'isDefault',
        'is_single_line_content': :'isSingleLineContent',
        'is_system': :'isSystem',
        'language': :'language',
        'time_updated': :'timeUpdated',
        'log_type_test_request_version': :'logTypeTestRequestVersion',
        'mapped_parsers': :'mappedParsers',
        'parser_ignoreline_characters': :'parserIgnorelineCharacters',
        'is_hidden': :'isHidden',
        'parser_sequence': :'parserSequence',
        'parser_timezone': :'parserTimezone',
        'parser_filter': :'parserFilter',
        'is_parser_written_once': :'isParserWrittenOnce',
        'parser_functions': :'parserFunctions',
        'sources_count': :'sourcesCount',
        'sources': :'sources',
        'should_tokenize_original_text': :'shouldTokenizeOriginalText',
        'type': :'type',
        'is_user_deleted': :'isUserDeleted'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'content': :'String',
        'description': :'String',
        'display_name': :'String',
        'edit_version': :'Integer',
        'encoding': :'String',
        'example_content': :'String',
        'field_maps': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParserField>',
        'footer_content': :'String',
        'header_content': :'String',
        'name': :'String',
        'is_default': :'BOOLEAN',
        'is_single_line_content': :'BOOLEAN',
        'is_system': :'BOOLEAN',
        'language': :'String',
        'time_updated': :'DateTime',
        'log_type_test_request_version': :'Integer',
        'mapped_parsers': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParser>',
        'parser_ignoreline_characters': :'String',
        'is_hidden': :'BOOLEAN',
        'parser_sequence': :'Integer',
        'parser_timezone': :'String',
        'parser_filter': :'OCI::LogAnalytics::Models::LogAnalyticsParserFilter',
        'is_parser_written_once': :'BOOLEAN',
        'parser_functions': :'Array<OCI::LogAnalytics::Models::LogAnalyticsParserFunction>',
        'sources_count': :'Integer',
        'sources': :'Array<OCI::LogAnalytics::Models::LogAnalyticsSource>',
        'should_tokenize_original_text': :'BOOLEAN',
        'type': :'String',
        'is_user_deleted': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :content The value to assign to the {#content} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [String] :encoding The value to assign to the {#encoding} property
    # @option attributes [String] :example_content The value to assign to the {#example_content} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParserField>] :field_maps The value to assign to the {#field_maps} property
    # @option attributes [String] :footer_content The value to assign to the {#footer_content} property
    # @option attributes [String] :header_content The value to assign to the {#header_content} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    # @option attributes [BOOLEAN] :is_single_line_content The value to assign to the {#is_single_line_content} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [String] :language The value to assign to the {#language} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Integer] :log_type_test_request_version The value to assign to the {#log_type_test_request_version} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParser>] :mapped_parsers The value to assign to the {#mapped_parsers} property
    # @option attributes [String] :parser_ignoreline_characters The value to assign to the {#parser_ignoreline_characters} property
    # @option attributes [BOOLEAN] :is_hidden The value to assign to the {#is_hidden} property
    # @option attributes [Integer] :parser_sequence The value to assign to the {#parser_sequence} property
    # @option attributes [String] :parser_timezone The value to assign to the {#parser_timezone} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsParserFilter] :parser_filter The value to assign to the {#parser_filter} property
    # @option attributes [BOOLEAN] :is_parser_written_once The value to assign to the {#is_parser_written_once} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsParserFunction>] :parser_functions The value to assign to the {#parser_functions} property
    # @option attributes [Integer] :sources_count The value to assign to the {#sources_count} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsSource>] :sources The value to assign to the {#sources} property
    # @option attributes [BOOLEAN] :should_tokenize_original_text The value to assign to the {#should_tokenize_original_text} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [BOOLEAN] :is_user_deleted The value to assign to the {#is_user_deleted} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.content = attributes[:'content'] if attributes[:'content']

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.encoding = attributes[:'encoding'] if attributes[:'encoding']

      self.example_content = attributes[:'exampleContent'] if attributes[:'exampleContent']

      raise 'You cannot provide both :exampleContent and :example_content' if attributes.key?(:'exampleContent') && attributes.key?(:'example_content')

      self.example_content = attributes[:'example_content'] if attributes[:'example_content']

      self.field_maps = attributes[:'fieldMaps'] if attributes[:'fieldMaps']

      raise 'You cannot provide both :fieldMaps and :field_maps' if attributes.key?(:'fieldMaps') && attributes.key?(:'field_maps')

      self.field_maps = attributes[:'field_maps'] if attributes[:'field_maps']

      self.footer_content = attributes[:'footerContent'] if attributes[:'footerContent']

      raise 'You cannot provide both :footerContent and :footer_content' if attributes.key?(:'footerContent') && attributes.key?(:'footer_content')

      self.footer_content = attributes[:'footer_content'] if attributes[:'footer_content']

      self.header_content = attributes[:'headerContent'] if attributes[:'headerContent']

      raise 'You cannot provide both :headerContent and :header_content' if attributes.key?(:'headerContent') && attributes.key?(:'header_content')

      self.header_content = attributes[:'header_content'] if attributes[:'header_content']

      self.name = attributes[:'name'] if attributes[:'name']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?

      self.is_single_line_content = attributes[:'isSingleLineContent'] unless attributes[:'isSingleLineContent'].nil?

      raise 'You cannot provide both :isSingleLineContent and :is_single_line_content' if attributes.key?(:'isSingleLineContent') && attributes.key?(:'is_single_line_content')

      self.is_single_line_content = attributes[:'is_single_line_content'] unless attributes[:'is_single_line_content'].nil?

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.language = attributes[:'language'] if attributes[:'language']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.log_type_test_request_version = attributes[:'logTypeTestRequestVersion'] if attributes[:'logTypeTestRequestVersion']

      raise 'You cannot provide both :logTypeTestRequestVersion and :log_type_test_request_version' if attributes.key?(:'logTypeTestRequestVersion') && attributes.key?(:'log_type_test_request_version')

      self.log_type_test_request_version = attributes[:'log_type_test_request_version'] if attributes[:'log_type_test_request_version']

      self.mapped_parsers = attributes[:'mappedParsers'] if attributes[:'mappedParsers']

      raise 'You cannot provide both :mappedParsers and :mapped_parsers' if attributes.key?(:'mappedParsers') && attributes.key?(:'mapped_parsers')

      self.mapped_parsers = attributes[:'mapped_parsers'] if attributes[:'mapped_parsers']

      self.parser_ignoreline_characters = attributes[:'parserIgnorelineCharacters'] if attributes[:'parserIgnorelineCharacters']

      raise 'You cannot provide both :parserIgnorelineCharacters and :parser_ignoreline_characters' if attributes.key?(:'parserIgnorelineCharacters') && attributes.key?(:'parser_ignoreline_characters')

      self.parser_ignoreline_characters = attributes[:'parser_ignoreline_characters'] if attributes[:'parser_ignoreline_characters']

      self.is_hidden = attributes[:'isHidden'] unless attributes[:'isHidden'].nil?

      raise 'You cannot provide both :isHidden and :is_hidden' if attributes.key?(:'isHidden') && attributes.key?(:'is_hidden')

      self.is_hidden = attributes[:'is_hidden'] unless attributes[:'is_hidden'].nil?

      self.parser_sequence = attributes[:'parserSequence'] if attributes[:'parserSequence']

      raise 'You cannot provide both :parserSequence and :parser_sequence' if attributes.key?(:'parserSequence') && attributes.key?(:'parser_sequence')

      self.parser_sequence = attributes[:'parser_sequence'] if attributes[:'parser_sequence']

      self.parser_timezone = attributes[:'parserTimezone'] if attributes[:'parserTimezone']

      raise 'You cannot provide both :parserTimezone and :parser_timezone' if attributes.key?(:'parserTimezone') && attributes.key?(:'parser_timezone')

      self.parser_timezone = attributes[:'parser_timezone'] if attributes[:'parser_timezone']

      self.parser_filter = attributes[:'parserFilter'] if attributes[:'parserFilter']

      raise 'You cannot provide both :parserFilter and :parser_filter' if attributes.key?(:'parserFilter') && attributes.key?(:'parser_filter')

      self.parser_filter = attributes[:'parser_filter'] if attributes[:'parser_filter']

      self.is_parser_written_once = attributes[:'isParserWrittenOnce'] unless attributes[:'isParserWrittenOnce'].nil?

      raise 'You cannot provide both :isParserWrittenOnce and :is_parser_written_once' if attributes.key?(:'isParserWrittenOnce') && attributes.key?(:'is_parser_written_once')

      self.is_parser_written_once = attributes[:'is_parser_written_once'] unless attributes[:'is_parser_written_once'].nil?

      self.parser_functions = attributes[:'parserFunctions'] if attributes[:'parserFunctions']

      raise 'You cannot provide both :parserFunctions and :parser_functions' if attributes.key?(:'parserFunctions') && attributes.key?(:'parser_functions')

      self.parser_functions = attributes[:'parser_functions'] if attributes[:'parser_functions']

      self.sources_count = attributes[:'sourcesCount'] if attributes[:'sourcesCount']

      raise 'You cannot provide both :sourcesCount and :sources_count' if attributes.key?(:'sourcesCount') && attributes.key?(:'sources_count')

      self.sources_count = attributes[:'sources_count'] if attributes[:'sources_count']

      self.sources = attributes[:'sources'] if attributes[:'sources']

      self.should_tokenize_original_text = attributes[:'shouldTokenizeOriginalText'] unless attributes[:'shouldTokenizeOriginalText'].nil?

      raise 'You cannot provide both :shouldTokenizeOriginalText and :should_tokenize_original_text' if attributes.key?(:'shouldTokenizeOriginalText') && attributes.key?(:'should_tokenize_original_text')

      self.should_tokenize_original_text = attributes[:'should_tokenize_original_text'] unless attributes[:'should_tokenize_original_text'].nil?

      self.type = attributes[:'type'] if attributes[:'type']
      self.type = "REGEX" if type.nil? && !attributes.key?(:'type') # rubocop:disable Style/StringLiterals

      self.is_user_deleted = attributes[:'isUserDeleted'] unless attributes[:'isUserDeleted'].nil?

      raise 'You cannot provide both :isUserDeleted and :is_user_deleted' if attributes.key?(:'isUserDeleted') && attributes.key?(:'is_user_deleted')

      self.is_user_deleted = attributes[:'is_user_deleted'] unless attributes[:'is_user_deleted'].nil?
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
        content == other.content &&
        description == other.description &&
        display_name == other.display_name &&
        edit_version == other.edit_version &&
        encoding == other.encoding &&
        example_content == other.example_content &&
        field_maps == other.field_maps &&
        footer_content == other.footer_content &&
        header_content == other.header_content &&
        name == other.name &&
        is_default == other.is_default &&
        is_single_line_content == other.is_single_line_content &&
        is_system == other.is_system &&
        language == other.language &&
        time_updated == other.time_updated &&
        log_type_test_request_version == other.log_type_test_request_version &&
        mapped_parsers == other.mapped_parsers &&
        parser_ignoreline_characters == other.parser_ignoreline_characters &&
        is_hidden == other.is_hidden &&
        parser_sequence == other.parser_sequence &&
        parser_timezone == other.parser_timezone &&
        parser_filter == other.parser_filter &&
        is_parser_written_once == other.is_parser_written_once &&
        parser_functions == other.parser_functions &&
        sources_count == other.sources_count &&
        sources == other.sources &&
        should_tokenize_original_text == other.should_tokenize_original_text &&
        type == other.type &&
        is_user_deleted == other.is_user_deleted
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
      [content, description, display_name, edit_version, encoding, example_content, field_maps, footer_content, header_content, name, is_default, is_single_line_content, is_system, language, time_updated, log_type_test_request_version, mapped_parsers, parser_ignoreline_characters, is_hidden, parser_sequence, parser_timezone, parser_filter, is_parser_written_once, parser_functions, sources_count, sources, should_tokenize_original_text, type, is_user_deleted].hash
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
