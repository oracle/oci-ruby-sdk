# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: v1
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Application on which the account is based
  #
  # **SCIM++ Properties:**
  #  - idcsSearchable: true
  #  - multiValued: false
  #  - mutability: readOnly
  #  - required: true
  #  - returned: default
  #  - type: complex
  #  - uniqueness: none
  class IdentityDomains::Models::MyAppApp
    # **[Required]** Application identifier
    #
    # **SCIM++ Properties:**
    #  - caseExact: true
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: true
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :value

    # Application URI
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: reference
    #  - uniqueness: none
    # @return [String]
    attr_accessor :ref

    # Application display name
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
    attr_accessor :display

    # Application description
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
    attr_accessor :description

    # If true, this App allows runtime services to log end users into this App automatically.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :is_login_target

    # If true, this App will be displayed in the MyApps page of each end-user who has access to this App.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :show_in_my_apps

    # If true, this App is an AliasApp and it cannot be granted to an end user directly
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: true
    #  - multiValued: false
    #  - mutability: writeOnly
    #  - required: false
    #  - returned: never
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :is_alias_app

    # If true, this App is able to participate in runtime services, such as automatic-login, OAuth, and SAML. If false, all runtime services are disabled for this App, and only administrative operations can be performed.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :active

    # The protocol that runtime services will use to log end users in to this App automatically. If 'OIDC', then runtime services use the OpenID Connect protocol. If 'SAML', then runtime services use Security Assertion Markup Language protocol.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :login_mechanism

    # Application icon.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :app_icon

    # Application thumbnail.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: request
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :app_thumbnail

    # If true, this application is an Oracle Public Cloud service-instance.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: boolean
    #  - uniqueness: none
    # @return [BOOLEAN]
    attr_accessor :is_opc_service

    # This Uniform Resource Name (URN) value identifies the type of Oracle Public Cloud service of which this app is an instance.
    #
    # **SCIM++ Properties:**
    #  - idcsSearchable: false
    #  - multiValued: false
    #  - mutability: readOnly
    #  - required: false
    #  - returned: default
    #  - type: string
    #  - uniqueness: none
    # @return [String]
    attr_accessor :service_type_urn

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'value': :'value',
        'ref': :'$ref',
        'display': :'display',
        'description': :'description',
        'is_login_target': :'isLoginTarget',
        'show_in_my_apps': :'showInMyApps',
        'is_alias_app': :'isAliasApp',
        'active': :'active',
        'login_mechanism': :'loginMechanism',
        'app_icon': :'appIcon',
        'app_thumbnail': :'appThumbnail',
        'is_opc_service': :'isOPCService',
        'service_type_urn': :'serviceTypeURN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'value': :'String',
        'ref': :'String',
        'display': :'String',
        'description': :'String',
        'is_login_target': :'BOOLEAN',
        'show_in_my_apps': :'BOOLEAN',
        'is_alias_app': :'BOOLEAN',
        'active': :'BOOLEAN',
        'login_mechanism': :'String',
        'app_icon': :'String',
        'app_thumbnail': :'String',
        'is_opc_service': :'BOOLEAN',
        'service_type_urn': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :value The value to assign to the {#value} property
    # @option attributes [String] :ref The value to assign to the {#ref} property
    # @option attributes [String] :display The value to assign to the {#display} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_login_target The value to assign to the {#is_login_target} property
    # @option attributes [BOOLEAN] :show_in_my_apps The value to assign to the {#show_in_my_apps} property
    # @option attributes [BOOLEAN] :is_alias_app The value to assign to the {#is_alias_app} property
    # @option attributes [BOOLEAN] :active The value to assign to the {#active} property
    # @option attributes [String] :login_mechanism The value to assign to the {#login_mechanism} property
    # @option attributes [String] :app_icon The value to assign to the {#app_icon} property
    # @option attributes [String] :app_thumbnail The value to assign to the {#app_thumbnail} property
    # @option attributes [BOOLEAN] :is_opc_service The value to assign to the {#is_opc_service} property
    # @option attributes [String] :service_type_urn The value to assign to the {#service_type_urn} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.value = attributes[:'value'] if attributes[:'value']

      self.ref = attributes[:'$ref'] if attributes[:'$ref']

      self.display = attributes[:'display'] if attributes[:'display']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_login_target = attributes[:'isLoginTarget'] unless attributes[:'isLoginTarget'].nil?

      raise 'You cannot provide both :isLoginTarget and :is_login_target' if attributes.key?(:'isLoginTarget') && attributes.key?(:'is_login_target')

      self.is_login_target = attributes[:'is_login_target'] unless attributes[:'is_login_target'].nil?

      self.show_in_my_apps = attributes[:'showInMyApps'] unless attributes[:'showInMyApps'].nil?

      raise 'You cannot provide both :showInMyApps and :show_in_my_apps' if attributes.key?(:'showInMyApps') && attributes.key?(:'show_in_my_apps')

      self.show_in_my_apps = attributes[:'show_in_my_apps'] unless attributes[:'show_in_my_apps'].nil?

      self.is_alias_app = attributes[:'isAliasApp'] unless attributes[:'isAliasApp'].nil?

      raise 'You cannot provide both :isAliasApp and :is_alias_app' if attributes.key?(:'isAliasApp') && attributes.key?(:'is_alias_app')

      self.is_alias_app = attributes[:'is_alias_app'] unless attributes[:'is_alias_app'].nil?

      self.active = attributes[:'active'] unless attributes[:'active'].nil?

      self.login_mechanism = attributes[:'loginMechanism'] if attributes[:'loginMechanism']

      raise 'You cannot provide both :loginMechanism and :login_mechanism' if attributes.key?(:'loginMechanism') && attributes.key?(:'login_mechanism')

      self.login_mechanism = attributes[:'login_mechanism'] if attributes[:'login_mechanism']

      self.app_icon = attributes[:'appIcon'] if attributes[:'appIcon']

      raise 'You cannot provide both :appIcon and :app_icon' if attributes.key?(:'appIcon') && attributes.key?(:'app_icon')

      self.app_icon = attributes[:'app_icon'] if attributes[:'app_icon']

      self.app_thumbnail = attributes[:'appThumbnail'] if attributes[:'appThumbnail']

      raise 'You cannot provide both :appThumbnail and :app_thumbnail' if attributes.key?(:'appThumbnail') && attributes.key?(:'app_thumbnail')

      self.app_thumbnail = attributes[:'app_thumbnail'] if attributes[:'app_thumbnail']

      self.is_opc_service = attributes[:'isOPCService'] unless attributes[:'isOPCService'].nil?

      raise 'You cannot provide both :isOPCService and :is_opc_service' if attributes.key?(:'isOPCService') && attributes.key?(:'is_opc_service')

      self.is_opc_service = attributes[:'is_opc_service'] unless attributes[:'is_opc_service'].nil?

      self.service_type_urn = attributes[:'serviceTypeURN'] if attributes[:'serviceTypeURN']

      raise 'You cannot provide both :serviceTypeURN and :service_type_urn' if attributes.key?(:'serviceTypeURN') && attributes.key?(:'service_type_urn')

      self.service_type_urn = attributes[:'service_type_urn'] if attributes[:'service_type_urn']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        value == other.value &&
        ref == other.ref &&
        display == other.display &&
        description == other.description &&
        is_login_target == other.is_login_target &&
        show_in_my_apps == other.show_in_my_apps &&
        is_alias_app == other.is_alias_app &&
        active == other.active &&
        login_mechanism == other.login_mechanism &&
        app_icon == other.app_icon &&
        app_thumbnail == other.app_thumbnail &&
        is_opc_service == other.is_opc_service &&
        service_type_urn == other.service_type_urn
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
      [value, ref, display, description, is_login_target, show_in_my_apps, is_alias_app, active, login_mechanism, app_icon, app_thumbnail, is_opc_service, service_type_urn].hash
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
