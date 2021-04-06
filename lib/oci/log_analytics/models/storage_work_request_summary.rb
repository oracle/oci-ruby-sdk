# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This is the summary of a storage work request.
  #
  class LogAnalytics::Models::StorageWorkRequestSummary
    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATA_TYPE_ENUM = [
      DATA_TYPE_LOG = 'LOG'.freeze,
      DATA_TYPE_LOOKUP = 'LOOKUP'.freeze,
      DATA_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_OFFBOARD_TENANCY = 'OFFBOARD_TENANCY'.freeze,
      OPERATION_TYPE_PURGE_STORAGE_DATA = 'PURGE_STORAGE_DATA'.freeze,
      OPERATION_TYPE_RECALL_ARCHIVED_STORAGE_DATA = 'RECALL_ARCHIVED_STORAGE_DATA'.freeze,
      OPERATION_TYPE_RELEASE_RECALLED_STORAGE_DATA = 'RELEASE_RECALLED_STORAGE_DATA'.freeze,
      OPERATION_TYPE_ARCHIVE_STORAGE_DATA = 'ARCHIVE_STORAGE_DATA'.freeze,
      OPERATION_TYPE_CLEANUP_ARCHIVAL_STORAGE_DATA = 'CLEANUP_ARCHIVAL_STORAGE_DATA'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** This is the OCID of the storage work Request.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # When the work request started.
    # @return [DateTime]
    attr_accessor :time_started

    # When the work request was accepted. Should match timeStarted in all cases.
    #
    # @return [DateTime]
    attr_accessor :time_accepted

    # When the work request finished execution.
    # @return [DateTime]
    attr_accessor :time_finished

    # When the work request will expire.
    # @return [DateTime]
    attr_accessor :time_expires

    # Percentage progress completion of the work request.
    #
    # @return [Integer]
    attr_accessor :percent_complete

    # **[Required]** This is the work request status.
    #
    # @return [String]
    attr_reader :status

    # This is the start of the time interval
    # @return [DateTime]
    attr_accessor :time_data_started

    # **[Required]** This is the end of the time interval
    # @return [DateTime]
    attr_accessor :time_data_ended

    # This is the solr query used to filter data for purge, '*' means all
    # @return [String]
    attr_accessor :purge_query_string

    # **[Required]** Thie is the type of data to be purged
    # @return [String]
    attr_reader :data_type

    # This provides more detailed status if applicable
    # @return [String]
    attr_accessor :status_details

    # This provides more detailed info about the work request if applicable
    # @return [String]
    attr_accessor :operation_details

    # This is the policy name if applicable (e.g. purge policy)
    # @return [String]
    attr_accessor :policy_name

    # This is the purge policy ID if applicable
    # @return [String]
    attr_accessor :policy_id

    # This is the data usage in bytes if applicable
    # @return [Integer]
    attr_accessor :storage_usage_in_bytes

    # If true, purge child compartments data, only applicable to purge request
    # @return [BOOLEAN]
    attr_accessor :compartment_id_in_subtree

    # **[Required]** This is the type of the work request.
    #
    # @return [String]
    attr_reader :operation_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'time_started': :'timeStarted',
        'time_accepted': :'timeAccepted',
        'time_finished': :'timeFinished',
        'time_expires': :'timeExpires',
        'percent_complete': :'percentComplete',
        'status': :'status',
        'time_data_started': :'timeDataStarted',
        'time_data_ended': :'timeDataEnded',
        'purge_query_string': :'purgeQueryString',
        'data_type': :'dataType',
        'status_details': :'statusDetails',
        'operation_details': :'operationDetails',
        'policy_name': :'policyName',
        'policy_id': :'policyId',
        'storage_usage_in_bytes': :'storageUsageInBytes',
        'compartment_id_in_subtree': :'compartmentIdInSubtree',
        'operation_type': :'operationType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'time_started': :'DateTime',
        'time_accepted': :'DateTime',
        'time_finished': :'DateTime',
        'time_expires': :'DateTime',
        'percent_complete': :'Integer',
        'status': :'String',
        'time_data_started': :'DateTime',
        'time_data_ended': :'DateTime',
        'purge_query_string': :'String',
        'data_type': :'String',
        'status_details': :'String',
        'operation_details': :'String',
        'policy_name': :'String',
        'policy_id': :'String',
        'storage_usage_in_bytes': :'Integer',
        'compartment_id_in_subtree': :'BOOLEAN',
        'operation_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [DateTime] :time_expires The value to assign to the {#time_expires} property
    # @option attributes [Integer] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_data_started The value to assign to the {#time_data_started} property
    # @option attributes [DateTime] :time_data_ended The value to assign to the {#time_data_ended} property
    # @option attributes [String] :purge_query_string The value to assign to the {#purge_query_string} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [String] :status_details The value to assign to the {#status_details} property
    # @option attributes [String] :operation_details The value to assign to the {#operation_details} property
    # @option attributes [String] :policy_name The value to assign to the {#policy_name} property
    # @option attributes [String] :policy_id The value to assign to the {#policy_id} property
    # @option attributes [Integer] :storage_usage_in_bytes The value to assign to the {#storage_usage_in_bytes} property
    # @option attributes [BOOLEAN] :compartment_id_in_subtree The value to assign to the {#compartment_id_in_subtree} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.time_expires = attributes[:'timeExpires'] if attributes[:'timeExpires']

      raise 'You cannot provide both :timeExpires and :time_expires' if attributes.key?(:'timeExpires') && attributes.key?(:'time_expires')

      self.time_expires = attributes[:'time_expires'] if attributes[:'time_expires']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_data_started = attributes[:'timeDataStarted'] if attributes[:'timeDataStarted']

      raise 'You cannot provide both :timeDataStarted and :time_data_started' if attributes.key?(:'timeDataStarted') && attributes.key?(:'time_data_started')

      self.time_data_started = attributes[:'time_data_started'] if attributes[:'time_data_started']

      self.time_data_ended = attributes[:'timeDataEnded'] if attributes[:'timeDataEnded']

      raise 'You cannot provide both :timeDataEnded and :time_data_ended' if attributes.key?(:'timeDataEnded') && attributes.key?(:'time_data_ended')

      self.time_data_ended = attributes[:'time_data_ended'] if attributes[:'time_data_ended']

      self.purge_query_string = attributes[:'purgeQueryString'] if attributes[:'purgeQueryString']

      raise 'You cannot provide both :purgeQueryString and :purge_query_string' if attributes.key?(:'purgeQueryString') && attributes.key?(:'purge_query_string')

      self.purge_query_string = attributes[:'purge_query_string'] if attributes[:'purge_query_string']

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.status_details = attributes[:'statusDetails'] if attributes[:'statusDetails']

      raise 'You cannot provide both :statusDetails and :status_details' if attributes.key?(:'statusDetails') && attributes.key?(:'status_details')

      self.status_details = attributes[:'status_details'] if attributes[:'status_details']

      self.operation_details = attributes[:'operationDetails'] if attributes[:'operationDetails']

      raise 'You cannot provide both :operationDetails and :operation_details' if attributes.key?(:'operationDetails') && attributes.key?(:'operation_details')

      self.operation_details = attributes[:'operation_details'] if attributes[:'operation_details']

      self.policy_name = attributes[:'policyName'] if attributes[:'policyName']

      raise 'You cannot provide both :policyName and :policy_name' if attributes.key?(:'policyName') && attributes.key?(:'policy_name')

      self.policy_name = attributes[:'policy_name'] if attributes[:'policy_name']

      self.policy_id = attributes[:'policyId'] if attributes[:'policyId']

      raise 'You cannot provide both :policyId and :policy_id' if attributes.key?(:'policyId') && attributes.key?(:'policy_id')

      self.policy_id = attributes[:'policy_id'] if attributes[:'policy_id']

      self.storage_usage_in_bytes = attributes[:'storageUsageInBytes'] if attributes[:'storageUsageInBytes']

      raise 'You cannot provide both :storageUsageInBytes and :storage_usage_in_bytes' if attributes.key?(:'storageUsageInBytes') && attributes.key?(:'storage_usage_in_bytes')

      self.storage_usage_in_bytes = attributes[:'storage_usage_in_bytes'] if attributes[:'storage_usage_in_bytes']

      self.compartment_id_in_subtree = attributes[:'compartmentIdInSubtree'] unless attributes[:'compartmentIdInSubtree'].nil?

      raise 'You cannot provide both :compartmentIdInSubtree and :compartment_id_in_subtree' if attributes.key?(:'compartmentIdInSubtree') && attributes.key?(:'compartment_id_in_subtree')

      self.compartment_id_in_subtree = attributes[:'compartment_id_in_subtree'] unless attributes[:'compartment_id_in_subtree'].nil?

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] data_type Object to be assigned
    def data_type=(data_type)
      # rubocop:disable Style/ConditionalAssignment
      if data_type && !DATA_TYPE_ENUM.include?(data_type)
        OCI.logger.debug("Unknown value for 'data_type' [" + data_type + "]. Mapping to 'DATA_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @data_type = DATA_TYPE_UNKNOWN_ENUM_VALUE
      else
        @data_type = data_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      # rubocop:disable Style/ConditionalAssignment
      if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)
        OCI.logger.debug("Unknown value for 'operation_type' [" + operation_type + "]. Mapping to 'OPERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_type = OPERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @operation_type = operation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        time_started == other.time_started &&
        time_accepted == other.time_accepted &&
        time_finished == other.time_finished &&
        time_expires == other.time_expires &&
        percent_complete == other.percent_complete &&
        status == other.status &&
        time_data_started == other.time_data_started &&
        time_data_ended == other.time_data_ended &&
        purge_query_string == other.purge_query_string &&
        data_type == other.data_type &&
        status_details == other.status_details &&
        operation_details == other.operation_details &&
        policy_name == other.policy_name &&
        policy_id == other.policy_id &&
        storage_usage_in_bytes == other.storage_usage_in_bytes &&
        compartment_id_in_subtree == other.compartment_id_in_subtree &&
        operation_type == other.operation_type
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
      [id, compartment_id, time_started, time_accepted, time_finished, time_expires, percent_complete, status, time_data_started, time_data_ended, purge_query_string, data_type, status_details, operation_details, policy_name, policy_id, storage_usage_in_bytes, compartment_id_in_subtree, operation_type].hash
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
