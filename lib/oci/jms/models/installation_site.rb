# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Installation site of a Java Runtime.
  # An installation site is a Java Runtime installed at a specific path on a managed instance.
  #
  class Jms::Models::InstallationSite
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MANAGED_INSTANCE_TYPE_ENUM = [
      MANAGED_INSTANCE_TYPE_ORACLE_MANAGEMENT_AGENT = 'ORACLE_MANAGEMENT_AGENT'.freeze,
      MANAGED_INSTANCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique identifier for the installation of a Java Runtime at a specific path on a specific operating system.
    # @return [String]
    attr_accessor :installation_key

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the related managed instance.
    #
    # @return [String]
    attr_accessor :managed_instance_id

    # This attribute is required.
    # @return [OCI::Jms::Models::JavaRuntimeId]
    attr_accessor :jre

    # **[Required]** The file system path of the installation.
    # @return [String]
    attr_accessor :path

    # This attribute is required.
    # @return [OCI::Jms::Models::OperatingSystem]
    attr_accessor :operating_system

    # The approximate count of applications running on this installation
    # @return [Integer]
    attr_accessor :approximate_application_count

    # The date and time the resource was _last_ reported to JMS.
    # This is potentially _after_ the specified time period provided by the filters.
    # For example, a resource can be last reported to JMS before the start of a specified time period,
    # if it is also reported during the time period.
    #
    # @return [DateTime]
    attr_accessor :time_last_seen

    # The list of operations that are blocklisted.
    # @return [Array<OCI::Jms::Models::BlocklistEntry>]
    attr_accessor :blocklist

    # The lifecycle state of the installation site.
    # @return [String]
    attr_reader :lifecycle_state

    # The type of the source of events.
    # @return [String]
    attr_reader :managed_instance_type

    # The hostname of the managed instance (if applicable).
    # @return [String]
    attr_accessor :hostname

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'installation_key': :'installationKey',
        'managed_instance_id': :'managedInstanceId',
        'jre': :'jre',
        'path': :'path',
        'operating_system': :'operatingSystem',
        'approximate_application_count': :'approximateApplicationCount',
        'time_last_seen': :'timeLastSeen',
        'blocklist': :'blocklist',
        'lifecycle_state': :'lifecycleState',
        'managed_instance_type': :'managedInstanceType',
        'hostname': :'hostname'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'installation_key': :'String',
        'managed_instance_id': :'String',
        'jre': :'OCI::Jms::Models::JavaRuntimeId',
        'path': :'String',
        'operating_system': :'OCI::Jms::Models::OperatingSystem',
        'approximate_application_count': :'Integer',
        'time_last_seen': :'DateTime',
        'blocklist': :'Array<OCI::Jms::Models::BlocklistEntry>',
        'lifecycle_state': :'String',
        'managed_instance_type': :'String',
        'hostname': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :installation_key The value to assign to the {#installation_key} property
    # @option attributes [String] :managed_instance_id The value to assign to the {#managed_instance_id} property
    # @option attributes [OCI::Jms::Models::JavaRuntimeId] :jre The value to assign to the {#jre} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [OCI::Jms::Models::OperatingSystem] :operating_system The value to assign to the {#operating_system} property
    # @option attributes [Integer] :approximate_application_count The value to assign to the {#approximate_application_count} property
    # @option attributes [DateTime] :time_last_seen The value to assign to the {#time_last_seen} property
    # @option attributes [Array<OCI::Jms::Models::BlocklistEntry>] :blocklist The value to assign to the {#blocklist} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :managed_instance_type The value to assign to the {#managed_instance_type} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.installation_key = attributes[:'installationKey'] if attributes[:'installationKey']

      raise 'You cannot provide both :installationKey and :installation_key' if attributes.key?(:'installationKey') && attributes.key?(:'installation_key')

      self.installation_key = attributes[:'installation_key'] if attributes[:'installation_key']

      self.managed_instance_id = attributes[:'managedInstanceId'] if attributes[:'managedInstanceId']

      raise 'You cannot provide both :managedInstanceId and :managed_instance_id' if attributes.key?(:'managedInstanceId') && attributes.key?(:'managed_instance_id')

      self.managed_instance_id = attributes[:'managed_instance_id'] if attributes[:'managed_instance_id']

      self.jre = attributes[:'jre'] if attributes[:'jre']

      self.path = attributes[:'path'] if attributes[:'path']

      self.operating_system = attributes[:'operatingSystem'] if attributes[:'operatingSystem']

      raise 'You cannot provide both :operatingSystem and :operating_system' if attributes.key?(:'operatingSystem') && attributes.key?(:'operating_system')

      self.operating_system = attributes[:'operating_system'] if attributes[:'operating_system']

      self.approximate_application_count = attributes[:'approximateApplicationCount'] if attributes[:'approximateApplicationCount']

      raise 'You cannot provide both :approximateApplicationCount and :approximate_application_count' if attributes.key?(:'approximateApplicationCount') && attributes.key?(:'approximate_application_count')

      self.approximate_application_count = attributes[:'approximate_application_count'] if attributes[:'approximate_application_count']

      self.time_last_seen = attributes[:'timeLastSeen'] if attributes[:'timeLastSeen']

      raise 'You cannot provide both :timeLastSeen and :time_last_seen' if attributes.key?(:'timeLastSeen') && attributes.key?(:'time_last_seen')

      self.time_last_seen = attributes[:'time_last_seen'] if attributes[:'time_last_seen']

      self.blocklist = attributes[:'blocklist'] if attributes[:'blocklist']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.managed_instance_type = attributes[:'managedInstanceType'] if attributes[:'managedInstanceType']

      raise 'You cannot provide both :managedInstanceType and :managed_instance_type' if attributes.key?(:'managedInstanceType') && attributes.key?(:'managed_instance_type')

      self.managed_instance_type = attributes[:'managed_instance_type'] if attributes[:'managed_instance_type']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] managed_instance_type Object to be assigned
    def managed_instance_type=(managed_instance_type)
      # rubocop:disable Style/ConditionalAssignment
      if managed_instance_type && !MANAGED_INSTANCE_TYPE_ENUM.include?(managed_instance_type)
        OCI.logger.debug("Unknown value for 'managed_instance_type' [" + managed_instance_type + "]. Mapping to 'MANAGED_INSTANCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @managed_instance_type = MANAGED_INSTANCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @managed_instance_type = managed_instance_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        installation_key == other.installation_key &&
        managed_instance_id == other.managed_instance_id &&
        jre == other.jre &&
        path == other.path &&
        operating_system == other.operating_system &&
        approximate_application_count == other.approximate_application_count &&
        time_last_seen == other.time_last_seen &&
        blocklist == other.blocklist &&
        lifecycle_state == other.lifecycle_state &&
        managed_instance_type == other.managed_instance_type &&
        hostname == other.hostname
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
      [installation_key, managed_instance_id, jre, path, operating_system, approximate_application_count, time_last_seen, blocklist, lifecycle_state, managed_instance_type, hostname].hash
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
