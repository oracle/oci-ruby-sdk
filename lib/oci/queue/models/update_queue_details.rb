# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210201
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information to be updated.
  class Queue::Models::UpdateQueueDetails
    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the queue.
    # @return [String]
    attr_accessor :display_name

    # The default visibility timeout of the messages consumed from the queue, in seconds.
    # @return [Integer]
    attr_accessor :visibility_in_seconds

    # The default polling timeout of the messages in the queue, in seconds.
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # The percentage of allocated queue resources that can be consumed by a single channel. For example, if a queue has a storage limit of 2Gb, and a single channel consumption limit is 0.1 (10%), that means data size of a single channel  can't exceed 200Mb. Consumption limit of 100% (default) means that a single channel can consume up-to all allocated queue's resources.
    # @return [Integer]
    attr_accessor :channel_consumption_limit

    # The number of times a message can be delivered to a consumer before being moved to the dead letter queue.
    # A value of 0 indicates that the DLQ is not used.
    # Changing that value to a lower threshold does not retroactively move in-flight messages in the dead letter queue.
    #
    # @return [Integer]
    attr_accessor :dead_letter_queue_delivery_count

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the custom encryption key to be used to encrypt messages content. A string with a length of 0 means the custom key should be removed from queue.
    # @return [String]
    attr_accessor :custom_encryption_key_id

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
        'visibility_in_seconds': :'visibilityInSeconds',
        'timeout_in_seconds': :'timeoutInSeconds',
        'channel_consumption_limit': :'channelConsumptionLimit',
        'dead_letter_queue_delivery_count': :'deadLetterQueueDeliveryCount',
        'custom_encryption_key_id': :'customEncryptionKeyId',
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
        'visibility_in_seconds': :'Integer',
        'timeout_in_seconds': :'Integer',
        'channel_consumption_limit': :'Integer',
        'dead_letter_queue_delivery_count': :'Integer',
        'custom_encryption_key_id': :'String',
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
    # @option attributes [Integer] :visibility_in_seconds The value to assign to the {#visibility_in_seconds} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    # @option attributes [Integer] :channel_consumption_limit The value to assign to the {#channel_consumption_limit} property
    # @option attributes [Integer] :dead_letter_queue_delivery_count The value to assign to the {#dead_letter_queue_delivery_count} property
    # @option attributes [String] :custom_encryption_key_id The value to assign to the {#custom_encryption_key_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.visibility_in_seconds = attributes[:'visibilityInSeconds'] if attributes[:'visibilityInSeconds']

      raise 'You cannot provide both :visibilityInSeconds and :visibility_in_seconds' if attributes.key?(:'visibilityInSeconds') && attributes.key?(:'visibility_in_seconds')

      self.visibility_in_seconds = attributes[:'visibility_in_seconds'] if attributes[:'visibility_in_seconds']

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']

      self.channel_consumption_limit = attributes[:'channelConsumptionLimit'] if attributes[:'channelConsumptionLimit']

      raise 'You cannot provide both :channelConsumptionLimit and :channel_consumption_limit' if attributes.key?(:'channelConsumptionLimit') && attributes.key?(:'channel_consumption_limit')

      self.channel_consumption_limit = attributes[:'channel_consumption_limit'] if attributes[:'channel_consumption_limit']

      self.dead_letter_queue_delivery_count = attributes[:'deadLetterQueueDeliveryCount'] if attributes[:'deadLetterQueueDeliveryCount']

      raise 'You cannot provide both :deadLetterQueueDeliveryCount and :dead_letter_queue_delivery_count' if attributes.key?(:'deadLetterQueueDeliveryCount') && attributes.key?(:'dead_letter_queue_delivery_count')

      self.dead_letter_queue_delivery_count = attributes[:'dead_letter_queue_delivery_count'] if attributes[:'dead_letter_queue_delivery_count']

      self.custom_encryption_key_id = attributes[:'customEncryptionKeyId'] if attributes[:'customEncryptionKeyId']

      raise 'You cannot provide both :customEncryptionKeyId and :custom_encryption_key_id' if attributes.key?(:'customEncryptionKeyId') && attributes.key?(:'custom_encryption_key_id')

      self.custom_encryption_key_id = attributes[:'custom_encryption_key_id'] if attributes[:'custom_encryption_key_id']

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
        display_name == other.display_name &&
        visibility_in_seconds == other.visibility_in_seconds &&
        timeout_in_seconds == other.timeout_in_seconds &&
        channel_consumption_limit == other.channel_consumption_limit &&
        dead_letter_queue_delivery_count == other.dead_letter_queue_delivery_count &&
        custom_encryption_key_id == other.custom_encryption_key_id &&
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
      [display_name, visibility_in_seconds, timeout_in_seconds, channel_consumption_limit, dead_letter_queue_delivery_count, custom_encryption_key_id, freeform_tags, defined_tags].hash
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
