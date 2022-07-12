# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CreateIPSecConnectionTunnelDetails model.
  class Core::Models::CreateIPSecConnectionTunnelDetails
    ROUTING_ENUM = [
      ROUTING_BGP = 'BGP'.freeze,
      ROUTING_STATIC = 'STATIC'.freeze,
      ROUTING_POLICY = 'POLICY'.freeze
    ].freeze

    IKE_VERSION_ENUM = [
      IKE_VERSION_V1 = 'V1'.freeze,
      IKE_VERSION_V2 = 'V2'.freeze
    ].freeze

    ORACLE_INITIATION_ENUM = [
      ORACLE_INITIATION_INITIATOR_OR_RESPONDER = 'INITIATOR_OR_RESPONDER'.freeze,
      ORACLE_INITIATION_RESPONDER_ONLY = 'RESPONDER_ONLY'.freeze
    ].freeze

    NAT_TRANSLATION_ENABLED_ENUM = [
      NAT_TRANSLATION_ENABLED_ENABLED = 'ENABLED'.freeze,
      NAT_TRANSLATION_ENABLED_DISABLED = 'DISABLED'.freeze,
      NAT_TRANSLATION_ENABLED_AUTO = 'AUTO'.freeze
    ].freeze

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # The type of routing to use for this tunnel (BGP dynamic routing, static routing, or policy-based routing).
    #
    # @return [String]
    attr_reader :routing

    # Internet Key Exchange protocol version.
    #
    # @return [String]
    attr_reader :ike_version

    # The shared secret (pre-shared key) to use for the IPSec tunnel. Only numbers, letters, and
    # spaces are allowed. If you don't provide a value,
    # Oracle generates a value for you. You can specify your own shared secret later if
    # you like with {#update_ip_sec_connection_tunnel_shared_secret update_ip_sec_connection_tunnel_shared_secret}.
    #
    # @return [String]
    attr_accessor :shared_secret

    # @return [OCI::Core::Models::CreateIPSecTunnelBgpSessionDetails]
    attr_accessor :bgp_session_config

    # Indicates whether the Oracle end of the IPSec connection is able to initiate starting up the IPSec tunnel.
    #
    # @return [String]
    attr_reader :oracle_initiation

    # By default (the `AUTO` setting), IKE sends packets with a source and destination port set to 500,
    # and when it detects that the port used to forward packets has changed (most likely because a NAT device
    # is between the CPE device and the Oracle VPN headend) it will try to negotiate the use of NAT-T.
    #
    # The `ENABLED` option sets the IKE protocol to use port 4500 instead of 500 and forces encapsulating traffic with the ESP protocol inside UDP packets.
    #
    # The `DISABLED` option directs IKE to completely refuse to negotiate NAT-T
    # even if it senses there may be a NAT device in use.
    #
    # @return [String]
    attr_reader :nat_translation_enabled

    # @return [OCI::Core::Models::PhaseOneConfigDetails]
    attr_accessor :phase_one_config

    # @return [OCI::Core::Models::PhaseTwoConfigDetails]
    attr_accessor :phase_two_config

    # @return [OCI::Core::Models::DpdConfig]
    attr_accessor :dpd_config

    # @return [OCI::Core::Models::CreateIPSecTunnelEncryptionDomainDetails]
    attr_accessor :encryption_domain_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'routing': :'routing',
        'ike_version': :'ikeVersion',
        'shared_secret': :'sharedSecret',
        'bgp_session_config': :'bgpSessionConfig',
        'oracle_initiation': :'oracleInitiation',
        'nat_translation_enabled': :'natTranslationEnabled',
        'phase_one_config': :'phaseOneConfig',
        'phase_two_config': :'phaseTwoConfig',
        'dpd_config': :'dpdConfig',
        'encryption_domain_config': :'encryptionDomainConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'routing': :'String',
        'ike_version': :'String',
        'shared_secret': :'String',
        'bgp_session_config': :'OCI::Core::Models::CreateIPSecTunnelBgpSessionDetails',
        'oracle_initiation': :'String',
        'nat_translation_enabled': :'String',
        'phase_one_config': :'OCI::Core::Models::PhaseOneConfigDetails',
        'phase_two_config': :'OCI::Core::Models::PhaseTwoConfigDetails',
        'dpd_config': :'OCI::Core::Models::DpdConfig',
        'encryption_domain_config': :'OCI::Core::Models::CreateIPSecTunnelEncryptionDomainDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :routing The value to assign to the {#routing} property
    # @option attributes [String] :ike_version The value to assign to the {#ike_version} property
    # @option attributes [String] :shared_secret The value to assign to the {#shared_secret} property
    # @option attributes [OCI::Core::Models::CreateIPSecTunnelBgpSessionDetails] :bgp_session_config The value to assign to the {#bgp_session_config} property
    # @option attributes [String] :oracle_initiation The value to assign to the {#oracle_initiation} property
    # @option attributes [String] :nat_translation_enabled The value to assign to the {#nat_translation_enabled} property
    # @option attributes [OCI::Core::Models::PhaseOneConfigDetails] :phase_one_config The value to assign to the {#phase_one_config} property
    # @option attributes [OCI::Core::Models::PhaseTwoConfigDetails] :phase_two_config The value to assign to the {#phase_two_config} property
    # @option attributes [OCI::Core::Models::DpdConfig] :dpd_config The value to assign to the {#dpd_config} property
    # @option attributes [OCI::Core::Models::CreateIPSecTunnelEncryptionDomainDetails] :encryption_domain_config The value to assign to the {#encryption_domain_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.routing = attributes[:'routing'] if attributes[:'routing']

      self.ike_version = attributes[:'ikeVersion'] if attributes[:'ikeVersion']

      raise 'You cannot provide both :ikeVersion and :ike_version' if attributes.key?(:'ikeVersion') && attributes.key?(:'ike_version')

      self.ike_version = attributes[:'ike_version'] if attributes[:'ike_version']

      self.shared_secret = attributes[:'sharedSecret'] if attributes[:'sharedSecret']

      raise 'You cannot provide both :sharedSecret and :shared_secret' if attributes.key?(:'sharedSecret') && attributes.key?(:'shared_secret')

      self.shared_secret = attributes[:'shared_secret'] if attributes[:'shared_secret']

      self.bgp_session_config = attributes[:'bgpSessionConfig'] if attributes[:'bgpSessionConfig']

      raise 'You cannot provide both :bgpSessionConfig and :bgp_session_config' if attributes.key?(:'bgpSessionConfig') && attributes.key?(:'bgp_session_config')

      self.bgp_session_config = attributes[:'bgp_session_config'] if attributes[:'bgp_session_config']

      self.oracle_initiation = attributes[:'oracleInitiation'] if attributes[:'oracleInitiation']

      raise 'You cannot provide both :oracleInitiation and :oracle_initiation' if attributes.key?(:'oracleInitiation') && attributes.key?(:'oracle_initiation')

      self.oracle_initiation = attributes[:'oracle_initiation'] if attributes[:'oracle_initiation']

      self.nat_translation_enabled = attributes[:'natTranslationEnabled'] if attributes[:'natTranslationEnabled']

      raise 'You cannot provide both :natTranslationEnabled and :nat_translation_enabled' if attributes.key?(:'natTranslationEnabled') && attributes.key?(:'nat_translation_enabled')

      self.nat_translation_enabled = attributes[:'nat_translation_enabled'] if attributes[:'nat_translation_enabled']

      self.phase_one_config = attributes[:'phaseOneConfig'] if attributes[:'phaseOneConfig']

      raise 'You cannot provide both :phaseOneConfig and :phase_one_config' if attributes.key?(:'phaseOneConfig') && attributes.key?(:'phase_one_config')

      self.phase_one_config = attributes[:'phase_one_config'] if attributes[:'phase_one_config']

      self.phase_two_config = attributes[:'phaseTwoConfig'] if attributes[:'phaseTwoConfig']

      raise 'You cannot provide both :phaseTwoConfig and :phase_two_config' if attributes.key?(:'phaseTwoConfig') && attributes.key?(:'phase_two_config')

      self.phase_two_config = attributes[:'phase_two_config'] if attributes[:'phase_two_config']

      self.dpd_config = attributes[:'dpdConfig'] if attributes[:'dpdConfig']

      raise 'You cannot provide both :dpdConfig and :dpd_config' if attributes.key?(:'dpdConfig') && attributes.key?(:'dpd_config')

      self.dpd_config = attributes[:'dpd_config'] if attributes[:'dpd_config']

      self.encryption_domain_config = attributes[:'encryptionDomainConfig'] if attributes[:'encryptionDomainConfig']

      raise 'You cannot provide both :encryptionDomainConfig and :encryption_domain_config' if attributes.key?(:'encryptionDomainConfig') && attributes.key?(:'encryption_domain_config')

      self.encryption_domain_config = attributes[:'encryption_domain_config'] if attributes[:'encryption_domain_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] routing Object to be assigned
    def routing=(routing)
      raise "Invalid value for 'routing': this must be one of the values in ROUTING_ENUM." if routing && !ROUTING_ENUM.include?(routing)

      @routing = routing
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ike_version Object to be assigned
    def ike_version=(ike_version)
      raise "Invalid value for 'ike_version': this must be one of the values in IKE_VERSION_ENUM." if ike_version && !IKE_VERSION_ENUM.include?(ike_version)

      @ike_version = ike_version
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] oracle_initiation Object to be assigned
    def oracle_initiation=(oracle_initiation)
      raise "Invalid value for 'oracle_initiation': this must be one of the values in ORACLE_INITIATION_ENUM." if oracle_initiation && !ORACLE_INITIATION_ENUM.include?(oracle_initiation)

      @oracle_initiation = oracle_initiation
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] nat_translation_enabled Object to be assigned
    def nat_translation_enabled=(nat_translation_enabled)
      raise "Invalid value for 'nat_translation_enabled': this must be one of the values in NAT_TRANSLATION_ENABLED_ENUM." if nat_translation_enabled && !NAT_TRANSLATION_ENABLED_ENUM.include?(nat_translation_enabled)

      @nat_translation_enabled = nat_translation_enabled
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        routing == other.routing &&
        ike_version == other.ike_version &&
        shared_secret == other.shared_secret &&
        bgp_session_config == other.bgp_session_config &&
        oracle_initiation == other.oracle_initiation &&
        nat_translation_enabled == other.nat_translation_enabled &&
        phase_one_config == other.phase_one_config &&
        phase_two_config == other.phase_two_config &&
        dpd_config == other.dpd_config &&
        encryption_domain_config == other.encryption_domain_config
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
      [display_name, routing, ike_version, shared_secret, bgp_session_config, oracle_initiation, nat_translation_enabled, phase_one_config, phase_two_config, dpd_config, encryption_domain_config].hash
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
