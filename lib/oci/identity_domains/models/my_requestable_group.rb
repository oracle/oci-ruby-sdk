# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Group resource.
  class IdentityDomains::Models::MyRequestableGroup
    IDCS_PREVENTED_OPERATIONS_ENUM = [
      IDCS_PREVENTED_OPERATIONS_REPLACE = 'replace'.freeze,
      IDCS_PREVENTED_OPERATIONS_UPDATE = 'update'.freeze,
      IDCS_PREVENTED_OPERATIONS_DELETE = 'delete'.freeze,
      IDCS_PREVENTED_OPERATIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    # An identifier for the Resource as defined by the Service Consumer. The externalId may simplify identification of the Resource between Service Consumer and Service Provider by allowing the Consumer to refer to the Resource with its own identifier, obviating the need to store a local mapping between the local identifier of the Resource and the identifier used by the Service Provider. Each Resource MAY include a non-empty externalId value. The value of the externalId attribute is always issued by the Service Consumer and can never be specified by the Service Provider. The Service Provider MUST always interpret the externalId as scoped to the Service Consumer's tenant.
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
    attr_accessor :external_id

    # **[Required]** The Group display name.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsCsvAttributeName: Display Name
    #  - idcsCsvAttributeNameMappings: [[columnHeaderName:Name, deprecatedColumnHeaderName:Display Name]]
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: true
    #  - returned: always
    #  - type: string
    #  - uniqueness: global
    # @return [String]
    attr_accessor :display_name

    # A human readable name for the group as defined by the Service Consumer.
    #
    # **Added In:** 2011192329
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsCsvAttributeName: Non-Unique Display Name
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readWrite
    #  - required: false
    #  - returned: always
    #  - type: string
    # @return [String]
    attr_accessor :non_unique_display_name

    # The group members. <b>Important:</b> When requesting group members, a maximum of 10,000 members can be returned in a single request. If the response contains more than 10,000 members, the request will fail. Use 'startIndex' and 'count' to return members in pages instead of in a single response, for example: #attributes=members[startIndex=1%26count=10]. This REST API is SCIM compliant.
    #
    # **SCIM++ Properties:**
    #  - caseExact: false
    #  - idcsCompositeKey: [value]
    #  - idcsCsvAttributeNameMappings: [[columnHeaderName:User Members, mapsTo:members[User].value, multiValueDelimiter:;]]
    #  - idcsSearchable: true
    #  - multiValued: true
    #  - mutability: readWrite
    #  - required: false
    #  - returned: request
    #  - idcsPaginateResponse: true
    #  - type: complex
    #  - uniqueness: none
    # @return [Array<OCI::IdentityDomains::Models::MyRequestableGroupMembers>]
    attr_accessor :members

    # @return [OCI::IdentityDomains::Models::ExtensionGroupGroup]
    attr_accessor :urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group

    # @return [OCI::IdentityDomains::Models::ExtensionRequestableGroup]
    attr_accessor :urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group

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
        'external_id': :'externalId',
        'display_name': :'displayName',
        'non_unique_display_name': :'nonUniqueDisplayName',
        'members': :'members',
        'urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group': :'urn:ietf:params:scim:schemas:oracle:idcs:extension:group:Group',
        'urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group': :'urn:ietf:params:scim:schemas:oracle:idcs:extension:requestable:Group'
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
        'external_id': :'String',
        'display_name': :'String',
        'non_unique_display_name': :'String',
        'members': :'Array<OCI::IdentityDomains::Models::MyRequestableGroupMembers>',
        'urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group': :'OCI::IdentityDomains::Models::ExtensionGroupGroup',
        'urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group': :'OCI::IdentityDomains::Models::ExtensionRequestableGroup'
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
    # @option attributes [String] :external_id The value to assign to the {#external_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :non_unique_display_name The value to assign to the {#non_unique_display_name} property
    # @option attributes [Array<OCI::IdentityDomains::Models::MyRequestableGroupMembers>] :members The value to assign to the {#members} property
    # @option attributes [OCI::IdentityDomains::Models::ExtensionGroupGroup] :urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group The value to assign to the {#urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group} property
    # @option attributes [OCI::IdentityDomains::Models::ExtensionRequestableGroup] :urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group The value to assign to the {#urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group} property
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

      self.external_id = attributes[:'externalId'] if attributes[:'externalId']

      raise 'You cannot provide both :externalId and :external_id' if attributes.key?(:'externalId') && attributes.key?(:'external_id')

      self.external_id = attributes[:'external_id'] if attributes[:'external_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.non_unique_display_name = attributes[:'nonUniqueDisplayName'] if attributes[:'nonUniqueDisplayName']

      raise 'You cannot provide both :nonUniqueDisplayName and :non_unique_display_name' if attributes.key?(:'nonUniqueDisplayName') && attributes.key?(:'non_unique_display_name')

      self.non_unique_display_name = attributes[:'non_unique_display_name'] if attributes[:'non_unique_display_name']

      self.members = attributes[:'members'] if attributes[:'members']

      self.urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group = attributes[:'urn:ietf:params:scim:schemas:oracle:idcs:extension:group:Group'] if attributes[:'urn:ietf:params:scim:schemas:oracle:idcs:extension:group:Group']

      raise 'You cannot provide both :urn:ietf:params:scim:schemas:oracle:idcs:extension:group:Group and :urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group' if attributes.key?(:'urn:ietf:params:scim:schemas:oracle:idcs:extension:group:Group') && attributes.key?(:'urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group')

      self.urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group = attributes[:'urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group'] if attributes[:'urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group']

      self.urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group = attributes[:'urn:ietf:params:scim:schemas:oracle:idcs:extension:requestable:Group'] if attributes[:'urn:ietf:params:scim:schemas:oracle:idcs:extension:requestable:Group']

      raise 'You cannot provide both :urn:ietf:params:scim:schemas:oracle:idcs:extension:requestable:Group and :urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group' if attributes.key?(:'urn:ietf:params:scim:schemas:oracle:idcs:extension:requestable:Group') && attributes.key?(:'urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group')

      self.urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group = attributes[:'urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group'] if attributes[:'urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group']
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
        external_id == other.external_id &&
        display_name == other.display_name &&
        non_unique_display_name == other.non_unique_display_name &&
        members == other.members &&
        urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group == other.urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group &&
        urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group == other.urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group
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
      [id, ocid, schemas, meta, idcs_created_by, idcs_last_modified_by, idcs_prevented_operations, tags, delete_in_progress, idcs_last_upgraded_in_release, domain_ocid, compartment_ocid, tenancy_ocid, external_id, display_name, non_unique_display_name, members, urn_ietf_params_scim_schemas_oracle_idcs_extension_group_group, urn_ietf_params_scim_schemas_oracle_idcs_extension_requestable_group].hash
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
