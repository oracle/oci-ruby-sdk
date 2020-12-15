# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # User controllable service variables.
  class Mysql::Models::ConfigurationVariables
    COMPLETION_TYPE_ENUM = [
      COMPLETION_TYPE_NO_CHAIN = 'NO_CHAIN'.freeze,
      COMPLETION_TYPE_CHAIN = 'CHAIN'.freeze,
      COMPLETION_TYPE_RELEASE = 'RELEASE'.freeze,
      COMPLETION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_AUTHENTICATION_PLUGIN_ENUM = [
      DEFAULT_AUTHENTICATION_PLUGIN_MYSQL_NATIVE_PASSWORD = 'mysql_native_password'.freeze,
      DEFAULT_AUTHENTICATION_PLUGIN_SHA256_PASSWORD = 'sha256_password'.freeze,
      DEFAULT_AUTHENTICATION_PLUGIN_CACHING_SHA2_PASSWORD = 'caching_sha2_password'.freeze,
      DEFAULT_AUTHENTICATION_PLUGIN_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRANSACTION_ISOLATION_ENUM = [
      TRANSACTION_ISOLATION_READ_UNCOMMITTED = 'READ-UNCOMMITTED'.freeze,
      TRANSACTION_ISOLATION_READ_COMMITED = 'READ-COMMITED'.freeze,
      TRANSACTION_ISOLATION_READ_COMMITTED = 'READ-COMMITTED'.freeze,
      TRANSACTION_ISOLATION_REPEATABLE_READ = 'REPEATABLE-READ'.freeze,
      TRANSACTION_ISOLATION_SERIALIZABLE = 'SERIALIZABLE'.freeze,
      TRANSACTION_ISOLATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # (\"completion_type\")
    # @return [String]
    attr_reader :completion_type

    # (\"default_authentication_plugin\")
    # @return [String]
    attr_reader :default_authentication_plugin

    # (\"transaction_isolation\")
    # @return [String]
    attr_reader :transaction_isolation

    # (\"innodb_ft_server_stopword_table\")
    # @return [String]
    attr_accessor :innodb_ft_server_stopword_table

    # (\"mandatory_roles\")
    # @return [String]
    attr_accessor :mandatory_roles

    # (\"autocommit\")
    # @return [BOOLEAN]
    attr_accessor :autocommit

    # (\"foreign_key_checks\")
    # @return [BOOLEAN]
    attr_accessor :foreign_key_checks

    # (\"innodb_ft_enable_stopword\")
    # @return [BOOLEAN]
    attr_accessor :innodb_ft_enable_stopword

    # (\"local_infile\")
    # @return [BOOLEAN]
    attr_accessor :local_infile

    # (\"mysql_firewall_mode\")
    # @return [BOOLEAN]
    attr_accessor :mysql_firewall_mode

    # (\"mysqlx_enable_hello_notice\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [BOOLEAN]
    attr_accessor :mysqlx_enable_hello_notice

    # (\"sql_require_primary_key\")
    # @return [BOOLEAN]
    attr_accessor :sql_require_primary_key

    # (\"sql_warnings\")
    # @return [BOOLEAN]
    attr_accessor :sql_warnings

    # (\"binlog_expire_logs_seconds\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :binlog_expire_logs_seconds

    # (\"innodb_buffer_pool_size\")
    # @return [Integer]
    attr_accessor :innodb_buffer_pool_size

    # (\"innodb_ft_result_cache_limit\")
    # @return [Integer]
    attr_accessor :innodb_ft_result_cache_limit

    # (\"max_connections\")
    # @return [Integer]
    attr_accessor :max_connections

    # (\"max_prepared_stmt_count\")
    # @return [Integer]
    attr_accessor :max_prepared_stmt_count

    # (\"connect_timeout\")
    # @return [Integer]
    attr_accessor :connect_timeout

    # (\"cte_max_recursion_depth\")
    # @return [Integer]
    attr_accessor :cte_max_recursion_depth

    # (\"generated_random_password_length\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :generated_random_password_length

    # (\"information_schema_stats_expiry\")
    # @return [Integer]
    attr_accessor :information_schema_stats_expiry

    # (\"innodb_buffer_pool_instances\")
    # @return [Integer]
    attr_accessor :innodb_buffer_pool_instances

    # (\"innodb_ft_max_token_size\")
    # @return [Integer]
    attr_accessor :innodb_ft_max_token_size

    # (\"innodb_ft_min_token_size\")
    # @return [Integer]
    attr_accessor :innodb_ft_min_token_size

    # (\"innodb_ft_num_word_optimize\")
    # @return [Integer]
    attr_accessor :innodb_ft_num_word_optimize

    # (\"innodb_lock_wait_timeout\")
    # @return [Integer]
    attr_accessor :innodb_lock_wait_timeout

    # (\"innodb_max_purge_lag\")
    # @return [Integer]
    attr_accessor :innodb_max_purge_lag

    # (\"innodb_max_purge_lag_delay\")
    # @return [Integer]
    attr_accessor :innodb_max_purge_lag_delay

    # (\"max_execution_time\")
    # @return [Integer]
    attr_accessor :max_execution_time

    # (\"mysqlx_connect_timeout\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_connect_timeout

    # (\"mysqlx_document_id_unique_prefix\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_document_id_unique_prefix

    # (\"mysqlx_idle_worker_thread_timeout\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_idle_worker_thread_timeout

    # (\"mysqlx_interactive_timeout\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_interactive_timeout

    # (\"mysqlx_max_allowed_packet\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_max_allowed_packet

    # (\"mysqlx_min_worker_threads\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_min_worker_threads

    # (\"mysqlx_read_timeout\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_read_timeout

    # (\"mysqlx_wait_timeout\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_wait_timeout

    # (\"mysqlx_write_timeout\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :mysqlx_write_timeout

    # (\"parser_max_mem_size\")
    # @return [Integer]
    attr_accessor :parser_max_mem_size

    # (\"query_alloc_block_size\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :query_alloc_block_size

    # (\"query_prealloc_size\") DEPRECATED -- variable should not be settable and will be ignored
    # @return [Integer]
    attr_accessor :query_prealloc_size

    # (\"sql_mode\")
    # @return [String]
    attr_accessor :sql_mode

    # Set the default compression level for the deflate algorithm. (\"mysqlx_deflate_default_compression_level\")
    # @return [Integer]
    attr_accessor :mysqlx_deflate_default_compression_level

    # Limit the upper bound of accepted compression levels for the deflate algorithm. (\"mysqlx_deflate_max_client_compression_level\")
    # @return [Integer]
    attr_accessor :mysqlx_deflate_max_client_compression_level

    # Limit the upper bound of accepted compression levels for the lz4 algorithm. (\"mysqlx_lz4_max_client_compression_level\")
    # @return [Integer]
    attr_accessor :mysqlx_lz4_max_client_compression_level

    # Set the default compression level for the lz4 algorithm. (\"mysqlx_lz4_default_compression_level\")
    # @return [Integer]
    attr_accessor :mysqlx_lz4_default_compression_level

    # Limit the upper bound of accepted compression levels for the zstd algorithm. (\"mysqlx_zstd_max_client_compression_level\")
    # @return [Integer]
    attr_accessor :mysqlx_zstd_max_client_compression_level

    # Set the default compression level for the zstd algorithm. (\"mysqlx_zstd_default_compression_level\")
    # @return [Integer]
    attr_accessor :mysqlx_zstd_default_compression_level

    # DEPRECATED -- typo of mysqlx_zstd_default_compression_level. variable will be ignored.
    # @return [Integer]
    attr_accessor :mysql_zstd_default_compression_level

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'completion_type': :'completionType',
        'default_authentication_plugin': :'defaultAuthenticationPlugin',
        'transaction_isolation': :'transactionIsolation',
        'innodb_ft_server_stopword_table': :'innodbFtServerStopwordTable',
        'mandatory_roles': :'mandatoryRoles',
        'autocommit': :'autocommit',
        'foreign_key_checks': :'foreignKeyChecks',
        'innodb_ft_enable_stopword': :'innodbFtEnableStopword',
        'local_infile': :'localInfile',
        'mysql_firewall_mode': :'mysqlFirewallMode',
        'mysqlx_enable_hello_notice': :'mysqlxEnableHelloNotice',
        'sql_require_primary_key': :'sqlRequirePrimaryKey',
        'sql_warnings': :'sqlWarnings',
        'binlog_expire_logs_seconds': :'binlogExpireLogsSeconds',
        'innodb_buffer_pool_size': :'innodbBufferPoolSize',
        'innodb_ft_result_cache_limit': :'innodbFtResultCacheLimit',
        'max_connections': :'maxConnections',
        'max_prepared_stmt_count': :'maxPreparedStmtCount',
        'connect_timeout': :'connectTimeout',
        'cte_max_recursion_depth': :'cteMaxRecursionDepth',
        'generated_random_password_length': :'generatedRandomPasswordLength',
        'information_schema_stats_expiry': :'informationSchemaStatsExpiry',
        'innodb_buffer_pool_instances': :'innodbBufferPoolInstances',
        'innodb_ft_max_token_size': :'innodbFtMaxTokenSize',
        'innodb_ft_min_token_size': :'innodbFtMinTokenSize',
        'innodb_ft_num_word_optimize': :'innodbFtNumWordOptimize',
        'innodb_lock_wait_timeout': :'innodbLockWaitTimeout',
        'innodb_max_purge_lag': :'innodbMaxPurgeLag',
        'innodb_max_purge_lag_delay': :'innodbMaxPurgeLagDelay',
        'max_execution_time': :'maxExecutionTime',
        'mysqlx_connect_timeout': :'mysqlxConnectTimeout',
        'mysqlx_document_id_unique_prefix': :'mysqlxDocumentIdUniquePrefix',
        'mysqlx_idle_worker_thread_timeout': :'mysqlxIdleWorkerThreadTimeout',
        'mysqlx_interactive_timeout': :'mysqlxInteractiveTimeout',
        'mysqlx_max_allowed_packet': :'mysqlxMaxAllowedPacket',
        'mysqlx_min_worker_threads': :'mysqlxMinWorkerThreads',
        'mysqlx_read_timeout': :'mysqlxReadTimeout',
        'mysqlx_wait_timeout': :'mysqlxWaitTimeout',
        'mysqlx_write_timeout': :'mysqlxWriteTimeout',
        'parser_max_mem_size': :'parserMaxMemSize',
        'query_alloc_block_size': :'queryAllocBlockSize',
        'query_prealloc_size': :'queryPreallocSize',
        'sql_mode': :'sqlMode',
        'mysqlx_deflate_default_compression_level': :'mysqlxDeflateDefaultCompressionLevel',
        'mysqlx_deflate_max_client_compression_level': :'mysqlxDeflateMaxClientCompressionLevel',
        'mysqlx_lz4_max_client_compression_level': :'mysqlxLz4MaxClientCompressionLevel',
        'mysqlx_lz4_default_compression_level': :'mysqlxLz4DefaultCompressionLevel',
        'mysqlx_zstd_max_client_compression_level': :'mysqlxZstdMaxClientCompressionLevel',
        'mysqlx_zstd_default_compression_level': :'mysqlxZstdDefaultCompressionLevel',
        'mysql_zstd_default_compression_level': :'mysqlZstdDefaultCompressionLevel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'completion_type': :'String',
        'default_authentication_plugin': :'String',
        'transaction_isolation': :'String',
        'innodb_ft_server_stopword_table': :'String',
        'mandatory_roles': :'String',
        'autocommit': :'BOOLEAN',
        'foreign_key_checks': :'BOOLEAN',
        'innodb_ft_enable_stopword': :'BOOLEAN',
        'local_infile': :'BOOLEAN',
        'mysql_firewall_mode': :'BOOLEAN',
        'mysqlx_enable_hello_notice': :'BOOLEAN',
        'sql_require_primary_key': :'BOOLEAN',
        'sql_warnings': :'BOOLEAN',
        'binlog_expire_logs_seconds': :'Integer',
        'innodb_buffer_pool_size': :'Integer',
        'innodb_ft_result_cache_limit': :'Integer',
        'max_connections': :'Integer',
        'max_prepared_stmt_count': :'Integer',
        'connect_timeout': :'Integer',
        'cte_max_recursion_depth': :'Integer',
        'generated_random_password_length': :'Integer',
        'information_schema_stats_expiry': :'Integer',
        'innodb_buffer_pool_instances': :'Integer',
        'innodb_ft_max_token_size': :'Integer',
        'innodb_ft_min_token_size': :'Integer',
        'innodb_ft_num_word_optimize': :'Integer',
        'innodb_lock_wait_timeout': :'Integer',
        'innodb_max_purge_lag': :'Integer',
        'innodb_max_purge_lag_delay': :'Integer',
        'max_execution_time': :'Integer',
        'mysqlx_connect_timeout': :'Integer',
        'mysqlx_document_id_unique_prefix': :'Integer',
        'mysqlx_idle_worker_thread_timeout': :'Integer',
        'mysqlx_interactive_timeout': :'Integer',
        'mysqlx_max_allowed_packet': :'Integer',
        'mysqlx_min_worker_threads': :'Integer',
        'mysqlx_read_timeout': :'Integer',
        'mysqlx_wait_timeout': :'Integer',
        'mysqlx_write_timeout': :'Integer',
        'parser_max_mem_size': :'Integer',
        'query_alloc_block_size': :'Integer',
        'query_prealloc_size': :'Integer',
        'sql_mode': :'String',
        'mysqlx_deflate_default_compression_level': :'Integer',
        'mysqlx_deflate_max_client_compression_level': :'Integer',
        'mysqlx_lz4_max_client_compression_level': :'Integer',
        'mysqlx_lz4_default_compression_level': :'Integer',
        'mysqlx_zstd_max_client_compression_level': :'Integer',
        'mysqlx_zstd_default_compression_level': :'Integer',
        'mysql_zstd_default_compression_level': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :completion_type The value to assign to the {#completion_type} property
    # @option attributes [String] :default_authentication_plugin The value to assign to the {#default_authentication_plugin} property
    # @option attributes [String] :transaction_isolation The value to assign to the {#transaction_isolation} property
    # @option attributes [String] :innodb_ft_server_stopword_table The value to assign to the {#innodb_ft_server_stopword_table} property
    # @option attributes [String] :mandatory_roles The value to assign to the {#mandatory_roles} property
    # @option attributes [BOOLEAN] :autocommit The value to assign to the {#autocommit} property
    # @option attributes [BOOLEAN] :foreign_key_checks The value to assign to the {#foreign_key_checks} property
    # @option attributes [BOOLEAN] :innodb_ft_enable_stopword The value to assign to the {#innodb_ft_enable_stopword} property
    # @option attributes [BOOLEAN] :local_infile The value to assign to the {#local_infile} property
    # @option attributes [BOOLEAN] :mysql_firewall_mode The value to assign to the {#mysql_firewall_mode} property
    # @option attributes [BOOLEAN] :mysqlx_enable_hello_notice The value to assign to the {#mysqlx_enable_hello_notice} property
    # @option attributes [BOOLEAN] :sql_require_primary_key The value to assign to the {#sql_require_primary_key} property
    # @option attributes [BOOLEAN] :sql_warnings The value to assign to the {#sql_warnings} property
    # @option attributes [Integer] :binlog_expire_logs_seconds The value to assign to the {#binlog_expire_logs_seconds} property
    # @option attributes [Integer] :innodb_buffer_pool_size The value to assign to the {#innodb_buffer_pool_size} property
    # @option attributes [Integer] :innodb_ft_result_cache_limit The value to assign to the {#innodb_ft_result_cache_limit} property
    # @option attributes [Integer] :max_connections The value to assign to the {#max_connections} property
    # @option attributes [Integer] :max_prepared_stmt_count The value to assign to the {#max_prepared_stmt_count} property
    # @option attributes [Integer] :connect_timeout The value to assign to the {#connect_timeout} property
    # @option attributes [Integer] :cte_max_recursion_depth The value to assign to the {#cte_max_recursion_depth} property
    # @option attributes [Integer] :generated_random_password_length The value to assign to the {#generated_random_password_length} property
    # @option attributes [Integer] :information_schema_stats_expiry The value to assign to the {#information_schema_stats_expiry} property
    # @option attributes [Integer] :innodb_buffer_pool_instances The value to assign to the {#innodb_buffer_pool_instances} property
    # @option attributes [Integer] :innodb_ft_max_token_size The value to assign to the {#innodb_ft_max_token_size} property
    # @option attributes [Integer] :innodb_ft_min_token_size The value to assign to the {#innodb_ft_min_token_size} property
    # @option attributes [Integer] :innodb_ft_num_word_optimize The value to assign to the {#innodb_ft_num_word_optimize} property
    # @option attributes [Integer] :innodb_lock_wait_timeout The value to assign to the {#innodb_lock_wait_timeout} property
    # @option attributes [Integer] :innodb_max_purge_lag The value to assign to the {#innodb_max_purge_lag} property
    # @option attributes [Integer] :innodb_max_purge_lag_delay The value to assign to the {#innodb_max_purge_lag_delay} property
    # @option attributes [Integer] :max_execution_time The value to assign to the {#max_execution_time} property
    # @option attributes [Integer] :mysqlx_connect_timeout The value to assign to the {#mysqlx_connect_timeout} property
    # @option attributes [Integer] :mysqlx_document_id_unique_prefix The value to assign to the {#mysqlx_document_id_unique_prefix} property
    # @option attributes [Integer] :mysqlx_idle_worker_thread_timeout The value to assign to the {#mysqlx_idle_worker_thread_timeout} property
    # @option attributes [Integer] :mysqlx_interactive_timeout The value to assign to the {#mysqlx_interactive_timeout} property
    # @option attributes [Integer] :mysqlx_max_allowed_packet The value to assign to the {#mysqlx_max_allowed_packet} property
    # @option attributes [Integer] :mysqlx_min_worker_threads The value to assign to the {#mysqlx_min_worker_threads} property
    # @option attributes [Integer] :mysqlx_read_timeout The value to assign to the {#mysqlx_read_timeout} property
    # @option attributes [Integer] :mysqlx_wait_timeout The value to assign to the {#mysqlx_wait_timeout} property
    # @option attributes [Integer] :mysqlx_write_timeout The value to assign to the {#mysqlx_write_timeout} property
    # @option attributes [Integer] :parser_max_mem_size The value to assign to the {#parser_max_mem_size} property
    # @option attributes [Integer] :query_alloc_block_size The value to assign to the {#query_alloc_block_size} property
    # @option attributes [Integer] :query_prealloc_size The value to assign to the {#query_prealloc_size} property
    # @option attributes [String] :sql_mode The value to assign to the {#sql_mode} property
    # @option attributes [Integer] :mysqlx_deflate_default_compression_level The value to assign to the {#mysqlx_deflate_default_compression_level} property
    # @option attributes [Integer] :mysqlx_deflate_max_client_compression_level The value to assign to the {#mysqlx_deflate_max_client_compression_level} property
    # @option attributes [Integer] :mysqlx_lz4_max_client_compression_level The value to assign to the {#mysqlx_lz4_max_client_compression_level} property
    # @option attributes [Integer] :mysqlx_lz4_default_compression_level The value to assign to the {#mysqlx_lz4_default_compression_level} property
    # @option attributes [Integer] :mysqlx_zstd_max_client_compression_level The value to assign to the {#mysqlx_zstd_max_client_compression_level} property
    # @option attributes [Integer] :mysqlx_zstd_default_compression_level The value to assign to the {#mysqlx_zstd_default_compression_level} property
    # @option attributes [Integer] :mysql_zstd_default_compression_level The value to assign to the {#mysql_zstd_default_compression_level} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.completion_type = attributes[:'completionType'] if attributes[:'completionType']
      self.completion_type = "NO_CHAIN" if completion_type.nil? && !attributes.key?(:'completionType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :completionType and :completion_type' if attributes.key?(:'completionType') && attributes.key?(:'completion_type')

      self.completion_type = attributes[:'completion_type'] if attributes[:'completion_type']
      self.completion_type = "NO_CHAIN" if completion_type.nil? && !attributes.key?(:'completionType') && !attributes.key?(:'completion_type') # rubocop:disable Style/StringLiterals

      self.default_authentication_plugin = attributes[:'defaultAuthenticationPlugin'] if attributes[:'defaultAuthenticationPlugin']
      self.default_authentication_plugin = "caching_sha2_password" if default_authentication_plugin.nil? && !attributes.key?(:'defaultAuthenticationPlugin') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :defaultAuthenticationPlugin and :default_authentication_plugin' if attributes.key?(:'defaultAuthenticationPlugin') && attributes.key?(:'default_authentication_plugin')

      self.default_authentication_plugin = attributes[:'default_authentication_plugin'] if attributes[:'default_authentication_plugin']
      self.default_authentication_plugin = "caching_sha2_password" if default_authentication_plugin.nil? && !attributes.key?(:'defaultAuthenticationPlugin') && !attributes.key?(:'default_authentication_plugin') # rubocop:disable Style/StringLiterals

      self.transaction_isolation = attributes[:'transactionIsolation'] if attributes[:'transactionIsolation']
      self.transaction_isolation = "REPEATABLE-READ" if transaction_isolation.nil? && !attributes.key?(:'transactionIsolation') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :transactionIsolation and :transaction_isolation' if attributes.key?(:'transactionIsolation') && attributes.key?(:'transaction_isolation')

      self.transaction_isolation = attributes[:'transaction_isolation'] if attributes[:'transaction_isolation']
      self.transaction_isolation = "REPEATABLE-READ" if transaction_isolation.nil? && !attributes.key?(:'transactionIsolation') && !attributes.key?(:'transaction_isolation') # rubocop:disable Style/StringLiterals

      self.innodb_ft_server_stopword_table = attributes[:'innodbFtServerStopwordTable'] if attributes[:'innodbFtServerStopwordTable']
      self.innodb_ft_server_stopword_table = "null" if innodb_ft_server_stopword_table.nil? && !attributes.key?(:'innodbFtServerStopwordTable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :innodbFtServerStopwordTable and :innodb_ft_server_stopword_table' if attributes.key?(:'innodbFtServerStopwordTable') && attributes.key?(:'innodb_ft_server_stopword_table')

      self.innodb_ft_server_stopword_table = attributes[:'innodb_ft_server_stopword_table'] if attributes[:'innodb_ft_server_stopword_table']
      self.innodb_ft_server_stopword_table = "null" if innodb_ft_server_stopword_table.nil? && !attributes.key?(:'innodbFtServerStopwordTable') && !attributes.key?(:'innodb_ft_server_stopword_table') # rubocop:disable Style/StringLiterals

      self.mandatory_roles = attributes[:'mandatoryRoles'] if attributes[:'mandatoryRoles']
      self.mandatory_roles = "" if mandatory_roles.nil? && !attributes.key?(:'mandatoryRoles') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :mandatoryRoles and :mandatory_roles' if attributes.key?(:'mandatoryRoles') && attributes.key?(:'mandatory_roles')

      self.mandatory_roles = attributes[:'mandatory_roles'] if attributes[:'mandatory_roles']
      self.mandatory_roles = "" if mandatory_roles.nil? && !attributes.key?(:'mandatoryRoles') && !attributes.key?(:'mandatory_roles') # rubocop:disable Style/StringLiterals

      self.autocommit = attributes[:'autocommit'] unless attributes[:'autocommit'].nil?
      self.autocommit = true if autocommit.nil? && !attributes.key?(:'autocommit') # rubocop:disable Style/StringLiterals

      self.foreign_key_checks = attributes[:'foreignKeyChecks'] unless attributes[:'foreignKeyChecks'].nil?
      self.foreign_key_checks = true if foreign_key_checks.nil? && !attributes.key?(:'foreignKeyChecks') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :foreignKeyChecks and :foreign_key_checks' if attributes.key?(:'foreignKeyChecks') && attributes.key?(:'foreign_key_checks')

      self.foreign_key_checks = attributes[:'foreign_key_checks'] unless attributes[:'foreign_key_checks'].nil?
      self.foreign_key_checks = true if foreign_key_checks.nil? && !attributes.key?(:'foreignKeyChecks') && !attributes.key?(:'foreign_key_checks') # rubocop:disable Style/StringLiterals

      self.innodb_ft_enable_stopword = attributes[:'innodbFtEnableStopword'] unless attributes[:'innodbFtEnableStopword'].nil?
      self.innodb_ft_enable_stopword = true if innodb_ft_enable_stopword.nil? && !attributes.key?(:'innodbFtEnableStopword') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :innodbFtEnableStopword and :innodb_ft_enable_stopword' if attributes.key?(:'innodbFtEnableStopword') && attributes.key?(:'innodb_ft_enable_stopword')

      self.innodb_ft_enable_stopword = attributes[:'innodb_ft_enable_stopword'] unless attributes[:'innodb_ft_enable_stopword'].nil?
      self.innodb_ft_enable_stopword = true if innodb_ft_enable_stopword.nil? && !attributes.key?(:'innodbFtEnableStopword') && !attributes.key?(:'innodb_ft_enable_stopword') # rubocop:disable Style/StringLiterals

      self.local_infile = attributes[:'localInfile'] unless attributes[:'localInfile'].nil?
      self.local_infile = false if local_infile.nil? && !attributes.key?(:'localInfile') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :localInfile and :local_infile' if attributes.key?(:'localInfile') && attributes.key?(:'local_infile')

      self.local_infile = attributes[:'local_infile'] unless attributes[:'local_infile'].nil?
      self.local_infile = false if local_infile.nil? && !attributes.key?(:'localInfile') && !attributes.key?(:'local_infile') # rubocop:disable Style/StringLiterals

      self.mysql_firewall_mode = attributes[:'mysqlFirewallMode'] unless attributes[:'mysqlFirewallMode'].nil?
      self.mysql_firewall_mode = true if mysql_firewall_mode.nil? && !attributes.key?(:'mysqlFirewallMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :mysqlFirewallMode and :mysql_firewall_mode' if attributes.key?(:'mysqlFirewallMode') && attributes.key?(:'mysql_firewall_mode')

      self.mysql_firewall_mode = attributes[:'mysql_firewall_mode'] unless attributes[:'mysql_firewall_mode'].nil?
      self.mysql_firewall_mode = true if mysql_firewall_mode.nil? && !attributes.key?(:'mysqlFirewallMode') && !attributes.key?(:'mysql_firewall_mode') # rubocop:disable Style/StringLiterals

      self.mysqlx_enable_hello_notice = attributes[:'mysqlxEnableHelloNotice'] unless attributes[:'mysqlxEnableHelloNotice'].nil?
      self.mysqlx_enable_hello_notice = true if mysqlx_enable_hello_notice.nil? && !attributes.key?(:'mysqlxEnableHelloNotice') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :mysqlxEnableHelloNotice and :mysqlx_enable_hello_notice' if attributes.key?(:'mysqlxEnableHelloNotice') && attributes.key?(:'mysqlx_enable_hello_notice')

      self.mysqlx_enable_hello_notice = attributes[:'mysqlx_enable_hello_notice'] unless attributes[:'mysqlx_enable_hello_notice'].nil?
      self.mysqlx_enable_hello_notice = true if mysqlx_enable_hello_notice.nil? && !attributes.key?(:'mysqlxEnableHelloNotice') && !attributes.key?(:'mysqlx_enable_hello_notice') # rubocop:disable Style/StringLiterals

      self.sql_require_primary_key = attributes[:'sqlRequirePrimaryKey'] unless attributes[:'sqlRequirePrimaryKey'].nil?
      self.sql_require_primary_key = false if sql_require_primary_key.nil? && !attributes.key?(:'sqlRequirePrimaryKey') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sqlRequirePrimaryKey and :sql_require_primary_key' if attributes.key?(:'sqlRequirePrimaryKey') && attributes.key?(:'sql_require_primary_key')

      self.sql_require_primary_key = attributes[:'sql_require_primary_key'] unless attributes[:'sql_require_primary_key'].nil?
      self.sql_require_primary_key = false if sql_require_primary_key.nil? && !attributes.key?(:'sqlRequirePrimaryKey') && !attributes.key?(:'sql_require_primary_key') # rubocop:disable Style/StringLiterals

      self.sql_warnings = attributes[:'sqlWarnings'] unless attributes[:'sqlWarnings'].nil?
      self.sql_warnings = false if sql_warnings.nil? && !attributes.key?(:'sqlWarnings') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sqlWarnings and :sql_warnings' if attributes.key?(:'sqlWarnings') && attributes.key?(:'sql_warnings')

      self.sql_warnings = attributes[:'sql_warnings'] unless attributes[:'sql_warnings'].nil?
      self.sql_warnings = false if sql_warnings.nil? && !attributes.key?(:'sqlWarnings') && !attributes.key?(:'sql_warnings') # rubocop:disable Style/StringLiterals

      self.binlog_expire_logs_seconds = attributes[:'binlogExpireLogsSeconds'] if attributes[:'binlogExpireLogsSeconds']

      raise 'You cannot provide both :binlogExpireLogsSeconds and :binlog_expire_logs_seconds' if attributes.key?(:'binlogExpireLogsSeconds') && attributes.key?(:'binlog_expire_logs_seconds')

      self.binlog_expire_logs_seconds = attributes[:'binlog_expire_logs_seconds'] if attributes[:'binlog_expire_logs_seconds']

      self.innodb_buffer_pool_size = attributes[:'innodbBufferPoolSize'] if attributes[:'innodbBufferPoolSize']
      self.innodb_buffer_pool_size = 134217728 if innodb_buffer_pool_size.nil? && !attributes.key?(:'innodbBufferPoolSize') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :innodbBufferPoolSize and :innodb_buffer_pool_size' if attributes.key?(:'innodbBufferPoolSize') && attributes.key?(:'innodb_buffer_pool_size')

      self.innodb_buffer_pool_size = attributes[:'innodb_buffer_pool_size'] if attributes[:'innodb_buffer_pool_size']
      self.innodb_buffer_pool_size = 134217728 if innodb_buffer_pool_size.nil? && !attributes.key?(:'innodbBufferPoolSize') && !attributes.key?(:'innodb_buffer_pool_size') # rubocop:disable Style/StringLiterals

      self.innodb_ft_result_cache_limit = attributes[:'innodbFtResultCacheLimit'] if attributes[:'innodbFtResultCacheLimit']

      raise 'You cannot provide both :innodbFtResultCacheLimit and :innodb_ft_result_cache_limit' if attributes.key?(:'innodbFtResultCacheLimit') && attributes.key?(:'innodb_ft_result_cache_limit')

      self.innodb_ft_result_cache_limit = attributes[:'innodb_ft_result_cache_limit'] if attributes[:'innodb_ft_result_cache_limit']

      self.max_connections = attributes[:'maxConnections'] if attributes[:'maxConnections']

      raise 'You cannot provide both :maxConnections and :max_connections' if attributes.key?(:'maxConnections') && attributes.key?(:'max_connections')

      self.max_connections = attributes[:'max_connections'] if attributes[:'max_connections']

      self.max_prepared_stmt_count = attributes[:'maxPreparedStmtCount'] if attributes[:'maxPreparedStmtCount']

      raise 'You cannot provide both :maxPreparedStmtCount and :max_prepared_stmt_count' if attributes.key?(:'maxPreparedStmtCount') && attributes.key?(:'max_prepared_stmt_count')

      self.max_prepared_stmt_count = attributes[:'max_prepared_stmt_count'] if attributes[:'max_prepared_stmt_count']

      self.connect_timeout = attributes[:'connectTimeout'] if attributes[:'connectTimeout']

      raise 'You cannot provide both :connectTimeout and :connect_timeout' if attributes.key?(:'connectTimeout') && attributes.key?(:'connect_timeout')

      self.connect_timeout = attributes[:'connect_timeout'] if attributes[:'connect_timeout']

      self.cte_max_recursion_depth = attributes[:'cteMaxRecursionDepth'] if attributes[:'cteMaxRecursionDepth']

      raise 'You cannot provide both :cteMaxRecursionDepth and :cte_max_recursion_depth' if attributes.key?(:'cteMaxRecursionDepth') && attributes.key?(:'cte_max_recursion_depth')

      self.cte_max_recursion_depth = attributes[:'cte_max_recursion_depth'] if attributes[:'cte_max_recursion_depth']

      self.generated_random_password_length = attributes[:'generatedRandomPasswordLength'] if attributes[:'generatedRandomPasswordLength']

      raise 'You cannot provide both :generatedRandomPasswordLength and :generated_random_password_length' if attributes.key?(:'generatedRandomPasswordLength') && attributes.key?(:'generated_random_password_length')

      self.generated_random_password_length = attributes[:'generated_random_password_length'] if attributes[:'generated_random_password_length']

      self.information_schema_stats_expiry = attributes[:'informationSchemaStatsExpiry'] if attributes[:'informationSchemaStatsExpiry']

      raise 'You cannot provide both :informationSchemaStatsExpiry and :information_schema_stats_expiry' if attributes.key?(:'informationSchemaStatsExpiry') && attributes.key?(:'information_schema_stats_expiry')

      self.information_schema_stats_expiry = attributes[:'information_schema_stats_expiry'] if attributes[:'information_schema_stats_expiry']

      self.innodb_buffer_pool_instances = attributes[:'innodbBufferPoolInstances'] if attributes[:'innodbBufferPoolInstances']

      raise 'You cannot provide both :innodbBufferPoolInstances and :innodb_buffer_pool_instances' if attributes.key?(:'innodbBufferPoolInstances') && attributes.key?(:'innodb_buffer_pool_instances')

      self.innodb_buffer_pool_instances = attributes[:'innodb_buffer_pool_instances'] if attributes[:'innodb_buffer_pool_instances']

      self.innodb_ft_max_token_size = attributes[:'innodbFtMaxTokenSize'] if attributes[:'innodbFtMaxTokenSize']

      raise 'You cannot provide both :innodbFtMaxTokenSize and :innodb_ft_max_token_size' if attributes.key?(:'innodbFtMaxTokenSize') && attributes.key?(:'innodb_ft_max_token_size')

      self.innodb_ft_max_token_size = attributes[:'innodb_ft_max_token_size'] if attributes[:'innodb_ft_max_token_size']

      self.innodb_ft_min_token_size = attributes[:'innodbFtMinTokenSize'] if attributes[:'innodbFtMinTokenSize']

      raise 'You cannot provide both :innodbFtMinTokenSize and :innodb_ft_min_token_size' if attributes.key?(:'innodbFtMinTokenSize') && attributes.key?(:'innodb_ft_min_token_size')

      self.innodb_ft_min_token_size = attributes[:'innodb_ft_min_token_size'] if attributes[:'innodb_ft_min_token_size']

      self.innodb_ft_num_word_optimize = attributes[:'innodbFtNumWordOptimize'] if attributes[:'innodbFtNumWordOptimize']

      raise 'You cannot provide both :innodbFtNumWordOptimize and :innodb_ft_num_word_optimize' if attributes.key?(:'innodbFtNumWordOptimize') && attributes.key?(:'innodb_ft_num_word_optimize')

      self.innodb_ft_num_word_optimize = attributes[:'innodb_ft_num_word_optimize'] if attributes[:'innodb_ft_num_word_optimize']

      self.innodb_lock_wait_timeout = attributes[:'innodbLockWaitTimeout'] if attributes[:'innodbLockWaitTimeout']

      raise 'You cannot provide both :innodbLockWaitTimeout and :innodb_lock_wait_timeout' if attributes.key?(:'innodbLockWaitTimeout') && attributes.key?(:'innodb_lock_wait_timeout')

      self.innodb_lock_wait_timeout = attributes[:'innodb_lock_wait_timeout'] if attributes[:'innodb_lock_wait_timeout']

      self.innodb_max_purge_lag = attributes[:'innodbMaxPurgeLag'] if attributes[:'innodbMaxPurgeLag']

      raise 'You cannot provide both :innodbMaxPurgeLag and :innodb_max_purge_lag' if attributes.key?(:'innodbMaxPurgeLag') && attributes.key?(:'innodb_max_purge_lag')

      self.innodb_max_purge_lag = attributes[:'innodb_max_purge_lag'] if attributes[:'innodb_max_purge_lag']

      self.innodb_max_purge_lag_delay = attributes[:'innodbMaxPurgeLagDelay'] if attributes[:'innodbMaxPurgeLagDelay']

      raise 'You cannot provide both :innodbMaxPurgeLagDelay and :innodb_max_purge_lag_delay' if attributes.key?(:'innodbMaxPurgeLagDelay') && attributes.key?(:'innodb_max_purge_lag_delay')

      self.innodb_max_purge_lag_delay = attributes[:'innodb_max_purge_lag_delay'] if attributes[:'innodb_max_purge_lag_delay']

      self.max_execution_time = attributes[:'maxExecutionTime'] if attributes[:'maxExecutionTime']

      raise 'You cannot provide both :maxExecutionTime and :max_execution_time' if attributes.key?(:'maxExecutionTime') && attributes.key?(:'max_execution_time')

      self.max_execution_time = attributes[:'max_execution_time'] if attributes[:'max_execution_time']

      self.mysqlx_connect_timeout = attributes[:'mysqlxConnectTimeout'] if attributes[:'mysqlxConnectTimeout']

      raise 'You cannot provide both :mysqlxConnectTimeout and :mysqlx_connect_timeout' if attributes.key?(:'mysqlxConnectTimeout') && attributes.key?(:'mysqlx_connect_timeout')

      self.mysqlx_connect_timeout = attributes[:'mysqlx_connect_timeout'] if attributes[:'mysqlx_connect_timeout']

      self.mysqlx_document_id_unique_prefix = attributes[:'mysqlxDocumentIdUniquePrefix'] if attributes[:'mysqlxDocumentIdUniquePrefix']

      raise 'You cannot provide both :mysqlxDocumentIdUniquePrefix and :mysqlx_document_id_unique_prefix' if attributes.key?(:'mysqlxDocumentIdUniquePrefix') && attributes.key?(:'mysqlx_document_id_unique_prefix')

      self.mysqlx_document_id_unique_prefix = attributes[:'mysqlx_document_id_unique_prefix'] if attributes[:'mysqlx_document_id_unique_prefix']

      self.mysqlx_idle_worker_thread_timeout = attributes[:'mysqlxIdleWorkerThreadTimeout'] if attributes[:'mysqlxIdleWorkerThreadTimeout']

      raise 'You cannot provide both :mysqlxIdleWorkerThreadTimeout and :mysqlx_idle_worker_thread_timeout' if attributes.key?(:'mysqlxIdleWorkerThreadTimeout') && attributes.key?(:'mysqlx_idle_worker_thread_timeout')

      self.mysqlx_idle_worker_thread_timeout = attributes[:'mysqlx_idle_worker_thread_timeout'] if attributes[:'mysqlx_idle_worker_thread_timeout']

      self.mysqlx_interactive_timeout = attributes[:'mysqlxInteractiveTimeout'] if attributes[:'mysqlxInteractiveTimeout']

      raise 'You cannot provide both :mysqlxInteractiveTimeout and :mysqlx_interactive_timeout' if attributes.key?(:'mysqlxInteractiveTimeout') && attributes.key?(:'mysqlx_interactive_timeout')

      self.mysqlx_interactive_timeout = attributes[:'mysqlx_interactive_timeout'] if attributes[:'mysqlx_interactive_timeout']

      self.mysqlx_max_allowed_packet = attributes[:'mysqlxMaxAllowedPacket'] if attributes[:'mysqlxMaxAllowedPacket']

      raise 'You cannot provide both :mysqlxMaxAllowedPacket and :mysqlx_max_allowed_packet' if attributes.key?(:'mysqlxMaxAllowedPacket') && attributes.key?(:'mysqlx_max_allowed_packet')

      self.mysqlx_max_allowed_packet = attributes[:'mysqlx_max_allowed_packet'] if attributes[:'mysqlx_max_allowed_packet']

      self.mysqlx_min_worker_threads = attributes[:'mysqlxMinWorkerThreads'] if attributes[:'mysqlxMinWorkerThreads']

      raise 'You cannot provide both :mysqlxMinWorkerThreads and :mysqlx_min_worker_threads' if attributes.key?(:'mysqlxMinWorkerThreads') && attributes.key?(:'mysqlx_min_worker_threads')

      self.mysqlx_min_worker_threads = attributes[:'mysqlx_min_worker_threads'] if attributes[:'mysqlx_min_worker_threads']

      self.mysqlx_read_timeout = attributes[:'mysqlxReadTimeout'] if attributes[:'mysqlxReadTimeout']

      raise 'You cannot provide both :mysqlxReadTimeout and :mysqlx_read_timeout' if attributes.key?(:'mysqlxReadTimeout') && attributes.key?(:'mysqlx_read_timeout')

      self.mysqlx_read_timeout = attributes[:'mysqlx_read_timeout'] if attributes[:'mysqlx_read_timeout']

      self.mysqlx_wait_timeout = attributes[:'mysqlxWaitTimeout'] if attributes[:'mysqlxWaitTimeout']

      raise 'You cannot provide both :mysqlxWaitTimeout and :mysqlx_wait_timeout' if attributes.key?(:'mysqlxWaitTimeout') && attributes.key?(:'mysqlx_wait_timeout')

      self.mysqlx_wait_timeout = attributes[:'mysqlx_wait_timeout'] if attributes[:'mysqlx_wait_timeout']

      self.mysqlx_write_timeout = attributes[:'mysqlxWriteTimeout'] if attributes[:'mysqlxWriteTimeout']

      raise 'You cannot provide both :mysqlxWriteTimeout and :mysqlx_write_timeout' if attributes.key?(:'mysqlxWriteTimeout') && attributes.key?(:'mysqlx_write_timeout')

      self.mysqlx_write_timeout = attributes[:'mysqlx_write_timeout'] if attributes[:'mysqlx_write_timeout']

      self.parser_max_mem_size = attributes[:'parserMaxMemSize'] if attributes[:'parserMaxMemSize']

      raise 'You cannot provide both :parserMaxMemSize and :parser_max_mem_size' if attributes.key?(:'parserMaxMemSize') && attributes.key?(:'parser_max_mem_size')

      self.parser_max_mem_size = attributes[:'parser_max_mem_size'] if attributes[:'parser_max_mem_size']

      self.query_alloc_block_size = attributes[:'queryAllocBlockSize'] if attributes[:'queryAllocBlockSize']

      raise 'You cannot provide both :queryAllocBlockSize and :query_alloc_block_size' if attributes.key?(:'queryAllocBlockSize') && attributes.key?(:'query_alloc_block_size')

      self.query_alloc_block_size = attributes[:'query_alloc_block_size'] if attributes[:'query_alloc_block_size']

      self.query_prealloc_size = attributes[:'queryPreallocSize'] if attributes[:'queryPreallocSize']

      raise 'You cannot provide both :queryPreallocSize and :query_prealloc_size' if attributes.key?(:'queryPreallocSize') && attributes.key?(:'query_prealloc_size')

      self.query_prealloc_size = attributes[:'query_prealloc_size'] if attributes[:'query_prealloc_size']

      self.sql_mode = attributes[:'sqlMode'] if attributes[:'sqlMode']
      self.sql_mode = "ONLY_FULL_GROUP_BY,\nSTRICT_TRANS_TABLES,\nNO_ZERO_IN_DATE,\nNO_ZERO_DATE,\nERROR_FOR_DIVISION_BY_ZERO,\nNO_ENGINE_SUBSTITUTION\n" if sql_mode.nil? && !attributes.key?(:'sqlMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sqlMode and :sql_mode' if attributes.key?(:'sqlMode') && attributes.key?(:'sql_mode')

      self.sql_mode = attributes[:'sql_mode'] if attributes[:'sql_mode']
      self.sql_mode = "ONLY_FULL_GROUP_BY,\nSTRICT_TRANS_TABLES,\nNO_ZERO_IN_DATE,\nNO_ZERO_DATE,\nERROR_FOR_DIVISION_BY_ZERO,\nNO_ENGINE_SUBSTITUTION\n" if sql_mode.nil? && !attributes.key?(:'sqlMode') && !attributes.key?(:'sql_mode') # rubocop:disable Style/StringLiterals

      self.mysqlx_deflate_default_compression_level = attributes[:'mysqlxDeflateDefaultCompressionLevel'] if attributes[:'mysqlxDeflateDefaultCompressionLevel']

      raise 'You cannot provide both :mysqlxDeflateDefaultCompressionLevel and :mysqlx_deflate_default_compression_level' if attributes.key?(:'mysqlxDeflateDefaultCompressionLevel') && attributes.key?(:'mysqlx_deflate_default_compression_level')

      self.mysqlx_deflate_default_compression_level = attributes[:'mysqlx_deflate_default_compression_level'] if attributes[:'mysqlx_deflate_default_compression_level']

      self.mysqlx_deflate_max_client_compression_level = attributes[:'mysqlxDeflateMaxClientCompressionLevel'] if attributes[:'mysqlxDeflateMaxClientCompressionLevel']

      raise 'You cannot provide both :mysqlxDeflateMaxClientCompressionLevel and :mysqlx_deflate_max_client_compression_level' if attributes.key?(:'mysqlxDeflateMaxClientCompressionLevel') && attributes.key?(:'mysqlx_deflate_max_client_compression_level')

      self.mysqlx_deflate_max_client_compression_level = attributes[:'mysqlx_deflate_max_client_compression_level'] if attributes[:'mysqlx_deflate_max_client_compression_level']

      self.mysqlx_lz4_max_client_compression_level = attributes[:'mysqlxLz4MaxClientCompressionLevel'] if attributes[:'mysqlxLz4MaxClientCompressionLevel']

      raise 'You cannot provide both :mysqlxLz4MaxClientCompressionLevel and :mysqlx_lz4_max_client_compression_level' if attributes.key?(:'mysqlxLz4MaxClientCompressionLevel') && attributes.key?(:'mysqlx_lz4_max_client_compression_level')

      self.mysqlx_lz4_max_client_compression_level = attributes[:'mysqlx_lz4_max_client_compression_level'] if attributes[:'mysqlx_lz4_max_client_compression_level']

      self.mysqlx_lz4_default_compression_level = attributes[:'mysqlxLz4DefaultCompressionLevel'] if attributes[:'mysqlxLz4DefaultCompressionLevel']

      raise 'You cannot provide both :mysqlxLz4DefaultCompressionLevel and :mysqlx_lz4_default_compression_level' if attributes.key?(:'mysqlxLz4DefaultCompressionLevel') && attributes.key?(:'mysqlx_lz4_default_compression_level')

      self.mysqlx_lz4_default_compression_level = attributes[:'mysqlx_lz4_default_compression_level'] if attributes[:'mysqlx_lz4_default_compression_level']

      self.mysqlx_zstd_max_client_compression_level = attributes[:'mysqlxZstdMaxClientCompressionLevel'] if attributes[:'mysqlxZstdMaxClientCompressionLevel']

      raise 'You cannot provide both :mysqlxZstdMaxClientCompressionLevel and :mysqlx_zstd_max_client_compression_level' if attributes.key?(:'mysqlxZstdMaxClientCompressionLevel') && attributes.key?(:'mysqlx_zstd_max_client_compression_level')

      self.mysqlx_zstd_max_client_compression_level = attributes[:'mysqlx_zstd_max_client_compression_level'] if attributes[:'mysqlx_zstd_max_client_compression_level']

      self.mysqlx_zstd_default_compression_level = attributes[:'mysqlxZstdDefaultCompressionLevel'] if attributes[:'mysqlxZstdDefaultCompressionLevel']

      raise 'You cannot provide both :mysqlxZstdDefaultCompressionLevel and :mysqlx_zstd_default_compression_level' if attributes.key?(:'mysqlxZstdDefaultCompressionLevel') && attributes.key?(:'mysqlx_zstd_default_compression_level')

      self.mysqlx_zstd_default_compression_level = attributes[:'mysqlx_zstd_default_compression_level'] if attributes[:'mysqlx_zstd_default_compression_level']

      self.mysql_zstd_default_compression_level = attributes[:'mysqlZstdDefaultCompressionLevel'] if attributes[:'mysqlZstdDefaultCompressionLevel']

      raise 'You cannot provide both :mysqlZstdDefaultCompressionLevel and :mysql_zstd_default_compression_level' if attributes.key?(:'mysqlZstdDefaultCompressionLevel') && attributes.key?(:'mysql_zstd_default_compression_level')

      self.mysql_zstd_default_compression_level = attributes[:'mysql_zstd_default_compression_level'] if attributes[:'mysql_zstd_default_compression_level']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] completion_type Object to be assigned
    def completion_type=(completion_type)
      # rubocop:disable Style/ConditionalAssignment
      if completion_type && !COMPLETION_TYPE_ENUM.include?(completion_type)
        OCI.logger.debug("Unknown value for 'completion_type' [" + completion_type + "]. Mapping to 'COMPLETION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @completion_type = COMPLETION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @completion_type = completion_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_authentication_plugin Object to be assigned
    def default_authentication_plugin=(default_authentication_plugin)
      # rubocop:disable Style/ConditionalAssignment
      if default_authentication_plugin && !DEFAULT_AUTHENTICATION_PLUGIN_ENUM.include?(default_authentication_plugin)
        OCI.logger.debug("Unknown value for 'default_authentication_plugin' [" + default_authentication_plugin + "]. Mapping to 'DEFAULT_AUTHENTICATION_PLUGIN_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_authentication_plugin = DEFAULT_AUTHENTICATION_PLUGIN_UNKNOWN_ENUM_VALUE
      else
        @default_authentication_plugin = default_authentication_plugin
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] transaction_isolation Object to be assigned
    def transaction_isolation=(transaction_isolation)
      # rubocop:disable Style/ConditionalAssignment
      if transaction_isolation && !TRANSACTION_ISOLATION_ENUM.include?(transaction_isolation)
        OCI.logger.debug("Unknown value for 'transaction_isolation' [" + transaction_isolation + "]. Mapping to 'TRANSACTION_ISOLATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @transaction_isolation = TRANSACTION_ISOLATION_UNKNOWN_ENUM_VALUE
      else
        @transaction_isolation = transaction_isolation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        completion_type == other.completion_type &&
        default_authentication_plugin == other.default_authentication_plugin &&
        transaction_isolation == other.transaction_isolation &&
        innodb_ft_server_stopword_table == other.innodb_ft_server_stopword_table &&
        mandatory_roles == other.mandatory_roles &&
        autocommit == other.autocommit &&
        foreign_key_checks == other.foreign_key_checks &&
        innodb_ft_enable_stopword == other.innodb_ft_enable_stopword &&
        local_infile == other.local_infile &&
        mysql_firewall_mode == other.mysql_firewall_mode &&
        mysqlx_enable_hello_notice == other.mysqlx_enable_hello_notice &&
        sql_require_primary_key == other.sql_require_primary_key &&
        sql_warnings == other.sql_warnings &&
        binlog_expire_logs_seconds == other.binlog_expire_logs_seconds &&
        innodb_buffer_pool_size == other.innodb_buffer_pool_size &&
        innodb_ft_result_cache_limit == other.innodb_ft_result_cache_limit &&
        max_connections == other.max_connections &&
        max_prepared_stmt_count == other.max_prepared_stmt_count &&
        connect_timeout == other.connect_timeout &&
        cte_max_recursion_depth == other.cte_max_recursion_depth &&
        generated_random_password_length == other.generated_random_password_length &&
        information_schema_stats_expiry == other.information_schema_stats_expiry &&
        innodb_buffer_pool_instances == other.innodb_buffer_pool_instances &&
        innodb_ft_max_token_size == other.innodb_ft_max_token_size &&
        innodb_ft_min_token_size == other.innodb_ft_min_token_size &&
        innodb_ft_num_word_optimize == other.innodb_ft_num_word_optimize &&
        innodb_lock_wait_timeout == other.innodb_lock_wait_timeout &&
        innodb_max_purge_lag == other.innodb_max_purge_lag &&
        innodb_max_purge_lag_delay == other.innodb_max_purge_lag_delay &&
        max_execution_time == other.max_execution_time &&
        mysqlx_connect_timeout == other.mysqlx_connect_timeout &&
        mysqlx_document_id_unique_prefix == other.mysqlx_document_id_unique_prefix &&
        mysqlx_idle_worker_thread_timeout == other.mysqlx_idle_worker_thread_timeout &&
        mysqlx_interactive_timeout == other.mysqlx_interactive_timeout &&
        mysqlx_max_allowed_packet == other.mysqlx_max_allowed_packet &&
        mysqlx_min_worker_threads == other.mysqlx_min_worker_threads &&
        mysqlx_read_timeout == other.mysqlx_read_timeout &&
        mysqlx_wait_timeout == other.mysqlx_wait_timeout &&
        mysqlx_write_timeout == other.mysqlx_write_timeout &&
        parser_max_mem_size == other.parser_max_mem_size &&
        query_alloc_block_size == other.query_alloc_block_size &&
        query_prealloc_size == other.query_prealloc_size &&
        sql_mode == other.sql_mode &&
        mysqlx_deflate_default_compression_level == other.mysqlx_deflate_default_compression_level &&
        mysqlx_deflate_max_client_compression_level == other.mysqlx_deflate_max_client_compression_level &&
        mysqlx_lz4_max_client_compression_level == other.mysqlx_lz4_max_client_compression_level &&
        mysqlx_lz4_default_compression_level == other.mysqlx_lz4_default_compression_level &&
        mysqlx_zstd_max_client_compression_level == other.mysqlx_zstd_max_client_compression_level &&
        mysqlx_zstd_default_compression_level == other.mysqlx_zstd_default_compression_level &&
        mysql_zstd_default_compression_level == other.mysql_zstd_default_compression_level
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
      [completion_type, default_authentication_plugin, transaction_isolation, innodb_ft_server_stopword_table, mandatory_roles, autocommit, foreign_key_checks, innodb_ft_enable_stopword, local_infile, mysql_firewall_mode, mysqlx_enable_hello_notice, sql_require_primary_key, sql_warnings, binlog_expire_logs_seconds, innodb_buffer_pool_size, innodb_ft_result_cache_limit, max_connections, max_prepared_stmt_count, connect_timeout, cte_max_recursion_depth, generated_random_password_length, information_schema_stats_expiry, innodb_buffer_pool_instances, innodb_ft_max_token_size, innodb_ft_min_token_size, innodb_ft_num_word_optimize, innodb_lock_wait_timeout, innodb_max_purge_lag, innodb_max_purge_lag_delay, max_execution_time, mysqlx_connect_timeout, mysqlx_document_id_unique_prefix, mysqlx_idle_worker_thread_timeout, mysqlx_interactive_timeout, mysqlx_max_allowed_packet, mysqlx_min_worker_threads, mysqlx_read_timeout, mysqlx_wait_timeout, mysqlx_write_timeout, parser_max_mem_size, query_alloc_block_size, query_prealloc_size, sql_mode, mysqlx_deflate_default_compression_level, mysqlx_deflate_max_client_compression_level, mysqlx_lz4_max_client_compression_level, mysqlx_lz4_default_compression_level, mysqlx_zstd_max_client_compression_level, mysqlx_zstd_default_compression_level, mysql_zstd_default_compression_level].hash
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
