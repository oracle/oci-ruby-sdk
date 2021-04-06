# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of Upload File.
  class LogAnalytics::Models::UploadFileSummary
    STATUS_ENUM = [
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCESSFUL = 'SUCCESSFUL'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique internal identifier to refer upload file.
    # @return [String]
    attr_accessor :reference

    # **[Required]** Name of the file
    # @return [String]
    attr_accessor :name

    # Processing status of the file.
    # @return [String]
    attr_reader :status

    # Number of estimated chunks for this file. A chunk is a portion of the log file used for the processing.
    # @return [Float]
    attr_accessor :total_chunks

    # Number of chunks processed.
    # @return [Float]
    attr_accessor :chunks_consumed

    # Number of chunks processed successfully.
    # @return [Float]
    attr_accessor :chunks_success

    # Number of chunks failed processing.
    # @return [Float]
    attr_accessor :chunks_fail

    # The time when this file processing started.
    # @return [DateTime]
    attr_accessor :time_started

    # Name of the log source used for processing this file.
    # @return [String]
    attr_accessor :source_name

    # Name of the entity type.
    # @return [String]
    attr_accessor :entity_type

    # Name of the entity associated with the file.
    # @return [String]
    attr_accessor :entity_name

    # (Deprecated) Name of the log namespace associated with the file.
    # @return [String]
    attr_accessor :log_namespace

    # Log group OCID associated with the file.
    # @return [String]
    attr_accessor :log_group_id

    # Name of the log group associated with the file.
    # @return [String]
    attr_accessor :log_group_name

    # The details about upload processing failure.
    # @return [String]
    attr_accessor :failure_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'reference': :'reference',
        'name': :'name',
        'status': :'status',
        'total_chunks': :'totalChunks',
        'chunks_consumed': :'chunksConsumed',
        'chunks_success': :'chunksSuccess',
        'chunks_fail': :'chunksFail',
        'time_started': :'timeStarted',
        'source_name': :'sourceName',
        'entity_type': :'entityType',
        'entity_name': :'entityName',
        'log_namespace': :'logNamespace',
        'log_group_id': :'logGroupId',
        'log_group_name': :'logGroupName',
        'failure_details': :'failureDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'reference': :'String',
        'name': :'String',
        'status': :'String',
        'total_chunks': :'Float',
        'chunks_consumed': :'Float',
        'chunks_success': :'Float',
        'chunks_fail': :'Float',
        'time_started': :'DateTime',
        'source_name': :'String',
        'entity_type': :'String',
        'entity_name': :'String',
        'log_namespace': :'String',
        'log_group_id': :'String',
        'log_group_name': :'String',
        'failure_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :reference The value to assign to the {#reference} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Float] :total_chunks The value to assign to the {#total_chunks} property
    # @option attributes [Float] :chunks_consumed The value to assign to the {#chunks_consumed} property
    # @option attributes [Float] :chunks_success The value to assign to the {#chunks_success} property
    # @option attributes [Float] :chunks_fail The value to assign to the {#chunks_fail} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [String] :source_name The value to assign to the {#source_name} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [String] :entity_name The value to assign to the {#entity_name} property
    # @option attributes [String] :log_namespace The value to assign to the {#log_namespace} property
    # @option attributes [String] :log_group_id The value to assign to the {#log_group_id} property
    # @option attributes [String] :log_group_name The value to assign to the {#log_group_name} property
    # @option attributes [String] :failure_details The value to assign to the {#failure_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.reference = attributes[:'reference'] if attributes[:'reference']

      self.name = attributes[:'name'] if attributes[:'name']

      self.status = attributes[:'status'] if attributes[:'status']

      self.total_chunks = attributes[:'totalChunks'] if attributes[:'totalChunks']

      raise 'You cannot provide both :totalChunks and :total_chunks' if attributes.key?(:'totalChunks') && attributes.key?(:'total_chunks')

      self.total_chunks = attributes[:'total_chunks'] if attributes[:'total_chunks']

      self.chunks_consumed = attributes[:'chunksConsumed'] if attributes[:'chunksConsumed']

      raise 'You cannot provide both :chunksConsumed and :chunks_consumed' if attributes.key?(:'chunksConsumed') && attributes.key?(:'chunks_consumed')

      self.chunks_consumed = attributes[:'chunks_consumed'] if attributes[:'chunks_consumed']

      self.chunks_success = attributes[:'chunksSuccess'] if attributes[:'chunksSuccess']

      raise 'You cannot provide both :chunksSuccess and :chunks_success' if attributes.key?(:'chunksSuccess') && attributes.key?(:'chunks_success')

      self.chunks_success = attributes[:'chunks_success'] if attributes[:'chunks_success']

      self.chunks_fail = attributes[:'chunksFail'] if attributes[:'chunksFail']

      raise 'You cannot provide both :chunksFail and :chunks_fail' if attributes.key?(:'chunksFail') && attributes.key?(:'chunks_fail')

      self.chunks_fail = attributes[:'chunks_fail'] if attributes[:'chunks_fail']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.source_name = attributes[:'sourceName'] if attributes[:'sourceName']

      raise 'You cannot provide both :sourceName and :source_name' if attributes.key?(:'sourceName') && attributes.key?(:'source_name')

      self.source_name = attributes[:'source_name'] if attributes[:'source_name']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.entity_name = attributes[:'entityName'] if attributes[:'entityName']

      raise 'You cannot provide both :entityName and :entity_name' if attributes.key?(:'entityName') && attributes.key?(:'entity_name')

      self.entity_name = attributes[:'entity_name'] if attributes[:'entity_name']

      self.log_namespace = attributes[:'logNamespace'] if attributes[:'logNamespace']

      raise 'You cannot provide both :logNamespace and :log_namespace' if attributes.key?(:'logNamespace') && attributes.key?(:'log_namespace')

      self.log_namespace = attributes[:'log_namespace'] if attributes[:'log_namespace']

      self.log_group_id = attributes[:'logGroupId'] if attributes[:'logGroupId']

      raise 'You cannot provide both :logGroupId and :log_group_id' if attributes.key?(:'logGroupId') && attributes.key?(:'log_group_id')

      self.log_group_id = attributes[:'log_group_id'] if attributes[:'log_group_id']

      self.log_group_name = attributes[:'logGroupName'] if attributes[:'logGroupName']

      raise 'You cannot provide both :logGroupName and :log_group_name' if attributes.key?(:'logGroupName') && attributes.key?(:'log_group_name')

      self.log_group_name = attributes[:'log_group_name'] if attributes[:'log_group_name']

      self.failure_details = attributes[:'failureDetails'] if attributes[:'failureDetails']

      raise 'You cannot provide both :failureDetails and :failure_details' if attributes.key?(:'failureDetails') && attributes.key?(:'failure_details')

      self.failure_details = attributes[:'failure_details'] if attributes[:'failure_details']
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
        reference == other.reference &&
        name == other.name &&
        status == other.status &&
        total_chunks == other.total_chunks &&
        chunks_consumed == other.chunks_consumed &&
        chunks_success == other.chunks_success &&
        chunks_fail == other.chunks_fail &&
        time_started == other.time_started &&
        source_name == other.source_name &&
        entity_type == other.entity_type &&
        entity_name == other.entity_name &&
        log_namespace == other.log_namespace &&
        log_group_id == other.log_group_id &&
        log_group_name == other.log_group_name &&
        failure_details == other.failure_details
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
      [reference, name, status, total_chunks, chunks_consumed, chunks_success, chunks_fail, time_started, source_name, entity_type, entity_name, log_namespace, log_group_id, log_group_name, failure_details].hash
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
