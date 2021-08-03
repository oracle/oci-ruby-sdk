# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Java Runtime usage during a specified time period. A Java Runtime is identified by its vendor and version.
  class Jms::Models::JreUsage
    # **[Required]** The vendor of the Java Runtime.
    # @return [String]
    attr_accessor :vendor

    # **[Required]** The distribution of a Java Runtime is the name of the lineage of product to which it belongs, for example _Java(TM) SE Runtime Environment_.
    # @return [String]
    attr_accessor :distribution

    # **[Required]** The version of the Java Runtime.
    # @return [String]
    attr_accessor :version

    # The approximate count of installations that are installations of this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_installation_count

    # The approximate count of the applications running on this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_application_count

    # The approximate count of the managed instances that report this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_managed_instance_count

    # Lower bound of the specified time period filter.
    # @return [DateTime]
    attr_accessor :time_start

    # Upper bound of the specified time period filter.
    # @return [DateTime]
    attr_accessor :time_end

    # The date and time the resource was _first_ reported to JMS.
    # This is potentially _before_ the specified time period provided by the filters.
    # For example, a resource can be first reported to JMS before the start of a specified time period,
    # if it is also reported during the time period.
    #
    # @return [DateTime]
    attr_accessor :time_first_seen

    # The date and time the resource was _last_ reported to JMS.
    # This is potentially _after_ the specified time period provided by the filters.
    # For example, a resource can be last reported to JMS before the start of a specified time period,
    # if it is also reported during the time period.
    #
    # @return [DateTime]
    attr_accessor :time_last_seen

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'vendor': :'vendor',
        'distribution': :'distribution',
        'version': :'version',
        'approximate_installation_count': :'approximateInstallationCount',
        'approximate_application_count': :'approximateApplicationCount',
        'approximate_managed_instance_count': :'approximateManagedInstanceCount',
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'time_first_seen': :'timeFirstSeen',
        'time_last_seen': :'timeLastSeen'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'vendor': :'String',
        'distribution': :'String',
        'version': :'String',
        'approximate_installation_count': :'Integer',
        'approximate_application_count': :'Integer',
        'approximate_managed_instance_count': :'Integer',
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'time_first_seen': :'DateTime',
        'time_last_seen': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :vendor The value to assign to the {#vendor} property
    # @option attributes [String] :distribution The value to assign to the {#distribution} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Integer] :approximate_installation_count The value to assign to the {#approximate_installation_count} property
    # @option attributes [Integer] :approximate_application_count The value to assign to the {#approximate_application_count} property
    # @option attributes [Integer] :approximate_managed_instance_count The value to assign to the {#approximate_managed_instance_count} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [DateTime] :time_first_seen The value to assign to the {#time_first_seen} property
    # @option attributes [DateTime] :time_last_seen The value to assign to the {#time_last_seen} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.vendor = attributes[:'vendor'] if attributes[:'vendor']

      self.distribution = attributes[:'distribution'] if attributes[:'distribution']

      self.version = attributes[:'version'] if attributes[:'version']

      self.approximate_installation_count = attributes[:'approximateInstallationCount'] if attributes[:'approximateInstallationCount']

      raise 'You cannot provide both :approximateInstallationCount and :approximate_installation_count' if attributes.key?(:'approximateInstallationCount') && attributes.key?(:'approximate_installation_count')

      self.approximate_installation_count = attributes[:'approximate_installation_count'] if attributes[:'approximate_installation_count']

      self.approximate_application_count = attributes[:'approximateApplicationCount'] if attributes[:'approximateApplicationCount']

      raise 'You cannot provide both :approximateApplicationCount and :approximate_application_count' if attributes.key?(:'approximateApplicationCount') && attributes.key?(:'approximate_application_count')

      self.approximate_application_count = attributes[:'approximate_application_count'] if attributes[:'approximate_application_count']

      self.approximate_managed_instance_count = attributes[:'approximateManagedInstanceCount'] if attributes[:'approximateManagedInstanceCount']

      raise 'You cannot provide both :approximateManagedInstanceCount and :approximate_managed_instance_count' if attributes.key?(:'approximateManagedInstanceCount') && attributes.key?(:'approximate_managed_instance_count')

      self.approximate_managed_instance_count = attributes[:'approximate_managed_instance_count'] if attributes[:'approximate_managed_instance_count']

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.time_first_seen = attributes[:'timeFirstSeen'] if attributes[:'timeFirstSeen']

      raise 'You cannot provide both :timeFirstSeen and :time_first_seen' if attributes.key?(:'timeFirstSeen') && attributes.key?(:'time_first_seen')

      self.time_first_seen = attributes[:'time_first_seen'] if attributes[:'time_first_seen']

      self.time_last_seen = attributes[:'timeLastSeen'] if attributes[:'timeLastSeen']

      raise 'You cannot provide both :timeLastSeen and :time_last_seen' if attributes.key?(:'timeLastSeen') && attributes.key?(:'time_last_seen')

      self.time_last_seen = attributes[:'time_last_seen'] if attributes[:'time_last_seen']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        vendor == other.vendor &&
        distribution == other.distribution &&
        version == other.version &&
        approximate_installation_count == other.approximate_installation_count &&
        approximate_application_count == other.approximate_application_count &&
        approximate_managed_instance_count == other.approximate_managed_instance_count &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        time_first_seen == other.time_first_seen &&
        time_last_seen == other.time_last_seen
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
      [vendor, distribution, version, approximate_installation_count, approximate_application_count, approximate_managed_instance_count, time_start, time_end, time_first_seen, time_last_seen].hash
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
