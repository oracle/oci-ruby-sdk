# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that provides information about an update for a Windows instance.
  class OsManagementHub::Models::WindowsUpdate
    UPDATE_TYPE_ENUM = [
      UPDATE_TYPE_SECURITY = 'SECURITY'.freeze,
      UPDATE_TYPE_BUGFIX = 'BUGFIX'.freeze,
      UPDATE_TYPE_ENHANCEMENT = 'ENHANCEMENT'.freeze,
      UPDATE_TYPE_OTHER = 'OTHER'.freeze,
      UPDATE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INSTALLABLE_ENUM = [
      INSTALLABLE_INSTALLABLE = 'INSTALLABLE'.freeze,
      INSTALLABLE_NOT_INSTALLABLE = 'NOT_INSTALLABLE'.freeze,
      INSTALLABLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name of the Windows update.
    # @return [String]
    attr_accessor :name

    # **[Required]** Unique identifier for the Windows update. Note that this is not an OCID, but is a unique identifier assigned by Microsoft.
    # Example: '6981d463-cd91-4a26-b7c4-ea4ded9183ed'
    #
    # @return [String]
    attr_accessor :update_id

    # Description of the update.
    # @return [String]
    attr_accessor :description

    # **[Required]** The type of Windows update.
    # @return [String]
    attr_reader :update_type

    # size of the package in bytes
    # @return [Integer]
    attr_accessor :size_in_bytes

    # Indicates whether the update can be installed using the service.
    # @return [String]
    attr_reader :installable

    # List of requirements for installing the update on the managed instance.
    # @return [Array<OCI::OsManagementHub::Models::InstallationRequirements>]
    attr_accessor :installation_requirements

    # Indicates whether a reboot is required to complete the installation of this update.
    # @return [BOOLEAN]
    attr_accessor :is_reboot_required_for_installation

    # List of the Microsoft Knowledge Base Article Ids related to this Windows Update.
    # @return [Array<String>]
    attr_accessor :kb_article_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'update_id': :'updateId',
        'description': :'description',
        'update_type': :'updateType',
        'size_in_bytes': :'sizeInBytes',
        'installable': :'installable',
        'installation_requirements': :'installationRequirements',
        'is_reboot_required_for_installation': :'isRebootRequiredForInstallation',
        'kb_article_ids': :'kbArticleIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'update_id': :'String',
        'description': :'String',
        'update_type': :'String',
        'size_in_bytes': :'Integer',
        'installable': :'String',
        'installation_requirements': :'Array<OCI::OsManagementHub::Models::InstallationRequirements>',
        'is_reboot_required_for_installation': :'BOOLEAN',
        'kb_article_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :update_id The value to assign to the {#update_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :update_type The value to assign to the {#update_type} property
    # @option attributes [Integer] :size_in_bytes The value to assign to the {#size_in_bytes} property
    # @option attributes [String] :installable The value to assign to the {#installable} property
    # @option attributes [Array<OCI::OsManagementHub::Models::InstallationRequirements>] :installation_requirements The value to assign to the {#installation_requirements} property
    # @option attributes [BOOLEAN] :is_reboot_required_for_installation The value to assign to the {#is_reboot_required_for_installation} property
    # @option attributes [Array<String>] :kb_article_ids The value to assign to the {#kb_article_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.update_id = attributes[:'updateId'] if attributes[:'updateId']

      raise 'You cannot provide both :updateId and :update_id' if attributes.key?(:'updateId') && attributes.key?(:'update_id')

      self.update_id = attributes[:'update_id'] if attributes[:'update_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.update_type = attributes[:'updateType'] if attributes[:'updateType']

      raise 'You cannot provide both :updateType and :update_type' if attributes.key?(:'updateType') && attributes.key?(:'update_type')

      self.update_type = attributes[:'update_type'] if attributes[:'update_type']

      self.size_in_bytes = attributes[:'sizeInBytes'] if attributes[:'sizeInBytes']

      raise 'You cannot provide both :sizeInBytes and :size_in_bytes' if attributes.key?(:'sizeInBytes') && attributes.key?(:'size_in_bytes')

      self.size_in_bytes = attributes[:'size_in_bytes'] if attributes[:'size_in_bytes']

      self.installable = attributes[:'installable'] if attributes[:'installable']

      self.installation_requirements = attributes[:'installationRequirements'] if attributes[:'installationRequirements']

      raise 'You cannot provide both :installationRequirements and :installation_requirements' if attributes.key?(:'installationRequirements') && attributes.key?(:'installation_requirements')

      self.installation_requirements = attributes[:'installation_requirements'] if attributes[:'installation_requirements']

      self.is_reboot_required_for_installation = attributes[:'isRebootRequiredForInstallation'] unless attributes[:'isRebootRequiredForInstallation'].nil?

      raise 'You cannot provide both :isRebootRequiredForInstallation and :is_reboot_required_for_installation' if attributes.key?(:'isRebootRequiredForInstallation') && attributes.key?(:'is_reboot_required_for_installation')

      self.is_reboot_required_for_installation = attributes[:'is_reboot_required_for_installation'] unless attributes[:'is_reboot_required_for_installation'].nil?

      self.kb_article_ids = attributes[:'kbArticleIds'] if attributes[:'kbArticleIds']

      raise 'You cannot provide both :kbArticleIds and :kb_article_ids' if attributes.key?(:'kbArticleIds') && attributes.key?(:'kb_article_ids')

      self.kb_article_ids = attributes[:'kb_article_ids'] if attributes[:'kb_article_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] update_type Object to be assigned
    def update_type=(update_type)
      # rubocop:disable Style/ConditionalAssignment
      if update_type && !UPDATE_TYPE_ENUM.include?(update_type)
        OCI.logger.debug("Unknown value for 'update_type' [" + update_type + "]. Mapping to 'UPDATE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @update_type = UPDATE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @update_type = update_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] installable Object to be assigned
    def installable=(installable)
      # rubocop:disable Style/ConditionalAssignment
      if installable && !INSTALLABLE_ENUM.include?(installable)
        OCI.logger.debug("Unknown value for 'installable' [" + installable + "]. Mapping to 'INSTALLABLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @installable = INSTALLABLE_UNKNOWN_ENUM_VALUE
      else
        @installable = installable
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        update_id == other.update_id &&
        description == other.description &&
        update_type == other.update_type &&
        size_in_bytes == other.size_in_bytes &&
        installable == other.installable &&
        installation_requirements == other.installation_requirements &&
        is_reboot_required_for_installation == other.is_reboot_required_for_installation &&
        kb_article_ids == other.kb_article_ids
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
      [name, update_id, description, update_type, size_in_bytes, installable, installation_requirements, is_reboot_required_for_installation, kb_article_ids].hash
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