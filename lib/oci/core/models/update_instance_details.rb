# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpdateInstanceDetails model.
  class Core::Models::UpdateInstanceDetails
    # The OCID of the compute capacity reservation this instance is launched under.
    # You can remove the instance from a reservation by specifying an empty string as input for this field.
    # For more information, see [Capacity Reservations](https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/reserve-capacity.htm#default).
    #
    # @return [String]
    attr_accessor :capacity_reservation_id

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

    # @return [OCI::Core::Models::UpdateInstanceAgentConfigDetails]
    attr_accessor :agent_config

    # The shape of the instance. The shape determines the number of CPUs and the amount of memory
    # allocated to the instance. For more information about how to change shapes, and a list of
    # shapes that are supported, see
    # [Editing an Instance](https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/resizinginstances.htm).
    #
    # For details about the CPUs, memory, and other properties of each shape, see
    # [Compute Shapes](https://docs.cloud.oracle.com/iaas/Content/Compute/References/computeshapes.htm).
    #
    # The new shape must be compatible with the image that was used to launch the instance. You
    # can enumerate all available shapes and determine image compatibility by calling
    # {#list_shapes list_shapes}.
    #
    # If the instance is running when you change the shape, the instance is rebooted.
    #
    # Example: `VM.Standard2.1`
    #
    # @return [String]
    attr_accessor :shape

    # @return [OCI::Core::Models::UpdateInstanceShapeConfigDetails]
    attr_accessor :shape_config

    # @return [OCI::Core::Models::InstanceOptions]
    attr_accessor :instance_options

    # A fault domain is a grouping of hardware and infrastructure within an availability domain.
    # Each availability domain contains three fault domains. Fault domains let you distribute your
    # instances so that they are not on the same physical hardware within a single availability domain.
    # A hardware failure or Compute hardware maintenance that affects one fault domain does not affect
    # instances in other fault domains.
    #
    # To get a list of fault domains, use the
    # {#list_fault_domains list_fault_domains} operation in the
    # Identity and Access Management Service API.
    #
    # Example: `FAULT-DOMAIN-1`
    #
    # @return [String]
    attr_accessor :fault_domain

    # @return [OCI::Core::Models::UpdateLaunchOptions]
    attr_accessor :launch_options

    # @return [OCI::Core::Models::UpdateInstanceAvailabilityConfigDetails]
    attr_accessor :availability_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'capacity_reservation_id': :'capacityReservationId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'agent_config': :'agentConfig',
        'shape': :'shape',
        'shape_config': :'shapeConfig',
        'instance_options': :'instanceOptions',
        'fault_domain': :'faultDomain',
        'launch_options': :'launchOptions',
        'availability_config': :'availabilityConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'capacity_reservation_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'agent_config': :'OCI::Core::Models::UpdateInstanceAgentConfigDetails',
        'shape': :'String',
        'shape_config': :'OCI::Core::Models::UpdateInstanceShapeConfigDetails',
        'instance_options': :'OCI::Core::Models::InstanceOptions',
        'fault_domain': :'String',
        'launch_options': :'OCI::Core::Models::UpdateLaunchOptions',
        'availability_config': :'OCI::Core::Models::UpdateInstanceAvailabilityConfigDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :capacity_reservation_id The value to assign to the {#capacity_reservation_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [OCI::Core::Models::UpdateInstanceAgentConfigDetails] :agent_config The value to assign to the {#agent_config} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::Core::Models::UpdateInstanceShapeConfigDetails] :shape_config The value to assign to the {#shape_config} property
    # @option attributes [OCI::Core::Models::InstanceOptions] :instance_options The value to assign to the {#instance_options} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [OCI::Core::Models::UpdateLaunchOptions] :launch_options The value to assign to the {#launch_options} property
    # @option attributes [OCI::Core::Models::UpdateInstanceAvailabilityConfigDetails] :availability_config The value to assign to the {#availability_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.capacity_reservation_id = attributes[:'capacityReservationId'] if attributes[:'capacityReservationId']

      raise 'You cannot provide both :capacityReservationId and :capacity_reservation_id' if attributes.key?(:'capacityReservationId') && attributes.key?(:'capacity_reservation_id')

      self.capacity_reservation_id = attributes[:'capacity_reservation_id'] if attributes[:'capacity_reservation_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.agent_config = attributes[:'agentConfig'] if attributes[:'agentConfig']

      raise 'You cannot provide both :agentConfig and :agent_config' if attributes.key?(:'agentConfig') && attributes.key?(:'agent_config')

      self.agent_config = attributes[:'agent_config'] if attributes[:'agent_config']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.shape_config = attributes[:'shapeConfig'] if attributes[:'shapeConfig']

      raise 'You cannot provide both :shapeConfig and :shape_config' if attributes.key?(:'shapeConfig') && attributes.key?(:'shape_config')

      self.shape_config = attributes[:'shape_config'] if attributes[:'shape_config']

      self.instance_options = attributes[:'instanceOptions'] if attributes[:'instanceOptions']

      raise 'You cannot provide both :instanceOptions and :instance_options' if attributes.key?(:'instanceOptions') && attributes.key?(:'instance_options')

      self.instance_options = attributes[:'instance_options'] if attributes[:'instance_options']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.launch_options = attributes[:'launchOptions'] if attributes[:'launchOptions']

      raise 'You cannot provide both :launchOptions and :launch_options' if attributes.key?(:'launchOptions') && attributes.key?(:'launch_options')

      self.launch_options = attributes[:'launch_options'] if attributes[:'launch_options']

      self.availability_config = attributes[:'availabilityConfig'] if attributes[:'availabilityConfig']

      raise 'You cannot provide both :availabilityConfig and :availability_config' if attributes.key?(:'availabilityConfig') && attributes.key?(:'availability_config')

      self.availability_config = attributes[:'availability_config'] if attributes[:'availability_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        capacity_reservation_id == other.capacity_reservation_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        agent_config == other.agent_config &&
        shape == other.shape &&
        shape_config == other.shape_config &&
        instance_options == other.instance_options &&
        fault_domain == other.fault_domain &&
        launch_options == other.launch_options &&
        availability_config == other.availability_config
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
      [capacity_reservation_id, defined_tags, display_name, freeform_tags, agent_config, shape, shape_config, instance_options, fault_domain, launch_options, availability_config].hash
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
