# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A tag definition that belongs to a specific tag namespace.  \"Defined tags\" must be set up in your tenancy before
  # you can apply them to resources.
  # For more information, see [Managing Tags and Tag Namespaces](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/taggingoverview.htm).
  #
  class Identity::Models::Tag # rubocop:disable Metrics/LineLength
    # **[Required]** The OCID of the compartment that contains the tag definition.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the namespace that contains the tag definition.
    # @return [String]
    attr_accessor :tag_namespace_id

    # **[Required]** The name of the tag namespace that contains the tag definition.
    #
    # @return [String]
    attr_accessor :tag_namespace_name

    # **[Required]** The OCID of the tag definition.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the tag. The name must be unique across all tags in the namespace and can't be changed.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The description you assign to the tag.
    # @return [String]
    attr_accessor :description

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}``
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** Indicates whether the tag is retired.
    # See [Retiring Key Definitions and Namespace Definitions](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/taggingoverview.htm#Retiring).
    #
    # @return [BOOLEAN]
    attr_accessor :is_retired

    # **[Required]** Date and time the tag was created, in the format defined by RFC3339.
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'tag_namespace_id': :'tagNamespaceId',
        'tag_namespace_name': :'tagNamespaceName',
        'id': :'id',
        'name': :'name',
        'description': :'description',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'is_retired': :'isRetired',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'tag_namespace_id': :'String',
        'tag_namespace_name': :'String',
        'id': :'String',
        'name': :'String',
        'description': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'is_retired': :'BOOLEAN',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :tag_namespace_id The value to assign to the {#tag_namespace_id} property
    # @option attributes [String] :tag_namespace_name The value to assign to the {#tag_namespace_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [BOOLEAN] :is_retired The value to assign to the {#is_retired} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.tag_namespace_id = attributes[:'tagNamespaceId'] if attributes[:'tagNamespaceId']

      raise 'You cannot provide both :tagNamespaceId and :tag_namespace_id' if attributes.key?(:'tagNamespaceId') && attributes.key?(:'tag_namespace_id')

      self.tag_namespace_id = attributes[:'tag_namespace_id'] if attributes[:'tag_namespace_id']

      self.tag_namespace_name = attributes[:'tagNamespaceName'] if attributes[:'tagNamespaceName']

      raise 'You cannot provide both :tagNamespaceName and :tag_namespace_name' if attributes.key?(:'tagNamespaceName') && attributes.key?(:'tag_namespace_name')

      self.tag_namespace_name = attributes[:'tag_namespace_name'] if attributes[:'tag_namespace_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.is_retired = attributes[:'isRetired'] unless attributes[:'isRetired'].nil?

      raise 'You cannot provide both :isRetired and :is_retired' if attributes.key?(:'isRetired') && attributes.key?(:'is_retired')

      self.is_retired = attributes[:'is_retired'] unless attributes[:'is_retired'].nil?

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        compartment_id == other.compartment_id &&
        tag_namespace_id == other.tag_namespace_id &&
        tag_namespace_name == other.tag_namespace_name &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        is_retired == other.is_retired &&
        time_created == other.time_created
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [compartment_id, tag_namespace_id, tag_namespace_name, id, name, description, freeform_tags, defined_tags, is_retired, time_created].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
