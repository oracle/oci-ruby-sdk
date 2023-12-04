# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220421
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A remediation run stage is one step of an remediation run. Each stage provides output logs and has a specific type.
  # The stages are: DETECT, RECOMMEND, VERIFY, and APPLY.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Adm::Models::RemediationRunStage
    STATUS_ENUM = [
      STATUS_CREATED = 'CREATED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TYPE_ENUM = [
      TYPE_DETECT = 'DETECT'.freeze,
      TYPE_RECOMMEND = 'RECOMMEND'.freeze,
      TYPE_VERIFY = 'VERIFY'.freeze,
      TYPE_APPLY = 'APPLY'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PREVIOUS_STAGE_TYPE_ENUM = [
      PREVIOUS_STAGE_TYPE_DETECT = 'DETECT'.freeze,
      PREVIOUS_STAGE_TYPE_RECOMMEND = 'RECOMMEND'.freeze,
      PREVIOUS_STAGE_TYPE_VERIFY = 'VERIFY'.freeze,
      PREVIOUS_STAGE_TYPE_APPLY = 'APPLY'.freeze,
      PREVIOUS_STAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NEXT_STAGE_TYPE_ENUM = [
      NEXT_STAGE_TYPE_DETECT = 'DETECT'.freeze,
      NEXT_STAGE_TYPE_RECOMMEND = 'RECOMMEND'.freeze,
      NEXT_STAGE_TYPE_VERIFY = 'VERIFY'.freeze,
      NEXT_STAGE_TYPE_APPLY = 'APPLY'.freeze,
      NEXT_STAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The current status of a remediation run stage.
    # @return [String]
    attr_reader :status

    # **[Required]** The creation date and time of the remediation run stage (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time of the start of the remediation run stage (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time of the finish of the remediation run stage (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    # @return [DateTime]
    attr_accessor :time_finished

    # **[Required]** The type of the remediation run stage.
    # @return [String]
    attr_reader :type

    # Information about the current step within the stage.
    # @return [String]
    attr_accessor :summary

    # **[Required]** The Oracle Cloud identifier ([OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)) of the remediation run.
    # @return [String]
    attr_accessor :remediation_run_id

    # The previous type of stage in the remediation run.
    # @return [String]
    attr_reader :previous_stage_type

    # The next type of stage in the remediation run.
    # @return [String]
    attr_reader :next_stage_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'status': :'status',
        'time_created': :'timeCreated',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'type': :'type',
        'summary': :'summary',
        'remediation_run_id': :'remediationRunId',
        'previous_stage_type': :'previousStageType',
        'next_stage_type': :'nextStageType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'status': :'String',
        'time_created': :'DateTime',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'type': :'String',
        'summary': :'String',
        'remediation_run_id': :'String',
        'previous_stage_type': :'String',
        'next_stage_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Adm::Models::RecommendStage' if type == 'RECOMMEND'
      return 'OCI::Adm::Models::VerifyStage' if type == 'VERIFY'
      return 'OCI::Adm::Models::ApplyStage' if type == 'APPLY'
      return 'OCI::Adm::Models::DetectStage' if type == 'DETECT'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Adm::Models::RemediationRunStage'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :summary The value to assign to the {#summary} property
    # @option attributes [String] :remediation_run_id The value to assign to the {#remediation_run_id} property
    # @option attributes [String] :previous_stage_type The value to assign to the {#previous_stage_type} property
    # @option attributes [String] :next_stage_type The value to assign to the {#next_stage_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.type = attributes[:'type'] if attributes[:'type']

      self.summary = attributes[:'summary'] if attributes[:'summary']

      self.remediation_run_id = attributes[:'remediationRunId'] if attributes[:'remediationRunId']

      raise 'You cannot provide both :remediationRunId and :remediation_run_id' if attributes.key?(:'remediationRunId') && attributes.key?(:'remediation_run_id')

      self.remediation_run_id = attributes[:'remediation_run_id'] if attributes[:'remediation_run_id']

      self.previous_stage_type = attributes[:'previousStageType'] if attributes[:'previousStageType']

      raise 'You cannot provide both :previousStageType and :previous_stage_type' if attributes.key?(:'previousStageType') && attributes.key?(:'previous_stage_type')

      self.previous_stage_type = attributes[:'previous_stage_type'] if attributes[:'previous_stage_type']

      self.next_stage_type = attributes[:'nextStageType'] if attributes[:'nextStageType']

      raise 'You cannot provide both :nextStageType and :next_stage_type' if attributes.key?(:'nextStageType') && attributes.key?(:'next_stage_type')

      self.next_stage_type = attributes[:'next_stage_type'] if attributes[:'next_stage_type']
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
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] previous_stage_type Object to be assigned
    def previous_stage_type=(previous_stage_type)
      # rubocop:disable Style/ConditionalAssignment
      if previous_stage_type && !PREVIOUS_STAGE_TYPE_ENUM.include?(previous_stage_type)
        OCI.logger.debug("Unknown value for 'previous_stage_type' [" + previous_stage_type + "]. Mapping to 'PREVIOUS_STAGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @previous_stage_type = PREVIOUS_STAGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @previous_stage_type = previous_stage_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] next_stage_type Object to be assigned
    def next_stage_type=(next_stage_type)
      # rubocop:disable Style/ConditionalAssignment
      if next_stage_type && !NEXT_STAGE_TYPE_ENUM.include?(next_stage_type)
        OCI.logger.debug("Unknown value for 'next_stage_type' [" + next_stage_type + "]. Mapping to 'NEXT_STAGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @next_stage_type = NEXT_STAGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @next_stage_type = next_stage_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        status == other.status &&
        time_created == other.time_created &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        type == other.type &&
        summary == other.summary &&
        remediation_run_id == other.remediation_run_id &&
        previous_stage_type == other.previous_stage_type &&
        next_stage_type == other.next_stage_type
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
      [status, time_created, time_started, time_finished, type, summary, remediation_run_id, previous_stage_type, next_stage_type].hash
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
