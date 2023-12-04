# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220915
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # DB Configuration
  class Psql::Models::ConfigParams
    # **[Required]** Key is the configuration key.
    # @return [String]
    attr_accessor :config_key

    # **[Required]** Default value
    # @return [String]
    attr_accessor :default_config_value

    # User selected configuration value
    # @return [String]
    attr_accessor :overriden_config_value

    # **[Required]** Range or list of allowed values
    # @return [String]
    attr_accessor :allowed_values

    # **[Required]** If true, modfying this configuration value will requires restart.
    # @return [BOOLEAN]
    attr_accessor :is_restart_required

    # **[Required]** Describes about the Datatype value.
    # @return [String]
    attr_accessor :data_type

    # **[Required]** This flags tells whether the value is overridable or not.
    # @return [BOOLEAN]
    attr_accessor :is_overridable

    # **[Required]** Details about the Postgresql params.
    # @return [String]
    attr_accessor :description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config_key': :'configKey',
        'default_config_value': :'defaultConfigValue',
        'overriden_config_value': :'overridenConfigValue',
        'allowed_values': :'allowedValues',
        'is_restart_required': :'isRestartRequired',
        'data_type': :'dataType',
        'is_overridable': :'isOverridable',
        'description': :'description'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config_key': :'String',
        'default_config_value': :'String',
        'overriden_config_value': :'String',
        'allowed_values': :'String',
        'is_restart_required': :'BOOLEAN',
        'data_type': :'String',
        'is_overridable': :'BOOLEAN',
        'description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :config_key The value to assign to the {#config_key} property
    # @option attributes [String] :default_config_value The value to assign to the {#default_config_value} property
    # @option attributes [String] :overriden_config_value The value to assign to the {#overriden_config_value} property
    # @option attributes [String] :allowed_values The value to assign to the {#allowed_values} property
    # @option attributes [BOOLEAN] :is_restart_required The value to assign to the {#is_restart_required} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [BOOLEAN] :is_overridable The value to assign to the {#is_overridable} property
    # @option attributes [String] :description The value to assign to the {#description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.config_key = attributes[:'configKey'] if attributes[:'configKey']

      raise 'You cannot provide both :configKey and :config_key' if attributes.key?(:'configKey') && attributes.key?(:'config_key')

      self.config_key = attributes[:'config_key'] if attributes[:'config_key']

      self.default_config_value = attributes[:'defaultConfigValue'] if attributes[:'defaultConfigValue']

      raise 'You cannot provide both :defaultConfigValue and :default_config_value' if attributes.key?(:'defaultConfigValue') && attributes.key?(:'default_config_value')

      self.default_config_value = attributes[:'default_config_value'] if attributes[:'default_config_value']

      self.overriden_config_value = attributes[:'overridenConfigValue'] if attributes[:'overridenConfigValue']

      raise 'You cannot provide both :overridenConfigValue and :overriden_config_value' if attributes.key?(:'overridenConfigValue') && attributes.key?(:'overriden_config_value')

      self.overriden_config_value = attributes[:'overriden_config_value'] if attributes[:'overriden_config_value']

      self.allowed_values = attributes[:'allowedValues'] if attributes[:'allowedValues']

      raise 'You cannot provide both :allowedValues and :allowed_values' if attributes.key?(:'allowedValues') && attributes.key?(:'allowed_values')

      self.allowed_values = attributes[:'allowed_values'] if attributes[:'allowed_values']

      self.is_restart_required = attributes[:'isRestartRequired'] unless attributes[:'isRestartRequired'].nil?

      raise 'You cannot provide both :isRestartRequired and :is_restart_required' if attributes.key?(:'isRestartRequired') && attributes.key?(:'is_restart_required')

      self.is_restart_required = attributes[:'is_restart_required'] unless attributes[:'is_restart_required'].nil?

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.is_overridable = attributes[:'isOverridable'] unless attributes[:'isOverridable'].nil?
      self.is_overridable = false if is_overridable.nil? && !attributes.key?(:'isOverridable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isOverridable and :is_overridable' if attributes.key?(:'isOverridable') && attributes.key?(:'is_overridable')

      self.is_overridable = attributes[:'is_overridable'] unless attributes[:'is_overridable'].nil?
      self.is_overridable = false if is_overridable.nil? && !attributes.key?(:'isOverridable') && !attributes.key?(:'is_overridable') # rubocop:disable Style/StringLiterals

      self.description = attributes[:'description'] if attributes[:'description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config_key == other.config_key &&
        default_config_value == other.default_config_value &&
        overriden_config_value == other.overriden_config_value &&
        allowed_values == other.allowed_values &&
        is_restart_required == other.is_restart_required &&
        data_type == other.data_type &&
        is_overridable == other.is_overridable &&
        description == other.description
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
      [config_key, default_config_value, overriden_config_value, allowed_values, is_restart_required, data_type, is_overridable, description].hash
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
