# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Clients MAY execute queries without passing parameters on the URL by using the HTTP POST verb combined with the **.search** path extension. The inclusion of **.search** on the end of a valid SCIM endpoint SHALL be used to indicate the HTTP POST verb is intended to be a query operation. To create a new query result set, a SCIM client sends an HTTP POST request to the desired SCIM resource endpoint (ending in **.search**). The body of the POST request MAY include any of the parameters.
  class IdentityDomains::Models::ResourceTypeSchemaAttributeSearchRequest
    ATTRIBUTE_SETS_ENUM = [
      ATTRIBUTE_SETS_ALL = 'all'.freeze,
      ATTRIBUTE_SETS_ALWAYS = 'always'.freeze,
      ATTRIBUTE_SETS_NEVER = 'never'.freeze,
      ATTRIBUTE_SETS_REQUEST = 'request'.freeze,
      ATTRIBUTE_SETS_DEFAULT = 'default'.freeze
    ].freeze

    SORT_ORDER_ENUM = [
      SORT_ORDER_ASCENDING = 'ASCENDING'.freeze,
      SORT_ORDER_DESCENDING = 'DESCENDING'.freeze
    ].freeze

    # **[Required]** The schemas attribute is an array of Strings which allows introspection of the supported schema version for a SCIM representation as well any schema extensions supported by that representation. Each String value must be a unique URI. Query requests MUST be identified using the following URI: \"urn:ietf:params:scim:api:messages:2.0:SearchRequest\" REQUIRED.
    # @return [Array<String>]
    attr_accessor :schemas

    # A multi-valued list of strings indicating the names of resource attributes to return in the response overriding the set of attributes that would be returned by default. Attribute names MUST be in standard attribute notation ([Section 3.10](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.10)) form. See ([additional retrieval query parameters](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.9)). OPTIONAL.
    # @return [Array<String>]
    attr_accessor :attributes

    # A multi-valued list of strings indicating the return type of attribute definition. The specified set of attributes can be fetched by the return type of the attribute. One or more values can be given together to fetch more than one group of attributes. If \"attributes\" query parameter is also available, union of the two is fetched. Valid values : all, always, never, request, default. Values are case-insensitive. OPTIONAL.
    # @return [Array<String>]
    attr_reader :attribute_sets

    # The filter string that is used to request a subset of resources. The filter string MUST be a valid filter expression. See [Section 3.4.2.2](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.4.2.2). OPTIONAL.
    # @return [String]
    attr_accessor :filter

    # A string that indicates the attribute whose value SHALL be used to order the returned responses. The sortBy attribute MUST be in standard attribute notation ([Section 3.10](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.10)) form. See [Sorting section](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.4.2.3). OPTIONAL.
    # @return [String]
    attr_accessor :sort_by

    # A string that indicates the order in which the sortBy parameter is applied. Allowed values are \"ascending\" and \"descending\". See ([Sorting Section](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.4.2.3)). OPTIONAL.
    # @return [String]
    attr_reader :sort_order

    # An integer that indicates the 1-based index of the first query result. See [Pagination Section](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.4.2.4). OPTIONAL.
    # @return [Integer]
    attr_accessor :start_index

    # An integer that indicates the desired maximum number of query results per page. 1000 is the largest value that you can use. See the Pagination section of the System for Cross-Domain Identity Management Protocol specification for more information. ([Section 3.4.2.4](https://tools.ietf.org/html/draft-ietf-scim-api-19#section-3.4.2.4)). OPTIONAL.
    # @return [Integer]
    attr_accessor :count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'schemas': :'schemas',
        'attributes': :'attributes',
        'attribute_sets': :'attributeSets',
        'filter': :'filter',
        'sort_by': :'sortBy',
        'sort_order': :'sortOrder',
        'start_index': :'startIndex',
        'count': :'count'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'schemas': :'Array<String>',
        'attributes': :'Array<String>',
        'attribute_sets': :'Array<String>',
        'filter': :'String',
        'sort_by': :'String',
        'sort_order': :'String',
        'start_index': :'Integer',
        'count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :schemas The value to assign to the {#schemas} property
    # @option attributes [Array<String>] :attributes The value to assign to the {#attributes} property
    # @option attributes [Array<String>] :attribute_sets The value to assign to the {#attribute_sets} property
    # @option attributes [String] :filter The value to assign to the {#filter} property
    # @option attributes [String] :sort_by The value to assign to the {#sort_by} property
    # @option attributes [String] :sort_order The value to assign to the {#sort_order} property
    # @option attributes [Integer] :start_index The value to assign to the {#start_index} property
    # @option attributes [Integer] :count The value to assign to the {#count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.schemas = attributes[:'schemas'] if attributes[:'schemas']

      self.attributes = attributes[:'attributes'] if attributes[:'attributes']

      self.attribute_sets = attributes[:'attributeSets'] if attributes[:'attributeSets']

      raise 'You cannot provide both :attributeSets and :attribute_sets' if attributes.key?(:'attributeSets') && attributes.key?(:'attribute_sets')

      self.attribute_sets = attributes[:'attribute_sets'] if attributes[:'attribute_sets']

      self.filter = attributes[:'filter'] if attributes[:'filter']

      self.sort_by = attributes[:'sortBy'] if attributes[:'sortBy']

      raise 'You cannot provide both :sortBy and :sort_by' if attributes.key?(:'sortBy') && attributes.key?(:'sort_by')

      self.sort_by = attributes[:'sort_by'] if attributes[:'sort_by']

      self.sort_order = attributes[:'sortOrder'] if attributes[:'sortOrder']

      raise 'You cannot provide both :sortOrder and :sort_order' if attributes.key?(:'sortOrder') && attributes.key?(:'sort_order')

      self.sort_order = attributes[:'sort_order'] if attributes[:'sort_order']

      self.start_index = attributes[:'startIndex'] if attributes[:'startIndex']

      raise 'You cannot provide both :startIndex and :start_index' if attributes.key?(:'startIndex') && attributes.key?(:'start_index')

      self.start_index = attributes[:'start_index'] if attributes[:'start_index']

      self.count = attributes[:'count'] if attributes[:'count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] attribute_sets Object to be assigned
    def attribute_sets=(attribute_sets)
      # rubocop:disable Style/ConditionalAssignment
      if attribute_sets.nil?
        @attribute_sets = nil
      else
        attribute_sets.each do |item|
          raise "Invalid value for 'attribute_sets': this must be one of the values in ATTRIBUTE_SETS_ENUM." unless ATTRIBUTE_SETS_ENUM.include?(item)
        end
        @attribute_sets = attribute_sets
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_order Object to be assigned
    def sort_order=(sort_order)
      raise "Invalid value for 'sort_order': this must be one of the values in SORT_ORDER_ENUM." if sort_order && !SORT_ORDER_ENUM.include?(sort_order)

      @sort_order = sort_order
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        schemas == other.schemas &&
        attributes == other.attributes &&
        attribute_sets == other.attribute_sets &&
        filter == other.filter &&
        sort_by == other.sort_by &&
        sort_order == other.sort_order &&
        start_index == other.start_index &&
        count == other.count
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
      [schemas, attributes, attribute_sets, filter, sort_by, sort_order, start_index, count].hash
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
