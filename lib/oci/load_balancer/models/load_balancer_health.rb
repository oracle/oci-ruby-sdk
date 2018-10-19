# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The health status details for the specified load balancer.
  #
  # This object does not explicitly enumerate backend sets with a status of `OK`. However, they are included in the
  # `totalBackendSetCount` sum.
  #
  class LoadBalancer::Models::LoadBalancerHealth # rubocop:disable Metrics/LineLength
    STATUS_ENUM = [
      STATUS_OK = 'OK'.freeze,
      STATUS_WARNING = 'WARNING'.freeze,
      STATUS_CRITICAL = 'CRITICAL'.freeze,
      STATUS_UNKNOWN = 'UNKNOWN'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** A list of backend sets that are currently in the `CRITICAL` health state. The list identifies each backend set by the
    # friendly name you assigned when you created it.
    #
    # Example: `example_backend_set`
    #
    # @return [Array<String>]
    attr_accessor :critical_state_backend_set_names

    # **[Required]** The overall health status of the load balancer.
    #
    # *  **OK:** All backend sets associated with the load balancer return a status of `OK`.
    #
    # *  **WARNING:** At least one of the backend sets associated with the load balancer returns a status of `WARNING`,
    # no backend sets return a status of `CRITICAL`, and the load balancer life cycle state is `ACTIVE`.
    #
    # *  **CRITICAL:** One or more of the backend sets associated with the load balancer return a status of `CRITICAL`.
    #
    # *  **UNKNOWN:** If any one of the following conditions is true:
    #
    #     *  The load balancer life cycle state is not `ACTIVE`.
    #
    #     *  No backend sets are defined for the load balancer.
    #
    #     *  More than half of the backend sets associated with the load balancer return a status of `UNKNOWN`, none of the backend
    #        sets return a status of `WARNING` or `CRITICAL`, and the load balancer life cycle state is `ACTIVE`.
    #
    #     *  The system could not retrieve metrics for any reason.
    #
    # @return [String]
    attr_reader :status

    # **[Required]** The total number of backend sets associated with this load balancer.
    #
    # Example: `4`
    #
    # @return [Integer]
    attr_accessor :total_backend_set_count

    # **[Required]** A list of backend sets that are currently in the `UNKNOWN` health state. The list identifies each backend set by the
    # friendly name you assigned when you created it.
    #
    # Example: `example_backend_set2`
    #
    # @return [Array<String>]
    attr_accessor :unknown_state_backend_set_names

    # **[Required]** A list of backend sets that are currently in the `WARNING` health state. The list identifies each backend set by the
    # friendly name you assigned when you created it.
    #
    # Example: `example_backend_set3`
    #
    # @return [Array<String>]
    attr_accessor :warning_state_backend_set_names

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'critical_state_backend_set_names': :'criticalStateBackendSetNames',
        'status': :'status',
        'total_backend_set_count': :'totalBackendSetCount',
        'unknown_state_backend_set_names': :'unknownStateBackendSetNames',
        'warning_state_backend_set_names': :'warningStateBackendSetNames'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'critical_state_backend_set_names': :'Array<String>',
        'status': :'String',
        'total_backend_set_count': :'Integer',
        'unknown_state_backend_set_names': :'Array<String>',
        'warning_state_backend_set_names': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :critical_state_backend_set_names The value to assign to the {#critical_state_backend_set_names} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Integer] :total_backend_set_count The value to assign to the {#total_backend_set_count} property
    # @option attributes [Array<String>] :unknown_state_backend_set_names The value to assign to the {#unknown_state_backend_set_names} property
    # @option attributes [Array<String>] :warning_state_backend_set_names The value to assign to the {#warning_state_backend_set_names} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.critical_state_backend_set_names = attributes[:'criticalStateBackendSetNames'] if attributes[:'criticalStateBackendSetNames']

      raise 'You cannot provide both :criticalStateBackendSetNames and :critical_state_backend_set_names' if attributes.key?(:'criticalStateBackendSetNames') && attributes.key?(:'critical_state_backend_set_names')

      self.critical_state_backend_set_names = attributes[:'critical_state_backend_set_names'] if attributes[:'critical_state_backend_set_names']

      self.status = attributes[:'status'] if attributes[:'status']

      self.total_backend_set_count = attributes[:'totalBackendSetCount'] if attributes[:'totalBackendSetCount']

      raise 'You cannot provide both :totalBackendSetCount and :total_backend_set_count' if attributes.key?(:'totalBackendSetCount') && attributes.key?(:'total_backend_set_count')

      self.total_backend_set_count = attributes[:'total_backend_set_count'] if attributes[:'total_backend_set_count']

      self.unknown_state_backend_set_names = attributes[:'unknownStateBackendSetNames'] if attributes[:'unknownStateBackendSetNames']

      raise 'You cannot provide both :unknownStateBackendSetNames and :unknown_state_backend_set_names' if attributes.key?(:'unknownStateBackendSetNames') && attributes.key?(:'unknown_state_backend_set_names')

      self.unknown_state_backend_set_names = attributes[:'unknown_state_backend_set_names'] if attributes[:'unknown_state_backend_set_names']

      self.warning_state_backend_set_names = attributes[:'warningStateBackendSetNames'] if attributes[:'warningStateBackendSetNames']

      raise 'You cannot provide both :warningStateBackendSetNames and :warning_state_backend_set_names' if attributes.key?(:'warningStateBackendSetNames') && attributes.key?(:'warning_state_backend_set_names')

      self.warning_state_backend_set_names = attributes[:'warning_state_backend_set_names'] if attributes[:'warning_state_backend_set_names']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        critical_state_backend_set_names == other.critical_state_backend_set_names &&
        status == other.status &&
        total_backend_set_count == other.total_backend_set_count &&
        unknown_state_backend_set_names == other.unknown_state_backend_set_names &&
        warning_state_backend_set_names == other.warning_state_backend_set_names
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [critical_state_backend_set_names, status, total_backend_set_count, unknown_state_backend_set_names, warning_state_backend_set_names].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
