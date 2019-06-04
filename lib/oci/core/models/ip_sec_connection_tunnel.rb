# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about a single tunnel in an IPSec connection. This object does not include the tunnel's
  # shared secret (pre-shared key). That is in the
  # {IPSecConnectionTunnelSharedSecret} object.
  #
  class Core::Models::IPSecConnectionTunnel
    STATUS_ENUM = [
      STATUS_UP = 'UP'.freeze,
      STATUS_DOWN = 'DOWN'.freeze,
      STATUS_DOWN_FOR_MAINTENANCE = 'DOWN_FOR_MAINTENANCE'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROUTING_ENUM = [
      ROUTING_BGP = 'BGP'.freeze,
      ROUTING_STATIC = 'STATIC'.freeze,
      ROUTING_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the tunnel.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @return [String]
    attr_accessor :id

    # The IP address of Oracle's VPN headend.
    #
    # Example: `192.0.2.5`
    #
    # @return [String]
    attr_accessor :vpn_ip

    # The IP address of the CPE's VPN headend.
    #
    # Example: `192.0.2.157`
    #
    # @return [String]
    attr_accessor :cpe_ip

    # The status of the tunnel based on IPSec protocol characteristics.
    # @return [String]
    attr_reader :status

    # **[Required]** The tunnel's lifecycle state.
    # @return [String]
    attr_reader :lifecycle_state

    # A user-friendly name. Does not have to be unique, and it's changeable. Avoid
    # entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Information for establishing the tunnel's BGP session.
    #
    # @return [OCI::Core::Models::BgpSessionInfo]
    attr_accessor :bgp_session_info

    # The type of routing used for this tunnel (either BGP dynamic routing or static routing).
    #
    # @return [String]
    attr_reader :routing

    # The date and time the IPSec connection tunnel was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # When the status of the tunnel last changed, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_status_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'id': :'id',
        'vpn_ip': :'vpnIp',
        'cpe_ip': :'cpeIp',
        'status': :'status',
        'lifecycle_state': :'lifecycleState',
        'display_name': :'displayName',
        'bgp_session_info': :'bgpSessionInfo',
        'routing': :'routing',
        'time_created': :'timeCreated',
        'time_status_updated': :'timeStatusUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'id': :'String',
        'vpn_ip': :'String',
        'cpe_ip': :'String',
        'status': :'String',
        'lifecycle_state': :'String',
        'display_name': :'String',
        'bgp_session_info': :'OCI::Core::Models::BgpSessionInfo',
        'routing': :'String',
        'time_created': :'DateTime',
        'time_status_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :vpn_ip The value to assign to the {#vpn_ip} property
    # @option attributes [String] :cpe_ip The value to assign to the {#cpe_ip} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [OCI::Core::Models::BgpSessionInfo] :bgp_session_info The value to assign to the {#bgp_session_info} property
    # @option attributes [String] :routing The value to assign to the {#routing} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_status_updated The value to assign to the {#time_status_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.id = attributes[:'id'] if attributes[:'id']

      self.vpn_ip = attributes[:'vpnIp'] if attributes[:'vpnIp']

      raise 'You cannot provide both :vpnIp and :vpn_ip' if attributes.key?(:'vpnIp') && attributes.key?(:'vpn_ip')

      self.vpn_ip = attributes[:'vpn_ip'] if attributes[:'vpn_ip']

      self.cpe_ip = attributes[:'cpeIp'] if attributes[:'cpeIp']

      raise 'You cannot provide both :cpeIp and :cpe_ip' if attributes.key?(:'cpeIp') && attributes.key?(:'cpe_ip')

      self.cpe_ip = attributes[:'cpe_ip'] if attributes[:'cpe_ip']

      self.status = attributes[:'status'] if attributes[:'status']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.bgp_session_info = attributes[:'bgpSessionInfo'] if attributes[:'bgpSessionInfo']

      raise 'You cannot provide both :bgpSessionInfo and :bgp_session_info' if attributes.key?(:'bgpSessionInfo') && attributes.key?(:'bgp_session_info')

      self.bgp_session_info = attributes[:'bgp_session_info'] if attributes[:'bgp_session_info']

      self.routing = attributes[:'routing'] if attributes[:'routing']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_status_updated = attributes[:'timeStatusUpdated'] if attributes[:'timeStatusUpdated']

      raise 'You cannot provide both :timeStatusUpdated and :time_status_updated' if attributes.key?(:'timeStatusUpdated') && attributes.key?(:'time_status_updated')

      self.time_status_updated = attributes[:'time_status_updated'] if attributes[:'time_status_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] routing Object to be assigned
    def routing=(routing)
      # rubocop:disable Style/ConditionalAssignment
      if routing && !ROUTING_ENUM.include?(routing)
        OCI.logger.debug("Unknown value for 'routing' [" + routing + "]. Mapping to 'ROUTING_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @routing = ROUTING_UNKNOWN_ENUM_VALUE
      else
        @routing = routing
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        id == other.id &&
        vpn_ip == other.vpn_ip &&
        cpe_ip == other.cpe_ip &&
        status == other.status &&
        lifecycle_state == other.lifecycle_state &&
        display_name == other.display_name &&
        bgp_session_info == other.bgp_session_info &&
        routing == other.routing &&
        time_created == other.time_created &&
        time_status_updated == other.time_status_updated
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
      [compartment_id, id, vpn_ip, cpe_ip, status, lifecycle_state, display_name, bgp_session_info, routing, time_created, time_status_updated].hash
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
