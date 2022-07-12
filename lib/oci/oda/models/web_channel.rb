# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'channel'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration for a Web channel.
  class Oda::Models::WebChannel < Oda::Models::Channel
    # The maximum time until the token expires (in minutes).
    # @return [Integer]
    attr_accessor :max_token_expiration_time_in_minutes

    # **[Required]** Whether client authentication is enabled or not.
    # @return [BOOLEAN]
    attr_accessor :is_client_authentication_enabled

    # A comma-delimited whitelist of allowed domains.
    #
    # The channel will only communicate with the sites from the domains that you add to this list.
    # For example, *.corp.example.com, *.hdr.example.com. Entering a single asterisk (*) allows unrestricted access
    # to the channel from any domain.
    #
    # Typically, you'd only enter a single asterisk during development. For production, you would add an allowlist of domains.
    #
    # @return [String]
    attr_accessor :allowed_domains

    # The ID of the Skill or Digital Assistant that the Channel is routed to.
    # @return [String]
    attr_accessor :bot_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'description': :'description',
        'category': :'category',
        'type': :'type',
        'session_expiry_duration_in_milliseconds': :'sessionExpiryDurationInMilliseconds',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'max_token_expiration_time_in_minutes': :'maxTokenExpirationTimeInMinutes',
        'is_client_authentication_enabled': :'isClientAuthenticationEnabled',
        'allowed_domains': :'allowedDomains',
        'bot_id': :'botId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'description': :'String',
        'category': :'String',
        'type': :'String',
        'session_expiry_duration_in_milliseconds': :'Integer',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'max_token_expiration_time_in_minutes': :'Integer',
        'is_client_authentication_enabled': :'BOOLEAN',
        'allowed_domains': :'String',
        'bot_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Oda::Models::Channel#id #id} proprety
    # @option attributes [String] :name The value to assign to the {OCI::Oda::Models::Channel#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Oda::Models::Channel#description #description} proprety
    # @option attributes [String] :category The value to assign to the {OCI::Oda::Models::Channel#category #category} proprety
    # @option attributes [Integer] :session_expiry_duration_in_milliseconds The value to assign to the {OCI::Oda::Models::Channel#session_expiry_duration_in_milliseconds #session_expiry_duration_in_milliseconds} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Oda::Models::Channel#lifecycle_state #lifecycle_state} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Oda::Models::Channel#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Oda::Models::Channel#time_updated #time_updated} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Oda::Models::Channel#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Oda::Models::Channel#defined_tags #defined_tags} proprety
    # @option attributes [Integer] :max_token_expiration_time_in_minutes The value to assign to the {#max_token_expiration_time_in_minutes} property
    # @option attributes [BOOLEAN] :is_client_authentication_enabled The value to assign to the {#is_client_authentication_enabled} property
    # @option attributes [String] :allowed_domains The value to assign to the {#allowed_domains} property
    # @option attributes [String] :bot_id The value to assign to the {#bot_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'WEB'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.max_token_expiration_time_in_minutes = attributes[:'maxTokenExpirationTimeInMinutes'] if attributes[:'maxTokenExpirationTimeInMinutes']

      raise 'You cannot provide both :maxTokenExpirationTimeInMinutes and :max_token_expiration_time_in_minutes' if attributes.key?(:'maxTokenExpirationTimeInMinutes') && attributes.key?(:'max_token_expiration_time_in_minutes')

      self.max_token_expiration_time_in_minutes = attributes[:'max_token_expiration_time_in_minutes'] if attributes[:'max_token_expiration_time_in_minutes']

      self.is_client_authentication_enabled = attributes[:'isClientAuthenticationEnabled'] unless attributes[:'isClientAuthenticationEnabled'].nil?

      raise 'You cannot provide both :isClientAuthenticationEnabled and :is_client_authentication_enabled' if attributes.key?(:'isClientAuthenticationEnabled') && attributes.key?(:'is_client_authentication_enabled')

      self.is_client_authentication_enabled = attributes[:'is_client_authentication_enabled'] unless attributes[:'is_client_authentication_enabled'].nil?

      self.allowed_domains = attributes[:'allowedDomains'] if attributes[:'allowedDomains']

      raise 'You cannot provide both :allowedDomains and :allowed_domains' if attributes.key?(:'allowedDomains') && attributes.key?(:'allowed_domains')

      self.allowed_domains = attributes[:'allowed_domains'] if attributes[:'allowed_domains']

      self.bot_id = attributes[:'botId'] if attributes[:'botId']

      raise 'You cannot provide both :botId and :bot_id' if attributes.key?(:'botId') && attributes.key?(:'bot_id')

      self.bot_id = attributes[:'bot_id'] if attributes[:'bot_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        type == other.type &&
        session_expiry_duration_in_milliseconds == other.session_expiry_duration_in_milliseconds &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        max_token_expiration_time_in_minutes == other.max_token_expiration_time_in_minutes &&
        is_client_authentication_enabled == other.is_client_authentication_enabled &&
        allowed_domains == other.allowed_domains &&
        bot_id == other.bot_id
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
      [id, name, description, category, type, session_expiry_duration_in_milliseconds, lifecycle_state, time_created, time_updated, freeform_tags, defined_tags, max_token_expiration_time_in_minutes, is_client_authentication_enabled, allowed_domains, bot_id].hash
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
