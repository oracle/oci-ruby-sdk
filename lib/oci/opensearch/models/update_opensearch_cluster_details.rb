# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20180828
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration to update on an existing OpenSearch cluster. Software version
  # and security config are not allowed to be updated at the same time.
  #
  class Opensearch::Models::UpdateOpensearchClusterDetails
    SECURITY_MODE_ENUM = [
      SECURITY_MODE_DISABLED = 'DISABLED'.freeze,
      SECURITY_MODE_PERMISSIVE = 'PERMISSIVE'.freeze,
      SECURITY_MODE_ENFORCING = 'ENFORCING'.freeze
    ].freeze

    # **[Required]** The name of the cluster. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # @return [String]
    attr_accessor :software_version

    # The security mode of the cluster.
    # @return [String]
    attr_reader :security_mode

    # The name of the master user that are used to manage security config
    # @return [String]
    attr_accessor :security_master_user_name

    # The password hash of the master user that are used to manage security config
    # @return [String]
    attr_accessor :security_master_user_password_hash

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'software_version': :'softwareVersion',
        'security_mode': :'securityMode',
        'security_master_user_name': :'securityMasterUserName',
        'security_master_user_password_hash': :'securityMasterUserPasswordHash',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'software_version': :'String',
        'security_mode': :'String',
        'security_master_user_name': :'String',
        'security_master_user_password_hash': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :software_version The value to assign to the {#software_version} property
    # @option attributes [String] :security_mode The value to assign to the {#security_mode} property
    # @option attributes [String] :security_master_user_name The value to assign to the {#security_master_user_name} property
    # @option attributes [String] :security_master_user_password_hash The value to assign to the {#security_master_user_password_hash} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.software_version = attributes[:'softwareVersion'] if attributes[:'softwareVersion']

      raise 'You cannot provide both :softwareVersion and :software_version' if attributes.key?(:'softwareVersion') && attributes.key?(:'software_version')

      self.software_version = attributes[:'software_version'] if attributes[:'software_version']

      self.security_mode = attributes[:'securityMode'] if attributes[:'securityMode']

      raise 'You cannot provide both :securityMode and :security_mode' if attributes.key?(:'securityMode') && attributes.key?(:'security_mode')

      self.security_mode = attributes[:'security_mode'] if attributes[:'security_mode']

      self.security_master_user_name = attributes[:'securityMasterUserName'] if attributes[:'securityMasterUserName']

      raise 'You cannot provide both :securityMasterUserName and :security_master_user_name' if attributes.key?(:'securityMasterUserName') && attributes.key?(:'security_master_user_name')

      self.security_master_user_name = attributes[:'security_master_user_name'] if attributes[:'security_master_user_name']

      self.security_master_user_password_hash = attributes[:'securityMasterUserPasswordHash'] if attributes[:'securityMasterUserPasswordHash']

      raise 'You cannot provide both :securityMasterUserPasswordHash and :security_master_user_password_hash' if attributes.key?(:'securityMasterUserPasswordHash') && attributes.key?(:'security_master_user_password_hash')

      self.security_master_user_password_hash = attributes[:'security_master_user_password_hash'] if attributes[:'security_master_user_password_hash']

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
    # @param [Object] security_mode Object to be assigned
    def security_mode=(security_mode)
      raise "Invalid value for 'security_mode': this must be one of the values in SECURITY_MODE_ENUM." if security_mode && !SECURITY_MODE_ENUM.include?(security_mode)

      @security_mode = security_mode
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        software_version == other.software_version &&
        security_mode == other.security_mode &&
        security_master_user_name == other.security_master_user_name &&
        security_master_user_password_hash == other.security_master_user_password_hash &&
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
      [display_name, software_version, security_mode, security_master_user_name, security_master_user_password_hash, freeform_tags, defined_tags].hash
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
