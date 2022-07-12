# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about new OceInstance.
  class Oce::Models::CreateOceInstanceDetails
    INSTANCE_USAGE_TYPE_ENUM = [
      INSTANCE_USAGE_TYPE_PRIMARY = 'PRIMARY'.freeze,
      INSTANCE_USAGE_TYPE_NONPRIMARY = 'NONPRIMARY'.freeze
    ].freeze

    INSTANCE_ACCESS_TYPE_ENUM = [
      INSTANCE_ACCESS_TYPE_PUBLIC = 'PUBLIC'.freeze,
      INSTANCE_ACCESS_TYPE_PRIVATE = 'PRIVATE'.freeze
    ].freeze

    INSTANCE_LICENSE_TYPE_ENUM = [
      INSTANCE_LICENSE_TYPE_NEW = 'NEW'.freeze,
      INSTANCE_LICENSE_TYPE_BYOL = 'BYOL'.freeze,
      INSTANCE_LICENSE_TYPE_PREMIUM = 'PREMIUM'.freeze,
      INSTANCE_LICENSE_TYPE_STARTER = 'STARTER'.freeze
    ].freeze

    # OceInstance description
    # @return [String]
    attr_accessor :description

    # **[Required]** Compartment Identifier
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** OceInstance Name
    # @return [String]
    attr_accessor :name

    # **[Required]** Tenancy Identifier
    # @return [String]
    attr_accessor :tenancy_id

    # **[Required]** Identity Cloud Service access token identifying a stripe and service administrator user
    # @return [String]
    attr_accessor :idcs_access_token

    # @return [OCI::Oce::Models::IdentityStripeDetails]
    attr_accessor :identity_stripe

    # **[Required]** Tenancy Name
    # @return [String]
    attr_accessor :tenancy_name

    # Instance type based on its usage
    # @return [String]
    attr_reader :instance_usage_type

    # a list of add-on features for the ocm instance
    # @return [Array<String>]
    attr_accessor :add_on_features

    # **[Required]** Object Storage Namespace of Tenancy
    # @return [String]
    attr_accessor :object_storage_namespace

    # **[Required]** Admin Email for Notification
    # @return [String]
    attr_accessor :admin_email

    # Upgrade schedule type representing service to be upgraded immediately whenever latest version is released
    # or delay upgrade of the service to previous released version
    #
    # @return [String]
    attr_accessor :upgrade_schedule

    # Web Application Firewall(WAF) primary domain
    # @return [String]
    attr_accessor :waf_primary_domain

    # Flag indicating whether the instance access is private or public
    # @return [String]
    attr_reader :instance_access_type

    # Flag indicating whether the instance license is new cloud or bring your own license
    # @return [String]
    attr_reader :instance_license_type

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'tenancy_id': :'tenancyId',
        'idcs_access_token': :'idcsAccessToken',
        'identity_stripe': :'identityStripe',
        'tenancy_name': :'tenancyName',
        'instance_usage_type': :'instanceUsageType',
        'add_on_features': :'addOnFeatures',
        'object_storage_namespace': :'objectStorageNamespace',
        'admin_email': :'adminEmail',
        'upgrade_schedule': :'upgradeSchedule',
        'waf_primary_domain': :'wafPrimaryDomain',
        'instance_access_type': :'instanceAccessType',
        'instance_license_type': :'instanceLicenseType',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'compartment_id': :'String',
        'name': :'String',
        'tenancy_id': :'String',
        'idcs_access_token': :'String',
        'identity_stripe': :'OCI::Oce::Models::IdentityStripeDetails',
        'tenancy_name': :'String',
        'instance_usage_type': :'String',
        'add_on_features': :'Array<String>',
        'object_storage_namespace': :'String',
        'admin_email': :'String',
        'upgrade_schedule': :'String',
        'waf_primary_domain': :'String',
        'instance_access_type': :'String',
        'instance_license_type': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :tenancy_id The value to assign to the {#tenancy_id} property
    # @option attributes [String] :idcs_access_token The value to assign to the {#idcs_access_token} property
    # @option attributes [OCI::Oce::Models::IdentityStripeDetails] :identity_stripe The value to assign to the {#identity_stripe} property
    # @option attributes [String] :tenancy_name The value to assign to the {#tenancy_name} property
    # @option attributes [String] :instance_usage_type The value to assign to the {#instance_usage_type} property
    # @option attributes [Array<String>] :add_on_features The value to assign to the {#add_on_features} property
    # @option attributes [String] :object_storage_namespace The value to assign to the {#object_storage_namespace} property
    # @option attributes [String] :admin_email The value to assign to the {#admin_email} property
    # @option attributes [String] :upgrade_schedule The value to assign to the {#upgrade_schedule} property
    # @option attributes [String] :waf_primary_domain The value to assign to the {#waf_primary_domain} property
    # @option attributes [String] :instance_access_type The value to assign to the {#instance_access_type} property
    # @option attributes [String] :instance_license_type The value to assign to the {#instance_license_type} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.tenancy_id = attributes[:'tenancyId'] if attributes[:'tenancyId']

      raise 'You cannot provide both :tenancyId and :tenancy_id' if attributes.key?(:'tenancyId') && attributes.key?(:'tenancy_id')

      self.tenancy_id = attributes[:'tenancy_id'] if attributes[:'tenancy_id']

      self.idcs_access_token = attributes[:'idcsAccessToken'] if attributes[:'idcsAccessToken']

      raise 'You cannot provide both :idcsAccessToken and :idcs_access_token' if attributes.key?(:'idcsAccessToken') && attributes.key?(:'idcs_access_token')

      self.idcs_access_token = attributes[:'idcs_access_token'] if attributes[:'idcs_access_token']

      self.identity_stripe = attributes[:'identityStripe'] if attributes[:'identityStripe']

      raise 'You cannot provide both :identityStripe and :identity_stripe' if attributes.key?(:'identityStripe') && attributes.key?(:'identity_stripe')

      self.identity_stripe = attributes[:'identity_stripe'] if attributes[:'identity_stripe']

      self.tenancy_name = attributes[:'tenancyName'] if attributes[:'tenancyName']

      raise 'You cannot provide both :tenancyName and :tenancy_name' if attributes.key?(:'tenancyName') && attributes.key?(:'tenancy_name')

      self.tenancy_name = attributes[:'tenancy_name'] if attributes[:'tenancy_name']

      self.instance_usage_type = attributes[:'instanceUsageType'] if attributes[:'instanceUsageType']

      raise 'You cannot provide both :instanceUsageType and :instance_usage_type' if attributes.key?(:'instanceUsageType') && attributes.key?(:'instance_usage_type')

      self.instance_usage_type = attributes[:'instance_usage_type'] if attributes[:'instance_usage_type']

      self.add_on_features = attributes[:'addOnFeatures'] if attributes[:'addOnFeatures']

      raise 'You cannot provide both :addOnFeatures and :add_on_features' if attributes.key?(:'addOnFeatures') && attributes.key?(:'add_on_features')

      self.add_on_features = attributes[:'add_on_features'] if attributes[:'add_on_features']

      self.object_storage_namespace = attributes[:'objectStorageNamespace'] if attributes[:'objectStorageNamespace']

      raise 'You cannot provide both :objectStorageNamespace and :object_storage_namespace' if attributes.key?(:'objectStorageNamespace') && attributes.key?(:'object_storage_namespace')

      self.object_storage_namespace = attributes[:'object_storage_namespace'] if attributes[:'object_storage_namespace']

      self.admin_email = attributes[:'adminEmail'] if attributes[:'adminEmail']

      raise 'You cannot provide both :adminEmail and :admin_email' if attributes.key?(:'adminEmail') && attributes.key?(:'admin_email')

      self.admin_email = attributes[:'admin_email'] if attributes[:'admin_email']

      self.upgrade_schedule = attributes[:'upgradeSchedule'] if attributes[:'upgradeSchedule']

      raise 'You cannot provide both :upgradeSchedule and :upgrade_schedule' if attributes.key?(:'upgradeSchedule') && attributes.key?(:'upgrade_schedule')

      self.upgrade_schedule = attributes[:'upgrade_schedule'] if attributes[:'upgrade_schedule']

      self.waf_primary_domain = attributes[:'wafPrimaryDomain'] if attributes[:'wafPrimaryDomain']

      raise 'You cannot provide both :wafPrimaryDomain and :waf_primary_domain' if attributes.key?(:'wafPrimaryDomain') && attributes.key?(:'waf_primary_domain')

      self.waf_primary_domain = attributes[:'waf_primary_domain'] if attributes[:'waf_primary_domain']

      self.instance_access_type = attributes[:'instanceAccessType'] if attributes[:'instanceAccessType']

      raise 'You cannot provide both :instanceAccessType and :instance_access_type' if attributes.key?(:'instanceAccessType') && attributes.key?(:'instance_access_type')

      self.instance_access_type = attributes[:'instance_access_type'] if attributes[:'instance_access_type']

      self.instance_license_type = attributes[:'instanceLicenseType'] if attributes[:'instanceLicenseType']

      raise 'You cannot provide both :instanceLicenseType and :instance_license_type' if attributes.key?(:'instanceLicenseType') && attributes.key?(:'instance_license_type')

      self.instance_license_type = attributes[:'instance_license_type'] if attributes[:'instance_license_type']

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
    # @param [Object] instance_usage_type Object to be assigned
    def instance_usage_type=(instance_usage_type)
      raise "Invalid value for 'instance_usage_type': this must be one of the values in INSTANCE_USAGE_TYPE_ENUM." if instance_usage_type && !INSTANCE_USAGE_TYPE_ENUM.include?(instance_usage_type)

      @instance_usage_type = instance_usage_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] instance_access_type Object to be assigned
    def instance_access_type=(instance_access_type)
      raise "Invalid value for 'instance_access_type': this must be one of the values in INSTANCE_ACCESS_TYPE_ENUM." if instance_access_type && !INSTANCE_ACCESS_TYPE_ENUM.include?(instance_access_type)

      @instance_access_type = instance_access_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] instance_license_type Object to be assigned
    def instance_license_type=(instance_license_type)
      raise "Invalid value for 'instance_license_type': this must be one of the values in INSTANCE_LICENSE_TYPE_ENUM." if instance_license_type && !INSTANCE_LICENSE_TYPE_ENUM.include?(instance_license_type)

      @instance_license_type = instance_license_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        name == other.name &&
        tenancy_id == other.tenancy_id &&
        idcs_access_token == other.idcs_access_token &&
        identity_stripe == other.identity_stripe &&
        tenancy_name == other.tenancy_name &&
        instance_usage_type == other.instance_usage_type &&
        add_on_features == other.add_on_features &&
        object_storage_namespace == other.object_storage_namespace &&
        admin_email == other.admin_email &&
        upgrade_schedule == other.upgrade_schedule &&
        waf_primary_domain == other.waf_primary_domain &&
        instance_access_type == other.instance_access_type &&
        instance_license_type == other.instance_license_type &&
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
      [description, compartment_id, name, tenancy_id, idcs_access_token, identity_stripe, tenancy_name, instance_usage_type, add_on_features, object_storage_namespace, admin_email, upgrade_schedule, waf_primary_domain, instance_access_type, instance_license_type, freeform_tags, defined_tags].hash
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
