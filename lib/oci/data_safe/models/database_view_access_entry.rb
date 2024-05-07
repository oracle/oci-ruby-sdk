# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A DatabaseViewAccessEntry object is a resource corresponding to a row in view authorization report.
  # It's a subresource of Security Policy Report resource and is always associated with a SecurityPolicyReport.
  #
  class DataSafe::Models::DatabaseViewAccessEntry
    ACCESS_TYPE_ENUM = [
      ACCESS_TYPE_SELECT = 'SELECT'.freeze,
      ACCESS_TYPE_UPDATE = 'UPDATE'.freeze,
      ACCESS_TYPE_INSERT = 'INSERT'.freeze,
      ACCESS_TYPE_DELETE = 'DELETE'.freeze,
      ACCESS_TYPE_OWNER = 'OWNER'.freeze,
      ACCESS_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PRIVILEGE_ENUM = [
      PRIVILEGE_SELECT = 'SELECT'.freeze,
      PRIVILEGE_UPDATE = 'UPDATE'.freeze,
      PRIVILEGE_INSERT = 'INSERT'.freeze,
      PRIVILEGE_DELETE = 'DELETE'.freeze,
      PRIVILEGE_READ = 'READ'.freeze,
      PRIVILEGE_OWNER = 'OWNER'.freeze,
      PRIVILEGE_INDEX = 'INDEX'.freeze,
      PRIVILEGE_SELECT_ANY_TABLE = 'SELECT_ANY_TABLE'.freeze,
      PRIVILEGE_UPDATE_ANY_TABLE = 'UPDATE_ANY_TABLE'.freeze,
      PRIVILEGE_INSERT_ANY_TABLE = 'INSERT_ANY_TABLE'.freeze,
      PRIVILEGE_DELETE_ANY_TABLE = 'DELETE_ANY_TABLE'.freeze,
      PRIVILEGE_READ_ANY_TABLE = 'READ_ANY_TABLE'.freeze,
      PRIVILEGE_CREATE_ANY_INDEX = 'CREATE_ANY_INDEX'.freeze,
      PRIVILEGE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PRIVILEGE_GRANTABLE_ENUM = [
      PRIVILEGE_GRANTABLE_ADMIN_OPTION = 'ADMIN_OPTION'.freeze,
      PRIVILEGE_GRANTABLE_GRANT_OPTION = 'GRANT_OPTION'.freeze,
      PRIVILEGE_GRANTABLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique key that identifies the table access report. It is numeric and unique within a security policy report.
    # @return [String]
    attr_accessor :key

    # **[Required]** Grantee is the user who can access the table or view
    # @return [String]
    attr_accessor :grantee

    # The type of the access the user has on the table, there can be one or more from SELECT, UPDATE, INSERT or DELETE.
    #
    # @return [String]
    attr_reader :access_type

    # The name of the schema the table belongs to.
    # @return [String]
    attr_accessor :table_schema

    # The name of the database table the user has access to.
    # @return [String]
    attr_accessor :table_name

    # Type of the privilege user has, this includes System Privilege, Schema Privilege, Object Privilege, Column Privilege,
    # Owner or Schema Privilege on a schema.
    #
    # @return [String]
    attr_accessor :privilege_type

    # The OCID of the of the  target database.
    # @return [String]
    attr_accessor :target_id

    # The name of the privilege.
    # @return [String]
    attr_reader :privilege

    # Indicates whether the grantee can grant this privilege to other users. Privileges can be granted to a user or role with
    # GRANT_OPTION or ADMIN_OPTION
    #
    # @return [String]
    attr_reader :privilege_grantable

    # This can be empty in case of direct grant, in case of indirect grant, this attribute displays the name of the
    # role which is granted to the user though which the user has access to the table.
    #
    # @return [String]
    attr_accessor :grant_from_role

    # The name of the schema.
    # @return [String]
    attr_accessor :view_schema

    # The name of the view.
    # @return [String]
    attr_accessor :view_name

    # Definition of the view.
    # @return [String]
    attr_accessor :view_text

    # If there are column level privileges on a table or view.
    # @return [String]
    attr_accessor :column_name

    # The user who granted the privilege.
    # @return [String]
    attr_accessor :grantor

    # Indicates whether the table access is constrained via Oracle Database Vault.
    # @return [BOOLEAN]
    attr_accessor :is_access_constrained_by_database_vault

    # Indicates whether the view access is constrained via Virtual Private Database.
    # @return [BOOLEAN]
    attr_accessor :is_access_constrained_by_virtual_private_database

    # Indicates whether the view access is constrained via Oracle Data Redaction.
    # @return [BOOLEAN]
    attr_accessor :is_access_constrained_by_redaction

    # Indicates whether the view access is constrained via Real Application Security.
    # @return [BOOLEAN]
    attr_accessor :is_access_constrained_by_real_application_security

    # Indicates whether the view access is constrained via Oracle Database SQL Firewall.
    # @return [BOOLEAN]
    attr_accessor :is_access_constrained_by_sql_firewall

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'grantee': :'grantee',
        'access_type': :'accessType',
        'table_schema': :'tableSchema',
        'table_name': :'tableName',
        'privilege_type': :'privilegeType',
        'target_id': :'targetId',
        'privilege': :'privilege',
        'privilege_grantable': :'privilegeGrantable',
        'grant_from_role': :'grantFromRole',
        'view_schema': :'viewSchema',
        'view_name': :'viewName',
        'view_text': :'viewText',
        'column_name': :'columnName',
        'grantor': :'grantor',
        'is_access_constrained_by_database_vault': :'isAccessConstrainedByDatabaseVault',
        'is_access_constrained_by_virtual_private_database': :'isAccessConstrainedByVirtualPrivateDatabase',
        'is_access_constrained_by_redaction': :'isAccessConstrainedByRedaction',
        'is_access_constrained_by_real_application_security': :'isAccessConstrainedByRealApplicationSecurity',
        'is_access_constrained_by_sql_firewall': :'isAccessConstrainedBySqlFirewall'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'grantee': :'String',
        'access_type': :'String',
        'table_schema': :'String',
        'table_name': :'String',
        'privilege_type': :'String',
        'target_id': :'String',
        'privilege': :'String',
        'privilege_grantable': :'String',
        'grant_from_role': :'String',
        'view_schema': :'String',
        'view_name': :'String',
        'view_text': :'String',
        'column_name': :'String',
        'grantor': :'String',
        'is_access_constrained_by_database_vault': :'BOOLEAN',
        'is_access_constrained_by_virtual_private_database': :'BOOLEAN',
        'is_access_constrained_by_redaction': :'BOOLEAN',
        'is_access_constrained_by_real_application_security': :'BOOLEAN',
        'is_access_constrained_by_sql_firewall': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :grantee The value to assign to the {#grantee} property
    # @option attributes [String] :access_type The value to assign to the {#access_type} property
    # @option attributes [String] :table_schema The value to assign to the {#table_schema} property
    # @option attributes [String] :table_name The value to assign to the {#table_name} property
    # @option attributes [String] :privilege_type The value to assign to the {#privilege_type} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :privilege The value to assign to the {#privilege} property
    # @option attributes [String] :privilege_grantable The value to assign to the {#privilege_grantable} property
    # @option attributes [String] :grant_from_role The value to assign to the {#grant_from_role} property
    # @option attributes [String] :view_schema The value to assign to the {#view_schema} property
    # @option attributes [String] :view_name The value to assign to the {#view_name} property
    # @option attributes [String] :view_text The value to assign to the {#view_text} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [String] :grantor The value to assign to the {#grantor} property
    # @option attributes [BOOLEAN] :is_access_constrained_by_database_vault The value to assign to the {#is_access_constrained_by_database_vault} property
    # @option attributes [BOOLEAN] :is_access_constrained_by_virtual_private_database The value to assign to the {#is_access_constrained_by_virtual_private_database} property
    # @option attributes [BOOLEAN] :is_access_constrained_by_redaction The value to assign to the {#is_access_constrained_by_redaction} property
    # @option attributes [BOOLEAN] :is_access_constrained_by_real_application_security The value to assign to the {#is_access_constrained_by_real_application_security} property
    # @option attributes [BOOLEAN] :is_access_constrained_by_sql_firewall The value to assign to the {#is_access_constrained_by_sql_firewall} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.grantee = attributes[:'grantee'] if attributes[:'grantee']

      self.access_type = attributes[:'accessType'] if attributes[:'accessType']

      raise 'You cannot provide both :accessType and :access_type' if attributes.key?(:'accessType') && attributes.key?(:'access_type')

      self.access_type = attributes[:'access_type'] if attributes[:'access_type']

      self.table_schema = attributes[:'tableSchema'] if attributes[:'tableSchema']

      raise 'You cannot provide both :tableSchema and :table_schema' if attributes.key?(:'tableSchema') && attributes.key?(:'table_schema')

      self.table_schema = attributes[:'table_schema'] if attributes[:'table_schema']

      self.table_name = attributes[:'tableName'] if attributes[:'tableName']

      raise 'You cannot provide both :tableName and :table_name' if attributes.key?(:'tableName') && attributes.key?(:'table_name')

      self.table_name = attributes[:'table_name'] if attributes[:'table_name']

      self.privilege_type = attributes[:'privilegeType'] if attributes[:'privilegeType']

      raise 'You cannot provide both :privilegeType and :privilege_type' if attributes.key?(:'privilegeType') && attributes.key?(:'privilege_type')

      self.privilege_type = attributes[:'privilege_type'] if attributes[:'privilege_type']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.privilege = attributes[:'privilege'] if attributes[:'privilege']

      self.privilege_grantable = attributes[:'privilegeGrantable'] if attributes[:'privilegeGrantable']

      raise 'You cannot provide both :privilegeGrantable and :privilege_grantable' if attributes.key?(:'privilegeGrantable') && attributes.key?(:'privilege_grantable')

      self.privilege_grantable = attributes[:'privilege_grantable'] if attributes[:'privilege_grantable']

      self.grant_from_role = attributes[:'grantFromRole'] if attributes[:'grantFromRole']

      raise 'You cannot provide both :grantFromRole and :grant_from_role' if attributes.key?(:'grantFromRole') && attributes.key?(:'grant_from_role')

      self.grant_from_role = attributes[:'grant_from_role'] if attributes[:'grant_from_role']

      self.view_schema = attributes[:'viewSchema'] if attributes[:'viewSchema']

      raise 'You cannot provide both :viewSchema and :view_schema' if attributes.key?(:'viewSchema') && attributes.key?(:'view_schema')

      self.view_schema = attributes[:'view_schema'] if attributes[:'view_schema']

      self.view_name = attributes[:'viewName'] if attributes[:'viewName']

      raise 'You cannot provide both :viewName and :view_name' if attributes.key?(:'viewName') && attributes.key?(:'view_name')

      self.view_name = attributes[:'view_name'] if attributes[:'view_name']

      self.view_text = attributes[:'viewText'] if attributes[:'viewText']

      raise 'You cannot provide both :viewText and :view_text' if attributes.key?(:'viewText') && attributes.key?(:'view_text')

      self.view_text = attributes[:'view_text'] if attributes[:'view_text']

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.grantor = attributes[:'grantor'] if attributes[:'grantor']

      self.is_access_constrained_by_database_vault = attributes[:'isAccessConstrainedByDatabaseVault'] unless attributes[:'isAccessConstrainedByDatabaseVault'].nil?

      raise 'You cannot provide both :isAccessConstrainedByDatabaseVault and :is_access_constrained_by_database_vault' if attributes.key?(:'isAccessConstrainedByDatabaseVault') && attributes.key?(:'is_access_constrained_by_database_vault')

      self.is_access_constrained_by_database_vault = attributes[:'is_access_constrained_by_database_vault'] unless attributes[:'is_access_constrained_by_database_vault'].nil?

      self.is_access_constrained_by_virtual_private_database = attributes[:'isAccessConstrainedByVirtualPrivateDatabase'] unless attributes[:'isAccessConstrainedByVirtualPrivateDatabase'].nil?

      raise 'You cannot provide both :isAccessConstrainedByVirtualPrivateDatabase and :is_access_constrained_by_virtual_private_database' if attributes.key?(:'isAccessConstrainedByVirtualPrivateDatabase') && attributes.key?(:'is_access_constrained_by_virtual_private_database')

      self.is_access_constrained_by_virtual_private_database = attributes[:'is_access_constrained_by_virtual_private_database'] unless attributes[:'is_access_constrained_by_virtual_private_database'].nil?

      self.is_access_constrained_by_redaction = attributes[:'isAccessConstrainedByRedaction'] unless attributes[:'isAccessConstrainedByRedaction'].nil?

      raise 'You cannot provide both :isAccessConstrainedByRedaction and :is_access_constrained_by_redaction' if attributes.key?(:'isAccessConstrainedByRedaction') && attributes.key?(:'is_access_constrained_by_redaction')

      self.is_access_constrained_by_redaction = attributes[:'is_access_constrained_by_redaction'] unless attributes[:'is_access_constrained_by_redaction'].nil?

      self.is_access_constrained_by_real_application_security = attributes[:'isAccessConstrainedByRealApplicationSecurity'] unless attributes[:'isAccessConstrainedByRealApplicationSecurity'].nil?

      raise 'You cannot provide both :isAccessConstrainedByRealApplicationSecurity and :is_access_constrained_by_real_application_security' if attributes.key?(:'isAccessConstrainedByRealApplicationSecurity') && attributes.key?(:'is_access_constrained_by_real_application_security')

      self.is_access_constrained_by_real_application_security = attributes[:'is_access_constrained_by_real_application_security'] unless attributes[:'is_access_constrained_by_real_application_security'].nil?

      self.is_access_constrained_by_sql_firewall = attributes[:'isAccessConstrainedBySqlFirewall'] unless attributes[:'isAccessConstrainedBySqlFirewall'].nil?

      raise 'You cannot provide both :isAccessConstrainedBySqlFirewall and :is_access_constrained_by_sql_firewall' if attributes.key?(:'isAccessConstrainedBySqlFirewall') && attributes.key?(:'is_access_constrained_by_sql_firewall')

      self.is_access_constrained_by_sql_firewall = attributes[:'is_access_constrained_by_sql_firewall'] unless attributes[:'is_access_constrained_by_sql_firewall'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access_type Object to be assigned
    def access_type=(access_type)
      # rubocop:disable Style/ConditionalAssignment
      if access_type && !ACCESS_TYPE_ENUM.include?(access_type)
        OCI.logger.debug("Unknown value for 'access_type' [" + access_type + "]. Mapping to 'ACCESS_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @access_type = ACCESS_TYPE_UNKNOWN_ENUM_VALUE
      else
        @access_type = access_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] privilege Object to be assigned
    def privilege=(privilege)
      # rubocop:disable Style/ConditionalAssignment
      if privilege && !PRIVILEGE_ENUM.include?(privilege)
        OCI.logger.debug("Unknown value for 'privilege' [" + privilege + "]. Mapping to 'PRIVILEGE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @privilege = PRIVILEGE_UNKNOWN_ENUM_VALUE
      else
        @privilege = privilege
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] privilege_grantable Object to be assigned
    def privilege_grantable=(privilege_grantable)
      # rubocop:disable Style/ConditionalAssignment
      if privilege_grantable && !PRIVILEGE_GRANTABLE_ENUM.include?(privilege_grantable)
        OCI.logger.debug("Unknown value for 'privilege_grantable' [" + privilege_grantable + "]. Mapping to 'PRIVILEGE_GRANTABLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @privilege_grantable = PRIVILEGE_GRANTABLE_UNKNOWN_ENUM_VALUE
      else
        @privilege_grantable = privilege_grantable
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        grantee == other.grantee &&
        access_type == other.access_type &&
        table_schema == other.table_schema &&
        table_name == other.table_name &&
        privilege_type == other.privilege_type &&
        target_id == other.target_id &&
        privilege == other.privilege &&
        privilege_grantable == other.privilege_grantable &&
        grant_from_role == other.grant_from_role &&
        view_schema == other.view_schema &&
        view_name == other.view_name &&
        view_text == other.view_text &&
        column_name == other.column_name &&
        grantor == other.grantor &&
        is_access_constrained_by_database_vault == other.is_access_constrained_by_database_vault &&
        is_access_constrained_by_virtual_private_database == other.is_access_constrained_by_virtual_private_database &&
        is_access_constrained_by_redaction == other.is_access_constrained_by_redaction &&
        is_access_constrained_by_real_application_security == other.is_access_constrained_by_real_application_security &&
        is_access_constrained_by_sql_firewall == other.is_access_constrained_by_sql_firewall
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
      [key, grantee, access_type, table_schema, table_name, privilege_type, target_id, privilege, privilege_grantable, grant_from_role, view_schema, view_name, view_text, column_name, grantor, is_access_constrained_by_database_vault, is_access_constrained_by_virtual_private_database, is_access_constrained_by_redaction, is_access_constrained_by_real_application_security, is_access_constrained_by_sql_firewall].hash
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
