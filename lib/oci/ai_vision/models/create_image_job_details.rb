# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the batch image analysis.
  class AiVision::Models::CreateImageJobDetails
    # This attribute is required.
    # @return [OCI::AiVision::Models::InputLocation]
    attr_accessor :input_location

    # **[Required]** The list of requested image analysis types.
    # @return [Array<OCI::AiVision::Models::ImageFeature>]
    attr_accessor :features

    # This attribute is required.
    # @return [OCI::AiVision::Models::OutputLocation]
    attr_accessor :output_location

    # The compartment identifier from the requester.
    # @return [String]
    attr_accessor :compartment_id

    # The image job display name.
    # @return [String]
    attr_accessor :display_name

    # Whether or not to generate a ZIP file containing the results.
    # @return [BOOLEAN]
    attr_accessor :is_zip_output_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'input_location': :'inputLocation',
        'features': :'features',
        'output_location': :'outputLocation',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'is_zip_output_enabled': :'isZipOutputEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'input_location': :'OCI::AiVision::Models::InputLocation',
        'features': :'Array<OCI::AiVision::Models::ImageFeature>',
        'output_location': :'OCI::AiVision::Models::OutputLocation',
        'compartment_id': :'String',
        'display_name': :'String',
        'is_zip_output_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::AiVision::Models::InputLocation] :input_location The value to assign to the {#input_location} property
    # @option attributes [Array<OCI::AiVision::Models::ImageFeature>] :features The value to assign to the {#features} property
    # @option attributes [OCI::AiVision::Models::OutputLocation] :output_location The value to assign to the {#output_location} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_zip_output_enabled The value to assign to the {#is_zip_output_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.input_location = attributes[:'inputLocation'] if attributes[:'inputLocation']

      raise 'You cannot provide both :inputLocation and :input_location' if attributes.key?(:'inputLocation') && attributes.key?(:'input_location')

      self.input_location = attributes[:'input_location'] if attributes[:'input_location']

      self.features = attributes[:'features'] if attributes[:'features']

      self.output_location = attributes[:'outputLocation'] if attributes[:'outputLocation']

      raise 'You cannot provide both :outputLocation and :output_location' if attributes.key?(:'outputLocation') && attributes.key?(:'output_location')

      self.output_location = attributes[:'output_location'] if attributes[:'output_location']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_zip_output_enabled = attributes[:'isZipOutputEnabled'] unless attributes[:'isZipOutputEnabled'].nil?
      self.is_zip_output_enabled = false if is_zip_output_enabled.nil? && !attributes.key?(:'isZipOutputEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isZipOutputEnabled and :is_zip_output_enabled' if attributes.key?(:'isZipOutputEnabled') && attributes.key?(:'is_zip_output_enabled')

      self.is_zip_output_enabled = attributes[:'is_zip_output_enabled'] unless attributes[:'is_zip_output_enabled'].nil?
      self.is_zip_output_enabled = false if is_zip_output_enabled.nil? && !attributes.key?(:'isZipOutputEnabled') && !attributes.key?(:'is_zip_output_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        input_location == other.input_location &&
        features == other.features &&
        output_location == other.output_location &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        is_zip_output_enabled == other.is_zip_output_enabled
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
      [input_location, features, output_location, compartment_id, display_name, is_zip_output_enabled].hash
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
