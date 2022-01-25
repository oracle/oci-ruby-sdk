# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'host_configuration_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Memory Configuration metric for the host
  #
  class Opsi::Models::HostMemoryConfiguration < Opsi::Models::HostConfigurationMetricGroup
    # Page size in kilobytes
    # @return [Float]
    attr_accessor :page_size_in_kb

    # Amount of memory used for page tables in kilobytes
    # @return [Float]
    attr_accessor :page_tables_in_kb

    # Amount of total swap space in kilobytes
    # @return [Float]
    attr_accessor :swap_total_in_kb

    # Size of huge pages in kilobytes
    # @return [Float]
    attr_accessor :huge_page_size_in_kb

    # Total number of huge pages
    # @return [Integer]
    attr_accessor :huge_pages_total

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'page_size_in_kb': :'pageSizeInKB',
        'page_tables_in_kb': :'pageTablesInKB',
        'swap_total_in_kb': :'swapTotalInKB',
        'huge_page_size_in_kb': :'hugePageSizeInKB',
        'huge_pages_total': :'hugePagesTotal'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'page_size_in_kb': :'Float',
        'page_tables_in_kb': :'Float',
        'swap_total_in_kb': :'Float',
        'huge_page_size_in_kb': :'Float',
        'huge_pages_total': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::HostConfigurationMetricGroup#time_collected #time_collected} proprety
    # @option attributes [Float] :page_size_in_kb The value to assign to the {#page_size_in_kb} property
    # @option attributes [Float] :page_tables_in_kb The value to assign to the {#page_tables_in_kb} property
    # @option attributes [Float] :swap_total_in_kb The value to assign to the {#swap_total_in_kb} property
    # @option attributes [Float] :huge_page_size_in_kb The value to assign to the {#huge_page_size_in_kb} property
    # @option attributes [Integer] :huge_pages_total The value to assign to the {#huge_pages_total} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'HOST_MEMORY_CONFIGURATION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.page_size_in_kb = attributes[:'pageSizeInKB'] if attributes[:'pageSizeInKB']

      raise 'You cannot provide both :pageSizeInKB and :page_size_in_kb' if attributes.key?(:'pageSizeInKB') && attributes.key?(:'page_size_in_kb')

      self.page_size_in_kb = attributes[:'page_size_in_kb'] if attributes[:'page_size_in_kb']

      self.page_tables_in_kb = attributes[:'pageTablesInKB'] if attributes[:'pageTablesInKB']

      raise 'You cannot provide both :pageTablesInKB and :page_tables_in_kb' if attributes.key?(:'pageTablesInKB') && attributes.key?(:'page_tables_in_kb')

      self.page_tables_in_kb = attributes[:'page_tables_in_kb'] if attributes[:'page_tables_in_kb']

      self.swap_total_in_kb = attributes[:'swapTotalInKB'] if attributes[:'swapTotalInKB']

      raise 'You cannot provide both :swapTotalInKB and :swap_total_in_kb' if attributes.key?(:'swapTotalInKB') && attributes.key?(:'swap_total_in_kb')

      self.swap_total_in_kb = attributes[:'swap_total_in_kb'] if attributes[:'swap_total_in_kb']

      self.huge_page_size_in_kb = attributes[:'hugePageSizeInKB'] if attributes[:'hugePageSizeInKB']

      raise 'You cannot provide both :hugePageSizeInKB and :huge_page_size_in_kb' if attributes.key?(:'hugePageSizeInKB') && attributes.key?(:'huge_page_size_in_kb')

      self.huge_page_size_in_kb = attributes[:'huge_page_size_in_kb'] if attributes[:'huge_page_size_in_kb']

      self.huge_pages_total = attributes[:'hugePagesTotal'] if attributes[:'hugePagesTotal']

      raise 'You cannot provide both :hugePagesTotal and :huge_pages_total' if attributes.key?(:'hugePagesTotal') && attributes.key?(:'huge_pages_total')

      self.huge_pages_total = attributes[:'huge_pages_total'] if attributes[:'huge_pages_total']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        metric_name == other.metric_name &&
        time_collected == other.time_collected &&
        page_size_in_kb == other.page_size_in_kb &&
        page_tables_in_kb == other.page_tables_in_kb &&
        swap_total_in_kb == other.swap_total_in_kb &&
        huge_page_size_in_kb == other.huge_page_size_in_kb &&
        huge_pages_total == other.huge_pages_total
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
      [metric_name, time_collected, page_size_in_kb, page_tables_in_kb, swap_total_in_kb, huge_page_size_in_kb, huge_pages_total].hash
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
