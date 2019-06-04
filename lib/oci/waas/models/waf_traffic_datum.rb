# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A time series of traffic data for the  Web Application Firewall configured for a policy.
  class Waas::Models::WafTrafficDatum
    # The date and time the traffic was observed, rounded down to the start of the range, and expressed in RFC 3339 timestamp format.
    # @return [DateTime]
    attr_accessor :time_observed

    # The number of seconds this data covers.
    # @return [Integer]
    attr_accessor :time_range_in_seconds

    # The tenancy OCID of the data.
    # @return [String]
    attr_accessor :tenancy_id

    # The compartment OCID of the data.
    # @return [String]
    attr_accessor :compartment_id

    # The policy OCID of the data.
    # @return [String]
    attr_accessor :waas_policy_id

    # Traffic in bytes.
    # @return [Integer]
    attr_accessor :traffic_in_bytes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_observed': :'timeObserved',
        'time_range_in_seconds': :'timeRangeInSeconds',
        'tenancy_id': :'tenancyId',
        'compartment_id': :'compartmentId',
        'waas_policy_id': :'waasPolicyId',
        'traffic_in_bytes': :'trafficInBytes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_observed': :'DateTime',
        'time_range_in_seconds': :'Integer',
        'tenancy_id': :'String',
        'compartment_id': :'String',
        'waas_policy_id': :'String',
        'traffic_in_bytes': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_observed The value to assign to the {#time_observed} property
    # @option attributes [Integer] :time_range_in_seconds The value to assign to the {#time_range_in_seconds} property
    # @option attributes [String] :tenancy_id The value to assign to the {#tenancy_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :waas_policy_id The value to assign to the {#waas_policy_id} property
    # @option attributes [Integer] :traffic_in_bytes The value to assign to the {#traffic_in_bytes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_observed = attributes[:'timeObserved'] if attributes[:'timeObserved']

      raise 'You cannot provide both :timeObserved and :time_observed' if attributes.key?(:'timeObserved') && attributes.key?(:'time_observed')

      self.time_observed = attributes[:'time_observed'] if attributes[:'time_observed']

      self.time_range_in_seconds = attributes[:'timeRangeInSeconds'] if attributes[:'timeRangeInSeconds']

      raise 'You cannot provide both :timeRangeInSeconds and :time_range_in_seconds' if attributes.key?(:'timeRangeInSeconds') && attributes.key?(:'time_range_in_seconds')

      self.time_range_in_seconds = attributes[:'time_range_in_seconds'] if attributes[:'time_range_in_seconds']

      self.tenancy_id = attributes[:'tenancyId'] if attributes[:'tenancyId']

      raise 'You cannot provide both :tenancyId and :tenancy_id' if attributes.key?(:'tenancyId') && attributes.key?(:'tenancy_id')

      self.tenancy_id = attributes[:'tenancy_id'] if attributes[:'tenancy_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.waas_policy_id = attributes[:'waasPolicyId'] if attributes[:'waasPolicyId']

      raise 'You cannot provide both :waasPolicyId and :waas_policy_id' if attributes.key?(:'waasPolicyId') && attributes.key?(:'waas_policy_id')

      self.waas_policy_id = attributes[:'waas_policy_id'] if attributes[:'waas_policy_id']

      self.traffic_in_bytes = attributes[:'trafficInBytes'] if attributes[:'trafficInBytes']

      raise 'You cannot provide both :trafficInBytes and :traffic_in_bytes' if attributes.key?(:'trafficInBytes') && attributes.key?(:'traffic_in_bytes')

      self.traffic_in_bytes = attributes[:'traffic_in_bytes'] if attributes[:'traffic_in_bytes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_observed == other.time_observed &&
        time_range_in_seconds == other.time_range_in_seconds &&
        tenancy_id == other.tenancy_id &&
        compartment_id == other.compartment_id &&
        waas_policy_id == other.waas_policy_id &&
        traffic_in_bytes == other.traffic_in_bytes
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
      [time_observed, time_range_in_seconds, tenancy_id, compartment_id, waas_policy_id, traffic_in_bytes].hash
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
