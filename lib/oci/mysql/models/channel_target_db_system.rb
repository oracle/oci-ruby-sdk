# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'channel_target'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Core properties of a DB System Channel target.
  class Mysql::Models::ChannelTargetDbSystem < Mysql::Models::ChannelTarget
    # **[Required]** The OCID of the source DB System.
    # @return [String]
    attr_accessor :db_system_id

    # **[Required]** The case-insensitive name that identifies the replication channel. Channel names
    # must follow the rules defined for [MySQL identifiers](https://dev.mysql.com/doc/refman/8.0/en/identifiers.html).
    # The names of non-Deleted Channels must be unique for each DB System.
    #
    # @return [String]
    attr_accessor :channel_name

    # **[Required]** The username for the replication applier of the target MySQL DB System.
    # @return [String]
    attr_accessor :applier_username

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_type': :'targetType',
        'db_system_id': :'dbSystemId',
        'channel_name': :'channelName',
        'applier_username': :'applierUsername'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_type': :'String',
        'db_system_id': :'String',
        'channel_name': :'String',
        'applier_username': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :channel_name The value to assign to the {#channel_name} property
    # @option attributes [String] :applier_username The value to assign to the {#applier_username} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['targetType'] = 'DBSYSTEM'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.channel_name = attributes[:'channelName'] if attributes[:'channelName']

      raise 'You cannot provide both :channelName and :channel_name' if attributes.key?(:'channelName') && attributes.key?(:'channel_name')

      self.channel_name = attributes[:'channel_name'] if attributes[:'channel_name']

      self.applier_username = attributes[:'applierUsername'] if attributes[:'applierUsername']

      raise 'You cannot provide both :applierUsername and :applier_username' if attributes.key?(:'applierUsername') && attributes.key?(:'applier_username')

      self.applier_username = attributes[:'applier_username'] if attributes[:'applier_username']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_type == other.target_type &&
        db_system_id == other.db_system_id &&
        channel_name == other.channel_name &&
        applier_username == other.applier_username
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
      [target_type, db_system_id, channel_name, applier_username].hash
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
