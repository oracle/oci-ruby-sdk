# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'instance_configuration_instance_details'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # Compute Instance Configuration instance details.
  class Core::Models::ComputeInstanceDetails < Core::Models::InstanceConfigurationInstanceDetails # rubocop:disable Metrics/LineLength
    # @return [Array<OCI::Core::Models::InstanceConfigurationBlockVolumeDetails>]
    attr_accessor :block_volumes

    # @return [OCI::Core::Models::InstanceConfigurationLaunchInstanceDetails]
    attr_accessor :launch_details

    # @return [Array<OCI::Core::Models::InstanceConfigurationAttachVnicDetails>]
    attr_accessor :secondary_vnics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_type': :'instanceType',
        'block_volumes': :'blockVolumes',
        'launch_details': :'launchDetails',
        'secondary_vnics': :'secondaryVnics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'instance_type': :'String',
        'block_volumes': :'Array<OCI::Core::Models::InstanceConfigurationBlockVolumeDetails>',
        'launch_details': :'OCI::Core::Models::InstanceConfigurationLaunchInstanceDetails',
        'secondary_vnics': :'Array<OCI::Core::Models::InstanceConfigurationAttachVnicDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Core::Models::InstanceConfigurationBlockVolumeDetails>] :block_volumes The value to assign to the {#block_volumes} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationLaunchInstanceDetails] :launch_details The value to assign to the {#launch_details} property
    # @option attributes [Array<OCI::Core::Models::InstanceConfigurationAttachVnicDetails>] :secondary_vnics The value to assign to the {#secondary_vnics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['instanceType'] = 'compute'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.block_volumes = attributes[:'blockVolumes'] if attributes[:'blockVolumes']

      raise 'You cannot provide both :blockVolumes and :block_volumes' if attributes.key?(:'blockVolumes') && attributes.key?(:'block_volumes')

      self.block_volumes = attributes[:'block_volumes'] if attributes[:'block_volumes']

      self.launch_details = attributes[:'launchDetails'] if attributes[:'launchDetails']

      raise 'You cannot provide both :launchDetails and :launch_details' if attributes.key?(:'launchDetails') && attributes.key?(:'launch_details')

      self.launch_details = attributes[:'launch_details'] if attributes[:'launch_details']

      self.secondary_vnics = attributes[:'secondaryVnics'] if attributes[:'secondaryVnics']

      raise 'You cannot provide both :secondaryVnics and :secondary_vnics' if attributes.key?(:'secondaryVnics') && attributes.key?(:'secondary_vnics')

      self.secondary_vnics = attributes[:'secondary_vnics'] if attributes[:'secondary_vnics']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        instance_type == other.instance_type &&
        block_volumes == other.block_volumes &&
        launch_details == other.launch_details &&
        secondary_vnics == other.secondary_vnics
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [instance_type, block_volumes, launch_details, secondary_vnics].hash
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