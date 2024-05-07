# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Schema for Grant Resource
  class IdentityDomains::Models::Grant
    IDCS_PREVENTED_OPERATIONS_ENUM = [
      IDCS_PREVENTED_OPERATIONS_REPLACE = 'replace'.freeze,
      IDCS_PREVENTED_OPERATIONS_UPDATE = 'update'.freeze,
      IDCS_PREVENTED_OPERATIONS_DELETE = 'delete'.freeze,
      IDCS_PREVENTED_OPERATIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    GRANT_MECHANISM_ENUM = [
      GRANT_MECHANISM_IMPORT_APPROLE_MEMBERS = 'IMPORT_APPROLE_MEMBERS'.freeze,
      GRANT_MECHANISM_ADMINISTRATOR_TO_USER = 'ADMINISTRATOR_TO_USER'.freeze,
      GRANT_MECHANISM_ADMINISTRATOR_TO_DELEGATED_USER = 'ADMINISTRATOR_TO_DELEGATED_USER'.freeze,
      GRANT_MECHANISM_ADMINISTRATOR_TO_GROUP = 'ADMINISTRATOR_TO_GROUP'.freeze,
      GRANT_MECHANISM_SERVICE_MANAGER_TO_USER = 'SERVICE_MANAGER_TO_USER'.freeze,
      GRANT_MECHANISM_ADMINISTRATOR_TO_APP = 'ADMINISTRATOR_TO_APP'.freeze,
      GRANT_MECHANISM_SERVICE_MANAGER_TO_APP = 'SERVICE_MANAGER_TO_APP'.freeze,
      GRANT_MECHANISM_OPC_INFRA_TO_APP = 'OPC_INFRA_TO_APP'.freeze,
      GRANT_MECHANISM_GROUP_MEMBERSHIP = 'GROUP_MEMBERSHIP'.freeze,
      GRANT_MECHANISM_IMPORT_GRANTS = 'IMPORT_GRANTS'.freeze,
      GRANT_MECHANISM_SYNC_TO_USER = 'SYNC_TO_USER'.freeze,
      GRANT_MECHANISM_ACCESS_REQUEST = 'ACCESS_REQUEST'.freeze,
      GRANT_MECHANISM_APP_ENTITLEMENT_COLLECTION = 'APP_ENTITLEMENT_COLLECTION'.freeze,
      GRANT_MECHANISM_ADMINISTRATOR_TO_DYNAMIC_RESOURCE_GROUP = 'ADMINISTRATOR_TO_DYNAMIC_RESOURCE_GROUP'.freeze,
      GRANT_MECHANISM_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    # **[Required]** Each value of grantMechanism indicates how (or by what component) some App (or App-Entitlement) was granted.
    # A customer or the UI should use only grantMechanism values that start with 'ADMINISTRATOR':
    #   - 'ADMINISTRATOR_TO_USER' is for a direct grant to a specific User.
    #   - 'ADMINISTRATOR_TO_GROUP' is for a grant to a specific Group, which results in indirect grants to Users who are members of that Group.
    #   - 'ADMINISTRATOR_TO_APP' is for a grant to a specific App.  The grantee (client) App gains access to the granted (server) App.
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsCsvAttributeNameMappings: [[defaultValue:IMPORT_GRANTS]]
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: immutable
    #  - required: true
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_reader :grant_mechanism

    # Unique key of grant, composed by combining a subset of app, entitlement, grantee, grantor and grantMechanism.  Used to prevent duplicate Grants.
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

    # If true, this Grant has been fulfilled successfully.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :is_fulfilled

    # Store granted attribute-values as a string in Javascript Object Notation (JSON) format.
    #
    # **Added In:** 18.3.4
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :granted_attribute_values_json

    # @return [OCI::IdentityDomains::Models::GrantAppEntitlementCollection]
    attr_accessor :app_entitlement_collection

    # @return [OCI::IdentityDomains::Models::GrantGrantor]
    attr_accessor :grantor

    # This attribute is required.
    # @return [OCI::IdentityDomains::Models::GrantGrantee]
    attr_accessor :grantee

    # @return [OCI::IdentityDomains::Models::GrantApp]
    attr_accessor :app

    # @return [OCI::IdentityDomains::Models::GrantEntitlement]
    attr_accessor :entitlement

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
        'grant_mechanism': :'grantMechanism',
        'composite_key': :'compositeKey',
        'is_fulfilled': :'isFulfilled',
        'granted_attribute_values_json': :'grantedAttributeValuesJson',
        'app_entitlement_collection': :'appEntitlementCollection',
        'grantor': :'grantor',
        'grantee': :'grantee',
        'app': :'app',
        'entitlement': :'entitlement'
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
        'grant_mechanism': :'String',
        'composite_key': :'String',
        'is_fulfilled': :'BOOLEAN',
        'granted_attribute_values_json': :'String',
        'app_entitlement_collection': :'OCI::IdentityDomains::Models::GrantAppEntitlementCollection',
        'grantor': :'OCI::IdentityDomains::Models::GrantGrantor',
        'grantee': :'OCI::IdentityDomains::Models::GrantGrantee',
        'app': :'OCI::IdentityDomains::Models::GrantApp',
        'entitlement': :'OCI::IdentityDomains::Models::GrantEntitlement'
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
    # @option attributes [String] :grant_mechanism The value to assign to the {#grant_mechanism} property
    # @option attributes [String] :composite_key The value to assign to the {#composite_key} property
    # @option attributes [BOOLEAN] :is_fulfilled The value to assign to the {#is_fulfilled} property
    # @option attributes [String] :granted_attribute_values_json The value to assign to the {#granted_attribute_values_json} property
    # @option attributes [OCI::IdentityDomains::Models::GrantAppEntitlementCollection] :app_entitlement_collection The value to assign to the {#app_entitlement_collection} property
    # @option attributes [OCI::IdentityDomains::Models::GrantGrantor] :grantor The value to assign to the {#grantor} property
    # @option attributes [OCI::IdentityDomains::Models::GrantGrantee] :grantee The value to assign to the {#grantee} property
    # @option attributes [OCI::IdentityDomains::Models::GrantApp] :app The value to assign to the {#app} property
    # @option attributes [OCI::IdentityDomains::Models::GrantEntitlement] :entitlement The value to assign to the {#entitlement} property
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

      self.grant_mechanism = attributes[:'grantMechanism'] if attributes[:'grantMechanism']

      raise 'You cannot provide both :grantMechanism and :grant_mechanism' if attributes.key?(:'grantMechanism') && attributes.key?(:'grant_mechanism')

      self.grant_mechanism = attributes[:'grant_mechanism'] if attributes[:'grant_mechanism']

      self.composite_key = attributes[:'compositeKey'] if attributes[:'compositeKey']

      raise 'You cannot provide both :compositeKey and :composite_key' if attributes.key?(:'compositeKey') && attributes.key?(:'composite_key')

      self.composite_key = attributes[:'composite_key'] if attributes[:'composite_key']

      self.is_fulfilled = attributes[:'isFulfilled'] unless attributes[:'isFulfilled'].nil?

      raise 'You cannot provide both :isFulfilled and :is_fulfilled' if attributes.key?(:'isFulfilled') && attributes.key?(:'is_fulfilled')

      self.is_fulfilled = attributes[:'is_fulfilled'] unless attributes[:'is_fulfilled'].nil?

      self.granted_attribute_values_json = attributes[:'grantedAttributeValuesJson'] if attributes[:'grantedAttributeValuesJson']

      raise 'You cannot provide both :grantedAttributeValuesJson and :granted_attribute_values_json' if attributes.key?(:'grantedAttributeValuesJson') && attributes.key?(:'granted_attribute_values_json')

      self.granted_attribute_values_json = attributes[:'granted_attribute_values_json'] if attributes[:'granted_attribute_values_json']

      self.app_entitlement_collection = attributes[:'appEntitlementCollection'] if attributes[:'appEntitlementCollection']

      raise 'You cannot provide both :appEntitlementCollection and :app_entitlement_collection' if attributes.key?(:'appEntitlementCollection') && attributes.key?(:'app_entitlement_collection')

      self.app_entitlement_collection = attributes[:'app_entitlement_collection'] if attributes[:'app_entitlement_collection']

      self.grantor = attributes[:'grantor'] if attributes[:'grantor']

      self.grantee = attributes[:'grantee'] if attributes[:'grantee']

      self.app = attributes[:'app'] if attributes[:'app']

      self.entitlement = attributes[:'entitlement'] if attributes[:'entitlement']
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
    # @param [Object] grant_mechanism Object to be assigned
    def grant_mechanism=(grant_mechanism)
      # rubocop:disable Style/ConditionalAssignment
      if grant_mechanism && !GRANT_MECHANISM_ENUM.include?(grant_mechanism)
        OCI.logger.debug("Unknown value for 'grant_mechanism' [" + grant_mechanism + "]. Mapping to 'GRANT_MECHANISM_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @grant_mechanism = GRANT_MECHANISM_UNKNOWN_ENUM_VALUE
      else
        @grant_mechanism = grant_mechanism
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
        grant_mechanism == other.grant_mechanism &&
        composite_key == other.composite_key &&
        is_fulfilled == other.is_fulfilled &&
        granted_attribute_values_json == other.granted_attribute_values_json &&
        app_entitlement_collection == other.app_entitlement_collection &&
        grantor == other.grantor &&
        grantee == other.grantee &&
        app == other.app &&
        entitlement == other.entitlement
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
      [id, ocid, schemas, meta, idcs_created_by, idcs_last_modified_by, idcs_prevented_operations, tags, delete_in_progress, idcs_last_upgraded_in_release, domain_ocid, compartment_ocid, tenancy_ocid, grant_mechanism, composite_key, is_fulfilled, granted_attribute_values_json, app_entitlement_collection, grantor, grantee, app, entitlement].hash
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
