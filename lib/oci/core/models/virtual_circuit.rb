# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # For use with Oracle Cloud Infrastructure FastConnect.
  #
  # A virtual circuit is an isolated network path that runs over one or more physical
  # network connections to provide a single, logical connection between the edge router
  # on the customer's existing network and Oracle Cloud Infrastructure. *Private*
  # virtual circuits support private peering, and *public* virtual circuits support
  # public peering. For more information, see [FastConnect Overview](https://docs.cloud.oracle.com/Content/Network/Concepts/fastconnect.htm).
  #
  # Each virtual circuit is made up of information shared between a customer, Oracle,
  # and a provider (if the customer is using FastConnect via a provider). Who fills in
  # a given property of a virtual circuit depends on whether the BGP session related to
  # that virtual circuit goes from the customer's edge router to Oracle, or from the provider's
  # edge router to Oracle. Also, in the case where the customer is using a provider, values
  # for some of the properties may not be present immediately, but may get filled in as the
  # provider and Oracle each do their part to provision the virtual circuit.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::VirtualCircuit
    BGP_MANAGEMENT_ENUM = [
      BGP_MANAGEMENT_CUSTOMER_MANAGED = 'CUSTOMER_MANAGED'.freeze,
      BGP_MANAGEMENT_PROVIDER_MANAGED = 'PROVIDER_MANAGED'.freeze,
      BGP_MANAGEMENT_ORACLE_MANAGED = 'ORACLE_MANAGED'.freeze,
      BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    BGP_SESSION_STATE_ENUM = [
      BGP_SESSION_STATE_UP = 'UP'.freeze,
      BGP_SESSION_STATE_DOWN = 'DOWN'.freeze,
      BGP_SESSION_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PENDING_PROVIDER = 'PENDING_PROVIDER'.freeze,
      LIFECYCLE_STATE_VERIFYING = 'VERIFYING'.freeze,
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_PROVISIONED = 'PROVISIONED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PROVIDER_STATE_ENUM = [
      PROVIDER_STATE_ACTIVE = 'ACTIVE'.freeze,
      PROVIDER_STATE_INACTIVE = 'INACTIVE'.freeze,
      PROVIDER_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SERVICE_TYPE_ENUM = [
      SERVICE_TYPE_COLOCATED = 'COLOCATED'.freeze,
      SERVICE_TYPE_LAYER2 = 'LAYER2'.freeze,
      SERVICE_TYPE_LAYER3 = 'LAYER3'.freeze,
      SERVICE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TYPE_ENUM = [
      TYPE_PUBLIC = 'PUBLIC'.freeze,
      TYPE_PRIVATE = 'PRIVATE'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The provisioned data rate of the connection.  To get a list of the
    # available bandwidth levels (that is, shapes), see
    # {#list_fast_connect_provider_virtual_circuit_bandwidth_shapes list_fast_connect_provider_virtual_circuit_bandwidth_shapes}.
    #
    # Example: `10 Gbps`
    #
    # @return [String]
    attr_accessor :bandwidth_shape_name

    # Deprecated. Instead use the information in
    # {FastConnectProviderService}.
    #
    # @return [String]
    attr_reader :bgp_management

    # The state of the BGP session associated with the virtual circuit.
    # @return [String]
    attr_reader :bgp_session_state

    # The OCID of the compartment containing the virtual circuit.
    # @return [String]
    attr_accessor :compartment_id

    # An array of mappings, each containing properties for a
    # cross-connect or cross-connect group that is associated with this
    # virtual circuit.
    #
    # @return [Array<OCI::Core::Models::CrossConnectMapping>]
    attr_accessor :cross_connect_mappings

    # The BGP ASN of the network at the other end of the BGP
    # session from Oracle. If the session is between the customer's
    # edge router and Oracle, the value is the customer's ASN. If the BGP
    # session is between the provider's edge router and Oracle, the value
    # is the provider's ASN.
    #
    # @return [Integer]
    attr_accessor :customer_bgp_asn

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The OCID of the customer's {Drg}
    # that this virtual circuit uses. Applicable only to private virtual circuits.
    #
    # @return [String]
    attr_accessor :gateway_id

    # The virtual circuit's Oracle ID (OCID).
    # @return [String]
    attr_accessor :id

    # The virtual circuit's current state. For information about
    # the different states, see
    # [FastConnect Overview](https://docs.cloud.oracle.com/Content/Network/Concepts/fastconnect.htm).
    #
    # @return [String]
    attr_reader :lifecycle_state

    # The Oracle BGP ASN.
    # @return [Integer]
    attr_accessor :oracle_bgp_asn

    # Deprecated. Instead use `providerServiceId`.
    #
    # @return [String]
    attr_accessor :provider_name

    # The OCID of the service offered by the provider (if the customer is connecting via a provider).
    #
    # @return [String]
    attr_accessor :provider_service_id

    # The service key name offered by the provider (if the customer is connecting via a provider).
    #
    # @return [String]
    attr_accessor :provider_service_key_name

    # Deprecated. Instead use `providerServiceId`.
    #
    # @return [String]
    attr_accessor :provider_service_name

    # The provider's state in relation to this virtual circuit (if the
    # customer is connecting via a provider). ACTIVE means
    # the provider has provisioned the virtual circuit from their end.
    # INACTIVE means the provider has not yet provisioned the virtual
    # circuit, or has de-provisioned it.
    #
    # @return [String]
    attr_reader :provider_state

    # For a public virtual circuit. The public IP prefixes (CIDRs) the customer wants to
    # advertise across the connection. Each prefix must be /31 or less specific.
    #
    # @return [Array<String>]
    attr_accessor :public_prefixes

    # Provider-supplied reference information about this virtual circuit
    # (if the customer is connecting via a provider).
    #
    # @return [String]
    attr_accessor :reference_comment

    # The Oracle Cloud Infrastructure region where this virtual
    # circuit is located.
    #
    # @return [String]
    attr_accessor :region

    # Provider service type.
    #
    # @return [String]
    attr_reader :service_type

    # The date and time the virtual circuit was created,
    # in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Whether the virtual circuit supports private or public peering. For more information,
    # see [FastConnect Overview](https://docs.cloud.oracle.com/Content/Network/Concepts/fastconnect.htm).
    #
    # @return [String]
    attr_reader :type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bandwidth_shape_name': :'bandwidthShapeName',
        'bgp_management': :'bgpManagement',
        'bgp_session_state': :'bgpSessionState',
        'compartment_id': :'compartmentId',
        'cross_connect_mappings': :'crossConnectMappings',
        'customer_bgp_asn': :'customerBgpAsn',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'gateway_id': :'gatewayId',
        'id': :'id',
        'lifecycle_state': :'lifecycleState',
        'oracle_bgp_asn': :'oracleBgpAsn',
        'provider_name': :'providerName',
        'provider_service_id': :'providerServiceId',
        'provider_service_key_name': :'providerServiceKeyName',
        'provider_service_name': :'providerServiceName',
        'provider_state': :'providerState',
        'public_prefixes': :'publicPrefixes',
        'reference_comment': :'referenceComment',
        'region': :'region',
        'service_type': :'serviceType',
        'time_created': :'timeCreated',
        'type': :'type'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bandwidth_shape_name': :'String',
        'bgp_management': :'String',
        'bgp_session_state': :'String',
        'compartment_id': :'String',
        'cross_connect_mappings': :'Array<OCI::Core::Models::CrossConnectMapping>',
        'customer_bgp_asn': :'Integer',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'gateway_id': :'String',
        'id': :'String',
        'lifecycle_state': :'String',
        'oracle_bgp_asn': :'Integer',
        'provider_name': :'String',
        'provider_service_id': :'String',
        'provider_service_key_name': :'String',
        'provider_service_name': :'String',
        'provider_state': :'String',
        'public_prefixes': :'Array<String>',
        'reference_comment': :'String',
        'region': :'String',
        'service_type': :'String',
        'time_created': :'DateTime',
        'type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bandwidth_shape_name The value to assign to the {#bandwidth_shape_name} property
    # @option attributes [String] :bgp_management The value to assign to the {#bgp_management} property
    # @option attributes [String] :bgp_session_state The value to assign to the {#bgp_session_state} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Array<OCI::Core::Models::CrossConnectMapping>] :cross_connect_mappings The value to assign to the {#cross_connect_mappings} property
    # @option attributes [Integer] :customer_bgp_asn The value to assign to the {#customer_bgp_asn} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :gateway_id The value to assign to the {#gateway_id} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Integer] :oracle_bgp_asn The value to assign to the {#oracle_bgp_asn} property
    # @option attributes [String] :provider_name The value to assign to the {#provider_name} property
    # @option attributes [String] :provider_service_id The value to assign to the {#provider_service_id} property
    # @option attributes [String] :provider_service_key_name The value to assign to the {#provider_service_key_name} property
    # @option attributes [String] :provider_service_name The value to assign to the {#provider_service_name} property
    # @option attributes [String] :provider_state The value to assign to the {#provider_state} property
    # @option attributes [Array<String>] :public_prefixes The value to assign to the {#public_prefixes} property
    # @option attributes [String] :reference_comment The value to assign to the {#reference_comment} property
    # @option attributes [String] :region The value to assign to the {#region} property
    # @option attributes [String] :service_type The value to assign to the {#service_type} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :type The value to assign to the {#type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bandwidth_shape_name = attributes[:'bandwidthShapeName'] if attributes[:'bandwidthShapeName']

      raise 'You cannot provide both :bandwidthShapeName and :bandwidth_shape_name' if attributes.key?(:'bandwidthShapeName') && attributes.key?(:'bandwidth_shape_name')

      self.bandwidth_shape_name = attributes[:'bandwidth_shape_name'] if attributes[:'bandwidth_shape_name']

      self.bgp_management = attributes[:'bgpManagement'] if attributes[:'bgpManagement']

      raise 'You cannot provide both :bgpManagement and :bgp_management' if attributes.key?(:'bgpManagement') && attributes.key?(:'bgp_management')

      self.bgp_management = attributes[:'bgp_management'] if attributes[:'bgp_management']

      self.bgp_session_state = attributes[:'bgpSessionState'] if attributes[:'bgpSessionState']

      raise 'You cannot provide both :bgpSessionState and :bgp_session_state' if attributes.key?(:'bgpSessionState') && attributes.key?(:'bgp_session_state')

      self.bgp_session_state = attributes[:'bgp_session_state'] if attributes[:'bgp_session_state']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cross_connect_mappings = attributes[:'crossConnectMappings'] if attributes[:'crossConnectMappings']

      raise 'You cannot provide both :crossConnectMappings and :cross_connect_mappings' if attributes.key?(:'crossConnectMappings') && attributes.key?(:'cross_connect_mappings')

      self.cross_connect_mappings = attributes[:'cross_connect_mappings'] if attributes[:'cross_connect_mappings']

      self.customer_bgp_asn = attributes[:'customerBgpAsn'] if attributes[:'customerBgpAsn']

      raise 'You cannot provide both :customerBgpAsn and :customer_bgp_asn' if attributes.key?(:'customerBgpAsn') && attributes.key?(:'customer_bgp_asn')

      self.customer_bgp_asn = attributes[:'customer_bgp_asn'] if attributes[:'customer_bgp_asn']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.gateway_id = attributes[:'gatewayId'] if attributes[:'gatewayId']

      raise 'You cannot provide both :gatewayId and :gateway_id' if attributes.key?(:'gatewayId') && attributes.key?(:'gateway_id')

      self.gateway_id = attributes[:'gateway_id'] if attributes[:'gateway_id']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.oracle_bgp_asn = attributes[:'oracleBgpAsn'] if attributes[:'oracleBgpAsn']

      raise 'You cannot provide both :oracleBgpAsn and :oracle_bgp_asn' if attributes.key?(:'oracleBgpAsn') && attributes.key?(:'oracle_bgp_asn')

      self.oracle_bgp_asn = attributes[:'oracle_bgp_asn'] if attributes[:'oracle_bgp_asn']

      self.provider_name = attributes[:'providerName'] if attributes[:'providerName']

      raise 'You cannot provide both :providerName and :provider_name' if attributes.key?(:'providerName') && attributes.key?(:'provider_name')

      self.provider_name = attributes[:'provider_name'] if attributes[:'provider_name']

      self.provider_service_id = attributes[:'providerServiceId'] if attributes[:'providerServiceId']

      raise 'You cannot provide both :providerServiceId and :provider_service_id' if attributes.key?(:'providerServiceId') && attributes.key?(:'provider_service_id')

      self.provider_service_id = attributes[:'provider_service_id'] if attributes[:'provider_service_id']

      self.provider_service_key_name = attributes[:'providerServiceKeyName'] if attributes[:'providerServiceKeyName']

      raise 'You cannot provide both :providerServiceKeyName and :provider_service_key_name' if attributes.key?(:'providerServiceKeyName') && attributes.key?(:'provider_service_key_name')

      self.provider_service_key_name = attributes[:'provider_service_key_name'] if attributes[:'provider_service_key_name']

      self.provider_service_name = attributes[:'providerServiceName'] if attributes[:'providerServiceName']

      raise 'You cannot provide both :providerServiceName and :provider_service_name' if attributes.key?(:'providerServiceName') && attributes.key?(:'provider_service_name')

      self.provider_service_name = attributes[:'provider_service_name'] if attributes[:'provider_service_name']

      self.provider_state = attributes[:'providerState'] if attributes[:'providerState']

      raise 'You cannot provide both :providerState and :provider_state' if attributes.key?(:'providerState') && attributes.key?(:'provider_state')

      self.provider_state = attributes[:'provider_state'] if attributes[:'provider_state']

      self.public_prefixes = attributes[:'publicPrefixes'] if attributes[:'publicPrefixes']

      raise 'You cannot provide both :publicPrefixes and :public_prefixes' if attributes.key?(:'publicPrefixes') && attributes.key?(:'public_prefixes')

      self.public_prefixes = attributes[:'public_prefixes'] if attributes[:'public_prefixes']

      self.reference_comment = attributes[:'referenceComment'] if attributes[:'referenceComment']

      raise 'You cannot provide both :referenceComment and :reference_comment' if attributes.key?(:'referenceComment') && attributes.key?(:'reference_comment')

      self.reference_comment = attributes[:'reference_comment'] if attributes[:'reference_comment']

      self.region = attributes[:'region'] if attributes[:'region']

      self.service_type = attributes[:'serviceType'] if attributes[:'serviceType']

      raise 'You cannot provide both :serviceType and :service_type' if attributes.key?(:'serviceType') && attributes.key?(:'service_type')

      self.service_type = attributes[:'service_type'] if attributes[:'service_type']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.type = attributes[:'type'] if attributes[:'type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] bgp_management Object to be assigned
    def bgp_management=(bgp_management)
      # rubocop:disable Style/ConditionalAssignment
      if bgp_management && !BGP_MANAGEMENT_ENUM.include?(bgp_management)
        OCI.logger.debug("Unknown value for 'bgp_management' [" + bgp_management + "]. Mapping to 'BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @bgp_management = BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE
      else
        @bgp_management = bgp_management
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] bgp_session_state Object to be assigned
    def bgp_session_state=(bgp_session_state)
      # rubocop:disable Style/ConditionalAssignment
      if bgp_session_state && !BGP_SESSION_STATE_ENUM.include?(bgp_session_state)
        OCI.logger.debug("Unknown value for 'bgp_session_state' [" + bgp_session_state + "]. Mapping to 'BGP_SESSION_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @bgp_session_state = BGP_SESSION_STATE_UNKNOWN_ENUM_VALUE
      else
        @bgp_session_state = bgp_session_state
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
    # @param [Object] provider_state Object to be assigned
    def provider_state=(provider_state)
      # rubocop:disable Style/ConditionalAssignment
      if provider_state && !PROVIDER_STATE_ENUM.include?(provider_state)
        OCI.logger.debug("Unknown value for 'provider_state' [" + provider_state + "]. Mapping to 'PROVIDER_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @provider_state = PROVIDER_STATE_UNKNOWN_ENUM_VALUE
      else
        @provider_state = provider_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] service_type Object to be assigned
    def service_type=(service_type)
      # rubocop:disable Style/ConditionalAssignment
      if service_type && !SERVICE_TYPE_ENUM.include?(service_type)
        OCI.logger.debug("Unknown value for 'service_type' [" + service_type + "]. Mapping to 'SERVICE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @service_type = SERVICE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @service_type = service_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bandwidth_shape_name == other.bandwidth_shape_name &&
        bgp_management == other.bgp_management &&
        bgp_session_state == other.bgp_session_state &&
        compartment_id == other.compartment_id &&
        cross_connect_mappings == other.cross_connect_mappings &&
        customer_bgp_asn == other.customer_bgp_asn &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        gateway_id == other.gateway_id &&
        id == other.id &&
        lifecycle_state == other.lifecycle_state &&
        oracle_bgp_asn == other.oracle_bgp_asn &&
        provider_name == other.provider_name &&
        provider_service_id == other.provider_service_id &&
        provider_service_key_name == other.provider_service_key_name &&
        provider_service_name == other.provider_service_name &&
        provider_state == other.provider_state &&
        public_prefixes == other.public_prefixes &&
        reference_comment == other.reference_comment &&
        region == other.region &&
        service_type == other.service_type &&
        time_created == other.time_created &&
        type == other.type
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
      [bandwidth_shape_name, bgp_management, bgp_session_state, compartment_id, cross_connect_mappings, customer_bgp_asn, defined_tags, display_name, freeform_tags, gateway_id, id, lifecycle_state, oracle_bgp_asn, provider_name, provider_service_id, provider_service_key_name, provider_service_name, provider_state, public_prefixes, reference_comment, region, service_type, time_created, type].hash
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
