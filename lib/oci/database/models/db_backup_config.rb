# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Backup Options
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Database::Models::DbBackupConfig
    AUTO_BACKUP_WINDOW_ENUM = [
      AUTO_BACKUP_WINDOW_SLOT_ONE = 'SLOT_ONE'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_TWO = 'SLOT_TWO'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_THREE = 'SLOT_THREE'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_FOUR = 'SLOT_FOUR'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_FIVE = 'SLOT_FIVE'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_SIX = 'SLOT_SIX'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_SEVEN = 'SLOT_SEVEN'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_EIGHT = 'SLOT_EIGHT'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_NINE = 'SLOT_NINE'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_TEN = 'SLOT_TEN'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_ELEVEN = 'SLOT_ELEVEN'.freeze,
      AUTO_BACKUP_WINDOW_SLOT_TWELVE = 'SLOT_TWELVE'.freeze,
      AUTO_BACKUP_WINDOW_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # If set to true, configures automatic backups. If you previously used RMAN or dbcli to configure backups and then you switch to using the Console or the API for backups, a new backup configuration is created and associated with your database. This means that you can no longer rely on your previously configured unmanaged backups to work.
    # @return [BOOLEAN]
    attr_accessor :auto_backup_enabled

    # Number of days between the current and the earliest point of recoverability covered by automatic backups.
    # This value applies to automatic backups only. After a new automatic backup has been created, Oracle removes old automatic backups that are created before the window.
    # When the value is updated, it is applied to all existing automatic backups.
    #
    # @return [Integer]
    attr_accessor :recovery_window_in_days

    # Time window selected for initiating automatic backup for the database system. There are twelve available two-hour time windows. If no option is selected, a start time between 12:00 AM to 7:00 AM in the region of the database is automatically chosen. For example, if the user selects SLOT_TWO from the enum list, the automatic backup job will start in between 2:00 AM (inclusive) to 4:00 AM (exclusive).
    #
    # Example: `SLOT_TWO`
    #
    # @return [String]
    attr_reader :auto_backup_window

    # Backup destination details.
    # @return [Array<OCI::Database::Models::BackupDestinationDetails>]
    attr_accessor :backup_destination_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'auto_backup_enabled': :'autoBackupEnabled',
        'recovery_window_in_days': :'recoveryWindowInDays',
        'auto_backup_window': :'autoBackupWindow',
        'backup_destination_details': :'backupDestinationDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'auto_backup_enabled': :'BOOLEAN',
        'recovery_window_in_days': :'Integer',
        'auto_backup_window': :'String',
        'backup_destination_details': :'Array<OCI::Database::Models::BackupDestinationDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :auto_backup_enabled The value to assign to the {#auto_backup_enabled} property
    # @option attributes [Integer] :recovery_window_in_days The value to assign to the {#recovery_window_in_days} property
    # @option attributes [String] :auto_backup_window The value to assign to the {#auto_backup_window} property
    # @option attributes [Array<OCI::Database::Models::BackupDestinationDetails>] :backup_destination_details The value to assign to the {#backup_destination_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.auto_backup_enabled = attributes[:'autoBackupEnabled'] unless attributes[:'autoBackupEnabled'].nil?

      raise 'You cannot provide both :autoBackupEnabled and :auto_backup_enabled' if attributes.key?(:'autoBackupEnabled') && attributes.key?(:'auto_backup_enabled')

      self.auto_backup_enabled = attributes[:'auto_backup_enabled'] unless attributes[:'auto_backup_enabled'].nil?

      self.recovery_window_in_days = attributes[:'recoveryWindowInDays'] if attributes[:'recoveryWindowInDays']

      raise 'You cannot provide both :recoveryWindowInDays and :recovery_window_in_days' if attributes.key?(:'recoveryWindowInDays') && attributes.key?(:'recovery_window_in_days')

      self.recovery_window_in_days = attributes[:'recovery_window_in_days'] if attributes[:'recovery_window_in_days']

      self.auto_backup_window = attributes[:'autoBackupWindow'] if attributes[:'autoBackupWindow']

      raise 'You cannot provide both :autoBackupWindow and :auto_backup_window' if attributes.key?(:'autoBackupWindow') && attributes.key?(:'auto_backup_window')

      self.auto_backup_window = attributes[:'auto_backup_window'] if attributes[:'auto_backup_window']

      self.backup_destination_details = attributes[:'backupDestinationDetails'] if attributes[:'backupDestinationDetails']

      raise 'You cannot provide both :backupDestinationDetails and :backup_destination_details' if attributes.key?(:'backupDestinationDetails') && attributes.key?(:'backup_destination_details')

      self.backup_destination_details = attributes[:'backup_destination_details'] if attributes[:'backup_destination_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] auto_backup_window Object to be assigned
    def auto_backup_window=(auto_backup_window)
      # rubocop:disable Style/ConditionalAssignment
      if auto_backup_window && !AUTO_BACKUP_WINDOW_ENUM.include?(auto_backup_window)
        OCI.logger.debug("Unknown value for 'auto_backup_window' [" + auto_backup_window + "]. Mapping to 'AUTO_BACKUP_WINDOW_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @auto_backup_window = AUTO_BACKUP_WINDOW_UNKNOWN_ENUM_VALUE
      else
        @auto_backup_window = auto_backup_window
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        auto_backup_enabled == other.auto_backup_enabled &&
        recovery_window_in_days == other.recovery_window_in_days &&
        auto_backup_window == other.auto_backup_window &&
        backup_destination_details == other.backup_destination_details
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
      [auto_backup_enabled, recovery_window_in_days, auto_backup_window, backup_destination_details].hash
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
