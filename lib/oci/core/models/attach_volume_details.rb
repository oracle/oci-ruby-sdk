# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # AttachVolumeDetails model.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Core::Models::AttachVolumeDetails # rubocop:disable Metrics/LineLength
    # A user-friendly name. Does not have to be unique, and it cannot be changed. Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the instance.
    # @return [String]
    attr_accessor :instance_id

    # Whether the attachment was created in read-only mode.
    # @return [BOOLEAN]
    attr_accessor :is_read_only

    # **[Required]** The type of volume. The only supported value are \"iscsi\" and \"paravirtualized\".
    # @return [String]
    attr_accessor :type

    # **[Required]** The OCID of the volume.
    # @return [String]
    attr_accessor :volume_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'instance_id': :'instanceId',
        'is_read_only': :'isReadOnly',
        'type': :'type',
        'volume_id': :'volumeId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'instance_id': :'String',
        'is_read_only': :'BOOLEAN',
        'type': :'String',
        'volume_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Core::Models::AttachIScsiVolumeDetails' if type == 'iscsi'
      return 'OCI::Core::Models::AttachParavirtualizedVolumeDetails' if type == 'paravirtualized'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Core::Models::AttachVolumeDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [BOOLEAN] :is_read_only The value to assign to the {#is_read_only} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :volume_id The value to assign to the {#volume_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.is_read_only = attributes[:'isReadOnly'] unless attributes[:'isReadOnly'].nil?

      raise 'You cannot provide both :isReadOnly and :is_read_only' if attributes.key?(:'isReadOnly') && attributes.key?(:'is_read_only')

      self.is_read_only = attributes[:'is_read_only'] unless attributes[:'is_read_only'].nil?

      self.type = attributes[:'type'] if attributes[:'type']

      self.volume_id = attributes[:'volumeId'] if attributes[:'volumeId']

      raise 'You cannot provide both :volumeId and :volume_id' if attributes.key?(:'volumeId') && attributes.key?(:'volume_id')

      self.volume_id = attributes[:'volume_id'] if attributes[:'volume_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        display_name == other.display_name &&
        instance_id == other.instance_id &&
        is_read_only == other.is_read_only &&
        type == other.type &&
        volume_id == other.volume_id
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
      [display_name, instance_id, is_read_only, type, volume_id].hash
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
