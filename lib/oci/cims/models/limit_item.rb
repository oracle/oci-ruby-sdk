# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181231
require 'date'
require 'logger'
require_relative 'item'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about the LimitItem object.
  class Cims::Models::LimitItem < Cims::Models::Item
    LIMIT_STATUS_ENUM = [
      LIMIT_STATUS_APPROVED = 'APPROVED'.freeze,
      LIMIT_STATUS_PARTIALLY_APPROVED = 'PARTIALLY_APPROVED'.freeze,
      LIMIT_STATUS_NOT_APPROVED = 'NOT_APPROVED'.freeze,
      LIMIT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The current service limit for the resource.
    # @return [Integer]
    attr_accessor :current_limit

    # The current resource usage.
    # @return [Integer]
    attr_accessor :current_usage

    # The new service limit being requested for the resource.
    # @return [Integer]
    attr_accessor :requested_limit

    # The status of the request.
    # @return [String]
    attr_reader :limit_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'item_key': :'itemKey',
        'name': :'name',
        'type': :'type',
        'category': :'category',
        'sub_category': :'subCategory',
        'issue_type': :'issueType',
        'current_limit': :'currentLimit',
        'current_usage': :'currentUsage',
        'requested_limit': :'requestedLimit',
        'limit_status': :'limitStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'item_key': :'String',
        'name': :'String',
        'type': :'String',
        'category': :'OCI::Cims::Models::Category',
        'sub_category': :'OCI::Cims::Models::SubCategory',
        'issue_type': :'OCI::Cims::Models::IssueType',
        'current_limit': :'Integer',
        'current_usage': :'Integer',
        'requested_limit': :'Integer',
        'limit_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :item_key The value to assign to the {OCI::Cims::Models::Item#item_key #item_key} proprety
    # @option attributes [String] :name The value to assign to the {OCI::Cims::Models::Item#name #name} proprety
    # @option attributes [OCI::Cims::Models::Category] :category The value to assign to the {OCI::Cims::Models::Item#category #category} proprety
    # @option attributes [OCI::Cims::Models::SubCategory] :sub_category The value to assign to the {OCI::Cims::Models::Item#sub_category #sub_category} proprety
    # @option attributes [OCI::Cims::Models::IssueType] :issue_type The value to assign to the {OCI::Cims::Models::Item#issue_type #issue_type} proprety
    # @option attributes [Integer] :current_limit The value to assign to the {#current_limit} property
    # @option attributes [Integer] :current_usage The value to assign to the {#current_usage} property
    # @option attributes [Integer] :requested_limit The value to assign to the {#requested_limit} property
    # @option attributes [String] :limit_status The value to assign to the {#limit_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'limit'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.current_limit = attributes[:'currentLimit'] if attributes[:'currentLimit']

      raise 'You cannot provide both :currentLimit and :current_limit' if attributes.key?(:'currentLimit') && attributes.key?(:'current_limit')

      self.current_limit = attributes[:'current_limit'] if attributes[:'current_limit']

      self.current_usage = attributes[:'currentUsage'] if attributes[:'currentUsage']

      raise 'You cannot provide both :currentUsage and :current_usage' if attributes.key?(:'currentUsage') && attributes.key?(:'current_usage')

      self.current_usage = attributes[:'current_usage'] if attributes[:'current_usage']

      self.requested_limit = attributes[:'requestedLimit'] if attributes[:'requestedLimit']

      raise 'You cannot provide both :requestedLimit and :requested_limit' if attributes.key?(:'requestedLimit') && attributes.key?(:'requested_limit')

      self.requested_limit = attributes[:'requested_limit'] if attributes[:'requested_limit']

      self.limit_status = attributes[:'limitStatus'] if attributes[:'limitStatus']

      raise 'You cannot provide both :limitStatus and :limit_status' if attributes.key?(:'limitStatus') && attributes.key?(:'limit_status')

      self.limit_status = attributes[:'limit_status'] if attributes[:'limit_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] limit_status Object to be assigned
    def limit_status=(limit_status)
      # rubocop:disable Style/ConditionalAssignment
      if limit_status && !LIMIT_STATUS_ENUM.include?(limit_status)
        OCI.logger.debug("Unknown value for 'limit_status' [" + limit_status + "]. Mapping to 'LIMIT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @limit_status = LIMIT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @limit_status = limit_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        item_key == other.item_key &&
        name == other.name &&
        type == other.type &&
        category == other.category &&
        sub_category == other.sub_category &&
        issue_type == other.issue_type &&
        current_limit == other.current_limit &&
        current_usage == other.current_usage &&
        requested_limit == other.requested_limit &&
        limit_status == other.limit_status
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
      [item_key, name, type, category, sub_category, issue_type, current_limit, current_usage, requested_limit, limit_status].hash
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
