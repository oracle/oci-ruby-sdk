# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Settings for the Kafka compatibility layer.
  class Streaming::Models::KafkaSettings
    # Bootstrap servers.
    # @return [String]
    attr_accessor :bootstrap_servers

    # Enable auto creation of topic on the server.
    # @return [BOOLEAN]
    attr_accessor :auto_create_topics_enable

    # The number of hours to keep a log file before deleting it (in hours).
    # @return [Integer]
    attr_accessor :log_retention_hours

    # The default number of log partitions per topic.
    # @return [Integer]
    attr_accessor :num_partitions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bootstrap_servers': :'bootstrapServers',
        'auto_create_topics_enable': :'autoCreateTopicsEnable',
        'log_retention_hours': :'logRetentionHours',
        'num_partitions': :'numPartitions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bootstrap_servers': :'String',
        'auto_create_topics_enable': :'BOOLEAN',
        'log_retention_hours': :'Integer',
        'num_partitions': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bootstrap_servers The value to assign to the {#bootstrap_servers} property
    # @option attributes [BOOLEAN] :auto_create_topics_enable The value to assign to the {#auto_create_topics_enable} property
    # @option attributes [Integer] :log_retention_hours The value to assign to the {#log_retention_hours} property
    # @option attributes [Integer] :num_partitions The value to assign to the {#num_partitions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bootstrap_servers = attributes[:'bootstrapServers'] if attributes[:'bootstrapServers']

      raise 'You cannot provide both :bootstrapServers and :bootstrap_servers' if attributes.key?(:'bootstrapServers') && attributes.key?(:'bootstrap_servers')

      self.bootstrap_servers = attributes[:'bootstrap_servers'] if attributes[:'bootstrap_servers']

      self.auto_create_topics_enable = attributes[:'autoCreateTopicsEnable'] unless attributes[:'autoCreateTopicsEnable'].nil?

      raise 'You cannot provide both :autoCreateTopicsEnable and :auto_create_topics_enable' if attributes.key?(:'autoCreateTopicsEnable') && attributes.key?(:'auto_create_topics_enable')

      self.auto_create_topics_enable = attributes[:'auto_create_topics_enable'] unless attributes[:'auto_create_topics_enable'].nil?

      self.log_retention_hours = attributes[:'logRetentionHours'] if attributes[:'logRetentionHours']

      raise 'You cannot provide both :logRetentionHours and :log_retention_hours' if attributes.key?(:'logRetentionHours') && attributes.key?(:'log_retention_hours')

      self.log_retention_hours = attributes[:'log_retention_hours'] if attributes[:'log_retention_hours']

      self.num_partitions = attributes[:'numPartitions'] if attributes[:'numPartitions']

      raise 'You cannot provide both :numPartitions and :num_partitions' if attributes.key?(:'numPartitions') && attributes.key?(:'num_partitions')

      self.num_partitions = attributes[:'num_partitions'] if attributes[:'num_partitions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bootstrap_servers == other.bootstrap_servers &&
        auto_create_topics_enable == other.auto_create_topics_enable &&
        log_retention_hours == other.log_retention_hours &&
        num_partitions == other.num_partitions
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
      [bootstrap_servers, auto_create_topics_enable, log_retention_hours, num_partitions].hash
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
