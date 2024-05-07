# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200601
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This is the information about recalled data
  class LogAnalytics::Models::RecalledData
    STATUS_ENUM = [
      STATUS_RECALLED = 'RECALLED'.freeze,
      STATUS_PENDING = 'PENDING'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** This is the end of the time range of the related data
    # @return [DateTime]
    attr_accessor :time_data_ended

    # **[Required]** This is the start of the time range of the related data
    # @return [DateTime]
    attr_accessor :time_data_started

    # **[Required]** This is the time when the first recall operation was started for this RecalledData
    # @return [DateTime]
    attr_accessor :time_started

    # **[Required]** This is the status of the recall
    # @return [String]
    attr_reader :status

    # **[Required]** This is the number of recall operations for this recall.  Note one RecalledData can be merged from the results
    # of several recall operations if the time duration of the results of the recall operations overlap.
    #
    # @return [Integer]
    attr_accessor :recall_count

    # **[Required]** This is the size in bytes
    # @return [Integer]
    attr_accessor :storage_usage_in_bytes

    # **[Required]** This is the size of the archival data not recalled yet within the specified time range
    # @return [Integer]
    attr_accessor :not_recalled_data_in_bytes

    # **[Required]** This is the purpose of the recall
    # @return [String]
    attr_accessor :purpose

    # **[Required]** This is the query associated with the recall
    # @return [String]
    attr_accessor :query_string

    # **[Required]** This is the list of logsets associated with the recall
    # @return [String]
    attr_accessor :log_sets

    # **[Required]** This is the user who initiated the recall request
    # @return [String]
    attr_accessor :created_by

    # **[Required]** This is the id for the recalled data collection
    # @return [Integer]
    attr_accessor :collection_id

    # **[Required]** This is the recalled date start time
    # @return [DateTime]
    attr_accessor :time_recalled_data_started

    # **[Required]** This is the recalled data end time
    # @return [DateTime]
    attr_accessor :time_recalled_data_ended

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_data_ended': :'timeDataEnded',
        'time_data_started': :'timeDataStarted',
        'time_started': :'timeStarted',
        'status': :'status',
        'recall_count': :'recallCount',
        'storage_usage_in_bytes': :'storageUsageInBytes',
        'not_recalled_data_in_bytes': :'notRecalledDataInBytes',
        'purpose': :'purpose',
        'query_string': :'queryString',
        'log_sets': :'logSets',
        'created_by': :'createdBy',
        'collection_id': :'collectionId',
        'time_recalled_data_started': :'timeRecalledDataStarted',
        'time_recalled_data_ended': :'timeRecalledDataEnded'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_data_ended': :'DateTime',
        'time_data_started': :'DateTime',
        'time_started': :'DateTime',
        'status': :'String',
        'recall_count': :'Integer',
        'storage_usage_in_bytes': :'Integer',
        'not_recalled_data_in_bytes': :'Integer',
        'purpose': :'String',
        'query_string': :'String',
        'log_sets': :'String',
        'created_by': :'String',
        'collection_id': :'Integer',
        'time_recalled_data_started': :'DateTime',
        'time_recalled_data_ended': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_data_ended The value to assign to the {#time_data_ended} property
    # @option attributes [DateTime] :time_data_started The value to assign to the {#time_data_started} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Integer] :recall_count The value to assign to the {#recall_count} property
    # @option attributes [Integer] :storage_usage_in_bytes The value to assign to the {#storage_usage_in_bytes} property
    # @option attributes [Integer] :not_recalled_data_in_bytes The value to assign to the {#not_recalled_data_in_bytes} property
    # @option attributes [String] :purpose The value to assign to the {#purpose} property
    # @option attributes [String] :query_string The value to assign to the {#query_string} property
    # @option attributes [String] :log_sets The value to assign to the {#log_sets} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [Integer] :collection_id The value to assign to the {#collection_id} property
    # @option attributes [DateTime] :time_recalled_data_started The value to assign to the {#time_recalled_data_started} property
    # @option attributes [DateTime] :time_recalled_data_ended The value to assign to the {#time_recalled_data_ended} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_data_ended = attributes[:'timeDataEnded'] if attributes[:'timeDataEnded']

      raise 'You cannot provide both :timeDataEnded and :time_data_ended' if attributes.key?(:'timeDataEnded') && attributes.key?(:'time_data_ended')

      self.time_data_ended = attributes[:'time_data_ended'] if attributes[:'time_data_ended']

      self.time_data_started = attributes[:'timeDataStarted'] if attributes[:'timeDataStarted']

      raise 'You cannot provide both :timeDataStarted and :time_data_started' if attributes.key?(:'timeDataStarted') && attributes.key?(:'time_data_started')

      self.time_data_started = attributes[:'time_data_started'] if attributes[:'time_data_started']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.status = attributes[:'status'] if attributes[:'status']

      self.recall_count = attributes[:'recallCount'] if attributes[:'recallCount']

      raise 'You cannot provide both :recallCount and :recall_count' if attributes.key?(:'recallCount') && attributes.key?(:'recall_count')

      self.recall_count = attributes[:'recall_count'] if attributes[:'recall_count']

      self.storage_usage_in_bytes = attributes[:'storageUsageInBytes'] if attributes[:'storageUsageInBytes']

      raise 'You cannot provide both :storageUsageInBytes and :storage_usage_in_bytes' if attributes.key?(:'storageUsageInBytes') && attributes.key?(:'storage_usage_in_bytes')

      self.storage_usage_in_bytes = attributes[:'storage_usage_in_bytes'] if attributes[:'storage_usage_in_bytes']

      self.not_recalled_data_in_bytes = attributes[:'notRecalledDataInBytes'] if attributes[:'notRecalledDataInBytes']

      raise 'You cannot provide both :notRecalledDataInBytes and :not_recalled_data_in_bytes' if attributes.key?(:'notRecalledDataInBytes') && attributes.key?(:'not_recalled_data_in_bytes')

      self.not_recalled_data_in_bytes = attributes[:'not_recalled_data_in_bytes'] if attributes[:'not_recalled_data_in_bytes']

      self.purpose = attributes[:'purpose'] if attributes[:'purpose']

      self.query_string = attributes[:'queryString'] if attributes[:'queryString']

      raise 'You cannot provide both :queryString and :query_string' if attributes.key?(:'queryString') && attributes.key?(:'query_string')

      self.query_string = attributes[:'query_string'] if attributes[:'query_string']

      self.log_sets = attributes[:'logSets'] if attributes[:'logSets']

      raise 'You cannot provide both :logSets and :log_sets' if attributes.key?(:'logSets') && attributes.key?(:'log_sets')

      self.log_sets = attributes[:'log_sets'] if attributes[:'log_sets']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.collection_id = attributes[:'collectionId'] if attributes[:'collectionId']

      raise 'You cannot provide both :collectionId and :collection_id' if attributes.key?(:'collectionId') && attributes.key?(:'collection_id')

      self.collection_id = attributes[:'collection_id'] if attributes[:'collection_id']

      self.time_recalled_data_started = attributes[:'timeRecalledDataStarted'] if attributes[:'timeRecalledDataStarted']

      raise 'You cannot provide both :timeRecalledDataStarted and :time_recalled_data_started' if attributes.key?(:'timeRecalledDataStarted') && attributes.key?(:'time_recalled_data_started')

      self.time_recalled_data_started = attributes[:'time_recalled_data_started'] if attributes[:'time_recalled_data_started']

      self.time_recalled_data_ended = attributes[:'timeRecalledDataEnded'] if attributes[:'timeRecalledDataEnded']

      raise 'You cannot provide both :timeRecalledDataEnded and :time_recalled_data_ended' if attributes.key?(:'timeRecalledDataEnded') && attributes.key?(:'time_recalled_data_ended')

      self.time_recalled_data_ended = attributes[:'time_recalled_data_ended'] if attributes[:'time_recalled_data_ended']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_data_ended == other.time_data_ended &&
        time_data_started == other.time_data_started &&
        time_started == other.time_started &&
        status == other.status &&
        recall_count == other.recall_count &&
        storage_usage_in_bytes == other.storage_usage_in_bytes &&
        not_recalled_data_in_bytes == other.not_recalled_data_in_bytes &&
        purpose == other.purpose &&
        query_string == other.query_string &&
        log_sets == other.log_sets &&
        created_by == other.created_by &&
        collection_id == other.collection_id &&
        time_recalled_data_started == other.time_recalled_data_started &&
        time_recalled_data_ended == other.time_recalled_data_ended
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
      [time_data_ended, time_data_started, time_started, status, recall_count, storage_usage_in_bytes, not_recalled_data_in_bytes, purpose, query_string, log_sets, created_by, collection_id, time_recalled_data_started, time_recalled_data_ended].hash
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
