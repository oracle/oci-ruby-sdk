# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190325
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about the job which performs an export.
  class DataCatalog::Models::AsynchronousExportResult
    # Display name of the export job.
    # @return [String]
    attr_accessor :job_definition_name

    # Unique key of the export job definition.
    # @return [String]
    attr_accessor :job_definition_key

    # Unique key of the export job.
    # @return [String]
    attr_accessor :job_key

    # Unique key of the job execution.
    # @return [String]
    attr_accessor :job_execution_key

    # Unique key of the object being exported.
    # @return [String]
    attr_accessor :source_key

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'job_definition_name': :'jobDefinitionName',
        'job_definition_key': :'jobDefinitionKey',
        'job_key': :'jobKey',
        'job_execution_key': :'jobExecutionKey',
        'source_key': :'sourceKey'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'job_definition_name': :'String',
        'job_definition_key': :'String',
        'job_key': :'String',
        'job_execution_key': :'String',
        'source_key': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :job_definition_name The value to assign to the {#job_definition_name} property
    # @option attributes [String] :job_definition_key The value to assign to the {#job_definition_key} property
    # @option attributes [String] :job_key The value to assign to the {#job_key} property
    # @option attributes [String] :job_execution_key The value to assign to the {#job_execution_key} property
    # @option attributes [String] :source_key The value to assign to the {#source_key} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.job_definition_name = attributes[:'jobDefinitionName'] if attributes[:'jobDefinitionName']

      raise 'You cannot provide both :jobDefinitionName and :job_definition_name' if attributes.key?(:'jobDefinitionName') && attributes.key?(:'job_definition_name')

      self.job_definition_name = attributes[:'job_definition_name'] if attributes[:'job_definition_name']

      self.job_definition_key = attributes[:'jobDefinitionKey'] if attributes[:'jobDefinitionKey']

      raise 'You cannot provide both :jobDefinitionKey and :job_definition_key' if attributes.key?(:'jobDefinitionKey') && attributes.key?(:'job_definition_key')

      self.job_definition_key = attributes[:'job_definition_key'] if attributes[:'job_definition_key']

      self.job_key = attributes[:'jobKey'] if attributes[:'jobKey']

      raise 'You cannot provide both :jobKey and :job_key' if attributes.key?(:'jobKey') && attributes.key?(:'job_key')

      self.job_key = attributes[:'job_key'] if attributes[:'job_key']

      self.job_execution_key = attributes[:'jobExecutionKey'] if attributes[:'jobExecutionKey']

      raise 'You cannot provide both :jobExecutionKey and :job_execution_key' if attributes.key?(:'jobExecutionKey') && attributes.key?(:'job_execution_key')

      self.job_execution_key = attributes[:'job_execution_key'] if attributes[:'job_execution_key']

      self.source_key = attributes[:'sourceKey'] if attributes[:'sourceKey']

      raise 'You cannot provide both :sourceKey and :source_key' if attributes.key?(:'sourceKey') && attributes.key?(:'source_key')

      self.source_key = attributes[:'source_key'] if attributes[:'source_key']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        job_definition_name == other.job_definition_name &&
        job_definition_key == other.job_definition_key &&
        job_key == other.job_key &&
        job_execution_key == other.job_execution_key &&
        source_key == other.source_key
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
      [job_definition_name, job_definition_key, job_key, job_execution_key, source_key].hash
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
