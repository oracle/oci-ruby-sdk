# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of an ODA instance attachment.
  class Oda::Models::OdaInstanceAttachment
    ATTACHMENT_TYPE_ENUM = [
      ATTACHMENT_TYPE_FUSION = 'FUSION'.freeze,
      ATTACHMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ATTACHING = 'ATTACHING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DETACHING = 'DETACHING'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique immutable identifier that was assigned when the ODA instance attachment was created.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the ODA instance to which the attachment applies.
    # @return [String]
    attr_accessor :instance_id

    # **[Required]** The OCID of the target instance (which could be any other OCI PaaS/SaaS resource), to which the ODA instance is or is being attached.
    # @return [String]
    attr_accessor :attach_to_id

    # **[Required]** The type of attachment defined as an enum.
    # @return [String]
    attr_reader :attachment_type

    # Attachment-specific metadata, defined by the target service.
    # @return [String]
    attr_accessor :attachment_metadata

    # List of operation names that are restricted while this ODA instance is attached.
    # @return [Array<String>]
    attr_accessor :restricted_operations

    # @return [OCI::Oda::Models::OdaInstanceOwner]
    attr_accessor :owner

    # The time the attachment was created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time the attachment was last modified. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_last_update

    # **[Required]** The current state of the attachment.
    # @return [String]
    attr_reader :lifecycle_state

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'instance_id': :'instanceId',
        'attach_to_id': :'attachToId',
        'attachment_type': :'attachmentType',
        'attachment_metadata': :'attachmentMetadata',
        'restricted_operations': :'restrictedOperations',
        'owner': :'owner',
        'time_created': :'timeCreated',
        'time_last_update': :'timeLastUpdate',
        'lifecycle_state': :'lifecycleState',
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
        'instance_id': :'String',
        'attach_to_id': :'String',
        'attachment_type': :'String',
        'attachment_metadata': :'String',
        'restricted_operations': :'Array<String>',
        'owner': :'OCI::Oda::Models::OdaInstanceOwner',
        'time_created': :'DateTime',
        'time_last_update': :'DateTime',
        'lifecycle_state': :'String',
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
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :attach_to_id The value to assign to the {#attach_to_id} property
    # @option attributes [String] :attachment_type The value to assign to the {#attachment_type} property
    # @option attributes [String] :attachment_metadata The value to assign to the {#attachment_metadata} property
    # @option attributes [Array<String>] :restricted_operations The value to assign to the {#restricted_operations} property
    # @option attributes [OCI::Oda::Models::OdaInstanceOwner] :owner The value to assign to the {#owner} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_last_update The value to assign to the {#time_last_update} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.attach_to_id = attributes[:'attachToId'] if attributes[:'attachToId']

      raise 'You cannot provide both :attachToId and :attach_to_id' if attributes.key?(:'attachToId') && attributes.key?(:'attach_to_id')

      self.attach_to_id = attributes[:'attach_to_id'] if attributes[:'attach_to_id']

      self.attachment_type = attributes[:'attachmentType'] if attributes[:'attachmentType']

      raise 'You cannot provide both :attachmentType and :attachment_type' if attributes.key?(:'attachmentType') && attributes.key?(:'attachment_type')

      self.attachment_type = attributes[:'attachment_type'] if attributes[:'attachment_type']

      self.attachment_metadata = attributes[:'attachmentMetadata'] if attributes[:'attachmentMetadata']

      raise 'You cannot provide both :attachmentMetadata and :attachment_metadata' if attributes.key?(:'attachmentMetadata') && attributes.key?(:'attachment_metadata')

      self.attachment_metadata = attributes[:'attachment_metadata'] if attributes[:'attachment_metadata']

      self.restricted_operations = attributes[:'restrictedOperations'] if attributes[:'restrictedOperations']

      raise 'You cannot provide both :restrictedOperations and :restricted_operations' if attributes.key?(:'restrictedOperations') && attributes.key?(:'restricted_operations')

      self.restricted_operations = attributes[:'restricted_operations'] if attributes[:'restricted_operations']

      self.owner = attributes[:'owner'] if attributes[:'owner']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_last_update = attributes[:'timeLastUpdate'] if attributes[:'timeLastUpdate']

      raise 'You cannot provide both :timeLastUpdate and :time_last_update' if attributes.key?(:'timeLastUpdate') && attributes.key?(:'time_last_update')

      self.time_last_update = attributes[:'time_last_update'] if attributes[:'time_last_update']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

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
    # @param [Object] attachment_type Object to be assigned
    def attachment_type=(attachment_type)
      # rubocop:disable Style/ConditionalAssignment
      if attachment_type && !ATTACHMENT_TYPE_ENUM.include?(attachment_type)
        OCI.logger.debug("Unknown value for 'attachment_type' [" + attachment_type + "]. Mapping to 'ATTACHMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @attachment_type = ATTACHMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @attachment_type = attachment_type
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
        instance_id == other.instance_id &&
        attach_to_id == other.attach_to_id &&
        attachment_type == other.attachment_type &&
        attachment_metadata == other.attachment_metadata &&
        restricted_operations == other.restricted_operations &&
        owner == other.owner &&
        time_created == other.time_created &&
        time_last_update == other.time_last_update &&
        lifecycle_state == other.lifecycle_state &&
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
      [id, instance_id, attach_to_id, attachment_type, attachment_metadata, restricted_operations, owner, time_created, time_last_update, lifecycle_state, freeform_tags, defined_tags].hash
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
