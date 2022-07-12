# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A virtual test access point (VTAP) provides a way to mirror all traffic from a designated source to a selected target in order to facilitate troubleshooting, security analysis, and data monitoring.
  # A VTAP is functionally similar to a test access point (TAP) you might deploy in your on-premises network.
  #
  # A *{CaptureFilter}* contains a set of *{#capture_filter_rule_details capture_filter_rule_details}* governing what traffic a VTAP mirrors.
  #
  class Core::Models::Vtap
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_DETAILS_ENUM = [
      LIFECYCLE_STATE_DETAILS_RUNNING = 'RUNNING'.freeze,
      LIFECYCLE_STATE_DETAILS_STOPPED = 'STOPPED'.freeze,
      LIFECYCLE_STATE_DETAILS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ENCAPSULATION_PROTOCOL_ENUM = [
      ENCAPSULATION_PROTOCOL_VXLAN = 'VXLAN'.freeze,
      ENCAPSULATION_PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SOURCE_TYPE_ENUM = [
      SOURCE_TYPE_VNIC = 'VNIC'.freeze,
      SOURCE_TYPE_SUBNET = 'SUBNET'.freeze,
      SOURCE_TYPE_LOAD_BALANCER = 'LOAD_BALANCER'.freeze,
      SOURCE_TYPE_DB_SYSTEM = 'DB_SYSTEM'.freeze,
      SOURCE_TYPE_EXADATA_VM_CLUSTER = 'EXADATA_VM_CLUSTER'.freeze,
      SOURCE_TYPE_AUTONOMOUS_DATA_WAREHOUSE = 'AUTONOMOUS_DATA_WAREHOUSE'.freeze,
      SOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRAFFIC_MODE_ENUM = [
      TRAFFIC_MODE_DEFAULT = 'DEFAULT'.freeze,
      TRAFFIC_MODE_PRIORITY = 'PRIORITY'.freeze,
      TRAFFIC_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TARGET_TYPE_ENUM = [
      TARGET_TYPE_VNIC = 'VNIC'.freeze,
      TARGET_TYPE_NETWORK_LOAD_BALANCER = 'NETWORK_LOAD_BALANCER'.freeze,
      TARGET_TYPE_IP_ADDRESS = 'IP_ADDRESS'.freeze,
      TARGET_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the `Vtap` resource.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN containing the `Vtap` resource.
    # @return [String]
    attr_accessor :vcn_id

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
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
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The VTAP's Oracle ID ([OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)).
    # @return [String]
    attr_accessor :id

    # **[Required]** The VTAP's administrative lifecycle state.
    # @return [String]
    attr_reader :lifecycle_state

    # The VTAP's current running state.
    # @return [String]
    attr_reader :lifecycle_state_details

    # The date and time the VTAP was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2020-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the source point where packets are captured.
    #
    # @return [String]
    attr_accessor :source_id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the destination resource where mirrored packets are sent.
    #
    # @return [String]
    attr_accessor :target_id

    # The IP address of the destination resource where mirrored packets are sent.
    #
    # @return [String]
    attr_accessor :target_ip

    # **[Required]** The capture filter's Oracle ID ([OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)).
    #
    # @return [String]
    attr_accessor :capture_filter_id

    # Defines an encapsulation header type for the VTAP's mirrored traffic.
    #
    # @return [String]
    attr_reader :encapsulation_protocol

    # The virtual extensible LAN (VXLAN) network identifier (or VXLAN segment ID) that uniquely identifies the VXLAN.
    #
    # @return [Integer]
    attr_accessor :vxlan_network_identifier

    # Used to start or stop a `Vtap` resource.
    #
    # * `TRUE` directs the VTAP to start mirroring traffic.
    # * `FALSE` (Default) directs the VTAP to stop mirroring traffic.
    #
    # @return [BOOLEAN]
    attr_accessor :is_vtap_enabled

    # The source type for the VTAP.
    #
    # @return [String]
    attr_reader :source_type

    # Used to control the priority of traffic. It is an optional field. If it not passed, the value is DEFAULT
    # @return [String]
    attr_reader :traffic_mode

    # The maximum size of the packets to be included in the filter.
    # @return [Integer]
    attr_accessor :max_packet_size

    # The target type for the VTAP.
    #
    # @return [String]
    attr_reader :target_type

    # The IP Address of the source private endpoint.
    #
    # @return [String]
    attr_accessor :source_private_endpoint_ip

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet that source private endpoint belongs to.
    #
    # @return [String]
    attr_accessor :source_private_endpoint_subnet_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'vcn_id': :'vcnId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'id': :'id',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_state_details': :'lifecycleStateDetails',
        'time_created': :'timeCreated',
        'source_id': :'sourceId',
        'target_id': :'targetId',
        'target_ip': :'targetIp',
        'capture_filter_id': :'captureFilterId',
        'encapsulation_protocol': :'encapsulationProtocol',
        'vxlan_network_identifier': :'vxlanNetworkIdentifier',
        'is_vtap_enabled': :'isVtapEnabled',
        'source_type': :'sourceType',
        'traffic_mode': :'trafficMode',
        'max_packet_size': :'maxPacketSize',
        'target_type': :'targetType',
        'source_private_endpoint_ip': :'sourcePrivateEndpointIp',
        'source_private_endpoint_subnet_id': :'sourcePrivateEndpointSubnetId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'vcn_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_state_details': :'String',
        'time_created': :'DateTime',
        'source_id': :'String',
        'target_id': :'String',
        'target_ip': :'String',
        'capture_filter_id': :'String',
        'encapsulation_protocol': :'String',
        'vxlan_network_identifier': :'Integer',
        'is_vtap_enabled': :'BOOLEAN',
        'source_type': :'String',
        'traffic_mode': :'String',
        'max_packet_size': :'Integer',
        'target_type': :'String',
        'source_private_endpoint_ip': :'String',
        'source_private_endpoint_subnet_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_state_details The value to assign to the {#lifecycle_state_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :target_ip The value to assign to the {#target_ip} property
    # @option attributes [String] :capture_filter_id The value to assign to the {#capture_filter_id} property
    # @option attributes [String] :encapsulation_protocol The value to assign to the {#encapsulation_protocol} property
    # @option attributes [Integer] :vxlan_network_identifier The value to assign to the {#vxlan_network_identifier} property
    # @option attributes [BOOLEAN] :is_vtap_enabled The value to assign to the {#is_vtap_enabled} property
    # @option attributes [String] :source_type The value to assign to the {#source_type} property
    # @option attributes [String] :traffic_mode The value to assign to the {#traffic_mode} property
    # @option attributes [Integer] :max_packet_size The value to assign to the {#max_packet_size} property
    # @option attributes [String] :target_type The value to assign to the {#target_type} property
    # @option attributes [String] :source_private_endpoint_ip The value to assign to the {#source_private_endpoint_ip} property
    # @option attributes [String] :source_private_endpoint_subnet_id The value to assign to the {#source_private_endpoint_subnet_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_state_details = attributes[:'lifecycleStateDetails'] if attributes[:'lifecycleStateDetails']

      raise 'You cannot provide both :lifecycleStateDetails and :lifecycle_state_details' if attributes.key?(:'lifecycleStateDetails') && attributes.key?(:'lifecycle_state_details')

      self.lifecycle_state_details = attributes[:'lifecycle_state_details'] if attributes[:'lifecycle_state_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.target_ip = attributes[:'targetIp'] if attributes[:'targetIp']

      raise 'You cannot provide both :targetIp and :target_ip' if attributes.key?(:'targetIp') && attributes.key?(:'target_ip')

      self.target_ip = attributes[:'target_ip'] if attributes[:'target_ip']

      self.capture_filter_id = attributes[:'captureFilterId'] if attributes[:'captureFilterId']

      raise 'You cannot provide both :captureFilterId and :capture_filter_id' if attributes.key?(:'captureFilterId') && attributes.key?(:'capture_filter_id')

      self.capture_filter_id = attributes[:'capture_filter_id'] if attributes[:'capture_filter_id']

      self.encapsulation_protocol = attributes[:'encapsulationProtocol'] if attributes[:'encapsulationProtocol']

      raise 'You cannot provide both :encapsulationProtocol and :encapsulation_protocol' if attributes.key?(:'encapsulationProtocol') && attributes.key?(:'encapsulation_protocol')

      self.encapsulation_protocol = attributes[:'encapsulation_protocol'] if attributes[:'encapsulation_protocol']

      self.vxlan_network_identifier = attributes[:'vxlanNetworkIdentifier'] if attributes[:'vxlanNetworkIdentifier']

      raise 'You cannot provide both :vxlanNetworkIdentifier and :vxlan_network_identifier' if attributes.key?(:'vxlanNetworkIdentifier') && attributes.key?(:'vxlan_network_identifier')

      self.vxlan_network_identifier = attributes[:'vxlan_network_identifier'] if attributes[:'vxlan_network_identifier']

      self.is_vtap_enabled = attributes[:'isVtapEnabled'] unless attributes[:'isVtapEnabled'].nil?
      self.is_vtap_enabled = false if is_vtap_enabled.nil? && !attributes.key?(:'isVtapEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isVtapEnabled and :is_vtap_enabled' if attributes.key?(:'isVtapEnabled') && attributes.key?(:'is_vtap_enabled')

      self.is_vtap_enabled = attributes[:'is_vtap_enabled'] unless attributes[:'is_vtap_enabled'].nil?
      self.is_vtap_enabled = false if is_vtap_enabled.nil? && !attributes.key?(:'isVtapEnabled') && !attributes.key?(:'is_vtap_enabled') # rubocop:disable Style/StringLiterals

      self.source_type = attributes[:'sourceType'] if attributes[:'sourceType']

      raise 'You cannot provide both :sourceType and :source_type' if attributes.key?(:'sourceType') && attributes.key?(:'source_type')

      self.source_type = attributes[:'source_type'] if attributes[:'source_type']

      self.traffic_mode = attributes[:'trafficMode'] if attributes[:'trafficMode']
      self.traffic_mode = "DEFAULT" if traffic_mode.nil? && !attributes.key?(:'trafficMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :trafficMode and :traffic_mode' if attributes.key?(:'trafficMode') && attributes.key?(:'traffic_mode')

      self.traffic_mode = attributes[:'traffic_mode'] if attributes[:'traffic_mode']
      self.traffic_mode = "DEFAULT" if traffic_mode.nil? && !attributes.key?(:'trafficMode') && !attributes.key?(:'traffic_mode') # rubocop:disable Style/StringLiterals

      self.max_packet_size = attributes[:'maxPacketSize'] if attributes[:'maxPacketSize']

      raise 'You cannot provide both :maxPacketSize and :max_packet_size' if attributes.key?(:'maxPacketSize') && attributes.key?(:'max_packet_size')

      self.max_packet_size = attributes[:'max_packet_size'] if attributes[:'max_packet_size']

      self.target_type = attributes[:'targetType'] if attributes[:'targetType']

      raise 'You cannot provide both :targetType and :target_type' if attributes.key?(:'targetType') && attributes.key?(:'target_type')

      self.target_type = attributes[:'target_type'] if attributes[:'target_type']

      self.source_private_endpoint_ip = attributes[:'sourcePrivateEndpointIp'] if attributes[:'sourcePrivateEndpointIp']

      raise 'You cannot provide both :sourcePrivateEndpointIp and :source_private_endpoint_ip' if attributes.key?(:'sourcePrivateEndpointIp') && attributes.key?(:'source_private_endpoint_ip')

      self.source_private_endpoint_ip = attributes[:'source_private_endpoint_ip'] if attributes[:'source_private_endpoint_ip']

      self.source_private_endpoint_subnet_id = attributes[:'sourcePrivateEndpointSubnetId'] if attributes[:'sourcePrivateEndpointSubnetId']

      raise 'You cannot provide both :sourcePrivateEndpointSubnetId and :source_private_endpoint_subnet_id' if attributes.key?(:'sourcePrivateEndpointSubnetId') && attributes.key?(:'source_private_endpoint_subnet_id')

      self.source_private_endpoint_subnet_id = attributes[:'source_private_endpoint_subnet_id'] if attributes[:'source_private_endpoint_subnet_id']
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
    # @param [Object] lifecycle_state_details Object to be assigned
    def lifecycle_state_details=(lifecycle_state_details)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state_details && !LIFECYCLE_STATE_DETAILS_ENUM.include?(lifecycle_state_details)
        OCI.logger.debug("Unknown value for 'lifecycle_state_details' [" + lifecycle_state_details + "]. Mapping to 'LIFECYCLE_STATE_DETAILS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state_details = LIFECYCLE_STATE_DETAILS_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state_details = lifecycle_state_details
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] encapsulation_protocol Object to be assigned
    def encapsulation_protocol=(encapsulation_protocol)
      # rubocop:disable Style/ConditionalAssignment
      if encapsulation_protocol && !ENCAPSULATION_PROTOCOL_ENUM.include?(encapsulation_protocol)
        OCI.logger.debug("Unknown value for 'encapsulation_protocol' [" + encapsulation_protocol + "]. Mapping to 'ENCAPSULATION_PROTOCOL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @encapsulation_protocol = ENCAPSULATION_PROTOCOL_UNKNOWN_ENUM_VALUE
      else
        @encapsulation_protocol = encapsulation_protocol
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source_type Object to be assigned
    def source_type=(source_type)
      # rubocop:disable Style/ConditionalAssignment
      if source_type && !SOURCE_TYPE_ENUM.include?(source_type)
        OCI.logger.debug("Unknown value for 'source_type' [" + source_type + "]. Mapping to 'SOURCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @source_type = SOURCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @source_type = source_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] traffic_mode Object to be assigned
    def traffic_mode=(traffic_mode)
      # rubocop:disable Style/ConditionalAssignment
      if traffic_mode && !TRAFFIC_MODE_ENUM.include?(traffic_mode)
        OCI.logger.debug("Unknown value for 'traffic_mode' [" + traffic_mode + "]. Mapping to 'TRAFFIC_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @traffic_mode = TRAFFIC_MODE_UNKNOWN_ENUM_VALUE
      else
        @traffic_mode = traffic_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target_type Object to be assigned
    def target_type=(target_type)
      # rubocop:disable Style/ConditionalAssignment
      if target_type && !TARGET_TYPE_ENUM.include?(target_type)
        OCI.logger.debug("Unknown value for 'target_type' [" + target_type + "]. Mapping to 'TARGET_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @target_type = TARGET_TYPE_UNKNOWN_ENUM_VALUE
      else
        @target_type = target_type
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
        vcn_id == other.vcn_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        id == other.id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_state_details == other.lifecycle_state_details &&
        time_created == other.time_created &&
        source_id == other.source_id &&
        target_id == other.target_id &&
        target_ip == other.target_ip &&
        capture_filter_id == other.capture_filter_id &&
        encapsulation_protocol == other.encapsulation_protocol &&
        vxlan_network_identifier == other.vxlan_network_identifier &&
        is_vtap_enabled == other.is_vtap_enabled &&
        source_type == other.source_type &&
        traffic_mode == other.traffic_mode &&
        max_packet_size == other.max_packet_size &&
        target_type == other.target_type &&
        source_private_endpoint_ip == other.source_private_endpoint_ip &&
        source_private_endpoint_subnet_id == other.source_private_endpoint_subnet_id
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
      [compartment_id, vcn_id, defined_tags, display_name, freeform_tags, id, lifecycle_state, lifecycle_state_details, time_created, source_id, target_id, target_ip, capture_filter_id, encapsulation_protocol, vxlan_network_identifier, is_vtap_enabled, source_type, traffic_mode, max_packet_size, target_type, source_private_endpoint_ip, source_private_endpoint_subnet_id].hash
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
