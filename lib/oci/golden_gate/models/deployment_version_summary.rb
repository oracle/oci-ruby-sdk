# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200407
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary data of a specific deployment version.
  #
  class GoldenGate::Models::DeploymentVersionSummary
    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_OGG = 'OGG'.freeze,
      DEPLOYMENT_TYPE_DATABASE_ORACLE = 'DATABASE_ORACLE'.freeze,
      DEPLOYMENT_TYPE_BIGDATA = 'BIGDATA'.freeze,
      DEPLOYMENT_TYPE_DATABASE_MICROSOFT_SQLSERVER = 'DATABASE_MICROSOFT_SQLSERVER'.freeze,
      DEPLOYMENT_TYPE_DATABASE_MYSQL = 'DATABASE_MYSQL'.freeze,
      DEPLOYMENT_TYPE_DATABASE_POSTGRESQL = 'DATABASE_POSTGRESQL'.freeze,
      DEPLOYMENT_TYPE_DATABASE_DB2_ZOS = 'DATABASE_DB2ZOS'.freeze,
      DEPLOYMENT_TYPE_GGSA = 'GGSA'.freeze,
      DEPLOYMENT_TYPE_DATA_TRANSFORMS = 'DATA_TRANSFORMS'.freeze,
      DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RELEASE_TYPE_ENUM = [
      RELEASE_TYPE_MAJOR = 'MAJOR'.freeze,
      RELEASE_TYPE_BUNDLE = 'BUNDLE'.freeze,
      RELEASE_TYPE_MINOR = 'MINOR'.freeze,
      RELEASE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Version of OGG
    #
    # @return [String]
    attr_accessor :ogg_version

    # **[Required]** The type of deployment, which can be any one of the Allowed values.
    # NOTE: Use of the value 'OGG' is maintained for backward compatibility purposes.
    #     Its use is discouraged in favor of 'DATABASE_ORACLE'.
    #
    # @return [String]
    attr_reader :deployment_type

    # The time the resource was released. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_released

    # The type of release.
    #
    # @return [String]
    attr_reader :release_type

    # Indicates if OGG release contains security fix.
    #
    # @return [BOOLEAN]
    attr_accessor :is_security_fix

    # The time until OGG version is supported. After this date has passed OGG version will not be available anymore. The format is defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_supported_until

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'ogg_version': :'oggVersion',
        'deployment_type': :'deploymentType',
        'time_released': :'timeReleased',
        'release_type': :'releaseType',
        'is_security_fix': :'isSecurityFix',
        'time_supported_until': :'timeSupportedUntil'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'ogg_version': :'String',
        'deployment_type': :'String',
        'time_released': :'DateTime',
        'release_type': :'String',
        'is_security_fix': :'BOOLEAN',
        'time_supported_until': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :ogg_version The value to assign to the {#ogg_version} property
    # @option attributes [String] :deployment_type The value to assign to the {#deployment_type} property
    # @option attributes [DateTime] :time_released The value to assign to the {#time_released} property
    # @option attributes [String] :release_type The value to assign to the {#release_type} property
    # @option attributes [BOOLEAN] :is_security_fix The value to assign to the {#is_security_fix} property
    # @option attributes [DateTime] :time_supported_until The value to assign to the {#time_supported_until} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.ogg_version = attributes[:'oggVersion'] if attributes[:'oggVersion']

      raise 'You cannot provide both :oggVersion and :ogg_version' if attributes.key?(:'oggVersion') && attributes.key?(:'ogg_version')

      self.ogg_version = attributes[:'ogg_version'] if attributes[:'ogg_version']

      self.deployment_type = attributes[:'deploymentType'] if attributes[:'deploymentType']

      raise 'You cannot provide both :deploymentType and :deployment_type' if attributes.key?(:'deploymentType') && attributes.key?(:'deployment_type')

      self.deployment_type = attributes[:'deployment_type'] if attributes[:'deployment_type']

      self.time_released = attributes[:'timeReleased'] if attributes[:'timeReleased']

      raise 'You cannot provide both :timeReleased and :time_released' if attributes.key?(:'timeReleased') && attributes.key?(:'time_released')

      self.time_released = attributes[:'time_released'] if attributes[:'time_released']

      self.release_type = attributes[:'releaseType'] if attributes[:'releaseType']

      raise 'You cannot provide both :releaseType and :release_type' if attributes.key?(:'releaseType') && attributes.key?(:'release_type')

      self.release_type = attributes[:'release_type'] if attributes[:'release_type']

      self.is_security_fix = attributes[:'isSecurityFix'] unless attributes[:'isSecurityFix'].nil?

      raise 'You cannot provide both :isSecurityFix and :is_security_fix' if attributes.key?(:'isSecurityFix') && attributes.key?(:'is_security_fix')

      self.is_security_fix = attributes[:'is_security_fix'] unless attributes[:'is_security_fix'].nil?

      self.time_supported_until = attributes[:'timeSupportedUntil'] if attributes[:'timeSupportedUntil']

      raise 'You cannot provide both :timeSupportedUntil and :time_supported_until' if attributes.key?(:'timeSupportedUntil') && attributes.key?(:'time_supported_until')

      self.time_supported_until = attributes[:'time_supported_until'] if attributes[:'time_supported_until']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_type Object to be assigned
    def deployment_type=(deployment_type)
      # rubocop:disable Style/ConditionalAssignment
      if deployment_type && !DEPLOYMENT_TYPE_ENUM.include?(deployment_type)
        OCI.logger.debug("Unknown value for 'deployment_type' [" + deployment_type + "]. Mapping to 'DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @deployment_type = DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @deployment_type = deployment_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] release_type Object to be assigned
    def release_type=(release_type)
      # rubocop:disable Style/ConditionalAssignment
      if release_type && !RELEASE_TYPE_ENUM.include?(release_type)
        OCI.logger.debug("Unknown value for 'release_type' [" + release_type + "]. Mapping to 'RELEASE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @release_type = RELEASE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @release_type = release_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        ogg_version == other.ogg_version &&
        deployment_type == other.deployment_type &&
        time_released == other.time_released &&
        release_type == other.release_type &&
        is_security_fix == other.is_security_fix &&
        time_supported_until == other.time_supported_until
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
      [ogg_version, deployment_type, time_released, release_type, is_security_fix, time_supported_until].hash
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
