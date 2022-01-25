# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a network load balancer. For more information, see
  # [Managing a network load balancer](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingloadbalancer.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # contact an administrator. If you are an administrator who writes policies to give users access, then see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.cloud.oracle.com/Content/API/Concepts/sdks.htm).
  #
  class NetworkLoadBalancer::Models::NetworkLoadBalancer
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NLB_IP_VERSION_ENUM = [
      NLB_IP_VERSION_IPV4 = 'IPV4'.freeze,
      NLB_IP_VERSION_IPV4_AND_IPV6 = 'IPV4_AND_IPV6'.freeze,
      NLB_IP_VERSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancer.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A user-friendly name, which does not have to be unique, and can be changed.
    #
    # Example: `example_load_balancer`
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The current state of the network load balancer.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail.
    # For example, can be used to provide actionable information for a resource in Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # IP version associated with the NLB.
    # @return [String]
    attr_reader :nlb_ip_version

    # **[Required]** The date and time the network load balancer was created, in the format defined by RFC3339.
    #
    # Example: `2020-05-01T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the network load balancer was updated. An RFC3339 formatted date-time string.
    #
    # Example: `2020-05-01T22:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** An array of IP addresses.
    #
    # @return [Array<OCI::NetworkLoadBalancer::Models::IpAddress>]
    attr_accessor :ip_addresses

    # Whether the network load balancer has a virtual cloud network-local (private) IP address.
    #
    # If \"true\", then the service assigns a private IP address to the network load balancer.
    #
    # If \"false\", then the service assigns a public IP address to the network load balancer.
    #
    # A public network load balancer is accessible from the internet, depending the
    # [security list rules](https://docs.cloud.oracle.com/Content/network/Concepts/securitylists.htm) for your virtual cloudn network. For more information about public and
    # private network load balancers,
    # see [How Network Load Balancing Works](https://docs.cloud.oracle.com/Content/Balance/Concepts/balanceoverview.htm#how-network-load-balancing-works).
    # This value is true by default.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_private

    # When enabled, the skipSourceDestinationCheck parameter is automatically enabled on the load balancer VNIC.
    # Packets are sent to the backend set without any changes to the source and destination IP.
    #
    # @return [BOOLEAN]
    attr_accessor :is_preserve_source_destination

    # **[Required]** The subnet in which the network load balancer is spawned [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).\"
    # @return [String]
    attr_accessor :subnet_id

    # An array of network security groups [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) associated with the network load
    # balancer.
    #
    # During the creation of the network load balancer, the service adds the new load balancer to the specified network security groups.
    #
    # The benefits of associating the network load balancer with network security groups include:
    #
    # *  Network security groups define network security rules to govern ingress and egress traffic for the network load balancer.
    #
    # *  The network security rules of other resources can reference the network security groups associated with the network load balancer
    #    to ensure access.
    #
    # Example: [\"ocid1.nsg.oc1.phx.unique_ID\"]
    #
    # @return [Array<String>]
    attr_accessor :network_security_group_ids

    # Listeners associated with the network load balancer.
    # @return [Hash<String, OCI::NetworkLoadBalancer::Models::Listener>]
    attr_accessor :listeners

    # Backend sets associated with the network load balancer.
    # @return [Hash<String, OCI::NetworkLoadBalancer::Models::BackendSet>]
    attr_accessor :backend_sets

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Key-value pair representing system tags' keys and values scoped to a namespace.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'nlb_ip_version': :'nlbIpVersion',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'ip_addresses': :'ipAddresses',
        'is_private': :'isPrivate',
        'is_preserve_source_destination': :'isPreserveSourceDestination',
        'subnet_id': :'subnetId',
        'network_security_group_ids': :'networkSecurityGroupIds',
        'listeners': :'listeners',
        'backend_sets': :'backendSets',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'nlb_ip_version': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'ip_addresses': :'Array<OCI::NetworkLoadBalancer::Models::IpAddress>',
        'is_private': :'BOOLEAN',
        'is_preserve_source_destination': :'BOOLEAN',
        'subnet_id': :'String',
        'network_security_group_ids': :'Array<String>',
        'listeners': :'Hash<String, OCI::NetworkLoadBalancer::Models::Listener>',
        'backend_sets': :'Hash<String, OCI::NetworkLoadBalancer::Models::BackendSet>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :nlb_ip_version The value to assign to the {#nlb_ip_version} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Array<OCI::NetworkLoadBalancer::Models::IpAddress>] :ip_addresses The value to assign to the {#ip_addresses} property
    # @option attributes [BOOLEAN] :is_private The value to assign to the {#is_private} property
    # @option attributes [BOOLEAN] :is_preserve_source_destination The value to assign to the {#is_preserve_source_destination} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :network_security_group_ids The value to assign to the {#network_security_group_ids} property
    # @option attributes [Hash<String, OCI::NetworkLoadBalancer::Models::Listener>] :listeners The value to assign to the {#listeners} property
    # @option attributes [Hash<String, OCI::NetworkLoadBalancer::Models::BackendSet>] :backend_sets The value to assign to the {#backend_sets} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.nlb_ip_version = attributes[:'nlbIpVersion'] if attributes[:'nlbIpVersion']
      self.nlb_ip_version = "IPV4" if nlb_ip_version.nil? && !attributes.key?(:'nlbIpVersion') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :nlbIpVersion and :nlb_ip_version' if attributes.key?(:'nlbIpVersion') && attributes.key?(:'nlb_ip_version')

      self.nlb_ip_version = attributes[:'nlb_ip_version'] if attributes[:'nlb_ip_version']
      self.nlb_ip_version = "IPV4" if nlb_ip_version.nil? && !attributes.key?(:'nlbIpVersion') && !attributes.key?(:'nlb_ip_version') # rubocop:disable Style/StringLiterals

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.ip_addresses = attributes[:'ipAddresses'] if attributes[:'ipAddresses']

      raise 'You cannot provide both :ipAddresses and :ip_addresses' if attributes.key?(:'ipAddresses') && attributes.key?(:'ip_addresses')

      self.ip_addresses = attributes[:'ip_addresses'] if attributes[:'ip_addresses']

      self.is_private = attributes[:'isPrivate'] unless attributes[:'isPrivate'].nil?
      self.is_private = true if is_private.nil? && !attributes.key?(:'isPrivate') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPrivate and :is_private' if attributes.key?(:'isPrivate') && attributes.key?(:'is_private')

      self.is_private = attributes[:'is_private'] unless attributes[:'is_private'].nil?
      self.is_private = true if is_private.nil? && !attributes.key?(:'isPrivate') && !attributes.key?(:'is_private') # rubocop:disable Style/StringLiterals

      self.is_preserve_source_destination = attributes[:'isPreserveSourceDestination'] unless attributes[:'isPreserveSourceDestination'].nil?
      self.is_preserve_source_destination = false if is_preserve_source_destination.nil? && !attributes.key?(:'isPreserveSourceDestination') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPreserveSourceDestination and :is_preserve_source_destination' if attributes.key?(:'isPreserveSourceDestination') && attributes.key?(:'is_preserve_source_destination')

      self.is_preserve_source_destination = attributes[:'is_preserve_source_destination'] unless attributes[:'is_preserve_source_destination'].nil?
      self.is_preserve_source_destination = false if is_preserve_source_destination.nil? && !attributes.key?(:'isPreserveSourceDestination') && !attributes.key?(:'is_preserve_source_destination') # rubocop:disable Style/StringLiterals

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.network_security_group_ids = attributes[:'networkSecurityGroupIds'] if attributes[:'networkSecurityGroupIds']

      raise 'You cannot provide both :networkSecurityGroupIds and :network_security_group_ids' if attributes.key?(:'networkSecurityGroupIds') && attributes.key?(:'network_security_group_ids')

      self.network_security_group_ids = attributes[:'network_security_group_ids'] if attributes[:'network_security_group_ids']

      self.listeners = attributes[:'listeners'] if attributes[:'listeners']

      self.backend_sets = attributes[:'backendSets'] if attributes[:'backendSets']

      raise 'You cannot provide both :backendSets and :backend_sets' if attributes.key?(:'backendSets') && attributes.key?(:'backend_sets')

      self.backend_sets = attributes[:'backend_sets'] if attributes[:'backend_sets']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
    # @param [Object] nlb_ip_version Object to be assigned
    def nlb_ip_version=(nlb_ip_version)
      # rubocop:disable Style/ConditionalAssignment
      if nlb_ip_version && !NLB_IP_VERSION_ENUM.include?(nlb_ip_version)
        OCI.logger.debug("Unknown value for 'nlb_ip_version' [" + nlb_ip_version + "]. Mapping to 'NLB_IP_VERSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @nlb_ip_version = NLB_IP_VERSION_UNKNOWN_ENUM_VALUE
      else
        @nlb_ip_version = nlb_ip_version
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        nlb_ip_version == other.nlb_ip_version &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        ip_addresses == other.ip_addresses &&
        is_private == other.is_private &&
        is_preserve_source_destination == other.is_preserve_source_destination &&
        subnet_id == other.subnet_id &&
        network_security_group_ids == other.network_security_group_ids &&
        listeners == other.listeners &&
        backend_sets == other.backend_sets &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, compartment_id, display_name, lifecycle_state, lifecycle_details, nlb_ip_version, time_created, time_updated, ip_addresses, is_private, is_preserve_source_destination, subnet_id, network_security_group_ids, listeners, backend_sets, freeform_tags, defined_tags, system_tags].hash
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
