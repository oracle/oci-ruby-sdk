# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A content access rule. An access rule specifies an action to take if a set of criteria is matched by a request.
  class Waas::Models::AccessRule # rubocop:disable Metrics/LineLength
    ACTION_ENUM = [
      ACTION_ALLOW = 'ALLOW'.freeze,
      ACTION_DETECT = 'DETECT'.freeze,
      ACTION_BLOCK = 'BLOCK'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    BLOCK_ACTION_ENUM = [
      BLOCK_ACTION_SET_RESPONSE_CODE = 'SET_RESPONSE_CODE'.freeze,
      BLOCK_ACTION_SHOW_ERROR_PAGE = 'SHOW_ERROR_PAGE'.freeze,
      BLOCK_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique name of the access rule.
    # @return [String]
    attr_accessor :name

    # **[Required]** The list of access rule criteria.
    # @return [Array<OCI::Waas::Models::AccessRuleCriteria>]
    attr_accessor :criteria

    # **[Required]** The action to take when the access criteria are met for a rule. If unspecified, defaults to `ALLOW`.
    # @return [String]
    attr_reader :action

    # The method used to block requests if `action` is set to `BLOCK` and the access criteria are met. If unspecified, defaults to `SET_RESPONSE_CODE`.
    # @return [String]
    attr_reader :block_action

    # The response status code to return when `action` is set to `BLOCK`, `blockAction` is set to `SET_RESPONSE_CODE`, and the access criteria are met. If unspecified, defaults to `403`.
    # @return [Integer]
    attr_accessor :block_response_code

    # The message to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the access criteria are met. If unspecified, defaults to 'Access to the website is blocked.'
    # @return [String]
    attr_accessor :block_error_page_message

    # The error code to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the access criteria are met. If unspecified, defaults to 'Access rules'.
    # @return [String]
    attr_accessor :block_error_page_code

    # The description text to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the access criteria are met. If unspecified, defaults to 'Access blocked by website owner. Please contact support.'
    # @return [String]
    attr_accessor :block_error_page_description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'criteria': :'criteria',
        'action': :'action',
        'block_action': :'blockAction',
        'block_response_code': :'blockResponseCode',
        'block_error_page_message': :'blockErrorPageMessage',
        'block_error_page_code': :'blockErrorPageCode',
        'block_error_page_description': :'blockErrorPageDescription'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'criteria': :'Array<OCI::Waas::Models::AccessRuleCriteria>',
        'action': :'String',
        'block_action': :'String',
        'block_response_code': :'Integer',
        'block_error_page_message': :'String',
        'block_error_page_code': :'String',
        'block_error_page_description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Array<OCI::Waas::Models::AccessRuleCriteria>] :criteria The value to assign to the {#criteria} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :block_action The value to assign to the {#block_action} property
    # @option attributes [Integer] :block_response_code The value to assign to the {#block_response_code} property
    # @option attributes [String] :block_error_page_message The value to assign to the {#block_error_page_message} property
    # @option attributes [String] :block_error_page_code The value to assign to the {#block_error_page_code} property
    # @option attributes [String] :block_error_page_description The value to assign to the {#block_error_page_description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.criteria = attributes[:'criteria'] if attributes[:'criteria']

      self.action = attributes[:'action'] if attributes[:'action']

      self.block_action = attributes[:'blockAction'] if attributes[:'blockAction']

      raise 'You cannot provide both :blockAction and :block_action' if attributes.key?(:'blockAction') && attributes.key?(:'block_action')

      self.block_action = attributes[:'block_action'] if attributes[:'block_action']

      self.block_response_code = attributes[:'blockResponseCode'] if attributes[:'blockResponseCode']

      raise 'You cannot provide both :blockResponseCode and :block_response_code' if attributes.key?(:'blockResponseCode') && attributes.key?(:'block_response_code')

      self.block_response_code = attributes[:'block_response_code'] if attributes[:'block_response_code']

      self.block_error_page_message = attributes[:'blockErrorPageMessage'] if attributes[:'blockErrorPageMessage']

      raise 'You cannot provide both :blockErrorPageMessage and :block_error_page_message' if attributes.key?(:'blockErrorPageMessage') && attributes.key?(:'block_error_page_message')

      self.block_error_page_message = attributes[:'block_error_page_message'] if attributes[:'block_error_page_message']

      self.block_error_page_code = attributes[:'blockErrorPageCode'] if attributes[:'blockErrorPageCode']

      raise 'You cannot provide both :blockErrorPageCode and :block_error_page_code' if attributes.key?(:'blockErrorPageCode') && attributes.key?(:'block_error_page_code')

      self.block_error_page_code = attributes[:'block_error_page_code'] if attributes[:'block_error_page_code']

      self.block_error_page_description = attributes[:'blockErrorPageDescription'] if attributes[:'blockErrorPageDescription']

      raise 'You cannot provide both :blockErrorPageDescription and :block_error_page_description' if attributes.key?(:'blockErrorPageDescription') && attributes.key?(:'block_error_page_description')

      self.block_error_page_description = attributes[:'block_error_page_description'] if attributes[:'block_error_page_description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] block_action Object to be assigned
    def block_action=(block_action)
      # rubocop:disable Style/ConditionalAssignment
      if block_action && !BLOCK_ACTION_ENUM.include?(block_action)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'block_action' [" + block_action + "]. Mapping to 'BLOCK_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @block_action = BLOCK_ACTION_UNKNOWN_ENUM_VALUE
      else
        @block_action = block_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        criteria == other.criteria &&
        action == other.action &&
        block_action == other.block_action &&
        block_response_code == other.block_response_code &&
        block_error_page_message == other.block_error_page_message &&
        block_error_page_code == other.block_error_page_code &&
        block_error_page_description == other.block_error_page_description
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [name, criteria, action, block_action, block_response_code, block_error_page_message, block_error_page_code, block_error_page_description].hash
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
