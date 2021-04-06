# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Estimated memory footprint for a MySQL user table
  # when loaded to the HeatWave cluster memory.
  #
  class Mysql::Models::HeatWaveClusterTableMemoryEstimate
    # **[Required]** The table name.
    # @return [String]
    attr_accessor :table_name

    # **[Required]** The number of columns to be loaded to HeatWave cluster memory.
    # These columns contribute to the analytical memory footprint.
    #
    # @return [Integer]
    attr_accessor :to_load_column_count

    # **[Required]** The number of variable-length columns to be loaded to HeatWave cluster memory.
    # These columns contribute to the analytical memory footprint.
    #
    # @return [Integer]
    attr_accessor :varlen_column_count

    # **[Required]** The estimated number of rows in the table. This number was used to
    # derive the analytical memory footprint.
    #
    # @return [Integer]
    attr_accessor :estimated_row_count

    # **[Required]** The estimated memory footprint of the table in MBs when loaded to
    # HeatWave cluster memory (null if the table cannot be loaded to the
    # HeatWave cluster).
    #
    # @return [Integer]
    attr_accessor :analytical_footprint_in_mbs

    # **[Required]** Error comment (empty string if no errors occured).
    #
    # @return [String]
    attr_accessor :error_comment

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'table_name': :'tableName',
        'to_load_column_count': :'toLoadColumnCount',
        'varlen_column_count': :'varlenColumnCount',
        'estimated_row_count': :'estimatedRowCount',
        'analytical_footprint_in_mbs': :'analyticalFootprintInMbs',
        'error_comment': :'errorComment'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'table_name': :'String',
        'to_load_column_count': :'Integer',
        'varlen_column_count': :'Integer',
        'estimated_row_count': :'Integer',
        'analytical_footprint_in_mbs': :'Integer',
        'error_comment': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :table_name The value to assign to the {#table_name} property
    # @option attributes [Integer] :to_load_column_count The value to assign to the {#to_load_column_count} property
    # @option attributes [Integer] :varlen_column_count The value to assign to the {#varlen_column_count} property
    # @option attributes [Integer] :estimated_row_count The value to assign to the {#estimated_row_count} property
    # @option attributes [Integer] :analytical_footprint_in_mbs The value to assign to the {#analytical_footprint_in_mbs} property
    # @option attributes [String] :error_comment The value to assign to the {#error_comment} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.table_name = attributes[:'tableName'] if attributes[:'tableName']

      raise 'You cannot provide both :tableName and :table_name' if attributes.key?(:'tableName') && attributes.key?(:'table_name')

      self.table_name = attributes[:'table_name'] if attributes[:'table_name']

      self.to_load_column_count = attributes[:'toLoadColumnCount'] if attributes[:'toLoadColumnCount']

      raise 'You cannot provide both :toLoadColumnCount and :to_load_column_count' if attributes.key?(:'toLoadColumnCount') && attributes.key?(:'to_load_column_count')

      self.to_load_column_count = attributes[:'to_load_column_count'] if attributes[:'to_load_column_count']

      self.varlen_column_count = attributes[:'varlenColumnCount'] if attributes[:'varlenColumnCount']

      raise 'You cannot provide both :varlenColumnCount and :varlen_column_count' if attributes.key?(:'varlenColumnCount') && attributes.key?(:'varlen_column_count')

      self.varlen_column_count = attributes[:'varlen_column_count'] if attributes[:'varlen_column_count']

      self.estimated_row_count = attributes[:'estimatedRowCount'] if attributes[:'estimatedRowCount']

      raise 'You cannot provide both :estimatedRowCount and :estimated_row_count' if attributes.key?(:'estimatedRowCount') && attributes.key?(:'estimated_row_count')

      self.estimated_row_count = attributes[:'estimated_row_count'] if attributes[:'estimated_row_count']

      self.analytical_footprint_in_mbs = attributes[:'analyticalFootprintInMbs'] if attributes[:'analyticalFootprintInMbs']

      raise 'You cannot provide both :analyticalFootprintInMbs and :analytical_footprint_in_mbs' if attributes.key?(:'analyticalFootprintInMbs') && attributes.key?(:'analytical_footprint_in_mbs')

      self.analytical_footprint_in_mbs = attributes[:'analytical_footprint_in_mbs'] if attributes[:'analytical_footprint_in_mbs']

      self.error_comment = attributes[:'errorComment'] if attributes[:'errorComment']

      raise 'You cannot provide both :errorComment and :error_comment' if attributes.key?(:'errorComment') && attributes.key?(:'error_comment')

      self.error_comment = attributes[:'error_comment'] if attributes[:'error_comment']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        table_name == other.table_name &&
        to_load_column_count == other.to_load_column_count &&
        varlen_column_count == other.varlen_column_count &&
        estimated_row_count == other.estimated_row_count &&
        analytical_footprint_in_mbs == other.analytical_footprint_in_mbs &&
        error_comment == other.error_comment
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
      [table_name, to_load_column_count, varlen_column_count, estimated_row_count, analytical_footprint_in_mbs, error_comment].hash
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
