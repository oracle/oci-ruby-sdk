# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of database security feature usage available on a given compartment.
  class DataSafe::Models::SecurityFeatureSummary
    UNIFIED_AUDIT_ENUM = [
      UNIFIED_AUDIT_ENABLED = 'ENABLED'.freeze,
      UNIFIED_AUDIT_DISABLED = 'DISABLED'.freeze,
      UNIFIED_AUDIT_NONE = 'NONE'.freeze,
      UNIFIED_AUDIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    FINE_GRAINED_AUDIT_ENUM = [
      FINE_GRAINED_AUDIT_ENABLED = 'ENABLED'.freeze,
      FINE_GRAINED_AUDIT_DISABLED = 'DISABLED'.freeze,
      FINE_GRAINED_AUDIT_NONE = 'NONE'.freeze,
      FINE_GRAINED_AUDIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRADITIONAL_AUDIT_ENUM = [
      TRADITIONAL_AUDIT_ENABLED = 'ENABLED'.freeze,
      TRADITIONAL_AUDIT_DISABLED = 'DISABLED'.freeze,
      TRADITIONAL_AUDIT_NONE = 'NONE'.freeze,
      TRADITIONAL_AUDIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DATABASE_VAULT_ENUM = [
      DATABASE_VAULT_ENABLED = 'ENABLED'.freeze,
      DATABASE_VAULT_DISABLED = 'DISABLED'.freeze,
      DATABASE_VAULT_NONE = 'NONE'.freeze,
      DATABASE_VAULT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PRIVILEGE_ANALYSIS_ENUM = [
      PRIVILEGE_ANALYSIS_ENABLED = 'ENABLED'.freeze,
      PRIVILEGE_ANALYSIS_DISABLED = 'DISABLED'.freeze,
      PRIVILEGE_ANALYSIS_NONE = 'NONE'.freeze,
      PRIVILEGE_ANALYSIS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TABLESPACE_ENCRYPTION_ENUM = [
      TABLESPACE_ENCRYPTION_ENABLED = 'ENABLED'.freeze,
      TABLESPACE_ENCRYPTION_DISABLED = 'DISABLED'.freeze,
      TABLESPACE_ENCRYPTION_NONE = 'NONE'.freeze,
      TABLESPACE_ENCRYPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    COLUMN_ENCRYPTION_ENUM = [
      COLUMN_ENCRYPTION_ENABLED = 'ENABLED'.freeze,
      COLUMN_ENCRYPTION_DISABLED = 'DISABLED'.freeze,
      COLUMN_ENCRYPTION_NONE = 'NONE'.freeze,
      COLUMN_ENCRYPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NETWORK_ENCRYPTION_ENUM = [
      NETWORK_ENCRYPTION_ENABLED = 'ENABLED'.freeze,
      NETWORK_ENCRYPTION_DISABLED = 'DISABLED'.freeze,
      NETWORK_ENCRYPTION_NONE = 'NONE'.freeze,
      NETWORK_ENCRYPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PASSWORD_AUTHENTICATION_ENUM = [
      PASSWORD_AUTHENTICATION_ENABLED = 'ENABLED'.freeze,
      PASSWORD_AUTHENTICATION_DISABLED = 'DISABLED'.freeze,
      PASSWORD_AUTHENTICATION_NONE = 'NONE'.freeze,
      PASSWORD_AUTHENTICATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    GLOBAL_AUTHENTICATION_ENUM = [
      GLOBAL_AUTHENTICATION_ENABLED = 'ENABLED'.freeze,
      GLOBAL_AUTHENTICATION_DISABLED = 'DISABLED'.freeze,
      GLOBAL_AUTHENTICATION_NONE = 'NONE'.freeze,
      GLOBAL_AUTHENTICATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EXTERNAL_AUTHENTICATION_ENUM = [
      EXTERNAL_AUTHENTICATION_ENABLED = 'ENABLED'.freeze,
      EXTERNAL_AUTHENTICATION_DISABLED = 'DISABLED'.freeze,
      EXTERNAL_AUTHENTICATION_NONE = 'NONE'.freeze,
      EXTERNAL_AUTHENTICATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the target database.
    # @return [String]
    attr_accessor :target_id

    # **[Required]** The OCID of the assessment that generates this security feature usage result.
    # @return [String]
    attr_accessor :assessment_id

    # **[Required]** The usage of security feature - Unified Audit.
    # @return [String]
    attr_reader :unified_audit

    # **[Required]** The usage of security feature - Fine Grained Audit.
    # @return [String]
    attr_reader :fine_grained_audit

    # **[Required]** The usage of security feature - Traditional Audit.
    # @return [String]
    attr_reader :traditional_audit

    # **[Required]** The usage of security feature - Database Vault.
    # @return [String]
    attr_reader :database_vault

    # **[Required]** The usage of security feature - Privilege Analysis.
    # @return [String]
    attr_reader :privilege_analysis

    # **[Required]** The usage of security feature - Tablespace Encryption.
    # @return [String]
    attr_reader :tablespace_encryption

    # **[Required]** The usage of security feature - Column Encryption.
    # @return [String]
    attr_reader :column_encryption

    # **[Required]** The usage of security feature - Network Encryption.
    # @return [String]
    attr_reader :network_encryption

    # **[Required]** The usage of security feature - Password Authentication.
    # @return [String]
    attr_reader :password_authentication

    # **[Required]** The usage of security feature - Global Authentication.
    # @return [String]
    attr_reader :global_authentication

    # **[Required]** The usage of security feature - External Authentication.
    # @return [String]
    attr_reader :external_authentication

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

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'target_id': :'targetId',
        'assessment_id': :'assessmentId',
        'unified_audit': :'unifiedAudit',
        'fine_grained_audit': :'fineGrainedAudit',
        'traditional_audit': :'traditionalAudit',
        'database_vault': :'databaseVault',
        'privilege_analysis': :'privilegeAnalysis',
        'tablespace_encryption': :'tablespaceEncryption',
        'column_encryption': :'columnEncryption',
        'network_encryption': :'networkEncryption',
        'password_authentication': :'passwordAuthentication',
        'global_authentication': :'globalAuthentication',
        'external_authentication': :'externalAuthentication',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'target_id': :'String',
        'assessment_id': :'String',
        'unified_audit': :'String',
        'fine_grained_audit': :'String',
        'traditional_audit': :'String',
        'database_vault': :'String',
        'privilege_analysis': :'String',
        'tablespace_encryption': :'String',
        'column_encryption': :'String',
        'network_encryption': :'String',
        'password_authentication': :'String',
        'global_authentication': :'String',
        'external_authentication': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :assessment_id The value to assign to the {#assessment_id} property
    # @option attributes [String] :unified_audit The value to assign to the {#unified_audit} property
    # @option attributes [String] :fine_grained_audit The value to assign to the {#fine_grained_audit} property
    # @option attributes [String] :traditional_audit The value to assign to the {#traditional_audit} property
    # @option attributes [String] :database_vault The value to assign to the {#database_vault} property
    # @option attributes [String] :privilege_analysis The value to assign to the {#privilege_analysis} property
    # @option attributes [String] :tablespace_encryption The value to assign to the {#tablespace_encryption} property
    # @option attributes [String] :column_encryption The value to assign to the {#column_encryption} property
    # @option attributes [String] :network_encryption The value to assign to the {#network_encryption} property
    # @option attributes [String] :password_authentication The value to assign to the {#password_authentication} property
    # @option attributes [String] :global_authentication The value to assign to the {#global_authentication} property
    # @option attributes [String] :external_authentication The value to assign to the {#external_authentication} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.assessment_id = attributes[:'assessmentId'] if attributes[:'assessmentId']

      raise 'You cannot provide both :assessmentId and :assessment_id' if attributes.key?(:'assessmentId') && attributes.key?(:'assessment_id')

      self.assessment_id = attributes[:'assessment_id'] if attributes[:'assessment_id']

      self.unified_audit = attributes[:'unifiedAudit'] if attributes[:'unifiedAudit']

      raise 'You cannot provide both :unifiedAudit and :unified_audit' if attributes.key?(:'unifiedAudit') && attributes.key?(:'unified_audit')

      self.unified_audit = attributes[:'unified_audit'] if attributes[:'unified_audit']

      self.fine_grained_audit = attributes[:'fineGrainedAudit'] if attributes[:'fineGrainedAudit']

      raise 'You cannot provide both :fineGrainedAudit and :fine_grained_audit' if attributes.key?(:'fineGrainedAudit') && attributes.key?(:'fine_grained_audit')

      self.fine_grained_audit = attributes[:'fine_grained_audit'] if attributes[:'fine_grained_audit']

      self.traditional_audit = attributes[:'traditionalAudit'] if attributes[:'traditionalAudit']

      raise 'You cannot provide both :traditionalAudit and :traditional_audit' if attributes.key?(:'traditionalAudit') && attributes.key?(:'traditional_audit')

      self.traditional_audit = attributes[:'traditional_audit'] if attributes[:'traditional_audit']

      self.database_vault = attributes[:'databaseVault'] if attributes[:'databaseVault']

      raise 'You cannot provide both :databaseVault and :database_vault' if attributes.key?(:'databaseVault') && attributes.key?(:'database_vault')

      self.database_vault = attributes[:'database_vault'] if attributes[:'database_vault']

      self.privilege_analysis = attributes[:'privilegeAnalysis'] if attributes[:'privilegeAnalysis']

      raise 'You cannot provide both :privilegeAnalysis and :privilege_analysis' if attributes.key?(:'privilegeAnalysis') && attributes.key?(:'privilege_analysis')

      self.privilege_analysis = attributes[:'privilege_analysis'] if attributes[:'privilege_analysis']

      self.tablespace_encryption = attributes[:'tablespaceEncryption'] if attributes[:'tablespaceEncryption']

      raise 'You cannot provide both :tablespaceEncryption and :tablespace_encryption' if attributes.key?(:'tablespaceEncryption') && attributes.key?(:'tablespace_encryption')

      self.tablespace_encryption = attributes[:'tablespace_encryption'] if attributes[:'tablespace_encryption']

      self.column_encryption = attributes[:'columnEncryption'] if attributes[:'columnEncryption']

      raise 'You cannot provide both :columnEncryption and :column_encryption' if attributes.key?(:'columnEncryption') && attributes.key?(:'column_encryption')

      self.column_encryption = attributes[:'column_encryption'] if attributes[:'column_encryption']

      self.network_encryption = attributes[:'networkEncryption'] if attributes[:'networkEncryption']

      raise 'You cannot provide both :networkEncryption and :network_encryption' if attributes.key?(:'networkEncryption') && attributes.key?(:'network_encryption')

      self.network_encryption = attributes[:'network_encryption'] if attributes[:'network_encryption']

      self.password_authentication = attributes[:'passwordAuthentication'] if attributes[:'passwordAuthentication']

      raise 'You cannot provide both :passwordAuthentication and :password_authentication' if attributes.key?(:'passwordAuthentication') && attributes.key?(:'password_authentication')

      self.password_authentication = attributes[:'password_authentication'] if attributes[:'password_authentication']

      self.global_authentication = attributes[:'globalAuthentication'] if attributes[:'globalAuthentication']

      raise 'You cannot provide both :globalAuthentication and :global_authentication' if attributes.key?(:'globalAuthentication') && attributes.key?(:'global_authentication')

      self.global_authentication = attributes[:'global_authentication'] if attributes[:'global_authentication']

      self.external_authentication = attributes[:'externalAuthentication'] if attributes[:'externalAuthentication']

      raise 'You cannot provide both :externalAuthentication and :external_authentication' if attributes.key?(:'externalAuthentication') && attributes.key?(:'external_authentication')

      self.external_authentication = attributes[:'external_authentication'] if attributes[:'external_authentication']

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
    # @param [Object] unified_audit Object to be assigned
    def unified_audit=(unified_audit)
      # rubocop:disable Style/ConditionalAssignment
      if unified_audit && !UNIFIED_AUDIT_ENUM.include?(unified_audit)
        OCI.logger.debug("Unknown value for 'unified_audit' [" + unified_audit + "]. Mapping to 'UNIFIED_AUDIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @unified_audit = UNIFIED_AUDIT_UNKNOWN_ENUM_VALUE
      else
        @unified_audit = unified_audit
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] fine_grained_audit Object to be assigned
    def fine_grained_audit=(fine_grained_audit)
      # rubocop:disable Style/ConditionalAssignment
      if fine_grained_audit && !FINE_GRAINED_AUDIT_ENUM.include?(fine_grained_audit)
        OCI.logger.debug("Unknown value for 'fine_grained_audit' [" + fine_grained_audit + "]. Mapping to 'FINE_GRAINED_AUDIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @fine_grained_audit = FINE_GRAINED_AUDIT_UNKNOWN_ENUM_VALUE
      else
        @fine_grained_audit = fine_grained_audit
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] traditional_audit Object to be assigned
    def traditional_audit=(traditional_audit)
      # rubocop:disable Style/ConditionalAssignment
      if traditional_audit && !TRADITIONAL_AUDIT_ENUM.include?(traditional_audit)
        OCI.logger.debug("Unknown value for 'traditional_audit' [" + traditional_audit + "]. Mapping to 'TRADITIONAL_AUDIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @traditional_audit = TRADITIONAL_AUDIT_UNKNOWN_ENUM_VALUE
      else
        @traditional_audit = traditional_audit
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_vault Object to be assigned
    def database_vault=(database_vault)
      # rubocop:disable Style/ConditionalAssignment
      if database_vault && !DATABASE_VAULT_ENUM.include?(database_vault)
        OCI.logger.debug("Unknown value for 'database_vault' [" + database_vault + "]. Mapping to 'DATABASE_VAULT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_vault = DATABASE_VAULT_UNKNOWN_ENUM_VALUE
      else
        @database_vault = database_vault
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] privilege_analysis Object to be assigned
    def privilege_analysis=(privilege_analysis)
      # rubocop:disable Style/ConditionalAssignment
      if privilege_analysis && !PRIVILEGE_ANALYSIS_ENUM.include?(privilege_analysis)
        OCI.logger.debug("Unknown value for 'privilege_analysis' [" + privilege_analysis + "]. Mapping to 'PRIVILEGE_ANALYSIS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @privilege_analysis = PRIVILEGE_ANALYSIS_UNKNOWN_ENUM_VALUE
      else
        @privilege_analysis = privilege_analysis
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] tablespace_encryption Object to be assigned
    def tablespace_encryption=(tablespace_encryption)
      # rubocop:disable Style/ConditionalAssignment
      if tablespace_encryption && !TABLESPACE_ENCRYPTION_ENUM.include?(tablespace_encryption)
        OCI.logger.debug("Unknown value for 'tablespace_encryption' [" + tablespace_encryption + "]. Mapping to 'TABLESPACE_ENCRYPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @tablespace_encryption = TABLESPACE_ENCRYPTION_UNKNOWN_ENUM_VALUE
      else
        @tablespace_encryption = tablespace_encryption
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] column_encryption Object to be assigned
    def column_encryption=(column_encryption)
      # rubocop:disable Style/ConditionalAssignment
      if column_encryption && !COLUMN_ENCRYPTION_ENUM.include?(column_encryption)
        OCI.logger.debug("Unknown value for 'column_encryption' [" + column_encryption + "]. Mapping to 'COLUMN_ENCRYPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @column_encryption = COLUMN_ENCRYPTION_UNKNOWN_ENUM_VALUE
      else
        @column_encryption = column_encryption
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] network_encryption Object to be assigned
    def network_encryption=(network_encryption)
      # rubocop:disable Style/ConditionalAssignment
      if network_encryption && !NETWORK_ENCRYPTION_ENUM.include?(network_encryption)
        OCI.logger.debug("Unknown value for 'network_encryption' [" + network_encryption + "]. Mapping to 'NETWORK_ENCRYPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @network_encryption = NETWORK_ENCRYPTION_UNKNOWN_ENUM_VALUE
      else
        @network_encryption = network_encryption
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] password_authentication Object to be assigned
    def password_authentication=(password_authentication)
      # rubocop:disable Style/ConditionalAssignment
      if password_authentication && !PASSWORD_AUTHENTICATION_ENUM.include?(password_authentication)
        OCI.logger.debug("Unknown value for 'password_authentication' [" + password_authentication + "]. Mapping to 'PASSWORD_AUTHENTICATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @password_authentication = PASSWORD_AUTHENTICATION_UNKNOWN_ENUM_VALUE
      else
        @password_authentication = password_authentication
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] global_authentication Object to be assigned
    def global_authentication=(global_authentication)
      # rubocop:disable Style/ConditionalAssignment
      if global_authentication && !GLOBAL_AUTHENTICATION_ENUM.include?(global_authentication)
        OCI.logger.debug("Unknown value for 'global_authentication' [" + global_authentication + "]. Mapping to 'GLOBAL_AUTHENTICATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @global_authentication = GLOBAL_AUTHENTICATION_UNKNOWN_ENUM_VALUE
      else
        @global_authentication = global_authentication
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] external_authentication Object to be assigned
    def external_authentication=(external_authentication)
      # rubocop:disable Style/ConditionalAssignment
      if external_authentication && !EXTERNAL_AUTHENTICATION_ENUM.include?(external_authentication)
        OCI.logger.debug("Unknown value for 'external_authentication' [" + external_authentication + "]. Mapping to 'EXTERNAL_AUTHENTICATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @external_authentication = EXTERNAL_AUTHENTICATION_UNKNOWN_ENUM_VALUE
      else
        @external_authentication = external_authentication
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        target_id == other.target_id &&
        assessment_id == other.assessment_id &&
        unified_audit == other.unified_audit &&
        fine_grained_audit == other.fine_grained_audit &&
        traditional_audit == other.traditional_audit &&
        database_vault == other.database_vault &&
        privilege_analysis == other.privilege_analysis &&
        tablespace_encryption == other.tablespace_encryption &&
        column_encryption == other.column_encryption &&
        network_encryption == other.network_encryption &&
        password_authentication == other.password_authentication &&
        global_authentication == other.global_authentication &&
        external_authentication == other.external_authentication &&
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
      [compartment_id, target_id, assessment_id, unified_audit, fine_grained_audit, traditional_audit, database_vault, privilege_analysis, tablespace_encryption, column_encryption, network_encryption, password_authentication, global_authentication, external_authentication, freeform_tags, defined_tags].hash
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
