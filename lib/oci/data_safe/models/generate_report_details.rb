# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details for the report generation.
  class DataSafe::Models::GenerateReportDetails
    MIME_TYPE_ENUM = [
      MIME_TYPE_PDF = 'PDF'.freeze,
      MIME_TYPE_XLS = 'XLS'.freeze
    ].freeze

    # **[Required]** The name of the report to be generated
    # @return [String]
    attr_accessor :display_name

    # Array of database target OCIDs.
    # @return [Array<String>]
    attr_accessor :target_ids

    # The description of the report to be generated
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment
    # into which the resource should be moved.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Specifies the format of report to be excel or pdf
    # @return [String]
    attr_reader :mime_type

    # Specifies the time before which the data needs to be reported.
    # @return [DateTime]
    attr_accessor :time_less_than

    # Specifies the time after which the data needs to be reported.
    # @return [DateTime]
    attr_accessor :time_greater_than

    # Specifies the limit on number of rows in report.
    # @return [Integer]
    attr_accessor :row_limit

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'target_ids': :'targetIds',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'mime_type': :'mimeType',
        'time_less_than': :'timeLessThan',
        'time_greater_than': :'timeGreaterThan',
        'row_limit': :'rowLimit'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'target_ids': :'Array<String>',
        'description': :'String',
        'compartment_id': :'String',
        'mime_type': :'String',
        'time_less_than': :'DateTime',
        'time_greater_than': :'DateTime',
        'row_limit': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Array<String>] :target_ids The value to assign to the {#target_ids} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :mime_type The value to assign to the {#mime_type} property
    # @option attributes [DateTime] :time_less_than The value to assign to the {#time_less_than} property
    # @option attributes [DateTime] :time_greater_than The value to assign to the {#time_greater_than} property
    # @option attributes [Integer] :row_limit The value to assign to the {#row_limit} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.target_ids = attributes[:'targetIds'] if attributes[:'targetIds']

      raise 'You cannot provide both :targetIds and :target_ids' if attributes.key?(:'targetIds') && attributes.key?(:'target_ids')

      self.target_ids = attributes[:'target_ids'] if attributes[:'target_ids']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.mime_type = attributes[:'mimeType'] if attributes[:'mimeType']

      raise 'You cannot provide both :mimeType and :mime_type' if attributes.key?(:'mimeType') && attributes.key?(:'mime_type')

      self.mime_type = attributes[:'mime_type'] if attributes[:'mime_type']

      self.time_less_than = attributes[:'timeLessThan'] if attributes[:'timeLessThan']

      raise 'You cannot provide both :timeLessThan and :time_less_than' if attributes.key?(:'timeLessThan') && attributes.key?(:'time_less_than')

      self.time_less_than = attributes[:'time_less_than'] if attributes[:'time_less_than']

      self.time_greater_than = attributes[:'timeGreaterThan'] if attributes[:'timeGreaterThan']

      raise 'You cannot provide both :timeGreaterThan and :time_greater_than' if attributes.key?(:'timeGreaterThan') && attributes.key?(:'time_greater_than')

      self.time_greater_than = attributes[:'time_greater_than'] if attributes[:'time_greater_than']

      self.row_limit = attributes[:'rowLimit'] if attributes[:'rowLimit']

      raise 'You cannot provide both :rowLimit and :row_limit' if attributes.key?(:'rowLimit') && attributes.key?(:'row_limit')

      self.row_limit = attributes[:'row_limit'] if attributes[:'row_limit']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] mime_type Object to be assigned
    def mime_type=(mime_type)
      raise "Invalid value for 'mime_type': this must be one of the values in MIME_TYPE_ENUM." if mime_type && !MIME_TYPE_ENUM.include?(mime_type)

      @mime_type = mime_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        target_ids == other.target_ids &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        mime_type == other.mime_type &&
        time_less_than == other.time_less_than &&
        time_greater_than == other.time_greater_than &&
        row_limit == other.row_limit
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
      [display_name, target_ids, description, compartment_id, mime_type, time_less_than, time_greater_than, row_limit].hash
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