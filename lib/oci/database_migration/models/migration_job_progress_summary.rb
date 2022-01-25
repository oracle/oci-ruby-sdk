# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the progress of a Migration Job.
  #
  class DatabaseMigration::Models::MigrationJobProgressSummary
    CURRENT_PHASE_ENUM = [
      CURRENT_PHASE_ODMS_VALIDATE_TGT = 'ODMS_VALIDATE_TGT'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_SRC = 'ODMS_VALIDATE_SRC'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_PREMIGRATION_ADVISOR = 'ODMS_VALIDATE_PREMIGRATION_ADVISOR'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_GG_HUB = 'ODMS_VALIDATE_GG_HUB'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_DATAPUMP_SETTINGS = 'ODMS_VALIDATE_DATAPUMP_SETTINGS'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_DATAPUMP_SETTINGS_SRC = 'ODMS_VALIDATE_DATAPUMP_SETTINGS_SRC'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_DATAPUMP_SETTINGS_TGT = 'ODMS_VALIDATE_DATAPUMP_SETTINGS_TGT'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_DATAPUMP_SRC = 'ODMS_VALIDATE_DATAPUMP_SRC'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE_DATAPUMP_ESTIMATE_SRC = 'ODMS_VALIDATE_DATAPUMP_ESTIMATE_SRC'.freeze,
      CURRENT_PHASE_ODMS_VALIDATE = 'ODMS_VALIDATE'.freeze,
      CURRENT_PHASE_ODMS_PREPARE = 'ODMS_PREPARE'.freeze,
      CURRENT_PHASE_ODMS_INITIAL_LOAD_EXPORT = 'ODMS_INITIAL_LOAD_EXPORT'.freeze,
      CURRENT_PHASE_ODMS_DATA_UPLOAD = 'ODMS_DATA_UPLOAD'.freeze,
      CURRENT_PHASE_ODMS_INITIAL_LOAD_IMPORT = 'ODMS_INITIAL_LOAD_IMPORT'.freeze,
      CURRENT_PHASE_ODMS_POST_INITIAL_LOAD = 'ODMS_POST_INITIAL_LOAD'.freeze,
      CURRENT_PHASE_ODMS_PREPARE_REPLICATION_TARGET = 'ODMS_PREPARE_REPLICATION_TARGET'.freeze,
      CURRENT_PHASE_ODMS_MONITOR_REPLICATION_LAG = 'ODMS_MONITOR_REPLICATION_LAG'.freeze,
      CURRENT_PHASE_ODMS_SWITCHOVER = 'ODMS_SWITCHOVER'.freeze,
      CURRENT_PHASE_ODMS_CLEANUP = 'ODMS_CLEANUP'.freeze,
      CURRENT_PHASE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CURRENT_STATUS_ENUM = [
      CURRENT_STATUS_PENDING = 'PENDING'.freeze,
      CURRENT_STATUS_STARTED = 'STARTED'.freeze,
      CURRENT_STATUS_COMPLETED = 'COMPLETED'.freeze,
      CURRENT_STATUS_FAILED = 'FAILED'.freeze,
      CURRENT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Current phase of the job.
    #
    # @return [String]
    attr_reader :current_phase

    # **[Required]** Current status of the job.
    #
    # @return [String]
    attr_reader :current_status

    # **[Required]** Job progress percentage (0 - 100)
    #
    # @return [Integer]
    attr_accessor :job_progress

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'current_phase': :'currentPhase',
        'current_status': :'currentStatus',
        'job_progress': :'jobProgress'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'current_phase': :'String',
        'current_status': :'String',
        'job_progress': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :current_phase The value to assign to the {#current_phase} property
    # @option attributes [String] :current_status The value to assign to the {#current_status} property
    # @option attributes [Integer] :job_progress The value to assign to the {#job_progress} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.current_phase = attributes[:'currentPhase'] if attributes[:'currentPhase']

      raise 'You cannot provide both :currentPhase and :current_phase' if attributes.key?(:'currentPhase') && attributes.key?(:'current_phase')

      self.current_phase = attributes[:'current_phase'] if attributes[:'current_phase']

      self.current_status = attributes[:'currentStatus'] if attributes[:'currentStatus']

      raise 'You cannot provide both :currentStatus and :current_status' if attributes.key?(:'currentStatus') && attributes.key?(:'current_status')

      self.current_status = attributes[:'current_status'] if attributes[:'current_status']

      self.job_progress = attributes[:'jobProgress'] if attributes[:'jobProgress']

      raise 'You cannot provide both :jobProgress and :job_progress' if attributes.key?(:'jobProgress') && attributes.key?(:'job_progress')

      self.job_progress = attributes[:'job_progress'] if attributes[:'job_progress']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] current_phase Object to be assigned
    def current_phase=(current_phase)
      # rubocop:disable Style/ConditionalAssignment
      if current_phase && !CURRENT_PHASE_ENUM.include?(current_phase)
        OCI.logger.debug("Unknown value for 'current_phase' [" + current_phase + "]. Mapping to 'CURRENT_PHASE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @current_phase = CURRENT_PHASE_UNKNOWN_ENUM_VALUE
      else
        @current_phase = current_phase
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] current_status Object to be assigned
    def current_status=(current_status)
      # rubocop:disable Style/ConditionalAssignment
      if current_status && !CURRENT_STATUS_ENUM.include?(current_status)
        OCI.logger.debug("Unknown value for 'current_status' [" + current_status + "]. Mapping to 'CURRENT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @current_status = CURRENT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @current_status = current_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        current_phase == other.current_phase &&
        current_status == other.current_status &&
        job_progress == other.job_progress
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
      [current_phase, current_status, job_progress].hash
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
