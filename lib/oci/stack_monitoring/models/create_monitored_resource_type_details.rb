# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210330
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about new monitored resource type. The resource type name should be unique across tenancy.
  # A set of resource types are created by the service by default. These resource types are available
  # for all tenancies. Service provided resource types can not be duplicated or overwritten in any tenancy.
  #
  class StackMonitoring::Models::CreateMonitoredResourceTypeDetails
    SOURCE_TYPE_ENUM = [
      SOURCE_TYPE_SM_MGMT_AGENT_MONITORED = 'SM_MGMT_AGENT_MONITORED'.freeze,
      SOURCE_TYPE_SM_REPO_ONLY = 'SM_REPO_ONLY'.freeze,
      SOURCE_TYPE_OCI_NATIVE = 'OCI_NATIVE'.freeze,
      SOURCE_TYPE_PROMETHEUS = 'PROMETHEUS'.freeze,
      SOURCE_TYPE_TELEGRAF = 'TELEGRAF'.freeze,
      SOURCE_TYPE_COLLECTD = 'COLLECTD'.freeze
    ].freeze

    RESOURCE_CATEGORY_ENUM = [
      RESOURCE_CATEGORY_APPLICATION = 'APPLICATION'.freeze,
      RESOURCE_CATEGORY_DATABASE = 'DATABASE'.freeze,
      RESOURCE_CATEGORY_MIDDLEWARE = 'MIDDLEWARE'.freeze,
      RESOURCE_CATEGORY_UNKNOWN = 'UNKNOWN'.freeze
    ].freeze

    # **[Required]** A unique monitored resource type name. The name must be unique across tenancy.
    # Name can not be changed.
    #
    # @return [String]
    attr_accessor :name

    # Monitored resource type display name.
    # @return [String]
    attr_accessor :display_name

    # A friendly description.
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the tenancy containing the resource type.
    #
    # @return [String]
    attr_accessor :compartment_id

    # Metric namespace for resource type.
    # @return [String]
    attr_accessor :metric_namespace

    # Source type to indicate if the resource is stack monitoring discovered, OCI native resource, etc.
    #
    # @return [String]
    attr_reader :source_type

    # Resource Category to indicate the kind of resource type.
    #
    # @return [String]
    attr_reader :resource_category

    # @return [OCI::StackMonitoring::Models::ResourceTypeMetadataDetails]
    attr_accessor :metadata

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
        'name': :'name',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'metric_namespace': :'metricNamespace',
        'source_type': :'sourceType',
        'resource_category': :'resourceCategory',
        'metadata': :'metadata',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'metric_namespace': :'String',
        'source_type': :'String',
        'resource_category': :'String',
        'metadata': :'OCI::StackMonitoring::Models::ResourceTypeMetadataDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :metric_namespace The value to assign to the {#metric_namespace} property
    # @option attributes [String] :source_type The value to assign to the {#source_type} property
    # @option attributes [String] :resource_category The value to assign to the {#resource_category} property
    # @option attributes [OCI::StackMonitoring::Models::ResourceTypeMetadataDetails] :metadata The value to assign to the {#metadata} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.metric_namespace = attributes[:'metricNamespace'] if attributes[:'metricNamespace']

      raise 'You cannot provide both :metricNamespace and :metric_namespace' if attributes.key?(:'metricNamespace') && attributes.key?(:'metric_namespace')

      self.metric_namespace = attributes[:'metric_namespace'] if attributes[:'metric_namespace']

      self.source_type = attributes[:'sourceType'] if attributes[:'sourceType']

      raise 'You cannot provide both :sourceType and :source_type' if attributes.key?(:'sourceType') && attributes.key?(:'source_type')

      self.source_type = attributes[:'source_type'] if attributes[:'source_type']

      self.resource_category = attributes[:'resourceCategory'] if attributes[:'resourceCategory']

      raise 'You cannot provide both :resourceCategory and :resource_category' if attributes.key?(:'resourceCategory') && attributes.key?(:'resource_category')

      self.resource_category = attributes[:'resource_category'] if attributes[:'resource_category']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source_type Object to be assigned
    def source_type=(source_type)
      raise "Invalid value for 'source_type': this must be one of the values in SOURCE_TYPE_ENUM." if source_type && !SOURCE_TYPE_ENUM.include?(source_type)

      @source_type = source_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_category Object to be assigned
    def resource_category=(resource_category)
      raise "Invalid value for 'resource_category': this must be one of the values in RESOURCE_CATEGORY_ENUM." if resource_category && !RESOURCE_CATEGORY_ENUM.include?(resource_category)

      @resource_category = resource_category
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        metric_namespace == other.metric_namespace &&
        source_type == other.source_type &&
        resource_category == other.resource_category &&
        metadata == other.metadata &&
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
      [name, display_name, description, compartment_id, metric_namespace, source_type, resource_category, metadata, freeform_tags, defined_tags].hash
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
