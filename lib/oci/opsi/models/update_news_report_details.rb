# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the news report to be updated.
  class Opsi::Models::UpdateNewsReportDetails
    STATUS_ENUM = [
      STATUS_DISABLED = 'DISABLED'.freeze,
      STATUS_ENABLED = 'ENABLED'.freeze,
      STATUS_TERMINATED = 'TERMINATED'.freeze
    ].freeze

    NEWS_FREQUENCY_ENUM = [
      NEWS_FREQUENCY_WEEKLY = 'WEEKLY'.freeze
    ].freeze

    LOCALE_ENUM = [
      LOCALE_EN = 'EN'.freeze
    ].freeze

    # Defines if the news report will be enabled or disabled.
    # @return [String]
    attr_reader :status

    # News report frequency.
    # @return [String]
    attr_reader :news_frequency

    # Language of the news report.
    # @return [String]
    attr_reader :locale

    # @return [OCI::Opsi::Models::NewsContentTypes]
    attr_accessor :content_types

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the ONS topic.
    # @return [String]
    attr_accessor :ons_topic_id

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
        'status': :'status',
        'news_frequency': :'newsFrequency',
        'locale': :'locale',
        'content_types': :'contentTypes',
        'ons_topic_id': :'onsTopicId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'status': :'String',
        'news_frequency': :'String',
        'locale': :'String',
        'content_types': :'OCI::Opsi::Models::NewsContentTypes',
        'ons_topic_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :news_frequency The value to assign to the {#news_frequency} property
    # @option attributes [String] :locale The value to assign to the {#locale} property
    # @option attributes [OCI::Opsi::Models::NewsContentTypes] :content_types The value to assign to the {#content_types} property
    # @option attributes [String] :ons_topic_id The value to assign to the {#ons_topic_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.status = attributes[:'status'] if attributes[:'status']

      self.news_frequency = attributes[:'newsFrequency'] if attributes[:'newsFrequency']

      raise 'You cannot provide both :newsFrequency and :news_frequency' if attributes.key?(:'newsFrequency') && attributes.key?(:'news_frequency')

      self.news_frequency = attributes[:'news_frequency'] if attributes[:'news_frequency']

      self.locale = attributes[:'locale'] if attributes[:'locale']

      self.content_types = attributes[:'contentTypes'] if attributes[:'contentTypes']

      raise 'You cannot provide both :contentTypes and :content_types' if attributes.key?(:'contentTypes') && attributes.key?(:'content_types')

      self.content_types = attributes[:'content_types'] if attributes[:'content_types']

      self.ons_topic_id = attributes[:'onsTopicId'] if attributes[:'onsTopicId']

      raise 'You cannot provide both :onsTopicId and :ons_topic_id' if attributes.key?(:'onsTopicId') && attributes.key?(:'ons_topic_id')

      self.ons_topic_id = attributes[:'ons_topic_id'] if attributes[:'ons_topic_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      raise "Invalid value for 'status': this must be one of the values in STATUS_ENUM." if status && !STATUS_ENUM.include?(status)

      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] news_frequency Object to be assigned
    def news_frequency=(news_frequency)
      raise "Invalid value for 'news_frequency': this must be one of the values in NEWS_FREQUENCY_ENUM." if news_frequency && !NEWS_FREQUENCY_ENUM.include?(news_frequency)

      @news_frequency = news_frequency
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] locale Object to be assigned
    def locale=(locale)
      raise "Invalid value for 'locale': this must be one of the values in LOCALE_ENUM." if locale && !LOCALE_ENUM.include?(locale)

      @locale = locale
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        status == other.status &&
        news_frequency == other.news_frequency &&
        locale == other.locale &&
        content_types == other.content_types &&
        ons_topic_id == other.ons_topic_id &&
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
      [status, news_frequency, locale, content_types, ons_topic_id, freeform_tags, defined_tags].hash
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