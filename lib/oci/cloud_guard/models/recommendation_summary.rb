# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200131
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Recommendation Definition.
  class CloudGuard::Models::RecommendationSummary
    TYPE_ENUM = [
      TYPE_DETECTOR_PROBLEMS = 'DETECTOR_PROBLEMS'.freeze,
      TYPE_RESOLVED_PROBLEMS = 'RESOLVED_PROBLEMS'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RISK_LEVEL_ENUM = [
      RISK_LEVEL_CRITICAL = 'CRITICAL'.freeze,
      RISK_LEVEL_HIGH = 'HIGH'.freeze,
      RISK_LEVEL_MEDIUM = 'MEDIUM'.freeze,
      RISK_LEVEL_LOW = 'LOW'.freeze,
      RISK_LEVEL_MINOR = 'MINOR'.freeze,
      RISK_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_DETAIL_ENUM = [
      LIFECYCLE_DETAIL_OPEN = 'OPEN'.freeze,
      LIFECYCLE_DETAIL_RESOLVED = 'RESOLVED'.freeze,
      LIFECYCLE_DETAIL_DISMISSED = 'DISMISSED'.freeze,
      LIFECYCLE_DETAIL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier for Recommendation
    # @return [String]
    attr_accessor :id

    # Recommendation type
    # @return [String]
    attr_reader :type

    # Tenant Identifier
    # @return [String]
    attr_accessor :tenant_id

    # **[Required]** Compartment Identifier
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** targetId associated with the problem
    # @return [String]
    attr_accessor :target_id

    # **[Required]** Recommendation details
    # @return [Hash<String, String>]
    attr_accessor :details

    # The Risk Level
    # @return [String]
    attr_reader :risk_level

    # **[Required]** Count number of the problem
    # @return [Integer]
    attr_accessor :problem_count

    # **[Required]** The current state of the Recommendation.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The lifecycleDetail will give more detail on the substate of the lifecycleState.
    # @return [String]
    attr_reader :lifecycle_detail

    # problem creating time
    # @return [DateTime]
    attr_accessor :time_created

    # problem updating time
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** recommendation string showing on UX
    # @return [String]
    attr_accessor :name

    # **[Required]** description of the recommendation
    # @return [String]
    attr_accessor :description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'type': :'type',
        'tenant_id': :'tenantId',
        'compartment_id': :'compartmentId',
        'target_id': :'targetId',
        'details': :'details',
        'risk_level': :'riskLevel',
        'problem_count': :'problemCount',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_detail': :'lifecycleDetail',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'name': :'name',
        'description': :'description'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'type': :'String',
        'tenant_id': :'String',
        'compartment_id': :'String',
        'target_id': :'String',
        'details': :'Hash<String, String>',
        'risk_level': :'String',
        'problem_count': :'Integer',
        'lifecycle_state': :'String',
        'lifecycle_detail': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'name': :'String',
        'description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [Hash<String, String>] :details The value to assign to the {#details} property
    # @option attributes [String] :risk_level The value to assign to the {#risk_level} property
    # @option attributes [Integer] :problem_count The value to assign to the {#problem_count} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_detail The value to assign to the {#lifecycle_detail} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.type = attributes[:'type'] if attributes[:'type']

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.details = attributes[:'details'] if attributes[:'details']

      self.risk_level = attributes[:'riskLevel'] if attributes[:'riskLevel']

      raise 'You cannot provide both :riskLevel and :risk_level' if attributes.key?(:'riskLevel') && attributes.key?(:'risk_level')

      self.risk_level = attributes[:'risk_level'] if attributes[:'risk_level']

      self.problem_count = attributes[:'problemCount'] if attributes[:'problemCount']

      raise 'You cannot provide both :problemCount and :problem_count' if attributes.key?(:'problemCount') && attributes.key?(:'problem_count')

      self.problem_count = attributes[:'problem_count'] if attributes[:'problem_count']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_detail = attributes[:'lifecycleDetail'] if attributes[:'lifecycleDetail']

      raise 'You cannot provide both :lifecycleDetail and :lifecycle_detail' if attributes.key?(:'lifecycleDetail') && attributes.key?(:'lifecycle_detail')

      self.lifecycle_detail = attributes[:'lifecycle_detail'] if attributes[:'lifecycle_detail']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        type == other.type &&
        tenant_id == other.tenant_id &&
        compartment_id == other.compartment_id &&
        target_id == other.target_id &&
        details == other.details &&
        risk_level == other.risk_level &&
        problem_count == other.problem_count &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_detail == other.lifecycle_detail &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        name == other.name &&
        description == other.description
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
      [id, type, tenant_id, compartment_id, target_id, details, risk_level, problem_count, lifecycle_state, lifecycle_detail, time_created, time_updated, name, description].hash
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
