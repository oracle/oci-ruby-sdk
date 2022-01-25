# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Entity details including whether or not it is eligible for association with the source.
  class LogAnalytics::Models::AssociableEntity
    ELIGIBILITY_STATUS_ENUM = [
      ELIGIBILITY_STATUS_ELIGIBLE = 'ELIGIBLE'.freeze,
      ELIGIBILITY_STATUS_INELIGIBLE = 'INELIGIBLE'.freeze,
      ELIGIBILITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The entity OCID.
    # @return [String]
    attr_accessor :entity_id

    # The name of the entity.
    # @return [String]
    attr_accessor :entity_name

    # The type name of the entity.
    # @return [String]
    attr_accessor :entity_type_name

    # The display name of the entity type.
    # @return [String]
    attr_accessor :entity_type_display_name

    # The entity host.
    # @return [String]
    attr_accessor :host

    # The OCID of the Management Agent.
    # @return [String]
    attr_accessor :agent_id

    # This field indicates whether the entity is (in)eligible to be associated with this source.
    #
    # @return [String]
    attr_reader :eligibility_status

    # The reason the entity is not eligible for association.
    # @return [String]
    attr_accessor :ineligibility_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_id': :'entityId',
        'entity_name': :'entityName',
        'entity_type_name': :'entityTypeName',
        'entity_type_display_name': :'entityTypeDisplayName',
        'host': :'host',
        'agent_id': :'agentId',
        'eligibility_status': :'eligibilityStatus',
        'ineligibility_details': :'ineligibilityDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_id': :'String',
        'entity_name': :'String',
        'entity_type_name': :'String',
        'entity_type_display_name': :'String',
        'host': :'String',
        'agent_id': :'String',
        'eligibility_status': :'String',
        'ineligibility_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :entity_id The value to assign to the {#entity_id} property
    # @option attributes [String] :entity_name The value to assign to the {#entity_name} property
    # @option attributes [String] :entity_type_name The value to assign to the {#entity_type_name} property
    # @option attributes [String] :entity_type_display_name The value to assign to the {#entity_type_display_name} property
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [String] :agent_id The value to assign to the {#agent_id} property
    # @option attributes [String] :eligibility_status The value to assign to the {#eligibility_status} property
    # @option attributes [String] :ineligibility_details The value to assign to the {#ineligibility_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_id = attributes[:'entityId'] if attributes[:'entityId']

      raise 'You cannot provide both :entityId and :entity_id' if attributes.key?(:'entityId') && attributes.key?(:'entity_id')

      self.entity_id = attributes[:'entity_id'] if attributes[:'entity_id']

      self.entity_name = attributes[:'entityName'] if attributes[:'entityName']

      raise 'You cannot provide both :entityName and :entity_name' if attributes.key?(:'entityName') && attributes.key?(:'entity_name')

      self.entity_name = attributes[:'entity_name'] if attributes[:'entity_name']

      self.entity_type_name = attributes[:'entityTypeName'] if attributes[:'entityTypeName']

      raise 'You cannot provide both :entityTypeName and :entity_type_name' if attributes.key?(:'entityTypeName') && attributes.key?(:'entity_type_name')

      self.entity_type_name = attributes[:'entity_type_name'] if attributes[:'entity_type_name']

      self.entity_type_display_name = attributes[:'entityTypeDisplayName'] if attributes[:'entityTypeDisplayName']

      raise 'You cannot provide both :entityTypeDisplayName and :entity_type_display_name' if attributes.key?(:'entityTypeDisplayName') && attributes.key?(:'entity_type_display_name')

      self.entity_type_display_name = attributes[:'entity_type_display_name'] if attributes[:'entity_type_display_name']

      self.host = attributes[:'host'] if attributes[:'host']

      self.agent_id = attributes[:'agentId'] if attributes[:'agentId']

      raise 'You cannot provide both :agentId and :agent_id' if attributes.key?(:'agentId') && attributes.key?(:'agent_id')

      self.agent_id = attributes[:'agent_id'] if attributes[:'agent_id']

      self.eligibility_status = attributes[:'eligibilityStatus'] if attributes[:'eligibilityStatus']

      raise 'You cannot provide both :eligibilityStatus and :eligibility_status' if attributes.key?(:'eligibilityStatus') && attributes.key?(:'eligibility_status')

      self.eligibility_status = attributes[:'eligibility_status'] if attributes[:'eligibility_status']

      self.ineligibility_details = attributes[:'ineligibilityDetails'] if attributes[:'ineligibilityDetails']

      raise 'You cannot provide both :ineligibilityDetails and :ineligibility_details' if attributes.key?(:'ineligibilityDetails') && attributes.key?(:'ineligibility_details')

      self.ineligibility_details = attributes[:'ineligibility_details'] if attributes[:'ineligibility_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] eligibility_status Object to be assigned
    def eligibility_status=(eligibility_status)
      # rubocop:disable Style/ConditionalAssignment
      if eligibility_status && !ELIGIBILITY_STATUS_ENUM.include?(eligibility_status)
        OCI.logger.debug("Unknown value for 'eligibility_status' [" + eligibility_status + "]. Mapping to 'ELIGIBILITY_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @eligibility_status = ELIGIBILITY_STATUS_UNKNOWN_ENUM_VALUE
      else
        @eligibility_status = eligibility_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_id == other.entity_id &&
        entity_name == other.entity_name &&
        entity_type_name == other.entity_type_name &&
        entity_type_display_name == other.entity_type_display_name &&
        host == other.host &&
        agent_id == other.agent_id &&
        eligibility_status == other.eligibility_status &&
        ineligibility_details == other.ineligibility_details
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
      [entity_id, entity_name, entity_type_name, entity_type_display_name, host, agent_id, eligibility_status, ineligibility_details].hash
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
