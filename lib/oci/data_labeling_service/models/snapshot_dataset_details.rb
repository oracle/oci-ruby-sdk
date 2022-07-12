# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Allows outputting the latest records paired with annotations and write them to object storage.
  class DataLabelingService::Models::SnapshotDatasetDetails
    # **[Required]** Whether annotations are to be included in the export dataset digest.
    # @return [BOOLEAN]
    attr_accessor :are_annotations_included

    # **[Required]** Whether to include records that have yet to be annotated in the export dataset digest.
    # @return [BOOLEAN]
    attr_accessor :are_unannotated_records_included

    # This attribute is required.
    # @return [OCI::DataLabelingService::Models::ObjectStorageSnapshotExportDetails]
    attr_accessor :export_details

    # @return [OCI::DataLabelingService::Models::ExportFormat]
    attr_accessor :export_format

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'are_annotations_included': :'areAnnotationsIncluded',
        'are_unannotated_records_included': :'areUnannotatedRecordsIncluded',
        'export_details': :'exportDetails',
        'export_format': :'exportFormat'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'are_annotations_included': :'BOOLEAN',
        'are_unannotated_records_included': :'BOOLEAN',
        'export_details': :'OCI::DataLabelingService::Models::ObjectStorageSnapshotExportDetails',
        'export_format': :'OCI::DataLabelingService::Models::ExportFormat'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :are_annotations_included The value to assign to the {#are_annotations_included} property
    # @option attributes [BOOLEAN] :are_unannotated_records_included The value to assign to the {#are_unannotated_records_included} property
    # @option attributes [OCI::DataLabelingService::Models::ObjectStorageSnapshotExportDetails] :export_details The value to assign to the {#export_details} property
    # @option attributes [OCI::DataLabelingService::Models::ExportFormat] :export_format The value to assign to the {#export_format} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.are_annotations_included = attributes[:'areAnnotationsIncluded'] unless attributes[:'areAnnotationsIncluded'].nil?

      raise 'You cannot provide both :areAnnotationsIncluded and :are_annotations_included' if attributes.key?(:'areAnnotationsIncluded') && attributes.key?(:'are_annotations_included')

      self.are_annotations_included = attributes[:'are_annotations_included'] unless attributes[:'are_annotations_included'].nil?

      self.are_unannotated_records_included = attributes[:'areUnannotatedRecordsIncluded'] unless attributes[:'areUnannotatedRecordsIncluded'].nil?

      raise 'You cannot provide both :areUnannotatedRecordsIncluded and :are_unannotated_records_included' if attributes.key?(:'areUnannotatedRecordsIncluded') && attributes.key?(:'are_unannotated_records_included')

      self.are_unannotated_records_included = attributes[:'are_unannotated_records_included'] unless attributes[:'are_unannotated_records_included'].nil?

      self.export_details = attributes[:'exportDetails'] if attributes[:'exportDetails']

      raise 'You cannot provide both :exportDetails and :export_details' if attributes.key?(:'exportDetails') && attributes.key?(:'export_details')

      self.export_details = attributes[:'export_details'] if attributes[:'export_details']

      self.export_format = attributes[:'exportFormat'] if attributes[:'exportFormat']

      raise 'You cannot provide both :exportFormat and :export_format' if attributes.key?(:'exportFormat') && attributes.key?(:'export_format')

      self.export_format = attributes[:'export_format'] if attributes[:'export_format']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        are_annotations_included == other.are_annotations_included &&
        are_unannotated_records_included == other.are_unannotated_records_included &&
        export_details == other.export_details &&
        export_format == other.export_format
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
      [are_annotations_included, are_unannotated_records_included, export_details, export_format].hash
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