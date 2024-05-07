# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'
require 'logger'
require_relative 'connection'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Represents the metadata of a Java Message Service Connection.
  #
  class GoldenGate::Models::JavaMessageServiceConnection < GoldenGate::Models::Connection
    TECHNOLOGY_TYPE_ENUM = [
      TECHNOLOGY_TYPE_ORACLE_WEBLOGIC_JMS = 'ORACLE_WEBLOGIC_JMS'.freeze,
      TECHNOLOGY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SECURITY_PROTOCOL_ENUM = [
      SECURITY_PROTOCOL_PLAIN = 'PLAIN'.freeze,
      SECURITY_PROTOCOL_TLS = 'TLS'.freeze,
      SECURITY_PROTOCOL_MTLS = 'MTLS'.freeze,
      SECURITY_PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AUTHENTICATION_TYPE_ENUM = [
      AUTHENTICATION_TYPE_NONE = 'NONE'.freeze,
      AUTHENTICATION_TYPE_BASIC = 'BASIC'.freeze,
      AUTHENTICATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The Java Message Service technology type.
    #
    # @return [String]
    attr_reader :technology_type

    # **[Required]** If set to true, Java Naming and Directory Interface (JNDI) properties should be provided.
    #
    # @return [BOOLEAN]
    attr_accessor :should_use_jndi

    # The Connection Factory can be looked up using this name.
    # e.g.: 'ConnectionFactory'
    #
    # @return [String]
    attr_accessor :jndi_connection_factory

    # The URL that Java Message Service will use to contact the JNDI provider.
    # e.g.: 'tcp://myjms.host.domain:61616?jms.prefetchPolicy.all=1000'
    #
    # @return [String]
    attr_accessor :jndi_provider_url

    # The implementation of javax.naming.spi.InitialContextFactory interface
    # that the client uses to obtain initial naming context.
    # e.g.: 'org.apache.activemq.jndi.ActiveMQInitialContextFactory'
    #
    # @return [String]
    attr_accessor :jndi_initial_context_factory

    # Specifies the identity of the principal (user) to be authenticated.
    # e.g.: 'admin2'
    #
    # @return [String]
    attr_accessor :jndi_security_principal

    # Connectin URL of the Java Message Service, specifying the protocol, host, and port.
    # e.g.: 'mq://myjms.host.domain:7676'
    #
    # @return [String]
    attr_accessor :connection_url

    # The of Java class implementing javax.jms.ConnectionFactory interface
    # supplied by the Java Message Service provider.
    # e.g.: 'com.stc.jmsjca.core.JConnectionFactoryXA'
    #
    # @return [String]
    attr_accessor :connection_factory

    # Security protocol for Java Message Service. If not provided, default is PLAIN.
    # Optional until 2024-06-27, in the release after it will be made required.
    #
    # @return [String]
    attr_reader :security_protocol

    # Authentication type for Java Message Service.  If not provided, default is NONE.
    # Optional until 2024-06-27, in the release after it will be made required.
    #
    # @return [String]
    attr_reader :authentication_type

    # The username Oracle GoldenGate uses to connect to the Java Message Service.
    # This username must already exist and be available by the Java Message Service to be connected to.
    #
    # @return [String]
    attr_accessor :username

    # Deprecated: this field will be removed in future versions. Either specify the private IP in the connectionString or host
    # field, or make sure the host name is resolvable in the target VCN.
    #
    # The private IP address of the connection's endpoint in the customer's VCN, typically a
    # database endpoint or a big data endpoint (e.g. Kafka bootstrap server).
    # In case the privateIp is provided, the subnetId must also be provided.
    # In case the privateIp (and the subnetId) is not provided it is assumed the datasource is publicly accessible.
    # In case the connection is accessible only privately, the lack of privateIp will result in not being able to access the connection.
    #
    # @return [String]
    attr_accessor :private_ip

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_type': :'connectionType',
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'vault_id': :'vaultId',
        'key_id': :'keyId',
        'ingress_ips': :'ingressIps',
        'nsg_ids': :'nsgIds',
        'subnet_id': :'subnetId',
        'routing_method': :'routingMethod',
        'technology_type': :'technologyType',
        'should_use_jndi': :'shouldUseJndi',
        'jndi_connection_factory': :'jndiConnectionFactory',
        'jndi_provider_url': :'jndiProviderUrl',
        'jndi_initial_context_factory': :'jndiInitialContextFactory',
        'jndi_security_principal': :'jndiSecurityPrincipal',
        'connection_url': :'connectionUrl',
        'connection_factory': :'connectionFactory',
        'security_protocol': :'securityProtocol',
        'authentication_type': :'authenticationType',
        'username': :'username',
        'private_ip': :'privateIp'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_type': :'String',
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'vault_id': :'String',
        'key_id': :'String',
        'ingress_ips': :'Array<OCI::GoldenGate::Models::IngressIpDetails>',
        'nsg_ids': :'Array<String>',
        'subnet_id': :'String',
        'routing_method': :'String',
        'technology_type': :'String',
        'should_use_jndi': :'BOOLEAN',
        'jndi_connection_factory': :'String',
        'jndi_provider_url': :'String',
        'jndi_initial_context_factory': :'String',
        'jndi_security_principal': :'String',
        'connection_url': :'String',
        'connection_factory': :'String',
        'security_protocol': :'String',
        'authentication_type': :'String',
        'username': :'String',
        'private_ip': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::GoldenGate::Models::Connection#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::GoldenGate::Models::Connection#display_name #display_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::GoldenGate::Models::Connection#description #description} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::GoldenGate::Models::Connection#compartment_id #compartment_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::GoldenGate::Models::Connection#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::GoldenGate::Models::Connection#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::GoldenGate::Models::Connection#system_tags #system_tags} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::GoldenGate::Models::Connection#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::GoldenGate::Models::Connection#lifecycle_details #lifecycle_details} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::GoldenGate::Models::Connection#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::GoldenGate::Models::Connection#time_updated #time_updated} proprety
    # @option attributes [String] :vault_id The value to assign to the {OCI::GoldenGate::Models::Connection#vault_id #vault_id} proprety
    # @option attributes [String] :key_id The value to assign to the {OCI::GoldenGate::Models::Connection#key_id #key_id} proprety
    # @option attributes [Array<OCI::GoldenGate::Models::IngressIpDetails>] :ingress_ips The value to assign to the {OCI::GoldenGate::Models::Connection#ingress_ips #ingress_ips} proprety
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {OCI::GoldenGate::Models::Connection#nsg_ids #nsg_ids} proprety
    # @option attributes [String] :subnet_id The value to assign to the {OCI::GoldenGate::Models::Connection#subnet_id #subnet_id} proprety
    # @option attributes [String] :routing_method The value to assign to the {OCI::GoldenGate::Models::Connection#routing_method #routing_method} proprety
    # @option attributes [String] :technology_type The value to assign to the {#technology_type} property
    # @option attributes [BOOLEAN] :should_use_jndi The value to assign to the {#should_use_jndi} property
    # @option attributes [String] :jndi_connection_factory The value to assign to the {#jndi_connection_factory} property
    # @option attributes [String] :jndi_provider_url The value to assign to the {#jndi_provider_url} property
    # @option attributes [String] :jndi_initial_context_factory The value to assign to the {#jndi_initial_context_factory} property
    # @option attributes [String] :jndi_security_principal The value to assign to the {#jndi_security_principal} property
    # @option attributes [String] :connection_url The value to assign to the {#connection_url} property
    # @option attributes [String] :connection_factory The value to assign to the {#connection_factory} property
    # @option attributes [String] :security_protocol The value to assign to the {#security_protocol} property
    # @option attributes [String] :authentication_type The value to assign to the {#authentication_type} property
    # @option attributes [String] :username The value to assign to the {#username} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['connectionType'] = 'JAVA_MESSAGE_SERVICE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.technology_type = attributes[:'technologyType'] if attributes[:'technologyType']

      raise 'You cannot provide both :technologyType and :technology_type' if attributes.key?(:'technologyType') && attributes.key?(:'technology_type')

      self.technology_type = attributes[:'technology_type'] if attributes[:'technology_type']

      self.should_use_jndi = attributes[:'shouldUseJndi'] unless attributes[:'shouldUseJndi'].nil?

      raise 'You cannot provide both :shouldUseJndi and :should_use_jndi' if attributes.key?(:'shouldUseJndi') && attributes.key?(:'should_use_jndi')

      self.should_use_jndi = attributes[:'should_use_jndi'] unless attributes[:'should_use_jndi'].nil?

      self.jndi_connection_factory = attributes[:'jndiConnectionFactory'] if attributes[:'jndiConnectionFactory']

      raise 'You cannot provide both :jndiConnectionFactory and :jndi_connection_factory' if attributes.key?(:'jndiConnectionFactory') && attributes.key?(:'jndi_connection_factory')

      self.jndi_connection_factory = attributes[:'jndi_connection_factory'] if attributes[:'jndi_connection_factory']

      self.jndi_provider_url = attributes[:'jndiProviderUrl'] if attributes[:'jndiProviderUrl']

      raise 'You cannot provide both :jndiProviderUrl and :jndi_provider_url' if attributes.key?(:'jndiProviderUrl') && attributes.key?(:'jndi_provider_url')

      self.jndi_provider_url = attributes[:'jndi_provider_url'] if attributes[:'jndi_provider_url']

      self.jndi_initial_context_factory = attributes[:'jndiInitialContextFactory'] if attributes[:'jndiInitialContextFactory']

      raise 'You cannot provide both :jndiInitialContextFactory and :jndi_initial_context_factory' if attributes.key?(:'jndiInitialContextFactory') && attributes.key?(:'jndi_initial_context_factory')

      self.jndi_initial_context_factory = attributes[:'jndi_initial_context_factory'] if attributes[:'jndi_initial_context_factory']

      self.jndi_security_principal = attributes[:'jndiSecurityPrincipal'] if attributes[:'jndiSecurityPrincipal']

      raise 'You cannot provide both :jndiSecurityPrincipal and :jndi_security_principal' if attributes.key?(:'jndiSecurityPrincipal') && attributes.key?(:'jndi_security_principal')

      self.jndi_security_principal = attributes[:'jndi_security_principal'] if attributes[:'jndi_security_principal']

      self.connection_url = attributes[:'connectionUrl'] if attributes[:'connectionUrl']

      raise 'You cannot provide both :connectionUrl and :connection_url' if attributes.key?(:'connectionUrl') && attributes.key?(:'connection_url')

      self.connection_url = attributes[:'connection_url'] if attributes[:'connection_url']

      self.connection_factory = attributes[:'connectionFactory'] if attributes[:'connectionFactory']

      raise 'You cannot provide both :connectionFactory and :connection_factory' if attributes.key?(:'connectionFactory') && attributes.key?(:'connection_factory')

      self.connection_factory = attributes[:'connection_factory'] if attributes[:'connection_factory']

      self.security_protocol = attributes[:'securityProtocol'] if attributes[:'securityProtocol']

      raise 'You cannot provide both :securityProtocol and :security_protocol' if attributes.key?(:'securityProtocol') && attributes.key?(:'security_protocol')

      self.security_protocol = attributes[:'security_protocol'] if attributes[:'security_protocol']

      self.authentication_type = attributes[:'authenticationType'] if attributes[:'authenticationType']

      raise 'You cannot provide both :authenticationType and :authentication_type' if attributes.key?(:'authenticationType') && attributes.key?(:'authentication_type')

      self.authentication_type = attributes[:'authentication_type'] if attributes[:'authentication_type']

      self.username = attributes[:'username'] if attributes[:'username']

      self.private_ip = attributes[:'privateIp'] if attributes[:'privateIp']

      raise 'You cannot provide both :privateIp and :private_ip' if attributes.key?(:'privateIp') && attributes.key?(:'private_ip')

      self.private_ip = attributes[:'private_ip'] if attributes[:'private_ip']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] technology_type Object to be assigned
    def technology_type=(technology_type)
      # rubocop:disable Style/ConditionalAssignment
      if technology_type && !TECHNOLOGY_TYPE_ENUM.include?(technology_type)
        OCI.logger.debug("Unknown value for 'technology_type' [" + technology_type + "]. Mapping to 'TECHNOLOGY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @technology_type = TECHNOLOGY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @technology_type = technology_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] security_protocol Object to be assigned
    def security_protocol=(security_protocol)
      # rubocop:disable Style/ConditionalAssignment
      if security_protocol && !SECURITY_PROTOCOL_ENUM.include?(security_protocol)
        OCI.logger.debug("Unknown value for 'security_protocol' [" + security_protocol + "]. Mapping to 'SECURITY_PROTOCOL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @security_protocol = SECURITY_PROTOCOL_UNKNOWN_ENUM_VALUE
      else
        @security_protocol = security_protocol
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] authentication_type Object to be assigned
    def authentication_type=(authentication_type)
      # rubocop:disable Style/ConditionalAssignment
      if authentication_type && !AUTHENTICATION_TYPE_ENUM.include?(authentication_type)
        OCI.logger.debug("Unknown value for 'authentication_type' [" + authentication_type + "]. Mapping to 'AUTHENTICATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @authentication_type = AUTHENTICATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @authentication_type = authentication_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        connection_type == other.connection_type &&
        id == other.id &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        vault_id == other.vault_id &&
        key_id == other.key_id &&
        ingress_ips == other.ingress_ips &&
        nsg_ids == other.nsg_ids &&
        subnet_id == other.subnet_id &&
        routing_method == other.routing_method &&
        technology_type == other.technology_type &&
        should_use_jndi == other.should_use_jndi &&
        jndi_connection_factory == other.jndi_connection_factory &&
        jndi_provider_url == other.jndi_provider_url &&
        jndi_initial_context_factory == other.jndi_initial_context_factory &&
        jndi_security_principal == other.jndi_security_principal &&
        connection_url == other.connection_url &&
        connection_factory == other.connection_factory &&
        security_protocol == other.security_protocol &&
        authentication_type == other.authentication_type &&
        username == other.username &&
        private_ip == other.private_ip
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
      [connection_type, id, display_name, description, compartment_id, freeform_tags, defined_tags, system_tags, lifecycle_state, lifecycle_details, time_created, time_updated, vault_id, key_id, ingress_ips, nsg_ids, subnet_id, routing_method, technology_type, should_use_jndi, jndi_connection_factory, jndi_provider_url, jndi_initial_context_factory, jndi_security_principal, connection_url, connection_factory, security_protocol, authentication_type, username, private_ip].hash
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
