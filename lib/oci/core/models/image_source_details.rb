# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # ImageSourceDetails model.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Core::Models::ImageSourceDetails # rubocop:disable Metrics/LineLength
    SOURCE_IMAGE_TYPE_ENUM = [
      SOURCE_IMAGE_TYPE_QCOW2 = 'QCOW2'.freeze,
      SOURCE_IMAGE_TYPE_VMDK = 'VMDK'.freeze
    ].freeze

    # The format of the image to be imported.  Exported Oracle images are QCOW2.  Only monolithic
    # images are supported.
    #
    # @return [String]
    attr_reader :source_image_type

    # **[Required]** The source type for the image. Use `objectStorageTuple` when specifying the namespace,
    # bucket name, and object name. Use `objectStorageUri` when specifying the Object Storage URL.
    #
    # @return [String]
    attr_accessor :source_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_image_type': :'sourceImageType',
        'source_type': :'sourceType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_image_type': :'String',
        'source_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'sourceType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Core::Models::ImageSourceViaObjectStorageTupleDetails' if type == 'objectStorageTuple'
      return 'OCI::Core::Models::ImageSourceViaObjectStorageUriDetails' if type == 'objectStorageUri'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Core::Models::ImageSourceDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_image_type The value to assign to the {#source_image_type} property
    # @option attributes [String] :source_type The value to assign to the {#source_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_image_type = attributes[:'sourceImageType'] if attributes[:'sourceImageType']

      raise 'You cannot provide both :sourceImageType and :source_image_type' if attributes.key?(:'sourceImageType') && attributes.key?(:'source_image_type')

      self.source_image_type = attributes[:'source_image_type'] if attributes[:'source_image_type']

      self.source_type = attributes[:'sourceType'] if attributes[:'sourceType']

      raise 'You cannot provide both :sourceType and :source_type' if attributes.key?(:'sourceType') && attributes.key?(:'source_type')

      self.source_type = attributes[:'source_type'] if attributes[:'source_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source_image_type Object to be assigned
    def source_image_type=(source_image_type)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'source_image_type': this must be one of the values in SOURCE_IMAGE_TYPE_ENUM." if source_image_type && !SOURCE_IMAGE_TYPE_ENUM.include?(source_image_type)
      # rubocop: enable Metrics/LineLength
      @source_image_type = source_image_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        source_image_type == other.source_image_type &&
        source_type == other.source_type
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
      [source_image_type, source_type].hash
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
