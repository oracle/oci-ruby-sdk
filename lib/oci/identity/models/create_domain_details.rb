# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # (For tenancies that support identity domains) Details for creating an identity domain.
  class Identity::Models::CreateDomainDetails
    # **[Required]** The OCID of the compartment where the identity domain is created.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The mutable display name of the identity domain.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The identity domain description. You can have an empty description.
    # @return [String]
    attr_accessor :description

    # **[Required]** The region's name identifier. See [Regions and Availability Domains](https://docs.cloud.oracle.com/Content/General/Concepts/regions.htm)
    # for the full list of supported region names.
    #
    # Example: `us-phoenix-1`
    #
    # @return [String]
    attr_accessor :home_region

    # **[Required]** The license type of the identity domain.
    # @return [String]
    attr_accessor :license_type

    # Indicates whether the identity domain is hidden on the sign-in screen or not.
    #
    # @return [BOOLEAN]
    attr_accessor :is_hidden_on_login

    # The administrator's first name.
    # @return [String]
    attr_accessor :admin_first_name

    # The administrator's last name.
    # @return [String]
    attr_accessor :admin_last_name

    # The administrator's user name.
    # @return [String]
    attr_accessor :admin_user_name

    # The administrator's email address.
    # @return [String]
    attr_accessor :admin_email

    # Indicates whether or not the administrator user created in the IDCS stripe would like to receive notifications like a welcome email.
    # This field is required only if admin information is provided. This field is otherwise optional.
    #
    # @return [BOOLEAN]
    attr_accessor :is_notification_bypassed

    # Optional field to indicate whether users in the identity domain are required to have a primary email address or not. The default is true.
    #
    # @return [BOOLEAN]
    attr_accessor :is_primary_email_required

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'home_region': :'homeRegion',
        'license_type': :'licenseType',
        'is_hidden_on_login': :'isHiddenOnLogin',
        'admin_first_name': :'adminFirstName',
        'admin_last_name': :'adminLastName',
        'admin_user_name': :'adminUserName',
        'admin_email': :'adminEmail',
        'is_notification_bypassed': :'isNotificationBypassed',
        'is_primary_email_required': :'isPrimaryEmailRequired',
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
        'display_name': :'String',
        'description': :'String',
        'home_region': :'String',
        'license_type': :'String',
        'is_hidden_on_login': :'BOOLEAN',
        'admin_first_name': :'String',
        'admin_last_name': :'String',
        'admin_user_name': :'String',
        'admin_email': :'String',
        'is_notification_bypassed': :'BOOLEAN',
        'is_primary_email_required': :'BOOLEAN',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :home_region The value to assign to the {#home_region} property
    # @option attributes [String] :license_type The value to assign to the {#license_type} property
    # @option attributes [BOOLEAN] :is_hidden_on_login The value to assign to the {#is_hidden_on_login} property
    # @option attributes [String] :admin_first_name The value to assign to the {#admin_first_name} property
    # @option attributes [String] :admin_last_name The value to assign to the {#admin_last_name} property
    # @option attributes [String] :admin_user_name The value to assign to the {#admin_user_name} property
    # @option attributes [String] :admin_email The value to assign to the {#admin_email} property
    # @option attributes [BOOLEAN] :is_notification_bypassed The value to assign to the {#is_notification_bypassed} property
    # @option attributes [BOOLEAN] :is_primary_email_required The value to assign to the {#is_primary_email_required} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.home_region = attributes[:'homeRegion'] if attributes[:'homeRegion']

      raise 'You cannot provide both :homeRegion and :home_region' if attributes.key?(:'homeRegion') && attributes.key?(:'home_region')

      self.home_region = attributes[:'home_region'] if attributes[:'home_region']

      self.license_type = attributes[:'licenseType'] if attributes[:'licenseType']

      raise 'You cannot provide both :licenseType and :license_type' if attributes.key?(:'licenseType') && attributes.key?(:'license_type')

      self.license_type = attributes[:'license_type'] if attributes[:'license_type']

      self.is_hidden_on_login = attributes[:'isHiddenOnLogin'] unless attributes[:'isHiddenOnLogin'].nil?

      raise 'You cannot provide both :isHiddenOnLogin and :is_hidden_on_login' if attributes.key?(:'isHiddenOnLogin') && attributes.key?(:'is_hidden_on_login')

      self.is_hidden_on_login = attributes[:'is_hidden_on_login'] unless attributes[:'is_hidden_on_login'].nil?

      self.admin_first_name = attributes[:'adminFirstName'] if attributes[:'adminFirstName']

      raise 'You cannot provide both :adminFirstName and :admin_first_name' if attributes.key?(:'adminFirstName') && attributes.key?(:'admin_first_name')

      self.admin_first_name = attributes[:'admin_first_name'] if attributes[:'admin_first_name']

      self.admin_last_name = attributes[:'adminLastName'] if attributes[:'adminLastName']

      raise 'You cannot provide both :adminLastName and :admin_last_name' if attributes.key?(:'adminLastName') && attributes.key?(:'admin_last_name')

      self.admin_last_name = attributes[:'admin_last_name'] if attributes[:'admin_last_name']

      self.admin_user_name = attributes[:'adminUserName'] if attributes[:'adminUserName']

      raise 'You cannot provide both :adminUserName and :admin_user_name' if attributes.key?(:'adminUserName') && attributes.key?(:'admin_user_name')

      self.admin_user_name = attributes[:'admin_user_name'] if attributes[:'admin_user_name']

      self.admin_email = attributes[:'adminEmail'] if attributes[:'adminEmail']

      raise 'You cannot provide both :adminEmail and :admin_email' if attributes.key?(:'adminEmail') && attributes.key?(:'admin_email')

      self.admin_email = attributes[:'admin_email'] if attributes[:'admin_email']

      self.is_notification_bypassed = attributes[:'isNotificationBypassed'] unless attributes[:'isNotificationBypassed'].nil?

      raise 'You cannot provide both :isNotificationBypassed and :is_notification_bypassed' if attributes.key?(:'isNotificationBypassed') && attributes.key?(:'is_notification_bypassed')

      self.is_notification_bypassed = attributes[:'is_notification_bypassed'] unless attributes[:'is_notification_bypassed'].nil?

      self.is_primary_email_required = attributes[:'isPrimaryEmailRequired'] unless attributes[:'isPrimaryEmailRequired'].nil?

      raise 'You cannot provide both :isPrimaryEmailRequired and :is_primary_email_required' if attributes.key?(:'isPrimaryEmailRequired') && attributes.key?(:'is_primary_email_required')

      self.is_primary_email_required = attributes[:'is_primary_email_required'] unless attributes[:'is_primary_email_required'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        home_region == other.home_region &&
        license_type == other.license_type &&
        is_hidden_on_login == other.is_hidden_on_login &&
        admin_first_name == other.admin_first_name &&
        admin_last_name == other.admin_last_name &&
        admin_user_name == other.admin_user_name &&
        admin_email == other.admin_email &&
        is_notification_bypassed == other.is_notification_bypassed &&
        is_primary_email_required == other.is_primary_email_required &&
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
      [compartment_id, display_name, description, home_region, license_type, is_hidden_on_login, admin_first_name, admin_last_name, admin_user_name, admin_email, is_notification_bypassed, is_primary_email_required, freeform_tags, defined_tags].hash
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
