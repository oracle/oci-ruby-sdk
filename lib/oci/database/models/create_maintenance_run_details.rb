# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20160918
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to schedule Maintenance Run with Latest Release Update along TimeZone File Update for the specified resource.
  #
  class Database::Models::CreateMaintenanceRunDetails
    PATCHING_MODE_ENUM = [
      PATCHING_MODE_ROLLING = 'ROLLING'.freeze,
      PATCHING_MODE_NONROLLING = 'NONROLLING'.freeze
    ].freeze

    PATCH_TYPE_ENUM = [
      PATCH_TYPE_QUARTERLY = 'QUARTERLY'.freeze,
      PATCH_TYPE_TIMEZONE = 'TIMEZONE'.freeze
    ].freeze

    # **[Required]** The ID of the target resource for which the maintenance run should be created.
    # @return [String]
    attr_accessor :target_resource_id

    # Indicates if an automatic DST Time Zone file update is enabled for the Autonomous Container Database. If enabled along with Release Update, patching will be done in a Non-Rolling manner.
    # @return [BOOLEAN]
    attr_accessor :is_dst_file_update_enabled

    # **[Required]** The date and time that update should be scheduled.
    # @return [DateTime]
    attr_accessor :time_scheduled

    # Cloud Exadata infrastructure node patching method, either \"ROLLING\" or \"NONROLLING\". Default value is ROLLING.
    #
    # *IMPORTANT*: Non-rolling infrastructure patching involves system down time. See [Oracle-Managed Infrastructure Maintenance Updates](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/examaintenance.htm#Oracle) for more information.
    #
    # @return [String]
    attr_reader :patching_mode

    # **[Required]** Patch type, either \"QUARTERLY\" or \"TIMEZONE\".
    #
    # @return [String]
    attr_reader :patch_type

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the Maintenance Run.
    # @return [String]
    attr_accessor :compartment_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_resource_id': :'targetResourceId',
        'is_dst_file_update_enabled': :'isDstFileUpdateEnabled',
        'time_scheduled': :'timeScheduled',
        'patching_mode': :'patchingMode',
        'patch_type': :'patchType',
        'compartment_id': :'compartmentId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_resource_id': :'String',
        'is_dst_file_update_enabled': :'BOOLEAN',
        'time_scheduled': :'DateTime',
        'patching_mode': :'String',
        'patch_type': :'String',
        'compartment_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :target_resource_id The value to assign to the {#target_resource_id} property
    # @option attributes [BOOLEAN] :is_dst_file_update_enabled The value to assign to the {#is_dst_file_update_enabled} property
    # @option attributes [DateTime] :time_scheduled The value to assign to the {#time_scheduled} property
    # @option attributes [String] :patching_mode The value to assign to the {#patching_mode} property
    # @option attributes [String] :patch_type The value to assign to the {#patch_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.target_resource_id = attributes[:'targetResourceId'] if attributes[:'targetResourceId']

      raise 'You cannot provide both :targetResourceId and :target_resource_id' if attributes.key?(:'targetResourceId') && attributes.key?(:'target_resource_id')

      self.target_resource_id = attributes[:'target_resource_id'] if attributes[:'target_resource_id']

      self.is_dst_file_update_enabled = attributes[:'isDstFileUpdateEnabled'] unless attributes[:'isDstFileUpdateEnabled'].nil?

      raise 'You cannot provide both :isDstFileUpdateEnabled and :is_dst_file_update_enabled' if attributes.key?(:'isDstFileUpdateEnabled') && attributes.key?(:'is_dst_file_update_enabled')

      self.is_dst_file_update_enabled = attributes[:'is_dst_file_update_enabled'] unless attributes[:'is_dst_file_update_enabled'].nil?

      self.time_scheduled = attributes[:'timeScheduled'] if attributes[:'timeScheduled']

      raise 'You cannot provide both :timeScheduled and :time_scheduled' if attributes.key?(:'timeScheduled') && attributes.key?(:'time_scheduled')

      self.time_scheduled = attributes[:'time_scheduled'] if attributes[:'time_scheduled']

      self.patching_mode = attributes[:'patchingMode'] if attributes[:'patchingMode']

      raise 'You cannot provide both :patchingMode and :patching_mode' if attributes.key?(:'patchingMode') && attributes.key?(:'patching_mode')

      self.patching_mode = attributes[:'patching_mode'] if attributes[:'patching_mode']

      self.patch_type = attributes[:'patchType'] if attributes[:'patchType']

      raise 'You cannot provide both :patchType and :patch_type' if attributes.key?(:'patchType') && attributes.key?(:'patch_type')

      self.patch_type = attributes[:'patch_type'] if attributes[:'patch_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patching_mode Object to be assigned
    def patching_mode=(patching_mode)
      raise "Invalid value for 'patching_mode': this must be one of the values in PATCHING_MODE_ENUM." if patching_mode && !PATCHING_MODE_ENUM.include?(patching_mode)

      @patching_mode = patching_mode
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] patch_type Object to be assigned
    def patch_type=(patch_type)
      raise "Invalid value for 'patch_type': this must be one of the values in PATCH_TYPE_ENUM." if patch_type && !PATCH_TYPE_ENUM.include?(patch_type)

      @patch_type = patch_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_resource_id == other.target_resource_id &&
        is_dst_file_update_enabled == other.is_dst_file_update_enabled &&
        time_scheduled == other.time_scheduled &&
        patching_mode == other.patching_mode &&
        patch_type == other.patch_type &&
        compartment_id == other.compartment_id
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
      [target_resource_id, is_dst_file_update_enabled, time_scheduled, patching_mode, patch_type, compartment_id].hash
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
