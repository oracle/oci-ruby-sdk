# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifications for the putting of a table row.
  class Nosql::Models::UpdateRowDetails
    OPTION_ENUM = [
      OPTION_IF_ABSENT = 'IF_ABSENT'.freeze,
      OPTION_IF_PRESENT = 'IF_PRESENT'.freeze
    ].freeze

    # The OCID of the table's compartment.  Required
    # if the tableNameOrId path parameter is a table name.
    # Optional if tableNameOrId is an OCID.  If tableNameOrId
    # is an OCID, and compartmentId is supplied, the latter
    # must match the identified table's compartmentId.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The map of values from a row.
    # @return [Hash<String, Object>]
    attr_accessor :value

    # Specifies a condition for the put operation.
    # @return [String]
    attr_reader :option

    # If true, and the put fails due to an option setting, then
    # the existing row will be returned.
    #
    # @return [BOOLEAN]
    attr_accessor :is_get_return_row

    # Timeout setting for the put.
    # @return [Integer]
    attr_accessor :timeout_in_ms

    # Time-to-live for the row, in days.
    # @return [Integer]
    attr_accessor :ttl

    # If true, set time-to-live for this row to the table's default.
    #
    # @return [BOOLEAN]
    attr_accessor :is_ttl_use_table_default

    # Sets the number of generated identity values that are
    # requested from the server during a put. If present and greater than 0,
    # this value takes precedence over a default value for the table.
    #
    # @return [Integer]
    attr_accessor :identity_cache_size

    # If present and true, the presented row value must exactly
    # match the table's schema.  Otherwise, rows with missing
    # non-key fields or extra fields can be written successfully.
    #
    # @return [BOOLEAN]
    attr_accessor :is_exact_match

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'value': :'value',
        'option': :'option',
        'is_get_return_row': :'isGetReturnRow',
        'timeout_in_ms': :'timeoutInMs',
        'ttl': :'ttl',
        'is_ttl_use_table_default': :'isTtlUseTableDefault',
        'identity_cache_size': :'identityCacheSize',
        'is_exact_match': :'isExactMatch'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'value': :'Hash<String, Object>',
        'option': :'String',
        'is_get_return_row': :'BOOLEAN',
        'timeout_in_ms': :'Integer',
        'ttl': :'Integer',
        'is_ttl_use_table_default': :'BOOLEAN',
        'identity_cache_size': :'Integer',
        'is_exact_match': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Object>] :value The value to assign to the {#value} property
    # @option attributes [String] :option The value to assign to the {#option} property
    # @option attributes [BOOLEAN] :is_get_return_row The value to assign to the {#is_get_return_row} property
    # @option attributes [Integer] :timeout_in_ms The value to assign to the {#timeout_in_ms} property
    # @option attributes [Integer] :ttl The value to assign to the {#ttl} property
    # @option attributes [BOOLEAN] :is_ttl_use_table_default The value to assign to the {#is_ttl_use_table_default} property
    # @option attributes [Integer] :identity_cache_size The value to assign to the {#identity_cache_size} property
    # @option attributes [BOOLEAN] :is_exact_match The value to assign to the {#is_exact_match} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.value = attributes[:'value'] if attributes[:'value']

      self.option = attributes[:'option'] if attributes[:'option']

      self.is_get_return_row = attributes[:'isGetReturnRow'] unless attributes[:'isGetReturnRow'].nil?
      self.is_get_return_row = false if is_get_return_row.nil? && !attributes.key?(:'isGetReturnRow') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isGetReturnRow and :is_get_return_row' if attributes.key?(:'isGetReturnRow') && attributes.key?(:'is_get_return_row')

      self.is_get_return_row = attributes[:'is_get_return_row'] unless attributes[:'is_get_return_row'].nil?
      self.is_get_return_row = false if is_get_return_row.nil? && !attributes.key?(:'isGetReturnRow') && !attributes.key?(:'is_get_return_row') # rubocop:disable Style/StringLiterals

      self.timeout_in_ms = attributes[:'timeoutInMs'] if attributes[:'timeoutInMs']

      raise 'You cannot provide both :timeoutInMs and :timeout_in_ms' if attributes.key?(:'timeoutInMs') && attributes.key?(:'timeout_in_ms')

      self.timeout_in_ms = attributes[:'timeout_in_ms'] if attributes[:'timeout_in_ms']

      self.ttl = attributes[:'ttl'] if attributes[:'ttl']

      self.is_ttl_use_table_default = attributes[:'isTtlUseTableDefault'] unless attributes[:'isTtlUseTableDefault'].nil?
      self.is_ttl_use_table_default = true if is_ttl_use_table_default.nil? && !attributes.key?(:'isTtlUseTableDefault') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isTtlUseTableDefault and :is_ttl_use_table_default' if attributes.key?(:'isTtlUseTableDefault') && attributes.key?(:'is_ttl_use_table_default')

      self.is_ttl_use_table_default = attributes[:'is_ttl_use_table_default'] unless attributes[:'is_ttl_use_table_default'].nil?
      self.is_ttl_use_table_default = true if is_ttl_use_table_default.nil? && !attributes.key?(:'isTtlUseTableDefault') && !attributes.key?(:'is_ttl_use_table_default') # rubocop:disable Style/StringLiterals

      self.identity_cache_size = attributes[:'identityCacheSize'] if attributes[:'identityCacheSize']

      raise 'You cannot provide both :identityCacheSize and :identity_cache_size' if attributes.key?(:'identityCacheSize') && attributes.key?(:'identity_cache_size')

      self.identity_cache_size = attributes[:'identity_cache_size'] if attributes[:'identity_cache_size']

      self.is_exact_match = attributes[:'isExactMatch'] unless attributes[:'isExactMatch'].nil?

      raise 'You cannot provide both :isExactMatch and :is_exact_match' if attributes.key?(:'isExactMatch') && attributes.key?(:'is_exact_match')

      self.is_exact_match = attributes[:'is_exact_match'] unless attributes[:'is_exact_match'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] option Object to be assigned
    def option=(option)
      raise "Invalid value for 'option': this must be one of the values in OPTION_ENUM." if option && !OPTION_ENUM.include?(option)

      @option = option
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        value == other.value &&
        option == other.option &&
        is_get_return_row == other.is_get_return_row &&
        timeout_in_ms == other.timeout_in_ms &&
        ttl == other.ttl &&
        is_ttl_use_table_default == other.is_ttl_use_table_default &&
        identity_cache_size == other.identity_cache_size &&
        is_exact_match == other.is_exact_match
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
      [compartment_id, value, option, is_get_return_row, timeout_in_ms, ttl, is_ttl_use_table_default, identity_cache_size, is_exact_match].hash
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
