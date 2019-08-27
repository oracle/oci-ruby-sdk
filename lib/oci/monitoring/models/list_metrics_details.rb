# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The request details for retrieving metric definitions. Specify optional properties to filter the returned results.
  # Use an asterisk (&#42;) as a wildcard character, placed anywhere in the string.
  # For example, to search for all metrics with names that begin with \"disk\", specify \"name\" as \"disk&#42;\".
  # If no properties are specified, then all metric definitions within the request scope are returned.
  #
  class Monitoring::Models::ListMetricsDetails
    SORT_BY_ENUM = [
      SORT_BY_NAMESPACE = 'NAMESPACE'.freeze,
      SORT_BY_NAME = 'NAME'.freeze,
      SORT_BY_RESOURCEGROUP = 'RESOURCEGROUP'.freeze
    ].freeze

    SORT_ORDER_ENUM = [
      SORT_ORDER_ASC = 'ASC'.freeze,
      SORT_ORDER_DESC = 'DESC'.freeze
    ].freeze

    # The metric name to use when searching for metric definitions.
    #
    # Example: `CpuUtilization`
    #
    # @return [String]
    attr_accessor :name

    # The source service or application to use when searching for metric definitions.
    #
    # Example: `oci_computeagent`
    #
    # @return [String]
    attr_accessor :namespace

    # Resource group that you want to use as a filter. The specified resource group must exist in the definition of the posted metric. Only one resource group can be applied per metric.
    # A valid resourceGroup value starts with an alphabetical character and includes only alphanumeric characters, periods (.), underscores (_), hyphens (-), and dollar signs ($).
    # Avoid entering confidential information.
    #
    # Example: `frontend-fleet`
    #
    # @return [String]
    attr_accessor :resource_group

    # Qualifiers that you want to use when searching for metric definitions.
    # Available dimensions vary by metric namespace. Each dimension takes the form of a key-value pair.
    #
    # Example: { \"resourceId\": \"<var>&lt;instance_OCID&gt;</var>\" }
    #
    # @return [Hash<String, String>]
    attr_accessor :dimension_filters

    # Group metrics by these fields in the response. For example, to list all metric namespaces available
    #           in a compartment, groupBy the \"namespace\" field. Supported fields: namespace, name, resourceGroup.
    #
    # Example - group by namespace:
    # `[ \"namespace\" ]`
    #
    # @return [Array<String>]
    attr_accessor :group_by

    # The field to use when sorting returned metric definitions. Only one sorting level is provided.
    #
    # Example: `NAMESPACE`
    #
    # @return [String]
    attr_reader :sort_by

    # The sort order to use when sorting returned metric definitions. Ascending (ASC) or
    # descending (DESC).
    #
    # Example: `ASC`
    #
    # @return [String]
    attr_reader :sort_order

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'namespace': :'namespace',
        'resource_group': :'resourceGroup',
        'dimension_filters': :'dimensionFilters',
        'group_by': :'groupBy',
        'sort_by': :'sortBy',
        'sort_order': :'sortOrder'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'namespace': :'String',
        'resource_group': :'String',
        'dimension_filters': :'Hash<String, String>',
        'group_by': :'Array<String>',
        'sort_by': :'String',
        'sort_order': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :resource_group The value to assign to the {#resource_group} property
    # @option attributes [Hash<String, String>] :dimension_filters The value to assign to the {#dimension_filters} property
    # @option attributes [Array<String>] :group_by The value to assign to the {#group_by} property
    # @option attributes [String] :sort_by The value to assign to the {#sort_by} property
    # @option attributes [String] :sort_order The value to assign to the {#sort_order} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.resource_group = attributes[:'resourceGroup'] if attributes[:'resourceGroup']

      raise 'You cannot provide both :resourceGroup and :resource_group' if attributes.key?(:'resourceGroup') && attributes.key?(:'resource_group')

      self.resource_group = attributes[:'resource_group'] if attributes[:'resource_group']

      self.dimension_filters = attributes[:'dimensionFilters'] if attributes[:'dimensionFilters']

      raise 'You cannot provide both :dimensionFilters and :dimension_filters' if attributes.key?(:'dimensionFilters') && attributes.key?(:'dimension_filters')

      self.dimension_filters = attributes[:'dimension_filters'] if attributes[:'dimension_filters']

      self.group_by = attributes[:'groupBy'] if attributes[:'groupBy']

      raise 'You cannot provide both :groupBy and :group_by' if attributes.key?(:'groupBy') && attributes.key?(:'group_by')

      self.group_by = attributes[:'group_by'] if attributes[:'group_by']

      self.sort_by = attributes[:'sortBy'] if attributes[:'sortBy']

      raise 'You cannot provide both :sortBy and :sort_by' if attributes.key?(:'sortBy') && attributes.key?(:'sort_by')

      self.sort_by = attributes[:'sort_by'] if attributes[:'sort_by']

      self.sort_order = attributes[:'sortOrder'] if attributes[:'sortOrder']

      raise 'You cannot provide both :sortOrder and :sort_order' if attributes.key?(:'sortOrder') && attributes.key?(:'sort_order')

      self.sort_order = attributes[:'sort_order'] if attributes[:'sort_order']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        name == other.name &&
        namespace == other.namespace &&
        resource_group == other.resource_group &&
        dimension_filters == other.dimension_filters &&
        group_by == other.group_by &&
        sort_by == other.sort_by &&
        sort_order == other.sort_order
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
      [name, namespace, resource_group, dimension_filters, group_by, sort_by, sort_order].hash
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
