# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An OCI Compute instance that is being managed
  class OsManagement::Models::ManagedInstanceSummary
    STATUS_ENUM = [
      STATUS_NORMAL = 'NORMAL'.freeze,
      STATUS_UNREACHABLE = 'UNREACHABLE'.freeze,
      STATUS_ERROR = 'ERROR'.freeze,
      STATUS_WARNING = 'WARNING'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OS_FAMILY_ENUM = [
      OS_FAMILY_LINUX = 'LINUX'.freeze,
      OS_FAMILY_WINDOWS = 'WINDOWS'.freeze,
      OS_FAMILY_ALL = 'ALL'.freeze,
      OS_FAMILY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** user settable name
    # @return [String]
    attr_accessor :display_name

    # **[Required]** OCID for the managed instance
    # @return [String]
    attr_accessor :id

    # Time at which the instance last checked in
    # @return [String]
    attr_accessor :last_checkin

    # Time at which the instance last booted
    # @return [String]
    attr_accessor :last_boot

    # Number of updates available to be installed
    # @return [Integer]
    attr_accessor :updates_available

    # **[Required]** OCID for the Compartment
    # @return [String]
    attr_accessor :compartment_id

    # Information specified by the user about the managed instance
    # @return [String]
    attr_accessor :description

    # status of the managed instance.
    # @return [String]
    attr_reader :status

    # The Operating System type of the managed instance.
    # @return [String]
    attr_reader :os_family

    # Indicates whether a reboot is required to complete installation of updates.
    # @return [BOOLEAN]
    attr_accessor :is_reboot_required

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'id': :'id',
        'last_checkin': :'lastCheckin',
        'last_boot': :'lastBoot',
        'updates_available': :'updatesAvailable',
        'compartment_id': :'compartmentId',
        'description': :'description',
        'status': :'status',
        'os_family': :'osFamily',
        'is_reboot_required': :'isRebootRequired'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'id': :'String',
        'last_checkin': :'String',
        'last_boot': :'String',
        'updates_available': :'Integer',
        'compartment_id': :'String',
        'description': :'String',
        'status': :'String',
        'os_family': :'String',
        'is_reboot_required': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :last_checkin The value to assign to the {#last_checkin} property
    # @option attributes [String] :last_boot The value to assign to the {#last_boot} property
    # @option attributes [Integer] :updates_available The value to assign to the {#updates_available} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :os_family The value to assign to the {#os_family} property
    # @option attributes [BOOLEAN] :is_reboot_required The value to assign to the {#is_reboot_required} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.last_checkin = attributes[:'lastCheckin'] if attributes[:'lastCheckin']

      raise 'You cannot provide both :lastCheckin and :last_checkin' if attributes.key?(:'lastCheckin') && attributes.key?(:'last_checkin')

      self.last_checkin = attributes[:'last_checkin'] if attributes[:'last_checkin']

      self.last_boot = attributes[:'lastBoot'] if attributes[:'lastBoot']

      raise 'You cannot provide both :lastBoot and :last_boot' if attributes.key?(:'lastBoot') && attributes.key?(:'last_boot')

      self.last_boot = attributes[:'last_boot'] if attributes[:'last_boot']

      self.updates_available = attributes[:'updatesAvailable'] if attributes[:'updatesAvailable']

      raise 'You cannot provide both :updatesAvailable and :updates_available' if attributes.key?(:'updatesAvailable') && attributes.key?(:'updates_available')

      self.updates_available = attributes[:'updates_available'] if attributes[:'updates_available']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.status = attributes[:'status'] if attributes[:'status']

      self.os_family = attributes[:'osFamily'] if attributes[:'osFamily']

      raise 'You cannot provide both :osFamily and :os_family' if attributes.key?(:'osFamily') && attributes.key?(:'os_family')

      self.os_family = attributes[:'os_family'] if attributes[:'os_family']

      self.is_reboot_required = attributes[:'isRebootRequired'] unless attributes[:'isRebootRequired'].nil?

      raise 'You cannot provide both :isRebootRequired and :is_reboot_required' if attributes.key?(:'isRebootRequired') && attributes.key?(:'is_reboot_required')

      self.is_reboot_required = attributes[:'is_reboot_required'] unless attributes[:'is_reboot_required'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] os_family Object to be assigned
    def os_family=(os_family)
      # rubocop:disable Style/ConditionalAssignment
      if os_family && !OS_FAMILY_ENUM.include?(os_family)
        OCI.logger.debug("Unknown value for 'os_family' [" + os_family + "]. Mapping to 'OS_FAMILY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @os_family = OS_FAMILY_UNKNOWN_ENUM_VALUE
      else
        @os_family = os_family
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        id == other.id &&
        last_checkin == other.last_checkin &&
        last_boot == other.last_boot &&
        updates_available == other.updates_available &&
        compartment_id == other.compartment_id &&
        description == other.description &&
        status == other.status &&
        os_family == other.os_family &&
        is_reboot_required == other.is_reboot_required
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
      [display_name, id, last_checkin, last_boot, updates_available, compartment_id, description, status, os_family, is_reboot_required].hash
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
