# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200107
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The schedule.
  class UsageApi::Models::Schedule
    OUTPUT_FILE_FORMAT_ENUM = [
      OUTPUT_FILE_FORMAT_CSV = 'CSV'.freeze,
      OUTPUT_FILE_FORMAT_PDF = 'PDF'.freeze,
      OUTPUT_FILE_FORMAT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID representing a unique shedule.
    # @return [String]
    attr_accessor :id

    # **[Required]** The unique name of the schedule created by the user.
    # @return [String]
    attr_accessor :name

    # **[Required]** The customer tenancy.
    # @return [String]
    attr_accessor :compartment_id

    # This attribute is required.
    # @return [OCI::UsageApi::Models::ResultLocation]
    attr_accessor :result_location

    # The description of the schedule.
    # @return [String]
    attr_accessor :description

    # The date and time of the next job execution.
    # @return [DateTime]
    attr_accessor :time_next_run

    # Specifies the supported output file format.
    # @return [String]
    attr_reader :output_file_format

    # The saved report ID which can also be used to generate a query.
    # @return [String]
    attr_accessor :saved_report_id

    # **[Required]** Specifies the frequency according to when the schedule will be run,
    # in the x-obmcs-recurring-time format described in [RFC 5545 section 3.3.10](https://datatracker.ietf.org/doc/html/rfc5545#section-3.3.10).
    # Supported values are : ONE_TIME, DAILY, WEEKLY and MONTHLY.
    #
    # @return [String]
    attr_accessor :schedule_recurrences

    # **[Required]** The date and time of the first time job execution.
    # @return [DateTime]
    attr_accessor :time_scheduled

    # @return [OCI::UsageApi::Models::QueryProperties]
    attr_accessor :query_properties

    # **[Required]** The date and time the schedule was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The schedule lifecycle state.
    # @return [String]
    attr_reader :lifecycle_state

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'result_location': :'resultLocation',
        'description': :'description',
        'time_next_run': :'timeNextRun',
        'output_file_format': :'outputFileFormat',
        'saved_report_id': :'savedReportId',
        'schedule_recurrences': :'scheduleRecurrences',
        'time_scheduled': :'timeScheduled',
        'query_properties': :'queryProperties',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'result_location': :'OCI::UsageApi::Models::ResultLocation',
        'description': :'String',
        'time_next_run': :'DateTime',
        'output_file_format': :'String',
        'saved_report_id': :'String',
        'schedule_recurrences': :'String',
        'time_scheduled': :'DateTime',
        'query_properties': :'OCI::UsageApi::Models::QueryProperties',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::UsageApi::Models::ResultLocation] :result_location The value to assign to the {#result_location} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_next_run The value to assign to the {#time_next_run} property
    # @option attributes [String] :output_file_format The value to assign to the {#output_file_format} property
    # @option attributes [String] :saved_report_id The value to assign to the {#saved_report_id} property
    # @option attributes [String] :schedule_recurrences The value to assign to the {#schedule_recurrences} property
    # @option attributes [DateTime] :time_scheduled The value to assign to the {#time_scheduled} property
    # @option attributes [OCI::UsageApi::Models::QueryProperties] :query_properties The value to assign to the {#query_properties} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.result_location = attributes[:'resultLocation'] if attributes[:'resultLocation']

      raise 'You cannot provide both :resultLocation and :result_location' if attributes.key?(:'resultLocation') && attributes.key?(:'result_location')

      self.result_location = attributes[:'result_location'] if attributes[:'result_location']

      self.description = attributes[:'description'] if attributes[:'description']

      self.time_next_run = attributes[:'timeNextRun'] if attributes[:'timeNextRun']

      raise 'You cannot provide both :timeNextRun and :time_next_run' if attributes.key?(:'timeNextRun') && attributes.key?(:'time_next_run')

      self.time_next_run = attributes[:'time_next_run'] if attributes[:'time_next_run']

      self.output_file_format = attributes[:'outputFileFormat'] if attributes[:'outputFileFormat']
      self.output_file_format = "CSV" if output_file_format.nil? && !attributes.key?(:'outputFileFormat') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :outputFileFormat and :output_file_format' if attributes.key?(:'outputFileFormat') && attributes.key?(:'output_file_format')

      self.output_file_format = attributes[:'output_file_format'] if attributes[:'output_file_format']
      self.output_file_format = "CSV" if output_file_format.nil? && !attributes.key?(:'outputFileFormat') && !attributes.key?(:'output_file_format') # rubocop:disable Style/StringLiterals

      self.saved_report_id = attributes[:'savedReportId'] if attributes[:'savedReportId']

      raise 'You cannot provide both :savedReportId and :saved_report_id' if attributes.key?(:'savedReportId') && attributes.key?(:'saved_report_id')

      self.saved_report_id = attributes[:'saved_report_id'] if attributes[:'saved_report_id']

      self.schedule_recurrences = attributes[:'scheduleRecurrences'] if attributes[:'scheduleRecurrences']

      raise 'You cannot provide both :scheduleRecurrences and :schedule_recurrences' if attributes.key?(:'scheduleRecurrences') && attributes.key?(:'schedule_recurrences')

      self.schedule_recurrences = attributes[:'schedule_recurrences'] if attributes[:'schedule_recurrences']

      self.time_scheduled = attributes[:'timeScheduled'] if attributes[:'timeScheduled']

      raise 'You cannot provide both :timeScheduled and :time_scheduled' if attributes.key?(:'timeScheduled') && attributes.key?(:'time_scheduled')

      self.time_scheduled = attributes[:'time_scheduled'] if attributes[:'time_scheduled']

      self.query_properties = attributes[:'queryProperties'] if attributes[:'queryProperties']

      raise 'You cannot provide both :queryProperties and :query_properties' if attributes.key?(:'queryProperties') && attributes.key?(:'query_properties')

      self.query_properties = attributes[:'query_properties'] if attributes[:'query_properties']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] output_file_format Object to be assigned
    def output_file_format=(output_file_format)
      # rubocop:disable Style/ConditionalAssignment
      if output_file_format && !OUTPUT_FILE_FORMAT_ENUM.include?(output_file_format)
        OCI.logger.debug("Unknown value for 'output_file_format' [" + output_file_format + "]. Mapping to 'OUTPUT_FILE_FORMAT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @output_file_format = OUTPUT_FILE_FORMAT_UNKNOWN_ENUM_VALUE
      else
        @output_file_format = output_file_format
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
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
        name == other.name &&
        compartment_id == other.compartment_id &&
        result_location == other.result_location &&
        description == other.description &&
        time_next_run == other.time_next_run &&
        output_file_format == other.output_file_format &&
        saved_report_id == other.saved_report_id &&
        schedule_recurrences == other.schedule_recurrences &&
        time_scheduled == other.time_scheduled &&
        query_properties == other.query_properties &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, name, compartment_id, result_location, description, time_next_run, output_file_format, saved_report_id, schedule_recurrences, time_scheduled, query_properties, time_created, lifecycle_state, freeform_tags, defined_tags, system_tags].hash
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
