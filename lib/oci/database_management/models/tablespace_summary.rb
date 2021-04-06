# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of a tablespace.
  class DatabaseManagement::Models::TablespaceSummary
    TYPE_ENUM = [
      TYPE_UNDO = 'UNDO'.freeze,
      TYPE_LOST_WRITE_PROTECTION = 'LOST_WRITE_PROTECTION'.freeze,
      TYPE_PERMANENT = 'PERMANENT'.freeze,
      TYPE_TEMPORARY = 'TEMPORARY'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ONLINE = 'ONLINE'.freeze,
      STATUS_OFFLINE = 'OFFLINE'.freeze,
      STATUS_READ_ONLY = 'READ_ONLY'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LOGGING_ENUM = [
      LOGGING_LOGGING = 'LOGGING'.freeze,
      LOGGING_NOLOGGING = 'NOLOGGING'.freeze,
      LOGGING_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EXTENT_MANAGEMENT_ENUM = [
      EXTENT_MANAGEMENT_LOCAL = 'LOCAL'.freeze,
      EXTENT_MANAGEMENT_DICTIONARY = 'DICTIONARY'.freeze,
      EXTENT_MANAGEMENT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ALLOCATION_TYPE_ENUM = [
      ALLOCATION_TYPE_SYSTEM = 'SYSTEM'.freeze,
      ALLOCATION_TYPE_UNIFORM = 'UNIFORM'.freeze,
      ALLOCATION_TYPE_USER = 'USER'.freeze,
      ALLOCATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SEGMENT_SPACE_MANAGEMENT_ENUM = [
      SEGMENT_SPACE_MANAGEMENT_MANUAL = 'MANUAL'.freeze,
      SEGMENT_SPACE_MANAGEMENT_AUTO = 'AUTO'.freeze,
      SEGMENT_SPACE_MANAGEMENT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_TABLE_COMPRESSION_ENUM = [
      DEFAULT_TABLE_COMPRESSION_ENABLED = 'ENABLED'.freeze,
      DEFAULT_TABLE_COMPRESSION_DISABLED = 'DISABLED'.freeze,
      DEFAULT_TABLE_COMPRESSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RETENTION_ENUM = [
      RETENTION_GUARANTEE = 'GUARANTEE'.freeze,
      RETENTION_NOGUARANTEE = 'NOGUARANTEE'.freeze,
      RETENTION_NOT_APPLY = 'NOT_APPLY'.freeze,
      RETENTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PREDICATE_EVALUATION_ENUM = [
      PREDICATE_EVALUATION_HOST = 'HOST'.freeze,
      PREDICATE_EVALUATION_STORAGE = 'STORAGE'.freeze,
      PREDICATE_EVALUATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    COMPRESS_FOR_ENUM = [
      COMPRESS_FOR_BASIC = 'BASIC'.freeze,
      COMPRESS_FOR_ADVANCED = 'ADVANCED'.freeze,
      COMPRESS_FOR_QUERY_LOW = 'QUERY_LOW'.freeze,
      COMPRESS_FOR_QUERY_HIGH = 'QUERY_HIGH'.freeze,
      COMPRESS_FOR_ARCHIVE_LOW = 'ARCHIVE_LOW'.freeze,
      COMPRESS_FOR_ARCHIVE_HIGH = 'ARCHIVE_HIGH'.freeze,
      COMPRESS_FOR_DIRECT_LOAD_ONLY = 'DIRECT_LOAD_ONLY'.freeze,
      COMPRESS_FOR_FOR_ALL_OPERATIONS = 'FOR_ALL_OPERATIONS'.freeze,
      COMPRESS_FOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_IN_MEMORY_ENUM = [
      DEFAULT_IN_MEMORY_ENABLED = 'ENABLED'.freeze,
      DEFAULT_IN_MEMORY_DISABLED = 'DISABLED'.freeze,
      DEFAULT_IN_MEMORY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_IN_MEMORY_PRIORITY_ENUM = [
      DEFAULT_IN_MEMORY_PRIORITY_LOW = 'LOW'.freeze,
      DEFAULT_IN_MEMORY_PRIORITY_MEDIUM = 'MEDIUM'.freeze,
      DEFAULT_IN_MEMORY_PRIORITY_HIGH = 'HIGH'.freeze,
      DEFAULT_IN_MEMORY_PRIORITY_CRITICAL = 'CRITICAL'.freeze,
      DEFAULT_IN_MEMORY_PRIORITY_NONE = 'NONE'.freeze,
      DEFAULT_IN_MEMORY_PRIORITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_IN_MEMORY_DISTRIBUTE_ENUM = [
      DEFAULT_IN_MEMORY_DISTRIBUTE_AUTO = 'AUTO'.freeze,
      DEFAULT_IN_MEMORY_DISTRIBUTE_BY_ROWID_RANGE = 'BY_ROWID_RANGE'.freeze,
      DEFAULT_IN_MEMORY_DISTRIBUTE_BY_PARTITION = 'BY_PARTITION'.freeze,
      DEFAULT_IN_MEMORY_DISTRIBUTE_BY_SUBPARTITION = 'BY_SUBPARTITION'.freeze,
      DEFAULT_IN_MEMORY_DISTRIBUTE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_IN_MEMORY_COMPRESSION_ENUM = [
      DEFAULT_IN_MEMORY_COMPRESSION_NO_MEMCOMPRESS = 'NO_MEMCOMPRESS'.freeze,
      DEFAULT_IN_MEMORY_COMPRESSION_FOR_DML = 'FOR_DML'.freeze,
      DEFAULT_IN_MEMORY_COMPRESSION_FOR_QUERY_LOW = 'FOR_QUERY_LOW'.freeze,
      DEFAULT_IN_MEMORY_COMPRESSION_FOR_QUERY_HIGH = 'FOR_QUERY_HIGH'.freeze,
      DEFAULT_IN_MEMORY_COMPRESSION_FOR_CAPACITY_LOW = 'FOR_CAPACITY_LOW'.freeze,
      DEFAULT_IN_MEMORY_COMPRESSION_FOR_CAPACITY_HIGH = 'FOR_CAPACITY_HIGH'.freeze,
      DEFAULT_IN_MEMORY_COMPRESSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_IN_MEMORY_DUPLICATE_ENUM = [
      DEFAULT_IN_MEMORY_DUPLICATE_NO_DUPLICATE = 'NO_DUPLICATE'.freeze,
      DEFAULT_IN_MEMORY_DUPLICATE_DUPLICATE = 'DUPLICATE'.freeze,
      DEFAULT_IN_MEMORY_DUPLICATE_DUPLICATE_ALL = 'DUPLICATE_ALL'.freeze,
      DEFAULT_IN_MEMORY_DUPLICATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SHARED_ENUM = [
      SHARED_SHARED = 'SHARED'.freeze,
      SHARED_LOCAL_ON_LEAF = 'LOCAL_ON_LEAF'.freeze,
      SHARED_LOCAL_ON_ALL = 'LOCAL_ON_ALL'.freeze,
      SHARED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_INDEX_COMPRESSION_ENUM = [
      DEFAULT_INDEX_COMPRESSION_ENABLED = 'ENABLED'.freeze,
      DEFAULT_INDEX_COMPRESSION_DISABLED = 'DISABLED'.freeze,
      DEFAULT_INDEX_COMPRESSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INDEX_COMPRESS_FOR_ENUM = [
      INDEX_COMPRESS_FOR_ADVANCED_LOW = 'ADVANCED_LOW'.freeze,
      INDEX_COMPRESS_FOR_ADVANCED_HIGH = 'ADVANCED_HIGH'.freeze,
      INDEX_COMPRESS_FOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_IN_MEMORY_SERVICE_ENUM = [
      DEFAULT_IN_MEMORY_SERVICE_DEFAULT = 'DEFAULT'.freeze,
      DEFAULT_IN_MEMORY_SERVICE_NONE = 'NONE'.freeze,
      DEFAULT_IN_MEMORY_SERVICE_ALL = 'ALL'.freeze,
      DEFAULT_IN_MEMORY_SERVICE_USER_DEFINED = 'USER_DEFINED'.freeze,
      DEFAULT_IN_MEMORY_SERVICE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LOST_WRITE_PROTECT_ENUM = [
      LOST_WRITE_PROTECT_ENABLED = 'ENABLED'.freeze,
      LOST_WRITE_PROTECT_PROTECT_OFF = 'PROTECT_OFF'.freeze,
      LOST_WRITE_PROTECT_SUSPEND = 'SUSPEND'.freeze,
      LOST_WRITE_PROTECT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the tablespace.
    # @return [String]
    attr_accessor :name

    # **[Required]** The type of the tablespace.
    # @return [String]
    attr_reader :type

    # The status of the tablespace.
    # @return [String]
    attr_reader :status

    # The tablespace block size in bytes.
    # @return [Float]
    attr_accessor :block_size_bytes

    # The default logging attribute.
    # @return [String]
    attr_reader :logging

    # Indicates whether the tablespace is under Force Logging mode.
    # @return [BOOLEAN]
    attr_accessor :is_force_logging

    # Indicates whether the extents in the tablespace are Locally managed or Dictionary managed.
    # @return [String]
    attr_reader :extent_management

    # The type of extent allocation in effect for the tablespace.
    # @return [String]
    attr_reader :allocation_type

    # Indicates whether the tablespace is plugged in.
    # @return [BOOLEAN]
    attr_accessor :is_plugged_in

    # Indicates whether the free and used segment space in the tablespace is managed using free lists (MANUAL) or bitmaps (AUTO).
    # @return [String]
    attr_reader :segment_space_management

    # Indicates whether default table compression is enabled or disabled.
    # @return [String]
    attr_reader :default_table_compression

    # Indicates whether undo retention guarantee is enabled for the tablespace.
    # @return [String]
    attr_reader :retention

    # Indicates whether the tablespace is a Bigfile tablespace or a Smallfile tablespace.
    # @return [BOOLEAN]
    attr_accessor :is_bigfile

    # Indicates whether predicates are evaluated by Host or by Storage.
    # @return [String]
    attr_reader :predicate_evaluation

    # Indicates whether the tablespace is encrypted.
    # @return [BOOLEAN]
    attr_accessor :is_encrypted

    # The operation type for which default compression is enabled.
    # @return [String]
    attr_reader :compress_for

    # Indicates whether the In-Memory Column Store (IM column store) is by default enabled or disabled for tables in this tablespace.
    # @return [String]
    attr_reader :default_in_memory

    # Indicates the default priority for In-Memory Column Store (IM column store) population for this tablespace.
    # @return [String]
    attr_reader :default_in_memory_priority

    # Indicates how the IM column store is distributed by default for this tablespace in an Oracle Real Application Clusters (Oracle RAC) environment.
    # @return [String]
    attr_reader :default_in_memory_distribute

    # Indicates the default compression level for the IM column store for this tablespace.
    # @return [String]
    attr_reader :default_in_memory_compression

    # Indicates the duplicate setting for the IM column store in an Oracle RAC environment.
    # @return [String]
    attr_reader :default_in_memory_duplicate

    # Indicates whether the tablespace is for shared tablespace, or for local temporary tablespace for leaf (read-only) instances, or for local temporary tablespace for all instance types.
    # @return [String]
    attr_reader :shared

    # Indicates whether default index compression is enabled or disabled.
    # @return [String]
    attr_reader :default_index_compression

    # The operation type for which default index compression is enabled.
    # @return [String]
    attr_reader :index_compress_for

    # This specifies the default value for the CELLMEMORY attribute that tables created in the tablespace will inherit unless the behavior is overridden explicitly. This column is intended for use with Oracle Exadata.
    # @return [String]
    attr_accessor :default_cell_memory

    # Indicates how the IM column store is populated on various instances by default for this tablespace.
    # @return [String]
    attr_reader :default_in_memory_service

    # Indicates the service name for the service on which the IM column store should be populated by default for this tablespace. This column has a value only when the corresponding DEF_INMEMORY_SERVICE is USER_DEFINED. In all other cases, this column is null.
    # @return [String]
    attr_accessor :default_in_memory_service_name

    # The lost write protection setting for the tablespace.
    # @return [String]
    attr_reader :lost_write_protect

    # Indicates whether this is a chunk tablespace.
    # @return [BOOLEAN]
    attr_accessor :is_chunk_tablespace

    # The temporary tablespace group.
    # @return [String]
    attr_accessor :temp_group

    # The maximum tablespace size in KB. If the tablespace contains any datafiles with Autoextend enabled, then this column displays the amount of underlying free storage space for the tablespace. For example, if the current tablespace size is 1 GB, the combined maximum size of all its datafiles is 32 GB, and its underlying storage (for example, ASM or file system storage) has 20 GB of free space, then this column will have a value of approximately 20 GB. If the tablespace contains only datafiles with autoextend disabled, then this column displays the allocated space for the entire tablespace, that is, the combined size of all datafiles in the tablespace.
    # @return [Float]
    attr_accessor :max_size_kb

    # The allocated tablespace size in KB.
    # @return [Float]
    attr_accessor :allocated_size_kb

    # The size of the tablespace available for user data in KB. The difference between tablespace size and user data size is used for storing metadata.
    # @return [Float]
    attr_accessor :user_size_kb

    # The free space available in this tablespace in KB.
    # @return [Float]
    attr_accessor :free_space_kb

    # The total space used by the tablespace in KB.
    # @return [Float]
    attr_accessor :used_space_kb

    # The percentage of used space out of the maximum available space in the tablespace.
    # @return [Float]
    attr_accessor :used_percent_available

    # The percentage of used space out of the total allocated space in the tablespace.
    # @return [Float]
    attr_accessor :used_percent_allocated

    # A list of the datafiles associated with the tablespace.
    # @return [Array<OCI::DatabaseManagement::Models::Datafile>]
    attr_accessor :datafiles

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'type': :'type',
        'status': :'status',
        'block_size_bytes': :'blockSizeBytes',
        'logging': :'logging',
        'is_force_logging': :'isForceLogging',
        'extent_management': :'extentManagement',
        'allocation_type': :'allocationType',
        'is_plugged_in': :'isPluggedIn',
        'segment_space_management': :'segmentSpaceManagement',
        'default_table_compression': :'defaultTableCompression',
        'retention': :'retention',
        'is_bigfile': :'isBigfile',
        'predicate_evaluation': :'predicateEvaluation',
        'is_encrypted': :'isEncrypted',
        'compress_for': :'compressFor',
        'default_in_memory': :'defaultInMemory',
        'default_in_memory_priority': :'defaultInMemoryPriority',
        'default_in_memory_distribute': :'defaultInMemoryDistribute',
        'default_in_memory_compression': :'defaultInMemoryCompression',
        'default_in_memory_duplicate': :'defaultInMemoryDuplicate',
        'shared': :'shared',
        'default_index_compression': :'defaultIndexCompression',
        'index_compress_for': :'indexCompressFor',
        'default_cell_memory': :'defaultCellMemory',
        'default_in_memory_service': :'defaultInMemoryService',
        'default_in_memory_service_name': :'defaultInMemoryServiceName',
        'lost_write_protect': :'lostWriteProtect',
        'is_chunk_tablespace': :'isChunkTablespace',
        'temp_group': :'tempGroup',
        'max_size_kb': :'maxSizeKB',
        'allocated_size_kb': :'allocatedSizeKB',
        'user_size_kb': :'userSizeKB',
        'free_space_kb': :'freeSpaceKB',
        'used_space_kb': :'usedSpaceKB',
        'used_percent_available': :'usedPercentAvailable',
        'used_percent_allocated': :'usedPercentAllocated',
        'datafiles': :'datafiles'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'type': :'String',
        'status': :'String',
        'block_size_bytes': :'Float',
        'logging': :'String',
        'is_force_logging': :'BOOLEAN',
        'extent_management': :'String',
        'allocation_type': :'String',
        'is_plugged_in': :'BOOLEAN',
        'segment_space_management': :'String',
        'default_table_compression': :'String',
        'retention': :'String',
        'is_bigfile': :'BOOLEAN',
        'predicate_evaluation': :'String',
        'is_encrypted': :'BOOLEAN',
        'compress_for': :'String',
        'default_in_memory': :'String',
        'default_in_memory_priority': :'String',
        'default_in_memory_distribute': :'String',
        'default_in_memory_compression': :'String',
        'default_in_memory_duplicate': :'String',
        'shared': :'String',
        'default_index_compression': :'String',
        'index_compress_for': :'String',
        'default_cell_memory': :'String',
        'default_in_memory_service': :'String',
        'default_in_memory_service_name': :'String',
        'lost_write_protect': :'String',
        'is_chunk_tablespace': :'BOOLEAN',
        'temp_group': :'String',
        'max_size_kb': :'Float',
        'allocated_size_kb': :'Float',
        'user_size_kb': :'Float',
        'free_space_kb': :'Float',
        'used_space_kb': :'Float',
        'used_percent_available': :'Float',
        'used_percent_allocated': :'Float',
        'datafiles': :'Array<OCI::DatabaseManagement::Models::Datafile>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Float] :block_size_bytes The value to assign to the {#block_size_bytes} property
    # @option attributes [String] :logging The value to assign to the {#logging} property
    # @option attributes [BOOLEAN] :is_force_logging The value to assign to the {#is_force_logging} property
    # @option attributes [String] :extent_management The value to assign to the {#extent_management} property
    # @option attributes [String] :allocation_type The value to assign to the {#allocation_type} property
    # @option attributes [BOOLEAN] :is_plugged_in The value to assign to the {#is_plugged_in} property
    # @option attributes [String] :segment_space_management The value to assign to the {#segment_space_management} property
    # @option attributes [String] :default_table_compression The value to assign to the {#default_table_compression} property
    # @option attributes [String] :retention The value to assign to the {#retention} property
    # @option attributes [BOOLEAN] :is_bigfile The value to assign to the {#is_bigfile} property
    # @option attributes [String] :predicate_evaluation The value to assign to the {#predicate_evaluation} property
    # @option attributes [BOOLEAN] :is_encrypted The value to assign to the {#is_encrypted} property
    # @option attributes [String] :compress_for The value to assign to the {#compress_for} property
    # @option attributes [String] :default_in_memory The value to assign to the {#default_in_memory} property
    # @option attributes [String] :default_in_memory_priority The value to assign to the {#default_in_memory_priority} property
    # @option attributes [String] :default_in_memory_distribute The value to assign to the {#default_in_memory_distribute} property
    # @option attributes [String] :default_in_memory_compression The value to assign to the {#default_in_memory_compression} property
    # @option attributes [String] :default_in_memory_duplicate The value to assign to the {#default_in_memory_duplicate} property
    # @option attributes [String] :shared The value to assign to the {#shared} property
    # @option attributes [String] :default_index_compression The value to assign to the {#default_index_compression} property
    # @option attributes [String] :index_compress_for The value to assign to the {#index_compress_for} property
    # @option attributes [String] :default_cell_memory The value to assign to the {#default_cell_memory} property
    # @option attributes [String] :default_in_memory_service The value to assign to the {#default_in_memory_service} property
    # @option attributes [String] :default_in_memory_service_name The value to assign to the {#default_in_memory_service_name} property
    # @option attributes [String] :lost_write_protect The value to assign to the {#lost_write_protect} property
    # @option attributes [BOOLEAN] :is_chunk_tablespace The value to assign to the {#is_chunk_tablespace} property
    # @option attributes [String] :temp_group The value to assign to the {#temp_group} property
    # @option attributes [Float] :max_size_kb The value to assign to the {#max_size_kb} property
    # @option attributes [Float] :allocated_size_kb The value to assign to the {#allocated_size_kb} property
    # @option attributes [Float] :user_size_kb The value to assign to the {#user_size_kb} property
    # @option attributes [Float] :free_space_kb The value to assign to the {#free_space_kb} property
    # @option attributes [Float] :used_space_kb The value to assign to the {#used_space_kb} property
    # @option attributes [Float] :used_percent_available The value to assign to the {#used_percent_available} property
    # @option attributes [Float] :used_percent_allocated The value to assign to the {#used_percent_allocated} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::Datafile>] :datafiles The value to assign to the {#datafiles} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.status = attributes[:'status'] if attributes[:'status']

      self.block_size_bytes = attributes[:'blockSizeBytes'] if attributes[:'blockSizeBytes']

      raise 'You cannot provide both :blockSizeBytes and :block_size_bytes' if attributes.key?(:'blockSizeBytes') && attributes.key?(:'block_size_bytes')

      self.block_size_bytes = attributes[:'block_size_bytes'] if attributes[:'block_size_bytes']

      self.logging = attributes[:'logging'] if attributes[:'logging']

      self.is_force_logging = attributes[:'isForceLogging'] unless attributes[:'isForceLogging'].nil?

      raise 'You cannot provide both :isForceLogging and :is_force_logging' if attributes.key?(:'isForceLogging') && attributes.key?(:'is_force_logging')

      self.is_force_logging = attributes[:'is_force_logging'] unless attributes[:'is_force_logging'].nil?

      self.extent_management = attributes[:'extentManagement'] if attributes[:'extentManagement']

      raise 'You cannot provide both :extentManagement and :extent_management' if attributes.key?(:'extentManagement') && attributes.key?(:'extent_management')

      self.extent_management = attributes[:'extent_management'] if attributes[:'extent_management']

      self.allocation_type = attributes[:'allocationType'] if attributes[:'allocationType']

      raise 'You cannot provide both :allocationType and :allocation_type' if attributes.key?(:'allocationType') && attributes.key?(:'allocation_type')

      self.allocation_type = attributes[:'allocation_type'] if attributes[:'allocation_type']

      self.is_plugged_in = attributes[:'isPluggedIn'] unless attributes[:'isPluggedIn'].nil?

      raise 'You cannot provide both :isPluggedIn and :is_plugged_in' if attributes.key?(:'isPluggedIn') && attributes.key?(:'is_plugged_in')

      self.is_plugged_in = attributes[:'is_plugged_in'] unless attributes[:'is_plugged_in'].nil?

      self.segment_space_management = attributes[:'segmentSpaceManagement'] if attributes[:'segmentSpaceManagement']

      raise 'You cannot provide both :segmentSpaceManagement and :segment_space_management' if attributes.key?(:'segmentSpaceManagement') && attributes.key?(:'segment_space_management')

      self.segment_space_management = attributes[:'segment_space_management'] if attributes[:'segment_space_management']

      self.default_table_compression = attributes[:'defaultTableCompression'] if attributes[:'defaultTableCompression']

      raise 'You cannot provide both :defaultTableCompression and :default_table_compression' if attributes.key?(:'defaultTableCompression') && attributes.key?(:'default_table_compression')

      self.default_table_compression = attributes[:'default_table_compression'] if attributes[:'default_table_compression']

      self.retention = attributes[:'retention'] if attributes[:'retention']

      self.is_bigfile = attributes[:'isBigfile'] unless attributes[:'isBigfile'].nil?

      raise 'You cannot provide both :isBigfile and :is_bigfile' if attributes.key?(:'isBigfile') && attributes.key?(:'is_bigfile')

      self.is_bigfile = attributes[:'is_bigfile'] unless attributes[:'is_bigfile'].nil?

      self.predicate_evaluation = attributes[:'predicateEvaluation'] if attributes[:'predicateEvaluation']

      raise 'You cannot provide both :predicateEvaluation and :predicate_evaluation' if attributes.key?(:'predicateEvaluation') && attributes.key?(:'predicate_evaluation')

      self.predicate_evaluation = attributes[:'predicate_evaluation'] if attributes[:'predicate_evaluation']

      self.is_encrypted = attributes[:'isEncrypted'] unless attributes[:'isEncrypted'].nil?

      raise 'You cannot provide both :isEncrypted and :is_encrypted' if attributes.key?(:'isEncrypted') && attributes.key?(:'is_encrypted')

      self.is_encrypted = attributes[:'is_encrypted'] unless attributes[:'is_encrypted'].nil?

      self.compress_for = attributes[:'compressFor'] if attributes[:'compressFor']

      raise 'You cannot provide both :compressFor and :compress_for' if attributes.key?(:'compressFor') && attributes.key?(:'compress_for')

      self.compress_for = attributes[:'compress_for'] if attributes[:'compress_for']

      self.default_in_memory = attributes[:'defaultInMemory'] if attributes[:'defaultInMemory']

      raise 'You cannot provide both :defaultInMemory and :default_in_memory' if attributes.key?(:'defaultInMemory') && attributes.key?(:'default_in_memory')

      self.default_in_memory = attributes[:'default_in_memory'] if attributes[:'default_in_memory']

      self.default_in_memory_priority = attributes[:'defaultInMemoryPriority'] if attributes[:'defaultInMemoryPriority']

      raise 'You cannot provide both :defaultInMemoryPriority and :default_in_memory_priority' if attributes.key?(:'defaultInMemoryPriority') && attributes.key?(:'default_in_memory_priority')

      self.default_in_memory_priority = attributes[:'default_in_memory_priority'] if attributes[:'default_in_memory_priority']

      self.default_in_memory_distribute = attributes[:'defaultInMemoryDistribute'] if attributes[:'defaultInMemoryDistribute']

      raise 'You cannot provide both :defaultInMemoryDistribute and :default_in_memory_distribute' if attributes.key?(:'defaultInMemoryDistribute') && attributes.key?(:'default_in_memory_distribute')

      self.default_in_memory_distribute = attributes[:'default_in_memory_distribute'] if attributes[:'default_in_memory_distribute']

      self.default_in_memory_compression = attributes[:'defaultInMemoryCompression'] if attributes[:'defaultInMemoryCompression']

      raise 'You cannot provide both :defaultInMemoryCompression and :default_in_memory_compression' if attributes.key?(:'defaultInMemoryCompression') && attributes.key?(:'default_in_memory_compression')

      self.default_in_memory_compression = attributes[:'default_in_memory_compression'] if attributes[:'default_in_memory_compression']

      self.default_in_memory_duplicate = attributes[:'defaultInMemoryDuplicate'] if attributes[:'defaultInMemoryDuplicate']

      raise 'You cannot provide both :defaultInMemoryDuplicate and :default_in_memory_duplicate' if attributes.key?(:'defaultInMemoryDuplicate') && attributes.key?(:'default_in_memory_duplicate')

      self.default_in_memory_duplicate = attributes[:'default_in_memory_duplicate'] if attributes[:'default_in_memory_duplicate']

      self.shared = attributes[:'shared'] if attributes[:'shared']

      self.default_index_compression = attributes[:'defaultIndexCompression'] if attributes[:'defaultIndexCompression']

      raise 'You cannot provide both :defaultIndexCompression and :default_index_compression' if attributes.key?(:'defaultIndexCompression') && attributes.key?(:'default_index_compression')

      self.default_index_compression = attributes[:'default_index_compression'] if attributes[:'default_index_compression']

      self.index_compress_for = attributes[:'indexCompressFor'] if attributes[:'indexCompressFor']

      raise 'You cannot provide both :indexCompressFor and :index_compress_for' if attributes.key?(:'indexCompressFor') && attributes.key?(:'index_compress_for')

      self.index_compress_for = attributes[:'index_compress_for'] if attributes[:'index_compress_for']

      self.default_cell_memory = attributes[:'defaultCellMemory'] if attributes[:'defaultCellMemory']

      raise 'You cannot provide both :defaultCellMemory and :default_cell_memory' if attributes.key?(:'defaultCellMemory') && attributes.key?(:'default_cell_memory')

      self.default_cell_memory = attributes[:'default_cell_memory'] if attributes[:'default_cell_memory']

      self.default_in_memory_service = attributes[:'defaultInMemoryService'] if attributes[:'defaultInMemoryService']

      raise 'You cannot provide both :defaultInMemoryService and :default_in_memory_service' if attributes.key?(:'defaultInMemoryService') && attributes.key?(:'default_in_memory_service')

      self.default_in_memory_service = attributes[:'default_in_memory_service'] if attributes[:'default_in_memory_service']

      self.default_in_memory_service_name = attributes[:'defaultInMemoryServiceName'] if attributes[:'defaultInMemoryServiceName']

      raise 'You cannot provide both :defaultInMemoryServiceName and :default_in_memory_service_name' if attributes.key?(:'defaultInMemoryServiceName') && attributes.key?(:'default_in_memory_service_name')

      self.default_in_memory_service_name = attributes[:'default_in_memory_service_name'] if attributes[:'default_in_memory_service_name']

      self.lost_write_protect = attributes[:'lostWriteProtect'] if attributes[:'lostWriteProtect']

      raise 'You cannot provide both :lostWriteProtect and :lost_write_protect' if attributes.key?(:'lostWriteProtect') && attributes.key?(:'lost_write_protect')

      self.lost_write_protect = attributes[:'lost_write_protect'] if attributes[:'lost_write_protect']

      self.is_chunk_tablespace = attributes[:'isChunkTablespace'] unless attributes[:'isChunkTablespace'].nil?

      raise 'You cannot provide both :isChunkTablespace and :is_chunk_tablespace' if attributes.key?(:'isChunkTablespace') && attributes.key?(:'is_chunk_tablespace')

      self.is_chunk_tablespace = attributes[:'is_chunk_tablespace'] unless attributes[:'is_chunk_tablespace'].nil?

      self.temp_group = attributes[:'tempGroup'] if attributes[:'tempGroup']

      raise 'You cannot provide both :tempGroup and :temp_group' if attributes.key?(:'tempGroup') && attributes.key?(:'temp_group')

      self.temp_group = attributes[:'temp_group'] if attributes[:'temp_group']

      self.max_size_kb = attributes[:'maxSizeKB'] if attributes[:'maxSizeKB']

      raise 'You cannot provide both :maxSizeKB and :max_size_kb' if attributes.key?(:'maxSizeKB') && attributes.key?(:'max_size_kb')

      self.max_size_kb = attributes[:'max_size_kb'] if attributes[:'max_size_kb']

      self.allocated_size_kb = attributes[:'allocatedSizeKB'] if attributes[:'allocatedSizeKB']

      raise 'You cannot provide both :allocatedSizeKB and :allocated_size_kb' if attributes.key?(:'allocatedSizeKB') && attributes.key?(:'allocated_size_kb')

      self.allocated_size_kb = attributes[:'allocated_size_kb'] if attributes[:'allocated_size_kb']

      self.user_size_kb = attributes[:'userSizeKB'] if attributes[:'userSizeKB']

      raise 'You cannot provide both :userSizeKB and :user_size_kb' if attributes.key?(:'userSizeKB') && attributes.key?(:'user_size_kb')

      self.user_size_kb = attributes[:'user_size_kb'] if attributes[:'user_size_kb']

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

      self.datafiles = attributes[:'datafiles'] if attributes[:'datafiles']
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
    # @param [Object] logging Object to be assigned
    def logging=(logging)
      # rubocop:disable Style/ConditionalAssignment
      if logging && !LOGGING_ENUM.include?(logging)
        OCI.logger.debug("Unknown value for 'logging' [" + logging + "]. Mapping to 'LOGGING_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @logging = LOGGING_UNKNOWN_ENUM_VALUE
      else
        @logging = logging
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] extent_management Object to be assigned
    def extent_management=(extent_management)
      # rubocop:disable Style/ConditionalAssignment
      if extent_management && !EXTENT_MANAGEMENT_ENUM.include?(extent_management)
        OCI.logger.debug("Unknown value for 'extent_management' [" + extent_management + "]. Mapping to 'EXTENT_MANAGEMENT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @extent_management = EXTENT_MANAGEMENT_UNKNOWN_ENUM_VALUE
      else
        @extent_management = extent_management
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] allocation_type Object to be assigned
    def allocation_type=(allocation_type)
      # rubocop:disable Style/ConditionalAssignment
      if allocation_type && !ALLOCATION_TYPE_ENUM.include?(allocation_type)
        OCI.logger.debug("Unknown value for 'allocation_type' [" + allocation_type + "]. Mapping to 'ALLOCATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @allocation_type = ALLOCATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @allocation_type = allocation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] segment_space_management Object to be assigned
    def segment_space_management=(segment_space_management)
      # rubocop:disable Style/ConditionalAssignment
      if segment_space_management && !SEGMENT_SPACE_MANAGEMENT_ENUM.include?(segment_space_management)
        OCI.logger.debug("Unknown value for 'segment_space_management' [" + segment_space_management + "]. Mapping to 'SEGMENT_SPACE_MANAGEMENT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @segment_space_management = SEGMENT_SPACE_MANAGEMENT_UNKNOWN_ENUM_VALUE
      else
        @segment_space_management = segment_space_management
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_table_compression Object to be assigned
    def default_table_compression=(default_table_compression)
      # rubocop:disable Style/ConditionalAssignment
      if default_table_compression && !DEFAULT_TABLE_COMPRESSION_ENUM.include?(default_table_compression)
        OCI.logger.debug("Unknown value for 'default_table_compression' [" + default_table_compression + "]. Mapping to 'DEFAULT_TABLE_COMPRESSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_table_compression = DEFAULT_TABLE_COMPRESSION_UNKNOWN_ENUM_VALUE
      else
        @default_table_compression = default_table_compression
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] retention Object to be assigned
    def retention=(retention)
      # rubocop:disable Style/ConditionalAssignment
      if retention && !RETENTION_ENUM.include?(retention)
        OCI.logger.debug("Unknown value for 'retention' [" + retention + "]. Mapping to 'RETENTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @retention = RETENTION_UNKNOWN_ENUM_VALUE
      else
        @retention = retention
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] predicate_evaluation Object to be assigned
    def predicate_evaluation=(predicate_evaluation)
      # rubocop:disable Style/ConditionalAssignment
      if predicate_evaluation && !PREDICATE_EVALUATION_ENUM.include?(predicate_evaluation)
        OCI.logger.debug("Unknown value for 'predicate_evaluation' [" + predicate_evaluation + "]. Mapping to 'PREDICATE_EVALUATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @predicate_evaluation = PREDICATE_EVALUATION_UNKNOWN_ENUM_VALUE
      else
        @predicate_evaluation = predicate_evaluation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] compress_for Object to be assigned
    def compress_for=(compress_for)
      # rubocop:disable Style/ConditionalAssignment
      if compress_for && !COMPRESS_FOR_ENUM.include?(compress_for)
        OCI.logger.debug("Unknown value for 'compress_for' [" + compress_for + "]. Mapping to 'COMPRESS_FOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @compress_for = COMPRESS_FOR_UNKNOWN_ENUM_VALUE
      else
        @compress_for = compress_for
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_in_memory Object to be assigned
    def default_in_memory=(default_in_memory)
      # rubocop:disable Style/ConditionalAssignment
      if default_in_memory && !DEFAULT_IN_MEMORY_ENUM.include?(default_in_memory)
        OCI.logger.debug("Unknown value for 'default_in_memory' [" + default_in_memory + "]. Mapping to 'DEFAULT_IN_MEMORY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_in_memory = DEFAULT_IN_MEMORY_UNKNOWN_ENUM_VALUE
      else
        @default_in_memory = default_in_memory
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_in_memory_priority Object to be assigned
    def default_in_memory_priority=(default_in_memory_priority)
      # rubocop:disable Style/ConditionalAssignment
      if default_in_memory_priority && !DEFAULT_IN_MEMORY_PRIORITY_ENUM.include?(default_in_memory_priority)
        OCI.logger.debug("Unknown value for 'default_in_memory_priority' [" + default_in_memory_priority + "]. Mapping to 'DEFAULT_IN_MEMORY_PRIORITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_in_memory_priority = DEFAULT_IN_MEMORY_PRIORITY_UNKNOWN_ENUM_VALUE
      else
        @default_in_memory_priority = default_in_memory_priority
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_in_memory_distribute Object to be assigned
    def default_in_memory_distribute=(default_in_memory_distribute)
      # rubocop:disable Style/ConditionalAssignment
      if default_in_memory_distribute && !DEFAULT_IN_MEMORY_DISTRIBUTE_ENUM.include?(default_in_memory_distribute)
        OCI.logger.debug("Unknown value for 'default_in_memory_distribute' [" + default_in_memory_distribute + "]. Mapping to 'DEFAULT_IN_MEMORY_DISTRIBUTE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_in_memory_distribute = DEFAULT_IN_MEMORY_DISTRIBUTE_UNKNOWN_ENUM_VALUE
      else
        @default_in_memory_distribute = default_in_memory_distribute
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_in_memory_compression Object to be assigned
    def default_in_memory_compression=(default_in_memory_compression)
      # rubocop:disable Style/ConditionalAssignment
      if default_in_memory_compression && !DEFAULT_IN_MEMORY_COMPRESSION_ENUM.include?(default_in_memory_compression)
        OCI.logger.debug("Unknown value for 'default_in_memory_compression' [" + default_in_memory_compression + "]. Mapping to 'DEFAULT_IN_MEMORY_COMPRESSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_in_memory_compression = DEFAULT_IN_MEMORY_COMPRESSION_UNKNOWN_ENUM_VALUE
      else
        @default_in_memory_compression = default_in_memory_compression
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_in_memory_duplicate Object to be assigned
    def default_in_memory_duplicate=(default_in_memory_duplicate)
      # rubocop:disable Style/ConditionalAssignment
      if default_in_memory_duplicate && !DEFAULT_IN_MEMORY_DUPLICATE_ENUM.include?(default_in_memory_duplicate)
        OCI.logger.debug("Unknown value for 'default_in_memory_duplicate' [" + default_in_memory_duplicate + "]. Mapping to 'DEFAULT_IN_MEMORY_DUPLICATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_in_memory_duplicate = DEFAULT_IN_MEMORY_DUPLICATE_UNKNOWN_ENUM_VALUE
      else
        @default_in_memory_duplicate = default_in_memory_duplicate
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_index_compression Object to be assigned
    def default_index_compression=(default_index_compression)
      # rubocop:disable Style/ConditionalAssignment
      if default_index_compression && !DEFAULT_INDEX_COMPRESSION_ENUM.include?(default_index_compression)
        OCI.logger.debug("Unknown value for 'default_index_compression' [" + default_index_compression + "]. Mapping to 'DEFAULT_INDEX_COMPRESSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_index_compression = DEFAULT_INDEX_COMPRESSION_UNKNOWN_ENUM_VALUE
      else
        @default_index_compression = default_index_compression
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] index_compress_for Object to be assigned
    def index_compress_for=(index_compress_for)
      # rubocop:disable Style/ConditionalAssignment
      if index_compress_for && !INDEX_COMPRESS_FOR_ENUM.include?(index_compress_for)
        OCI.logger.debug("Unknown value for 'index_compress_for' [" + index_compress_for + "]. Mapping to 'INDEX_COMPRESS_FOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @index_compress_for = INDEX_COMPRESS_FOR_UNKNOWN_ENUM_VALUE
      else
        @index_compress_for = index_compress_for
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_in_memory_service Object to be assigned
    def default_in_memory_service=(default_in_memory_service)
      # rubocop:disable Style/ConditionalAssignment
      if default_in_memory_service && !DEFAULT_IN_MEMORY_SERVICE_ENUM.include?(default_in_memory_service)
        OCI.logger.debug("Unknown value for 'default_in_memory_service' [" + default_in_memory_service + "]. Mapping to 'DEFAULT_IN_MEMORY_SERVICE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_in_memory_service = DEFAULT_IN_MEMORY_SERVICE_UNKNOWN_ENUM_VALUE
      else
        @default_in_memory_service = default_in_memory_service
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        type == other.type &&
        status == other.status &&
        block_size_bytes == other.block_size_bytes &&
        logging == other.logging &&
        is_force_logging == other.is_force_logging &&
        extent_management == other.extent_management &&
        allocation_type == other.allocation_type &&
        is_plugged_in == other.is_plugged_in &&
        segment_space_management == other.segment_space_management &&
        default_table_compression == other.default_table_compression &&
        retention == other.retention &&
        is_bigfile == other.is_bigfile &&
        predicate_evaluation == other.predicate_evaluation &&
        is_encrypted == other.is_encrypted &&
        compress_for == other.compress_for &&
        default_in_memory == other.default_in_memory &&
        default_in_memory_priority == other.default_in_memory_priority &&
        default_in_memory_distribute == other.default_in_memory_distribute &&
        default_in_memory_compression == other.default_in_memory_compression &&
        default_in_memory_duplicate == other.default_in_memory_duplicate &&
        shared == other.shared &&
        default_index_compression == other.default_index_compression &&
        index_compress_for == other.index_compress_for &&
        default_cell_memory == other.default_cell_memory &&
        default_in_memory_service == other.default_in_memory_service &&
        default_in_memory_service_name == other.default_in_memory_service_name &&
        lost_write_protect == other.lost_write_protect &&
        is_chunk_tablespace == other.is_chunk_tablespace &&
        temp_group == other.temp_group &&
        max_size_kb == other.max_size_kb &&
        allocated_size_kb == other.allocated_size_kb &&
        user_size_kb == other.user_size_kb &&
        free_space_kb == other.free_space_kb &&
        used_space_kb == other.used_space_kb &&
        used_percent_available == other.used_percent_available &&
        used_percent_allocated == other.used_percent_allocated &&
        datafiles == other.datafiles
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
      [name, type, status, block_size_bytes, logging, is_force_logging, extent_management, allocation_type, is_plugged_in, segment_space_management, default_table_compression, retention, is_bigfile, predicate_evaluation, is_encrypted, compress_for, default_in_memory, default_in_memory_priority, default_in_memory_distribute, default_in_memory_compression, default_in_memory_duplicate, shared, default_index_compression, index_compress_for, default_cell_memory, default_in_memory_service, default_in_memory_service_name, lost_write_protect, is_chunk_tablespace, temp_group, max_size_kb, allocated_size_kb, user_size_kb, free_space_kb, used_space_kb, used_percent_available, used_percent_allocated, datafiles].hash
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
