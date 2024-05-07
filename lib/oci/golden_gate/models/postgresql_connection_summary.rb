# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'
require_relative 'connection_summary'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the PostgreSQL Database Connection.
  #
  class GoldenGate::Models::PostgresqlConnectionSummary < GoldenGate::Models::ConnectionSummary
    # **[Required]** The PostgreSQL technology type.
    # @return [String]
    attr_accessor :technology_type

    # **[Required]** The name of the database.
    #
    # @return [String]
    attr_accessor :database_name

    # **[Required]** The name or address of a host.
    #
    # @return [String]
    attr_accessor :host

    # **[Required]** The port of an endpoint usually specified for a connection.
    #
    # @return [Integer]
    attr_accessor :port

    # **[Required]** The username Oracle GoldenGate uses to connect the associated system of the given technology.
    # This username must already exist and be available by the system/application to be connected to
    # and must conform to the case sensitivty requirments defined in it.
    #
    # @return [String]
    attr_accessor :username

    # An array of name-value pair attribute entries.
    # Used as additional parameters in connection string.
    #
    # @return [Array<OCI::GoldenGate::Models::NameValuePair>]
    attr_accessor :additional_attributes

    # **[Required]** Security protocol for PostgreSQL.
    # @return [String]
    attr_accessor :security_protocol

    # SSL modes for PostgreSQL.
    # @return [String]
    attr_accessor :ssl_mode

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
        'database_name': :'databaseName',
        'host': :'host',
        'port': :'port',
        'username': :'username',
        'additional_attributes': :'additionalAttributes',
        'security_protocol': :'securityProtocol',
        'ssl_mode': :'sslMode',
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
        'database_name': :'String',
        'host': :'String',
        'port': :'Integer',
        'username': :'String',
        'additional_attributes': :'Array<OCI::GoldenGate::Models::NameValuePair>',
        'security_protocol': :'String',
        'ssl_mode': :'String',
        'private_ip': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#display_name #display_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#description #description} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#compartment_id #compartment_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#system_tags #system_tags} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#lifecycle_details #lifecycle_details} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#time_updated #time_updated} proprety
    # @option attributes [String] :vault_id The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#vault_id #vault_id} proprety
    # @option attributes [String] :key_id The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#key_id #key_id} proprety
    # @option attributes [Array<OCI::GoldenGate::Models::IngressIpDetails>] :ingress_ips The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#ingress_ips #ingress_ips} proprety
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#nsg_ids #nsg_ids} proprety
    # @option attributes [String] :subnet_id The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#subnet_id #subnet_id} proprety
    # @option attributes [String] :routing_method The value to assign to the {OCI::GoldenGate::Models::ConnectionSummary#routing_method #routing_method} proprety
    # @option attributes [String] :technology_type The value to assign to the {#technology_type} property
    # @option attributes [String] :database_name The value to assign to the {#database_name} property
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [String] :username The value to assign to the {#username} property
    # @option attributes [Array<OCI::GoldenGate::Models::NameValuePair>] :additional_attributes The value to assign to the {#additional_attributes} property
    # @option attributes [String] :security_protocol The value to assign to the {#security_protocol} property
    # @option attributes [String] :ssl_mode The value to assign to the {#ssl_mode} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['connectionType'] = 'POSTGRESQL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.technology_type = attributes[:'technologyType'] if attributes[:'technologyType']

      raise 'You cannot provide both :technologyType and :technology_type' if attributes.key?(:'technologyType') && attributes.key?(:'technology_type')

      self.technology_type = attributes[:'technology_type'] if attributes[:'technology_type']

      self.database_name = attributes[:'databaseName'] if attributes[:'databaseName']

      raise 'You cannot provide both :databaseName and :database_name' if attributes.key?(:'databaseName') && attributes.key?(:'database_name')

      self.database_name = attributes[:'database_name'] if attributes[:'database_name']

      self.host = attributes[:'host'] if attributes[:'host']

      self.port = attributes[:'port'] if attributes[:'port']

      self.username = attributes[:'username'] if attributes[:'username']

      self.additional_attributes = attributes[:'additionalAttributes'] if attributes[:'additionalAttributes']

      raise 'You cannot provide both :additionalAttributes and :additional_attributes' if attributes.key?(:'additionalAttributes') && attributes.key?(:'additional_attributes')

      self.additional_attributes = attributes[:'additional_attributes'] if attributes[:'additional_attributes']

      self.security_protocol = attributes[:'securityProtocol'] if attributes[:'securityProtocol']

      raise 'You cannot provide both :securityProtocol and :security_protocol' if attributes.key?(:'securityProtocol') && attributes.key?(:'security_protocol')

      self.security_protocol = attributes[:'security_protocol'] if attributes[:'security_protocol']

      self.ssl_mode = attributes[:'sslMode'] if attributes[:'sslMode']

      raise 'You cannot provide both :sslMode and :ssl_mode' if attributes.key?(:'sslMode') && attributes.key?(:'ssl_mode')

      self.ssl_mode = attributes[:'ssl_mode'] if attributes[:'ssl_mode']

      self.private_ip = attributes[:'privateIp'] if attributes[:'privateIp']

      raise 'You cannot provide both :privateIp and :private_ip' if attributes.key?(:'privateIp') && attributes.key?(:'private_ip')

      self.private_ip = attributes[:'private_ip'] if attributes[:'private_ip']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        database_name == other.database_name &&
        host == other.host &&
        port == other.port &&
        username == other.username &&
        additional_attributes == other.additional_attributes &&
        security_protocol == other.security_protocol &&
        ssl_mode == other.ssl_mode &&
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
      [connection_type, id, display_name, description, compartment_id, freeform_tags, defined_tags, system_tags, lifecycle_state, lifecycle_details, time_created, time_updated, vault_id, key_id, ingress_ips, nsg_ids, subnet_id, routing_method, technology_type, database_name, host, port, username, additional_attributes, security_protocol, ssl_mode, private_ip].hash
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
