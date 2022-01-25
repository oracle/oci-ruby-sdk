# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about updating a VbInstance.
  class VisualBuilder::Models::UpdateVbInstanceDetails
    # Vb Instance Identifier.
    # @return [String]
    attr_accessor :display_name

    # Simple key-value pair that is applied without any predefined name,
    # type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to
    # namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Encrypted IDCS Open ID token. This is required for pre-UCPIS cloud accounts, but not UCPIS, hence not a required parameter
    # @return [String]
    attr_accessor :idcs_open_id

    # The number of Nodes
    # @return [Integer]
    attr_accessor :node_count

    # Enable Visual Builder. If Visual Builder is enabled alredy, then it cannot be disabled.
    # @return [BOOLEAN]
    attr_accessor :is_visual_builder_enabled

    # @return [OCI::VisualBuilder::Models::UpdateCustomEndpointDetails]
    attr_accessor :custom_endpoint

    # A list of alternate custom endpoints to be used for the vb instance URL
    # (contact Oracle for alternateCustomEndpoints availability for a specific instance).
    #
    # @return [Array<OCI::VisualBuilder::Models::UpdateCustomEndpointDetails>]
    attr_accessor :alternate_custom_endpoints

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'idcs_open_id': :'idcsOpenId',
        'node_count': :'nodeCount',
        'is_visual_builder_enabled': :'isVisualBuilderEnabled',
        'custom_endpoint': :'customEndpoint',
        'alternate_custom_endpoints': :'alternateCustomEndpoints'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'idcs_open_id': :'String',
        'node_count': :'Integer',
        'is_visual_builder_enabled': :'BOOLEAN',
        'custom_endpoint': :'OCI::VisualBuilder::Models::UpdateCustomEndpointDetails',
        'alternate_custom_endpoints': :'Array<OCI::VisualBuilder::Models::UpdateCustomEndpointDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :idcs_open_id The value to assign to the {#idcs_open_id} property
    # @option attributes [Integer] :node_count The value to assign to the {#node_count} property
    # @option attributes [BOOLEAN] :is_visual_builder_enabled The value to assign to the {#is_visual_builder_enabled} property
    # @option attributes [OCI::VisualBuilder::Models::UpdateCustomEndpointDetails] :custom_endpoint The value to assign to the {#custom_endpoint} property
    # @option attributes [Array<OCI::VisualBuilder::Models::UpdateCustomEndpointDetails>] :alternate_custom_endpoints The value to assign to the {#alternate_custom_endpoints} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.idcs_open_id = attributes[:'idcsOpenId'] if attributes[:'idcsOpenId']

      raise 'You cannot provide both :idcsOpenId and :idcs_open_id' if attributes.key?(:'idcsOpenId') && attributes.key?(:'idcs_open_id')

      self.idcs_open_id = attributes[:'idcs_open_id'] if attributes[:'idcs_open_id']

      self.node_count = attributes[:'nodeCount'] if attributes[:'nodeCount']

      raise 'You cannot provide both :nodeCount and :node_count' if attributes.key?(:'nodeCount') && attributes.key?(:'node_count')

      self.node_count = attributes[:'node_count'] if attributes[:'node_count']

      self.is_visual_builder_enabled = attributes[:'isVisualBuilderEnabled'] unless attributes[:'isVisualBuilderEnabled'].nil?
      self.is_visual_builder_enabled = true if is_visual_builder_enabled.nil? && !attributes.key?(:'isVisualBuilderEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isVisualBuilderEnabled and :is_visual_builder_enabled' if attributes.key?(:'isVisualBuilderEnabled') && attributes.key?(:'is_visual_builder_enabled')

      self.is_visual_builder_enabled = attributes[:'is_visual_builder_enabled'] unless attributes[:'is_visual_builder_enabled'].nil?
      self.is_visual_builder_enabled = true if is_visual_builder_enabled.nil? && !attributes.key?(:'isVisualBuilderEnabled') && !attributes.key?(:'is_visual_builder_enabled') # rubocop:disable Style/StringLiterals

      self.custom_endpoint = attributes[:'customEndpoint'] if attributes[:'customEndpoint']

      raise 'You cannot provide both :customEndpoint and :custom_endpoint' if attributes.key?(:'customEndpoint') && attributes.key?(:'custom_endpoint')

      self.custom_endpoint = attributes[:'custom_endpoint'] if attributes[:'custom_endpoint']

      self.alternate_custom_endpoints = attributes[:'alternateCustomEndpoints'] if attributes[:'alternateCustomEndpoints']

      raise 'You cannot provide both :alternateCustomEndpoints and :alternate_custom_endpoints' if attributes.key?(:'alternateCustomEndpoints') && attributes.key?(:'alternate_custom_endpoints')

      self.alternate_custom_endpoints = attributes[:'alternate_custom_endpoints'] if attributes[:'alternate_custom_endpoints']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        idcs_open_id == other.idcs_open_id &&
        node_count == other.node_count &&
        is_visual_builder_enabled == other.is_visual_builder_enabled &&
        custom_endpoint == other.custom_endpoint &&
        alternate_custom_endpoints == other.alternate_custom_endpoints
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
      [display_name, freeform_tags, defined_tags, idcs_open_id, node_count, is_visual_builder_enabled, custom_endpoint, alternate_custom_endpoints].hash
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
