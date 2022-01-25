# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # List of container repository results.
  class Artifacts::Models::ContainerRepositoryCollection
    # **[Required]** Total number of layers.
    # @return [Integer]
    attr_accessor :layer_count

    # **[Required]** Total storage in bytes consumed by layers.
    # @return [Integer]
    attr_accessor :layers_size_in_bytes

    # **[Required]** Total number of images.
    # @return [Integer]
    attr_accessor :image_count

    # **[Required]** Collection of container repositories.
    # @return [Array<OCI::Artifacts::Models::ContainerRepositorySummary>]
    attr_accessor :items

    # **[Required]** Estimated number of remaining results.
    # @return [Integer]
    attr_accessor :remaining_items_count

    # **[Required]** Total number of repositories.
    # @return [Integer]
    attr_accessor :repository_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'layer_count': :'layerCount',
        'layers_size_in_bytes': :'layersSizeInBytes',
        'image_count': :'imageCount',
        'items': :'items',
        'remaining_items_count': :'remainingItemsCount',
        'repository_count': :'repositoryCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'layer_count': :'Integer',
        'layers_size_in_bytes': :'Integer',
        'image_count': :'Integer',
        'items': :'Array<OCI::Artifacts::Models::ContainerRepositorySummary>',
        'remaining_items_count': :'Integer',
        'repository_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :layer_count The value to assign to the {#layer_count} property
    # @option attributes [Integer] :layers_size_in_bytes The value to assign to the {#layers_size_in_bytes} property
    # @option attributes [Integer] :image_count The value to assign to the {#image_count} property
    # @option attributes [Array<OCI::Artifacts::Models::ContainerRepositorySummary>] :items The value to assign to the {#items} property
    # @option attributes [Integer] :remaining_items_count The value to assign to the {#remaining_items_count} property
    # @option attributes [Integer] :repository_count The value to assign to the {#repository_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.layer_count = attributes[:'layerCount'] if attributes[:'layerCount']

      raise 'You cannot provide both :layerCount and :layer_count' if attributes.key?(:'layerCount') && attributes.key?(:'layer_count')

      self.layer_count = attributes[:'layer_count'] if attributes[:'layer_count']

      self.layers_size_in_bytes = attributes[:'layersSizeInBytes'] if attributes[:'layersSizeInBytes']

      raise 'You cannot provide both :layersSizeInBytes and :layers_size_in_bytes' if attributes.key?(:'layersSizeInBytes') && attributes.key?(:'layers_size_in_bytes')

      self.layers_size_in_bytes = attributes[:'layers_size_in_bytes'] if attributes[:'layers_size_in_bytes']

      self.image_count = attributes[:'imageCount'] if attributes[:'imageCount']

      raise 'You cannot provide both :imageCount and :image_count' if attributes.key?(:'imageCount') && attributes.key?(:'image_count')

      self.image_count = attributes[:'image_count'] if attributes[:'image_count']

      self.items = attributes[:'items'] if attributes[:'items']

      self.remaining_items_count = attributes[:'remainingItemsCount'] if attributes[:'remainingItemsCount']

      raise 'You cannot provide both :remainingItemsCount and :remaining_items_count' if attributes.key?(:'remainingItemsCount') && attributes.key?(:'remaining_items_count')

      self.remaining_items_count = attributes[:'remaining_items_count'] if attributes[:'remaining_items_count']

      self.repository_count = attributes[:'repositoryCount'] if attributes[:'repositoryCount']

      raise 'You cannot provide both :repositoryCount and :repository_count' if attributes.key?(:'repositoryCount') && attributes.key?(:'repository_count')

      self.repository_count = attributes[:'repository_count'] if attributes[:'repository_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        layer_count == other.layer_count &&
        layers_size_in_bytes == other.layers_size_in_bytes &&
        image_count == other.image_count &&
        items == other.items &&
        remaining_items_count == other.remaining_items_count &&
        repository_count == other.repository_count
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
      [layer_count, layers_size_in_bytes, image_count, items, remaining_items_count, repository_count].hash
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
