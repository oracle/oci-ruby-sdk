# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters for filtering installations.
  class Jms::Models::RequestSummarizedInstallationUsageDetails
    SORT_ORDER_ENUM = [
      SORT_ORDER_ASC = 'ASC'.freeze,
      SORT_ORDER_DESC = 'DESC'.freeze
    ].freeze

    SORT_BY_ENUM = [
      SORT_BY_JRE_DISTRIBUTION = 'jreDistribution'.freeze,
      SORT_BY_JRE_VENDOR = 'jreVendor'.freeze,
      SORT_BY_JRE_VERSION = 'jreVersion'.freeze,
      SORT_BY_PATH = 'path'.freeze,
      SORT_BY_TIME_FIRST_SEEN = 'timeFirstSeen'.freeze,
      SORT_BY_TIME_LAST_SEEN = 'timeLastSeen'.freeze,
      SORT_BY_APPROXIMATE_APPLICATION_COUNT = 'approximateApplicationCount'.freeze,
      SORT_BY_APPROXIMATE_MANAGED_INSTANCE_COUNT = 'approximateManagedInstanceCount'.freeze
    ].freeze

    # The start of the time period during which resources are searched (formatted according to RFC3339). Defaults to current time minus seven days.
    #
    # @return [DateTime]
    attr_accessor :time_start

    # The end of the time period during which resources are searched (formatted according to RFC3339). Defaults to current time.
    #
    # @return [DateTime]
    attr_accessor :time_end

    # The path of the installation.
    # @return [String]
    attr_accessor :installation_path

    # The vendor of the related Java Runtime.
    # @return [String]
    attr_accessor :jre_vendor

    # The distribution of the related Java Runtime.
    # @return [String]
    attr_accessor :jre_distribution

    # The version of the related Java Runtime.
    # @return [String]
    attr_accessor :jre_version

    # The ID of the related application.
    # @return [String]
    attr_accessor :application_id

    # The ID of the related managed instance.
    # @return [String]
    attr_accessor :managed_instance_id

    # The sort order to use, either 'asc' or 'desc'.
    # @return [String]
    attr_reader :sort_order

    # The field to sort installation views. Only one sort order may be provided.
    # Default order for _timeFirstSeen_, _timeLastSeen_, _jreVersion_, _approximateApplicationCount_
    # and _approximateManagedInstanceCount_  is **descending**.
    # Default order for _jreDistribution_ and _jreVendor_ is **ascending**. If no value is specified _timeLastSeen_ is default.
    #
    # @return [String]
    attr_reader :sort_by

    # Additional fields to include into the returned model on top of the required ones.
    # This parameter can also include 'approximateApplicationCount' and 'approximateManagedInstanceCount'.
    # For example 'approximateApplicationCount,approximateManagedInstanceCount'.
    #
    # @return [Array<OCI::Jms::Models::SummarizeInstallationUsageFields>]
    attr_accessor :fields

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'installation_path': :'installationPath',
        'jre_vendor': :'jreVendor',
        'jre_distribution': :'jreDistribution',
        'jre_version': :'jreVersion',
        'application_id': :'applicationId',
        'managed_instance_id': :'managedInstanceId',
        'sort_order': :'sortOrder',
        'sort_by': :'sortBy',
        'fields': :'fields'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'installation_path': :'String',
        'jre_vendor': :'String',
        'jre_distribution': :'String',
        'jre_version': :'String',
        'application_id': :'String',
        'managed_instance_id': :'String',
        'sort_order': :'String',
        'sort_by': :'String',
        'fields': :'Array<OCI::Jms::Models::SummarizeInstallationUsageFields>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [String] :installation_path The value to assign to the {#installation_path} property
    # @option attributes [String] :jre_vendor The value to assign to the {#jre_vendor} property
    # @option attributes [String] :jre_distribution The value to assign to the {#jre_distribution} property
    # @option attributes [String] :jre_version The value to assign to the {#jre_version} property
    # @option attributes [String] :application_id The value to assign to the {#application_id} property
    # @option attributes [String] :managed_instance_id The value to assign to the {#managed_instance_id} property
    # @option attributes [String] :sort_order The value to assign to the {#sort_order} property
    # @option attributes [String] :sort_by The value to assign to the {#sort_by} property
    # @option attributes [Array<OCI::Jms::Models::SummarizeInstallationUsageFields>] :fields The value to assign to the {#fields} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.installation_path = attributes[:'installationPath'] if attributes[:'installationPath']

      raise 'You cannot provide both :installationPath and :installation_path' if attributes.key?(:'installationPath') && attributes.key?(:'installation_path')

      self.installation_path = attributes[:'installation_path'] if attributes[:'installation_path']

      self.jre_vendor = attributes[:'jreVendor'] if attributes[:'jreVendor']

      raise 'You cannot provide both :jreVendor and :jre_vendor' if attributes.key?(:'jreVendor') && attributes.key?(:'jre_vendor')

      self.jre_vendor = attributes[:'jre_vendor'] if attributes[:'jre_vendor']

      self.jre_distribution = attributes[:'jreDistribution'] if attributes[:'jreDistribution']

      raise 'You cannot provide both :jreDistribution and :jre_distribution' if attributes.key?(:'jreDistribution') && attributes.key?(:'jre_distribution')

      self.jre_distribution = attributes[:'jre_distribution'] if attributes[:'jre_distribution']

      self.jre_version = attributes[:'jreVersion'] if attributes[:'jreVersion']

      raise 'You cannot provide both :jreVersion and :jre_version' if attributes.key?(:'jreVersion') && attributes.key?(:'jre_version')

      self.jre_version = attributes[:'jre_version'] if attributes[:'jre_version']

      self.application_id = attributes[:'applicationId'] if attributes[:'applicationId']

      raise 'You cannot provide both :applicationId and :application_id' if attributes.key?(:'applicationId') && attributes.key?(:'application_id')

      self.application_id = attributes[:'application_id'] if attributes[:'application_id']

      self.managed_instance_id = attributes[:'managedInstanceId'] if attributes[:'managedInstanceId']

      raise 'You cannot provide both :managedInstanceId and :managed_instance_id' if attributes.key?(:'managedInstanceId') && attributes.key?(:'managed_instance_id')

      self.managed_instance_id = attributes[:'managed_instance_id'] if attributes[:'managed_instance_id']

      self.sort_order = attributes[:'sortOrder'] if attributes[:'sortOrder']
      self.sort_order = "ASC" if sort_order.nil? && !attributes.key?(:'sortOrder') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sortOrder and :sort_order' if attributes.key?(:'sortOrder') && attributes.key?(:'sort_order')

      self.sort_order = attributes[:'sort_order'] if attributes[:'sort_order']
      self.sort_order = "ASC" if sort_order.nil? && !attributes.key?(:'sortOrder') && !attributes.key?(:'sort_order') # rubocop:disable Style/StringLiterals

      self.sort_by = attributes[:'sortBy'] if attributes[:'sortBy']
      self.sort_by = "timeLastSeen" if sort_by.nil? && !attributes.key?(:'sortBy') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sortBy and :sort_by' if attributes.key?(:'sortBy') && attributes.key?(:'sort_by')

      self.sort_by = attributes[:'sort_by'] if attributes[:'sort_by']
      self.sort_by = "timeLastSeen" if sort_by.nil? && !attributes.key?(:'sortBy') && !attributes.key?(:'sort_by') # rubocop:disable Style/StringLiterals

      self.fields = attributes[:'fields'] if attributes[:'fields']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_order Object to be assigned
    def sort_order=(sort_order)
      raise "Invalid value for 'sort_order': this must be one of the values in SORT_ORDER_ENUM." if sort_order && !SORT_ORDER_ENUM.include?(sort_order)

      @sort_order = sort_order
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_by Object to be assigned
    def sort_by=(sort_by)
      raise "Invalid value for 'sort_by': this must be one of the values in SORT_BY_ENUM." if sort_by && !SORT_BY_ENUM.include?(sort_by)

      @sort_by = sort_by
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        installation_path == other.installation_path &&
        jre_vendor == other.jre_vendor &&
        jre_distribution == other.jre_distribution &&
        jre_version == other.jre_version &&
        application_id == other.application_id &&
        managed_instance_id == other.managed_instance_id &&
        sort_order == other.sort_order &&
        sort_by == other.sort_by &&
        fields == other.fields
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
      [time_start, time_end, installation_path, jre_vendor, jre_distribution, jre_version, application_id, managed_instance_id, sort_order, sort_by, fields].hash
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
