# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220126
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about new Lockbox.
  class Lockbox::Models::CreateLockboxDetails
    LOCKBOX_PARTNER_ENUM = [
      LOCKBOX_PARTNER_FAAAS = 'FAAAS'.freeze,
      LOCKBOX_PARTNER_CANARY = 'CANARY'.freeze
    ].freeze

    # Lockbox Identifier
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The unique identifier (OCID) of the customer's resource.
    # @return [String]
    attr_accessor :resource_id

    # The partner using this lockbox to lock a resource.
    # @return [String]
    attr_reader :lockbox_partner

    # **[Required]** The unique identifier (OCID) of the compartment where the resource is located.
    # @return [String]
    attr_accessor :compartment_id

    # The unique identifier (OCID) of partner resource using this lockbox to lock a resource
    # @return [String]
    attr_accessor :partner_id

    # Compartment Identifier
    # @return [String]
    attr_accessor :partner_compartment_id

    # Approval template ID
    # @return [String]
    attr_accessor :approval_template_id

    # The maximum amount of time operator has access to associated resources.
    # @return [String]
    attr_accessor :max_access_duration

    # This attribute is required.
    # @return [OCI::Lockbox::Models::AccessContextAttributeCollection]
    attr_accessor :access_context_attributes

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'resource_id': :'resourceId',
        'lockbox_partner': :'lockboxPartner',
        'compartment_id': :'compartmentId',
        'partner_id': :'partnerId',
        'partner_compartment_id': :'partnerCompartmentId',
        'approval_template_id': :'approvalTemplateId',
        'max_access_duration': :'maxAccessDuration',
        'access_context_attributes': :'accessContextAttributes',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'resource_id': :'String',
        'lockbox_partner': :'String',
        'compartment_id': :'String',
        'partner_id': :'String',
        'partner_compartment_id': :'String',
        'approval_template_id': :'String',
        'max_access_duration': :'String',
        'access_context_attributes': :'OCI::Lockbox::Models::AccessContextAttributeCollection',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :lockbox_partner The value to assign to the {#lockbox_partner} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :partner_id The value to assign to the {#partner_id} property
    # @option attributes [String] :partner_compartment_id The value to assign to the {#partner_compartment_id} property
    # @option attributes [String] :approval_template_id The value to assign to the {#approval_template_id} property
    # @option attributes [String] :max_access_duration The value to assign to the {#max_access_duration} property
    # @option attributes [OCI::Lockbox::Models::AccessContextAttributeCollection] :access_context_attributes The value to assign to the {#access_context_attributes} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.lockbox_partner = attributes[:'lockboxPartner'] if attributes[:'lockboxPartner']

      raise 'You cannot provide both :lockboxPartner and :lockbox_partner' if attributes.key?(:'lockboxPartner') && attributes.key?(:'lockbox_partner')

      self.lockbox_partner = attributes[:'lockbox_partner'] if attributes[:'lockbox_partner']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.partner_id = attributes[:'partnerId'] if attributes[:'partnerId']

      raise 'You cannot provide both :partnerId and :partner_id' if attributes.key?(:'partnerId') && attributes.key?(:'partner_id')

      self.partner_id = attributes[:'partner_id'] if attributes[:'partner_id']

      self.partner_compartment_id = attributes[:'partnerCompartmentId'] if attributes[:'partnerCompartmentId']

      raise 'You cannot provide both :partnerCompartmentId and :partner_compartment_id' if attributes.key?(:'partnerCompartmentId') && attributes.key?(:'partner_compartment_id')

      self.partner_compartment_id = attributes[:'partner_compartment_id'] if attributes[:'partner_compartment_id']

      self.approval_template_id = attributes[:'approvalTemplateId'] if attributes[:'approvalTemplateId']

      raise 'You cannot provide both :approvalTemplateId and :approval_template_id' if attributes.key?(:'approvalTemplateId') && attributes.key?(:'approval_template_id')

      self.approval_template_id = attributes[:'approval_template_id'] if attributes[:'approval_template_id']

      self.max_access_duration = attributes[:'maxAccessDuration'] if attributes[:'maxAccessDuration']

      raise 'You cannot provide both :maxAccessDuration and :max_access_duration' if attributes.key?(:'maxAccessDuration') && attributes.key?(:'max_access_duration')

      self.max_access_duration = attributes[:'max_access_duration'] if attributes[:'max_access_duration']

      self.access_context_attributes = attributes[:'accessContextAttributes'] if attributes[:'accessContextAttributes']

      raise 'You cannot provide both :accessContextAttributes and :access_context_attributes' if attributes.key?(:'accessContextAttributes') && attributes.key?(:'access_context_attributes')

      self.access_context_attributes = attributes[:'access_context_attributes'] if attributes[:'access_context_attributes']

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
    # @param [Object] lockbox_partner Object to be assigned
    def lockbox_partner=(lockbox_partner)
      raise "Invalid value for 'lockbox_partner': this must be one of the values in LOCKBOX_PARTNER_ENUM." if lockbox_partner && !LOCKBOX_PARTNER_ENUM.include?(lockbox_partner)

      @lockbox_partner = lockbox_partner
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        resource_id == other.resource_id &&
        lockbox_partner == other.lockbox_partner &&
        compartment_id == other.compartment_id &&
        partner_id == other.partner_id &&
        partner_compartment_id == other.partner_compartment_id &&
        approval_template_id == other.approval_template_id &&
        max_access_duration == other.max_access_duration &&
        access_context_attributes == other.access_context_attributes &&
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
      [display_name, resource_id, lockbox_partner, compartment_id, partner_id, partner_compartment_id, approval_template_id, max_access_duration, access_context_attributes, freeform_tags, defined_tags].hash
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
