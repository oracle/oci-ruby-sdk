# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The parameters required by Object Storage to process a request to copy an object to another bucket.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::CopyObjectDetails
    # **[Required]** The name of the object to be copied.
    # @return [String]
    attr_accessor :source_object_name

    # The entity tag (ETag) to match against that of the source object. Used to confirm that the source object
    # with a given name is the version of that object storing a specified ETag.
    #
    # @return [String]
    attr_accessor :source_object_if_match_e_tag

    # **[Required]** The destination region the object will be copied to, for example \"us-ashburn-1\".
    # @return [String]
    attr_accessor :destination_region

    # **[Required]** The destination Object Storage namespace the object will be copied to.
    # @return [String]
    attr_accessor :destination_namespace

    # **[Required]** The destination bucket the object will be copied to.
    # @return [String]
    attr_accessor :destination_bucket

    # **[Required]** The name of the destination object resulting from the copy operation.
    # @return [String]
    attr_accessor :destination_object_name

    # The entity tag (ETag) to match against that of the destination object (an object intended to be overwritten).
    # Used to confirm that the destination object stored under a given name is the version of that object
    # storing a specified entity tag.
    #
    # @return [String]
    attr_accessor :destination_object_if_match_e_tag

    # The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should fail
    # if the object already exists in the destination bucket.
    #
    # @return [String]
    attr_accessor :destination_object_if_none_match_e_tag

    # Arbitrary string keys and values for the user-defined metadata for the object. Keys must be in
    # \"opc-meta-*\" format. Avoid entering confidential information. Metadata key-value pairs entered
    # in this field are assigned to the destination object. If you enter no metadata values, the destination
    # object will inherit any existing metadata values associated with the source object.
    #
    # @return [Hash<String, String>]
    attr_accessor :destination_object_metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_object_name': :'sourceObjectName',
        'source_object_if_match_e_tag': :'sourceObjectIfMatchETag',
        'destination_region': :'destinationRegion',
        'destination_namespace': :'destinationNamespace',
        'destination_bucket': :'destinationBucket',
        'destination_object_name': :'destinationObjectName',
        'destination_object_if_match_e_tag': :'destinationObjectIfMatchETag',
        'destination_object_if_none_match_e_tag': :'destinationObjectIfNoneMatchETag',
        'destination_object_metadata': :'destinationObjectMetadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_object_name': :'String',
        'source_object_if_match_e_tag': :'String',
        'destination_region': :'String',
        'destination_namespace': :'String',
        'destination_bucket': :'String',
        'destination_object_name': :'String',
        'destination_object_if_match_e_tag': :'String',
        'destination_object_if_none_match_e_tag': :'String',
        'destination_object_metadata': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_object_name The value to assign to the {#source_object_name} property
    # @option attributes [String] :source_object_if_match_e_tag The value to assign to the {#source_object_if_match_e_tag} property
    # @option attributes [String] :destination_region The value to assign to the {#destination_region} property
    # @option attributes [String] :destination_namespace The value to assign to the {#destination_namespace} property
    # @option attributes [String] :destination_bucket The value to assign to the {#destination_bucket} property
    # @option attributes [String] :destination_object_name The value to assign to the {#destination_object_name} property
    # @option attributes [String] :destination_object_if_match_e_tag The value to assign to the {#destination_object_if_match_e_tag} property
    # @option attributes [String] :destination_object_if_none_match_e_tag The value to assign to the {#destination_object_if_none_match_e_tag} property
    # @option attributes [Hash<String, String>] :destination_object_metadata The value to assign to the {#destination_object_metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_object_name = attributes[:'sourceObjectName'] if attributes[:'sourceObjectName']

      raise 'You cannot provide both :sourceObjectName and :source_object_name' if attributes.key?(:'sourceObjectName') && attributes.key?(:'source_object_name')

      self.source_object_name = attributes[:'source_object_name'] if attributes[:'source_object_name']

      self.source_object_if_match_e_tag = attributes[:'sourceObjectIfMatchETag'] if attributes[:'sourceObjectIfMatchETag']

      raise 'You cannot provide both :sourceObjectIfMatchETag and :source_object_if_match_e_tag' if attributes.key?(:'sourceObjectIfMatchETag') && attributes.key?(:'source_object_if_match_e_tag')

      self.source_object_if_match_e_tag = attributes[:'source_object_if_match_e_tag'] if attributes[:'source_object_if_match_e_tag']

      self.destination_region = attributes[:'destinationRegion'] if attributes[:'destinationRegion']

      raise 'You cannot provide both :destinationRegion and :destination_region' if attributes.key?(:'destinationRegion') && attributes.key?(:'destination_region')

      self.destination_region = attributes[:'destination_region'] if attributes[:'destination_region']

      self.destination_namespace = attributes[:'destinationNamespace'] if attributes[:'destinationNamespace']

      raise 'You cannot provide both :destinationNamespace and :destination_namespace' if attributes.key?(:'destinationNamespace') && attributes.key?(:'destination_namespace')

      self.destination_namespace = attributes[:'destination_namespace'] if attributes[:'destination_namespace']

      self.destination_bucket = attributes[:'destinationBucket'] if attributes[:'destinationBucket']

      raise 'You cannot provide both :destinationBucket and :destination_bucket' if attributes.key?(:'destinationBucket') && attributes.key?(:'destination_bucket')

      self.destination_bucket = attributes[:'destination_bucket'] if attributes[:'destination_bucket']

      self.destination_object_name = attributes[:'destinationObjectName'] if attributes[:'destinationObjectName']

      raise 'You cannot provide both :destinationObjectName and :destination_object_name' if attributes.key?(:'destinationObjectName') && attributes.key?(:'destination_object_name')

      self.destination_object_name = attributes[:'destination_object_name'] if attributes[:'destination_object_name']

      self.destination_object_if_match_e_tag = attributes[:'destinationObjectIfMatchETag'] if attributes[:'destinationObjectIfMatchETag']

      raise 'You cannot provide both :destinationObjectIfMatchETag and :destination_object_if_match_e_tag' if attributes.key?(:'destinationObjectIfMatchETag') && attributes.key?(:'destination_object_if_match_e_tag')

      self.destination_object_if_match_e_tag = attributes[:'destination_object_if_match_e_tag'] if attributes[:'destination_object_if_match_e_tag']

      self.destination_object_if_none_match_e_tag = attributes[:'destinationObjectIfNoneMatchETag'] if attributes[:'destinationObjectIfNoneMatchETag']

      raise 'You cannot provide both :destinationObjectIfNoneMatchETag and :destination_object_if_none_match_e_tag' if attributes.key?(:'destinationObjectIfNoneMatchETag') && attributes.key?(:'destination_object_if_none_match_e_tag')

      self.destination_object_if_none_match_e_tag = attributes[:'destination_object_if_none_match_e_tag'] if attributes[:'destination_object_if_none_match_e_tag']

      self.destination_object_metadata = attributes[:'destinationObjectMetadata'] if attributes[:'destinationObjectMetadata']

      raise 'You cannot provide both :destinationObjectMetadata and :destination_object_metadata' if attributes.key?(:'destinationObjectMetadata') && attributes.key?(:'destination_object_metadata')

      self.destination_object_metadata = attributes[:'destination_object_metadata'] if attributes[:'destination_object_metadata']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_object_name == other.source_object_name &&
        source_object_if_match_e_tag == other.source_object_if_match_e_tag &&
        destination_region == other.destination_region &&
        destination_namespace == other.destination_namespace &&
        destination_bucket == other.destination_bucket &&
        destination_object_name == other.destination_object_name &&
        destination_object_if_match_e_tag == other.destination_object_if_match_e_tag &&
        destination_object_if_none_match_e_tag == other.destination_object_if_none_match_e_tag &&
        destination_object_metadata == other.destination_object_metadata
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
      [source_object_name, source_object_if_match_e_tag, destination_region, destination_namespace, destination_bucket, destination_object_name, destination_object_if_match_e_tag, destination_object_if_none_match_e_tag, destination_object_metadata].hash
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
