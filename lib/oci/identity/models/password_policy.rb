# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Password policy, currently set for the given compartment.
  #
  class Identity::Models::PasswordPolicy
    # Minimum password length required.
    # @return [Integer]
    attr_accessor :minimum_password_length

    # At least one uppercase character required.
    # @return [BOOLEAN]
    attr_accessor :is_uppercase_characters_required

    # At least one lower case character required.
    # @return [BOOLEAN]
    attr_accessor :is_lowercase_characters_required

    # At least one numeric character required.
    # @return [BOOLEAN]
    attr_accessor :is_numeric_characters_required

    # At least one special character required.
    # @return [BOOLEAN]
    attr_accessor :is_special_characters_required

    # User name is allowed to be part of the password.
    # @return [BOOLEAN]
    attr_accessor :is_username_containment_allowed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'minimum_password_length': :'minimumPasswordLength',
        'is_uppercase_characters_required': :'isUppercaseCharactersRequired',
        'is_lowercase_characters_required': :'isLowercaseCharactersRequired',
        'is_numeric_characters_required': :'isNumericCharactersRequired',
        'is_special_characters_required': :'isSpecialCharactersRequired',
        'is_username_containment_allowed': :'isUsernameContainmentAllowed'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'minimum_password_length': :'Integer',
        'is_uppercase_characters_required': :'BOOLEAN',
        'is_lowercase_characters_required': :'BOOLEAN',
        'is_numeric_characters_required': :'BOOLEAN',
        'is_special_characters_required': :'BOOLEAN',
        'is_username_containment_allowed': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :minimum_password_length The value to assign to the {#minimum_password_length} property
    # @option attributes [BOOLEAN] :is_uppercase_characters_required The value to assign to the {#is_uppercase_characters_required} property
    # @option attributes [BOOLEAN] :is_lowercase_characters_required The value to assign to the {#is_lowercase_characters_required} property
    # @option attributes [BOOLEAN] :is_numeric_characters_required The value to assign to the {#is_numeric_characters_required} property
    # @option attributes [BOOLEAN] :is_special_characters_required The value to assign to the {#is_special_characters_required} property
    # @option attributes [BOOLEAN] :is_username_containment_allowed The value to assign to the {#is_username_containment_allowed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.minimum_password_length = attributes[:'minimumPasswordLength'] if attributes[:'minimumPasswordLength']

      raise 'You cannot provide both :minimumPasswordLength and :minimum_password_length' if attributes.key?(:'minimumPasswordLength') && attributes.key?(:'minimum_password_length')

      self.minimum_password_length = attributes[:'minimum_password_length'] if attributes[:'minimum_password_length']

      self.is_uppercase_characters_required = attributes[:'isUppercaseCharactersRequired'] unless attributes[:'isUppercaseCharactersRequired'].nil?
      self.is_uppercase_characters_required = true if is_uppercase_characters_required.nil? && !attributes.key?(:'isUppercaseCharactersRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUppercaseCharactersRequired and :is_uppercase_characters_required' if attributes.key?(:'isUppercaseCharactersRequired') && attributes.key?(:'is_uppercase_characters_required')

      self.is_uppercase_characters_required = attributes[:'is_uppercase_characters_required'] unless attributes[:'is_uppercase_characters_required'].nil?
      self.is_uppercase_characters_required = true if is_uppercase_characters_required.nil? && !attributes.key?(:'isUppercaseCharactersRequired') && !attributes.key?(:'is_uppercase_characters_required') # rubocop:disable Style/StringLiterals

      self.is_lowercase_characters_required = attributes[:'isLowercaseCharactersRequired'] unless attributes[:'isLowercaseCharactersRequired'].nil?
      self.is_lowercase_characters_required = true if is_lowercase_characters_required.nil? && !attributes.key?(:'isLowercaseCharactersRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isLowercaseCharactersRequired and :is_lowercase_characters_required' if attributes.key?(:'isLowercaseCharactersRequired') && attributes.key?(:'is_lowercase_characters_required')

      self.is_lowercase_characters_required = attributes[:'is_lowercase_characters_required'] unless attributes[:'is_lowercase_characters_required'].nil?
      self.is_lowercase_characters_required = true if is_lowercase_characters_required.nil? && !attributes.key?(:'isLowercaseCharactersRequired') && !attributes.key?(:'is_lowercase_characters_required') # rubocop:disable Style/StringLiterals

      self.is_numeric_characters_required = attributes[:'isNumericCharactersRequired'] unless attributes[:'isNumericCharactersRequired'].nil?
      self.is_numeric_characters_required = true if is_numeric_characters_required.nil? && !attributes.key?(:'isNumericCharactersRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isNumericCharactersRequired and :is_numeric_characters_required' if attributes.key?(:'isNumericCharactersRequired') && attributes.key?(:'is_numeric_characters_required')

      self.is_numeric_characters_required = attributes[:'is_numeric_characters_required'] unless attributes[:'is_numeric_characters_required'].nil?
      self.is_numeric_characters_required = true if is_numeric_characters_required.nil? && !attributes.key?(:'isNumericCharactersRequired') && !attributes.key?(:'is_numeric_characters_required') # rubocop:disable Style/StringLiterals

      self.is_special_characters_required = attributes[:'isSpecialCharactersRequired'] unless attributes[:'isSpecialCharactersRequired'].nil?
      self.is_special_characters_required = true if is_special_characters_required.nil? && !attributes.key?(:'isSpecialCharactersRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSpecialCharactersRequired and :is_special_characters_required' if attributes.key?(:'isSpecialCharactersRequired') && attributes.key?(:'is_special_characters_required')

      self.is_special_characters_required = attributes[:'is_special_characters_required'] unless attributes[:'is_special_characters_required'].nil?
      self.is_special_characters_required = true if is_special_characters_required.nil? && !attributes.key?(:'isSpecialCharactersRequired') && !attributes.key?(:'is_special_characters_required') # rubocop:disable Style/StringLiterals

      self.is_username_containment_allowed = attributes[:'isUsernameContainmentAllowed'] unless attributes[:'isUsernameContainmentAllowed'].nil?
      self.is_username_containment_allowed = false if is_username_containment_allowed.nil? && !attributes.key?(:'isUsernameContainmentAllowed') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUsernameContainmentAllowed and :is_username_containment_allowed' if attributes.key?(:'isUsernameContainmentAllowed') && attributes.key?(:'is_username_containment_allowed')

      self.is_username_containment_allowed = attributes[:'is_username_containment_allowed'] unless attributes[:'is_username_containment_allowed'].nil?
      self.is_username_containment_allowed = false if is_username_containment_allowed.nil? && !attributes.key?(:'isUsernameContainmentAllowed') && !attributes.key?(:'is_username_containment_allowed') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        minimum_password_length == other.minimum_password_length &&
        is_uppercase_characters_required == other.is_uppercase_characters_required &&
        is_lowercase_characters_required == other.is_lowercase_characters_required &&
        is_numeric_characters_required == other.is_numeric_characters_required &&
        is_special_characters_required == other.is_special_characters_required &&
        is_username_containment_allowed == other.is_username_containment_allowed
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
      [minimum_password_length, is_uppercase_characters_required, is_lowercase_characters_required, is_numeric_characters_required, is_special_characters_required, is_username_containment_allowed].hash
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
