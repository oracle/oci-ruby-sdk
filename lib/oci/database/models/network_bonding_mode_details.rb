# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of bonding mode for Client and Backup and DR networks of an Exadata infrastructure.
  #
  class Database::Models::NetworkBondingModeDetails
    CLIENT_NETWORK_BONDING_MODE_ENUM = [
      CLIENT_NETWORK_BONDING_MODE_ACTIVE_BACKUP = 'ACTIVE_BACKUP'.freeze,
      CLIENT_NETWORK_BONDING_MODE_LACP = 'LACP'.freeze,
      CLIENT_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    BACKUP_NETWORK_BONDING_MODE_ENUM = [
      BACKUP_NETWORK_BONDING_MODE_ACTIVE_BACKUP = 'ACTIVE_BACKUP'.freeze,
      BACKUP_NETWORK_BONDING_MODE_LACP = 'LACP'.freeze,
      BACKUP_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DR_NETWORK_BONDING_MODE_ENUM = [
      DR_NETWORK_BONDING_MODE_ACTIVE_BACKUP = 'ACTIVE_BACKUP'.freeze,
      DR_NETWORK_BONDING_MODE_LACP = 'LACP'.freeze,
      DR_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The network bonding mode for the Exadata infrastructure.
    # @return [String]
    attr_reader :client_network_bonding_mode

    # The network bonding mode for the Exadata infrastructure.
    # @return [String]
    attr_reader :backup_network_bonding_mode

    # The network bonding mode for the Exadata infrastructure.
    # @return [String]
    attr_reader :dr_network_bonding_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'client_network_bonding_mode': :'clientNetworkBondingMode',
        'backup_network_bonding_mode': :'backupNetworkBondingMode',
        'dr_network_bonding_mode': :'drNetworkBondingMode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'client_network_bonding_mode': :'String',
        'backup_network_bonding_mode': :'String',
        'dr_network_bonding_mode': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :client_network_bonding_mode The value to assign to the {#client_network_bonding_mode} property
    # @option attributes [String] :backup_network_bonding_mode The value to assign to the {#backup_network_bonding_mode} property
    # @option attributes [String] :dr_network_bonding_mode The value to assign to the {#dr_network_bonding_mode} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.client_network_bonding_mode = attributes[:'clientNetworkBondingMode'] if attributes[:'clientNetworkBondingMode']
      self.client_network_bonding_mode = "" if client_network_bonding_mode.nil? && !attributes.key?(:'clientNetworkBondingMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :clientNetworkBondingMode and :client_network_bonding_mode' if attributes.key?(:'clientNetworkBondingMode') && attributes.key?(:'client_network_bonding_mode')

      self.client_network_bonding_mode = attributes[:'client_network_bonding_mode'] if attributes[:'client_network_bonding_mode']
      self.client_network_bonding_mode = "" if client_network_bonding_mode.nil? && !attributes.key?(:'clientNetworkBondingMode') && !attributes.key?(:'client_network_bonding_mode') # rubocop:disable Style/StringLiterals

      self.backup_network_bonding_mode = attributes[:'backupNetworkBondingMode'] if attributes[:'backupNetworkBondingMode']
      self.backup_network_bonding_mode = "" if backup_network_bonding_mode.nil? && !attributes.key?(:'backupNetworkBondingMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :backupNetworkBondingMode and :backup_network_bonding_mode' if attributes.key?(:'backupNetworkBondingMode') && attributes.key?(:'backup_network_bonding_mode')

      self.backup_network_bonding_mode = attributes[:'backup_network_bonding_mode'] if attributes[:'backup_network_bonding_mode']
      self.backup_network_bonding_mode = "" if backup_network_bonding_mode.nil? && !attributes.key?(:'backupNetworkBondingMode') && !attributes.key?(:'backup_network_bonding_mode') # rubocop:disable Style/StringLiterals

      self.dr_network_bonding_mode = attributes[:'drNetworkBondingMode'] if attributes[:'drNetworkBondingMode']
      self.dr_network_bonding_mode = "" if dr_network_bonding_mode.nil? && !attributes.key?(:'drNetworkBondingMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :drNetworkBondingMode and :dr_network_bonding_mode' if attributes.key?(:'drNetworkBondingMode') && attributes.key?(:'dr_network_bonding_mode')

      self.dr_network_bonding_mode = attributes[:'dr_network_bonding_mode'] if attributes[:'dr_network_bonding_mode']
      self.dr_network_bonding_mode = "" if dr_network_bonding_mode.nil? && !attributes.key?(:'drNetworkBondingMode') && !attributes.key?(:'dr_network_bonding_mode') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] client_network_bonding_mode Object to be assigned
    def client_network_bonding_mode=(client_network_bonding_mode)
      # rubocop:disable Style/ConditionalAssignment
      if client_network_bonding_mode && !CLIENT_NETWORK_BONDING_MODE_ENUM.include?(client_network_bonding_mode)
        OCI.logger.debug("Unknown value for 'client_network_bonding_mode' [" + client_network_bonding_mode + "]. Mapping to 'CLIENT_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @client_network_bonding_mode = CLIENT_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE
      else
        @client_network_bonding_mode = client_network_bonding_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] backup_network_bonding_mode Object to be assigned
    def backup_network_bonding_mode=(backup_network_bonding_mode)
      # rubocop:disable Style/ConditionalAssignment
      if backup_network_bonding_mode && !BACKUP_NETWORK_BONDING_MODE_ENUM.include?(backup_network_bonding_mode)
        OCI.logger.debug("Unknown value for 'backup_network_bonding_mode' [" + backup_network_bonding_mode + "]. Mapping to 'BACKUP_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @backup_network_bonding_mode = BACKUP_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE
      else
        @backup_network_bonding_mode = backup_network_bonding_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dr_network_bonding_mode Object to be assigned
    def dr_network_bonding_mode=(dr_network_bonding_mode)
      # rubocop:disable Style/ConditionalAssignment
      if dr_network_bonding_mode && !DR_NETWORK_BONDING_MODE_ENUM.include?(dr_network_bonding_mode)
        OCI.logger.debug("Unknown value for 'dr_network_bonding_mode' [" + dr_network_bonding_mode + "]. Mapping to 'DR_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @dr_network_bonding_mode = DR_NETWORK_BONDING_MODE_UNKNOWN_ENUM_VALUE
      else
        @dr_network_bonding_mode = dr_network_bonding_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        client_network_bonding_mode == other.client_network_bonding_mode &&
        backup_network_bonding_mode == other.backup_network_bonding_mode &&
        dr_network_bonding_mode == other.dr_network_bonding_mode
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
      [client_network_bonding_mode, backup_network_bonding_mode, dr_network_bonding_mode].hash
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
