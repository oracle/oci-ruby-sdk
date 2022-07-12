# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The request of DiscoveryJob details.
  class StackMonitoring::Models::CreateDiscoveryJobDetails
    DISCOVERY_TYPE_ENUM = [
      DISCOVERY_TYPE_ADD = 'ADD'.freeze,
      DISCOVERY_TYPE_ADD_WITH_RETRY = 'ADD_WITH_RETRY'.freeze,
      DISCOVERY_TYPE_REFRESH = 'REFRESH'.freeze
    ].freeze

    # Add option submits new discovery Job. Add with retry option to re-submit failed discovery job. Refresh option refreshes the existing discovered resources.
    #
    # @return [String]
    attr_reader :discovery_type

    # Client who submits discovery job.
    # @return [String]
    attr_accessor :discovery_client

    # **[Required]** The OCID of Compartment
    # @return [String]
    attr_accessor :compartment_id

    # This attribute is required.
    # @return [OCI::StackMonitoring::Models::DiscoveryDetails]
    attr_accessor :discovery_details

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'discovery_type': :'discoveryType',
        'discovery_client': :'discoveryClient',
        'compartment_id': :'compartmentId',
        'discovery_details': :'discoveryDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'discovery_type': :'String',
        'discovery_client': :'String',
        'compartment_id': :'String',
        'discovery_details': :'OCI::StackMonitoring::Models::DiscoveryDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :discovery_type The value to assign to the {#discovery_type} property
    # @option attributes [String] :discovery_client The value to assign to the {#discovery_client} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::StackMonitoring::Models::DiscoveryDetails] :discovery_details The value to assign to the {#discovery_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.discovery_type = attributes[:'discoveryType'] if attributes[:'discoveryType']
      self.discovery_type = "ADD" if discovery_type.nil? && !attributes.key?(:'discoveryType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :discoveryType and :discovery_type' if attributes.key?(:'discoveryType') && attributes.key?(:'discovery_type')

      self.discovery_type = attributes[:'discovery_type'] if attributes[:'discovery_type']
      self.discovery_type = "ADD" if discovery_type.nil? && !attributes.key?(:'discoveryType') && !attributes.key?(:'discovery_type') # rubocop:disable Style/StringLiterals

      self.discovery_client = attributes[:'discoveryClient'] if attributes[:'discoveryClient']

      raise 'You cannot provide both :discoveryClient and :discovery_client' if attributes.key?(:'discoveryClient') && attributes.key?(:'discovery_client')

      self.discovery_client = attributes[:'discovery_client'] if attributes[:'discovery_client']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.discovery_details = attributes[:'discoveryDetails'] if attributes[:'discoveryDetails']

      raise 'You cannot provide both :discoveryDetails and :discovery_details' if attributes.key?(:'discoveryDetails') && attributes.key?(:'discovery_details')

      self.discovery_details = attributes[:'discovery_details'] if attributes[:'discovery_details']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] discovery_type Object to be assigned
    def discovery_type=(discovery_type)
      raise "Invalid value for 'discovery_type': this must be one of the values in DISCOVERY_TYPE_ENUM." if discovery_type && !DISCOVERY_TYPE_ENUM.include?(discovery_type)

      @discovery_type = discovery_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        discovery_type == other.discovery_type &&
        discovery_client == other.discovery_client &&
        compartment_id == other.compartment_id &&
        discovery_details == other.discovery_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [discovery_type, discovery_client, compartment_id, discovery_details, freeform_tags, defined_tags].hash
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
