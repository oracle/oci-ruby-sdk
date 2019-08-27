# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A metric object containing raw metric data points to be posted to the Monitoring service.
  #
  class Monitoring::Models::MetricDataDetails
    # **[Required]** The source service or application emitting the metric.
    #
    # A valid namespace value starts with an alphabetical character and includes only alphanumeric characters and underscores. The \"oci_\" prefix is reserved.
    # Avoid entering confidential information.
    #
    # Example: `my_namespace`
    #
    # @return [String]
    attr_accessor :namespace

    # Resource group to assign to the metric. A resource group is a custom string that can be used as a filter. Only one resource group can be applied per metric.
    # A valid resourceGroup value starts with an alphabetical character and includes only alphanumeric characters, periods (.), underscores (_), hyphens (-), and dollar signs ($).
    # Avoid entering confidential information.
    #
    # Example: `frontend-fleet`
    #
    # @return [String]
    attr_accessor :resource_group

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment to use for metrics.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The name of the metric.
    #
    # A valid name value starts with an alphabetical character and includes only alphanumeric characters, dots, underscores, hyphens, and dollar signs. The `oci_` prefix is reserved.
    # Avoid entering confidential information.
    #
    # Example: `my_app.success_rate`
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** Qualifiers provided in a metric definition. Available dimensions vary by metric namespace.
    # Each dimension takes the form of a key-value pair.
    # A valid dimension key includes only printable ASCII, excluding periods (.) and spaces. The character limit for a dimension key is 256.
    # A valid dimension value includes only Unicode characters. The character limit for a dimension value is 256.
    # Empty strings are not allowed for keys or values. Avoid entering confidential information.
    #
    # Example: `\"resourceId\": \"ocid1.instance.region1.phx.exampleuniqueID\"`
    #
    # @return [Hash<String, String>]
    attr_accessor :dimensions

    # Properties describing metrics. These are not part of the unique fields identifying the metric.
    # Each metadata item takes the form of a key-value pair. The character limit for a metadata key is 256. The character limit for a metadata value is 256.
    #
    # Example: `\"unit\": \"bytes\"`
    #
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # **[Required]** A list of metric values with timestamps. At least one data point is required per call.
    #
    # @return [Array<OCI::Monitoring::Models::Datapoint>]
    attr_accessor :datapoints

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'namespace',
        'resource_group': :'resourceGroup',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'dimensions': :'dimensions',
        'metadata': :'metadata',
        'datapoints': :'datapoints'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'String',
        'resource_group': :'String',
        'compartment_id': :'String',
        'name': :'String',
        'dimensions': :'Hash<String, String>',
        'metadata': :'Hash<String, String>',
        'datapoints': :'Array<OCI::Monitoring::Models::Datapoint>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :resource_group The value to assign to the {#resource_group} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Hash<String, String>] :dimensions The value to assign to the {#dimensions} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [Array<OCI::Monitoring::Models::Datapoint>] :datapoints The value to assign to the {#datapoints} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.resource_group = attributes[:'resourceGroup'] if attributes[:'resourceGroup']

      raise 'You cannot provide both :resourceGroup and :resource_group' if attributes.key?(:'resourceGroup') && attributes.key?(:'resource_group')

      self.resource_group = attributes[:'resource_group'] if attributes[:'resource_group']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.dimensions = attributes[:'dimensions'] if attributes[:'dimensions']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.datapoints = attributes[:'datapoints'] if attributes[:'datapoints']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        namespace == other.namespace &&
        resource_group == other.resource_group &&
        compartment_id == other.compartment_id &&
        name == other.name &&
        dimensions == other.dimensions &&
        metadata == other.metadata &&
        datapoints == other.datapoints
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
      [namespace, resource_group, compartment_id, name, dimensions, metadata, datapoints].hash
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
