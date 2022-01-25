# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpdateVolumeDetails model.
  class Core::Models::UpdateVolumeDetails
    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The number of volume performance units (VPUs) that will be applied to this volume per GB,
    # representing the Block Volume service's elastic performance options.
    # See [Block Volume Elastic Performance](https://docs.cloud.oracle.com/iaas/Content/Block/Concepts/blockvolumeelasticperformance.htm) for more information.
    #
    # Allowed values:
    #
    #   * `0`: Represents Lower Cost option.
    #
    #   * `10`: Represents Balanced option.
    #
    #   * `20`: Represents Higher Performance option.
    #
    # @return [Integer]
    attr_accessor :vpus_per_gb

    # The size to resize the volume to in GBs. Has to be larger than the current size.
    # @return [Integer]
    attr_accessor :size_in_gbs

    # Specifies whether the auto-tune performance is enabled for this volume.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_tune_enabled

    # The list of block volume replicas that this volume will be updated to have
    # in the specified destination availability domains.
    #
    # @return [Array<OCI::Core::Models::BlockVolumeReplicaDetails>]
    attr_accessor :block_volume_replicas

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'vpus_per_gb': :'vpusPerGB',
        'size_in_gbs': :'sizeInGBs',
        'is_auto_tune_enabled': :'isAutoTuneEnabled',
        'block_volume_replicas': :'blockVolumeReplicas'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'vpus_per_gb': :'Integer',
        'size_in_gbs': :'Integer',
        'is_auto_tune_enabled': :'BOOLEAN',
        'block_volume_replicas': :'Array<OCI::Core::Models::BlockVolumeReplicaDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Integer] :vpus_per_gb The value to assign to the {#vpus_per_gb} property
    # @option attributes [Integer] :size_in_gbs The value to assign to the {#size_in_gbs} property
    # @option attributes [BOOLEAN] :is_auto_tune_enabled The value to assign to the {#is_auto_tune_enabled} property
    # @option attributes [Array<OCI::Core::Models::BlockVolumeReplicaDetails>] :block_volume_replicas The value to assign to the {#block_volume_replicas} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.vpus_per_gb = attributes[:'vpusPerGB'] if attributes[:'vpusPerGB']

      raise 'You cannot provide both :vpusPerGB and :vpus_per_gb' if attributes.key?(:'vpusPerGB') && attributes.key?(:'vpus_per_gb')

      self.vpus_per_gb = attributes[:'vpus_per_gb'] if attributes[:'vpus_per_gb']

      self.size_in_gbs = attributes[:'sizeInGBs'] if attributes[:'sizeInGBs']

      raise 'You cannot provide both :sizeInGBs and :size_in_gbs' if attributes.key?(:'sizeInGBs') && attributes.key?(:'size_in_gbs')

      self.size_in_gbs = attributes[:'size_in_gbs'] if attributes[:'size_in_gbs']

      self.is_auto_tune_enabled = attributes[:'isAutoTuneEnabled'] unless attributes[:'isAutoTuneEnabled'].nil?

      raise 'You cannot provide both :isAutoTuneEnabled and :is_auto_tune_enabled' if attributes.key?(:'isAutoTuneEnabled') && attributes.key?(:'is_auto_tune_enabled')

      self.is_auto_tune_enabled = attributes[:'is_auto_tune_enabled'] unless attributes[:'is_auto_tune_enabled'].nil?

      self.block_volume_replicas = attributes[:'blockVolumeReplicas'] if attributes[:'blockVolumeReplicas']

      raise 'You cannot provide both :blockVolumeReplicas and :block_volume_replicas' if attributes.key?(:'blockVolumeReplicas') && attributes.key?(:'block_volume_replicas')

      self.block_volume_replicas = attributes[:'block_volume_replicas'] if attributes[:'block_volume_replicas']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        vpus_per_gb == other.vpus_per_gb &&
        size_in_gbs == other.size_in_gbs &&
        is_auto_tune_enabled == other.is_auto_tune_enabled &&
        block_volume_replicas == other.block_volume_replicas
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
      [defined_tags, display_name, freeform_tags, vpus_per_gb, size_in_gbs, is_auto_tune_enabled, block_volume_replicas].hash
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
