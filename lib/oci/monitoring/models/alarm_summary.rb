# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of properties for the specified alarm.
  # For information about alarms, see [Alarms Overview](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#AlarmsOverview).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/sdks.htm).
  #
  class Monitoring::Models::AlarmSummary
    SEVERITY_ENUM = [
      SEVERITY_CRITICAL = 'CRITICAL'.freeze,
      SEVERITY_ERROR = 'ERROR'.freeze,
      SEVERITY_WARNING = 'WARNING'.freeze,
      SEVERITY_INFO = 'INFO'.freeze,
      SEVERITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the alarm.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** A user-friendly name for the alarm. It does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # This name is sent as the title for notifications related to this alarm.
    #
    # Example: `High CPU Utilization`
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the alarm.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the metric
    # being evaluated by the alarm.
    #
    # @return [String]
    attr_accessor :metric_compartment_id

    # **[Required]** The source service or application emitting the metric that is evaluated by the alarm.
    #
    # Example: `oci_computeagent`
    #
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The Monitoring Query Language (MQL) expression to evaluate for the alarm. The Alarms feature of
    # the Monitoring service interprets results for each returned time series as Boolean values,
    # where zero represents false and a non-zero value represents true. A true value means that the trigger
    # rule condition has been met. The query must specify a metric, statistic, interval, and trigger
    # rule (threshold or absence). Supported values for interval: `1m`-`60m` (also `1h`). You can optionally
    # specify dimensions and grouping functions. Supported grouping functions: `grouping()`, `groupBy()`.
    # For details about Monitoring Query Language (MQL), see [Monitoring Query Language (MQL) Reference](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Reference/mql.htm).
    # For available dimensions, review the metric definition for the supported service.
    # See [Supported Services](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#SupportedServices).
    #
    # Example of threshold alarm:
    #
    #   -----
    #
    #     CpuUtilization[1m]{availabilityDomain=\"cumS:PHX-AD-1\"}.groupBy(availabilityDomain).percentile(0.9) > 85
    #
    #   -----
    #
    # Example of absence alarm:
    #
    #   -----
    #
    #     CpuUtilization[1m]{availabilityDomain=\"cumS:PHX-AD-1\"}.absent()
    #
    #   -----
    #
    # @return [String]
    attr_accessor :query

    # **[Required]** The perceived severity of the alarm with regard to the affected system.
    #
    # Example: `CRITICAL`
    #
    # @return [String]
    attr_reader :severity

    # **[Required]** A list of destinations to which the notifications for this alarm will be delivered.
    # Each destination is represented by an [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) related to the supported destination service.
    # For example, a destination using the Notifications service is represented by a topic OCID.
    # Supported destination services: Notifications Service. Limit: One destination per supported destination service.
    #
    # @return [Array<String>]
    attr_accessor :destinations

    # The configuration details for suppressing an alarm.
    #
    # @return [OCI::Monitoring::Models::Suppression]
    attr_accessor :suppression

    # **[Required]** Whether the alarm is enabled.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** The current lifecycle state of the alarm.
    #
    # Example: `DELETED`
    #
    # @return [String]
    attr_accessor :lifecycle_state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'metric_compartment_id': :'metricCompartmentId',
        'namespace': :'namespace',
        'query': :'query',
        'severity': :'severity',
        'destinations': :'destinations',
        'suppression': :'suppression',
        'is_enabled': :'isEnabled',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'lifecycle_state': :'lifecycleState'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'metric_compartment_id': :'String',
        'namespace': :'String',
        'query': :'String',
        'severity': :'String',
        'destinations': :'Array<String>',
        'suppression': :'OCI::Monitoring::Models::Suppression',
        'is_enabled': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'lifecycle_state': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :metric_compartment_id The value to assign to the {#metric_compartment_id} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :query The value to assign to the {#query} property
    # @option attributes [String] :severity The value to assign to the {#severity} property
    # @option attributes [Array<String>] :destinations The value to assign to the {#destinations} property
    # @option attributes [OCI::Monitoring::Models::Suppression] :suppression The value to assign to the {#suppression} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.metric_compartment_id = attributes[:'metricCompartmentId'] if attributes[:'metricCompartmentId']

      raise 'You cannot provide both :metricCompartmentId and :metric_compartment_id' if attributes.key?(:'metricCompartmentId') && attributes.key?(:'metric_compartment_id')

      self.metric_compartment_id = attributes[:'metric_compartment_id'] if attributes[:'metric_compartment_id']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.query = attributes[:'query'] if attributes[:'query']

      self.severity = attributes[:'severity'] if attributes[:'severity']

      self.destinations = attributes[:'destinations'] if attributes[:'destinations']

      self.suppression = attributes[:'suppression'] if attributes[:'suppression']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] severity Object to be assigned
    def severity=(severity)
      # rubocop:disable Style/ConditionalAssignment
      if severity && !SEVERITY_ENUM.include?(severity)
        OCI.logger.debug("Unknown value for 'severity' [" + severity + "]. Mapping to 'SEVERITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @severity = SEVERITY_UNKNOWN_ENUM_VALUE
      else
        @severity = severity
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
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        metric_compartment_id == other.metric_compartment_id &&
        namespace == other.namespace &&
        query == other.query &&
        severity == other.severity &&
        destinations == other.destinations &&
        suppression == other.suppression &&
        is_enabled == other.is_enabled &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        lifecycle_state == other.lifecycle_state
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
      [id, display_name, compartment_id, metric_compartment_id, namespace, query, severity, destinations, suppression, is_enabled, freeform_tags, defined_tags, lifecycle_state].hash
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
