# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Provides the details for switching module streams on the managed instance group.
  class OsManagementHub::Models::SwitchModuleStreamOnManagedInstanceGroupDetails
    # **[Required]** The name of the module.
    # @return [String]
    attr_accessor :module_name

    # **[Required]** The name of a stream of the specified module.
    # @return [String]
    attr_accessor :stream_name

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the software source that provides the module stream
    # @return [String]
    attr_accessor :software_source_id

    # @return [OCI::OsManagementHub::Models::WorkRequestDetails]
    attr_accessor :work_request_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'module_name': :'moduleName',
        'stream_name': :'streamName',
        'software_source_id': :'softwareSourceId',
        'work_request_details': :'workRequestDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'module_name': :'String',
        'stream_name': :'String',
        'software_source_id': :'String',
        'work_request_details': :'OCI::OsManagementHub::Models::WorkRequestDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :module_name The value to assign to the {#module_name} property
    # @option attributes [String] :stream_name The value to assign to the {#stream_name} property
    # @option attributes [String] :software_source_id The value to assign to the {#software_source_id} property
    # @option attributes [OCI::OsManagementHub::Models::WorkRequestDetails] :work_request_details The value to assign to the {#work_request_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.module_name = attributes[:'moduleName'] if attributes[:'moduleName']

      raise 'You cannot provide both :moduleName and :module_name' if attributes.key?(:'moduleName') && attributes.key?(:'module_name')

      self.module_name = attributes[:'module_name'] if attributes[:'module_name']

      self.stream_name = attributes[:'streamName'] if attributes[:'streamName']

      raise 'You cannot provide both :streamName and :stream_name' if attributes.key?(:'streamName') && attributes.key?(:'stream_name')

      self.stream_name = attributes[:'stream_name'] if attributes[:'stream_name']

      self.software_source_id = attributes[:'softwareSourceId'] if attributes[:'softwareSourceId']

      raise 'You cannot provide both :softwareSourceId and :software_source_id' if attributes.key?(:'softwareSourceId') && attributes.key?(:'software_source_id')

      self.software_source_id = attributes[:'software_source_id'] if attributes[:'software_source_id']

      self.work_request_details = attributes[:'workRequestDetails'] if attributes[:'workRequestDetails']

      raise 'You cannot provide both :workRequestDetails and :work_request_details' if attributes.key?(:'workRequestDetails') && attributes.key?(:'work_request_details')

      self.work_request_details = attributes[:'work_request_details'] if attributes[:'work_request_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        module_name == other.module_name &&
        stream_name == other.stream_name &&
        software_source_id == other.software_source_id &&
        work_request_details == other.work_request_details
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
      [module_name, stream_name, software_source_id, work_request_details].hash
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
