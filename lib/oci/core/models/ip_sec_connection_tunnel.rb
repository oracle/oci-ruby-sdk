# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

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
      STATUS_PARTIAL_UP = 'PARTIAL_UP'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IKE_VERSION_ENUM = [
      IKE_VERSION_V1 = 'V1'.freeze,
      IKE_VERSION_V2 = 'V2'.freeze,
      IKE_VERSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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
      ROUTING_POLICY = 'POLICY'.freeze,
      ROUTING_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ORACLE_CAN_INITIATE_ENUM = [
      ORACLE_CAN_INITIATE_INITIATOR_OR_RESPONDER = 'INITIATOR_OR_RESPONDER'.freeze,
      ORACLE_CAN_INITIATE_RESPONDER_ONLY = 'RESPONDER_ONLY'.freeze,
      ORACLE_CAN_INITIATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NAT_TRANSLATION_ENABLED_ENUM = [
      NAT_TRANSLATION_ENABLED_ENABLED = 'ENABLED'.freeze,
      NAT_TRANSLATION_ENABLED_DISABLED = 'DISABLED'.freeze,
      NAT_TRANSLATION_ENABLED_AUTO = 'AUTO'.freeze,
      NAT_TRANSLATION_ENABLED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DPD_MODE_ENUM = [
      DPD_MODE_INITIATE_AND_RESPOND = 'INITIATE_AND_RESPOND'.freeze,
      DPD_MODE_RESPOND_ONLY = 'RESPOND_ONLY'.freeze,
      DPD_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the tunnel.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @return [String]
    attr_accessor :id

    # The IP address of Oracle's VPN headend.
    #
    # Example: `203.0.113.21`
    #
    # @return [String]
    attr_accessor :vpn_ip

    # The IP address of the CPE's VPN headend.
    #
    # Example: `203.0.113.22`
    #
    # @return [String]
    attr_accessor :cpe_ip

    # The status of the tunnel based on IPSec protocol characteristics.
    # @return [String]
    attr_reader :status

    # Internet Key Exchange protocol version.
    #
    # @return [String]
    attr_reader :ike_version

    # **[Required]** The tunnel's lifecycle state.
    # @return [String]
    attr_reader :lifecycle_state

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # @return [OCI::Core::Models::BgpSessionInfo]
    attr_accessor :bgp_session_info

    # @return [OCI::Core::Models::EncryptionDomainConfig]
    attr_accessor :encryption_domain_config

    # The type of routing used for this tunnel (either BGP dynamic routing or static routing).
    #
    # @return [String]
    attr_reader :routing

    # The date and time the IPSec connection tunnel was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # When the status of the tunnel last changed, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_status_updated

    # Indicates whether Oracle can either initiate the tunnel or respond, or respond only.
    # @return [String]
    attr_reader :oracle_can_initiate

    # Whether NAT-T Enabled on the tunnel
    # @return [String]
    attr_reader :nat_translation_enabled

    # dpd mode
    # @return [String]
    attr_reader :dpd_mode

    # Dead peer detection (DPD) timeout in seconds.
    # @return [Integer]
    attr_accessor :dpd_timeout_in_sec

    # @return [OCI::Core::Models::TunnelPhaseOneDetails]
    attr_accessor :phase_one_details

    # @return [OCI::Core::Models::TunnelPhaseTwoDetails]
    attr_accessor :phase_two_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'id': :'id',
        'vpn_ip': :'vpnIp',
        'cpe_ip': :'cpeIp',
        'status': :'status',
        'ike_version': :'ikeVersion',
        'lifecycle_state': :'lifecycleState',
        'display_name': :'displayName',
        'bgp_session_info': :'bgpSessionInfo',
        'encryption_domain_config': :'encryptionDomainConfig',
        'routing': :'routing',
        'time_created': :'timeCreated',
        'time_status_updated': :'timeStatusUpdated',
        'oracle_can_initiate': :'oracleCanInitiate',
        'nat_translation_enabled': :'natTranslationEnabled',
        'dpd_mode': :'dpdMode',
        'dpd_timeout_in_sec': :'dpdTimeoutInSec',
        'phase_one_details': :'phaseOneDetails',
        'phase_two_details': :'phaseTwoDetails'
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
        'ike_version': :'String',
        'lifecycle_state': :'String',
        'display_name': :'String',
        'bgp_session_info': :'OCI::Core::Models::BgpSessionInfo',
        'encryption_domain_config': :'OCI::Core::Models::EncryptionDomainConfig',
        'routing': :'String',
        'time_created': :'DateTime',
        'time_status_updated': :'DateTime',
        'oracle_can_initiate': :'String',
        'nat_translation_enabled': :'String',
        'dpd_mode': :'String',
        'dpd_timeout_in_sec': :'Integer',
        'phase_one_details': :'OCI::Core::Models::TunnelPhaseOneDetails',
        'phase_two_details': :'OCI::Core::Models::TunnelPhaseTwoDetails'
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
    # @option attributes [String] :ike_version The value to assign to the {#ike_version} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [OCI::Core::Models::BgpSessionInfo] :bgp_session_info The value to assign to the {#bgp_session_info} property
    # @option attributes [OCI::Core::Models::EncryptionDomainConfig] :encryption_domain_config The value to assign to the {#encryption_domain_config} property
    # @option attributes [String] :routing The value to assign to the {#routing} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_status_updated The value to assign to the {#time_status_updated} property
    # @option attributes [String] :oracle_can_initiate The value to assign to the {#oracle_can_initiate} property
    # @option attributes [String] :nat_translation_enabled The value to assign to the {#nat_translation_enabled} property
    # @option attributes [String] :dpd_mode The value to assign to the {#dpd_mode} property
    # @option attributes [Integer] :dpd_timeout_in_sec The value to assign to the {#dpd_timeout_in_sec} property
    # @option attributes [OCI::Core::Models::TunnelPhaseOneDetails] :phase_one_details The value to assign to the {#phase_one_details} property
    # @option attributes [OCI::Core::Models::TunnelPhaseTwoDetails] :phase_two_details The value to assign to the {#phase_two_details} property
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

      self.ike_version = attributes[:'ikeVersion'] if attributes[:'ikeVersion']

      raise 'You cannot provide both :ikeVersion and :ike_version' if attributes.key?(:'ikeVersion') && attributes.key?(:'ike_version')

      self.ike_version = attributes[:'ike_version'] if attributes[:'ike_version']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.bgp_session_info = attributes[:'bgpSessionInfo'] if attributes[:'bgpSessionInfo']

      raise 'You cannot provide both :bgpSessionInfo and :bgp_session_info' if attributes.key?(:'bgpSessionInfo') && attributes.key?(:'bgp_session_info')

      self.bgp_session_info = attributes[:'bgp_session_info'] if attributes[:'bgp_session_info']

      self.encryption_domain_config = attributes[:'encryptionDomainConfig'] if attributes[:'encryptionDomainConfig']

      raise 'You cannot provide both :encryptionDomainConfig and :encryption_domain_config' if attributes.key?(:'encryptionDomainConfig') && attributes.key?(:'encryption_domain_config')

      self.encryption_domain_config = attributes[:'encryption_domain_config'] if attributes[:'encryption_domain_config']

      self.routing = attributes[:'routing'] if attributes[:'routing']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_status_updated = attributes[:'timeStatusUpdated'] if attributes[:'timeStatusUpdated']

      raise 'You cannot provide both :timeStatusUpdated and :time_status_updated' if attributes.key?(:'timeStatusUpdated') && attributes.key?(:'time_status_updated')

      self.time_status_updated = attributes[:'time_status_updated'] if attributes[:'time_status_updated']

      self.oracle_can_initiate = attributes[:'oracleCanInitiate'] if attributes[:'oracleCanInitiate']

      raise 'You cannot provide both :oracleCanInitiate and :oracle_can_initiate' if attributes.key?(:'oracleCanInitiate') && attributes.key?(:'oracle_can_initiate')

      self.oracle_can_initiate = attributes[:'oracle_can_initiate'] if attributes[:'oracle_can_initiate']

      self.nat_translation_enabled = attributes[:'natTranslationEnabled'] if attributes[:'natTranslationEnabled']

      raise 'You cannot provide both :natTranslationEnabled and :nat_translation_enabled' if attributes.key?(:'natTranslationEnabled') && attributes.key?(:'nat_translation_enabled')

      self.nat_translation_enabled = attributes[:'nat_translation_enabled'] if attributes[:'nat_translation_enabled']

      self.dpd_mode = attributes[:'dpdMode'] if attributes[:'dpdMode']

      raise 'You cannot provide both :dpdMode and :dpd_mode' if attributes.key?(:'dpdMode') && attributes.key?(:'dpd_mode')

      self.dpd_mode = attributes[:'dpd_mode'] if attributes[:'dpd_mode']

      self.dpd_timeout_in_sec = attributes[:'dpdTimeoutInSec'] if attributes[:'dpdTimeoutInSec']

      raise 'You cannot provide both :dpdTimeoutInSec and :dpd_timeout_in_sec' if attributes.key?(:'dpdTimeoutInSec') && attributes.key?(:'dpd_timeout_in_sec')

      self.dpd_timeout_in_sec = attributes[:'dpd_timeout_in_sec'] if attributes[:'dpd_timeout_in_sec']

      self.phase_one_details = attributes[:'phaseOneDetails'] if attributes[:'phaseOneDetails']

      raise 'You cannot provide both :phaseOneDetails and :phase_one_details' if attributes.key?(:'phaseOneDetails') && attributes.key?(:'phase_one_details')

      self.phase_one_details = attributes[:'phase_one_details'] if attributes[:'phase_one_details']

      self.phase_two_details = attributes[:'phaseTwoDetails'] if attributes[:'phaseTwoDetails']

      raise 'You cannot provide both :phaseTwoDetails and :phase_two_details' if attributes.key?(:'phaseTwoDetails') && attributes.key?(:'phase_two_details')

      self.phase_two_details = attributes[:'phase_two_details'] if attributes[:'phase_two_details']
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
    # @param [Object] ike_version Object to be assigned
    def ike_version=(ike_version)
      # rubocop:disable Style/ConditionalAssignment
      if ike_version && !IKE_VERSION_ENUM.include?(ike_version)
        OCI.logger.debug("Unknown value for 'ike_version' [" + ike_version + "]. Mapping to 'IKE_VERSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @ike_version = IKE_VERSION_UNKNOWN_ENUM_VALUE
      else
        @ike_version = ike_version
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] oracle_can_initiate Object to be assigned
    def oracle_can_initiate=(oracle_can_initiate)
      # rubocop:disable Style/ConditionalAssignment
      if oracle_can_initiate && !ORACLE_CAN_INITIATE_ENUM.include?(oracle_can_initiate)
        OCI.logger.debug("Unknown value for 'oracle_can_initiate' [" + oracle_can_initiate + "]. Mapping to 'ORACLE_CAN_INITIATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @oracle_can_initiate = ORACLE_CAN_INITIATE_UNKNOWN_ENUM_VALUE
      else
        @oracle_can_initiate = oracle_can_initiate
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] nat_translation_enabled Object to be assigned
    def nat_translation_enabled=(nat_translation_enabled)
      # rubocop:disable Style/ConditionalAssignment
      if nat_translation_enabled && !NAT_TRANSLATION_ENABLED_ENUM.include?(nat_translation_enabled)
        OCI.logger.debug("Unknown value for 'nat_translation_enabled' [" + nat_translation_enabled + "]. Mapping to 'NAT_TRANSLATION_ENABLED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @nat_translation_enabled = NAT_TRANSLATION_ENABLED_UNKNOWN_ENUM_VALUE
      else
        @nat_translation_enabled = nat_translation_enabled
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dpd_mode Object to be assigned
    def dpd_mode=(dpd_mode)
      # rubocop:disable Style/ConditionalAssignment
      if dpd_mode && !DPD_MODE_ENUM.include?(dpd_mode)
        OCI.logger.debug("Unknown value for 'dpd_mode' [" + dpd_mode + "]. Mapping to 'DPD_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @dpd_mode = DPD_MODE_UNKNOWN_ENUM_VALUE
      else
        @dpd_mode = dpd_mode
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
        ike_version == other.ike_version &&
        lifecycle_state == other.lifecycle_state &&
        display_name == other.display_name &&
        bgp_session_info == other.bgp_session_info &&
        encryption_domain_config == other.encryption_domain_config &&
        routing == other.routing &&
        time_created == other.time_created &&
        time_status_updated == other.time_status_updated &&
        oracle_can_initiate == other.oracle_can_initiate &&
        nat_translation_enabled == other.nat_translation_enabled &&
        dpd_mode == other.dpd_mode &&
        dpd_timeout_in_sec == other.dpd_timeout_in_sec &&
        phase_one_details == other.phase_one_details &&
        phase_two_details == other.phase_two_details
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
      [compartment_id, id, vpn_ip, cpe_ip, status, ike_version, lifecycle_state, display_name, bgp_session_info, encryption_domain_config, routing, time_created, time_status_updated, oracle_can_initiate, nat_translation_enabled, dpd_mode, dpd_timeout_in_sec, phase_one_details, phase_two_details].hash
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
