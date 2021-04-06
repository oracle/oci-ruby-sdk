# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # All the information surrounding a query, including the query statement,
  # limits, consistency, and so forth.
  #
  class Nosql::Models::QueryDetails
    CONSISTENCY_ENUM = [
      CONSISTENCY_EVENTUAL = 'EVENTUAL'.freeze,
      CONSISTENCY_ABSOLUTE = 'ABSOLUTE'.freeze
    ].freeze

    # **[Required]** Compartment OCID, to provide context for a table name in
    # the given statement.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A NoSQL SQL query statement; or a Base64-encoded prepared statement.
    #
    # @return [String]
    attr_accessor :statement

    # If true, the statement is a prepared statement.
    # @return [BOOLEAN]
    attr_accessor :is_prepared

    # Consistency requirement for a read operation.
    # @return [String]
    attr_reader :consistency

    # A limit on the total amount of data read during this operation, in KB.
    #
    # @return [Integer]
    attr_accessor :max_read_in_k_bs

    # A map of prepared statement variables to values.
    # @return [Hash<String, Object>]
    attr_accessor :variables

    # Timeout setting for the query.
    # @return [Integer]
    attr_accessor :timeout_in_ms

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'statement': :'statement',
        'is_prepared': :'isPrepared',
        'consistency': :'consistency',
        'max_read_in_k_bs': :'maxReadInKBs',
        'variables': :'variables',
        'timeout_in_ms': :'timeoutInMs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'statement': :'String',
        'is_prepared': :'BOOLEAN',
        'consistency': :'String',
        'max_read_in_k_bs': :'Integer',
        'variables': :'Hash<String, Object>',
        'timeout_in_ms': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :statement The value to assign to the {#statement} property
    # @option attributes [BOOLEAN] :is_prepared The value to assign to the {#is_prepared} property
    # @option attributes [String] :consistency The value to assign to the {#consistency} property
    # @option attributes [Integer] :max_read_in_k_bs The value to assign to the {#max_read_in_k_bs} property
    # @option attributes [Hash<String, Object>] :variables The value to assign to the {#variables} property
    # @option attributes [Integer] :timeout_in_ms The value to assign to the {#timeout_in_ms} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.statement = attributes[:'statement'] if attributes[:'statement']

      self.is_prepared = attributes[:'isPrepared'] unless attributes[:'isPrepared'].nil?

      raise 'You cannot provide both :isPrepared and :is_prepared' if attributes.key?(:'isPrepared') && attributes.key?(:'is_prepared')

      self.is_prepared = attributes[:'is_prepared'] unless attributes[:'is_prepared'].nil?

      self.consistency = attributes[:'consistency'] if attributes[:'consistency']
      self.consistency = "EVENTUAL" if consistency.nil? && !attributes.key?(:'consistency') # rubocop:disable Style/StringLiterals

      self.max_read_in_k_bs = attributes[:'maxReadInKBs'] if attributes[:'maxReadInKBs']

      raise 'You cannot provide both :maxReadInKBs and :max_read_in_k_bs' if attributes.key?(:'maxReadInKBs') && attributes.key?(:'max_read_in_k_bs')

      self.max_read_in_k_bs = attributes[:'max_read_in_k_bs'] if attributes[:'max_read_in_k_bs']

      self.variables = attributes[:'variables'] if attributes[:'variables']

      self.timeout_in_ms = attributes[:'timeoutInMs'] if attributes[:'timeoutInMs']

      raise 'You cannot provide both :timeoutInMs and :timeout_in_ms' if attributes.key?(:'timeoutInMs') && attributes.key?(:'timeout_in_ms')

      self.timeout_in_ms = attributes[:'timeout_in_ms'] if attributes[:'timeout_in_ms']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] consistency Object to be assigned
    def consistency=(consistency)
      raise "Invalid value for 'consistency': this must be one of the values in CONSISTENCY_ENUM." if consistency && !CONSISTENCY_ENUM.include?(consistency)

      @consistency = consistency
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        statement == other.statement &&
        is_prepared == other.is_prepared &&
        consistency == other.consistency &&
        max_read_in_k_bs == other.max_read_in_k_bs &&
        variables == other.variables &&
        timeout_in_ms == other.timeout_in_ms
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
      [compartment_id, statement, is_prepared, consistency, max_read_in_k_bs, variables, timeout_in_ms].hash
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
