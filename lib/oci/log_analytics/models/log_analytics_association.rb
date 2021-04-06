# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsAssociation
  class LogAnalytics::Models::LogAnalyticsAssociation
    LIFE_CYCLE_STATE_ENUM = [
      LIFE_CYCLE_STATE_ACCEPTED = 'ACCEPTED'.freeze,
      LIFE_CYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFE_CYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFE_CYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFE_CYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The failure message.
    # @return [String]
    attr_accessor :failure_message

    # The agent unique identifier.
    # @return [String]
    attr_accessor :agent_id

    # The last attempt date.
    # @return [DateTime]
    attr_accessor :time_last_attempted

    # The number of times the association will be attempted
    # before failing.
    #
    # @return [Integer]
    attr_accessor :retry_count

    # The source name.
    # @return [String]
    attr_accessor :source_name

    # The source display name.
    # @return [String]
    attr_accessor :source_display_name

    # The source type internal name.
    # @return [String]
    attr_accessor :source_type_name

    # The lifecycle status.  Valid values are ACCEPTED, IN_PROGRESS, SUCCEEDED
    # or FAILED.
    #
    # @return [String]
    attr_reader :life_cycle_state

    # The entity unique identifier.
    # @return [String]
    attr_accessor :entity_id

    # The entity name.
    # @return [String]
    attr_accessor :entity_name

    # The entity type internal name.
    # @return [String]
    attr_accessor :entity_type_name

    # The host name.
    # @return [String]
    attr_accessor :host

    # The name of the entity which contains the agent.
    # @return [String]
    attr_accessor :agent_entity_name

    # The entity type display name.
    # @return [String]
    attr_accessor :entity_type_display_name

    # The log group unique identifier.
    # @return [String]
    attr_accessor :log_group_id

    # The log group name.
    # @return [String]
    attr_accessor :log_group_name

    # The log group compartment.
    # @return [String]
    attr_accessor :log_group_compartment

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'failure_message': :'failureMessage',
        'agent_id': :'agentId',
        'time_last_attempted': :'timeLastAttempted',
        'retry_count': :'retryCount',
        'source_name': :'sourceName',
        'source_display_name': :'sourceDisplayName',
        'source_type_name': :'sourceTypeName',
        'life_cycle_state': :'lifeCycleState',
        'entity_id': :'entityId',
        'entity_name': :'entityName',
        'entity_type_name': :'entityTypeName',
        'host': :'host',
        'agent_entity_name': :'agentEntityName',
        'entity_type_display_name': :'entityTypeDisplayName',
        'log_group_id': :'logGroupId',
        'log_group_name': :'logGroupName',
        'log_group_compartment': :'logGroupCompartment'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'failure_message': :'String',
        'agent_id': :'String',
        'time_last_attempted': :'DateTime',
        'retry_count': :'Integer',
        'source_name': :'String',
        'source_display_name': :'String',
        'source_type_name': :'String',
        'life_cycle_state': :'String',
        'entity_id': :'String',
        'entity_name': :'String',
        'entity_type_name': :'String',
        'host': :'String',
        'agent_entity_name': :'String',
        'entity_type_display_name': :'String',
        'log_group_id': :'String',
        'log_group_name': :'String',
        'log_group_compartment': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :failure_message The value to assign to the {#failure_message} property
    # @option attributes [String] :agent_id The value to assign to the {#agent_id} property
    # @option attributes [DateTime] :time_last_attempted The value to assign to the {#time_last_attempted} property
    # @option attributes [Integer] :retry_count The value to assign to the {#retry_count} property
    # @option attributes [String] :source_name The value to assign to the {#source_name} property
    # @option attributes [String] :source_display_name The value to assign to the {#source_display_name} property
    # @option attributes [String] :source_type_name The value to assign to the {#source_type_name} property
    # @option attributes [String] :life_cycle_state The value to assign to the {#life_cycle_state} property
    # @option attributes [String] :entity_id The value to assign to the {#entity_id} property
    # @option attributes [String] :entity_name The value to assign to the {#entity_name} property
    # @option attributes [String] :entity_type_name The value to assign to the {#entity_type_name} property
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [String] :agent_entity_name The value to assign to the {#agent_entity_name} property
    # @option attributes [String] :entity_type_display_name The value to assign to the {#entity_type_display_name} property
    # @option attributes [String] :log_group_id The value to assign to the {#log_group_id} property
    # @option attributes [String] :log_group_name The value to assign to the {#log_group_name} property
    # @option attributes [String] :log_group_compartment The value to assign to the {#log_group_compartment} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.failure_message = attributes[:'failureMessage'] if attributes[:'failureMessage']

      raise 'You cannot provide both :failureMessage and :failure_message' if attributes.key?(:'failureMessage') && attributes.key?(:'failure_message')

      self.failure_message = attributes[:'failure_message'] if attributes[:'failure_message']

      self.agent_id = attributes[:'agentId'] if attributes[:'agentId']

      raise 'You cannot provide both :agentId and :agent_id' if attributes.key?(:'agentId') && attributes.key?(:'agent_id')

      self.agent_id = attributes[:'agent_id'] if attributes[:'agent_id']

      self.time_last_attempted = attributes[:'timeLastAttempted'] if attributes[:'timeLastAttempted']

      raise 'You cannot provide both :timeLastAttempted and :time_last_attempted' if attributes.key?(:'timeLastAttempted') && attributes.key?(:'time_last_attempted')

      self.time_last_attempted = attributes[:'time_last_attempted'] if attributes[:'time_last_attempted']

      self.retry_count = attributes[:'retryCount'] if attributes[:'retryCount']

      raise 'You cannot provide both :retryCount and :retry_count' if attributes.key?(:'retryCount') && attributes.key?(:'retry_count')

      self.retry_count = attributes[:'retry_count'] if attributes[:'retry_count']

      self.source_name = attributes[:'sourceName'] if attributes[:'sourceName']

      raise 'You cannot provide both :sourceName and :source_name' if attributes.key?(:'sourceName') && attributes.key?(:'source_name')

      self.source_name = attributes[:'source_name'] if attributes[:'source_name']

      self.source_display_name = attributes[:'sourceDisplayName'] if attributes[:'sourceDisplayName']

      raise 'You cannot provide both :sourceDisplayName and :source_display_name' if attributes.key?(:'sourceDisplayName') && attributes.key?(:'source_display_name')

      self.source_display_name = attributes[:'source_display_name'] if attributes[:'source_display_name']

      self.source_type_name = attributes[:'sourceTypeName'] if attributes[:'sourceTypeName']

      raise 'You cannot provide both :sourceTypeName and :source_type_name' if attributes.key?(:'sourceTypeName') && attributes.key?(:'source_type_name')

      self.source_type_name = attributes[:'source_type_name'] if attributes[:'source_type_name']

      self.life_cycle_state = attributes[:'lifeCycleState'] if attributes[:'lifeCycleState']
      self.life_cycle_state = "SUCCEEDED" if life_cycle_state.nil? && !attributes.key?(:'lifeCycleState') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :lifeCycleState and :life_cycle_state' if attributes.key?(:'lifeCycleState') && attributes.key?(:'life_cycle_state')

      self.life_cycle_state = attributes[:'life_cycle_state'] if attributes[:'life_cycle_state']
      self.life_cycle_state = "SUCCEEDED" if life_cycle_state.nil? && !attributes.key?(:'lifeCycleState') && !attributes.key?(:'life_cycle_state') # rubocop:disable Style/StringLiterals

      self.entity_id = attributes[:'entityId'] if attributes[:'entityId']

      raise 'You cannot provide both :entityId and :entity_id' if attributes.key?(:'entityId') && attributes.key?(:'entity_id')

      self.entity_id = attributes[:'entity_id'] if attributes[:'entity_id']

      self.entity_name = attributes[:'entityName'] if attributes[:'entityName']

      raise 'You cannot provide both :entityName and :entity_name' if attributes.key?(:'entityName') && attributes.key?(:'entity_name')

      self.entity_name = attributes[:'entity_name'] if attributes[:'entity_name']

      self.entity_type_name = attributes[:'entityTypeName'] if attributes[:'entityTypeName']

      raise 'You cannot provide both :entityTypeName and :entity_type_name' if attributes.key?(:'entityTypeName') && attributes.key?(:'entity_type_name')

      self.entity_type_name = attributes[:'entity_type_name'] if attributes[:'entity_type_name']

      self.host = attributes[:'host'] if attributes[:'host']

      self.agent_entity_name = attributes[:'agentEntityName'] if attributes[:'agentEntityName']

      raise 'You cannot provide both :agentEntityName and :agent_entity_name' if attributes.key?(:'agentEntityName') && attributes.key?(:'agent_entity_name')

      self.agent_entity_name = attributes[:'agent_entity_name'] if attributes[:'agent_entity_name']

      self.entity_type_display_name = attributes[:'entityTypeDisplayName'] if attributes[:'entityTypeDisplayName']

      raise 'You cannot provide both :entityTypeDisplayName and :entity_type_display_name' if attributes.key?(:'entityTypeDisplayName') && attributes.key?(:'entity_type_display_name')

      self.entity_type_display_name = attributes[:'entity_type_display_name'] if attributes[:'entity_type_display_name']

      self.log_group_id = attributes[:'logGroupId'] if attributes[:'logGroupId']

      raise 'You cannot provide both :logGroupId and :log_group_id' if attributes.key?(:'logGroupId') && attributes.key?(:'log_group_id')

      self.log_group_id = attributes[:'log_group_id'] if attributes[:'log_group_id']

      self.log_group_name = attributes[:'logGroupName'] if attributes[:'logGroupName']

      raise 'You cannot provide both :logGroupName and :log_group_name' if attributes.key?(:'logGroupName') && attributes.key?(:'log_group_name')

      self.log_group_name = attributes[:'log_group_name'] if attributes[:'log_group_name']

      self.log_group_compartment = attributes[:'logGroupCompartment'] if attributes[:'logGroupCompartment']

      raise 'You cannot provide both :logGroupCompartment and :log_group_compartment' if attributes.key?(:'logGroupCompartment') && attributes.key?(:'log_group_compartment')

      self.log_group_compartment = attributes[:'log_group_compartment'] if attributes[:'log_group_compartment']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] life_cycle_state Object to be assigned
    def life_cycle_state=(life_cycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if life_cycle_state && !LIFE_CYCLE_STATE_ENUM.include?(life_cycle_state)
        OCI.logger.debug("Unknown value for 'life_cycle_state' [" + life_cycle_state + "]. Mapping to 'LIFE_CYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @life_cycle_state = LIFE_CYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @life_cycle_state = life_cycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        failure_message == other.failure_message &&
        agent_id == other.agent_id &&
        time_last_attempted == other.time_last_attempted &&
        retry_count == other.retry_count &&
        source_name == other.source_name &&
        source_display_name == other.source_display_name &&
        source_type_name == other.source_type_name &&
        life_cycle_state == other.life_cycle_state &&
        entity_id == other.entity_id &&
        entity_name == other.entity_name &&
        entity_type_name == other.entity_type_name &&
        host == other.host &&
        agent_entity_name == other.agent_entity_name &&
        entity_type_display_name == other.entity_type_display_name &&
        log_group_id == other.log_group_id &&
        log_group_name == other.log_group_name &&
        log_group_compartment == other.log_group_compartment
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
      [failure_message, agent_id, time_last_attempted, retry_count, source_name, source_display_name, source_type_name, life_cycle_state, entity_id, entity_name, entity_type_name, host, agent_entity_name, entity_type_display_name, log_group_id, log_group_name, log_group_compartment].hash
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
