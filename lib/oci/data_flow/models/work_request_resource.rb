# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A resource related to a Data Flow work request.
  #
  class DataFlow::Models::WorkRequestResource
    ACTION_TYPE_ENUM = [
      ACTION_TYPE_CREATED = 'CREATED'.freeze,
      ACTION_TYPE_UPDATED = 'UPDATED'.freeze,
      ACTION_TYPE_DELETED = 'DELETED'.freeze,
      ACTION_TYPE_INPROGRESS = 'INPROGRESS'.freeze,
      ACTION_TYPE_RELATED = 'RELATED'.freeze,
      ACTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The way in which this resource is affected by the work tracked in the work request.
    #
    # @return [String]
    attr_reader :action_type

    # The id of a work request resource object.
    #
    # @return [Integer]
    attr_accessor :id

    # **[Required]** The id of the releated resource. See resourceType to identity the specific type of resource.
    #
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** The type of resource.  See resourceId for the id of the specific resource.
    #
    # @return [String]
    attr_accessor :resource_type

    # The URI path that the user can use to get access to the resource metadata
    #
    # @return [String]
    attr_accessor :resource_uri

    # The OCID of a work request.
    #
    # @return [String]
    attr_accessor :work_requestid

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action_type': :'actionType',
        'id': :'id',
        'resource_id': :'resourceId',
        'resource_type': :'resourceType',
        'resource_uri': :'resourceUri',
        'work_requestid': :'workRequestid'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action_type': :'String',
        'id': :'Integer',
        'resource_id': :'String',
        'resource_type': :'String',
        'resource_uri': :'String',
        'work_requestid': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :action_type The value to assign to the {#action_type} property
    # @option attributes [Integer] :id The value to assign to the {#id} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :resource_uri The value to assign to the {#resource_uri} property
    # @option attributes [String] :work_requestid The value to assign to the {#work_requestid} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.action_type = attributes[:'actionType'] if attributes[:'actionType']

      raise 'You cannot provide both :actionType and :action_type' if attributes.key?(:'actionType') && attributes.key?(:'action_type')

      self.action_type = attributes[:'action_type'] if attributes[:'action_type']

      self.id = attributes[:'id'] if attributes[:'id']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.resource_uri = attributes[:'resourceUri'] if attributes[:'resourceUri']

      raise 'You cannot provide both :resourceUri and :resource_uri' if attributes.key?(:'resourceUri') && attributes.key?(:'resource_uri')

      self.resource_uri = attributes[:'resource_uri'] if attributes[:'resource_uri']

      self.work_requestid = attributes[:'workRequestid'] if attributes[:'workRequestid']

      raise 'You cannot provide both :workRequestid and :work_requestid' if attributes.key?(:'workRequestid') && attributes.key?(:'work_requestid')

      self.work_requestid = attributes[:'work_requestid'] if attributes[:'work_requestid']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action_type Object to be assigned
    def action_type=(action_type)
      # rubocop:disable Style/ConditionalAssignment
      if action_type && !ACTION_TYPE_ENUM.include?(action_type)
        OCI.logger.debug("Unknown value for 'action_type' [" + action_type + "]. Mapping to 'ACTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action_type = ACTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @action_type = action_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        action_type == other.action_type &&
        id == other.id &&
        resource_id == other.resource_id &&
        resource_type == other.resource_type &&
        resource_uri == other.resource_uri &&
        work_requestid == other.work_requestid
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
      [action_type, id, resource_id, resource_type, resource_uri, work_requestid].hash
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
