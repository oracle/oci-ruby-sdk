# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of a datafile.
  class DatabaseManagement::Models::Datafile
    STATUS_ENUM = [
      STATUS_AVAILABLE = 'AVAILABLE'.freeze,
      STATUS_INVALID = 'INVALID'.freeze,
      STATUS_OFFLINE = 'OFFLINE'.freeze,
      STATUS_ONLINE = 'ONLINE'.freeze,
      STATUS_UNKNOWN = 'UNKNOWN'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ONLINE_STATUS_ENUM = [
      ONLINE_STATUS_SYSOFF = 'SYSOFF'.freeze,
      ONLINE_STATUS_SYSTEM = 'SYSTEM'.freeze,
      ONLINE_STATUS_OFFLINE = 'OFFLINE'.freeze,
      ONLINE_STATUS_ONLINE = 'ONLINE'.freeze,
      ONLINE_STATUS_RECOVER = 'RECOVER'.freeze,
      ONLINE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LOST_WRITE_PROTECT_ENUM = [
      LOST_WRITE_PROTECT_ENABLED = 'ENABLED'.freeze,
      LOST_WRITE_PROTECT_PROTECT_OFF = 'PROTECT_OFF'.freeze,
      LOST_WRITE_PROTECT_SUSPEND = 'SUSPEND'.freeze,
      LOST_WRITE_PROTECT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SHARED_ENUM = [
      SHARED_SHARED = 'SHARED'.freeze,
      SHARED_LOCAL_FOR_RIM = 'LOCAL_FOR_RIM'.freeze,
      SHARED_LOCAL_FOR_ALL = 'LOCAL_FOR_ALL'.freeze,
      SHARED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The filename (including the path) of the datafile or tempfile.
    # @return [String]
    attr_accessor :name

    # The status of the file. INVALID status is used when the file number is not in use, for example, a file in a tablespace that was dropped.
    # @return [String]
    attr_reader :status

    # The online status of the file.
    # @return [String]
    attr_reader :online_status

    # Indicates whether the datafile is auto-extensible.
    # @return [BOOLEAN]
    attr_accessor :is_auto_extensible

    # The lost write protection status of the file.
    # @return [String]
    attr_reader :lost_write_protect

    # Type of tablespace this file belongs to. If it's for a shared tablespace, for a local temporary tablespace for RIM (read-only) instances, or for local temporary tablespace for all instance types.
    # @return [String]
    attr_reader :shared

    # Instance ID of the instance to which the temp file belongs. This column has a NULL value for temp files that belong to shared tablespaces.
    # @return [Float]
    attr_accessor :instance_id

    # The maximum file size in KB.
    # @return [Float]
    attr_accessor :max_size_kb

    # The allocated file size in KB.
    # @return [Float]
    attr_accessor :allocated_size_kb

    # The size of the file available for user data in KB. The actual size of the file minus the USER_BYTES value is used to store file-related metadata.
    # @return [Float]
    attr_accessor :user_size_kb

    # The number of blocks used as auto-extension increment.
    # @return [Float]
    attr_accessor :increment_by

    # The free space available in the datafile in KB.
    # @return [Float]
    attr_accessor :free_space_kb

    # The total space used in the datafile in KB.
    # @return [Float]
    attr_accessor :used_space_kb

    # The percentage of used space out of the maximum available space in the file.
    # @return [Float]
    attr_accessor :used_percent_available

    # The percentage of used space out of the total allocated space in the file.
    # @return [Float]
    attr_accessor :used_percent_allocated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'status': :'status',
        'online_status': :'onlineStatus',
        'is_auto_extensible': :'isAutoExtensible',
        'lost_write_protect': :'lostWriteProtect',
        'shared': :'shared',
        'instance_id': :'instanceId',
        'max_size_kb': :'maxSizeKB',
        'allocated_size_kb': :'allocatedSizeKB',
        'user_size_kb': :'userSizeKB',
        'increment_by': :'incrementBy',
        'free_space_kb': :'freeSpaceKB',
        'used_space_kb': :'usedSpaceKB',
        'used_percent_available': :'usedPercentAvailable',
        'used_percent_allocated': :'usedPercentAllocated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'status': :'String',
        'online_status': :'String',
        'is_auto_extensible': :'BOOLEAN',
        'lost_write_protect': :'String',
        'shared': :'String',
        'instance_id': :'Float',
        'max_size_kb': :'Float',
        'allocated_size_kb': :'Float',
        'user_size_kb': :'Float',
        'increment_by': :'Float',
        'free_space_kb': :'Float',
        'used_space_kb': :'Float',
        'used_percent_available': :'Float',
        'used_percent_allocated': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :online_status The value to assign to the {#online_status} property
    # @option attributes [BOOLEAN] :is_auto_extensible The value to assign to the {#is_auto_extensible} property
    # @option attributes [String] :lost_write_protect The value to assign to the {#lost_write_protect} property
    # @option attributes [String] :shared The value to assign to the {#shared} property
    # @option attributes [Float] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [Float] :max_size_kb The value to assign to the {#max_size_kb} property
    # @option attributes [Float] :allocated_size_kb The value to assign to the {#allocated_size_kb} property
    # @option attributes [Float] :user_size_kb The value to assign to the {#user_size_kb} property
    # @option attributes [Float] :increment_by The value to assign to the {#increment_by} property
    # @option attributes [Float] :free_space_kb The value to assign to the {#free_space_kb} property
    # @option attributes [Float] :used_space_kb The value to assign to the {#used_space_kb} property
    # @option attributes [Float] :used_percent_available The value to assign to the {#used_percent_available} property
    # @option attributes [Float] :used_percent_allocated The value to assign to the {#used_percent_allocated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.status = attributes[:'status'] if attributes[:'status']

      self.online_status = attributes[:'onlineStatus'] if attributes[:'onlineStatus']

      raise 'You cannot provide both :onlineStatus and :online_status' if attributes.key?(:'onlineStatus') && attributes.key?(:'online_status')

      self.online_status = attributes[:'online_status'] if attributes[:'online_status']

      self.is_auto_extensible = attributes[:'isAutoExtensible'] unless attributes[:'isAutoExtensible'].nil?

      raise 'You cannot provide both :isAutoExtensible and :is_auto_extensible' if attributes.key?(:'isAutoExtensible') && attributes.key?(:'is_auto_extensible')

      self.is_auto_extensible = attributes[:'is_auto_extensible'] unless attributes[:'is_auto_extensible'].nil?

      self.lost_write_protect = attributes[:'lostWriteProtect'] if attributes[:'lostWriteProtect']

      raise 'You cannot provide both :lostWriteProtect and :lost_write_protect' if attributes.key?(:'lostWriteProtect') && attributes.key?(:'lost_write_protect')

      self.lost_write_protect = attributes[:'lost_write_protect'] if attributes[:'lost_write_protect']

      self.shared = attributes[:'shared'] if attributes[:'shared']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.max_size_kb = attributes[:'maxSizeKB'] if attributes[:'maxSizeKB']

      raise 'You cannot provide both :maxSizeKB and :max_size_kb' if attributes.key?(:'maxSizeKB') && attributes.key?(:'max_size_kb')

      self.max_size_kb = attributes[:'max_size_kb'] if attributes[:'max_size_kb']

      self.allocated_size_kb = attributes[:'allocatedSizeKB'] if attributes[:'allocatedSizeKB']

      raise 'You cannot provide both :allocatedSizeKB and :allocated_size_kb' if attributes.key?(:'allocatedSizeKB') && attributes.key?(:'allocated_size_kb')

      self.allocated_size_kb = attributes[:'allocated_size_kb'] if attributes[:'allocated_size_kb']

      self.user_size_kb = attributes[:'userSizeKB'] if attributes[:'userSizeKB']

      raise 'You cannot provide both :userSizeKB and :user_size_kb' if attributes.key?(:'userSizeKB') && attributes.key?(:'user_size_kb')

      self.user_size_kb = attributes[:'user_size_kb'] if attributes[:'user_size_kb']

      self.increment_by = attributes[:'incrementBy'] if attributes[:'incrementBy']

      raise 'You cannot provide both :incrementBy and :increment_by' if attributes.key?(:'incrementBy') && attributes.key?(:'increment_by')

      self.increment_by = attributes[:'increment_by'] if attributes[:'increment_by']

      self.free_space_kb = attributes[:'freeSpaceKB'] if attributes[:'freeSpaceKB']

      raise 'You cannot provide both :freeSpaceKB and :free_space_kb' if attributes.key?(:'freeSpaceKB') && attributes.key?(:'free_space_kb')

      self.free_space_kb = attributes[:'free_space_kb'] if attributes[:'free_space_kb']

      self.used_space_kb = attributes[:'usedSpaceKB'] if attributes[:'usedSpaceKB']

      raise 'You cannot provide both :usedSpaceKB and :used_space_kb' if attributes.key?(:'usedSpaceKB') && attributes.key?(:'used_space_kb')

      self.used_space_kb = attributes[:'used_space_kb'] if attributes[:'used_space_kb']

      self.used_percent_available = attributes[:'usedPercentAvailable'] if attributes[:'usedPercentAvailable']

      raise 'You cannot provide both :usedPercentAvailable and :used_percent_available' if attributes.key?(:'usedPercentAvailable') && attributes.key?(:'used_percent_available')

      self.used_percent_available = attributes[:'used_percent_available'] if attributes[:'used_percent_available']

      self.used_percent_allocated = attributes[:'usedPercentAllocated'] if attributes[:'usedPercentAllocated']

      raise 'You cannot provide both :usedPercentAllocated and :used_percent_allocated' if attributes.key?(:'usedPercentAllocated') && attributes.key?(:'used_percent_allocated')

      self.used_percent_allocated = attributes[:'used_percent_allocated'] if attributes[:'used_percent_allocated']
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
    # @param [Object] online_status Object to be assigned
    def online_status=(online_status)
      # rubocop:disable Style/ConditionalAssignment
      if online_status && !ONLINE_STATUS_ENUM.include?(online_status)
        OCI.logger.debug("Unknown value for 'online_status' [" + online_status + "]. Mapping to 'ONLINE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @online_status = ONLINE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @online_status = online_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lost_write_protect Object to be assigned
    def lost_write_protect=(lost_write_protect)
      # rubocop:disable Style/ConditionalAssignment
      if lost_write_protect && !LOST_WRITE_PROTECT_ENUM.include?(lost_write_protect)
        OCI.logger.debug("Unknown value for 'lost_write_protect' [" + lost_write_protect + "]. Mapping to 'LOST_WRITE_PROTECT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lost_write_protect = LOST_WRITE_PROTECT_UNKNOWN_ENUM_VALUE
      else
        @lost_write_protect = lost_write_protect
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] shared Object to be assigned
    def shared=(shared)
      # rubocop:disable Style/ConditionalAssignment
      if shared && !SHARED_ENUM.include?(shared)
        OCI.logger.debug("Unknown value for 'shared' [" + shared + "]. Mapping to 'SHARED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @shared = SHARED_UNKNOWN_ENUM_VALUE
      else
        @shared = shared
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
        status == other.status &&
        online_status == other.online_status &&
        is_auto_extensible == other.is_auto_extensible &&
        lost_write_protect == other.lost_write_protect &&
        shared == other.shared &&
        instance_id == other.instance_id &&
        max_size_kb == other.max_size_kb &&
        allocated_size_kb == other.allocated_size_kb &&
        user_size_kb == other.user_size_kb &&
        increment_by == other.increment_by &&
        free_space_kb == other.free_space_kb &&
        used_space_kb == other.used_space_kb &&
        used_percent_available == other.used_percent_available &&
        used_percent_allocated == other.used_percent_allocated
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
      [name, status, online_status, is_auto_extensible, lost_write_protect, shared, instance_id, max_size_kb, allocated_size_kb, user_size_kb, increment_by, free_space_kb, used_space_kb, used_percent_available, used_percent_allocated].hash
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
