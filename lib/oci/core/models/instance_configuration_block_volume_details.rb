# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Create new block volumes or attach to an existing volume. Specify either createDetails or volumeId.
  #
  class Core::Models::InstanceConfigurationBlockVolumeDetails
    # @return [OCI::Core::Models::InstanceConfigurationAttachVolumeDetails]
    attr_accessor :attach_details

    # @return [OCI::Core::Models::InstanceConfigurationCreateVolumeDetails]
    attr_accessor :create_details

    # The OCID of the volume.
    # @return [String]
    attr_accessor :volume_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'attach_details': :'attachDetails',
        'create_details': :'createDetails',
        'volume_id': :'volumeId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'attach_details': :'OCI::Core::Models::InstanceConfigurationAttachVolumeDetails',
        'create_details': :'OCI::Core::Models::InstanceConfigurationCreateVolumeDetails',
        'volume_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Core::Models::InstanceConfigurationAttachVolumeDetails] :attach_details The value to assign to the {#attach_details} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationCreateVolumeDetails] :create_details The value to assign to the {#create_details} property
    # @option attributes [String] :volume_id The value to assign to the {#volume_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.attach_details = attributes[:'attachDetails'] if attributes[:'attachDetails']

      raise 'You cannot provide both :attachDetails and :attach_details' if attributes.key?(:'attachDetails') && attributes.key?(:'attach_details')

      self.attach_details = attributes[:'attach_details'] if attributes[:'attach_details']

      self.create_details = attributes[:'createDetails'] if attributes[:'createDetails']

      raise 'You cannot provide both :createDetails and :create_details' if attributes.key?(:'createDetails') && attributes.key?(:'create_details')

      self.create_details = attributes[:'create_details'] if attributes[:'create_details']

      self.volume_id = attributes[:'volumeId'] if attributes[:'volumeId']

      raise 'You cannot provide both :volumeId and :volume_id' if attributes.key?(:'volumeId') && attributes.key?(:'volume_id')

      self.volume_id = attributes[:'volume_id'] if attributes[:'volume_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        attach_details == other.attach_details &&
        create_details == other.create_details &&
        volume_id == other.volume_id
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
      [attach_details, create_details, volume_id].hash
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
