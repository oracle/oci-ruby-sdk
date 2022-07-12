# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Java Runtime usage during a specified time period. A Java Runtime is identified by its vendor and version.
  class Jms::Models::JreUsage
    SECURITY_STATUS_ENUM = [
      SECURITY_STATUS_UNKNOWN = 'UNKNOWN'.freeze,
      SECURITY_STATUS_UP_TO_DATE = 'UP_TO_DATE'.freeze,
      SECURITY_STATUS_UPDATE_REQUIRED = 'UPDATE_REQUIRED'.freeze,
      SECURITY_STATUS_UPGRADE_REQUIRED = 'UPGRADE_REQUIRED'.freeze,
      SECURITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The internal identifier of the Java Runtime.
    # @return [String]
    attr_accessor :id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the related fleet.  This property value is present only for /actions/listJreUsage.
    # @return [String]
    attr_accessor :fleet_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the related managed instance. This property value is present only for /actions/listJreUsage.
    # @return [String]
    attr_accessor :managed_instance_id

    # The security status of the Java Runtime.
    # @return [String]
    attr_reader :security_status

    # The release date of the Java Runtime (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    # @return [DateTime]
    attr_accessor :release_date

    # The End of Support Life (EOSL) date of the Java Runtime (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    # @return [DateTime]
    attr_accessor :end_of_support_life_date

    # **[Required]** The vendor of the Java Runtime.
    # @return [String]
    attr_accessor :vendor

    # **[Required]** The distribution of a Java Runtime is the name of the lineage of product to which it belongs, for example _Java(TM) SE Runtime Environment_.
    # @return [String]
    attr_accessor :distribution

    # **[Required]** The version of the Java Runtime.
    # @return [String]
    attr_accessor :version

    # The operating systems that have this Java Runtime installed.
    # @return [Array<OCI::Jms::Models::OperatingSystem>]
    attr_accessor :operating_systems

    # The approximate count of installations that are installations of this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_installation_count

    # The approximate count of the applications running on this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_application_count

    # The approximate count of the managed instances that report this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_managed_instance_count

    # The approximate count of work requests working on this Java Runtime.
    # @return [Integer]
    attr_accessor :approximate_pending_work_request_count

    # Lower bound of the specified time period filter. JMS provides a view of the data that is _per day_. The query uses only the date element of the parameter.
    # @return [DateTime]
    attr_accessor :time_start

    # Upper bound of the specified time period filter. JMS provides a view of the data that is _per day_. The query uses only the date element of the parameter.
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
        'id': :'id',
        'fleet_id': :'fleetId',
        'managed_instance_id': :'managedInstanceId',
        'security_status': :'securityStatus',
        'release_date': :'releaseDate',
        'end_of_support_life_date': :'endOfSupportLifeDate',
        'vendor': :'vendor',
        'distribution': :'distribution',
        'version': :'version',
        'operating_systems': :'operatingSystems',
        'approximate_installation_count': :'approximateInstallationCount',
        'approximate_application_count': :'approximateApplicationCount',
        'approximate_managed_instance_count': :'approximateManagedInstanceCount',
        'approximate_pending_work_request_count': :'approximatePendingWorkRequestCount',
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
        'id': :'String',
        'fleet_id': :'String',
        'managed_instance_id': :'String',
        'security_status': :'String',
        'release_date': :'DateTime',
        'end_of_support_life_date': :'DateTime',
        'vendor': :'String',
        'distribution': :'String',
        'version': :'String',
        'operating_systems': :'Array<OCI::Jms::Models::OperatingSystem>',
        'approximate_installation_count': :'Integer',
        'approximate_application_count': :'Integer',
        'approximate_managed_instance_count': :'Integer',
        'approximate_pending_work_request_count': :'Integer',
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
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :fleet_id The value to assign to the {#fleet_id} property
    # @option attributes [String] :managed_instance_id The value to assign to the {#managed_instance_id} property
    # @option attributes [String] :security_status The value to assign to the {#security_status} property
    # @option attributes [DateTime] :release_date The value to assign to the {#release_date} property
    # @option attributes [DateTime] :end_of_support_life_date The value to assign to the {#end_of_support_life_date} property
    # @option attributes [String] :vendor The value to assign to the {#vendor} property
    # @option attributes [String] :distribution The value to assign to the {#distribution} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Array<OCI::Jms::Models::OperatingSystem>] :operating_systems The value to assign to the {#operating_systems} property
    # @option attributes [Integer] :approximate_installation_count The value to assign to the {#approximate_installation_count} property
    # @option attributes [Integer] :approximate_application_count The value to assign to the {#approximate_application_count} property
    # @option attributes [Integer] :approximate_managed_instance_count The value to assign to the {#approximate_managed_instance_count} property
    # @option attributes [Integer] :approximate_pending_work_request_count The value to assign to the {#approximate_pending_work_request_count} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [DateTime] :time_first_seen The value to assign to the {#time_first_seen} property
    # @option attributes [DateTime] :time_last_seen The value to assign to the {#time_last_seen} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.fleet_id = attributes[:'fleetId'] if attributes[:'fleetId']

      raise 'You cannot provide both :fleetId and :fleet_id' if attributes.key?(:'fleetId') && attributes.key?(:'fleet_id')

      self.fleet_id = attributes[:'fleet_id'] if attributes[:'fleet_id']

      self.managed_instance_id = attributes[:'managedInstanceId'] if attributes[:'managedInstanceId']

      raise 'You cannot provide both :managedInstanceId and :managed_instance_id' if attributes.key?(:'managedInstanceId') && attributes.key?(:'managed_instance_id')

      self.managed_instance_id = attributes[:'managed_instance_id'] if attributes[:'managed_instance_id']

      self.security_status = attributes[:'securityStatus'] if attributes[:'securityStatus']

      raise 'You cannot provide both :securityStatus and :security_status' if attributes.key?(:'securityStatus') && attributes.key?(:'security_status')

      self.security_status = attributes[:'security_status'] if attributes[:'security_status']

      self.release_date = attributes[:'releaseDate'] if attributes[:'releaseDate']

      raise 'You cannot provide both :releaseDate and :release_date' if attributes.key?(:'releaseDate') && attributes.key?(:'release_date')

      self.release_date = attributes[:'release_date'] if attributes[:'release_date']

      self.end_of_support_life_date = attributes[:'endOfSupportLifeDate'] if attributes[:'endOfSupportLifeDate']

      raise 'You cannot provide both :endOfSupportLifeDate and :end_of_support_life_date' if attributes.key?(:'endOfSupportLifeDate') && attributes.key?(:'end_of_support_life_date')

      self.end_of_support_life_date = attributes[:'end_of_support_life_date'] if attributes[:'end_of_support_life_date']

      self.vendor = attributes[:'vendor'] if attributes[:'vendor']

      self.distribution = attributes[:'distribution'] if attributes[:'distribution']

      self.version = attributes[:'version'] if attributes[:'version']

      self.operating_systems = attributes[:'operatingSystems'] if attributes[:'operatingSystems']

      raise 'You cannot provide both :operatingSystems and :operating_systems' if attributes.key?(:'operatingSystems') && attributes.key?(:'operating_systems')

      self.operating_systems = attributes[:'operating_systems'] if attributes[:'operating_systems']

      self.approximate_installation_count = attributes[:'approximateInstallationCount'] if attributes[:'approximateInstallationCount']

      raise 'You cannot provide both :approximateInstallationCount and :approximate_installation_count' if attributes.key?(:'approximateInstallationCount') && attributes.key?(:'approximate_installation_count')

      self.approximate_installation_count = attributes[:'approximate_installation_count'] if attributes[:'approximate_installation_count']

      self.approximate_application_count = attributes[:'approximateApplicationCount'] if attributes[:'approximateApplicationCount']

      raise 'You cannot provide both :approximateApplicationCount and :approximate_application_count' if attributes.key?(:'approximateApplicationCount') && attributes.key?(:'approximate_application_count')

      self.approximate_application_count = attributes[:'approximate_application_count'] if attributes[:'approximate_application_count']

      self.approximate_managed_instance_count = attributes[:'approximateManagedInstanceCount'] if attributes[:'approximateManagedInstanceCount']

      raise 'You cannot provide both :approximateManagedInstanceCount and :approximate_managed_instance_count' if attributes.key?(:'approximateManagedInstanceCount') && attributes.key?(:'approximate_managed_instance_count')

      self.approximate_managed_instance_count = attributes[:'approximate_managed_instance_count'] if attributes[:'approximate_managed_instance_count']

      self.approximate_pending_work_request_count = attributes[:'approximatePendingWorkRequestCount'] if attributes[:'approximatePendingWorkRequestCount']

      raise 'You cannot provide both :approximatePendingWorkRequestCount and :approximate_pending_work_request_count' if attributes.key?(:'approximatePendingWorkRequestCount') && attributes.key?(:'approximate_pending_work_request_count')

      self.approximate_pending_work_request_count = attributes[:'approximate_pending_work_request_count'] if attributes[:'approximate_pending_work_request_count']

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] security_status Object to be assigned
    def security_status=(security_status)
      # rubocop:disable Style/ConditionalAssignment
      if security_status && !SECURITY_STATUS_ENUM.include?(security_status)
        OCI.logger.debug("Unknown value for 'security_status' [" + security_status + "]. Mapping to 'SECURITY_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @security_status = SECURITY_STATUS_UNKNOWN_ENUM_VALUE
      else
        @security_status = security_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        fleet_id == other.fleet_id &&
        managed_instance_id == other.managed_instance_id &&
        security_status == other.security_status &&
        release_date == other.release_date &&
        end_of_support_life_date == other.end_of_support_life_date &&
        vendor == other.vendor &&
        distribution == other.distribution &&
        version == other.version &&
        operating_systems == other.operating_systems &&
        approximate_installation_count == other.approximate_installation_count &&
        approximate_application_count == other.approximate_application_count &&
        approximate_managed_instance_count == other.approximate_managed_instance_count &&
        approximate_pending_work_request_count == other.approximate_pending_work_request_count &&
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
      [id, fleet_id, managed_instance_id, security_status, release_date, end_of_support_life_date, vendor, distribution, version, operating_systems, approximate_installation_count, approximate_application_count, approximate_managed_instance_count, approximate_pending_work_request_count, time_start, time_end, time_first_seen, time_last_seen].hash
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
