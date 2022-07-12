# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Response of executeOperationJob.
  class DataConnectivity::Models::ExecuteOperationJob
    # **[Required]** Status of the operation job for all sets of input.
    # @return [String]
    attr_accessor :operation_status

    # Error message, if whole operation is failed.
    # @return [String]
    attr_accessor :error_message

    # Name of the operation.
    # @return [String]
    attr_accessor :operation_name

    # List of names of OUT/INOUT params.
    # @return [Array<String>]
    attr_accessor :out_params

    # **[Required]** List of operation execution result for each input set.
    # @return [Array<OCI::DataConnectivity::Models::OperationExecResult>]
    attr_accessor :operation_result

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_status': :'operationStatus',
        'error_message': :'errorMessage',
        'operation_name': :'operationName',
        'out_params': :'outParams',
        'operation_result': :'operationResult'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_status': :'String',
        'error_message': :'String',
        'operation_name': :'String',
        'out_params': :'Array<String>',
        'operation_result': :'Array<OCI::DataConnectivity::Models::OperationExecResult>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation_status The value to assign to the {#operation_status} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [String] :operation_name The value to assign to the {#operation_name} property
    # @option attributes [Array<String>] :out_params The value to assign to the {#out_params} property
    # @option attributes [Array<OCI::DataConnectivity::Models::OperationExecResult>] :operation_result The value to assign to the {#operation_result} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operation_status = attributes[:'operationStatus'] if attributes[:'operationStatus']

      raise 'You cannot provide both :operationStatus and :operation_status' if attributes.key?(:'operationStatus') && attributes.key?(:'operation_status')

      self.operation_status = attributes[:'operation_status'] if attributes[:'operation_status']

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.operation_name = attributes[:'operationName'] if attributes[:'operationName']

      raise 'You cannot provide both :operationName and :operation_name' if attributes.key?(:'operationName') && attributes.key?(:'operation_name')

      self.operation_name = attributes[:'operation_name'] if attributes[:'operation_name']

      self.out_params = attributes[:'outParams'] if attributes[:'outParams']

      raise 'You cannot provide both :outParams and :out_params' if attributes.key?(:'outParams') && attributes.key?(:'out_params')

      self.out_params = attributes[:'out_params'] if attributes[:'out_params']

      self.operation_result = attributes[:'operationResult'] if attributes[:'operationResult']

      raise 'You cannot provide both :operationResult and :operation_result' if attributes.key?(:'operationResult') && attributes.key?(:'operation_result')

      self.operation_result = attributes[:'operation_result'] if attributes[:'operation_result']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation_status == other.operation_status &&
        error_message == other.error_message &&
        operation_name == other.operation_name &&
        out_params == other.out_params &&
        operation_result == other.operation_result
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
      [operation_status, error_message, operation_name, out_params, operation_result].hash
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
