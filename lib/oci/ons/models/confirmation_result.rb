# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The confirmation details for the specified subscription.
  #
  class Ons::Models::ConfirmationResult
    # **[Required]** The name of the subscribed topic.
    #
    # @return [String]
    attr_accessor :topic_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the topic associated with the specified subscription.
    #
    # @return [String]
    attr_accessor :topic_id

    # **[Required]** The endpoint of the subscription. Valid values depend on the protocol.
    # For EMAIL, only an email address is valid. For HTTPS, only a PagerDuty URL is valid. A URL cannot exceed 512 characters.
    #
    # @return [String]
    attr_accessor :endpoint

    # **[Required]** The URL for unsubscribing from the topic.
    # @return [String]
    attr_accessor :unsubscribe_url

    # **[Required]** A human-readable string indicating the status of the subscription confirmation.
    # @return [String]
    attr_accessor :message

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subscription specified in the request.
    # @return [String]
    attr_accessor :subscription_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'topic_name': :'topicName',
        'topic_id': :'topicId',
        'endpoint': :'endpoint',
        'unsubscribe_url': :'unsubscribeUrl',
        'message': :'message',
        'subscription_id': :'subscriptionId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'topic_name': :'String',
        'topic_id': :'String',
        'endpoint': :'String',
        'unsubscribe_url': :'String',
        'message': :'String',
        'subscription_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :topic_name The value to assign to the {#topic_name} property
    # @option attributes [String] :topic_id The value to assign to the {#topic_id} property
    # @option attributes [String] :endpoint The value to assign to the {#endpoint} property
    # @option attributes [String] :unsubscribe_url The value to assign to the {#unsubscribe_url} property
    # @option attributes [String] :message The value to assign to the {#message} property
    # @option attributes [String] :subscription_id The value to assign to the {#subscription_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.topic_name = attributes[:'topicName'] if attributes[:'topicName']

      raise 'You cannot provide both :topicName and :topic_name' if attributes.key?(:'topicName') && attributes.key?(:'topic_name')

      self.topic_name = attributes[:'topic_name'] if attributes[:'topic_name']

      self.topic_id = attributes[:'topicId'] if attributes[:'topicId']

      raise 'You cannot provide both :topicId and :topic_id' if attributes.key?(:'topicId') && attributes.key?(:'topic_id')

      self.topic_id = attributes[:'topic_id'] if attributes[:'topic_id']

      self.endpoint = attributes[:'endpoint'] if attributes[:'endpoint']

      self.unsubscribe_url = attributes[:'unsubscribeUrl'] if attributes[:'unsubscribeUrl']

      raise 'You cannot provide both :unsubscribeUrl and :unsubscribe_url' if attributes.key?(:'unsubscribeUrl') && attributes.key?(:'unsubscribe_url')

      self.unsubscribe_url = attributes[:'unsubscribe_url'] if attributes[:'unsubscribe_url']

      self.message = attributes[:'message'] if attributes[:'message']

      self.subscription_id = attributes[:'subscriptionId'] if attributes[:'subscriptionId']

      raise 'You cannot provide both :subscriptionId and :subscription_id' if attributes.key?(:'subscriptionId') && attributes.key?(:'subscription_id')

      self.subscription_id = attributes[:'subscription_id'] if attributes[:'subscription_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        topic_name == other.topic_name &&
        topic_id == other.topic_id &&
        endpoint == other.endpoint &&
        unsubscribe_url == other.unsubscribe_url &&
        message == other.message &&
        subscription_id == other.subscription_id
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
      [topic_name, topic_id, endpoint, unsubscribe_url, message, subscription_id].hash
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
