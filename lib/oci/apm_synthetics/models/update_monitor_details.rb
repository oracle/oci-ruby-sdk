# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the request body used to update a monitor.
  class ApmSynthetics::Models::UpdateMonitorDetails
    STATUS_ENUM = [
      STATUS_ENABLED = 'ENABLED'.freeze,
      STATUS_DISABLED = 'DISABLED'.freeze,
      STATUS_INVALID = 'INVALID'.freeze
    ].freeze

    # Unique name that can be edited. The name should not contain any confidential information.
    # @return [String]
    attr_accessor :display_name

    # A list of public and dedicated vantage points from which to execute the monitor.
    # Use /publicVantagePoints to fetch public vantage points, and /dedicatedVantagePoints to fetch dedicated vantage points.
    #
    # @return [Array<String>]
    attr_accessor :vantage_points

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the script.
    # scriptId is mandatory for creation of SCRIPTED_BROWSER and SCRIPTED_REST monitor types. For other monitor types, it should be set to null.
    #
    # @return [String]
    attr_accessor :script_id

    # Enables or disables the monitor.
    # @return [String]
    attr_reader :status

    # Interval in seconds after the start time when the job should be repeated.
    # Minimum repeatIntervalInSeconds should be 300 seconds for Scripted REST, Scripted Browser and Browser monitors, and 60 seconds for REST monitor.
    #
    # @return [Integer]
    attr_accessor :repeat_interval_in_seconds

    # If runOnce is enabled, then the monitor will run once.
    # @return [BOOLEAN]
    attr_accessor :is_run_once

    # Timeout in seconds. Timeout cannot be more than 30% of repeatIntervalInSeconds time for monitors.
    # Also, timeoutInSeconds should be a multiple of 60 for Scripted REST, Scripted Browser and Browser monitors.
    # Monitor will be allowed to run only for timeoutInSeconds time. It would be terminated after that.
    #
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # Specify the endpoint on which to run the monitor.
    # For BROWSER and REST monitor types, target is mandatory.
    # If target is specified in the SCRIPTED_BROWSER monitor type, then the monitor will run the selected script (specified by scriptId in monitor) against the specified target endpoint.
    # If target is not specified in the SCRIPTED_BROWSER monitor type, then the monitor will run the selected script as it is.
    #
    # @return [String]
    attr_accessor :target

    # List of script parameters in the monitor.
    # This is valid only for SCRIPTED_BROWSER and SCRIPTED_REST monitor types. For other monitor types, it should be set to null.
    # Example: `[{\"paramName\": \"userid\", \"paramValue\":\"testuser\"}]`
    #
    # @return [Array<OCI::ApmSynthetics::Models::MonitorScriptParameter>]
    attr_accessor :script_parameters

    # @return [OCI::ApmSynthetics::Models::MonitorConfiguration]
    attr_accessor :configuration

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'vantage_points': :'vantagePoints',
        'script_id': :'scriptId',
        'status': :'status',
        'repeat_interval_in_seconds': :'repeatIntervalInSeconds',
        'is_run_once': :'isRunOnce',
        'timeout_in_seconds': :'timeoutInSeconds',
        'target': :'target',
        'script_parameters': :'scriptParameters',
        'configuration': :'configuration',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'vantage_points': :'Array<String>',
        'script_id': :'String',
        'status': :'String',
        'repeat_interval_in_seconds': :'Integer',
        'is_run_once': :'BOOLEAN',
        'timeout_in_seconds': :'Integer',
        'target': :'String',
        'script_parameters': :'Array<OCI::ApmSynthetics::Models::MonitorScriptParameter>',
        'configuration': :'OCI::ApmSynthetics::Models::MonitorConfiguration',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Array<String>] :vantage_points The value to assign to the {#vantage_points} property
    # @option attributes [String] :script_id The value to assign to the {#script_id} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Integer] :repeat_interval_in_seconds The value to assign to the {#repeat_interval_in_seconds} property
    # @option attributes [BOOLEAN] :is_run_once The value to assign to the {#is_run_once} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    # @option attributes [String] :target The value to assign to the {#target} property
    # @option attributes [Array<OCI::ApmSynthetics::Models::MonitorScriptParameter>] :script_parameters The value to assign to the {#script_parameters} property
    # @option attributes [OCI::ApmSynthetics::Models::MonitorConfiguration] :configuration The value to assign to the {#configuration} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.vantage_points = attributes[:'vantagePoints'] if attributes[:'vantagePoints']

      raise 'You cannot provide both :vantagePoints and :vantage_points' if attributes.key?(:'vantagePoints') && attributes.key?(:'vantage_points')

      self.vantage_points = attributes[:'vantage_points'] if attributes[:'vantage_points']

      self.script_id = attributes[:'scriptId'] if attributes[:'scriptId']

      raise 'You cannot provide both :scriptId and :script_id' if attributes.key?(:'scriptId') && attributes.key?(:'script_id')

      self.script_id = attributes[:'script_id'] if attributes[:'script_id']

      self.status = attributes[:'status'] if attributes[:'status']
      self.status = "ENABLED" if status.nil? && !attributes.key?(:'status') # rubocop:disable Style/StringLiterals

      self.repeat_interval_in_seconds = attributes[:'repeatIntervalInSeconds'] if attributes[:'repeatIntervalInSeconds']

      raise 'You cannot provide both :repeatIntervalInSeconds and :repeat_interval_in_seconds' if attributes.key?(:'repeatIntervalInSeconds') && attributes.key?(:'repeat_interval_in_seconds')

      self.repeat_interval_in_seconds = attributes[:'repeat_interval_in_seconds'] if attributes[:'repeat_interval_in_seconds']

      self.is_run_once = attributes[:'isRunOnce'] unless attributes[:'isRunOnce'].nil?
      self.is_run_once = false if is_run_once.nil? && !attributes.key?(:'isRunOnce') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRunOnce and :is_run_once' if attributes.key?(:'isRunOnce') && attributes.key?(:'is_run_once')

      self.is_run_once = attributes[:'is_run_once'] unless attributes[:'is_run_once'].nil?
      self.is_run_once = false if is_run_once.nil? && !attributes.key?(:'isRunOnce') && !attributes.key?(:'is_run_once') # rubocop:disable Style/StringLiterals

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']

      self.target = attributes[:'target'] if attributes[:'target']

      self.script_parameters = attributes[:'scriptParameters'] if attributes[:'scriptParameters']

      raise 'You cannot provide both :scriptParameters and :script_parameters' if attributes.key?(:'scriptParameters') && attributes.key?(:'script_parameters')

      self.script_parameters = attributes[:'script_parameters'] if attributes[:'script_parameters']

      self.configuration = attributes[:'configuration'] if attributes[:'configuration']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      raise "Invalid value for 'status': this must be one of the values in STATUS_ENUM." if status && !STATUS_ENUM.include?(status)

      @status = status
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        vantage_points == other.vantage_points &&
        script_id == other.script_id &&
        status == other.status &&
        repeat_interval_in_seconds == other.repeat_interval_in_seconds &&
        is_run_once == other.is_run_once &&
        timeout_in_seconds == other.timeout_in_seconds &&
        target == other.target &&
        script_parameters == other.script_parameters &&
        configuration == other.configuration &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [display_name, vantage_points, script_id, status, repeat_interval_in_seconds, is_run_once, timeout_in_seconds, target, script_parameters, configuration, freeform_tags, defined_tags].hash
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
