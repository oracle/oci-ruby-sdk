# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about the new operator control.
  class OperatorAccessControl::Models::UpdateOperatorControlDetails
    # Name of the operator control.
    # @return [String]
    attr_accessor :operator_control_name

    # Description of the operator control.
    # @return [String]
    attr_accessor :description

    # List of users who can approve an access request associated with a target resource under the governance of this operator control.
    # @return [Array<String>]
    attr_accessor :approvers_list

    # List of user groups who can approve an access request associated with a target resource under the governance of this operator control.
    # @return [Array<String>]
    attr_accessor :approver_groups_list

    # List of pre-approved operator actions. Access requests associated with a resource governed by this operator control will be
    # automatically approved if the access request only contain operator actions in the pre-approved list.
    #
    # @return [Array<String>]
    attr_accessor :pre_approved_op_action_list

    # Whether all the operator actions have been pre-approved. If yes, all access requests associated with a resource governed by this operator control
    # will be auto-approved.
    #
    # @return [BOOLEAN]
    attr_accessor :is_fully_pre_approved

    # List of emailId.
    #
    # @return [Array<String>]
    attr_accessor :email_id_list

    # System message that would be displayed to the operator users on accessing the target resource under the governance of this operator control.
    # @return [String]
    attr_accessor :system_message

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
        'operator_control_name': :'operatorControlName',
        'description': :'description',
        'approvers_list': :'approversList',
        'approver_groups_list': :'approverGroupsList',
        'pre_approved_op_action_list': :'preApprovedOpActionList',
        'is_fully_pre_approved': :'isFullyPreApproved',
        'email_id_list': :'emailIdList',
        'system_message': :'systemMessage',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operator_control_name': :'String',
        'description': :'String',
        'approvers_list': :'Array<String>',
        'approver_groups_list': :'Array<String>',
        'pre_approved_op_action_list': :'Array<String>',
        'is_fully_pre_approved': :'BOOLEAN',
        'email_id_list': :'Array<String>',
        'system_message': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operator_control_name The value to assign to the {#operator_control_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<String>] :approvers_list The value to assign to the {#approvers_list} property
    # @option attributes [Array<String>] :approver_groups_list The value to assign to the {#approver_groups_list} property
    # @option attributes [Array<String>] :pre_approved_op_action_list The value to assign to the {#pre_approved_op_action_list} property
    # @option attributes [BOOLEAN] :is_fully_pre_approved The value to assign to the {#is_fully_pre_approved} property
    # @option attributes [Array<String>] :email_id_list The value to assign to the {#email_id_list} property
    # @option attributes [String] :system_message The value to assign to the {#system_message} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operator_control_name = attributes[:'operatorControlName'] if attributes[:'operatorControlName']

      raise 'You cannot provide both :operatorControlName and :operator_control_name' if attributes.key?(:'operatorControlName') && attributes.key?(:'operator_control_name')

      self.operator_control_name = attributes[:'operator_control_name'] if attributes[:'operator_control_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.approvers_list = attributes[:'approversList'] if attributes[:'approversList']

      raise 'You cannot provide both :approversList and :approvers_list' if attributes.key?(:'approversList') && attributes.key?(:'approvers_list')

      self.approvers_list = attributes[:'approvers_list'] if attributes[:'approvers_list']

      self.approver_groups_list = attributes[:'approverGroupsList'] if attributes[:'approverGroupsList']

      raise 'You cannot provide both :approverGroupsList and :approver_groups_list' if attributes.key?(:'approverGroupsList') && attributes.key?(:'approver_groups_list')

      self.approver_groups_list = attributes[:'approver_groups_list'] if attributes[:'approver_groups_list']

      self.pre_approved_op_action_list = attributes[:'preApprovedOpActionList'] if attributes[:'preApprovedOpActionList']

      raise 'You cannot provide both :preApprovedOpActionList and :pre_approved_op_action_list' if attributes.key?(:'preApprovedOpActionList') && attributes.key?(:'pre_approved_op_action_list')

      self.pre_approved_op_action_list = attributes[:'pre_approved_op_action_list'] if attributes[:'pre_approved_op_action_list']

      self.is_fully_pre_approved = attributes[:'isFullyPreApproved'] unless attributes[:'isFullyPreApproved'].nil?

      raise 'You cannot provide both :isFullyPreApproved and :is_fully_pre_approved' if attributes.key?(:'isFullyPreApproved') && attributes.key?(:'is_fully_pre_approved')

      self.is_fully_pre_approved = attributes[:'is_fully_pre_approved'] unless attributes[:'is_fully_pre_approved'].nil?

      self.email_id_list = attributes[:'emailIdList'] if attributes[:'emailIdList']

      raise 'You cannot provide both :emailIdList and :email_id_list' if attributes.key?(:'emailIdList') && attributes.key?(:'email_id_list')

      self.email_id_list = attributes[:'email_id_list'] if attributes[:'email_id_list']

      self.system_message = attributes[:'systemMessage'] if attributes[:'systemMessage']

      raise 'You cannot provide both :systemMessage and :system_message' if attributes.key?(:'systemMessage') && attributes.key?(:'system_message')

      self.system_message = attributes[:'system_message'] if attributes[:'system_message']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operator_control_name == other.operator_control_name &&
        description == other.description &&
        approvers_list == other.approvers_list &&
        approver_groups_list == other.approver_groups_list &&
        pre_approved_op_action_list == other.pre_approved_op_action_list &&
        is_fully_pre_approved == other.is_fully_pre_approved &&
        email_id_list == other.email_id_list &&
        system_message == other.system_message &&
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
      [operator_control_name, description, approvers_list, approver_groups_list, pre_approved_op_action_list, is_fully_pre_approved, email_id_list, system_message, freeform_tags, defined_tags].hash
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
