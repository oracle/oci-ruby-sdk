# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An Operator Control Assignment identifies the target resource that is placed under the governance of an Operator Control. Creating an Operator Control Assignment Assignment with a time duration ensures that
  # human accesses to the target resource will be governed by Operator Control for the duration specified.
  #
  class OperatorAccessControl::Models::OperatorControlAssignment
    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_EXACC = 'EXACC'.freeze,
      RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATED = 'CREATED'.freeze,
      LIFECYCLE_STATE_APPLIED = 'APPLIED'.freeze,
      LIFECYCLE_STATE_APPLYFAILED = 'APPLYFAILED'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the operator control assignment.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the operator control.
    # @return [String]
    attr_accessor :operator_control_id

    # **[Required]** The OCID of the target resource.
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** Name of the target resource.
    # @return [String]
    attr_accessor :resource_name

    # Type of the target resource.
    # @return [String]
    attr_reader :resource_type

    # The OCID of the compartment that contains the target resource.
    # @return [String]
    attr_accessor :resource_compartment_id

    # The OCID of the comparment that contains the operator control assignment.
    # @return [String]
    attr_accessor :compartment_id

    # The time at which the target resource will be brought under the governance of the operator control expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_assignment_from

    # The time at which the target resource will leave the governance of the operator control expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_assignment_to

    # If set, then the target resource is always governed by the operator control.
    # @return [BOOLEAN]
    attr_accessor :is_enforced_always

    # The current lifcycle state of the OperatorControl.
    # @return [String]
    attr_reader :lifecycle_state

    # The OCID of the user who created this operator control assignment.
    # @return [String]
    attr_accessor :assigner_id

    # Time when the operator control assignment is created in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format. Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_assignment

    # Comment about the assignment of the operator control to this target resource.
    # @return [String]
    attr_accessor :comment

    # User id who released the operatorControl.
    # @return [String]
    attr_accessor :unassigner_id

    # Time on which the operator control assignment was deleted in [RFC 3339](https://tools.ietf.org/html/rfc3339)timestamp format.Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_deletion

    # description containing reason for releasing of OperatorControl.
    # @return [String]
    attr_accessor :detachment_description

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'operator_control_id': :'operatorControlId',
        'resource_id': :'resourceId',
        'resource_name': :'resourceName',
        'resource_type': :'resourceType',
        'resource_compartment_id': :'resourceCompartmentId',
        'compartment_id': :'compartmentId',
        'time_assignment_from': :'timeAssignmentFrom',
        'time_assignment_to': :'timeAssignmentTo',
        'is_enforced_always': :'isEnforcedAlways',
        'lifecycle_state': :'lifecycleState',
        'assigner_id': :'assignerId',
        'time_of_assignment': :'timeOfAssignment',
        'comment': :'comment',
        'unassigner_id': :'unassignerId',
        'time_of_deletion': :'timeOfDeletion',
        'detachment_description': :'detachmentDescription',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'operator_control_id': :'String',
        'resource_id': :'String',
        'resource_name': :'String',
        'resource_type': :'String',
        'resource_compartment_id': :'String',
        'compartment_id': :'String',
        'time_assignment_from': :'DateTime',
        'time_assignment_to': :'DateTime',
        'is_enforced_always': :'BOOLEAN',
        'lifecycle_state': :'String',
        'assigner_id': :'String',
        'time_of_assignment': :'DateTime',
        'comment': :'String',
        'unassigner_id': :'String',
        'time_of_deletion': :'DateTime',
        'detachment_description': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :operator_control_id The value to assign to the {#operator_control_id} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :resource_compartment_id The value to assign to the {#resource_compartment_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_assignment_from The value to assign to the {#time_assignment_from} property
    # @option attributes [DateTime] :time_assignment_to The value to assign to the {#time_assignment_to} property
    # @option attributes [BOOLEAN] :is_enforced_always The value to assign to the {#is_enforced_always} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :assigner_id The value to assign to the {#assigner_id} property
    # @option attributes [DateTime] :time_of_assignment The value to assign to the {#time_of_assignment} property
    # @option attributes [String] :comment The value to assign to the {#comment} property
    # @option attributes [String] :unassigner_id The value to assign to the {#unassigner_id} property
    # @option attributes [DateTime] :time_of_deletion The value to assign to the {#time_of_deletion} property
    # @option attributes [String] :detachment_description The value to assign to the {#detachment_description} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.operator_control_id = attributes[:'operatorControlId'] if attributes[:'operatorControlId']

      raise 'You cannot provide both :operatorControlId and :operator_control_id' if attributes.key?(:'operatorControlId') && attributes.key?(:'operator_control_id')

      self.operator_control_id = attributes[:'operator_control_id'] if attributes[:'operator_control_id']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.resource_compartment_id = attributes[:'resourceCompartmentId'] if attributes[:'resourceCompartmentId']

      raise 'You cannot provide both :resourceCompartmentId and :resource_compartment_id' if attributes.key?(:'resourceCompartmentId') && attributes.key?(:'resource_compartment_id')

      self.resource_compartment_id = attributes[:'resource_compartment_id'] if attributes[:'resource_compartment_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_assignment_from = attributes[:'timeAssignmentFrom'] if attributes[:'timeAssignmentFrom']

      raise 'You cannot provide both :timeAssignmentFrom and :time_assignment_from' if attributes.key?(:'timeAssignmentFrom') && attributes.key?(:'time_assignment_from')

      self.time_assignment_from = attributes[:'time_assignment_from'] if attributes[:'time_assignment_from']

      self.time_assignment_to = attributes[:'timeAssignmentTo'] if attributes[:'timeAssignmentTo']

      raise 'You cannot provide both :timeAssignmentTo and :time_assignment_to' if attributes.key?(:'timeAssignmentTo') && attributes.key?(:'time_assignment_to')

      self.time_assignment_to = attributes[:'time_assignment_to'] if attributes[:'time_assignment_to']

      self.is_enforced_always = attributes[:'isEnforcedAlways'] unless attributes[:'isEnforcedAlways'].nil?

      raise 'You cannot provide both :isEnforcedAlways and :is_enforced_always' if attributes.key?(:'isEnforcedAlways') && attributes.key?(:'is_enforced_always')

      self.is_enforced_always = attributes[:'is_enforced_always'] unless attributes[:'is_enforced_always'].nil?

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.assigner_id = attributes[:'assignerId'] if attributes[:'assignerId']

      raise 'You cannot provide both :assignerId and :assigner_id' if attributes.key?(:'assignerId') && attributes.key?(:'assigner_id')

      self.assigner_id = attributes[:'assigner_id'] if attributes[:'assigner_id']

      self.time_of_assignment = attributes[:'timeOfAssignment'] if attributes[:'timeOfAssignment']

      raise 'You cannot provide both :timeOfAssignment and :time_of_assignment' if attributes.key?(:'timeOfAssignment') && attributes.key?(:'time_of_assignment')

      self.time_of_assignment = attributes[:'time_of_assignment'] if attributes[:'time_of_assignment']

      self.comment = attributes[:'comment'] if attributes[:'comment']

      self.unassigner_id = attributes[:'unassignerId'] if attributes[:'unassignerId']

      raise 'You cannot provide both :unassignerId and :unassigner_id' if attributes.key?(:'unassignerId') && attributes.key?(:'unassigner_id')

      self.unassigner_id = attributes[:'unassigner_id'] if attributes[:'unassigner_id']

      self.time_of_deletion = attributes[:'timeOfDeletion'] if attributes[:'timeOfDeletion']

      raise 'You cannot provide both :timeOfDeletion and :time_of_deletion' if attributes.key?(:'timeOfDeletion') && attributes.key?(:'time_of_deletion')

      self.time_of_deletion = attributes[:'time_of_deletion'] if attributes[:'time_of_deletion']

      self.detachment_description = attributes[:'detachmentDescription'] if attributes[:'detachmentDescription']

      raise 'You cannot provide both :detachmentDescription and :detachment_description' if attributes.key?(:'detachmentDescription') && attributes.key?(:'detachment_description')

      self.detachment_description = attributes[:'detachment_description'] if attributes[:'detachment_description']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_type Object to be assigned
    def resource_type=(resource_type)
      # rubocop:disable Style/ConditionalAssignment
      if resource_type && !RESOURCE_TYPE_ENUM.include?(resource_type)
        OCI.logger.debug("Unknown value for 'resource_type' [" + resource_type + "]. Mapping to 'RESOURCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_type = RESOURCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @resource_type = resource_type
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        operator_control_id == other.operator_control_id &&
        resource_id == other.resource_id &&
        resource_name == other.resource_name &&
        resource_type == other.resource_type &&
        resource_compartment_id == other.resource_compartment_id &&
        compartment_id == other.compartment_id &&
        time_assignment_from == other.time_assignment_from &&
        time_assignment_to == other.time_assignment_to &&
        is_enforced_always == other.is_enforced_always &&
        lifecycle_state == other.lifecycle_state &&
        assigner_id == other.assigner_id &&
        time_of_assignment == other.time_of_assignment &&
        comment == other.comment &&
        unassigner_id == other.unassigner_id &&
        time_of_deletion == other.time_of_deletion &&
        detachment_description == other.detachment_description &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, operator_control_id, resource_id, resource_name, resource_type, resource_compartment_id, compartment_id, time_assignment_from, time_assignment_to, is_enforced_always, lifecycle_state, assigner_id, time_of_assignment, comment, unassigner_id, time_of_deletion, detachment_description, freeform_tags, defined_tags].hash
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
