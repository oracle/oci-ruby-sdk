# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Required input parameters for retrieving IP Inventory data within the specified compartments of a region.
  #
  class Core::Models::ListIpInventoryDetails
    RESOURCE_TYPE_LIST_ENUM = [
      RESOURCE_TYPE_LIST_RESOURCE = 'Resource'.freeze
    ].freeze

    SORT_BY_ENUM = [
      SORT_BY_DISPLAYNAME = 'DISPLAYNAME'.freeze,
      SORT_BY_UTILIZATION = 'UTILIZATION'.freeze,
      SORT_BY_DNS_HOSTNAME = 'DNS_HOSTNAME'.freeze,
      SORT_BY_REGION = 'REGION'.freeze
    ].freeze

    SORT_ORDER_ENUM = [
      SORT_ORDER_ASC = 'ASC'.freeze,
      SORT_ORDER_DESC = 'DESC'.freeze
    ].freeze

    # **[Required]** Lists the selected regions.
    # @return [Array<String>]
    attr_accessor :region_list

    # **[Required]** List the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartments.
    # @return [Array<String>]
    attr_accessor :compartment_list

    # List of selected filters.
    # @return [BOOLEAN]
    attr_accessor :override_filters

    # The CIDR utilization of a VCN.
    # @return [Float]
    attr_accessor :utilization

    # List of overlapping VCNs.
    # @return [BOOLEAN]
    attr_accessor :overlapping_vcns_only

    # List of IP address types used.
    # @return [Array<OCI::Core::Models::AddressType>]
    attr_accessor :address_type_list

    # List of VCN resource types.
    # @return [Array<String>]
    attr_reader :resource_type_list

    # Filters the results for the specified string.
    # @return [String]
    attr_accessor :search_keyword

    # Provide the sort order (`sortOrder`) to sort the fields such as TIMECREATED in descending or descending order, and DISPLAYNAME in case sensitive.
    #
    # **Note:** For some \"List\" operations (for example, `ListInstances`), sort resources by an availability domain when the resources belong to a single availability domain.
    # If you sort the \"List\" operations without specifying
    # an availability domain, the resources are grouped by availability domains and then sorted.
    #
    # @return [String]
    attr_reader :sort_by

    # Specifies the sort order to use. Select either ascending (`ASC`) or descending (`DESC`) order. The DISPLAYNAME sort order
    # is case sensitive.
    #
    # @return [String]
    attr_reader :sort_order

    # Most List operations paginate results. Results are paginated for the ListInstances operations. When you call a paginated List operation, the response indicates more pages of results by including the opc-next-page header.
    # For more information, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Integer]
    attr_accessor :pagination_offset

    # Specifies the maximum number of results displayed per page for a paginated \"List\" call. For more information, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # Example: `50`
    #
    # @return [Integer]
    attr_accessor :pagination_limit

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'region_list': :'regionList',
        'compartment_list': :'compartmentList',
        'override_filters': :'overrideFilters',
        'utilization': :'utilization',
        'overlapping_vcns_only': :'overlappingVcnsOnly',
        'address_type_list': :'addressTypeList',
        'resource_type_list': :'resourceTypeList',
        'search_keyword': :'searchKeyword',
        'sort_by': :'sortBy',
        'sort_order': :'sortOrder',
        'pagination_offset': :'paginationOffset',
        'pagination_limit': :'paginationLimit'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'region_list': :'Array<String>',
        'compartment_list': :'Array<String>',
        'override_filters': :'BOOLEAN',
        'utilization': :'Float',
        'overlapping_vcns_only': :'BOOLEAN',
        'address_type_list': :'Array<OCI::Core::Models::AddressType>',
        'resource_type_list': :'Array<String>',
        'search_keyword': :'String',
        'sort_by': :'String',
        'sort_order': :'String',
        'pagination_offset': :'Integer',
        'pagination_limit': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :region_list The value to assign to the {#region_list} property
    # @option attributes [Array<String>] :compartment_list The value to assign to the {#compartment_list} property
    # @option attributes [BOOLEAN] :override_filters The value to assign to the {#override_filters} property
    # @option attributes [Float] :utilization The value to assign to the {#utilization} property
    # @option attributes [BOOLEAN] :overlapping_vcns_only The value to assign to the {#overlapping_vcns_only} property
    # @option attributes [Array<OCI::Core::Models::AddressType>] :address_type_list The value to assign to the {#address_type_list} property
    # @option attributes [Array<String>] :resource_type_list The value to assign to the {#resource_type_list} property
    # @option attributes [String] :search_keyword The value to assign to the {#search_keyword} property
    # @option attributes [String] :sort_by The value to assign to the {#sort_by} property
    # @option attributes [String] :sort_order The value to assign to the {#sort_order} property
    # @option attributes [Integer] :pagination_offset The value to assign to the {#pagination_offset} property
    # @option attributes [Integer] :pagination_limit The value to assign to the {#pagination_limit} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.region_list = attributes[:'regionList'] if attributes[:'regionList']

      raise 'You cannot provide both :regionList and :region_list' if attributes.key?(:'regionList') && attributes.key?(:'region_list')

      self.region_list = attributes[:'region_list'] if attributes[:'region_list']

      self.compartment_list = attributes[:'compartmentList'] if attributes[:'compartmentList']

      raise 'You cannot provide both :compartmentList and :compartment_list' if attributes.key?(:'compartmentList') && attributes.key?(:'compartment_list')

      self.compartment_list = attributes[:'compartment_list'] if attributes[:'compartment_list']

      self.override_filters = attributes[:'overrideFilters'] unless attributes[:'overrideFilters'].nil?
      self.override_filters = false if override_filters.nil? && !attributes.key?(:'overrideFilters') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :overrideFilters and :override_filters' if attributes.key?(:'overrideFilters') && attributes.key?(:'override_filters')

      self.override_filters = attributes[:'override_filters'] unless attributes[:'override_filters'].nil?
      self.override_filters = false if override_filters.nil? && !attributes.key?(:'overrideFilters') && !attributes.key?(:'override_filters') # rubocop:disable Style/StringLiterals

      self.utilization = attributes[:'utilization'] if attributes[:'utilization']

      self.overlapping_vcns_only = attributes[:'overlappingVcnsOnly'] unless attributes[:'overlappingVcnsOnly'].nil?
      self.overlapping_vcns_only = false if overlapping_vcns_only.nil? && !attributes.key?(:'overlappingVcnsOnly') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :overlappingVcnsOnly and :overlapping_vcns_only' if attributes.key?(:'overlappingVcnsOnly') && attributes.key?(:'overlapping_vcns_only')

      self.overlapping_vcns_only = attributes[:'overlapping_vcns_only'] unless attributes[:'overlapping_vcns_only'].nil?
      self.overlapping_vcns_only = false if overlapping_vcns_only.nil? && !attributes.key?(:'overlappingVcnsOnly') && !attributes.key?(:'overlapping_vcns_only') # rubocop:disable Style/StringLiterals

      self.address_type_list = attributes[:'addressTypeList'] if attributes[:'addressTypeList']

      raise 'You cannot provide both :addressTypeList and :address_type_list' if attributes.key?(:'addressTypeList') && attributes.key?(:'address_type_list')

      self.address_type_list = attributes[:'address_type_list'] if attributes[:'address_type_list']

      self.resource_type_list = attributes[:'resourceTypeList'] if attributes[:'resourceTypeList']

      raise 'You cannot provide both :resourceTypeList and :resource_type_list' if attributes.key?(:'resourceTypeList') && attributes.key?(:'resource_type_list')

      self.resource_type_list = attributes[:'resource_type_list'] if attributes[:'resource_type_list']

      self.search_keyword = attributes[:'searchKeyword'] if attributes[:'searchKeyword']

      raise 'You cannot provide both :searchKeyword and :search_keyword' if attributes.key?(:'searchKeyword') && attributes.key?(:'search_keyword')

      self.search_keyword = attributes[:'search_keyword'] if attributes[:'search_keyword']

      self.sort_by = attributes[:'sortBy'] if attributes[:'sortBy']
      self.sort_by = "DISPLAYNAME" if sort_by.nil? && !attributes.key?(:'sortBy') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sortBy and :sort_by' if attributes.key?(:'sortBy') && attributes.key?(:'sort_by')

      self.sort_by = attributes[:'sort_by'] if attributes[:'sort_by']
      self.sort_by = "DISPLAYNAME" if sort_by.nil? && !attributes.key?(:'sortBy') && !attributes.key?(:'sort_by') # rubocop:disable Style/StringLiterals

      self.sort_order = attributes[:'sortOrder'] if attributes[:'sortOrder']
      self.sort_order = "ASC" if sort_order.nil? && !attributes.key?(:'sortOrder') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sortOrder and :sort_order' if attributes.key?(:'sortOrder') && attributes.key?(:'sort_order')

      self.sort_order = attributes[:'sort_order'] if attributes[:'sort_order']
      self.sort_order = "ASC" if sort_order.nil? && !attributes.key?(:'sortOrder') && !attributes.key?(:'sort_order') # rubocop:disable Style/StringLiterals

      self.pagination_offset = attributes[:'paginationOffset'] if attributes[:'paginationOffset']
      self.pagination_offset = 0 if pagination_offset.nil? && !attributes.key?(:'paginationOffset') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :paginationOffset and :pagination_offset' if attributes.key?(:'paginationOffset') && attributes.key?(:'pagination_offset')

      self.pagination_offset = attributes[:'pagination_offset'] if attributes[:'pagination_offset']
      self.pagination_offset = 0 if pagination_offset.nil? && !attributes.key?(:'paginationOffset') && !attributes.key?(:'pagination_offset') # rubocop:disable Style/StringLiterals

      self.pagination_limit = attributes[:'paginationLimit'] if attributes[:'paginationLimit']
      self.pagination_limit = 10 if pagination_limit.nil? && !attributes.key?(:'paginationLimit') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :paginationLimit and :pagination_limit' if attributes.key?(:'paginationLimit') && attributes.key?(:'pagination_limit')

      self.pagination_limit = attributes[:'pagination_limit'] if attributes[:'pagination_limit']
      self.pagination_limit = 10 if pagination_limit.nil? && !attributes.key?(:'paginationLimit') && !attributes.key?(:'pagination_limit') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_type_list Object to be assigned
    def resource_type_list=(resource_type_list)
      # rubocop:disable Style/ConditionalAssignment
      if resource_type_list.nil?
        @resource_type_list = nil
      else
        resource_type_list.each do |item|
          raise "Invalid value for 'resource_type_list': this must be one of the values in RESOURCE_TYPE_LIST_ENUM." unless RESOURCE_TYPE_LIST_ENUM.include?(item)
        end
        @resource_type_list = resource_type_list
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_by Object to be assigned
    def sort_by=(sort_by)
      raise "Invalid value for 'sort_by': this must be one of the values in SORT_BY_ENUM." if sort_by && !SORT_BY_ENUM.include?(sort_by)

      @sort_by = sort_by
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
        region_list == other.region_list &&
        compartment_list == other.compartment_list &&
        override_filters == other.override_filters &&
        utilization == other.utilization &&
        overlapping_vcns_only == other.overlapping_vcns_only &&
        address_type_list == other.address_type_list &&
        resource_type_list == other.resource_type_list &&
        search_keyword == other.search_keyword &&
        sort_by == other.sort_by &&
        sort_order == other.sort_order &&
        pagination_offset == other.pagination_offset &&
        pagination_limit == other.pagination_limit
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
      [region_list, compartment_list, override_filters, utilization, overlapping_vcns_only, address_type_list, resource_type_list, search_keyword, sort_by, sort_order, pagination_offset, pagination_limit].hash
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
