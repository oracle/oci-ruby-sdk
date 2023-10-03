# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This extension defines the attributes used to manage account passwords within a service provider. The extension is typically applied to a User resource, but MAY be applied to other resources that use passwords.
  class IdentityDomains::Models::ExtensionUserStateUser
    # The last successful login date.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: true
    #  - idcsAllowUpdatesInReadOnlyMode: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - idcsRequiresWriteForAccessFlows: true
    #  - required: false
    #  - returned: request
    #  - type: dateTime
    #  - uniqueness: none
    # @return [String]
    attr_accessor :last_successful_login_date

    # The previous successful login date.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - idcsRequiresWriteForAccessFlows: true
    #  - required: false
    #  - returned: request
    #  - type: dateTime
    #  - uniqueness: none
    # @return [String]
    attr_accessor :previous_successful_login_date

    # The last failed login date.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - idcsAllowUpdatesInReadOnlyMode: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - idcsRequiresWriteForAccessFlows: true
    #  - required: false
    #  - returned: request
    #  - type: dateTime
    #  - uniqueness: none
    # @return [String]
    attr_accessor :last_failed_login_date

    # The number of failed login attempts. The value is reset to 0 after a successful login.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - idcsAllowUpdatesInReadOnlyMode: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - idcsRequiresWriteForAccessFlows: true
    #  - idcsRequiresImmediateReadAfterWriteForAccessFlows: true
    #  - required: false
    #  - returned: request
    #  - type: integer
    #  - uniqueness: none
    # @return [Integer]
    attr_accessor :login_attempts

    # The number of failed recovery attempts. The value is reset to 0 after a successful login.
    #
    # **Added In:** 19.1.4
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - idcsRequiresWriteForAccessFlows: true
    #  - required: false
    #  - returned: request
    #  - type: integer
    #  - uniqueness: none
    # @return [Integer]
    attr_accessor :recovery_attempts

    # The number of failed account recovery enrollment attempts.
    #
    # **Added In:** 19.1.4
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: integer
    #  - uniqueness: none
    # @return [Integer]
    attr_accessor :recovery_enroll_attempts

    # The maximum number of concurrent sessions for a user.
    #
    # **Added In:** 20.1.3
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsMaxValue: 999
    #  - idcsMinValue: 1
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: integer
    #  - uniqueness: none
    # @return [Integer]
    attr_accessor :max_concurrent_sessions

    # @return [OCI::IdentityDomains::Models::UserExtRecoveryLocked]
    attr_accessor :recovery_locked

    # @return [OCI::IdentityDomains::Models::UserExtLocked]
    attr_accessor :locked

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'last_successful_login_date': :'lastSuccessfulLoginDate',
        'previous_successful_login_date': :'previousSuccessfulLoginDate',
        'last_failed_login_date': :'lastFailedLoginDate',
        'login_attempts': :'loginAttempts',
        'recovery_attempts': :'recoveryAttempts',
        'recovery_enroll_attempts': :'recoveryEnrollAttempts',
        'max_concurrent_sessions': :'maxConcurrentSessions',
        'recovery_locked': :'recoveryLocked',
        'locked': :'locked'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'last_successful_login_date': :'String',
        'previous_successful_login_date': :'String',
        'last_failed_login_date': :'String',
        'login_attempts': :'Integer',
        'recovery_attempts': :'Integer',
        'recovery_enroll_attempts': :'Integer',
        'max_concurrent_sessions': :'Integer',
        'recovery_locked': :'OCI::IdentityDomains::Models::UserExtRecoveryLocked',
        'locked': :'OCI::IdentityDomains::Models::UserExtLocked'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :last_successful_login_date The value to assign to the {#last_successful_login_date} property
    # @option attributes [String] :previous_successful_login_date The value to assign to the {#previous_successful_login_date} property
    # @option attributes [String] :last_failed_login_date The value to assign to the {#last_failed_login_date} property
    # @option attributes [Integer] :login_attempts The value to assign to the {#login_attempts} property
    # @option attributes [Integer] :recovery_attempts The value to assign to the {#recovery_attempts} property
    # @option attributes [Integer] :recovery_enroll_attempts The value to assign to the {#recovery_enroll_attempts} property
    # @option attributes [Integer] :max_concurrent_sessions The value to assign to the {#max_concurrent_sessions} property
    # @option attributes [OCI::IdentityDomains::Models::UserExtRecoveryLocked] :recovery_locked The value to assign to the {#recovery_locked} property
    # @option attributes [OCI::IdentityDomains::Models::UserExtLocked] :locked The value to assign to the {#locked} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.last_successful_login_date = attributes[:'lastSuccessfulLoginDate'] if attributes[:'lastSuccessfulLoginDate']

      raise 'You cannot provide both :lastSuccessfulLoginDate and :last_successful_login_date' if attributes.key?(:'lastSuccessfulLoginDate') && attributes.key?(:'last_successful_login_date')

      self.last_successful_login_date = attributes[:'last_successful_login_date'] if attributes[:'last_successful_login_date']

      self.previous_successful_login_date = attributes[:'previousSuccessfulLoginDate'] if attributes[:'previousSuccessfulLoginDate']

      raise 'You cannot provide both :previousSuccessfulLoginDate and :previous_successful_login_date' if attributes.key?(:'previousSuccessfulLoginDate') && attributes.key?(:'previous_successful_login_date')

      self.previous_successful_login_date = attributes[:'previous_successful_login_date'] if attributes[:'previous_successful_login_date']

      self.last_failed_login_date = attributes[:'lastFailedLoginDate'] if attributes[:'lastFailedLoginDate']

      raise 'You cannot provide both :lastFailedLoginDate and :last_failed_login_date' if attributes.key?(:'lastFailedLoginDate') && attributes.key?(:'last_failed_login_date')

      self.last_failed_login_date = attributes[:'last_failed_login_date'] if attributes[:'last_failed_login_date']

      self.login_attempts = attributes[:'loginAttempts'] if attributes[:'loginAttempts']

      raise 'You cannot provide both :loginAttempts and :login_attempts' if attributes.key?(:'loginAttempts') && attributes.key?(:'login_attempts')

      self.login_attempts = attributes[:'login_attempts'] if attributes[:'login_attempts']

      self.recovery_attempts = attributes[:'recoveryAttempts'] if attributes[:'recoveryAttempts']

      raise 'You cannot provide both :recoveryAttempts and :recovery_attempts' if attributes.key?(:'recoveryAttempts') && attributes.key?(:'recovery_attempts')

      self.recovery_attempts = attributes[:'recovery_attempts'] if attributes[:'recovery_attempts']

      self.recovery_enroll_attempts = attributes[:'recoveryEnrollAttempts'] if attributes[:'recoveryEnrollAttempts']

      raise 'You cannot provide both :recoveryEnrollAttempts and :recovery_enroll_attempts' if attributes.key?(:'recoveryEnrollAttempts') && attributes.key?(:'recovery_enroll_attempts')

      self.recovery_enroll_attempts = attributes[:'recovery_enroll_attempts'] if attributes[:'recovery_enroll_attempts']

      self.max_concurrent_sessions = attributes[:'maxConcurrentSessions'] if attributes[:'maxConcurrentSessions']

      raise 'You cannot provide both :maxConcurrentSessions and :max_concurrent_sessions' if attributes.key?(:'maxConcurrentSessions') && attributes.key?(:'max_concurrent_sessions')

      self.max_concurrent_sessions = attributes[:'max_concurrent_sessions'] if attributes[:'max_concurrent_sessions']

      self.recovery_locked = attributes[:'recoveryLocked'] if attributes[:'recoveryLocked']

      raise 'You cannot provide both :recoveryLocked and :recovery_locked' if attributes.key?(:'recoveryLocked') && attributes.key?(:'recovery_locked')

      self.recovery_locked = attributes[:'recovery_locked'] if attributes[:'recovery_locked']

      self.locked = attributes[:'locked'] if attributes[:'locked']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        last_successful_login_date == other.last_successful_login_date &&
        previous_successful_login_date == other.previous_successful_login_date &&
        last_failed_login_date == other.last_failed_login_date &&
        login_attempts == other.login_attempts &&
        recovery_attempts == other.recovery_attempts &&
        recovery_enroll_attempts == other.recovery_enroll_attempts &&
        max_concurrent_sessions == other.max_concurrent_sessions &&
        recovery_locked == other.recovery_locked &&
        locked == other.locked
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
      [last_successful_login_date, previous_successful_login_date, last_failed_login_date, login_attempts, recovery_attempts, recovery_enroll_attempts, max_concurrent_sessions, recovery_locked, locked].hash
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
