# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'config_source_record'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metadata about the Git configuration source.
  #
  class ResourceManager::Models::GitConfigSourceRecord < ResourceManager::Models::ConfigSourceRecord
    # **[Required]** Unique identifier ([OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm))
    # for the Git configuration source.
    #
    # @return [String]
    attr_accessor :configuration_source_provider_id

    # The URL of the Git repository.
    # @return [String]
    attr_accessor :repository_url

    # The name of the branch within the Git repository.
    # @return [String]
    attr_accessor :branch_name

    # The unique identifier (SHA-1 hash) of the individual change to the Git repository.
    # @return [String]
    attr_accessor :commit_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config_source_record_type': :'configSourceRecordType',
        'configuration_source_provider_id': :'configurationSourceProviderId',
        'repository_url': :'repositoryUrl',
        'branch_name': :'branchName',
        'commit_id': :'commitId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config_source_record_type': :'String',
        'configuration_source_provider_id': :'String',
        'repository_url': :'String',
        'branch_name': :'String',
        'commit_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :configuration_source_provider_id The value to assign to the {#configuration_source_provider_id} property
    # @option attributes [String] :repository_url The value to assign to the {#repository_url} property
    # @option attributes [String] :branch_name The value to assign to the {#branch_name} property
    # @option attributes [String] :commit_id The value to assign to the {#commit_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configSourceRecordType'] = 'GIT_CONFIG_SOURCE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.configuration_source_provider_id = attributes[:'configurationSourceProviderId'] if attributes[:'configurationSourceProviderId']

      raise 'You cannot provide both :configurationSourceProviderId and :configuration_source_provider_id' if attributes.key?(:'configurationSourceProviderId') && attributes.key?(:'configuration_source_provider_id')

      self.configuration_source_provider_id = attributes[:'configuration_source_provider_id'] if attributes[:'configuration_source_provider_id']

      self.repository_url = attributes[:'repositoryUrl'] if attributes[:'repositoryUrl']

      raise 'You cannot provide both :repositoryUrl and :repository_url' if attributes.key?(:'repositoryUrl') && attributes.key?(:'repository_url')

      self.repository_url = attributes[:'repository_url'] if attributes[:'repository_url']

      self.branch_name = attributes[:'branchName'] if attributes[:'branchName']

      raise 'You cannot provide both :branchName and :branch_name' if attributes.key?(:'branchName') && attributes.key?(:'branch_name')

      self.branch_name = attributes[:'branch_name'] if attributes[:'branch_name']

      self.commit_id = attributes[:'commitId'] if attributes[:'commitId']

      raise 'You cannot provide both :commitId and :commit_id' if attributes.key?(:'commitId') && attributes.key?(:'commit_id')

      self.commit_id = attributes[:'commit_id'] if attributes[:'commit_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config_source_record_type == other.config_source_record_type &&
        configuration_source_provider_id == other.configuration_source_provider_id &&
        repository_url == other.repository_url &&
        branch_name == other.branch_name &&
        commit_id == other.commit_id
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
      [config_source_record_type, configuration_source_provider_id, repository_url, branch_name, commit_id].hash
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
