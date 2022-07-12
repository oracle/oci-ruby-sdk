# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Build source required for the Build stage.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Devops::Models::BuildSource
    CONNECTION_TYPE_ENUM = [
      CONNECTION_TYPE_GITHUB = 'GITHUB'.freeze,
      CONNECTION_TYPE_GITLAB = 'GITLAB'.freeze,
      CONNECTION_TYPE_BITBUCKET_CLOUD = 'BITBUCKET_CLOUD'.freeze,
      CONNECTION_TYPE_DEVOPS_CODE_REPOSITORY = 'DEVOPS_CODE_REPOSITORY'.freeze,
      CONNECTION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of the build source. This must be unique within a build source collection. The name can be used by customers to locate the working directory pertinent to this repository.
    # @return [String]
    attr_accessor :name

    # **[Required]** The type of source provider.
    # @return [String]
    attr_reader :connection_type

    # **[Required]** URL for the repository.
    # @return [String]
    attr_accessor :repository_url

    # **[Required]** Branch name.
    # @return [String]
    attr_accessor :branch

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'connection_type': :'connectionType',
        'repository_url': :'repositoryUrl',
        'branch': :'branch'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'connection_type': :'String',
        'repository_url': :'String',
        'branch': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'connectionType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Devops::Models::GithubBuildSource' if type == 'GITHUB'
      return 'OCI::Devops::Models::BitbucketCloudBuildSource' if type == 'BITBUCKET_CLOUD'
      return 'OCI::Devops::Models::DevopsCodeRepositoryBuildSource' if type == 'DEVOPS_CODE_REPOSITORY'
      return 'OCI::Devops::Models::GitlabBuildSource' if type == 'GITLAB'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Devops::Models::BuildSource'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :connection_type The value to assign to the {#connection_type} property
    # @option attributes [String] :repository_url The value to assign to the {#repository_url} property
    # @option attributes [String] :branch The value to assign to the {#branch} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.connection_type = attributes[:'connectionType'] if attributes[:'connectionType']

      raise 'You cannot provide both :connectionType and :connection_type' if attributes.key?(:'connectionType') && attributes.key?(:'connection_type')

      self.connection_type = attributes[:'connection_type'] if attributes[:'connection_type']

      self.repository_url = attributes[:'repositoryUrl'] if attributes[:'repositoryUrl']

      raise 'You cannot provide both :repositoryUrl and :repository_url' if attributes.key?(:'repositoryUrl') && attributes.key?(:'repository_url')

      self.repository_url = attributes[:'repository_url'] if attributes[:'repository_url']

      self.branch = attributes[:'branch'] if attributes[:'branch']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] connection_type Object to be assigned
    def connection_type=(connection_type)
      # rubocop:disable Style/ConditionalAssignment
      if connection_type && !CONNECTION_TYPE_ENUM.include?(connection_type)
        OCI.logger.debug("Unknown value for 'connection_type' [" + connection_type + "]. Mapping to 'CONNECTION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @connection_type = CONNECTION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @connection_type = connection_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        connection_type == other.connection_type &&
        repository_url == other.repository_url &&
        branch == other.branch
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
      [name, connection_type, repository_url, branch].hash
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
