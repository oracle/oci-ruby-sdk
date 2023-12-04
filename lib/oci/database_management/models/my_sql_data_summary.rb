# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The SQL performance data record for a specific SQL query.
  class DatabaseManagement::Models::MySqlDataSummary
    # **[Required]** The name of the default schema when executing the query. If a schema is not set as the default, then the value is NULL.
    # @return [String]
    attr_accessor :schema_name

    # **[Required]** The digest information of the normalized query.
    # @return [String]
    attr_accessor :digest

    # **[Required]** The normalized query.
    # @return [String]
    attr_accessor :digest_text

    # **[Required]** The number Of times the query has been executed.
    # @return [Float]
    attr_accessor :count_star

    # **[Required]** The total amount of time that has been spent executing the query.
    # @return [Float]
    attr_accessor :sum_timer_wait

    # **[Required]** The fastest the query has been executed.
    # @return [Float]
    attr_accessor :min_timer_wait

    # **[Required]** The average execution time.
    # @return [Float]
    attr_accessor :avg_timer_wait

    # **[Required]** The slowest the query has been executed.
    # @return [Float]
    attr_accessor :max_timer_wait

    # **[Required]** The total amount of time that has been spent waiting for table locks.
    # @return [Float]
    attr_accessor :sum_lock_time

    # **[Required]** The total number of errors that have been encountered executing the query.
    # @return [Float]
    attr_accessor :sum_errors

    # **[Required]** The total number of warnings that have been encountered executing the query.
    # @return [Float]
    attr_accessor :sum_warnings

    # **[Required]** The total number of rows that have been modified by the query.
    # @return [Float]
    attr_accessor :sum_rows_affected

    # **[Required]** The total number of rows that have been returned (sent) to the client.
    # @return [Float]
    attr_accessor :sum_rows_sent

    # **[Required]** The total number of rows that have been examined by the query.
    # @return [Float]
    attr_accessor :sum_rows_examined

    # **[Required]** The total number of On-Disk internal temporary tables that have been created by the query.
    # @return [Float]
    attr_accessor :sum_created_temp_disk_tables

    # **[Required]** The total number of internal temporary tables (in memory or on disk), which have been created by the query.
    # @return [Float]
    attr_accessor :sum_created_temp_tables

    # **[Required]** The total number of joins that have performed full table scans as there was no join condition or no index for the join condition. This is the same as the select_full_join status variable.
    # @return [Float]
    attr_accessor :sum_select_full_join

    # **[Required]** The total number of joins that use a full range search. This is the same as the select_full_range_join status variable.
    # @return [Float]
    attr_accessor :sum_select_full_range_join

    # **[Required]** The total number of times the query has used a range search. This is the same as the select_range status variable.
    # @return [Float]
    attr_accessor :sum_select_range

    # **[Required]** The total number of joins by the query where the join does not have an index that checks for the index usage after each row. This is the same as the select_range_check status variable.
    # @return [Float]
    attr_accessor :sum_select_range_check

    # **[Required]** The total number of times the query has performed a full table scan on the first table in the join. This is the same as the select_scan status variable.
    # @return [Float]
    attr_accessor :sum_select_scan

    # **[Required]** The total number of sort merge passes that have been done to sort the result of the query. This is the same as the sort_merge_passes status variable.
    # @return [Float]
    attr_accessor :sum_sort_merge_passes

    # **[Required]** The total number of times a sort was done using ranges. This is the same as the sort_range status variable.
    # @return [Float]
    attr_accessor :sum_sort_range

    # **[Required]** The total number of rows sorted. This is the same as the sort_rowsStatus variable.
    # @return [Float]
    attr_accessor :sum_sort_rows

    # **[Required]** The total number of times a sort was done by scanning the table. This is the same as the sort_scan status variable.
    # @return [Float]
    attr_accessor :sum_sort_scan

    # **[Required]** The total number of times no index was used to execute the query.
    # @return [Float]
    attr_accessor :sum_no_index_used

    # **[Required]** The total number of times no good index was used. This means that the extra column in The EXPLAIN output includes \u201CRange Checked For Each Record.\u201D
    # @return [Float]
    attr_accessor :sum_no_good_index_used

    # **[Required]** The date and time the query was first seen. If the table is truncated, the first seen value is reset.
    # @return [DateTime]
    attr_accessor :first_seen

    # **[Required]** The date and time the query was last seen.
    # @return [DateTime]
    attr_accessor :last_seen

    # **[Required]** The 95th percentile of the query latency. That is, 95% of the queries complete in the time given or in less time.
    # @return [Float]
    attr_accessor :quantile95

    # **[Required]** The 99th percentile of the query latency.
    # @return [Float]
    attr_accessor :quantile99

    # **[Required]** The 99.9th percentile of the query latency.
    # @return [Float]
    attr_accessor :quantile999

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'schema_name': :'schemaName',
        'digest': :'digest',
        'digest_text': :'digestText',
        'count_star': :'countStar',
        'sum_timer_wait': :'sumTimerWait',
        'min_timer_wait': :'minTimerWait',
        'avg_timer_wait': :'avgTimerWait',
        'max_timer_wait': :'maxTimerWait',
        'sum_lock_time': :'sumLockTime',
        'sum_errors': :'sumErrors',
        'sum_warnings': :'sumWarnings',
        'sum_rows_affected': :'sumRowsAffected',
        'sum_rows_sent': :'sumRowsSent',
        'sum_rows_examined': :'sumRowsExamined',
        'sum_created_temp_disk_tables': :'sumCreatedTempDiskTables',
        'sum_created_temp_tables': :'sumCreatedTempTables',
        'sum_select_full_join': :'sumSelectFullJoin',
        'sum_select_full_range_join': :'sumSelectFullRangeJoin',
        'sum_select_range': :'sumSelectRange',
        'sum_select_range_check': :'sumSelectRangeCheck',
        'sum_select_scan': :'sumSelectScan',
        'sum_sort_merge_passes': :'sumSortMergePasses',
        'sum_sort_range': :'sumSortRange',
        'sum_sort_rows': :'sumSortRows',
        'sum_sort_scan': :'sumSortScan',
        'sum_no_index_used': :'sumNoIndexUsed',
        'sum_no_good_index_used': :'sumNoGoodIndexUsed',
        'first_seen': :'firstSeen',
        'last_seen': :'lastSeen',
        'quantile95': :'quantile95',
        'quantile99': :'quantile99',
        'quantile999': :'quantile999'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'schema_name': :'String',
        'digest': :'String',
        'digest_text': :'String',
        'count_star': :'Float',
        'sum_timer_wait': :'Float',
        'min_timer_wait': :'Float',
        'avg_timer_wait': :'Float',
        'max_timer_wait': :'Float',
        'sum_lock_time': :'Float',
        'sum_errors': :'Float',
        'sum_warnings': :'Float',
        'sum_rows_affected': :'Float',
        'sum_rows_sent': :'Float',
        'sum_rows_examined': :'Float',
        'sum_created_temp_disk_tables': :'Float',
        'sum_created_temp_tables': :'Float',
        'sum_select_full_join': :'Float',
        'sum_select_full_range_join': :'Float',
        'sum_select_range': :'Float',
        'sum_select_range_check': :'Float',
        'sum_select_scan': :'Float',
        'sum_sort_merge_passes': :'Float',
        'sum_sort_range': :'Float',
        'sum_sort_rows': :'Float',
        'sum_sort_scan': :'Float',
        'sum_no_index_used': :'Float',
        'sum_no_good_index_used': :'Float',
        'first_seen': :'DateTime',
        'last_seen': :'DateTime',
        'quantile95': :'Float',
        'quantile99': :'Float',
        'quantile999': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :digest The value to assign to the {#digest} property
    # @option attributes [String] :digest_text The value to assign to the {#digest_text} property
    # @option attributes [Float] :count_star The value to assign to the {#count_star} property
    # @option attributes [Float] :sum_timer_wait The value to assign to the {#sum_timer_wait} property
    # @option attributes [Float] :min_timer_wait The value to assign to the {#min_timer_wait} property
    # @option attributes [Float] :avg_timer_wait The value to assign to the {#avg_timer_wait} property
    # @option attributes [Float] :max_timer_wait The value to assign to the {#max_timer_wait} property
    # @option attributes [Float] :sum_lock_time The value to assign to the {#sum_lock_time} property
    # @option attributes [Float] :sum_errors The value to assign to the {#sum_errors} property
    # @option attributes [Float] :sum_warnings The value to assign to the {#sum_warnings} property
    # @option attributes [Float] :sum_rows_affected The value to assign to the {#sum_rows_affected} property
    # @option attributes [Float] :sum_rows_sent The value to assign to the {#sum_rows_sent} property
    # @option attributes [Float] :sum_rows_examined The value to assign to the {#sum_rows_examined} property
    # @option attributes [Float] :sum_created_temp_disk_tables The value to assign to the {#sum_created_temp_disk_tables} property
    # @option attributes [Float] :sum_created_temp_tables The value to assign to the {#sum_created_temp_tables} property
    # @option attributes [Float] :sum_select_full_join The value to assign to the {#sum_select_full_join} property
    # @option attributes [Float] :sum_select_full_range_join The value to assign to the {#sum_select_full_range_join} property
    # @option attributes [Float] :sum_select_range The value to assign to the {#sum_select_range} property
    # @option attributes [Float] :sum_select_range_check The value to assign to the {#sum_select_range_check} property
    # @option attributes [Float] :sum_select_scan The value to assign to the {#sum_select_scan} property
    # @option attributes [Float] :sum_sort_merge_passes The value to assign to the {#sum_sort_merge_passes} property
    # @option attributes [Float] :sum_sort_range The value to assign to the {#sum_sort_range} property
    # @option attributes [Float] :sum_sort_rows The value to assign to the {#sum_sort_rows} property
    # @option attributes [Float] :sum_sort_scan The value to assign to the {#sum_sort_scan} property
    # @option attributes [Float] :sum_no_index_used The value to assign to the {#sum_no_index_used} property
    # @option attributes [Float] :sum_no_good_index_used The value to assign to the {#sum_no_good_index_used} property
    # @option attributes [DateTime] :first_seen The value to assign to the {#first_seen} property
    # @option attributes [DateTime] :last_seen The value to assign to the {#last_seen} property
    # @option attributes [Float] :quantile95 The value to assign to the {#quantile95} property
    # @option attributes [Float] :quantile99 The value to assign to the {#quantile99} property
    # @option attributes [Float] :quantile999 The value to assign to the {#quantile999} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.schema_name = attributes[:'schemaName'] if attributes[:'schemaName']

      raise 'You cannot provide both :schemaName and :schema_name' if attributes.key?(:'schemaName') && attributes.key?(:'schema_name')

      self.schema_name = attributes[:'schema_name'] if attributes[:'schema_name']

      self.digest = attributes[:'digest'] if attributes[:'digest']

      self.digest_text = attributes[:'digestText'] if attributes[:'digestText']

      raise 'You cannot provide both :digestText and :digest_text' if attributes.key?(:'digestText') && attributes.key?(:'digest_text')

      self.digest_text = attributes[:'digest_text'] if attributes[:'digest_text']

      self.count_star = attributes[:'countStar'] if attributes[:'countStar']

      raise 'You cannot provide both :countStar and :count_star' if attributes.key?(:'countStar') && attributes.key?(:'count_star')

      self.count_star = attributes[:'count_star'] if attributes[:'count_star']

      self.sum_timer_wait = attributes[:'sumTimerWait'] if attributes[:'sumTimerWait']

      raise 'You cannot provide both :sumTimerWait and :sum_timer_wait' if attributes.key?(:'sumTimerWait') && attributes.key?(:'sum_timer_wait')

      self.sum_timer_wait = attributes[:'sum_timer_wait'] if attributes[:'sum_timer_wait']

      self.min_timer_wait = attributes[:'minTimerWait'] if attributes[:'minTimerWait']

      raise 'You cannot provide both :minTimerWait and :min_timer_wait' if attributes.key?(:'minTimerWait') && attributes.key?(:'min_timer_wait')

      self.min_timer_wait = attributes[:'min_timer_wait'] if attributes[:'min_timer_wait']

      self.avg_timer_wait = attributes[:'avgTimerWait'] if attributes[:'avgTimerWait']

      raise 'You cannot provide both :avgTimerWait and :avg_timer_wait' if attributes.key?(:'avgTimerWait') && attributes.key?(:'avg_timer_wait')

      self.avg_timer_wait = attributes[:'avg_timer_wait'] if attributes[:'avg_timer_wait']

      self.max_timer_wait = attributes[:'maxTimerWait'] if attributes[:'maxTimerWait']

      raise 'You cannot provide both :maxTimerWait and :max_timer_wait' if attributes.key?(:'maxTimerWait') && attributes.key?(:'max_timer_wait')

      self.max_timer_wait = attributes[:'max_timer_wait'] if attributes[:'max_timer_wait']

      self.sum_lock_time = attributes[:'sumLockTime'] if attributes[:'sumLockTime']

      raise 'You cannot provide both :sumLockTime and :sum_lock_time' if attributes.key?(:'sumLockTime') && attributes.key?(:'sum_lock_time')

      self.sum_lock_time = attributes[:'sum_lock_time'] if attributes[:'sum_lock_time']

      self.sum_errors = attributes[:'sumErrors'] if attributes[:'sumErrors']

      raise 'You cannot provide both :sumErrors and :sum_errors' if attributes.key?(:'sumErrors') && attributes.key?(:'sum_errors')

      self.sum_errors = attributes[:'sum_errors'] if attributes[:'sum_errors']

      self.sum_warnings = attributes[:'sumWarnings'] if attributes[:'sumWarnings']

      raise 'You cannot provide both :sumWarnings and :sum_warnings' if attributes.key?(:'sumWarnings') && attributes.key?(:'sum_warnings')

      self.sum_warnings = attributes[:'sum_warnings'] if attributes[:'sum_warnings']

      self.sum_rows_affected = attributes[:'sumRowsAffected'] if attributes[:'sumRowsAffected']

      raise 'You cannot provide both :sumRowsAffected and :sum_rows_affected' if attributes.key?(:'sumRowsAffected') && attributes.key?(:'sum_rows_affected')

      self.sum_rows_affected = attributes[:'sum_rows_affected'] if attributes[:'sum_rows_affected']

      self.sum_rows_sent = attributes[:'sumRowsSent'] if attributes[:'sumRowsSent']

      raise 'You cannot provide both :sumRowsSent and :sum_rows_sent' if attributes.key?(:'sumRowsSent') && attributes.key?(:'sum_rows_sent')

      self.sum_rows_sent = attributes[:'sum_rows_sent'] if attributes[:'sum_rows_sent']

      self.sum_rows_examined = attributes[:'sumRowsExamined'] if attributes[:'sumRowsExamined']

      raise 'You cannot provide both :sumRowsExamined and :sum_rows_examined' if attributes.key?(:'sumRowsExamined') && attributes.key?(:'sum_rows_examined')

      self.sum_rows_examined = attributes[:'sum_rows_examined'] if attributes[:'sum_rows_examined']

      self.sum_created_temp_disk_tables = attributes[:'sumCreatedTempDiskTables'] if attributes[:'sumCreatedTempDiskTables']

      raise 'You cannot provide both :sumCreatedTempDiskTables and :sum_created_temp_disk_tables' if attributes.key?(:'sumCreatedTempDiskTables') && attributes.key?(:'sum_created_temp_disk_tables')

      self.sum_created_temp_disk_tables = attributes[:'sum_created_temp_disk_tables'] if attributes[:'sum_created_temp_disk_tables']

      self.sum_created_temp_tables = attributes[:'sumCreatedTempTables'] if attributes[:'sumCreatedTempTables']

      raise 'You cannot provide both :sumCreatedTempTables and :sum_created_temp_tables' if attributes.key?(:'sumCreatedTempTables') && attributes.key?(:'sum_created_temp_tables')

      self.sum_created_temp_tables = attributes[:'sum_created_temp_tables'] if attributes[:'sum_created_temp_tables']

      self.sum_select_full_join = attributes[:'sumSelectFullJoin'] if attributes[:'sumSelectFullJoin']

      raise 'You cannot provide both :sumSelectFullJoin and :sum_select_full_join' if attributes.key?(:'sumSelectFullJoin') && attributes.key?(:'sum_select_full_join')

      self.sum_select_full_join = attributes[:'sum_select_full_join'] if attributes[:'sum_select_full_join']

      self.sum_select_full_range_join = attributes[:'sumSelectFullRangeJoin'] if attributes[:'sumSelectFullRangeJoin']

      raise 'You cannot provide both :sumSelectFullRangeJoin and :sum_select_full_range_join' if attributes.key?(:'sumSelectFullRangeJoin') && attributes.key?(:'sum_select_full_range_join')

      self.sum_select_full_range_join = attributes[:'sum_select_full_range_join'] if attributes[:'sum_select_full_range_join']

      self.sum_select_range = attributes[:'sumSelectRange'] if attributes[:'sumSelectRange']

      raise 'You cannot provide both :sumSelectRange and :sum_select_range' if attributes.key?(:'sumSelectRange') && attributes.key?(:'sum_select_range')

      self.sum_select_range = attributes[:'sum_select_range'] if attributes[:'sum_select_range']

      self.sum_select_range_check = attributes[:'sumSelectRangeCheck'] if attributes[:'sumSelectRangeCheck']

      raise 'You cannot provide both :sumSelectRangeCheck and :sum_select_range_check' if attributes.key?(:'sumSelectRangeCheck') && attributes.key?(:'sum_select_range_check')

      self.sum_select_range_check = attributes[:'sum_select_range_check'] if attributes[:'sum_select_range_check']

      self.sum_select_scan = attributes[:'sumSelectScan'] if attributes[:'sumSelectScan']

      raise 'You cannot provide both :sumSelectScan and :sum_select_scan' if attributes.key?(:'sumSelectScan') && attributes.key?(:'sum_select_scan')

      self.sum_select_scan = attributes[:'sum_select_scan'] if attributes[:'sum_select_scan']

      self.sum_sort_merge_passes = attributes[:'sumSortMergePasses'] if attributes[:'sumSortMergePasses']

      raise 'You cannot provide both :sumSortMergePasses and :sum_sort_merge_passes' if attributes.key?(:'sumSortMergePasses') && attributes.key?(:'sum_sort_merge_passes')

      self.sum_sort_merge_passes = attributes[:'sum_sort_merge_passes'] if attributes[:'sum_sort_merge_passes']

      self.sum_sort_range = attributes[:'sumSortRange'] if attributes[:'sumSortRange']

      raise 'You cannot provide both :sumSortRange and :sum_sort_range' if attributes.key?(:'sumSortRange') && attributes.key?(:'sum_sort_range')

      self.sum_sort_range = attributes[:'sum_sort_range'] if attributes[:'sum_sort_range']

      self.sum_sort_rows = attributes[:'sumSortRows'] if attributes[:'sumSortRows']

      raise 'You cannot provide both :sumSortRows and :sum_sort_rows' if attributes.key?(:'sumSortRows') && attributes.key?(:'sum_sort_rows')

      self.sum_sort_rows = attributes[:'sum_sort_rows'] if attributes[:'sum_sort_rows']

      self.sum_sort_scan = attributes[:'sumSortScan'] if attributes[:'sumSortScan']

      raise 'You cannot provide both :sumSortScan and :sum_sort_scan' if attributes.key?(:'sumSortScan') && attributes.key?(:'sum_sort_scan')

      self.sum_sort_scan = attributes[:'sum_sort_scan'] if attributes[:'sum_sort_scan']

      self.sum_no_index_used = attributes[:'sumNoIndexUsed'] if attributes[:'sumNoIndexUsed']

      raise 'You cannot provide both :sumNoIndexUsed and :sum_no_index_used' if attributes.key?(:'sumNoIndexUsed') && attributes.key?(:'sum_no_index_used')

      self.sum_no_index_used = attributes[:'sum_no_index_used'] if attributes[:'sum_no_index_used']

      self.sum_no_good_index_used = attributes[:'sumNoGoodIndexUsed'] if attributes[:'sumNoGoodIndexUsed']

      raise 'You cannot provide both :sumNoGoodIndexUsed and :sum_no_good_index_used' if attributes.key?(:'sumNoGoodIndexUsed') && attributes.key?(:'sum_no_good_index_used')

      self.sum_no_good_index_used = attributes[:'sum_no_good_index_used'] if attributes[:'sum_no_good_index_used']

      self.first_seen = attributes[:'firstSeen'] if attributes[:'firstSeen']

      raise 'You cannot provide both :firstSeen and :first_seen' if attributes.key?(:'firstSeen') && attributes.key?(:'first_seen')

      self.first_seen = attributes[:'first_seen'] if attributes[:'first_seen']

      self.last_seen = attributes[:'lastSeen'] if attributes[:'lastSeen']

      raise 'You cannot provide both :lastSeen and :last_seen' if attributes.key?(:'lastSeen') && attributes.key?(:'last_seen')

      self.last_seen = attributes[:'last_seen'] if attributes[:'last_seen']

      self.quantile95 = attributes[:'quantile95'] if attributes[:'quantile95']

      self.quantile99 = attributes[:'quantile99'] if attributes[:'quantile99']

      self.quantile999 = attributes[:'quantile999'] if attributes[:'quantile999']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        schema_name == other.schema_name &&
        digest == other.digest &&
        digest_text == other.digest_text &&
        count_star == other.count_star &&
        sum_timer_wait == other.sum_timer_wait &&
        min_timer_wait == other.min_timer_wait &&
        avg_timer_wait == other.avg_timer_wait &&
        max_timer_wait == other.max_timer_wait &&
        sum_lock_time == other.sum_lock_time &&
        sum_errors == other.sum_errors &&
        sum_warnings == other.sum_warnings &&
        sum_rows_affected == other.sum_rows_affected &&
        sum_rows_sent == other.sum_rows_sent &&
        sum_rows_examined == other.sum_rows_examined &&
        sum_created_temp_disk_tables == other.sum_created_temp_disk_tables &&
        sum_created_temp_tables == other.sum_created_temp_tables &&
        sum_select_full_join == other.sum_select_full_join &&
        sum_select_full_range_join == other.sum_select_full_range_join &&
        sum_select_range == other.sum_select_range &&
        sum_select_range_check == other.sum_select_range_check &&
        sum_select_scan == other.sum_select_scan &&
        sum_sort_merge_passes == other.sum_sort_merge_passes &&
        sum_sort_range == other.sum_sort_range &&
        sum_sort_rows == other.sum_sort_rows &&
        sum_sort_scan == other.sum_sort_scan &&
        sum_no_index_used == other.sum_no_index_used &&
        sum_no_good_index_used == other.sum_no_good_index_used &&
        first_seen == other.first_seen &&
        last_seen == other.last_seen &&
        quantile95 == other.quantile95 &&
        quantile99 == other.quantile99 &&
        quantile999 == other.quantile999
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
      [schema_name, digest, digest_text, count_star, sum_timer_wait, min_timer_wait, avg_timer_wait, max_timer_wait, sum_lock_time, sum_errors, sum_warnings, sum_rows_affected, sum_rows_sent, sum_rows_examined, sum_created_temp_disk_tables, sum_created_temp_tables, sum_select_full_join, sum_select_full_range_join, sum_select_range, sum_select_range_check, sum_select_scan, sum_sort_merge_passes, sum_sort_range, sum_sort_rows, sum_sort_scan, sum_no_index_used, sum_no_good_index_used, first_seen, last_seen, quantile95, quantile99, quantile999].hash
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
