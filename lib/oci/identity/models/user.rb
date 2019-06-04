# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An individual employee or system that needs to manage or use your company's Oracle Cloud Infrastructure
  # resources. Users might need to launch instances, manage remote disks, work with your cloud network, etc. Users
  # have one or more IAM Service credentials ({ApiKey},
  # {UIPassword}, {SwiftPassword} and
  # {AuthToken}).
  # For more information, see [User Credentials](https://docs.cloud.oracle.com/Content/API/Concepts/usercredentials.htm)). End users of your
  # application are not typically IAM Service users. For conceptual information about users and other IAM Service
  # components, see [Overview of the IAM Service](https://docs.cloud.oracle.com/Content/Identity/Concepts/overview.htm).
  #
  # These users are created directly within the Oracle Cloud Infrastructure system, via the IAM service.
  # They are different from *federated users*, who authenticate themselves to the Oracle Cloud Infrastructure
  # Console via an identity provider. For more information, see
  # [Identity Providers and Federation](https://docs.cloud.oracle.com/Content/Identity/Concepts/federation.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Identity::Models::User
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the user.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the tenancy containing the user.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The name you assign to the user during creation. This is the user's login for the Console.
    # The name must be unique across all users in the tenancy and cannot be changed.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The description you assign to the user. Does not have to be unique, and it's changeable.
    # @return [String]
    attr_accessor :description

    # The email address you assign to the user.
    # The email address must be unique across all users in the tenancy.
    #
    # @return [String]
    attr_accessor :email

    # The OCID of the `IdentityProvider` this user belongs to.
    # @return [String]
    attr_accessor :identity_provider_id

    # Identifier of the user in the identity provider
    # @return [String]
    attr_accessor :external_identifier

    # **[Required]** Date and time the user was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The user's current state. After creating a user, make sure its `lifecycleState` changes from CREATING to
    # ACTIVE before using it.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Returned only if the user's `lifecycleState` is INACTIVE. A 16-bit value showing the reason why the user
    # is inactive:
    #
    # - bit 0: SUSPENDED (reserved for future use)
    # - bit 1: DISABLED (reserved for future use)
    # - bit 2: BLOCKED (the user has exceeded the maximum number of failed login attempts for the Console)
    #
    # @return [Integer]
    attr_accessor :inactive_status

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

    # Properties indicating how the user is allowed to authenticate.
    # @return [OCI::Identity::Models::UserCapabilities]
    attr_accessor :capabilities

    # **[Required]** Flag indicates if MFA has been activated for the user.
    # @return [BOOLEAN]
    attr_accessor :is_mfa_activated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'description': :'description',
        'email': :'email',
        'identity_provider_id': :'identityProviderId',
        'external_identifier': :'externalIdentifier',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'inactive_status': :'inactiveStatus',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'capabilities': :'capabilities',
        'is_mfa_activated': :'isMfaActivated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'name': :'String',
        'description': :'String',
        'email': :'String',
        'identity_provider_id': :'String',
        'external_identifier': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'inactive_status': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'capabilities': :'OCI::Identity::Models::UserCapabilities',
        'is_mfa_activated': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :email The value to assign to the {#email} property
    # @option attributes [String] :identity_provider_id The value to assign to the {#identity_provider_id} property
    # @option attributes [String] :external_identifier The value to assign to the {#external_identifier} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Integer] :inactive_status The value to assign to the {#inactive_status} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Identity::Models::UserCapabilities] :capabilities The value to assign to the {#capabilities} property
    # @option attributes [BOOLEAN] :is_mfa_activated The value to assign to the {#is_mfa_activated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.email = attributes[:'email'] if attributes[:'email']

      self.identity_provider_id = attributes[:'identityProviderId'] if attributes[:'identityProviderId']

      raise 'You cannot provide both :identityProviderId and :identity_provider_id' if attributes.key?(:'identityProviderId') && attributes.key?(:'identity_provider_id')

      self.identity_provider_id = attributes[:'identity_provider_id'] if attributes[:'identity_provider_id']

      self.external_identifier = attributes[:'externalIdentifier'] if attributes[:'externalIdentifier']

      raise 'You cannot provide both :externalIdentifier and :external_identifier' if attributes.key?(:'externalIdentifier') && attributes.key?(:'external_identifier')

      self.external_identifier = attributes[:'external_identifier'] if attributes[:'external_identifier']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.inactive_status = attributes[:'inactiveStatus'] if attributes[:'inactiveStatus']

      raise 'You cannot provide both :inactiveStatus and :inactive_status' if attributes.key?(:'inactiveStatus') && attributes.key?(:'inactive_status')

      self.inactive_status = attributes[:'inactive_status'] if attributes[:'inactive_status']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.capabilities = attributes[:'capabilities'] if attributes[:'capabilities']

      self.is_mfa_activated = attributes[:'isMfaActivated'] unless attributes[:'isMfaActivated'].nil?

      raise 'You cannot provide both :isMfaActivated and :is_mfa_activated' if attributes.key?(:'isMfaActivated') && attributes.key?(:'is_mfa_activated')

      self.is_mfa_activated = attributes[:'is_mfa_activated'] unless attributes[:'is_mfa_activated'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        name == other.name &&
        description == other.description &&
        email == other.email &&
        identity_provider_id == other.identity_provider_id &&
        external_identifier == other.external_identifier &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        inactive_status == other.inactive_status &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        capabilities == other.capabilities &&
        is_mfa_activated == other.is_mfa_activated
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
      [id, compartment_id, name, description, email, identity_provider_id, external_identifier, time_created, lifecycle_state, inactive_status, freeform_tags, defined_tags, capabilities, is_mfa_activated].hash
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
