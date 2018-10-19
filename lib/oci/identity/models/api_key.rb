# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A PEM-format RSA credential for securing requests to the Oracle Cloud Infrastructure REST API. Also known
  # as an *API signing key*. Specifically, this is the public key from the key pair. The private key remains with
  # the user calling the API. For information about generating a key pair
  # in the required PEM format, see [Required Keys and OCIDs](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/apisigningkey.htm).
  #
  # **Important:** This is **not** the SSH key for accessing compute instances.
  #
  # Each user can have a maximum of three API signing keys.
  #
  # For more information about user credentials, see [User Credentials](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/usercredentials.htm).
  #
  class Identity::Models::ApiKey # rubocop:disable Metrics/LineLength
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # An Oracle-assigned identifier for the key, in this format:
    # TENANCY_OCID/USER_OCID/KEY_FINGERPRINT.
    #
    # @return [String]
    attr_accessor :key_id

    # The key's value.
    # @return [String]
    attr_accessor :key_value

    # The key's fingerprint (e.g., 12:34:56:78:90:ab:cd:ef:12:34:56:78:90:ab:cd:ef).
    # @return [String]
    attr_accessor :fingerprint

    # The OCID of the user the key belongs to.
    # @return [String]
    attr_accessor :user_id

    # Date and time the `ApiKey` object was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The API key's current state. After creating an `ApiKey` object, make sure its `lifecycleState` changes from
    # CREATING to ACTIVE before using it.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # The detailed status of INACTIVE lifecycleState.
    # @return [Integer]
    attr_accessor :inactive_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key_id': :'keyId',
        'key_value': :'keyValue',
        'fingerprint': :'fingerprint',
        'user_id': :'userId',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'inactive_status': :'inactiveStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key_id': :'String',
        'key_value': :'String',
        'fingerprint': :'String',
        'user_id': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'inactive_status': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [String] :key_value The value to assign to the {#key_value} property
    # @option attributes [String] :fingerprint The value to assign to the {#fingerprint} property
    # @option attributes [String] :user_id The value to assign to the {#user_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Integer] :inactive_status The value to assign to the {#inactive_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.key_value = attributes[:'keyValue'] if attributes[:'keyValue']

      raise 'You cannot provide both :keyValue and :key_value' if attributes.key?(:'keyValue') && attributes.key?(:'key_value')

      self.key_value = attributes[:'key_value'] if attributes[:'key_value']

      self.fingerprint = attributes[:'fingerprint'] if attributes[:'fingerprint']

      self.user_id = attributes[:'userId'] if attributes[:'userId']

      raise 'You cannot provide both :userId and :user_id' if attributes.key?(:'userId') && attributes.key?(:'user_id')

      self.user_id = attributes[:'user_id'] if attributes[:'user_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.inactive_status = attributes[:'inactiveStatus'] if attributes[:'inactiveStatus']

      raise 'You cannot provide both :inactiveStatus and :inactive_status' if attributes.key?(:'inactiveStatus') && attributes.key?(:'inactive_status')

      self.inactive_status = attributes[:'inactive_status'] if attributes[:'inactive_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
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
        key_id == other.key_id &&
        key_value == other.key_value &&
        fingerprint == other.fingerprint &&
        user_id == other.user_id &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        inactive_status == other.inactive_status
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [key_id, key_value, fingerprint, user_id, time_created, lifecycle_state, inactive_status].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
