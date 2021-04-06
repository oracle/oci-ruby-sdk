# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Container repository metadata.
  class Artifacts::Models::ContainerRepository
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment in which the container repository exists.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The id of the user or principal that created the resource.
    # @return [String]
    attr_accessor :created_by

    # **[Required]** The container repository name.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the container repository.
    #
    # Example: `ocid1.containerrepo.oc1..exampleuniqueID`
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Total number of images.
    # @return [Integer]
    attr_accessor :image_count

    # **[Required]** Whether the repository is immutable. Images cannot be overwritten in an immutable repository.
    # @return [BOOLEAN]
    attr_accessor :is_immutable

    # **[Required]** Whether the repository is public. A public repository allows unauthenticated access.
    # @return [BOOLEAN]
    attr_accessor :is_public

    # **[Required]** Total number of layers.
    # @return [Integer]
    attr_accessor :layer_count

    # **[Required]** Total storage in bytes consumed by layers.
    # @return [Integer]
    attr_accessor :layers_size_in_bytes

    # **[Required]** The current state of the container repository.
    # @return [String]
    attr_reader :lifecycle_state

    # @return [OCI::Artifacts::Models::ContainerRepositoryReadme]
    attr_accessor :readme

    # **[Required]** An RFC 3339 timestamp indicating when the repository was created.
    # @return [DateTime]
    attr_accessor :time_created

    # An RFC 3339 timestamp indicating when an image was last pushed to the repository.
    # @return [DateTime]
    attr_accessor :time_last_pushed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'created_by': :'createdBy',
        'display_name': :'displayName',
        'id': :'id',
        'image_count': :'imageCount',
        'is_immutable': :'isImmutable',
        'is_public': :'isPublic',
        'layer_count': :'layerCount',
        'layers_size_in_bytes': :'layersSizeInBytes',
        'lifecycle_state': :'lifecycleState',
        'readme': :'readme',
        'time_created': :'timeCreated',
        'time_last_pushed': :'timeLastPushed'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'created_by': :'String',
        'display_name': :'String',
        'id': :'String',
        'image_count': :'Integer',
        'is_immutable': :'BOOLEAN',
        'is_public': :'BOOLEAN',
        'layer_count': :'Integer',
        'layers_size_in_bytes': :'Integer',
        'lifecycle_state': :'String',
        'readme': :'OCI::Artifacts::Models::ContainerRepositoryReadme',
        'time_created': :'DateTime',
        'time_last_pushed': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [Integer] :image_count The value to assign to the {#image_count} property
    # @option attributes [BOOLEAN] :is_immutable The value to assign to the {#is_immutable} property
    # @option attributes [BOOLEAN] :is_public The value to assign to the {#is_public} property
    # @option attributes [Integer] :layer_count The value to assign to the {#layer_count} property
    # @option attributes [Integer] :layers_size_in_bytes The value to assign to the {#layers_size_in_bytes} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [OCI::Artifacts::Models::ContainerRepositoryReadme] :readme The value to assign to the {#readme} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_last_pushed The value to assign to the {#time_last_pushed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.image_count = attributes[:'imageCount'] if attributes[:'imageCount']

      raise 'You cannot provide both :imageCount and :image_count' if attributes.key?(:'imageCount') && attributes.key?(:'image_count')

      self.image_count = attributes[:'image_count'] if attributes[:'image_count']

      self.is_immutable = attributes[:'isImmutable'] unless attributes[:'isImmutable'].nil?

      raise 'You cannot provide both :isImmutable and :is_immutable' if attributes.key?(:'isImmutable') && attributes.key?(:'is_immutable')

      self.is_immutable = attributes[:'is_immutable'] unless attributes[:'is_immutable'].nil?

      self.is_public = attributes[:'isPublic'] unless attributes[:'isPublic'].nil?

      raise 'You cannot provide both :isPublic and :is_public' if attributes.key?(:'isPublic') && attributes.key?(:'is_public')

      self.is_public = attributes[:'is_public'] unless attributes[:'is_public'].nil?

      self.layer_count = attributes[:'layerCount'] if attributes[:'layerCount']

      raise 'You cannot provide both :layerCount and :layer_count' if attributes.key?(:'layerCount') && attributes.key?(:'layer_count')

      self.layer_count = attributes[:'layer_count'] if attributes[:'layer_count']

      self.layers_size_in_bytes = attributes[:'layersSizeInBytes'] if attributes[:'layersSizeInBytes']

      raise 'You cannot provide both :layersSizeInBytes and :layers_size_in_bytes' if attributes.key?(:'layersSizeInBytes') && attributes.key?(:'layers_size_in_bytes')

      self.layers_size_in_bytes = attributes[:'layers_size_in_bytes'] if attributes[:'layers_size_in_bytes']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.readme = attributes[:'readme'] if attributes[:'readme']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_last_pushed = attributes[:'timeLastPushed'] if attributes[:'timeLastPushed']

      raise 'You cannot provide both :timeLastPushed and :time_last_pushed' if attributes.key?(:'timeLastPushed') && attributes.key?(:'time_last_pushed')

      self.time_last_pushed = attributes[:'time_last_pushed'] if attributes[:'time_last_pushed']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        created_by == other.created_by &&
        display_name == other.display_name &&
        id == other.id &&
        image_count == other.image_count &&
        is_immutable == other.is_immutable &&
        is_public == other.is_public &&
        layer_count == other.layer_count &&
        layers_size_in_bytes == other.layers_size_in_bytes &&
        lifecycle_state == other.lifecycle_state &&
        readme == other.readme &&
        time_created == other.time_created &&
        time_last_pushed == other.time_last_pushed
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
      [compartment_id, created_by, display_name, id, image_count, is_immutable, is_public, layer_count, layers_size_in_bytes, lifecycle_state, readme, time_created, time_last_pushed].hash
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
