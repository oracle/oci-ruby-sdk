# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210610
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metadata associated with a specific Java release family.
  # A Java release family is typically a major version in the Java version identifier.
  #
  class Jms::Models::JavaFamily
    SUPPORT_TYPE_ENUM = [
      SUPPORT_TYPE_LTS = 'LTS'.freeze,
      SUPPORT_TYPE_NON_LTS = 'NON_LTS'.freeze,
      SUPPORT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # List of artifacts for the latest Java release version in this family.
    # The script URLs in the response can be used from a command line, or in scripts and dockerfiles to always get the artifacts corresponding to the latest update release version.
    #
    # @return [Array<OCI::Jms::Models::JavaArtifact>]
    attr_accessor :latest_release_artifacts

    # **[Required]** The Java release family identifier.
    # @return [String]
    attr_accessor :family_version

    # **[Required]** The display name of the release family.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** This indicates the support category for the Java release family.
    # @return [String]
    attr_reader :support_type

    # **[Required]** The End of Support Life (EOSL) date of the Java release family (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :end_of_support_life_date

    # **[Required]** Link to access the documentation for the release.
    # @return [String]
    attr_accessor :doc_url

    # **[Required]** Latest Java release version in the family.
    # @return [String]
    attr_accessor :latest_release_version

    # **[Required]** Whether or not this Java release family is under active support.
    # Refer [Java Support Roadmap](https://www.oracle.com/java/technologies/java-se-support-roadmap.html) for more details.
    #
    # @return [BOOLEAN]
    attr_accessor :is_supported_version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'latest_release_artifacts': :'latestReleaseArtifacts',
        'family_version': :'familyVersion',
        'display_name': :'displayName',
        'support_type': :'supportType',
        'end_of_support_life_date': :'endOfSupportLifeDate',
        'doc_url': :'docUrl',
        'latest_release_version': :'latestReleaseVersion',
        'is_supported_version': :'isSupportedVersion'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'latest_release_artifacts': :'Array<OCI::Jms::Models::JavaArtifact>',
        'family_version': :'String',
        'display_name': :'String',
        'support_type': :'String',
        'end_of_support_life_date': :'DateTime',
        'doc_url': :'String',
        'latest_release_version': :'String',
        'is_supported_version': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Jms::Models::JavaArtifact>] :latest_release_artifacts The value to assign to the {#latest_release_artifacts} property
    # @option attributes [String] :family_version The value to assign to the {#family_version} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :support_type The value to assign to the {#support_type} property
    # @option attributes [DateTime] :end_of_support_life_date The value to assign to the {#end_of_support_life_date} property
    # @option attributes [String] :doc_url The value to assign to the {#doc_url} property
    # @option attributes [String] :latest_release_version The value to assign to the {#latest_release_version} property
    # @option attributes [BOOLEAN] :is_supported_version The value to assign to the {#is_supported_version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.latest_release_artifacts = attributes[:'latestReleaseArtifacts'] if attributes[:'latestReleaseArtifacts']

      raise 'You cannot provide both :latestReleaseArtifacts and :latest_release_artifacts' if attributes.key?(:'latestReleaseArtifacts') && attributes.key?(:'latest_release_artifacts')

      self.latest_release_artifacts = attributes[:'latest_release_artifacts'] if attributes[:'latest_release_artifacts']

      self.family_version = attributes[:'familyVersion'] if attributes[:'familyVersion']

      raise 'You cannot provide both :familyVersion and :family_version' if attributes.key?(:'familyVersion') && attributes.key?(:'family_version')

      self.family_version = attributes[:'family_version'] if attributes[:'family_version']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.support_type = attributes[:'supportType'] if attributes[:'supportType']

      raise 'You cannot provide both :supportType and :support_type' if attributes.key?(:'supportType') && attributes.key?(:'support_type')

      self.support_type = attributes[:'support_type'] if attributes[:'support_type']

      self.end_of_support_life_date = attributes[:'endOfSupportLifeDate'] if attributes[:'endOfSupportLifeDate']

      raise 'You cannot provide both :endOfSupportLifeDate and :end_of_support_life_date' if attributes.key?(:'endOfSupportLifeDate') && attributes.key?(:'end_of_support_life_date')

      self.end_of_support_life_date = attributes[:'end_of_support_life_date'] if attributes[:'end_of_support_life_date']

      self.doc_url = attributes[:'docUrl'] if attributes[:'docUrl']

      raise 'You cannot provide both :docUrl and :doc_url' if attributes.key?(:'docUrl') && attributes.key?(:'doc_url')

      self.doc_url = attributes[:'doc_url'] if attributes[:'doc_url']

      self.latest_release_version = attributes[:'latestReleaseVersion'] if attributes[:'latestReleaseVersion']

      raise 'You cannot provide both :latestReleaseVersion and :latest_release_version' if attributes.key?(:'latestReleaseVersion') && attributes.key?(:'latest_release_version')

      self.latest_release_version = attributes[:'latest_release_version'] if attributes[:'latest_release_version']

      self.is_supported_version = attributes[:'isSupportedVersion'] unless attributes[:'isSupportedVersion'].nil?

      raise 'You cannot provide both :isSupportedVersion and :is_supported_version' if attributes.key?(:'isSupportedVersion') && attributes.key?(:'is_supported_version')

      self.is_supported_version = attributes[:'is_supported_version'] unless attributes[:'is_supported_version'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] support_type Object to be assigned
    def support_type=(support_type)
      # rubocop:disable Style/ConditionalAssignment
      if support_type && !SUPPORT_TYPE_ENUM.include?(support_type)
        OCI.logger.debug("Unknown value for 'support_type' [" + support_type + "]. Mapping to 'SUPPORT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @support_type = SUPPORT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @support_type = support_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        latest_release_artifacts == other.latest_release_artifacts &&
        family_version == other.family_version &&
        display_name == other.display_name &&
        support_type == other.support_type &&
        end_of_support_life_date == other.end_of_support_life_date &&
        doc_url == other.doc_url &&
        latest_release_version == other.latest_release_version &&
        is_supported_version == other.is_supported_version
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
      [latest_release_artifacts, family_version, display_name, support_type, end_of_support_life_date, doc_url, latest_release_version, is_supported_version].hash
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
