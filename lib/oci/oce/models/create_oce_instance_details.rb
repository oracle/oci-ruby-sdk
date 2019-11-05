# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about new OceInstance.
  class Oce::Models::CreateOceInstanceDetails
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

    # **[Required]** Tenancy Name
    # @return [String]
    attr_accessor :tenancy_name

    # **[Required]** Object Storage Namespace of Tenancy
    # @return [String]
    attr_accessor :object_storage_namespace

    # **[Required]** Admin Email for Notification
    # @return [String]
    attr_accessor :admin_email

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
        'tenancy_name': :'tenancyName',
        'object_storage_namespace': :'objectStorageNamespace',
        'admin_email': :'adminEmail',
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
        'tenancy_name': :'String',
        'object_storage_namespace': :'String',
        'admin_email': :'String',
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
    # @option attributes [String] :tenancy_name The value to assign to the {#tenancy_name} property
    # @option attributes [String] :object_storage_namespace The value to assign to the {#object_storage_namespace} property
    # @option attributes [String] :admin_email The value to assign to the {#admin_email} property
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

      self.tenancy_name = attributes[:'tenancyName'] if attributes[:'tenancyName']

      raise 'You cannot provide both :tenancyName and :tenancy_name' if attributes.key?(:'tenancyName') && attributes.key?(:'tenancy_name')

      self.tenancy_name = attributes[:'tenancy_name'] if attributes[:'tenancy_name']

      self.object_storage_namespace = attributes[:'objectStorageNamespace'] if attributes[:'objectStorageNamespace']

      raise 'You cannot provide both :objectStorageNamespace and :object_storage_namespace' if attributes.key?(:'objectStorageNamespace') && attributes.key?(:'object_storage_namespace')

      self.object_storage_namespace = attributes[:'object_storage_namespace'] if attributes[:'object_storage_namespace']

      self.admin_email = attributes[:'adminEmail'] if attributes[:'adminEmail']

      raise 'You cannot provide both :adminEmail and :admin_email' if attributes.key?(:'adminEmail') && attributes.key?(:'admin_email')

      self.admin_email = attributes[:'admin_email'] if attributes[:'admin_email']

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
        description == other.description &&
        compartment_id == other.compartment_id &&
        name == other.name &&
        tenancy_id == other.tenancy_id &&
        idcs_access_token == other.idcs_access_token &&
        tenancy_name == other.tenancy_name &&
        object_storage_namespace == other.object_storage_namespace &&
        admin_email == other.admin_email &&
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
      [description, compartment_id, name, tenancy_id, idcs_access_token, tenancy_name, object_storage_namespace, admin_email, freeform_tags, defined_tags].hash
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
