# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210610
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A Deployment Rule Set(DRS) is a JAR (Java ARchive) file used in Java applications to enforce security and manage compatibility
  # between different versions of Java applets and web start applications
  # (https://docs.oracle.com/javase/8/docs/technotes/guides/deploy/deployment_rules.html).
  #
  class Jms::Models::DrsFileSummary
    CHECKSUM_TYPE_ENUM = [
      CHECKSUM_TYPE_SHA256 = 'SHA256'.freeze,
      CHECKSUM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The Object Storage bucket name where the DRS file is located.
    # @return [String]
    attr_accessor :bucket_name

    # **[Required]** The namespace for Object Storage.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The name of the DRS file in Object Store.
    # @return [String]
    attr_accessor :drs_file_name

    # **[Required]** The unique identifier of the DRS file in Object Storage.
    # @return [String]
    attr_accessor :drs_file_key

    # **[Required]** The checksum type for the DRS file in Object Storage.
    # @return [String]
    attr_reader :checksum_type

    # **[Required]** The checksum value for the DRS file in Object Storage.
    # @return [String]
    attr_accessor :checksum_value

    # **[Required]** To check if the DRS file is the detfault ones.
    # @return [BOOLEAN]
    attr_accessor :is_default

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bucket_name': :'bucketName',
        'namespace': :'namespace',
        'drs_file_name': :'drsFileName',
        'drs_file_key': :'drsFileKey',
        'checksum_type': :'checksumType',
        'checksum_value': :'checksumValue',
        'is_default': :'isDefault'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bucket_name': :'String',
        'namespace': :'String',
        'drs_file_name': :'String',
        'drs_file_key': :'String',
        'checksum_type': :'String',
        'checksum_value': :'String',
        'is_default': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :drs_file_name The value to assign to the {#drs_file_name} property
    # @option attributes [String] :drs_file_key The value to assign to the {#drs_file_key} property
    # @option attributes [String] :checksum_type The value to assign to the {#checksum_type} property
    # @option attributes [String] :checksum_value The value to assign to the {#checksum_value} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.drs_file_name = attributes[:'drsFileName'] if attributes[:'drsFileName']

      raise 'You cannot provide both :drsFileName and :drs_file_name' if attributes.key?(:'drsFileName') && attributes.key?(:'drs_file_name')

      self.drs_file_name = attributes[:'drs_file_name'] if attributes[:'drs_file_name']

      self.drs_file_key = attributes[:'drsFileKey'] if attributes[:'drsFileKey']

      raise 'You cannot provide both :drsFileKey and :drs_file_key' if attributes.key?(:'drsFileKey') && attributes.key?(:'drs_file_key')

      self.drs_file_key = attributes[:'drs_file_key'] if attributes[:'drs_file_key']

      self.checksum_type = attributes[:'checksumType'] if attributes[:'checksumType']

      raise 'You cannot provide both :checksumType and :checksum_type' if attributes.key?(:'checksumType') && attributes.key?(:'checksum_type')

      self.checksum_type = attributes[:'checksum_type'] if attributes[:'checksum_type']

      self.checksum_value = attributes[:'checksumValue'] if attributes[:'checksumValue']

      raise 'You cannot provide both :checksumValue and :checksum_value' if attributes.key?(:'checksumValue') && attributes.key?(:'checksum_value')

      self.checksum_value = attributes[:'checksum_value'] if attributes[:'checksum_value']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?
      self.is_default = false if is_default.nil? && !attributes.key?(:'isDefault') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?
      self.is_default = false if is_default.nil? && !attributes.key?(:'isDefault') && !attributes.key?(:'is_default') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] checksum_type Object to be assigned
    def checksum_type=(checksum_type)
      # rubocop:disable Style/ConditionalAssignment
      if checksum_type && !CHECKSUM_TYPE_ENUM.include?(checksum_type)
        OCI.logger.debug("Unknown value for 'checksum_type' [" + checksum_type + "]. Mapping to 'CHECKSUM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @checksum_type = CHECKSUM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @checksum_type = checksum_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bucket_name == other.bucket_name &&
        namespace == other.namespace &&
        drs_file_name == other.drs_file_name &&
        drs_file_key == other.drs_file_key &&
        checksum_type == other.checksum_type &&
        checksum_value == other.checksum_value &&
        is_default == other.is_default
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
      [bucket_name, namespace, drs_file_name, drs_file_key, checksum_type, checksum_value, is_default].hash
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