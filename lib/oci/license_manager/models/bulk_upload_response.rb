# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The bulk upload response.
  class LicenseManager::Models::BulkUploadResponse
    # **[Required]** The number of license records which were supported.
    # @return [Integer]
    attr_accessor :total_supported_records

    # **[Required]** The number of supported license records that were uploaded successfully.
    # @return [Integer]
    attr_accessor :total_supported_records_saved

    # **[Required]** The number of supported license records that were valid but not uploaded since they were duplicates.
    # @return [Integer]
    attr_accessor :total_supported_duplicate_records

    # **[Required]** The number of supported license records that were valid but failed with errors during upload.
    # @return [Integer]
    attr_accessor :total_supported_failed_license_records

    # **[Required]** The number of supported license records that could not be uploaded since they were invalid.
    # @return [Integer]
    attr_accessor :total_supported_invalid_records

    # **[Required]** Detailed error information corresponding to each supported but invalid row for the uploaded file.
    # @return [Array<OCI::LicenseManager::Models::BulkUploadValidationErrorInfo>]
    attr_accessor :validation_error_info

    # **[Required]** Error information corresponding to the supported records which are valid but could not be created.
    # @return [Array<OCI::LicenseManager::Models::BulkUploadFailedRecordInfo>]
    attr_accessor :failed_license_record_info

    # **[Required]** Response message for bulk upload.
    # @return [String]
    attr_accessor :message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'total_supported_records': :'totalSupportedRecords',
        'total_supported_records_saved': :'totalSupportedRecordsSaved',
        'total_supported_duplicate_records': :'totalSupportedDuplicateRecords',
        'total_supported_failed_license_records': :'totalSupportedFailedLicenseRecords',
        'total_supported_invalid_records': :'totalSupportedInvalidRecords',
        'validation_error_info': :'validationErrorInfo',
        'failed_license_record_info': :'failedLicenseRecordInfo',
        'message': :'message'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'total_supported_records': :'Integer',
        'total_supported_records_saved': :'Integer',
        'total_supported_duplicate_records': :'Integer',
        'total_supported_failed_license_records': :'Integer',
        'total_supported_invalid_records': :'Integer',
        'validation_error_info': :'Array<OCI::LicenseManager::Models::BulkUploadValidationErrorInfo>',
        'failed_license_record_info': :'Array<OCI::LicenseManager::Models::BulkUploadFailedRecordInfo>',
        'message': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :total_supported_records The value to assign to the {#total_supported_records} property
    # @option attributes [Integer] :total_supported_records_saved The value to assign to the {#total_supported_records_saved} property
    # @option attributes [Integer] :total_supported_duplicate_records The value to assign to the {#total_supported_duplicate_records} property
    # @option attributes [Integer] :total_supported_failed_license_records The value to assign to the {#total_supported_failed_license_records} property
    # @option attributes [Integer] :total_supported_invalid_records The value to assign to the {#total_supported_invalid_records} property
    # @option attributes [Array<OCI::LicenseManager::Models::BulkUploadValidationErrorInfo>] :validation_error_info The value to assign to the {#validation_error_info} property
    # @option attributes [Array<OCI::LicenseManager::Models::BulkUploadFailedRecordInfo>] :failed_license_record_info The value to assign to the {#failed_license_record_info} property
    # @option attributes [String] :message The value to assign to the {#message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.total_supported_records = attributes[:'totalSupportedRecords'] if attributes[:'totalSupportedRecords']

      raise 'You cannot provide both :totalSupportedRecords and :total_supported_records' if attributes.key?(:'totalSupportedRecords') && attributes.key?(:'total_supported_records')

      self.total_supported_records = attributes[:'total_supported_records'] if attributes[:'total_supported_records']

      self.total_supported_records_saved = attributes[:'totalSupportedRecordsSaved'] if attributes[:'totalSupportedRecordsSaved']

      raise 'You cannot provide both :totalSupportedRecordsSaved and :total_supported_records_saved' if attributes.key?(:'totalSupportedRecordsSaved') && attributes.key?(:'total_supported_records_saved')

      self.total_supported_records_saved = attributes[:'total_supported_records_saved'] if attributes[:'total_supported_records_saved']

      self.total_supported_duplicate_records = attributes[:'totalSupportedDuplicateRecords'] if attributes[:'totalSupportedDuplicateRecords']

      raise 'You cannot provide both :totalSupportedDuplicateRecords and :total_supported_duplicate_records' if attributes.key?(:'totalSupportedDuplicateRecords') && attributes.key?(:'total_supported_duplicate_records')

      self.total_supported_duplicate_records = attributes[:'total_supported_duplicate_records'] if attributes[:'total_supported_duplicate_records']

      self.total_supported_failed_license_records = attributes[:'totalSupportedFailedLicenseRecords'] if attributes[:'totalSupportedFailedLicenseRecords']

      raise 'You cannot provide both :totalSupportedFailedLicenseRecords and :total_supported_failed_license_records' if attributes.key?(:'totalSupportedFailedLicenseRecords') && attributes.key?(:'total_supported_failed_license_records')

      self.total_supported_failed_license_records = attributes[:'total_supported_failed_license_records'] if attributes[:'total_supported_failed_license_records']

      self.total_supported_invalid_records = attributes[:'totalSupportedInvalidRecords'] if attributes[:'totalSupportedInvalidRecords']

      raise 'You cannot provide both :totalSupportedInvalidRecords and :total_supported_invalid_records' if attributes.key?(:'totalSupportedInvalidRecords') && attributes.key?(:'total_supported_invalid_records')

      self.total_supported_invalid_records = attributes[:'total_supported_invalid_records'] if attributes[:'total_supported_invalid_records']

      self.validation_error_info = attributes[:'validationErrorInfo'] if attributes[:'validationErrorInfo']

      raise 'You cannot provide both :validationErrorInfo and :validation_error_info' if attributes.key?(:'validationErrorInfo') && attributes.key?(:'validation_error_info')

      self.validation_error_info = attributes[:'validation_error_info'] if attributes[:'validation_error_info']

      self.failed_license_record_info = attributes[:'failedLicenseRecordInfo'] if attributes[:'failedLicenseRecordInfo']

      raise 'You cannot provide both :failedLicenseRecordInfo and :failed_license_record_info' if attributes.key?(:'failedLicenseRecordInfo') && attributes.key?(:'failed_license_record_info')

      self.failed_license_record_info = attributes[:'failed_license_record_info'] if attributes[:'failed_license_record_info']

      self.message = attributes[:'message'] if attributes[:'message']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        total_supported_records == other.total_supported_records &&
        total_supported_records_saved == other.total_supported_records_saved &&
        total_supported_duplicate_records == other.total_supported_duplicate_records &&
        total_supported_failed_license_records == other.total_supported_failed_license_records &&
        total_supported_invalid_records == other.total_supported_invalid_records &&
        validation_error_info == other.validation_error_info &&
        failed_license_record_info == other.failed_license_record_info &&
        message == other.message
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
      [total_supported_records, total_supported_records_saved, total_supported_duplicate_records, total_supported_failed_license_records, total_supported_invalid_records, validation_error_info, failed_license_record_info, message].hash
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
