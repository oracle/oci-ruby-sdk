# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'event'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about a Kernel Crash.
  class OsManagement::Models::KernelCrashEvent < OsManagement::Models::Event
    # reason of the crash
    # @return [String]
    attr_accessor :reason

    # First occurrence time of the event
    # @return [DateTime]
    attr_accessor :time_first_occurred

    # @return [OCI::OsManagement::Models::KernelVmCoreInformation]
    attr_accessor :vmcore

    # @return [OCI::OsManagement::Models::EventContent]
    attr_accessor :content

    # @return [OCI::OsManagement::Models::CrashEventSystemInformation]
    attr_accessor :system

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'instance_id': :'instanceId',
        'compartment_id': :'compartmentId',
        'tenancy_id': :'tenancyId',
        'summary': :'summary',
        'timestamp': :'timestamp',
        'event_fingerprint': :'eventFingerprint',
        'count': :'count',
        'event_type': :'eventType',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'reason': :'reason',
        'time_first_occurred': :'timeFirstOccurred',
        'vmcore': :'vmcore',
        'content': :'content',
        'system': :'system'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'instance_id': :'String',
        'compartment_id': :'String',
        'tenancy_id': :'String',
        'summary': :'String',
        'timestamp': :'DateTime',
        'event_fingerprint': :'String',
        'count': :'Integer',
        'event_type': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'reason': :'String',
        'time_first_occurred': :'DateTime',
        'vmcore': :'OCI::OsManagement::Models::KernelVmCoreInformation',
        'content': :'OCI::OsManagement::Models::EventContent',
        'system': :'OCI::OsManagement::Models::CrashEventSystemInformation'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::OsManagement::Models::Event#id #id} proprety
    # @option attributes [String] :instance_id The value to assign to the {OCI::OsManagement::Models::Event#instance_id #instance_id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::OsManagement::Models::Event#compartment_id #compartment_id} proprety
    # @option attributes [String] :tenancy_id The value to assign to the {OCI::OsManagement::Models::Event#tenancy_id #tenancy_id} proprety
    # @option attributes [String] :summary The value to assign to the {OCI::OsManagement::Models::Event#summary #summary} proprety
    # @option attributes [DateTime] :timestamp The value to assign to the {OCI::OsManagement::Models::Event#timestamp #timestamp} proprety
    # @option attributes [String] :event_fingerprint The value to assign to the {OCI::OsManagement::Models::Event#event_fingerprint #event_fingerprint} proprety
    # @option attributes [Integer] :count The value to assign to the {OCI::OsManagement::Models::Event#count #count} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::OsManagement::Models::Event#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::OsManagement::Models::Event#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::OsManagement::Models::Event#system_tags #system_tags} proprety
    # @option attributes [String] :reason The value to assign to the {#reason} property
    # @option attributes [DateTime] :time_first_occurred The value to assign to the {#time_first_occurred} property
    # @option attributes [OCI::OsManagement::Models::KernelVmCoreInformation] :vmcore The value to assign to the {#vmcore} property
    # @option attributes [OCI::OsManagement::Models::EventContent] :content The value to assign to the {#content} property
    # @option attributes [OCI::OsManagement::Models::CrashEventSystemInformation] :system The value to assign to the {#system} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['eventType'] = 'KERNEL_CRASH'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.reason = attributes[:'reason'] if attributes[:'reason']

      self.time_first_occurred = attributes[:'timeFirstOccurred'] if attributes[:'timeFirstOccurred']

      raise 'You cannot provide both :timeFirstOccurred and :time_first_occurred' if attributes.key?(:'timeFirstOccurred') && attributes.key?(:'time_first_occurred')

      self.time_first_occurred = attributes[:'time_first_occurred'] if attributes[:'time_first_occurred']

      self.vmcore = attributes[:'vmcore'] if attributes[:'vmcore']

      self.content = attributes[:'content'] if attributes[:'content']

      self.system = attributes[:'system'] if attributes[:'system']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        instance_id == other.instance_id &&
        compartment_id == other.compartment_id &&
        tenancy_id == other.tenancy_id &&
        summary == other.summary &&
        timestamp == other.timestamp &&
        event_fingerprint == other.event_fingerprint &&
        count == other.count &&
        event_type == other.event_type &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        reason == other.reason &&
        time_first_occurred == other.time_first_occurred &&
        vmcore == other.vmcore &&
        content == other.content &&
        system == other.system
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
      [id, instance_id, compartment_id, tenancy_id, summary, timestamp, event_fingerprint, count, event_type, freeform_tags, defined_tags, system_tags, reason, time_first_occurred, vmcore, content, system].hash
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
