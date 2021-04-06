# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Sql bucket type object.
  class Opsi::Models::SqlBucket
    # Version
    # Example: `1`
    #
    # @return [Float]
    attr_accessor :version

    # Operations Insights internal representation of the database type.
    # @return [String]
    attr_accessor :database_type

    # **[Required]** Collection timestamp
    # Example: `\"2020-03-31T00:00:00.000Z\"`
    #
    # @return [DateTime]
    attr_accessor :time_collected

    # **[Required]** Unique SQL_ID for a SQL Statement.
    #
    # @return [String]
    attr_accessor :sql_identifier

    # **[Required]** Plan hash value for the SQL Execution Plan
    # @return [Integer]
    attr_accessor :plan_hash

    # **[Required]** SQL Bucket ID, examples <= 3 secs, 3-10 secs, 10-60 secs, 1-5 min, > 5 min
    # Example: `\"<= 3 secs\"`
    #
    # @return [String]
    attr_accessor :bucket_id

    # Total number of executions
    # Example: `60`
    #
    # @return [Integer]
    attr_accessor :executions_count

    # Total CPU time
    # Example: `1046`
    #
    # @return [Float]
    attr_accessor :cpu_time_in_sec

    # Total IO time
    # Example: `5810`
    #
    # @return [Float]
    attr_accessor :io_time_in_sec

    # Total other wait time
    # Example: `24061`
    #
    # @return [Float]
    attr_accessor :other_wait_time_in_sec

    # Total time
    # Example: `30917`
    #
    # @return [Float]
    attr_accessor :total_time_in_sec

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'version',
        'database_type': :'databaseType',
        'time_collected': :'timeCollected',
        'sql_identifier': :'sqlIdentifier',
        'plan_hash': :'planHash',
        'bucket_id': :'bucketId',
        'executions_count': :'executionsCount',
        'cpu_time_in_sec': :'cpuTimeInSec',
        'io_time_in_sec': :'ioTimeInSec',
        'other_wait_time_in_sec': :'otherWaitTimeInSec',
        'total_time_in_sec': :'totalTimeInSec'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'Float',
        'database_type': :'String',
        'time_collected': :'DateTime',
        'sql_identifier': :'String',
        'plan_hash': :'Integer',
        'bucket_id': :'String',
        'executions_count': :'Integer',
        'cpu_time_in_sec': :'Float',
        'io_time_in_sec': :'Float',
        'other_wait_time_in_sec': :'Float',
        'total_time_in_sec': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :version The value to assign to the {#version} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [DateTime] :time_collected The value to assign to the {#time_collected} property
    # @option attributes [String] :sql_identifier The value to assign to the {#sql_identifier} property
    # @option attributes [Integer] :plan_hash The value to assign to the {#plan_hash} property
    # @option attributes [String] :bucket_id The value to assign to the {#bucket_id} property
    # @option attributes [Integer] :executions_count The value to assign to the {#executions_count} property
    # @option attributes [Float] :cpu_time_in_sec The value to assign to the {#cpu_time_in_sec} property
    # @option attributes [Float] :io_time_in_sec The value to assign to the {#io_time_in_sec} property
    # @option attributes [Float] :other_wait_time_in_sec The value to assign to the {#other_wait_time_in_sec} property
    # @option attributes [Float] :total_time_in_sec The value to assign to the {#total_time_in_sec} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.version = attributes[:'version'] if attributes[:'version']

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.time_collected = attributes[:'timeCollected'] if attributes[:'timeCollected']

      raise 'You cannot provide both :timeCollected and :time_collected' if attributes.key?(:'timeCollected') && attributes.key?(:'time_collected')

      self.time_collected = attributes[:'time_collected'] if attributes[:'time_collected']

      self.sql_identifier = attributes[:'sqlIdentifier'] if attributes[:'sqlIdentifier']

      raise 'You cannot provide both :sqlIdentifier and :sql_identifier' if attributes.key?(:'sqlIdentifier') && attributes.key?(:'sql_identifier')

      self.sql_identifier = attributes[:'sql_identifier'] if attributes[:'sql_identifier']

      self.plan_hash = attributes[:'planHash'] if attributes[:'planHash']

      raise 'You cannot provide both :planHash and :plan_hash' if attributes.key?(:'planHash') && attributes.key?(:'plan_hash')

      self.plan_hash = attributes[:'plan_hash'] if attributes[:'plan_hash']

      self.bucket_id = attributes[:'bucketId'] if attributes[:'bucketId']

      raise 'You cannot provide both :bucketId and :bucket_id' if attributes.key?(:'bucketId') && attributes.key?(:'bucket_id')

      self.bucket_id = attributes[:'bucket_id'] if attributes[:'bucket_id']

      self.executions_count = attributes[:'executionsCount'] if attributes[:'executionsCount']

      raise 'You cannot provide both :executionsCount and :executions_count' if attributes.key?(:'executionsCount') && attributes.key?(:'executions_count')

      self.executions_count = attributes[:'executions_count'] if attributes[:'executions_count']

      self.cpu_time_in_sec = attributes[:'cpuTimeInSec'] if attributes[:'cpuTimeInSec']

      raise 'You cannot provide both :cpuTimeInSec and :cpu_time_in_sec' if attributes.key?(:'cpuTimeInSec') && attributes.key?(:'cpu_time_in_sec')

      self.cpu_time_in_sec = attributes[:'cpu_time_in_sec'] if attributes[:'cpu_time_in_sec']

      self.io_time_in_sec = attributes[:'ioTimeInSec'] if attributes[:'ioTimeInSec']

      raise 'You cannot provide both :ioTimeInSec and :io_time_in_sec' if attributes.key?(:'ioTimeInSec') && attributes.key?(:'io_time_in_sec')

      self.io_time_in_sec = attributes[:'io_time_in_sec'] if attributes[:'io_time_in_sec']

      self.other_wait_time_in_sec = attributes[:'otherWaitTimeInSec'] if attributes[:'otherWaitTimeInSec']

      raise 'You cannot provide both :otherWaitTimeInSec and :other_wait_time_in_sec' if attributes.key?(:'otherWaitTimeInSec') && attributes.key?(:'other_wait_time_in_sec')

      self.other_wait_time_in_sec = attributes[:'other_wait_time_in_sec'] if attributes[:'other_wait_time_in_sec']

      self.total_time_in_sec = attributes[:'totalTimeInSec'] if attributes[:'totalTimeInSec']

      raise 'You cannot provide both :totalTimeInSec and :total_time_in_sec' if attributes.key?(:'totalTimeInSec') && attributes.key?(:'total_time_in_sec')

      self.total_time_in_sec = attributes[:'total_time_in_sec'] if attributes[:'total_time_in_sec']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        version == other.version &&
        database_type == other.database_type &&
        time_collected == other.time_collected &&
        sql_identifier == other.sql_identifier &&
        plan_hash == other.plan_hash &&
        bucket_id == other.bucket_id &&
        executions_count == other.executions_count &&
        cpu_time_in_sec == other.cpu_time_in_sec &&
        io_time_in_sec == other.io_time_in_sec &&
        other_wait_time_in_sec == other.other_wait_time_in_sec &&
        total_time_in_sec == other.total_time_in_sec
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
      [version, database_type, time_collected, sql_identifier, plan_hash, bucket_id, executions_count, cpu_time_in_sec, io_time_in_sec, other_wait_time_in_sec, total_time_in_sec].hash
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
