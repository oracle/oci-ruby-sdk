# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the aggregation dimensions used for summarizing audit events.
  class DataSafe::Models::AuditEventAggregationDimensions
    TARGET_CLASS_ENUM = [
      TARGET_CLASS_DATABASE = 'DATABASE'.freeze,
      TARGET_CLASS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AUDIT_TYPE_ENUM = [
      AUDIT_TYPE_STANDARD = 'STANDARD'.freeze,
      AUDIT_TYPE_FINE_GRAINED = 'FINE_GRAINED'.freeze,
      AUDIT_TYPE_XS = 'XS'.freeze,
      AUDIT_TYPE_DATABASE_VAULT = 'DATABASE_VAULT'.freeze,
      AUDIT_TYPE_LABEL_SECURITY = 'LABEL_SECURITY'.freeze,
      AUDIT_TYPE_RMAN = 'RMAN'.freeze,
      AUDIT_TYPE_DATAPUMP = 'DATAPUMP'.freeze,
      AUDIT_TYPE_DIRECT_PATH_API = 'DIRECT_PATH_API'.freeze,
      AUDIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The time the audit event occurred in the target database.
    # @return [Array<DateTime>]
    attr_accessor :audit_event_time

    # Name of the database user whose actions were audited.
    # @return [Array<String>]
    attr_accessor :db_user_name

    # The OCID of the target database that was audited.
    # @return [Array<String>]
    attr_accessor :target_id

    # The name of the target database that was audited.
    # @return [Array<String>]
    attr_accessor :target_name

    # Class of the target that was audited.
    # @return [Array<String>]
    attr_reader :target_class

    # Type of object in the source database affected by the action. i.e PL/SQL, SYNONYM, PACKAGE BODY.
    # @return [Array<String>]
    attr_accessor :object_type

    # Name of the host machine from which the session was spawned.
    # @return [Array<String>]
    attr_accessor :client_hostname

    # The application from which the audit event was generated. Examples SQL Plus or SQL Developer.
    # @return [Array<String>]
    attr_accessor :client_program

    # The client identifier in each Oracle session.
    # @return [Array<String>]
    attr_accessor :client_id

    # Type of auditing.
    # @return [Array<String>]
    attr_reader :audit_type

    # The name of the event executed by the user on the target database. i.e ALTER SEQUENCE, CREATE TRIGGER, CREATE INDEX.
    # @return [Array<String>]
    attr_accessor :event_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'audit_event_time': :'auditEventTime',
        'db_user_name': :'dbUserName',
        'target_id': :'targetId',
        'target_name': :'targetName',
        'target_class': :'targetClass',
        'object_type': :'objectType',
        'client_hostname': :'clientHostname',
        'client_program': :'clientProgram',
        'client_id': :'clientId',
        'audit_type': :'auditType',
        'event_name': :'eventName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'audit_event_time': :'Array<DateTime>',
        'db_user_name': :'Array<String>',
        'target_id': :'Array<String>',
        'target_name': :'Array<String>',
        'target_class': :'Array<String>',
        'object_type': :'Array<String>',
        'client_hostname': :'Array<String>',
        'client_program': :'Array<String>',
        'client_id': :'Array<String>',
        'audit_type': :'Array<String>',
        'event_name': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<DateTime>] :audit_event_time The value to assign to the {#audit_event_time} property
    # @option attributes [Array<String>] :db_user_name The value to assign to the {#db_user_name} property
    # @option attributes [Array<String>] :target_id The value to assign to the {#target_id} property
    # @option attributes [Array<String>] :target_name The value to assign to the {#target_name} property
    # @option attributes [Array<String>] :target_class The value to assign to the {#target_class} property
    # @option attributes [Array<String>] :object_type The value to assign to the {#object_type} property
    # @option attributes [Array<String>] :client_hostname The value to assign to the {#client_hostname} property
    # @option attributes [Array<String>] :client_program The value to assign to the {#client_program} property
    # @option attributes [Array<String>] :client_id The value to assign to the {#client_id} property
    # @option attributes [Array<String>] :audit_type The value to assign to the {#audit_type} property
    # @option attributes [Array<String>] :event_name The value to assign to the {#event_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.audit_event_time = attributes[:'auditEventTime'] if attributes[:'auditEventTime']

      raise 'You cannot provide both :auditEventTime and :audit_event_time' if attributes.key?(:'auditEventTime') && attributes.key?(:'audit_event_time')

      self.audit_event_time = attributes[:'audit_event_time'] if attributes[:'audit_event_time']

      self.db_user_name = attributes[:'dbUserName'] if attributes[:'dbUserName']

      raise 'You cannot provide both :dbUserName and :db_user_name' if attributes.key?(:'dbUserName') && attributes.key?(:'db_user_name')

      self.db_user_name = attributes[:'db_user_name'] if attributes[:'db_user_name']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.target_name = attributes[:'targetName'] if attributes[:'targetName']

      raise 'You cannot provide both :targetName and :target_name' if attributes.key?(:'targetName') && attributes.key?(:'target_name')

      self.target_name = attributes[:'target_name'] if attributes[:'target_name']

      self.target_class = attributes[:'targetClass'] if attributes[:'targetClass']

      raise 'You cannot provide both :targetClass and :target_class' if attributes.key?(:'targetClass') && attributes.key?(:'target_class')

      self.target_class = attributes[:'target_class'] if attributes[:'target_class']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.client_hostname = attributes[:'clientHostname'] if attributes[:'clientHostname']

      raise 'You cannot provide both :clientHostname and :client_hostname' if attributes.key?(:'clientHostname') && attributes.key?(:'client_hostname')

      self.client_hostname = attributes[:'client_hostname'] if attributes[:'client_hostname']

      self.client_program = attributes[:'clientProgram'] if attributes[:'clientProgram']

      raise 'You cannot provide both :clientProgram and :client_program' if attributes.key?(:'clientProgram') && attributes.key?(:'client_program')

      self.client_program = attributes[:'client_program'] if attributes[:'client_program']

      self.client_id = attributes[:'clientId'] if attributes[:'clientId']

      raise 'You cannot provide both :clientId and :client_id' if attributes.key?(:'clientId') && attributes.key?(:'client_id')

      self.client_id = attributes[:'client_id'] if attributes[:'client_id']

      self.audit_type = attributes[:'auditType'] if attributes[:'auditType']

      raise 'You cannot provide both :auditType and :audit_type' if attributes.key?(:'auditType') && attributes.key?(:'audit_type')

      self.audit_type = attributes[:'audit_type'] if attributes[:'audit_type']

      self.event_name = attributes[:'eventName'] if attributes[:'eventName']

      raise 'You cannot provide both :eventName and :event_name' if attributes.key?(:'eventName') && attributes.key?(:'event_name')

      self.event_name = attributes[:'event_name'] if attributes[:'event_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target_class Object to be assigned
    def target_class=(target_class)
      # rubocop:disable Style/ConditionalAssignment
      if target_class.nil?
        @target_class = nil
      else
        @target_class =
          target_class.collect do |item|
            if TARGET_CLASS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'target_class' [#{item}]. Mapping to 'TARGET_CLASS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              TARGET_CLASS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] audit_type Object to be assigned
    def audit_type=(audit_type)
      # rubocop:disable Style/ConditionalAssignment
      if audit_type.nil?
        @audit_type = nil
      else
        @audit_type =
          audit_type.collect do |item|
            if AUDIT_TYPE_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'audit_type' [#{item}]. Mapping to 'AUDIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
              AUDIT_TYPE_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        audit_event_time == other.audit_event_time &&
        db_user_name == other.db_user_name &&
        target_id == other.target_id &&
        target_name == other.target_name &&
        target_class == other.target_class &&
        object_type == other.object_type &&
        client_hostname == other.client_hostname &&
        client_program == other.client_program &&
        client_id == other.client_id &&
        audit_type == other.audit_type &&
        event_name == other.event_name
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
      [audit_event_time, db_user_name, target_id, target_name, target_class, object_type, client_hostname, client_program, client_id, audit_type, event_name].hash
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
