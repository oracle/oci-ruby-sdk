# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Problem Definition.
  class CloudGuard::Models::Problem
    RISK_LEVEL_ENUM = [
      RISK_LEVEL_CRITICAL = 'CRITICAL'.freeze,
      RISK_LEVEL_HIGH = 'HIGH'.freeze,
      RISK_LEVEL_MEDIUM = 'MEDIUM'.freeze,
      RISK_LEVEL_LOW = 'LOW'.freeze,
      RISK_LEVEL_MINOR = 'MINOR'.freeze,
      RISK_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_DETAIL_ENUM = [
      LIFECYCLE_DETAIL_OPEN = 'OPEN'.freeze,
      LIFECYCLE_DETAIL_RESOLVED = 'RESOLVED'.freeze,
      LIFECYCLE_DETAIL_DISMISSED = 'DISMISSED'.freeze,
      LIFECYCLE_DETAIL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DETECTOR_ID_ENUM = [
      DETECTOR_ID_IAAS_ACTIVITY_DETECTOR = 'IAAS_ACTIVITY_DETECTOR'.freeze,
      DETECTOR_ID_IAAS_CONFIGURATION_DETECTOR = 'IAAS_CONFIGURATION_DETECTOR'.freeze,
      DETECTOR_ID_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier that is immutable on creation
    # @return [String]
    attr_accessor :id

    # **[Required]** Compartment Identifier where the resource is created
    # @return [String]
    attr_accessor :compartment_id

    # Identifier of the rule
    # @return [String]
    attr_accessor :detector_rule_id

    # DEPRECATED
    # @return [String]
    attr_accessor :region

    # Regions where the problem is found
    # @return [Array<String>]
    attr_accessor :regions

    # The Risk Level
    # @return [String]
    attr_reader :risk_level

    # Identifier of the Resource
    # @return [String]
    attr_accessor :resource_id

    # DisplayName of the Resource
    # @return [String]
    attr_accessor :resource_name

    # Type of the Resource
    # @return [String]
    attr_accessor :resource_type

    # user defined labels on the problem
    # @return [Array<String>]
    attr_accessor :labels

    # The date and time the problem was last detected. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_last_detected

    # The date and time the problem was first detected. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_first_detected

    # The current state of the Problem.
    # @return [String]
    attr_reader :lifecycle_state

    # The lifecycleDetail will give more detail on the substate of the lifecycleState.
    # @return [String]
    attr_reader :lifecycle_detail

    # Id of the detector associated with the Problem.
    # @return [String]
    attr_reader :detector_id

    # targetId of the problem
    # @return [String]
    attr_accessor :target_id

    # User Comments
    # @return [String]
    attr_accessor :comment

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'detector_rule_id': :'detectorRuleId',
        'region': :'region',
        'regions': :'regions',
        'risk_level': :'riskLevel',
        'resource_id': :'resourceId',
        'resource_name': :'resourceName',
        'resource_type': :'resourceType',
        'labels': :'labels',
        'time_last_detected': :'timeLastDetected',
        'time_first_detected': :'timeFirstDetected',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_detail': :'lifecycleDetail',
        'detector_id': :'detectorId',
        'target_id': :'targetId',
        'comment': :'comment'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'detector_rule_id': :'String',
        'region': :'String',
        'regions': :'Array<String>',
        'risk_level': :'String',
        'resource_id': :'String',
        'resource_name': :'String',
        'resource_type': :'String',
        'labels': :'Array<String>',
        'time_last_detected': :'DateTime',
        'time_first_detected': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_detail': :'String',
        'detector_id': :'String',
        'target_id': :'String',
        'comment': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :detector_rule_id The value to assign to the {#detector_rule_id} property
    # @option attributes [String] :region The value to assign to the {#region} property
    # @option attributes [Array<String>] :regions The value to assign to the {#regions} property
    # @option attributes [String] :risk_level The value to assign to the {#risk_level} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [Array<String>] :labels The value to assign to the {#labels} property
    # @option attributes [DateTime] :time_last_detected The value to assign to the {#time_last_detected} property
    # @option attributes [DateTime] :time_first_detected The value to assign to the {#time_first_detected} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_detail The value to assign to the {#lifecycle_detail} property
    # @option attributes [String] :detector_id The value to assign to the {#detector_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :comment The value to assign to the {#comment} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.detector_rule_id = attributes[:'detectorRuleId'] if attributes[:'detectorRuleId']

      raise 'You cannot provide both :detectorRuleId and :detector_rule_id' if attributes.key?(:'detectorRuleId') && attributes.key?(:'detector_rule_id')

      self.detector_rule_id = attributes[:'detector_rule_id'] if attributes[:'detector_rule_id']

      self.region = attributes[:'region'] if attributes[:'region']

      self.regions = attributes[:'regions'] if attributes[:'regions']

      self.risk_level = attributes[:'riskLevel'] if attributes[:'riskLevel']

      raise 'You cannot provide both :riskLevel and :risk_level' if attributes.key?(:'riskLevel') && attributes.key?(:'risk_level')

      self.risk_level = attributes[:'risk_level'] if attributes[:'risk_level']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.labels = attributes[:'labels'] if attributes[:'labels']

      self.time_last_detected = attributes[:'timeLastDetected'] if attributes[:'timeLastDetected']

      raise 'You cannot provide both :timeLastDetected and :time_last_detected' if attributes.key?(:'timeLastDetected') && attributes.key?(:'time_last_detected')

      self.time_last_detected = attributes[:'time_last_detected'] if attributes[:'time_last_detected']

      self.time_first_detected = attributes[:'timeFirstDetected'] if attributes[:'timeFirstDetected']

      raise 'You cannot provide both :timeFirstDetected and :time_first_detected' if attributes.key?(:'timeFirstDetected') && attributes.key?(:'time_first_detected')

      self.time_first_detected = attributes[:'time_first_detected'] if attributes[:'time_first_detected']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_detail = attributes[:'lifecycleDetail'] if attributes[:'lifecycleDetail']

      raise 'You cannot provide both :lifecycleDetail and :lifecycle_detail' if attributes.key?(:'lifecycleDetail') && attributes.key?(:'lifecycle_detail')

      self.lifecycle_detail = attributes[:'lifecycle_detail'] if attributes[:'lifecycle_detail']

      self.detector_id = attributes[:'detectorId'] if attributes[:'detectorId']

      raise 'You cannot provide both :detectorId and :detector_id' if attributes.key?(:'detectorId') && attributes.key?(:'detector_id')

      self.detector_id = attributes[:'detector_id'] if attributes[:'detector_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.comment = attributes[:'comment'] if attributes[:'comment']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] risk_level Object to be assigned
    def risk_level=(risk_level)
      # rubocop:disable Style/ConditionalAssignment
      if risk_level && !RISK_LEVEL_ENUM.include?(risk_level)
        OCI.logger.debug("Unknown value for 'risk_level' [" + risk_level + "]. Mapping to 'RISK_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @risk_level = RISK_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @risk_level = risk_level
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_detail Object to be assigned
    def lifecycle_detail=(lifecycle_detail)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_detail && !LIFECYCLE_DETAIL_ENUM.include?(lifecycle_detail)
        OCI.logger.debug("Unknown value for 'lifecycle_detail' [" + lifecycle_detail + "]. Mapping to 'LIFECYCLE_DETAIL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_detail = LIFECYCLE_DETAIL_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_detail = lifecycle_detail
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] detector_id Object to be assigned
    def detector_id=(detector_id)
      # rubocop:disable Style/ConditionalAssignment
      if detector_id && !DETECTOR_ID_ENUM.include?(detector_id)
        OCI.logger.debug("Unknown value for 'detector_id' [" + detector_id + "]. Mapping to 'DETECTOR_ID_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @detector_id = DETECTOR_ID_UNKNOWN_ENUM_VALUE
      else
        @detector_id = detector_id
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
        detector_rule_id == other.detector_rule_id &&
        region == other.region &&
        regions == other.regions &&
        risk_level == other.risk_level &&
        resource_id == other.resource_id &&
        resource_name == other.resource_name &&
        resource_type == other.resource_type &&
        labels == other.labels &&
        time_last_detected == other.time_last_detected &&
        time_first_detected == other.time_first_detected &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_detail == other.lifecycle_detail &&
        detector_id == other.detector_id &&
        target_id == other.target_id &&
        comment == other.comment
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
      [id, compartment_id, detector_rule_id, region, regions, risk_level, resource_id, resource_name, resource_type, labels, time_last_detected, time_first_detected, lifecycle_state, lifecycle_detail, detector_id, target_id, comment].hash
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
