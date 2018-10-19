# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'volume_attachment'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A paravirtualized volume attachment.
  class Core::Models::ParavirtualizedVolumeAttachment < Core::Models::VolumeAttachment # rubocop:disable Metrics/LineLength
    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'attachment_type': :'attachmentType',
        'availability_domain': :'availabilityDomain',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'id': :'id',
        'instance_id': :'instanceId',
        'is_read_only': :'isReadOnly',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'volume_id': :'volumeId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'attachment_type': :'String',
        'availability_domain': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'id': :'String',
        'instance_id': :'String',
        'is_read_only': :'BOOLEAN',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'volume_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {OCI::Core::Models::VolumeAttachment#availability_domain #availability_domain} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Core::Models::VolumeAttachment#compartment_id #compartment_id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Core::Models::VolumeAttachment#display_name #display_name} proprety
    # @option attributes [String] :id The value to assign to the {OCI::Core::Models::VolumeAttachment#id #id} proprety
    # @option attributes [String] :instance_id The value to assign to the {OCI::Core::Models::VolumeAttachment#instance_id #instance_id} proprety
    # @option attributes [BOOLEAN] :is_read_only The value to assign to the {OCI::Core::Models::VolumeAttachment#is_read_only #is_read_only} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Core::Models::VolumeAttachment#lifecycle_state #lifecycle_state} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Core::Models::VolumeAttachment#time_created #time_created} proprety
    # @option attributes [String] :volume_id The value to assign to the {OCI::Core::Models::VolumeAttachment#volume_id #volume_id} proprety
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['attachmentType'] = 'paravirtualized'

      super(attributes)
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        attachment_type == other.attachment_type &&
        availability_domain == other.availability_domain &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        id == other.id &&
        instance_id == other.instance_id &&
        is_read_only == other.is_read_only &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        volume_id == other.volume_id
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [attachment_type, availability_domain, compartment_id, display_name, id, instance_id, is_read_only, lifecycle_state, time_created, volume_id].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
