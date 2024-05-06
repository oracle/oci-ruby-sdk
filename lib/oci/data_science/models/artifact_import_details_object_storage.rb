# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190101
require 'date'
require_relative 'artifact_import_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Artifact destination details for importing to destination bucket
  class DataScience::Models::ArtifactImportDetailsObjectStorage < DataScience::Models::ArtifactImportDetails
    # The Object Storage namespace used for the request.
    # @return [String]
    attr_accessor :namespace

    # The name of the bucket. Avoid entering confidential information.
    # @return [String]
    attr_accessor :destination_bucket

    # The name of the object resulting from the copy operation.
    # @return [String]
    attr_accessor :destination_object_name

    # Region in which OSS bucket is present
    # @return [String]
    attr_accessor :destination_region

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'artifact_source_type': :'artifactSourceType',
        'namespace': :'namespace',
        'destination_bucket': :'destinationBucket',
        'destination_object_name': :'destinationObjectName',
        'destination_region': :'destinationRegion'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'artifact_source_type': :'String',
        'namespace': :'String',
        'destination_bucket': :'String',
        'destination_object_name': :'String',
        'destination_region': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :destination_bucket The value to assign to the {#destination_bucket} property
    # @option attributes [String] :destination_object_name The value to assign to the {#destination_object_name} property
    # @option attributes [String] :destination_region The value to assign to the {#destination_region} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['artifactSourceType'] = 'ORACLE_OBJECT_STORAGE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.destination_bucket = attributes[:'destinationBucket'] if attributes[:'destinationBucket']

      raise 'You cannot provide both :destinationBucket and :destination_bucket' if attributes.key?(:'destinationBucket') && attributes.key?(:'destination_bucket')

      self.destination_bucket = attributes[:'destination_bucket'] if attributes[:'destination_bucket']

      self.destination_object_name = attributes[:'destinationObjectName'] if attributes[:'destinationObjectName']

      raise 'You cannot provide both :destinationObjectName and :destination_object_name' if attributes.key?(:'destinationObjectName') && attributes.key?(:'destination_object_name')

      self.destination_object_name = attributes[:'destination_object_name'] if attributes[:'destination_object_name']

      self.destination_region = attributes[:'destinationRegion'] if attributes[:'destinationRegion']

      raise 'You cannot provide both :destinationRegion and :destination_region' if attributes.key?(:'destinationRegion') && attributes.key?(:'destination_region')

      self.destination_region = attributes[:'destination_region'] if attributes[:'destination_region']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        artifact_source_type == other.artifact_source_type &&
        namespace == other.namespace &&
        destination_bucket == other.destination_bucket &&
        destination_object_name == other.destination_object_name &&
        destination_region == other.destination_region
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
      [artifact_source_type, namespace, destination_bucket, destination_object_name, destination_region].hash
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