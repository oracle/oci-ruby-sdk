# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'config'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A metric group defines a set of metrics to collect from a span. It uses a span filter to specify which spans to
  # process. The set is then published to a namespace, which is a product level subdivision of metrics.
  #
  class ApmConfig::Models::MetricGroup < ApmConfig::Models::Config
    # The name by which a configuration entity is displayed to the end user.
    # @return [String]
    attr_accessor :display_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a Span Filter. The filterId is mandatory for the creation
    # of MetricGroups. A filterId is generated when a Span Filter is created.
    #
    # @return [String]
    attr_accessor :filter_id

    # The namespace to which the metrics are published. It must be one of several predefined namespaces.
    #
    # @return [String]
    attr_accessor :namespace

    # A list of dimensions for the metric. This variable should not be used.
    # @return [Array<OCI::ApmConfig::Models::Dimension>]
    attr_accessor :dimensions

    # The list of metrics in this group.
    #
    # @return [Array<OCI::ApmConfig::Models::Metric>]
    attr_accessor :metrics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'config_type': :'configType',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'filter_id': :'filterId',
        'namespace': :'namespace',
        'dimensions': :'dimensions',
        'metrics': :'metrics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'config_type': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'filter_id': :'String',
        'namespace': :'String',
        'dimensions': :'Array<OCI::ApmConfig::Models::Dimension>',
        'metrics': :'Array<OCI::ApmConfig::Models::Metric>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::ApmConfig::Models::Config#id #id} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::ApmConfig::Models::Config#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::ApmConfig::Models::Config#time_updated #time_updated} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::ApmConfig::Models::Config#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::ApmConfig::Models::Config#defined_tags #defined_tags} proprety
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :filter_id The value to assign to the {#filter_id} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [Array<OCI::ApmConfig::Models::Dimension>] :dimensions The value to assign to the {#dimensions} property
    # @option attributes [Array<OCI::ApmConfig::Models::Metric>] :metrics The value to assign to the {#metrics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configType'] = 'METRIC_GROUP'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.filter_id = attributes[:'filterId'] if attributes[:'filterId']

      raise 'You cannot provide both :filterId and :filter_id' if attributes.key?(:'filterId') && attributes.key?(:'filter_id')

      self.filter_id = attributes[:'filter_id'] if attributes[:'filter_id']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.dimensions = attributes[:'dimensions'] if attributes[:'dimensions']

      self.metrics = attributes[:'metrics'] if attributes[:'metrics']
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
        config_type == other.config_type &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        filter_id == other.filter_id &&
        namespace == other.namespace &&
        dimensions == other.dimensions &&
        metrics == other.metrics
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
      [id, config_type, time_created, time_updated, freeform_tags, defined_tags, display_name, filter_id, namespace, dimensions, metrics].hash
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
