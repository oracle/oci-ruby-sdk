# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Operation execution result for a single input set.
  class DataConnectivity::Models::OperationExecResult
    EXECUTION_STATUS_ENUM = [
      EXECUTION_STATUS_FAILED = 'FAILED'.freeze,
      EXECUTION_STATUS_SUCCESS = 'SUCCESS'.freeze,
      EXECUTION_STATUS_QUEUED = 'QUEUED'.freeze,
      EXECUTION_STATUS_RUNNING = 'RUNNING'.freeze,
      EXECUTION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Status of the operation job for particular set of input.
    # @return [String]
    attr_reader :execution_status

    # Error message if execution of operation is failed.
    # @return [String]
    attr_accessor :error_message

    # Metrics of operation execution job.
    # @return [Object]
    attr_accessor :metrics

    # List of emitted rows for each OUT/INOUT param.
    # @return [Array<Array<Object>>]
    attr_accessor :output_values

    # True, if error message should be displayed on UI.
    # @return [BOOLEAN]
    attr_accessor :is_whitelisted_error_message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'execution_status': :'executionStatus',
        'error_message': :'errorMessage',
        'metrics': :'metrics',
        'output_values': :'outputValues',
        'is_whitelisted_error_message': :'isWhitelistedErrorMessage'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'execution_status': :'String',
        'error_message': :'String',
        'metrics': :'Object',
        'output_values': :'Array<Array<Object>>',
        'is_whitelisted_error_message': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :execution_status The value to assign to the {#execution_status} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [Object] :metrics The value to assign to the {#metrics} property
    # @option attributes [Array<Array<Object>>] :output_values The value to assign to the {#output_values} property
    # @option attributes [BOOLEAN] :is_whitelisted_error_message The value to assign to the {#is_whitelisted_error_message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.execution_status = attributes[:'executionStatus'] if attributes[:'executionStatus']

      raise 'You cannot provide both :executionStatus and :execution_status' if attributes.key?(:'executionStatus') && attributes.key?(:'execution_status')

      self.execution_status = attributes[:'execution_status'] if attributes[:'execution_status']

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.metrics = attributes[:'metrics'] if attributes[:'metrics']

      self.output_values = attributes[:'outputValues'] if attributes[:'outputValues']

      raise 'You cannot provide both :outputValues and :output_values' if attributes.key?(:'outputValues') && attributes.key?(:'output_values')

      self.output_values = attributes[:'output_values'] if attributes[:'output_values']

      self.is_whitelisted_error_message = attributes[:'isWhitelistedErrorMessage'] unless attributes[:'isWhitelistedErrorMessage'].nil?

      raise 'You cannot provide both :isWhitelistedErrorMessage and :is_whitelisted_error_message' if attributes.key?(:'isWhitelistedErrorMessage') && attributes.key?(:'is_whitelisted_error_message')

      self.is_whitelisted_error_message = attributes[:'is_whitelisted_error_message'] unless attributes[:'is_whitelisted_error_message'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] execution_status Object to be assigned
    def execution_status=(execution_status)
      # rubocop:disable Style/ConditionalAssignment
      if execution_status && !EXECUTION_STATUS_ENUM.include?(execution_status)
        OCI.logger.debug("Unknown value for 'execution_status' [" + execution_status + "]. Mapping to 'EXECUTION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @execution_status = EXECUTION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @execution_status = execution_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        execution_status == other.execution_status &&
        error_message == other.error_message &&
        metrics == other.metrics &&
        output_values == other.output_values &&
        is_whitelisted_error_message == other.is_whitelisted_error_message
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
      [execution_status, error_message, metrics, output_values, is_whitelisted_error_message].hash
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
