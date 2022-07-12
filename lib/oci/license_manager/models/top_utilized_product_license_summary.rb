# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the top utilized product licenses.
  #
  class LicenseManager::Models::TopUtilizedProductLicenseSummary
    UNIT_TYPE_ENUM = [
      UNIT_TYPE_OCPU = 'OCPU'.freeze,
      UNIT_TYPE_NAMED_USER_PLUS = 'NAMED_USER_PLUS'.freeze,
      UNIT_TYPE_PROCESSORS = 'PROCESSORS'.freeze,
      UNIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_INCOMPLETE = 'INCOMPLETE'.freeze,
      STATUS_ISSUES_FOUND = 'ISSUES_FOUND'.freeze,
      STATUS_WARNING = 'WARNING'.freeze,
      STATUS_OK = 'OK'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The product license [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :product_license_id

    # **[Required]** The product type.
    # @return [String]
    attr_accessor :product_type

    # **[Required]** The product license unit.
    # @return [String]
    attr_reader :unit_type

    # **[Required]** Number of license units consumed.
    # @return [Float]
    attr_accessor :total_units_consumed

    # **[Required]** Total number of license units in the product license provided by the user.
    # @return [Integer]
    attr_accessor :total_license_unit_count

    # **[Required]** Specifies if the license unit count is unlimited.
    # @return [BOOLEAN]
    attr_accessor :is_unlimited

    # **[Required]** The current product license status.
    # @return [String]
    attr_reader :status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'product_license_id': :'productLicenseId',
        'product_type': :'productType',
        'unit_type': :'unitType',
        'total_units_consumed': :'totalUnitsConsumed',
        'total_license_unit_count': :'totalLicenseUnitCount',
        'is_unlimited': :'isUnlimited',
        'status': :'status'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'product_license_id': :'String',
        'product_type': :'String',
        'unit_type': :'String',
        'total_units_consumed': :'Float',
        'total_license_unit_count': :'Integer',
        'is_unlimited': :'BOOLEAN',
        'status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :product_license_id The value to assign to the {#product_license_id} property
    # @option attributes [String] :product_type The value to assign to the {#product_type} property
    # @option attributes [String] :unit_type The value to assign to the {#unit_type} property
    # @option attributes [Float] :total_units_consumed The value to assign to the {#total_units_consumed} property
    # @option attributes [Integer] :total_license_unit_count The value to assign to the {#total_license_unit_count} property
    # @option attributes [BOOLEAN] :is_unlimited The value to assign to the {#is_unlimited} property
    # @option attributes [String] :status The value to assign to the {#status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.product_license_id = attributes[:'productLicenseId'] if attributes[:'productLicenseId']

      raise 'You cannot provide both :productLicenseId and :product_license_id' if attributes.key?(:'productLicenseId') && attributes.key?(:'product_license_id')

      self.product_license_id = attributes[:'product_license_id'] if attributes[:'product_license_id']

      self.product_type = attributes[:'productType'] if attributes[:'productType']

      raise 'You cannot provide both :productType and :product_type' if attributes.key?(:'productType') && attributes.key?(:'product_type')

      self.product_type = attributes[:'product_type'] if attributes[:'product_type']

      self.unit_type = attributes[:'unitType'] if attributes[:'unitType']

      raise 'You cannot provide both :unitType and :unit_type' if attributes.key?(:'unitType') && attributes.key?(:'unit_type')

      self.unit_type = attributes[:'unit_type'] if attributes[:'unit_type']

      self.total_units_consumed = attributes[:'totalUnitsConsumed'] if attributes[:'totalUnitsConsumed']
      self.total_units_consumed = 0.0 if total_units_consumed.nil? && !attributes.key?(:'totalUnitsConsumed') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :totalUnitsConsumed and :total_units_consumed' if attributes.key?(:'totalUnitsConsumed') && attributes.key?(:'total_units_consumed')

      self.total_units_consumed = attributes[:'total_units_consumed'] if attributes[:'total_units_consumed']
      self.total_units_consumed = 0.0 if total_units_consumed.nil? && !attributes.key?(:'totalUnitsConsumed') && !attributes.key?(:'total_units_consumed') # rubocop:disable Style/StringLiterals

      self.total_license_unit_count = attributes[:'totalLicenseUnitCount'] if attributes[:'totalLicenseUnitCount']

      raise 'You cannot provide both :totalLicenseUnitCount and :total_license_unit_count' if attributes.key?(:'totalLicenseUnitCount') && attributes.key?(:'total_license_unit_count')

      self.total_license_unit_count = attributes[:'total_license_unit_count'] if attributes[:'total_license_unit_count']

      self.is_unlimited = attributes[:'isUnlimited'] unless attributes[:'isUnlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUnlimited and :is_unlimited' if attributes.key?(:'isUnlimited') && attributes.key?(:'is_unlimited')

      self.is_unlimited = attributes[:'is_unlimited'] unless attributes[:'is_unlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') && !attributes.key?(:'is_unlimited') # rubocop:disable Style/StringLiterals

      self.status = attributes[:'status'] if attributes[:'status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] unit_type Object to be assigned
    def unit_type=(unit_type)
      # rubocop:disable Style/ConditionalAssignment
      if unit_type && !UNIT_TYPE_ENUM.include?(unit_type)
        OCI.logger.debug("Unknown value for 'unit_type' [" + unit_type + "]. Mapping to 'UNIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @unit_type = UNIT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @unit_type = unit_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        product_license_id == other.product_license_id &&
        product_type == other.product_type &&
        unit_type == other.unit_type &&
        total_units_consumed == other.total_units_consumed &&
        total_license_unit_count == other.total_license_unit_count &&
        is_unlimited == other.is_unlimited &&
        status == other.status
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
      [product_license_id, product_type, unit_type, total_units_consumed, total_license_unit_count, is_unlimited, status].hash
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
