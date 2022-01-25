# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::CreateMultipartUploadDetails
    STORAGE_TIER_ENUM = [
      STORAGE_TIER_STANDARD = 'Standard'.freeze,
      STORAGE_TIER_INFREQUENT_ACCESS = 'InfrequentAccess'.freeze,
      STORAGE_TIER_ARCHIVE = 'Archive'.freeze
    ].freeze

    # **[Required]** The name of the object to which this multi-part upload is targeted. Avoid entering confidential information.
    # Example: test/object1.log
    #
    # @return [String]
    attr_accessor :object

    # The optional Content-Type header that defines the standard MIME type format of the object to upload.
    # Specifying values for this header has no effect on Object Storage behavior. Programs that read the object
    # determine what to do based on the value provided. For example, you could use this header to identify and
    # perform special operations on text only objects.
    #
    # @return [String]
    attr_accessor :content_type

    # The optional Content-Language header that defines the content language of the object to upload. Specifying
    # values for this header has no effect on Object Storage behavior. Programs that read the object determine what
    # to do based on the value provided. For example, you could use this header to identify and differentiate objects
    # based on a particular language.
    #
    # @return [String]
    attr_accessor :content_language

    # The optional Content-Encoding header that defines the content encodings that were applied to the object to
    # upload. Specifying values for this header has no effect on Object Storage behavior. Programs that read the
    # object determine what to do based on the value provided. For example, you could use this header to determine
    # what decoding mechanisms need to be applied to obtain the media-type specified by the Content-Type header of
    # the object.
    #
    # @return [String]
    attr_accessor :content_encoding

    # The optional Content-Disposition header that defines presentational information for the object to be
    # returned in GetObject and HeadObject responses. Specifying values for this header has no effect on Object
    # Storage behavior. Programs that read the object determine what to do based on the value provided.
    # For example, you could use this header to let users download objects with custom filenames in a browser.
    #
    # @return [String]
    attr_accessor :content_disposition

    # The optional Cache-Control header that defines the caching behavior value to be returned in GetObject and
    # HeadObject responses. Specifying values for this header has no effect on Object Storage behavior. Programs
    # that read the object determine what to do based on the value provided.
    # For example, you could use this header to identify objects that require caching restrictions.
    #
    # @return [String]
    attr_accessor :cache_control

    # The storage tier that the object should be stored in. If not specified, the object will be stored in
    # the same storage tier as the bucket.
    #
    # @return [String]
    attr_reader :storage_tier

    # Arbitrary string keys and values for the user-defined metadata for the object.
    # Keys must be in \"opc-meta-*\" format. Avoid entering confidential information.
    #
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'object': :'object',
        'content_type': :'contentType',
        'content_language': :'contentLanguage',
        'content_encoding': :'contentEncoding',
        'content_disposition': :'contentDisposition',
        'cache_control': :'cacheControl',
        'storage_tier': :'storageTier',
        'metadata': :'metadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'object': :'String',
        'content_type': :'String',
        'content_language': :'String',
        'content_encoding': :'String',
        'content_disposition': :'String',
        'cache_control': :'String',
        'storage_tier': :'String',
        'metadata': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :object The value to assign to the {#object} property
    # @option attributes [String] :content_type The value to assign to the {#content_type} property
    # @option attributes [String] :content_language The value to assign to the {#content_language} property
    # @option attributes [String] :content_encoding The value to assign to the {#content_encoding} property
    # @option attributes [String] :content_disposition The value to assign to the {#content_disposition} property
    # @option attributes [String] :cache_control The value to assign to the {#cache_control} property
    # @option attributes [String] :storage_tier The value to assign to the {#storage_tier} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.object = attributes[:'object'] if attributes[:'object']

      self.content_type = attributes[:'contentType'] if attributes[:'contentType']

      raise 'You cannot provide both :contentType and :content_type' if attributes.key?(:'contentType') && attributes.key?(:'content_type')

      self.content_type = attributes[:'content_type'] if attributes[:'content_type']

      self.content_language = attributes[:'contentLanguage'] if attributes[:'contentLanguage']

      raise 'You cannot provide both :contentLanguage and :content_language' if attributes.key?(:'contentLanguage') && attributes.key?(:'content_language')

      self.content_language = attributes[:'content_language'] if attributes[:'content_language']

      self.content_encoding = attributes[:'contentEncoding'] if attributes[:'contentEncoding']

      raise 'You cannot provide both :contentEncoding and :content_encoding' if attributes.key?(:'contentEncoding') && attributes.key?(:'content_encoding')

      self.content_encoding = attributes[:'content_encoding'] if attributes[:'content_encoding']

      self.content_disposition = attributes[:'contentDisposition'] if attributes[:'contentDisposition']

      raise 'You cannot provide both :contentDisposition and :content_disposition' if attributes.key?(:'contentDisposition') && attributes.key?(:'content_disposition')

      self.content_disposition = attributes[:'content_disposition'] if attributes[:'content_disposition']

      self.cache_control = attributes[:'cacheControl'] if attributes[:'cacheControl']

      raise 'You cannot provide both :cacheControl and :cache_control' if attributes.key?(:'cacheControl') && attributes.key?(:'cache_control')

      self.cache_control = attributes[:'cache_control'] if attributes[:'cache_control']

      self.storage_tier = attributes[:'storageTier'] if attributes[:'storageTier']

      raise 'You cannot provide both :storageTier and :storage_tier' if attributes.key?(:'storageTier') && attributes.key?(:'storage_tier')

      self.storage_tier = attributes[:'storage_tier'] if attributes[:'storage_tier']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] storage_tier Object to be assigned
    def storage_tier=(storage_tier)
      raise "Invalid value for 'storage_tier': this must be one of the values in STORAGE_TIER_ENUM." if storage_tier && !STORAGE_TIER_ENUM.include?(storage_tier)

      @storage_tier = storage_tier
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        object == other.object &&
        content_type == other.content_type &&
        content_language == other.content_language &&
        content_encoding == other.content_encoding &&
        content_disposition == other.content_disposition &&
        cache_control == other.cache_control &&
        storage_tier == other.storage_tier &&
        metadata == other.metadata
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
      [object, content_type, content_language, content_encoding, content_disposition, cache_control, storage_tier, metadata].hash
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
