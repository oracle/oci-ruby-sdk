# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'instance_source_details'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # InstanceSourceViaImageDetails model.
  class Core::Models::InstanceSourceViaImageDetails < Core::Models::InstanceSourceDetails # rubocop:disable Metrics/LineLength
    # The size of the boot volume in GBs. Minimum value is 50 GB and maximum value is 16384 GB (16TB).
    # @return [Integer]
    attr_accessor :boot_volume_size_in_gbs

    # **[Required]** The OCID of the image used to boot the instance.
    # @return [String]
    attr_accessor :image_id

    # The OCID of the KMS key to be used as the master encryption key for the boot volume.
    # @return [String]
    attr_accessor :kms_key_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_type': :'sourceType',
        'boot_volume_size_in_gbs': :'bootVolumeSizeInGBs',
        'image_id': :'imageId',
        'kms_key_id': :'kmsKeyId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_type': :'String',
        'boot_volume_size_in_gbs': :'Integer',
        'image_id': :'String',
        'kms_key_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :boot_volume_size_in_gbs The value to assign to the {#boot_volume_size_in_gbs} property
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['sourceType'] = 'image'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.boot_volume_size_in_gbs = attributes[:'bootVolumeSizeInGBs'] if attributes[:'bootVolumeSizeInGBs']

      raise 'You cannot provide both :bootVolumeSizeInGBs and :boot_volume_size_in_gbs' if attributes.key?(:'bootVolumeSizeInGBs') && attributes.key?(:'boot_volume_size_in_gbs')

      self.boot_volume_size_in_gbs = attributes[:'boot_volume_size_in_gbs'] if attributes[:'boot_volume_size_in_gbs']

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        source_type == other.source_type &&
        boot_volume_size_in_gbs == other.boot_volume_size_in_gbs &&
        image_id == other.image_id &&
        kms_key_id == other.kms_key_id
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
      [source_type, boot_volume_size_in_gbs, image_id, kms_key_id].hash
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
