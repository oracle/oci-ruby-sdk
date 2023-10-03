# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20200630
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Thread snapshot.
  #
  class ApmTraces::Models::ThreadSnapshot
    # Snapshot time.
    #
    # @return [DateTime]
    attr_accessor :time_stamp

    # Snapshot details.
    #
    # @return [Array<OCI::ApmTraces::Models::SnapshotDetail>]
    attr_accessor :thread_snapshot_details

    # Stack trace.
    #
    # @return [Array<OCI::ApmTraces::Models::StackTraceElement>]
    attr_accessor :stack_trace

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_stamp': :'timeStamp',
        'thread_snapshot_details': :'threadSnapshotDetails',
        'stack_trace': :'stackTrace'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_stamp': :'DateTime',
        'thread_snapshot_details': :'Array<OCI::ApmTraces::Models::SnapshotDetail>',
        'stack_trace': :'Array<OCI::ApmTraces::Models::StackTraceElement>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_stamp The value to assign to the {#time_stamp} property
    # @option attributes [Array<OCI::ApmTraces::Models::SnapshotDetail>] :thread_snapshot_details The value to assign to the {#thread_snapshot_details} property
    # @option attributes [Array<OCI::ApmTraces::Models::StackTraceElement>] :stack_trace The value to assign to the {#stack_trace} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_stamp = attributes[:'timeStamp'] if attributes[:'timeStamp']

      raise 'You cannot provide both :timeStamp and :time_stamp' if attributes.key?(:'timeStamp') && attributes.key?(:'time_stamp')

      self.time_stamp = attributes[:'time_stamp'] if attributes[:'time_stamp']

      self.thread_snapshot_details = attributes[:'threadSnapshotDetails'] if attributes[:'threadSnapshotDetails']

      raise 'You cannot provide both :threadSnapshotDetails and :thread_snapshot_details' if attributes.key?(:'threadSnapshotDetails') && attributes.key?(:'thread_snapshot_details')

      self.thread_snapshot_details = attributes[:'thread_snapshot_details'] if attributes[:'thread_snapshot_details']

      self.stack_trace = attributes[:'stackTrace'] if attributes[:'stackTrace']

      raise 'You cannot provide both :stackTrace and :stack_trace' if attributes.key?(:'stackTrace') && attributes.key?(:'stack_trace')

      self.stack_trace = attributes[:'stack_trace'] if attributes[:'stack_trace']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_stamp == other.time_stamp &&
        thread_snapshot_details == other.thread_snapshot_details &&
        stack_trace == other.stack_trace
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
      [time_stamp, thread_snapshot_details, stack_trace].hash
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
