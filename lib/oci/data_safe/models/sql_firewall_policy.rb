# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The SQL Firewall policy resource contains the firewall policy metadata for a single user.
  #
  class DataSafe::Models::SqlFirewallPolicy
    SQL_LEVEL_ENUM = [
      SQL_LEVEL_USER_ISSUED_SQL = 'USER_ISSUED_SQL'.freeze,
      SQL_LEVEL_ALL_SQL = 'ALL_SQL'.freeze,
      SQL_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ENABLED = 'ENABLED'.freeze,
      STATUS_DISABLED = 'DISABLED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ENFORCEMENT_SCOPE_ENUM = [
      ENFORCEMENT_SCOPE_ENFORCE_CONTEXT = 'ENFORCE_CONTEXT'.freeze,
      ENFORCEMENT_SCOPE_ENFORCE_SQL = 'ENFORCE_SQL'.freeze,
      ENFORCEMENT_SCOPE_ENFORCE_ALL = 'ENFORCE_ALL'.freeze,
      ENFORCEMENT_SCOPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VIOLATION_ACTION_ENUM = [
      VIOLATION_ACTION_BLOCK = 'BLOCK'.freeze,
      VIOLATION_ACTION_OBSERVE = 'OBSERVE'.freeze,
      VIOLATION_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VIOLATION_AUDIT_ENUM = [
      VIOLATION_AUDIT_ENABLED = 'ENABLED'.freeze,
      VIOLATION_AUDIT_DISABLED = 'DISABLED'.freeze,
      VIOLATION_AUDIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the SQL Firewall policy.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment containing the SQL Firewall policy.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The display name of the SQL Firewall policy.
    # @return [String]
    attr_accessor :display_name

    # The description of the SQL Firewall policy.
    # @return [String]
    attr_accessor :description

    # **[Required]** The OCID of the security policy corresponding to the SQL Firewall policy.
    # @return [String]
    attr_accessor :security_policy_id

    # **[Required]** The database user name.
    # @return [String]
    attr_accessor :db_user_name

    # Specifies the level of SQL included for this SQL Firewall policy.
    # USER_ISSUED_SQL - User issued SQL statements only.
    # ALL_SQL - Includes all SQL statements including SQL statement issued inside PL/SQL units.
    #
    # @return [String]
    attr_reader :sql_level

    # **[Required]** Specifies whether the SQL Firewall policy is enabled or disabled.
    # @return [String]
    attr_reader :status

    # Specifies the SQL Firewall policy enforcement option.
    # @return [String]
    attr_reader :enforcement_scope

    # Specifies the mode in which the SQL Firewall policy is enabled.
    # @return [String]
    attr_reader :violation_action

    # Specifies whether a unified audit policy should be enabled for auditing the SQL Firewall policy violations.
    # @return [String]
    attr_reader :violation_audit

    # The list of allowed ip addresses for the SQL Firewall policy.
    # @return [Array<String>]
    attr_accessor :allowed_client_ips

    # The list of allowed operating system user names for the SQL Firewall policy.
    # @return [Array<String>]
    attr_accessor :allowed_client_os_usernames

    # The list of allowed client programs for the SQL Firewall policy.
    # @return [Array<String>]
    attr_accessor :allowed_client_programs

    # **[Required]** The time that the SQL Firewall policy was created, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the SQL Firewall policy was last updated, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the SQL Firewall policy.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the current state of the SQL Firewall policy in Data Safe.
    # @return [String]
    attr_accessor :lifecycle_details

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace. For more information, see Resource Tags.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'security_policy_id': :'securityPolicyId',
        'db_user_name': :'dbUserName',
        'sql_level': :'sqlLevel',
        'status': :'status',
        'enforcement_scope': :'enforcementScope',
        'violation_action': :'violationAction',
        'violation_audit': :'violationAudit',
        'allowed_client_ips': :'allowedClientIps',
        'allowed_client_os_usernames': :'allowedClientOsUsernames',
        'allowed_client_programs': :'allowedClientPrograms',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
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
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'security_policy_id': :'String',
        'db_user_name': :'String',
        'sql_level': :'String',
        'status': :'String',
        'enforcement_scope': :'String',
        'violation_action': :'String',
        'violation_audit': :'String',
        'allowed_client_ips': :'Array<String>',
        'allowed_client_os_usernames': :'Array<String>',
        'allowed_client_programs': :'Array<String>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :security_policy_id The value to assign to the {#security_policy_id} property
    # @option attributes [String] :db_user_name The value to assign to the {#db_user_name} property
    # @option attributes [String] :sql_level The value to assign to the {#sql_level} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :enforcement_scope The value to assign to the {#enforcement_scope} property
    # @option attributes [String] :violation_action The value to assign to the {#violation_action} property
    # @option attributes [String] :violation_audit The value to assign to the {#violation_audit} property
    # @option attributes [Array<String>] :allowed_client_ips The value to assign to the {#allowed_client_ips} property
    # @option attributes [Array<String>] :allowed_client_os_usernames The value to assign to the {#allowed_client_os_usernames} property
    # @option attributes [Array<String>] :allowed_client_programs The value to assign to the {#allowed_client_programs} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.security_policy_id = attributes[:'securityPolicyId'] if attributes[:'securityPolicyId']

      raise 'You cannot provide both :securityPolicyId and :security_policy_id' if attributes.key?(:'securityPolicyId') && attributes.key?(:'security_policy_id')

      self.security_policy_id = attributes[:'security_policy_id'] if attributes[:'security_policy_id']

      self.db_user_name = attributes[:'dbUserName'] if attributes[:'dbUserName']

      raise 'You cannot provide both :dbUserName and :db_user_name' if attributes.key?(:'dbUserName') && attributes.key?(:'db_user_name')

      self.db_user_name = attributes[:'db_user_name'] if attributes[:'db_user_name']

      self.sql_level = attributes[:'sqlLevel'] if attributes[:'sqlLevel']

      raise 'You cannot provide both :sqlLevel and :sql_level' if attributes.key?(:'sqlLevel') && attributes.key?(:'sql_level')

      self.sql_level = attributes[:'sql_level'] if attributes[:'sql_level']

      self.status = attributes[:'status'] if attributes[:'status']

      self.enforcement_scope = attributes[:'enforcementScope'] if attributes[:'enforcementScope']

      raise 'You cannot provide both :enforcementScope and :enforcement_scope' if attributes.key?(:'enforcementScope') && attributes.key?(:'enforcement_scope')

      self.enforcement_scope = attributes[:'enforcement_scope'] if attributes[:'enforcement_scope']

      self.violation_action = attributes[:'violationAction'] if attributes[:'violationAction']

      raise 'You cannot provide both :violationAction and :violation_action' if attributes.key?(:'violationAction') && attributes.key?(:'violation_action')

      self.violation_action = attributes[:'violation_action'] if attributes[:'violation_action']

      self.violation_audit = attributes[:'violationAudit'] if attributes[:'violationAudit']

      raise 'You cannot provide both :violationAudit and :violation_audit' if attributes.key?(:'violationAudit') && attributes.key?(:'violation_audit')

      self.violation_audit = attributes[:'violation_audit'] if attributes[:'violation_audit']

      self.allowed_client_ips = attributes[:'allowedClientIps'] if attributes[:'allowedClientIps']

      raise 'You cannot provide both :allowedClientIps and :allowed_client_ips' if attributes.key?(:'allowedClientIps') && attributes.key?(:'allowed_client_ips')

      self.allowed_client_ips = attributes[:'allowed_client_ips'] if attributes[:'allowed_client_ips']

      self.allowed_client_os_usernames = attributes[:'allowedClientOsUsernames'] if attributes[:'allowedClientOsUsernames']

      raise 'You cannot provide both :allowedClientOsUsernames and :allowed_client_os_usernames' if attributes.key?(:'allowedClientOsUsernames') && attributes.key?(:'allowed_client_os_usernames')

      self.allowed_client_os_usernames = attributes[:'allowed_client_os_usernames'] if attributes[:'allowed_client_os_usernames']

      self.allowed_client_programs = attributes[:'allowedClientPrograms'] if attributes[:'allowedClientPrograms']

      raise 'You cannot provide both :allowedClientPrograms and :allowed_client_programs' if attributes.key?(:'allowedClientPrograms') && attributes.key?(:'allowed_client_programs')

      self.allowed_client_programs = attributes[:'allowed_client_programs'] if attributes[:'allowed_client_programs']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

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
    # @param [Object] sql_level Object to be assigned
    def sql_level=(sql_level)
      # rubocop:disable Style/ConditionalAssignment
      if sql_level && !SQL_LEVEL_ENUM.include?(sql_level)
        OCI.logger.debug("Unknown value for 'sql_level' [" + sql_level + "]. Mapping to 'SQL_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @sql_level = SQL_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @sql_level = sql_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] enforcement_scope Object to be assigned
    def enforcement_scope=(enforcement_scope)
      # rubocop:disable Style/ConditionalAssignment
      if enforcement_scope && !ENFORCEMENT_SCOPE_ENUM.include?(enforcement_scope)
        OCI.logger.debug("Unknown value for 'enforcement_scope' [" + enforcement_scope + "]. Mapping to 'ENFORCEMENT_SCOPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @enforcement_scope = ENFORCEMENT_SCOPE_UNKNOWN_ENUM_VALUE
      else
        @enforcement_scope = enforcement_scope
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] violation_action Object to be assigned
    def violation_action=(violation_action)
      # rubocop:disable Style/ConditionalAssignment
      if violation_action && !VIOLATION_ACTION_ENUM.include?(violation_action)
        OCI.logger.debug("Unknown value for 'violation_action' [" + violation_action + "]. Mapping to 'VIOLATION_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @violation_action = VIOLATION_ACTION_UNKNOWN_ENUM_VALUE
      else
        @violation_action = violation_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] violation_audit Object to be assigned
    def violation_audit=(violation_audit)
      # rubocop:disable Style/ConditionalAssignment
      if violation_audit && !VIOLATION_AUDIT_ENUM.include?(violation_audit)
        OCI.logger.debug("Unknown value for 'violation_audit' [" + violation_audit + "]. Mapping to 'VIOLATION_AUDIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @violation_audit = VIOLATION_AUDIT_UNKNOWN_ENUM_VALUE
      else
        @violation_audit = violation_audit
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        security_policy_id == other.security_policy_id &&
        db_user_name == other.db_user_name &&
        sql_level == other.sql_level &&
        status == other.status &&
        enforcement_scope == other.enforcement_scope &&
        violation_action == other.violation_action &&
        violation_audit == other.violation_audit &&
        allowed_client_ips == other.allowed_client_ips &&
        allowed_client_os_usernames == other.allowed_client_os_usernames &&
        allowed_client_programs == other.allowed_client_programs &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
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
      [id, compartment_id, display_name, description, security_policy_id, db_user_name, sql_level, status, enforcement_scope, violation_action, violation_audit, allowed_client_ips, allowed_client_os_usernames, allowed_client_programs, time_created, time_updated, lifecycle_state, lifecycle_details, freeform_tags, defined_tags, system_tags].hash
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
