# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The results returned by running a ping probe.  All times and durations are
  # returned in milliseconds. All times are relative to the POSIX epoch
  # (1970-01-01T00:00Z).
  #
  class Healthchecks::Models::PingProbeResultSummary
    ERROR_CATEGORY_ENUM = [
      ERROR_CATEGORY_NONE = 'NONE'.freeze,
      ERROR_CATEGORY_DNS = 'DNS'.freeze,
      ERROR_CATEGORY_TRANSPORT = 'TRANSPORT'.freeze,
      ERROR_CATEGORY_NETWORK = 'NETWORK'.freeze,
      ERROR_CATEGORY_SYSTEM = 'SYSTEM'.freeze,
      ERROR_CATEGORY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PROTOCOL_ENUM = [
      PROTOCOL_ICMP = 'ICMP'.freeze,
      PROTOCOL_TCP = 'TCP'.freeze,
      PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # A value identifying this specific probe result. The key is only unique within
    # the results of its probe configuration. The key may be reused after 90 days.
    #
    # @return [String]
    attr_accessor :key

    # The OCID of the monitor or on-demand probe responsible for creating this result.
    #
    # @return [String]
    attr_accessor :probe_configuration_id

    # The date and time the probe was executed, expressed in milliseconds since the
    # POSIX epoch. This field is defined by the PerformanceResourceTiming interface
    # of the W3C Resource Timing specification. For more information, see
    # [Resource Timing](https://w3c.github.io/resource-timing/#sec-resource-timing).
    #
    # @return [Float]
    attr_accessor :start_time

    # The target hostname or IP address of the probe.
    # @return [String]
    attr_accessor :target

    # The name of the vantage point that executed the probe.
    # @return [String]
    attr_accessor :vantage_point_name

    # True if the probe did not complete before the configured `timeoutInSeconds` value.
    #
    # @return [BOOLEAN]
    attr_accessor :is_timed_out

    # True if the probe result is determined to be healthy based on probe
    # type-specific criteria.  For HTTP probes, a probe result is considered
    # healthy if the HTTP response code is greater than or equal to 200 and
    # less than 300.
    #
    # @return [BOOLEAN]
    attr_accessor :is_healthy

    # The category of error if an error occurs executing the probe.
    # The `errorMessage` field provides a message with the error details.
    # * NONE - No error
    # * DNS - DNS errors
    # * TRANSPORT - Transport-related errors, for example a \"TLS certificate expired\" error.
    # * NETWORK - Network-related errors, for example a \"network unreachable\" error.
    # * SYSTEM - Internal system errors.
    #
    # @return [String]
    attr_reader :error_category

    # The error information indicating why a probe execution failed.
    # @return [String]
    attr_accessor :error_message

    # @return [String]
    attr_reader :protocol

    # @return [OCI::Healthchecks::Models::Connection]
    attr_accessor :connection

    # @return [OCI::Healthchecks::Models::DNS]
    attr_accessor :dns

    # The time immediately before the vantage point starts the domain name lookup for
    # the resource.
    #
    # @return [Float]
    attr_accessor :domain_lookup_start

    # The time immediately before the vantage point finishes the domain name lookup for
    # the resource.
    #
    # @return [Float]
    attr_accessor :domain_lookup_end

    # The latency of the probe execution, in milliseconds.
    #
    # @return [Float]
    attr_accessor :latency_in_ms

    # The ICMP code of the response message.  This field is not used when the protocol
    # is set to TCP.  For more information on ICMP codes, see
    # [Internet Control Message Protocol (ICMP) Parameters](https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml).
    #
    # @return [Integer]
    attr_accessor :icmp_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'probe_configuration_id': :'probeConfigurationId',
        'start_time': :'startTime',
        'target': :'target',
        'vantage_point_name': :'vantagePointName',
        'is_timed_out': :'isTimedOut',
        'is_healthy': :'isHealthy',
        'error_category': :'errorCategory',
        'error_message': :'errorMessage',
        'protocol': :'protocol',
        'connection': :'connection',
        'dns': :'dns',
        'domain_lookup_start': :'domainLookupStart',
        'domain_lookup_end': :'domainLookupEnd',
        'latency_in_ms': :'latencyInMs',
        'icmp_code': :'icmpCode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'probe_configuration_id': :'String',
        'start_time': :'Float',
        'target': :'String',
        'vantage_point_name': :'String',
        'is_timed_out': :'BOOLEAN',
        'is_healthy': :'BOOLEAN',
        'error_category': :'String',
        'error_message': :'String',
        'protocol': :'String',
        'connection': :'OCI::Healthchecks::Models::Connection',
        'dns': :'OCI::Healthchecks::Models::DNS',
        'domain_lookup_start': :'Float',
        'domain_lookup_end': :'Float',
        'latency_in_ms': :'Float',
        'icmp_code': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :probe_configuration_id The value to assign to the {#probe_configuration_id} property
    # @option attributes [Float] :start_time The value to assign to the {#start_time} property
    # @option attributes [String] :target The value to assign to the {#target} property
    # @option attributes [String] :vantage_point_name The value to assign to the {#vantage_point_name} property
    # @option attributes [BOOLEAN] :is_timed_out The value to assign to the {#is_timed_out} property
    # @option attributes [BOOLEAN] :is_healthy The value to assign to the {#is_healthy} property
    # @option attributes [String] :error_category The value to assign to the {#error_category} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [OCI::Healthchecks::Models::Connection] :connection The value to assign to the {#connection} property
    # @option attributes [OCI::Healthchecks::Models::DNS] :dns The value to assign to the {#dns} property
    # @option attributes [Float] :domain_lookup_start The value to assign to the {#domain_lookup_start} property
    # @option attributes [Float] :domain_lookup_end The value to assign to the {#domain_lookup_end} property
    # @option attributes [Float] :latency_in_ms The value to assign to the {#latency_in_ms} property
    # @option attributes [Integer] :icmp_code The value to assign to the {#icmp_code} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.probe_configuration_id = attributes[:'probeConfigurationId'] if attributes[:'probeConfigurationId']

      raise 'You cannot provide both :probeConfigurationId and :probe_configuration_id' if attributes.key?(:'probeConfigurationId') && attributes.key?(:'probe_configuration_id')

      self.probe_configuration_id = attributes[:'probe_configuration_id'] if attributes[:'probe_configuration_id']

      self.start_time = attributes[:'startTime'] if attributes[:'startTime']

      raise 'You cannot provide both :startTime and :start_time' if attributes.key?(:'startTime') && attributes.key?(:'start_time')

      self.start_time = attributes[:'start_time'] if attributes[:'start_time']

      self.target = attributes[:'target'] if attributes[:'target']

      self.vantage_point_name = attributes[:'vantagePointName'] if attributes[:'vantagePointName']

      raise 'You cannot provide both :vantagePointName and :vantage_point_name' if attributes.key?(:'vantagePointName') && attributes.key?(:'vantage_point_name')

      self.vantage_point_name = attributes[:'vantage_point_name'] if attributes[:'vantage_point_name']

      self.is_timed_out = attributes[:'isTimedOut'] unless attributes[:'isTimedOut'].nil?

      raise 'You cannot provide both :isTimedOut and :is_timed_out' if attributes.key?(:'isTimedOut') && attributes.key?(:'is_timed_out')

      self.is_timed_out = attributes[:'is_timed_out'] unless attributes[:'is_timed_out'].nil?

      self.is_healthy = attributes[:'isHealthy'] unless attributes[:'isHealthy'].nil?

      raise 'You cannot provide both :isHealthy and :is_healthy' if attributes.key?(:'isHealthy') && attributes.key?(:'is_healthy')

      self.is_healthy = attributes[:'is_healthy'] unless attributes[:'is_healthy'].nil?

      self.error_category = attributes[:'errorCategory'] if attributes[:'errorCategory']
      self.error_category = "NONE" if error_category.nil? && !attributes.key?(:'errorCategory') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :errorCategory and :error_category' if attributes.key?(:'errorCategory') && attributes.key?(:'error_category')

      self.error_category = attributes[:'error_category'] if attributes[:'error_category']
      self.error_category = "NONE" if error_category.nil? && !attributes.key?(:'errorCategory') && !attributes.key?(:'error_category') # rubocop:disable Style/StringLiterals

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.connection = attributes[:'connection'] if attributes[:'connection']

      self.dns = attributes[:'dns'] if attributes[:'dns']

      self.domain_lookup_start = attributes[:'domainLookupStart'] if attributes[:'domainLookupStart']

      raise 'You cannot provide both :domainLookupStart and :domain_lookup_start' if attributes.key?(:'domainLookupStart') && attributes.key?(:'domain_lookup_start')

      self.domain_lookup_start = attributes[:'domain_lookup_start'] if attributes[:'domain_lookup_start']

      self.domain_lookup_end = attributes[:'domainLookupEnd'] if attributes[:'domainLookupEnd']

      raise 'You cannot provide both :domainLookupEnd and :domain_lookup_end' if attributes.key?(:'domainLookupEnd') && attributes.key?(:'domain_lookup_end')

      self.domain_lookup_end = attributes[:'domain_lookup_end'] if attributes[:'domain_lookup_end']

      self.latency_in_ms = attributes[:'latencyInMs'] if attributes[:'latencyInMs']

      raise 'You cannot provide both :latencyInMs and :latency_in_ms' if attributes.key?(:'latencyInMs') && attributes.key?(:'latency_in_ms')

      self.latency_in_ms = attributes[:'latency_in_ms'] if attributes[:'latency_in_ms']

      self.icmp_code = attributes[:'icmpCode'] if attributes[:'icmpCode']

      raise 'You cannot provide both :icmpCode and :icmp_code' if attributes.key?(:'icmpCode') && attributes.key?(:'icmp_code')

      self.icmp_code = attributes[:'icmp_code'] if attributes[:'icmp_code']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] error_category Object to be assigned
    def error_category=(error_category)
      # rubocop:disable Style/ConditionalAssignment
      if error_category && !ERROR_CATEGORY_ENUM.include?(error_category)
        OCI.logger.debug("Unknown value for 'error_category' [" + error_category + "]. Mapping to 'ERROR_CATEGORY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @error_category = ERROR_CATEGORY_UNKNOWN_ENUM_VALUE
      else
        @error_category = error_category
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protocol Object to be assigned
    def protocol=(protocol)
      # rubocop:disable Style/ConditionalAssignment
      if protocol && !PROTOCOL_ENUM.include?(protocol)
        OCI.logger.debug("Unknown value for 'protocol' [" + protocol + "]. Mapping to 'PROTOCOL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protocol = PROTOCOL_UNKNOWN_ENUM_VALUE
      else
        @protocol = protocol
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        probe_configuration_id == other.probe_configuration_id &&
        start_time == other.start_time &&
        target == other.target &&
        vantage_point_name == other.vantage_point_name &&
        is_timed_out == other.is_timed_out &&
        is_healthy == other.is_healthy &&
        error_category == other.error_category &&
        error_message == other.error_message &&
        protocol == other.protocol &&
        connection == other.connection &&
        dns == other.dns &&
        domain_lookup_start == other.domain_lookup_start &&
        domain_lookup_end == other.domain_lookup_end &&
        latency_in_ms == other.latency_in_ms &&
        icmp_code == other.icmp_code
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
      [key, probe_configuration_id, start_time, target, vantage_point_name, is_timed_out, is_healthy, error_category, error_message, protocol, connection, dns, domain_lookup_start, domain_lookup_end, latency_in_ms, icmp_code].hash
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
