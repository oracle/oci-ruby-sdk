# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'action'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Stream action for scheduled task.
  class LogAnalytics::Models::StreamAction < LogAnalytics::Models::Action
    # The ManagementSavedSearch id [OCID] utilized in the action.
    # @return [String]
    attr_accessor :saved_search_id

    # @return [OCI::LogAnalytics::Models::MetricExtraction]
    attr_accessor :metric_extraction

    # The duration of data to be searched for SAVED_SEARCH tasks,
    # used when the task fires to calculate the query time range.
    #
    # Duration in ISO 8601 extended format as described in
    # https://en.wikipedia.org/wiki/ISO_8601#Durations.
    # The value should be positive.
    # The largest supported unit (as opposed to value) is D, e.g.  P14D (not P2W).
    #
    # There are restrictions on the maximum duration value relative to the task schedule
    # value as specified in the following table.
    #    Schedule Interval Range          | Maximum Duration
    # ----------------------------------- | -----------------
    #   5 Minutes     to 30 Minutes       |   1 hour  \"PT60M\"
    #  31 Minutes     to  1 Hour          |  12 hours \"PT720M\"
    #  1 Hour+1Minute to  1 Day           |   1 day   \"P1D\"
    #  1 Day+1Minute  to  1 Week-1Minute  |   7 days  \"P7D\"
    #  1 Week         to  2 Weeks         |  14 days  \"P14D\"
    #  greater than 2 Weeks               |  30 days  \"P30D\"
    #
    # If not specified, the duration will be based on the schedule. For example,
    # if the schedule is every 5 minutes then the savedSearchDuration will be \"PT5M\";
    # if the schedule is every 3 weeks then the savedSearchDuration will be \"P21D\".
    #
    # @return [String]
    attr_accessor :saved_search_duration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'saved_search_id': :'savedSearchId',
        'metric_extraction': :'metricExtraction',
        'saved_search_duration': :'savedSearchDuration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'saved_search_id': :'String',
        'metric_extraction': :'OCI::LogAnalytics::Models::MetricExtraction',
        'saved_search_duration': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :saved_search_id The value to assign to the {#saved_search_id} property
    # @option attributes [OCI::LogAnalytics::Models::MetricExtraction] :metric_extraction The value to assign to the {#metric_extraction} property
    # @option attributes [String] :saved_search_duration The value to assign to the {#saved_search_duration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'STREAM'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.saved_search_id = attributes[:'savedSearchId'] if attributes[:'savedSearchId']

      raise 'You cannot provide both :savedSearchId and :saved_search_id' if attributes.key?(:'savedSearchId') && attributes.key?(:'saved_search_id')

      self.saved_search_id = attributes[:'saved_search_id'] if attributes[:'saved_search_id']

      self.metric_extraction = attributes[:'metricExtraction'] if attributes[:'metricExtraction']

      raise 'You cannot provide both :metricExtraction and :metric_extraction' if attributes.key?(:'metricExtraction') && attributes.key?(:'metric_extraction')

      self.metric_extraction = attributes[:'metric_extraction'] if attributes[:'metric_extraction']

      self.saved_search_duration = attributes[:'savedSearchDuration'] if attributes[:'savedSearchDuration']

      raise 'You cannot provide both :savedSearchDuration and :saved_search_duration' if attributes.key?(:'savedSearchDuration') && attributes.key?(:'saved_search_duration')

      self.saved_search_duration = attributes[:'saved_search_duration'] if attributes[:'saved_search_duration']
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
        saved_search_id == other.saved_search_id &&
        metric_extraction == other.metric_extraction &&
        saved_search_duration == other.saved_search_duration
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
      [type, saved_search_id, metric_extraction, saved_search_duration].hash
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
