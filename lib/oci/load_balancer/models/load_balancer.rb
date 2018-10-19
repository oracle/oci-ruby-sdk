# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The properties that define a load balancer. For more information, see
  # [Managing a Load Balancer](https://docs.us-phoenix-1.oraclecloud.com/Content/Balance/Tasks/managingloadbalancer.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/sdks.htm).
  #
  class LoadBalancer::Models::LoadBalancer # rubocop:disable Metrics/LineLength
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [Hash<String, OCI::LoadBalancer::Models::BackendSet>]
    attr_accessor :backend_sets

    # @return [Hash<String, OCI::LoadBalancer::Models::Certificate>]
    attr_accessor :certificates

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the compartment containing the load balancer.
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** A user-friendly name. It does not have to be unique, and it is changeable.
    #
    # Example: `example_load_balancer`
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # @return [Hash<String, OCI::LoadBalancer::Models::Hostname>]
    attr_accessor :hostnames

    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the load balancer.
    # @return [String]
    attr_accessor :id

    # An array of IP addresses.
    #
    # @return [Array<OCI::LoadBalancer::Models::IpAddress>]
    attr_accessor :ip_addresses

    # Whether the load balancer has a VCN-local (private) IP address.
    #
    # If \"true\", the service assigns a private IP address to the load balancer. The load balancer requires only one subnet
    # to host both the primary and secondary load balancers. The private IP address is local to the subnet. The load balancer
    # is accessible only from within the VCN that contains the associated subnet, or as further restricted by your security
    # list rules. The load balancer can route traffic to any backend server that is reachable from the VCN.
    #
    # For a private load balancer, both the primary and secondary load balancer hosts are within the same Availability Domain.
    #
    # If \"false\", the service assigns a public IP address to the load balancer. A load balancer with a public IP address
    # requires two subnets, each in a different Availability Domain. One subnet hosts the primary load balancer and the other
    # hosts the secondary (standby) load balancer. A public load balancer is accessible from the internet, depending on your
    # VCN's [security list rules](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/securitylists.htm).
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_private

    # **[Required]** The current state of the load balancer.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # @return [Hash<String, OCI::LoadBalancer::Models::Listener>]
    attr_accessor :listeners

    # @return [Hash<String, OCI::LoadBalancer::Models::PathRouteSet>]
    attr_accessor :path_route_sets

    # **[Required]** A template that determines the total pre-provisioned bandwidth (ingress plus egress).
    # To get a list of available shapes, use the {#list_shapes list_shapes}
    # operation.
    #
    # Example: `100Mbps`
    #
    # @return [String]
    attr_accessor :shape_name

    # An array of subnet [OCIDs](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @return [Array<String>]
    attr_accessor :subnet_ids

    # **[Required]** The date and time the load balancer was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'backend_sets': :'backendSets',
        'certificates': :'certificates',
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'hostnames': :'hostnames',
        'id': :'id',
        'ip_addresses': :'ipAddresses',
        'is_private': :'isPrivate',
        'lifecycle_state': :'lifecycleState',
        'listeners': :'listeners',
        'path_route_sets': :'pathRouteSets',
        'shape_name': :'shapeName',
        'subnet_ids': :'subnetIds',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'backend_sets': :'Hash<String, OCI::LoadBalancer::Models::BackendSet>',
        'certificates': :'Hash<String, OCI::LoadBalancer::Models::Certificate>',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostnames': :'Hash<String, OCI::LoadBalancer::Models::Hostname>',
        'id': :'String',
        'ip_addresses': :'Array<OCI::LoadBalancer::Models::IpAddress>',
        'is_private': :'BOOLEAN',
        'lifecycle_state': :'String',
        'listeners': :'Hash<String, OCI::LoadBalancer::Models::Listener>',
        'path_route_sets': :'Hash<String, OCI::LoadBalancer::Models::PathRouteSet>',
        'shape_name': :'String',
        'subnet_ids': :'Array<String>',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::BackendSet>] :backend_sets The value to assign to the {#backend_sets} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::Certificate>] :certificates The value to assign to the {#certificates} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::Hostname>] :hostnames The value to assign to the {#hostnames} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [Array<OCI::LoadBalancer::Models::IpAddress>] :ip_addresses The value to assign to the {#ip_addresses} property
    # @option attributes [BOOLEAN] :is_private The value to assign to the {#is_private} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::Listener>] :listeners The value to assign to the {#listeners} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::PathRouteSet>] :path_route_sets The value to assign to the {#path_route_sets} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [Array<String>] :subnet_ids The value to assign to the {#subnet_ids} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.backend_sets = attributes[:'backendSets'] if attributes[:'backendSets']

      raise 'You cannot provide both :backendSets and :backend_sets' if attributes.key?(:'backendSets') && attributes.key?(:'backend_sets')

      self.backend_sets = attributes[:'backend_sets'] if attributes[:'backend_sets']

      self.certificates = attributes[:'certificates'] if attributes[:'certificates']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.hostnames = attributes[:'hostnames'] if attributes[:'hostnames']

      self.id = attributes[:'id'] if attributes[:'id']

      self.ip_addresses = attributes[:'ipAddresses'] if attributes[:'ipAddresses']

      raise 'You cannot provide both :ipAddresses and :ip_addresses' if attributes.key?(:'ipAddresses') && attributes.key?(:'ip_addresses')

      self.ip_addresses = attributes[:'ip_addresses'] if attributes[:'ip_addresses']

      self.is_private = attributes[:'isPrivate'] unless attributes[:'isPrivate'].nil?

      raise 'You cannot provide both :isPrivate and :is_private' if attributes.key?(:'isPrivate') && attributes.key?(:'is_private')

      self.is_private = attributes[:'is_private'] unless attributes[:'is_private'].nil?

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.listeners = attributes[:'listeners'] if attributes[:'listeners']

      self.path_route_sets = attributes[:'pathRouteSets'] if attributes[:'pathRouteSets']

      raise 'You cannot provide both :pathRouteSets and :path_route_sets' if attributes.key?(:'pathRouteSets') && attributes.key?(:'path_route_sets')

      self.path_route_sets = attributes[:'path_route_sets'] if attributes[:'path_route_sets']

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.subnet_ids = attributes[:'subnetIds'] if attributes[:'subnetIds']

      raise 'You cannot provide both :subnetIds and :subnet_ids' if attributes.key?(:'subnetIds') && attributes.key?(:'subnet_ids')

      self.subnet_ids = attributes[:'subnet_ids'] if attributes[:'subnet_ids']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        backend_sets == other.backend_sets &&
        certificates == other.certificates &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        hostnames == other.hostnames &&
        id == other.id &&
        ip_addresses == other.ip_addresses &&
        is_private == other.is_private &&
        lifecycle_state == other.lifecycle_state &&
        listeners == other.listeners &&
        path_route_sets == other.path_route_sets &&
        shape_name == other.shape_name &&
        subnet_ids == other.subnet_ids &&
        time_created == other.time_created
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
      [backend_sets, certificates, compartment_id, defined_tags, display_name, freeform_tags, hostnames, id, ip_addresses, is_private, lifecycle_state, listeners, path_route_sets, shape_name, subnet_ids, time_created].hash
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
