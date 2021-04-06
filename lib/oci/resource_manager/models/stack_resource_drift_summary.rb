# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Drift status details for the indicated resource and stack. Includes actual and expected (defined) properties.
  #
  class ResourceManager::Models::StackResourceDriftSummary
    RESOURCE_DRIFT_STATUS_ENUM = [
      RESOURCE_DRIFT_STATUS_NOT_CHECKED = 'NOT_CHECKED'.freeze,
      RESOURCE_DRIFT_STATUS_IN_SYNC = 'IN_SYNC'.freeze,
      RESOURCE_DRIFT_STATUS_MODIFIED = 'MODIFIED'.freeze,
      RESOURCE_DRIFT_STATUS_DELETED = 'DELETED'.freeze,
      RESOURCE_DRIFT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the stack.
    # @return [String]
    attr_accessor :stack_id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where the stack is located.
    # @return [String]
    attr_accessor :compartment_id

    # The name of the resource as defined in the stack.
    # @return [String]
    attr_accessor :resource_name

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource provisioned by Terraform.
    # @return [String]
    attr_accessor :resource_id

    # The provider resource type.
    # Must be supported by the [Oracle Cloud Infrastructure provider](https://www.terraform.io/docs/providers/oci/index.html).
    # Example: `oci_core_instance`
    #
    # @return [String]
    attr_accessor :resource_type

    # The drift status of the resource.
    # A drift status value indicates whether or not the actual state of the resource differs from the expected (defined) state for that resource.
    #
    # @return [String]
    attr_reader :resource_drift_status

    # Actual values of properties that the stack defines for the indicated resource.
    # Each property and value is provided as a key-value pair.
    # The following example shows actual values for the resource's display name and server type:
    # `{\"display_name\": \"tf-default-dhcp-options-new\", \"options.0.server_type\": \"VcnLocalPlusInternet\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :actual_properties

    # Expected values of properties that the stack defines for the indicated resource.
    # Each property and value is provided as a key-value pair.
    # The following example shows expected (defined) values for the resource's display name and server type:
    # `{\"display_name\": \"tf-default-dhcp-options\", \"options.0.server_type\": \"VcnLocalPlusInternet\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :expected_properties

    # The date and time when the drift detection was executed.
    # Format is defined by RFC3339.
    # Example: `2020-01-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_drift_checked

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'stack_id': :'stackId',
        'compartment_id': :'compartmentId',
        'resource_name': :'resourceName',
        'resource_id': :'resourceId',
        'resource_type': :'resourceType',
        'resource_drift_status': :'resourceDriftStatus',
        'actual_properties': :'actualProperties',
        'expected_properties': :'expectedProperties',
        'time_drift_checked': :'timeDriftChecked'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'stack_id': :'String',
        'compartment_id': :'String',
        'resource_name': :'String',
        'resource_id': :'String',
        'resource_type': :'String',
        'resource_drift_status': :'String',
        'actual_properties': :'Hash<String, String>',
        'expected_properties': :'Hash<String, String>',
        'time_drift_checked': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :stack_id The value to assign to the {#stack_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :resource_drift_status The value to assign to the {#resource_drift_status} property
    # @option attributes [Hash<String, String>] :actual_properties The value to assign to the {#actual_properties} property
    # @option attributes [Hash<String, String>] :expected_properties The value to assign to the {#expected_properties} property
    # @option attributes [DateTime] :time_drift_checked The value to assign to the {#time_drift_checked} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.stack_id = attributes[:'stackId'] if attributes[:'stackId']

      raise 'You cannot provide both :stackId and :stack_id' if attributes.key?(:'stackId') && attributes.key?(:'stack_id')

      self.stack_id = attributes[:'stack_id'] if attributes[:'stack_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.resource_drift_status = attributes[:'resourceDriftStatus'] if attributes[:'resourceDriftStatus']

      raise 'You cannot provide both :resourceDriftStatus and :resource_drift_status' if attributes.key?(:'resourceDriftStatus') && attributes.key?(:'resource_drift_status')

      self.resource_drift_status = attributes[:'resource_drift_status'] if attributes[:'resource_drift_status']

      self.actual_properties = attributes[:'actualProperties'] if attributes[:'actualProperties']

      raise 'You cannot provide both :actualProperties and :actual_properties' if attributes.key?(:'actualProperties') && attributes.key?(:'actual_properties')

      self.actual_properties = attributes[:'actual_properties'] if attributes[:'actual_properties']

      self.expected_properties = attributes[:'expectedProperties'] if attributes[:'expectedProperties']

      raise 'You cannot provide both :expectedProperties and :expected_properties' if attributes.key?(:'expectedProperties') && attributes.key?(:'expected_properties')

      self.expected_properties = attributes[:'expected_properties'] if attributes[:'expected_properties']

      self.time_drift_checked = attributes[:'timeDriftChecked'] if attributes[:'timeDriftChecked']

      raise 'You cannot provide both :timeDriftChecked and :time_drift_checked' if attributes.key?(:'timeDriftChecked') && attributes.key?(:'time_drift_checked')

      self.time_drift_checked = attributes[:'time_drift_checked'] if attributes[:'time_drift_checked']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_drift_status Object to be assigned
    def resource_drift_status=(resource_drift_status)
      # rubocop:disable Style/ConditionalAssignment
      if resource_drift_status && !RESOURCE_DRIFT_STATUS_ENUM.include?(resource_drift_status)
        OCI.logger.debug("Unknown value for 'resource_drift_status' [" + resource_drift_status + "]. Mapping to 'RESOURCE_DRIFT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_drift_status = RESOURCE_DRIFT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @resource_drift_status = resource_drift_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        stack_id == other.stack_id &&
        compartment_id == other.compartment_id &&
        resource_name == other.resource_name &&
        resource_id == other.resource_id &&
        resource_type == other.resource_type &&
        resource_drift_status == other.resource_drift_status &&
        actual_properties == other.actual_properties &&
        expected_properties == other.expected_properties &&
        time_drift_checked == other.time_drift_checked
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
      [stack_id, compartment_id, resource_name, resource_id, resource_type, resource_drift_status, actual_properties, expected_properties, time_drift_checked].hash
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
