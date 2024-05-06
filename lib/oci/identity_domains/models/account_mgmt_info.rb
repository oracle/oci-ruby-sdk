# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Schema for AccountMgmtInfo resource.
  class IdentityDomains::Models::AccountMgmtInfo
    IDCS_PREVENTED_OPERATIONS_ENUM = [
      IDCS_PREVENTED_OPERATIONS_REPLACE = 'replace'.freeze,
      IDCS_PREVENTED_OPERATIONS_UPDATE = 'update'.freeze,
      IDCS_PREVENTED_OPERATIONS_DELETE = 'delete'.freeze,
      IDCS_PREVENTED_OPERATIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SYNC_SITUATION_ENUM = [
      SYNC_SITUATION_FOUND = 'Found'.freeze,
      SYNC_SITUATION_MATCHED = 'Matched'.freeze,
      SYNC_SITUATION_UNMATCHED = 'Unmatched'.freeze,
      SYNC_SITUATION_LOST = 'Lost'.freeze,
      SYNC_SITUATION_DISPUTED = 'Disputed'.freeze,
      SYNC_SITUATION_CONFIRMED = 'Confirmed'.freeze,
      SYNC_SITUATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_CONTEXT_ENUM = [
      OPERATION_CONTEXT_LIFE_CYCLE_EVENT = 'LifeCycleEvent'.freeze,
      OPERATION_CONTEXT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Unique identifier for the SCIM Resource as defined by the Service Provider. Each representation of the Resource MUST include a non-empty id value. This identifier MUST be unique across the Service Provider's entire set of Resources. It MUST be a stable, non-reassignable identifier that does not change when the same Resource is returned in subsequent requests. The value of the id attribute is always issued by the Service Provider and MUST never be specified by the Service Consumer. bulkId: is a reserved keyword and MUST NOT be used in the unique identifier.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: always
    #  - type: string
    #  - uniqueness: global
    # @return [String]
    attr_accessor :id

    # Unique OCI identifier for the SCIM Resource.
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: global
    # @return [String]
    attr_accessor :ocid

    # **[Required]** REQUIRED. The schemas attribute is an array of Strings which allows introspection of the supported schema version for a SCIM representation as well any schema extensions supported by that representation. Each String value must be a unique URI. This specification defines URIs for User, Group, and a standard \\\"enterprise\\\" extension. All representations of SCIM schema MUST include a non-zero value array with value(s) of the URIs supported by that representation. Duplicate values MUST NOT be included. Value order is not specified and MUST not impact behavior.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: true
    #  - mutability: readWrite
    #  - required: true
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [Array<String>]
    attr_accessor :schemas

    # @return [OCI::IdentityDomains::Models::Meta]
    attr_accessor :meta

    # @return [OCI::IdentityDomains::Models::IdcsCreatedBy]
    attr_accessor :idcs_created_by

    # @return [OCI::IdentityDomains::Models::IdcsLastModifiedBy]
    attr_accessor :idcs_last_modified_by

    # Each value of this attribute specifies an operation that only an internal client may perform on this particular resource.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [Array<String>]
    attr_reader :idcs_prevented_operations

    # A list of tags on this resource.
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [key, value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readWrite
    #  - required: false
    #  - returned: request
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::Tags>]
    attr_accessor :tags

    # A boolean flag indicating this resource in the process of being deleted. Usually set to true when synchronous deletion of the resource would take too long.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :delete_in_progress

    # The release number when the resource was upgraded.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :idcs_last_upgraded_in_release

    # OCI Domain Id (ocid) in which the resource lives.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :domain_ocid

    # OCI Compartment Id (ocid) in which the resource lives.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :compartment_ocid

    # OCI Tenant Id (ocid) in which the resource lives.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :tenancy_ocid

    # Unique identifier of the Account
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :uid

    # Name of the Account
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :name

    # Unique key for this AccountMgmtInfo, which is used to prevent duplicate AccountMgmtInfo resources. Key is composed of a subset of app, owner and accountType.
    #
    # **Added In:** 18.1.2
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: server
    # @return [String]
    attr_accessor :composite_key

    # If true, the account is activated
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :active

    # Type of Account
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :account_type

    # If true, indicates that this managed object is an account, which is an identity that represents a user in the context of a specific application
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :is_account

    # If true, this account has been marked as a favorite of the User who owns it
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :favorite

    # If true, the operation will not be performed on the target
    #
    # **Added In:** 17.4.6
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :do_not_perform_action_on_target

    # If true, a back-fill grant will not be created for a connected managed app as part of account creation.
    #
    # **Added In:** 18.2.6
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :do_not_back_fill_grants

    # Last accessed timestamp of an application
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: dateTime
    #  - uniqueness: none
    # @return [String]
    attr_accessor :last_accessed

    # Last sync timestamp of the account
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: dateTime
    #  - uniqueness: none
    # @return [String]
    attr_accessor :sync_timestamp

    # Last recorded sync situation for the account
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_reader :sync_situation

    # Last recorded sync response for the account
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :sync_response

    # If true, then the response to the account creation operation on a connected managed app returns a preview of the account data that is evaluated by the attribute value generation policy. Note that an account will not be created on the target application when this attribute is set to true.
    #
    # **Added In:** 18.2.6
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :preview_only

    # The context in which the operation is performed on the account.
    #
    # **Added In:** 19.1.4
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_reader :operation_context

    # @return [OCI::IdentityDomains::Models::AccountMgmtInfoObjectClass]
    attr_accessor :object_class

    # @return [OCI::IdentityDomains::Models::AccountMgmtInfoResourceType]
    attr_accessor :resource_type

    # Matching owning users of the account
    #
    # **SCIM++ Properties:**
    #  - idcsCompositeKey: [value]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::AccountMgmtInfoMatchingOwners>]
    attr_accessor :matching_owners

    # @return [OCI::IdentityDomains::Models::AccountMgmtInfoUserWalletArtifact]
    attr_accessor :user_wallet_artifact

    # This attribute is required.
    # @return [OCI::IdentityDomains::Models::AccountMgmtInfoApp]
    attr_accessor :app

    # @return [OCI::IdentityDomains::Models::AccountMgmtInfoOwner]
    attr_accessor :owner

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'ocid': :'ocid',
        'schemas': :'schemas',
        'meta': :'meta',
        'idcs_created_by': :'idcsCreatedBy',
        'idcs_last_modified_by': :'idcsLastModifiedBy',
        'idcs_prevented_operations': :'idcsPreventedOperations',
        'tags': :'tags',
        'delete_in_progress': :'deleteInProgress',
        'idcs_last_upgraded_in_release': :'idcsLastUpgradedInRelease',
        'domain_ocid': :'domainOcid',
        'compartment_ocid': :'compartmentOcid',
        'tenancy_ocid': :'tenancyOcid',
        'uid': :'uid',
        'name': :'name',
        'composite_key': :'compositeKey',
        'active': :'active',
        'account_type': :'accountType',
        'is_account': :'isAccount',
        'favorite': :'favorite',
        'do_not_perform_action_on_target': :'doNotPerformActionOnTarget',
        'do_not_back_fill_grants': :'doNotBackFillGrants',
        'last_accessed': :'lastAccessed',
        'sync_timestamp': :'syncTimestamp',
        'sync_situation': :'syncSituation',
        'sync_response': :'syncResponse',
        'preview_only': :'previewOnly',
        'operation_context': :'operationContext',
        'object_class': :'objectClass',
        'resource_type': :'resourceType',
        'matching_owners': :'matchingOwners',
        'user_wallet_artifact': :'userWalletArtifact',
        'app': :'app',
        'owner': :'owner'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'ocid': :'String',
        'schemas': :'Array<String>',
        'meta': :'OCI::IdentityDomains::Models::Meta',
        'idcs_created_by': :'OCI::IdentityDomains::Models::IdcsCreatedBy',
        'idcs_last_modified_by': :'OCI::IdentityDomains::Models::IdcsLastModifiedBy',
        'idcs_prevented_operations': :'Array<String>',
        'tags': :'Array<OCI::IdentityDomains::Models::Tags>',
        'delete_in_progress': :'BOOLEAN',
        'idcs_last_upgraded_in_release': :'String',
        'domain_ocid': :'String',
        'compartment_ocid': :'String',
        'tenancy_ocid': :'String',
        'uid': :'String',
        'name': :'String',
        'composite_key': :'String',
        'active': :'BOOLEAN',
        'account_type': :'String',
        'is_account': :'BOOLEAN',
        'favorite': :'BOOLEAN',
        'do_not_perform_action_on_target': :'BOOLEAN',
        'do_not_back_fill_grants': :'BOOLEAN',
        'last_accessed': :'String',
        'sync_timestamp': :'String',
        'sync_situation': :'String',
        'sync_response': :'String',
        'preview_only': :'BOOLEAN',
        'operation_context': :'String',
        'object_class': :'OCI::IdentityDomains::Models::AccountMgmtInfoObjectClass',
        'resource_type': :'OCI::IdentityDomains::Models::AccountMgmtInfoResourceType',
        'matching_owners': :'Array<OCI::IdentityDomains::Models::AccountMgmtInfoMatchingOwners>',
        'user_wallet_artifact': :'OCI::IdentityDomains::Models::AccountMgmtInfoUserWalletArtifact',
        'app': :'OCI::IdentityDomains::Models::AccountMgmtInfoApp',
        'owner': :'OCI::IdentityDomains::Models::AccountMgmtInfoOwner'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :ocid The value to assign to the {#ocid} property
    # @option attributes [Array<String>] :schemas The value to assign to the {#schemas} property
    # @option attributes [OCI::IdentityDomains::Models::Meta] :meta The value to assign to the {#meta} property
    # @option attributes [OCI::IdentityDomains::Models::IdcsCreatedBy] :idcs_created_by The value to assign to the {#idcs_created_by} property
    # @option attributes [OCI::IdentityDomains::Models::IdcsLastModifiedBy] :idcs_last_modified_by The value to assign to the {#idcs_last_modified_by} property
    # @option attributes [Array<String>] :idcs_prevented_operations The value to assign to the {#idcs_prevented_operations} property
    # @option attributes [Array<OCI::IdentityDomains::Models::Tags>] :tags The value to assign to the {#tags} property
    # @option attributes [BOOLEAN] :delete_in_progress The value to assign to the {#delete_in_progress} property
    # @option attributes [String] :idcs_last_upgraded_in_release The value to assign to the {#idcs_last_upgraded_in_release} property
    # @option attributes [String] :domain_ocid The value to assign to the {#domain_ocid} property
    # @option attributes [String] :compartment_ocid The value to assign to the {#compartment_ocid} property
    # @option attributes [String] :tenancy_ocid The value to assign to the {#tenancy_ocid} property
    # @option attributes [String] :uid The value to assign to the {#uid} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :composite_key The value to assign to the {#composite_key} property
    # @option attributes [BOOLEAN] :active The value to assign to the {#active} property
    # @option attributes [String] :account_type The value to assign to the {#account_type} property
    # @option attributes [BOOLEAN] :is_account The value to assign to the {#is_account} property
    # @option attributes [BOOLEAN] :favorite The value to assign to the {#favorite} property
    # @option attributes [BOOLEAN] :do_not_perform_action_on_target The value to assign to the {#do_not_perform_action_on_target} property
    # @option attributes [BOOLEAN] :do_not_back_fill_grants The value to assign to the {#do_not_back_fill_grants} property
    # @option attributes [String] :last_accessed The value to assign to the {#last_accessed} property
    # @option attributes [String] :sync_timestamp The value to assign to the {#sync_timestamp} property
    # @option attributes [String] :sync_situation The value to assign to the {#sync_situation} property
    # @option attributes [String] :sync_response The value to assign to the {#sync_response} property
    # @option attributes [BOOLEAN] :preview_only The value to assign to the {#preview_only} property
    # @option attributes [String] :operation_context The value to assign to the {#operation_context} property
    # @option attributes [OCI::IdentityDomains::Models::AccountMgmtInfoObjectClass] :object_class The value to assign to the {#object_class} property
    # @option attributes [OCI::IdentityDomains::Models::AccountMgmtInfoResourceType] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [Array<OCI::IdentityDomains::Models::AccountMgmtInfoMatchingOwners>] :matching_owners The value to assign to the {#matching_owners} property
    # @option attributes [OCI::IdentityDomains::Models::AccountMgmtInfoUserWalletArtifact] :user_wallet_artifact The value to assign to the {#user_wallet_artifact} property
    # @option attributes [OCI::IdentityDomains::Models::AccountMgmtInfoApp] :app The value to assign to the {#app} property
    # @option attributes [OCI::IdentityDomains::Models::AccountMgmtInfoOwner] :owner The value to assign to the {#owner} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.ocid = attributes[:'ocid'] if attributes[:'ocid']

      self.schemas = attributes[:'schemas'] if attributes[:'schemas']

      self.meta = attributes[:'meta'] if attributes[:'meta']

      self.idcs_created_by = attributes[:'idcsCreatedBy'] if attributes[:'idcsCreatedBy']

      raise 'You cannot provide both :idcsCreatedBy and :idcs_created_by' if attributes.key?(:'idcsCreatedBy') && attributes.key?(:'idcs_created_by')

      self.idcs_created_by = attributes[:'idcs_created_by'] if attributes[:'idcs_created_by']

      self.idcs_last_modified_by = attributes[:'idcsLastModifiedBy'] if attributes[:'idcsLastModifiedBy']

      raise 'You cannot provide both :idcsLastModifiedBy and :idcs_last_modified_by' if attributes.key?(:'idcsLastModifiedBy') && attributes.key?(:'idcs_last_modified_by')

      self.idcs_last_modified_by = attributes[:'idcs_last_modified_by'] if attributes[:'idcs_last_modified_by']

      self.idcs_prevented_operations = attributes[:'idcsPreventedOperations'] if attributes[:'idcsPreventedOperations']

      raise 'You cannot provide both :idcsPreventedOperations and :idcs_prevented_operations' if attributes.key?(:'idcsPreventedOperations') && attributes.key?(:'idcs_prevented_operations')

      self.idcs_prevented_operations = attributes[:'idcs_prevented_operations'] if attributes[:'idcs_prevented_operations']

      self.tags = attributes[:'tags'] if attributes[:'tags']

      self.delete_in_progress = attributes[:'deleteInProgress'] unless attributes[:'deleteInProgress'].nil?

      raise 'You cannot provide both :deleteInProgress and :delete_in_progress' if attributes.key?(:'deleteInProgress') && attributes.key?(:'delete_in_progress')

      self.delete_in_progress = attributes[:'delete_in_progress'] unless attributes[:'delete_in_progress'].nil?

      self.idcs_last_upgraded_in_release = attributes[:'idcsLastUpgradedInRelease'] if attributes[:'idcsLastUpgradedInRelease']

      raise 'You cannot provide both :idcsLastUpgradedInRelease and :idcs_last_upgraded_in_release' if attributes.key?(:'idcsLastUpgradedInRelease') && attributes.key?(:'idcs_last_upgraded_in_release')

      self.idcs_last_upgraded_in_release = attributes[:'idcs_last_upgraded_in_release'] if attributes[:'idcs_last_upgraded_in_release']

      self.domain_ocid = attributes[:'domainOcid'] if attributes[:'domainOcid']

      raise 'You cannot provide both :domainOcid and :domain_ocid' if attributes.key?(:'domainOcid') && attributes.key?(:'domain_ocid')

      self.domain_ocid = attributes[:'domain_ocid'] if attributes[:'domain_ocid']

      self.compartment_ocid = attributes[:'compartmentOcid'] if attributes[:'compartmentOcid']

      raise 'You cannot provide both :compartmentOcid and :compartment_ocid' if attributes.key?(:'compartmentOcid') && attributes.key?(:'compartment_ocid')

      self.compartment_ocid = attributes[:'compartment_ocid'] if attributes[:'compartment_ocid']

      self.tenancy_ocid = attributes[:'tenancyOcid'] if attributes[:'tenancyOcid']

      raise 'You cannot provide both :tenancyOcid and :tenancy_ocid' if attributes.key?(:'tenancyOcid') && attributes.key?(:'tenancy_ocid')

      self.tenancy_ocid = attributes[:'tenancy_ocid'] if attributes[:'tenancy_ocid']

      self.uid = attributes[:'uid'] if attributes[:'uid']

      self.name = attributes[:'name'] if attributes[:'name']

      self.composite_key = attributes[:'compositeKey'] if attributes[:'compositeKey']

      raise 'You cannot provide both :compositeKey and :composite_key' if attributes.key?(:'compositeKey') && attributes.key?(:'composite_key')

      self.composite_key = attributes[:'composite_key'] if attributes[:'composite_key']

      self.active = attributes[:'active'] unless attributes[:'active'].nil?

      self.account_type = attributes[:'accountType'] if attributes[:'accountType']

      raise 'You cannot provide both :accountType and :account_type' if attributes.key?(:'accountType') && attributes.key?(:'account_type')

      self.account_type = attributes[:'account_type'] if attributes[:'account_type']

      self.is_account = attributes[:'isAccount'] unless attributes[:'isAccount'].nil?

      raise 'You cannot provide both :isAccount and :is_account' if attributes.key?(:'isAccount') && attributes.key?(:'is_account')

      self.is_account = attributes[:'is_account'] unless attributes[:'is_account'].nil?

      self.favorite = attributes[:'favorite'] unless attributes[:'favorite'].nil?

      self.do_not_perform_action_on_target = attributes[:'doNotPerformActionOnTarget'] unless attributes[:'doNotPerformActionOnTarget'].nil?

      raise 'You cannot provide both :doNotPerformActionOnTarget and :do_not_perform_action_on_target' if attributes.key?(:'doNotPerformActionOnTarget') && attributes.key?(:'do_not_perform_action_on_target')

      self.do_not_perform_action_on_target = attributes[:'do_not_perform_action_on_target'] unless attributes[:'do_not_perform_action_on_target'].nil?

      self.do_not_back_fill_grants = attributes[:'doNotBackFillGrants'] unless attributes[:'doNotBackFillGrants'].nil?

      raise 'You cannot provide both :doNotBackFillGrants and :do_not_back_fill_grants' if attributes.key?(:'doNotBackFillGrants') && attributes.key?(:'do_not_back_fill_grants')

      self.do_not_back_fill_grants = attributes[:'do_not_back_fill_grants'] unless attributes[:'do_not_back_fill_grants'].nil?

      self.last_accessed = attributes[:'lastAccessed'] if attributes[:'lastAccessed']

      raise 'You cannot provide both :lastAccessed and :last_accessed' if attributes.key?(:'lastAccessed') && attributes.key?(:'last_accessed')

      self.last_accessed = attributes[:'last_accessed'] if attributes[:'last_accessed']

      self.sync_timestamp = attributes[:'syncTimestamp'] if attributes[:'syncTimestamp']

      raise 'You cannot provide both :syncTimestamp and :sync_timestamp' if attributes.key?(:'syncTimestamp') && attributes.key?(:'sync_timestamp')

      self.sync_timestamp = attributes[:'sync_timestamp'] if attributes[:'sync_timestamp']

      self.sync_situation = attributes[:'syncSituation'] if attributes[:'syncSituation']

      raise 'You cannot provide both :syncSituation and :sync_situation' if attributes.key?(:'syncSituation') && attributes.key?(:'sync_situation')

      self.sync_situation = attributes[:'sync_situation'] if attributes[:'sync_situation']

      self.sync_response = attributes[:'syncResponse'] if attributes[:'syncResponse']

      raise 'You cannot provide both :syncResponse and :sync_response' if attributes.key?(:'syncResponse') && attributes.key?(:'sync_response')

      self.sync_response = attributes[:'sync_response'] if attributes[:'sync_response']

      self.preview_only = attributes[:'previewOnly'] unless attributes[:'previewOnly'].nil?

      raise 'You cannot provide both :previewOnly and :preview_only' if attributes.key?(:'previewOnly') && attributes.key?(:'preview_only')

      self.preview_only = attributes[:'preview_only'] unless attributes[:'preview_only'].nil?

      self.operation_context = attributes[:'operationContext'] if attributes[:'operationContext']

      raise 'You cannot provide both :operationContext and :operation_context' if attributes.key?(:'operationContext') && attributes.key?(:'operation_context')

      self.operation_context = attributes[:'operation_context'] if attributes[:'operation_context']

      self.object_class = attributes[:'objectClass'] if attributes[:'objectClass']

      raise 'You cannot provide both :objectClass and :object_class' if attributes.key?(:'objectClass') && attributes.key?(:'object_class')

      self.object_class = attributes[:'object_class'] if attributes[:'object_class']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.matching_owners = attributes[:'matchingOwners'] if attributes[:'matchingOwners']

      raise 'You cannot provide both :matchingOwners and :matching_owners' if attributes.key?(:'matchingOwners') && attributes.key?(:'matching_owners')

      self.matching_owners = attributes[:'matching_owners'] if attributes[:'matching_owners']

      self.user_wallet_artifact = attributes[:'userWalletArtifact'] if attributes[:'userWalletArtifact']

      raise 'You cannot provide both :userWalletArtifact and :user_wallet_artifact' if attributes.key?(:'userWalletArtifact') && attributes.key?(:'user_wallet_artifact')

      self.user_wallet_artifact = attributes[:'user_wallet_artifact'] if attributes[:'user_wallet_artifact']

      self.app = attributes[:'app'] if attributes[:'app']

      self.owner = attributes[:'owner'] if attributes[:'owner']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] idcs_prevented_operations Object to be assigned
    def idcs_prevented_operations=(idcs_prevented_operations)
      # rubocop:disable Style/ConditionalAssignment
      if idcs_prevented_operations.nil?
        @idcs_prevented_operations = nil
      else
        @idcs_prevented_operations =
          idcs_prevented_operations.collect do |item|
            if IDCS_PREVENTED_OPERATIONS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'idcs_prevented_operations' [#{item}]. Mapping to 'IDCS_PREVENTED_OPERATIONS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              IDCS_PREVENTED_OPERATIONS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sync_situation Object to be assigned
    def sync_situation=(sync_situation)
      # rubocop:disable Style/ConditionalAssignment
      if sync_situation && !SYNC_SITUATION_ENUM.include?(sync_situation)
        OCI.logger.debug("Unknown value for 'sync_situation' [" + sync_situation + "]. Mapping to 'SYNC_SITUATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @sync_situation = SYNC_SITUATION_UNKNOWN_ENUM_VALUE
      else
        @sync_situation = sync_situation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_context Object to be assigned
    def operation_context=(operation_context)
      # rubocop:disable Style/ConditionalAssignment
      if operation_context && !OPERATION_CONTEXT_ENUM.include?(operation_context)
        OCI.logger.debug("Unknown value for 'operation_context' [" + operation_context + "]. Mapping to 'OPERATION_CONTEXT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_context = OPERATION_CONTEXT_UNKNOWN_ENUM_VALUE
      else
        @operation_context = operation_context
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
        ocid == other.ocid &&
        schemas == other.schemas &&
        meta == other.meta &&
        idcs_created_by == other.idcs_created_by &&
        idcs_last_modified_by == other.idcs_last_modified_by &&
        idcs_prevented_operations == other.idcs_prevented_operations &&
        tags == other.tags &&
        delete_in_progress == other.delete_in_progress &&
        idcs_last_upgraded_in_release == other.idcs_last_upgraded_in_release &&
        domain_ocid == other.domain_ocid &&
        compartment_ocid == other.compartment_ocid &&
        tenancy_ocid == other.tenancy_ocid &&
        uid == other.uid &&
        name == other.name &&
        composite_key == other.composite_key &&
        active == other.active &&
        account_type == other.account_type &&
        is_account == other.is_account &&
        favorite == other.favorite &&
        do_not_perform_action_on_target == other.do_not_perform_action_on_target &&
        do_not_back_fill_grants == other.do_not_back_fill_grants &&
        last_accessed == other.last_accessed &&
        sync_timestamp == other.sync_timestamp &&
        sync_situation == other.sync_situation &&
        sync_response == other.sync_response &&
        preview_only == other.preview_only &&
        operation_context == other.operation_context &&
        object_class == other.object_class &&
        resource_type == other.resource_type &&
        matching_owners == other.matching_owners &&
        user_wallet_artifact == other.user_wallet_artifact &&
        app == other.app &&
        owner == other.owner
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
      [id, ocid, schemas, meta, idcs_created_by, idcs_last_modified_by, idcs_prevented_operations, tags, delete_in_progress, idcs_last_upgraded_in_release, domain_ocid, compartment_ocid, tenancy_ocid, uid, name, composite_key, active, account_type, is_account, favorite, do_not_perform_action_on_target, do_not_back_fill_grants, last_accessed, sync_timestamp, sync_situation, sync_response, preview_only, operation_context, object_class, resource_type, matching_owners, user_wallet_artifact, app, owner].hash
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