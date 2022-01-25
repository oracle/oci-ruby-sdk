# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # WorkRequestResource model.
  class Analytics::Models::WorkRequestResource
    ACTION_RESULT_ENUM = [
      ACTION_RESULT_COMPARTMENT_CHANGED = 'COMPARTMENT_CHANGED'.freeze,
      ACTION_RESULT_CREATED = 'CREATED'.freeze,
      ACTION_RESULT_DELETED = 'DELETED'.freeze,
      ACTION_RESULT_STARTED = 'STARTED'.freeze,
      ACTION_RESULT_STOPPED = 'STOPPED'.freeze,
      ACTION_RESULT_SCALED = 'SCALED'.freeze,
      ACTION_RESULT_NETWORK_ENDPOINT_CHANGED = 'NETWORK_ENDPOINT_CHANGED'.freeze,
      ACTION_RESULT_VANITY_URL_CREATED = 'VANITY_URL_CREATED'.freeze,
      ACTION_RESULT_VANITY_URL_UPDATED = 'VANITY_URL_UPDATED'.freeze,
      ACTION_RESULT_VANITY_URL_DELETED = 'VANITY_URL_DELETED'.freeze,
      ACTION_RESULT_PRIVATE_ACCESS_CHANNEL_CREATED = 'PRIVATE_ACCESS_CHANNEL_CREATED'.freeze,
      ACTION_RESULT_PRIVATE_ACCESS_CHANNEL_UPDATED = 'PRIVATE_ACCESS_CHANNEL_UPDATED'.freeze,
      ACTION_RESULT_PRIVATE_ACCESS_CHANNEL_DELETED = 'PRIVATE_ACCESS_CHANNEL_DELETED'.freeze,
      ACTION_RESULT_NONE = 'NONE'.freeze,
      ACTION_RESULT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_ANALYTICS_INSTANCE = 'ANALYTICS_INSTANCE'.freeze,
      RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The way in which this resource was affected by this work request.
    #
    # @return [String]
    attr_reader :action_result

    # **[Required]** The type of the resource the work request is affecting.
    #
    # @return [String]
    attr_reader :resource_type

    # **[Required]** The OCID of the resource the work request is affecting.
    # @return [String]
    attr_accessor :identifier

    # **[Required]** The URI of the affected resource.
    #
    # @return [String]
    attr_accessor :resource_uri

    # Additional metadata of the resource.
    #
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action_result': :'actionResult',
        'resource_type': :'resourceType',
        'identifier': :'identifier',
        'resource_uri': :'resourceUri',
        'metadata': :'metadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action_result': :'String',
        'resource_type': :'String',
        'identifier': :'String',
        'resource_uri': :'String',
        'metadata': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :action_result The value to assign to the {#action_result} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :identifier The value to assign to the {#identifier} property
    # @option attributes [String] :resource_uri The value to assign to the {#resource_uri} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.action_result = attributes[:'actionResult'] if attributes[:'actionResult']

      raise 'You cannot provide both :actionResult and :action_result' if attributes.key?(:'actionResult') && attributes.key?(:'action_result')

      self.action_result = attributes[:'action_result'] if attributes[:'action_result']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.identifier = attributes[:'identifier'] if attributes[:'identifier']

      self.resource_uri = attributes[:'resourceUri'] if attributes[:'resourceUri']

      raise 'You cannot provide both :resourceUri and :resource_uri' if attributes.key?(:'resourceUri') && attributes.key?(:'resource_uri')

      self.resource_uri = attributes[:'resource_uri'] if attributes[:'resource_uri']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action_result Object to be assigned
    def action_result=(action_result)
      # rubocop:disable Style/ConditionalAssignment
      if action_result && !ACTION_RESULT_ENUM.include?(action_result)
        OCI.logger.debug("Unknown value for 'action_result' [" + action_result + "]. Mapping to 'ACTION_RESULT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action_result = ACTION_RESULT_UNKNOWN_ENUM_VALUE
      else
        @action_result = action_result
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        action_result == other.action_result &&
        resource_type == other.resource_type &&
        identifier == other.identifier &&
        resource_uri == other.resource_uri &&
        metadata == other.metadata
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
      [action_result, resource_type, identifier, resource_uri, metadata].hash
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
