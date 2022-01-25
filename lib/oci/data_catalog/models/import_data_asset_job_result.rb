# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about a data asset import operation.
  class DataCatalog::Models::ImportDataAssetJobResult
    IMPORT_JOB_EXECUTION_STATUS_ENUM = [
      IMPORT_JOB_EXECUTION_STATUS_CREATED = 'CREATED'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_INACTIVE = 'INACTIVE'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_FAILED = 'FAILED'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_CANCELED = 'CANCELED'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_SUCCEEDED_WITH_WARNINGS = 'SUCCEEDED_WITH_WARNINGS'.freeze,
      IMPORT_JOB_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique key of the data asset on which import is triggered.
    # @return [String]
    attr_accessor :data_asset_key

    # The unique key of the job definition resource that is used for the import.
    # @return [String]
    attr_accessor :import_job_definition_key

    # The unique key of the job policy for the import.
    # @return [String]
    attr_accessor :import_job_key

    # The unique key of the parent job execution for which the log resource is created.
    # @return [String]
    attr_accessor :import_job_execution_key

    # The status of the import job execution.
    # @return [String]
    attr_reader :import_job_execution_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'data_asset_key': :'dataAssetKey',
        'import_job_definition_key': :'importJobDefinitionKey',
        'import_job_key': :'importJobKey',
        'import_job_execution_key': :'importJobExecutionKey',
        'import_job_execution_status': :'importJobExecutionStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'data_asset_key': :'String',
        'import_job_definition_key': :'String',
        'import_job_key': :'String',
        'import_job_execution_key': :'String',
        'import_job_execution_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :data_asset_key The value to assign to the {#data_asset_key} property
    # @option attributes [String] :import_job_definition_key The value to assign to the {#import_job_definition_key} property
    # @option attributes [String] :import_job_key The value to assign to the {#import_job_key} property
    # @option attributes [String] :import_job_execution_key The value to assign to the {#import_job_execution_key} property
    # @option attributes [String] :import_job_execution_status The value to assign to the {#import_job_execution_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.data_asset_key = attributes[:'dataAssetKey'] if attributes[:'dataAssetKey']

      raise 'You cannot provide both :dataAssetKey and :data_asset_key' if attributes.key?(:'dataAssetKey') && attributes.key?(:'data_asset_key')

      self.data_asset_key = attributes[:'data_asset_key'] if attributes[:'data_asset_key']

      self.import_job_definition_key = attributes[:'importJobDefinitionKey'] if attributes[:'importJobDefinitionKey']

      raise 'You cannot provide both :importJobDefinitionKey and :import_job_definition_key' if attributes.key?(:'importJobDefinitionKey') && attributes.key?(:'import_job_definition_key')

      self.import_job_definition_key = attributes[:'import_job_definition_key'] if attributes[:'import_job_definition_key']

      self.import_job_key = attributes[:'importJobKey'] if attributes[:'importJobKey']

      raise 'You cannot provide both :importJobKey and :import_job_key' if attributes.key?(:'importJobKey') && attributes.key?(:'import_job_key')

      self.import_job_key = attributes[:'import_job_key'] if attributes[:'import_job_key']

      self.import_job_execution_key = attributes[:'importJobExecutionKey'] if attributes[:'importJobExecutionKey']

      raise 'You cannot provide both :importJobExecutionKey and :import_job_execution_key' if attributes.key?(:'importJobExecutionKey') && attributes.key?(:'import_job_execution_key')

      self.import_job_execution_key = attributes[:'import_job_execution_key'] if attributes[:'import_job_execution_key']

      self.import_job_execution_status = attributes[:'importJobExecutionStatus'] if attributes[:'importJobExecutionStatus']

      raise 'You cannot provide both :importJobExecutionStatus and :import_job_execution_status' if attributes.key?(:'importJobExecutionStatus') && attributes.key?(:'import_job_execution_status')

      self.import_job_execution_status = attributes[:'import_job_execution_status'] if attributes[:'import_job_execution_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] import_job_execution_status Object to be assigned
    def import_job_execution_status=(import_job_execution_status)
      # rubocop:disable Style/ConditionalAssignment
      if import_job_execution_status && !IMPORT_JOB_EXECUTION_STATUS_ENUM.include?(import_job_execution_status)
        OCI.logger.debug("Unknown value for 'import_job_execution_status' [" + import_job_execution_status + "]. Mapping to 'IMPORT_JOB_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @import_job_execution_status = IMPORT_JOB_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @import_job_execution_status = import_job_execution_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        data_asset_key == other.data_asset_key &&
        import_job_definition_key == other.import_job_definition_key &&
        import_job_key == other.import_job_key &&
        import_job_execution_key == other.import_job_execution_key &&
        import_job_execution_status == other.import_job_execution_status
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
      [data_asset_key, import_job_definition_key, import_job_key, import_job_execution_key, import_job_execution_status].hash
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
