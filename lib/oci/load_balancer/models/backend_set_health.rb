# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The health status details for a backend set.
  #
  # This object does not explicitly enumerate backend servers with a status of `OK`. However, they are included in the
  # `totalBackendCount` sum.
  #
  class LoadBalancer::Models::BackendSetHealth # rubocop:disable Metrics/LineLength
    STATUS_ENUM = [
      STATUS_OK = 'OK'.freeze,
      STATUS_WARNING = 'WARNING'.freeze,
      STATUS_CRITICAL = 'CRITICAL'.freeze,
      STATUS_UNKNOWN = 'UNKNOWN'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** A list of backend servers that are currently in the `CRITICAL` health state. The list identifies each backend server by
    # IP address and port.
    #
    # Example: `1.1.1.1:80`
    #
    # @return [Array<String>]
    attr_accessor :critical_state_backend_names

    # **[Required]** Overall health status of the backend set.
    #
    # *  **OK:** All backend servers in the backend set return a status of `OK`.
    #
    # *  **WARNING:** Half or more of the backend set's backend servers return a status of `OK` and at least one backend
    # server returns a status of `WARNING`, `CRITICAL`, or `UNKNOWN`.
    #
    # *  **CRITICAL:** Fewer than half of the backend set's backend servers return a status of `OK`.
    #
    # *  **UNKNOWN:** More than half of the backend set's backend servers return a status of `UNKNOWN`, the system was
    # unable to retrieve metrics, or the backend set does not have a listener attached.
    #
    # @return [String]
    attr_reader :status

    # **[Required]** The total number of backend servers in this backend set.
    #
    # Example: `5`
    #
    # @return [Integer]
    attr_accessor :total_backend_count

    # **[Required]** A list of backend servers that are currently in the `UNKNOWN` health state. The list identifies each backend server by
    # IP address and port.
    #
    # Example: `1.1.1.5:80`
    #
    # @return [Array<String>]
    attr_accessor :unknown_state_backend_names

    # **[Required]** A list of backend servers that are currently in the `WARNING` health state. The list identifies each backend server by
    # IP address and port.
    #
    # Example: `1.1.1.7:42`
    #
    # @return [Array<String>]
    attr_accessor :warning_state_backend_names

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'critical_state_backend_names': :'criticalStateBackendNames',
        'status': :'status',
        'total_backend_count': :'totalBackendCount',
        'unknown_state_backend_names': :'unknownStateBackendNames',
        'warning_state_backend_names': :'warningStateBackendNames'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'critical_state_backend_names': :'Array<String>',
        'status': :'String',
        'total_backend_count': :'Integer',
        'unknown_state_backend_names': :'Array<String>',
        'warning_state_backend_names': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :critical_state_backend_names The value to assign to the {#critical_state_backend_names} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Integer] :total_backend_count The value to assign to the {#total_backend_count} property
    # @option attributes [Array<String>] :unknown_state_backend_names The value to assign to the {#unknown_state_backend_names} property
    # @option attributes [Array<String>] :warning_state_backend_names The value to assign to the {#warning_state_backend_names} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.critical_state_backend_names = attributes[:'criticalStateBackendNames'] if attributes[:'criticalStateBackendNames']

      raise 'You cannot provide both :criticalStateBackendNames and :critical_state_backend_names' if attributes.key?(:'criticalStateBackendNames') && attributes.key?(:'critical_state_backend_names')

      self.critical_state_backend_names = attributes[:'critical_state_backend_names'] if attributes[:'critical_state_backend_names']

      self.status = attributes[:'status'] if attributes[:'status']

      self.total_backend_count = attributes[:'totalBackendCount'] if attributes[:'totalBackendCount']

      raise 'You cannot provide both :totalBackendCount and :total_backend_count' if attributes.key?(:'totalBackendCount') && attributes.key?(:'total_backend_count')

      self.total_backend_count = attributes[:'total_backend_count'] if attributes[:'total_backend_count']

      self.unknown_state_backend_names = attributes[:'unknownStateBackendNames'] if attributes[:'unknownStateBackendNames']

      raise 'You cannot provide both :unknownStateBackendNames and :unknown_state_backend_names' if attributes.key?(:'unknownStateBackendNames') && attributes.key?(:'unknown_state_backend_names')

      self.unknown_state_backend_names = attributes[:'unknown_state_backend_names'] if attributes[:'unknown_state_backend_names']

      self.warning_state_backend_names = attributes[:'warningStateBackendNames'] if attributes[:'warningStateBackendNames']

      raise 'You cannot provide both :warningStateBackendNames and :warning_state_backend_names' if attributes.key?(:'warningStateBackendNames') && attributes.key?(:'warning_state_backend_names')

      self.warning_state_backend_names = attributes[:'warning_state_backend_names'] if attributes[:'warning_state_backend_names']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        critical_state_backend_names == other.critical_state_backend_names &&
        status == other.status &&
        total_backend_count == other.total_backend_count &&
        unknown_state_backend_names == other.unknown_state_backend_names &&
        warning_state_backend_names == other.warning_state_backend_names
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [critical_state_backend_names, status, total_backend_count, unknown_state_backend_names, warning_state_backend_names].hash
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
