# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Manages resource allocation among databases. Besides the name, at least one other property must be available.
  #
  class DatabaseManagement::Models::DatabasePlanDirective
    TYPE_ENUM = [
      TYPE_DATABASE = 'DATABASE'.freeze,
      TYPE_PROFILE = 'PROFILE'.freeze,
      TYPE_OTHER = 'OTHER'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_PRIMARY = 'PRIMARY'.freeze,
      ROLE_STANDBY = 'STANDBY'.freeze,
      ROLE_NONE = 'NONE'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of a database or a profile.
    # @return [String]
    attr_accessor :name

    # The relative priority of a database in the database plan. A higher share value implies
    # higher priority and more access to the I/O resources.
    # Use either share or (level, allocation). All plan directives in a database plan
    # should use the same setting.
    # Share-based resource allocation is the recommended method for a database plan.
    #
    # @return [Integer]
    attr_accessor :share

    # The allocation level. Valid values are from 1 to 8. Resources are allocated to level 1 first,
    # and then remaining resources are allocated to level 2, and so on.
    #
    # @return [Integer]
    attr_accessor :level

    # The resource allocation as a percentage (0-100) within the level.
    #
    # @return [Integer]
    attr_accessor :allocation

    # The maximum I/O utilization limit as a percentage of the available resources.
    # @return [Integer]
    attr_accessor :limit

    # Controls use of Exadata Smart Flash Cache by a database.
    # This ensures that cache space is reserved for mission-critical databases.
    # flashcache=off is invalid in a directive that contains the flashcachemin, flashcachelimit, or flashcachesize attributes.
    #
    # @return [BOOLEAN]
    attr_accessor :is_flash_cache_on

    # Controls use of the persistent memory (PMEM) cache by a database. This ensures that cache space
    # is reserved for mission-critical databases.
    # pmemcache=off is invalid in a directive that contains the pmemcachemin, pmemcachelimit, or pmemcachesize attributes.
    #
    # @return [BOOLEAN]
    attr_accessor :is_pmem_cache_on

    # Controls use of Exadata Smart Flash Log by a database.
    # This ensures that Exadata Smart Flash Log is reserved for mission-critical databases.
    #
    # @return [BOOLEAN]
    attr_accessor :is_flash_log_on

    # Controls use of persistent memory logging (PMEM log) by a database.
    # This ensures that PMEM log is reserved for mission-critical databases.
    #
    # @return [BOOLEAN]
    attr_accessor :is_pmem_log_on

    # Defines a soft limit for space usage in Exadata Smart Flash Cache.
    # If the cache is not full, the limit can be exceeded.
    # You specify the value for flashcachelimit in bytes. You can also use the suffixes M (megabytes),
    # G (gigabytes), or T (terabytes) to specify larger values. For example, 300M, 150G, or 1T.
    # The value for flashcachelimit must be at least 4 MB.
    # The flashcachelimit and flashcachesize attributes cannot be specified in the same directive.
    # The value for flashcachelimit cannot be smaller than flashcachemin, if it is specified.
    #
    # @return [String]
    attr_accessor :flash_cache_limit

    # Specifies a minimum guaranteed space allocation in Exadata Smart Flash Cache.
    # You specify the value for flashcachemin in bytes. You can also use the suffixes
    # M (megabytes), G (gigabytes), or T (terabytes) to specify larger values. For example, 300M, 150G, or 1T.
    # The value for flashcachemin must be at least 4 MB.
    # In any plan, the sum of all flashcachemin values cannot exceed the size of Exadata Smart Flash Cache.
    # If flashcachelimit is specified, then the value for flashcachemin cannot exceed flashcachelimit.
    # If flashcachesize is specified, then the value for flashcachemin cannot exceed flashcachesize.
    #
    # @return [String]
    attr_accessor :flash_cache_min

    # Defines a hard limit for space usage in Exadata Smart Flash Cache.
    # The limit cannot be exceeded, even if the cache is not full.
    # In an IORM plan, if the size of Exadata Smart Flash Cache can accommodate all of the flashcachemin
    # and flashcachesize allocations, then each flashcachesize definition represents a guaranteed space allocation.
    # However, starting with Oracle Exadata System Software release 19.2.0 you can use the flashcachesize
    # attribute to over-provision space in Exadata Smart Flash Cache. Consequently,
    # if the size of Exadata Smart Flash Cache cannot accommodate all of the flashcachemin and flashcachesize
    # allocations, then only flashcachemin is guaranteed.
    #
    # @return [String]
    attr_accessor :flash_cache_size

    # Defines a soft limit for space usage in the persistent memory (PMEM) cache.
    # If the cache is not full, the limit can be exceeded.
    # You specify the value for pmemcachelimit in bytes. You can also use the suffixes M (megabytes),
    # G (gigabytes), or T (terabytes) to specify larger values. For example, 300M, 150G, or 1T.
    # The value for pmemcachelimit must be at least 4 MB.
    # The pmemcachelimit and pmemcachesize attributes cannot be specified in the same directive.
    # The value for pmemcachelimit cannot be smaller than pmemcachemin, if it is specified.
    #
    # @return [String]
    attr_accessor :pmem_cache_limit

    # Specifies a minimum guaranteed space allocation in the persistent memory (PMEM) cache.
    #
    # @return [String]
    attr_accessor :pmem_cache_min

    # Defines a hard limit for space usage in the persistent memory (PMEM) cache.
    # The limit cannot be exceeded, even if the cache is not full.
    # In an IORM plan, if the size of the PMEM cache can accommodate all of the pmemcachemin and
    # pmemcachesize allocations, then each pmemcachesize definition represents a guaranteed space allocation.
    # However, you can use the pmemcachesize attribute to over-provision space in the PMEM cache.
    # Consequently, if the PMEM cache size cannot accommodate all of the pmemcachemin and pmemcachesize
    # allocations, then only pmemcachemin is guaranteed.
    #
    # @return [String]
    attr_accessor :pmem_cache_size

    # Starting with Oracle Exadata System Software release 19.1.0, you can use the asmcluster attribute to
    # distinguish between databases with the same name running in different Oracle ASM clusters.
    #
    # @return [String]
    attr_accessor :asm_cluster

    # Enables you to create a profile or template, to ease management and configuration of resource plans
    # in environments with many databases.
    #
    # - type=database: Specifies a directive that applies to a specific database.
    # If type in not specified, then the directive defaults to the database type.
    # - type=profile: Specifies a directive that applies to a profile rather than a specific database.
    #
    #   To associate a database with an IORM profile, you must set the database initialization
    #   parameter db_performance_profile to the value of the profile name. Databases that map to a profile inherit the settings specified in the profile.
    #
    # @return [String]
    attr_reader :type

    # Enables you to specify different plan directives based on the Oracle Data Guard database role.
    #
    # @return [String]
    attr_reader :role

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'share': :'share',
        'level': :'level',
        'allocation': :'allocation',
        'limit': :'limit',
        'is_flash_cache_on': :'isFlashCacheOn',
        'is_pmem_cache_on': :'isPmemCacheOn',
        'is_flash_log_on': :'isFlashLogOn',
        'is_pmem_log_on': :'isPmemLogOn',
        'flash_cache_limit': :'flashCacheLimit',
        'flash_cache_min': :'flashCacheMin',
        'flash_cache_size': :'flashCacheSize',
        'pmem_cache_limit': :'pmemCacheLimit',
        'pmem_cache_min': :'pmemCacheMin',
        'pmem_cache_size': :'pmemCacheSize',
        'asm_cluster': :'asmCluster',
        'type': :'type',
        'role': :'role'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'share': :'Integer',
        'level': :'Integer',
        'allocation': :'Integer',
        'limit': :'Integer',
        'is_flash_cache_on': :'BOOLEAN',
        'is_pmem_cache_on': :'BOOLEAN',
        'is_flash_log_on': :'BOOLEAN',
        'is_pmem_log_on': :'BOOLEAN',
        'flash_cache_limit': :'String',
        'flash_cache_min': :'String',
        'flash_cache_size': :'String',
        'pmem_cache_limit': :'String',
        'pmem_cache_min': :'String',
        'pmem_cache_size': :'String',
        'asm_cluster': :'String',
        'type': :'String',
        'role': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :share The value to assign to the {#share} property
    # @option attributes [Integer] :level The value to assign to the {#level} property
    # @option attributes [Integer] :allocation The value to assign to the {#allocation} property
    # @option attributes [Integer] :limit The value to assign to the {#limit} property
    # @option attributes [BOOLEAN] :is_flash_cache_on The value to assign to the {#is_flash_cache_on} property
    # @option attributes [BOOLEAN] :is_pmem_cache_on The value to assign to the {#is_pmem_cache_on} property
    # @option attributes [BOOLEAN] :is_flash_log_on The value to assign to the {#is_flash_log_on} property
    # @option attributes [BOOLEAN] :is_pmem_log_on The value to assign to the {#is_pmem_log_on} property
    # @option attributes [String] :flash_cache_limit The value to assign to the {#flash_cache_limit} property
    # @option attributes [String] :flash_cache_min The value to assign to the {#flash_cache_min} property
    # @option attributes [String] :flash_cache_size The value to assign to the {#flash_cache_size} property
    # @option attributes [String] :pmem_cache_limit The value to assign to the {#pmem_cache_limit} property
    # @option attributes [String] :pmem_cache_min The value to assign to the {#pmem_cache_min} property
    # @option attributes [String] :pmem_cache_size The value to assign to the {#pmem_cache_size} property
    # @option attributes [String] :asm_cluster The value to assign to the {#asm_cluster} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :role The value to assign to the {#role} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.share = attributes[:'share'] if attributes[:'share']

      self.level = attributes[:'level'] if attributes[:'level']

      self.allocation = attributes[:'allocation'] if attributes[:'allocation']

      self.limit = attributes[:'limit'] if attributes[:'limit']

      self.is_flash_cache_on = attributes[:'isFlashCacheOn'] unless attributes[:'isFlashCacheOn'].nil?

      raise 'You cannot provide both :isFlashCacheOn and :is_flash_cache_on' if attributes.key?(:'isFlashCacheOn') && attributes.key?(:'is_flash_cache_on')

      self.is_flash_cache_on = attributes[:'is_flash_cache_on'] unless attributes[:'is_flash_cache_on'].nil?

      self.is_pmem_cache_on = attributes[:'isPmemCacheOn'] unless attributes[:'isPmemCacheOn'].nil?

      raise 'You cannot provide both :isPmemCacheOn and :is_pmem_cache_on' if attributes.key?(:'isPmemCacheOn') && attributes.key?(:'is_pmem_cache_on')

      self.is_pmem_cache_on = attributes[:'is_pmem_cache_on'] unless attributes[:'is_pmem_cache_on'].nil?

      self.is_flash_log_on = attributes[:'isFlashLogOn'] unless attributes[:'isFlashLogOn'].nil?

      raise 'You cannot provide both :isFlashLogOn and :is_flash_log_on' if attributes.key?(:'isFlashLogOn') && attributes.key?(:'is_flash_log_on')

      self.is_flash_log_on = attributes[:'is_flash_log_on'] unless attributes[:'is_flash_log_on'].nil?

      self.is_pmem_log_on = attributes[:'isPmemLogOn'] unless attributes[:'isPmemLogOn'].nil?

      raise 'You cannot provide both :isPmemLogOn and :is_pmem_log_on' if attributes.key?(:'isPmemLogOn') && attributes.key?(:'is_pmem_log_on')

      self.is_pmem_log_on = attributes[:'is_pmem_log_on'] unless attributes[:'is_pmem_log_on'].nil?

      self.flash_cache_limit = attributes[:'flashCacheLimit'] if attributes[:'flashCacheLimit']

      raise 'You cannot provide both :flashCacheLimit and :flash_cache_limit' if attributes.key?(:'flashCacheLimit') && attributes.key?(:'flash_cache_limit')

      self.flash_cache_limit = attributes[:'flash_cache_limit'] if attributes[:'flash_cache_limit']

      self.flash_cache_min = attributes[:'flashCacheMin'] if attributes[:'flashCacheMin']

      raise 'You cannot provide both :flashCacheMin and :flash_cache_min' if attributes.key?(:'flashCacheMin') && attributes.key?(:'flash_cache_min')

      self.flash_cache_min = attributes[:'flash_cache_min'] if attributes[:'flash_cache_min']

      self.flash_cache_size = attributes[:'flashCacheSize'] if attributes[:'flashCacheSize']

      raise 'You cannot provide both :flashCacheSize and :flash_cache_size' if attributes.key?(:'flashCacheSize') && attributes.key?(:'flash_cache_size')

      self.flash_cache_size = attributes[:'flash_cache_size'] if attributes[:'flash_cache_size']

      self.pmem_cache_limit = attributes[:'pmemCacheLimit'] if attributes[:'pmemCacheLimit']

      raise 'You cannot provide both :pmemCacheLimit and :pmem_cache_limit' if attributes.key?(:'pmemCacheLimit') && attributes.key?(:'pmem_cache_limit')

      self.pmem_cache_limit = attributes[:'pmem_cache_limit'] if attributes[:'pmem_cache_limit']

      self.pmem_cache_min = attributes[:'pmemCacheMin'] if attributes[:'pmemCacheMin']

      raise 'You cannot provide both :pmemCacheMin and :pmem_cache_min' if attributes.key?(:'pmemCacheMin') && attributes.key?(:'pmem_cache_min')

      self.pmem_cache_min = attributes[:'pmem_cache_min'] if attributes[:'pmem_cache_min']

      self.pmem_cache_size = attributes[:'pmemCacheSize'] if attributes[:'pmemCacheSize']

      raise 'You cannot provide both :pmemCacheSize and :pmem_cache_size' if attributes.key?(:'pmemCacheSize') && attributes.key?(:'pmem_cache_size')

      self.pmem_cache_size = attributes[:'pmem_cache_size'] if attributes[:'pmem_cache_size']

      self.asm_cluster = attributes[:'asmCluster'] if attributes[:'asmCluster']

      raise 'You cannot provide both :asmCluster and :asm_cluster' if attributes.key?(:'asmCluster') && attributes.key?(:'asm_cluster')

      self.asm_cluster = attributes[:'asm_cluster'] if attributes[:'asm_cluster']

      self.type = attributes[:'type'] if attributes[:'type']

      self.role = attributes[:'role'] if attributes[:'role']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
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
        share == other.share &&
        level == other.level &&
        allocation == other.allocation &&
        limit == other.limit &&
        is_flash_cache_on == other.is_flash_cache_on &&
        is_pmem_cache_on == other.is_pmem_cache_on &&
        is_flash_log_on == other.is_flash_log_on &&
        is_pmem_log_on == other.is_pmem_log_on &&
        flash_cache_limit == other.flash_cache_limit &&
        flash_cache_min == other.flash_cache_min &&
        flash_cache_size == other.flash_cache_size &&
        pmem_cache_limit == other.pmem_cache_limit &&
        pmem_cache_min == other.pmem_cache_min &&
        pmem_cache_size == other.pmem_cache_size &&
        asm_cluster == other.asm_cluster &&
        type == other.type &&
        role == other.role
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
      [name, share, level, allocation, limit, is_flash_cache_on, is_pmem_cache_on, is_flash_log_on, is_pmem_log_on, flash_cache_limit, flash_cache_min, flash_cache_size, pmem_cache_limit, pmem_cache_min, pmem_cache_size, asm_cluster, type, role].hash
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