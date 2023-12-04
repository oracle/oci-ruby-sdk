# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230601
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of Java artifact download in a tenancy.
  class JmsJavaDownloads::Models::JavaDownloadRecordSummary
    # The Java family version identifier.
    # @return [String]
    attr_accessor :family_version

    # The Java family display name.
    # @return [String]
    attr_accessor :family_display_name

    # The Java release version identifier.
    # @return [String]
    attr_accessor :release_version

    # The target Operating System family for the artifact.
    # @return [String]
    attr_accessor :os_family

    # The target Operating System architecture for the artifact.
    # @return [String]
    attr_accessor :architecture

    # The package type(typically the file extension) of the artifact.
    # @return [String]
    attr_accessor :package_type

    # Additional information about the package type.
    # @return [String]
    attr_accessor :package_type_detail

    # **[Required]** Identifier of the source that downloaded the artifact.
    # @return [String]
    attr_accessor :download_source_id

    # **[Required]** Timestamp of download.
    # @return [DateTime]
    attr_accessor :time_downloaded

    # **[Required]** Type of download.
    # @return [String]
    attr_accessor :download_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'family_version': :'familyVersion',
        'family_display_name': :'familyDisplayName',
        'release_version': :'releaseVersion',
        'os_family': :'osFamily',
        'architecture': :'architecture',
        'package_type': :'packageType',
        'package_type_detail': :'packageTypeDetail',
        'download_source_id': :'downloadSourceId',
        'time_downloaded': :'timeDownloaded',
        'download_type': :'downloadType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'family_version': :'String',
        'family_display_name': :'String',
        'release_version': :'String',
        'os_family': :'String',
        'architecture': :'String',
        'package_type': :'String',
        'package_type_detail': :'String',
        'download_source_id': :'String',
        'time_downloaded': :'DateTime',
        'download_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :family_version The value to assign to the {#family_version} property
    # @option attributes [String] :family_display_name The value to assign to the {#family_display_name} property
    # @option attributes [String] :release_version The value to assign to the {#release_version} property
    # @option attributes [String] :os_family The value to assign to the {#os_family} property
    # @option attributes [String] :architecture The value to assign to the {#architecture} property
    # @option attributes [String] :package_type The value to assign to the {#package_type} property
    # @option attributes [String] :package_type_detail The value to assign to the {#package_type_detail} property
    # @option attributes [String] :download_source_id The value to assign to the {#download_source_id} property
    # @option attributes [DateTime] :time_downloaded The value to assign to the {#time_downloaded} property
    # @option attributes [String] :download_type The value to assign to the {#download_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.family_version = attributes[:'familyVersion'] if attributes[:'familyVersion']

      raise 'You cannot provide both :familyVersion and :family_version' if attributes.key?(:'familyVersion') && attributes.key?(:'family_version')

      self.family_version = attributes[:'family_version'] if attributes[:'family_version']

      self.family_display_name = attributes[:'familyDisplayName'] if attributes[:'familyDisplayName']

      raise 'You cannot provide both :familyDisplayName and :family_display_name' if attributes.key?(:'familyDisplayName') && attributes.key?(:'family_display_name')

      self.family_display_name = attributes[:'family_display_name'] if attributes[:'family_display_name']

      self.release_version = attributes[:'releaseVersion'] if attributes[:'releaseVersion']

      raise 'You cannot provide both :releaseVersion and :release_version' if attributes.key?(:'releaseVersion') && attributes.key?(:'release_version')

      self.release_version = attributes[:'release_version'] if attributes[:'release_version']

      self.os_family = attributes[:'osFamily'] if attributes[:'osFamily']

      raise 'You cannot provide both :osFamily and :os_family' if attributes.key?(:'osFamily') && attributes.key?(:'os_family')

      self.os_family = attributes[:'os_family'] if attributes[:'os_family']

      self.architecture = attributes[:'architecture'] if attributes[:'architecture']

      self.package_type = attributes[:'packageType'] if attributes[:'packageType']

      raise 'You cannot provide both :packageType and :package_type' if attributes.key?(:'packageType') && attributes.key?(:'package_type')

      self.package_type = attributes[:'package_type'] if attributes[:'package_type']

      self.package_type_detail = attributes[:'packageTypeDetail'] if attributes[:'packageTypeDetail']

      raise 'You cannot provide both :packageTypeDetail and :package_type_detail' if attributes.key?(:'packageTypeDetail') && attributes.key?(:'package_type_detail')

      self.package_type_detail = attributes[:'package_type_detail'] if attributes[:'package_type_detail']

      self.download_source_id = attributes[:'downloadSourceId'] if attributes[:'downloadSourceId']

      raise 'You cannot provide both :downloadSourceId and :download_source_id' if attributes.key?(:'downloadSourceId') && attributes.key?(:'download_source_id')

      self.download_source_id = attributes[:'download_source_id'] if attributes[:'download_source_id']

      self.time_downloaded = attributes[:'timeDownloaded'] if attributes[:'timeDownloaded']

      raise 'You cannot provide both :timeDownloaded and :time_downloaded' if attributes.key?(:'timeDownloaded') && attributes.key?(:'time_downloaded')

      self.time_downloaded = attributes[:'time_downloaded'] if attributes[:'time_downloaded']

      self.download_type = attributes[:'downloadType'] if attributes[:'downloadType']

      raise 'You cannot provide both :downloadType and :download_type' if attributes.key?(:'downloadType') && attributes.key?(:'download_type')

      self.download_type = attributes[:'download_type'] if attributes[:'download_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        family_version == other.family_version &&
        family_display_name == other.family_display_name &&
        release_version == other.release_version &&
        os_family == other.os_family &&
        architecture == other.architecture &&
        package_type == other.package_type &&
        package_type_detail == other.package_type_detail &&
        download_source_id == other.download_source_id &&
        time_downloaded == other.time_downloaded &&
        download_type == other.download_type
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
      [family_version, family_display_name, release_version, os_family, architecture, package_type, package_type_detail, download_source_id, time_downloaded, download_type].hash
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
