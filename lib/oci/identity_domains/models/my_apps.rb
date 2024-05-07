# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The SCIM protocol defines a standard set of query parameters that can be used to filter, sort, and paginate to return zero or more resources in a query response. Queries MAY be made against a single resource or a resource type endpoint (e.g., /Users), or the service provider Base URI.
  class IdentityDomains::Models::MyApps
    # **[Required]** The schemas attribute is an array of Strings which allows introspection of the supported schema version for a SCIM representation as well any schema extensions supported by that representation. Each String value must be a unique URI. All representations of SCIM schema MUST include a non-zero value array with value(s) of the URIs supported by that representation. Duplicate values MUST NOT be included. Value order is not specified and MUST not impact behavior. REQUIRED.
    # @return [Array<String>]
    attr_accessor :schemas

    # **[Required]** The total number of results returned by the list or query operation.  The value may be larger than the number of resources returned such as when returning a single page of results where multiple pages are available. REQUIRED.
    # @return [Integer]
    attr_accessor :total_results

    # **[Required]** A multi-valued list of complex objects containing the requested resources. This MAY be a subset of the full set of resources if pagination is requested. REQUIRED if \"totalResults\" is non-zero.
    # @return [Array<OCI::IdentityDomains::Models::MyApp>]
    attr_accessor :resources

    # **[Required]** The 1-based index of the first result in the current set of list results.  REQUIRED when partial results returned due to pagination.
    # @return [Integer]
    attr_accessor :start_index

    # **[Required]** The number of resources returned in a list response page. REQUIRED when partial results returned due to pagination.
    # @return [Integer]
    attr_accessor :items_per_page

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'schemas': :'schemas',
        'total_results': :'totalResults',
        'resources': :'Resources',
        'start_index': :'startIndex',
        'items_per_page': :'itemsPerPage'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'schemas': :'Array<String>',
        'total_results': :'Integer',
        'resources': :'Array<OCI::IdentityDomains::Models::MyApp>',
        'start_index': :'Integer',
        'items_per_page': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :schemas The value to assign to the {#schemas} property
    # @option attributes [Integer] :total_results The value to assign to the {#total_results} property
    # @option attributes [Array<OCI::IdentityDomains::Models::MyApp>] :resources The value to assign to the {#resources} property
    # @option attributes [Integer] :start_index The value to assign to the {#start_index} property
    # @option attributes [Integer] :items_per_page The value to assign to the {#items_per_page} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.schemas = attributes[:'schemas'] if attributes[:'schemas']

      self.total_results = attributes[:'totalResults'] if attributes[:'totalResults']

      raise 'You cannot provide both :totalResults and :total_results' if attributes.key?(:'totalResults') && attributes.key?(:'total_results')

      self.total_results = attributes[:'total_results'] if attributes[:'total_results']

      self.resources = attributes[:'Resources'] if attributes[:'Resources']

      self.start_index = attributes[:'startIndex'] if attributes[:'startIndex']

      raise 'You cannot provide both :startIndex and :start_index' if attributes.key?(:'startIndex') && attributes.key?(:'start_index')

      self.start_index = attributes[:'start_index'] if attributes[:'start_index']

      self.items_per_page = attributes[:'itemsPerPage'] if attributes[:'itemsPerPage']

      raise 'You cannot provide both :itemsPerPage and :items_per_page' if attributes.key?(:'itemsPerPage') && attributes.key?(:'items_per_page')

      self.items_per_page = attributes[:'items_per_page'] if attributes[:'items_per_page']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        schemas == other.schemas &&
        total_results == other.total_results &&
        resources == other.resources &&
        start_index == other.start_index &&
        items_per_page == other.items_per_page
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
      [schemas, total_results, resources, start_index, items_per_page].hash
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
