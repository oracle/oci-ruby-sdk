# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220919
require 'date'
require 'logger'
require_relative 'target_asset'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of the VM target asset.
  class CloudMigrations::Models::VmTargetAsset < CloudMigrations::Models::TargetAsset
    PREFERRED_SHAPE_TYPE_ENUM = [
      PREFERRED_SHAPE_TYPE_VM = 'VM'.freeze,
      PREFERRED_SHAPE_TYPE_VM_INTEL = 'VM_INTEL'.freeze,
      PREFERRED_SHAPE_TYPE_VM_INTEL_STANDARD = 'VM_INTEL_Standard'.freeze,
      PREFERRED_SHAPE_TYPE_VM_INTEL_DENS_IO = 'VM_INTEL_DensIO'.freeze,
      PREFERRED_SHAPE_TYPE_VM_INTEL_GPU = 'VM_INTEL_GPU'.freeze,
      PREFERRED_SHAPE_TYPE_VM_INTEL_OPTIMIZED = 'VM_INTEL_Optimized'.freeze,
      PREFERRED_SHAPE_TYPE_VM_AMD = 'VM_AMD'.freeze,
      PREFERRED_SHAPE_TYPE_VM_AMD_STANDARD = 'VM_AMD_Standard'.freeze,
      PREFERRED_SHAPE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Preferred VM shape type that you provide.
    # @return [String]
    attr_reader :preferred_shape_type

    # @return [OCI::CloudMigrations::Models::LaunchInstanceDetails]
    attr_accessor :test_spec

    # Performance of the block volumes.
    # @return [Integer]
    attr_accessor :block_volumes_performance

    # Microsoft license for VM configuration.
    # @return [String]
    attr_accessor :ms_license

    # @return [OCI::CloudMigrations::Models::LaunchInstanceDetails]
    attr_accessor :user_spec

    # @return [OCI::CloudMigrations::Models::LaunchInstanceDetails]
    attr_accessor :recommended_spec

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'migration_plan_id': :'migrationPlanId',
        'compartment_id': :'compartmentId',
        'created_resource_id': :'createdResourceId',
        'type': :'type',
        'is_excluded_from_execution': :'isExcludedFromExecution',
        'compatibility_messages': :'compatibilityMessages',
        'estimated_cost': :'estimatedCost',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_assessed': :'timeAssessed',
        'migration_asset': :'migrationAsset',
        'preferred_shape_type': :'preferredShapeType',
        'test_spec': :'testSpec',
        'block_volumes_performance': :'blockVolumesPerformance',
        'ms_license': :'msLicense',
        'user_spec': :'userSpec',
        'recommended_spec': :'recommendedSpec'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'migration_plan_id': :'String',
        'compartment_id': :'String',
        'created_resource_id': :'String',
        'type': :'String',
        'is_excluded_from_execution': :'BOOLEAN',
        'compatibility_messages': :'Array<OCI::CloudMigrations::Models::CompatibilityMessage>',
        'estimated_cost': :'OCI::CloudMigrations::Models::CostEstimation',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_assessed': :'DateTime',
        'migration_asset': :'OCI::CloudMigrations::Models::MigrationAsset',
        'preferred_shape_type': :'String',
        'test_spec': :'OCI::CloudMigrations::Models::LaunchInstanceDetails',
        'block_volumes_performance': :'Integer',
        'ms_license': :'String',
        'user_spec': :'OCI::CloudMigrations::Models::LaunchInstanceDetails',
        'recommended_spec': :'OCI::CloudMigrations::Models::LaunchInstanceDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#display_name #display_name} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#lifecycle_details #lifecycle_details} proprety
    # @option attributes [String] :migration_plan_id The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#migration_plan_id #migration_plan_id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#compartment_id #compartment_id} proprety
    # @option attributes [String] :created_resource_id The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#created_resource_id #created_resource_id} proprety
    # @option attributes [BOOLEAN] :is_excluded_from_execution The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#is_excluded_from_execution #is_excluded_from_execution} proprety
    # @option attributes [Array<OCI::CloudMigrations::Models::CompatibilityMessage>] :compatibility_messages The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#compatibility_messages #compatibility_messages} proprety
    # @option attributes [OCI::CloudMigrations::Models::CostEstimation] :estimated_cost The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#estimated_cost #estimated_cost} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#time_updated #time_updated} proprety
    # @option attributes [DateTime] :time_assessed The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#time_assessed #time_assessed} proprety
    # @option attributes [OCI::CloudMigrations::Models::MigrationAsset] :migration_asset The value to assign to the {OCI::CloudMigrations::Models::TargetAsset#migration_asset #migration_asset} proprety
    # @option attributes [String] :preferred_shape_type The value to assign to the {#preferred_shape_type} property
    # @option attributes [OCI::CloudMigrations::Models::LaunchInstanceDetails] :test_spec The value to assign to the {#test_spec} property
    # @option attributes [Integer] :block_volumes_performance The value to assign to the {#block_volumes_performance} property
    # @option attributes [String] :ms_license The value to assign to the {#ms_license} property
    # @option attributes [OCI::CloudMigrations::Models::LaunchInstanceDetails] :user_spec The value to assign to the {#user_spec} property
    # @option attributes [OCI::CloudMigrations::Models::LaunchInstanceDetails] :recommended_spec The value to assign to the {#recommended_spec} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'INSTANCE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.preferred_shape_type = attributes[:'preferredShapeType'] if attributes[:'preferredShapeType']

      raise 'You cannot provide both :preferredShapeType and :preferred_shape_type' if attributes.key?(:'preferredShapeType') && attributes.key?(:'preferred_shape_type')

      self.preferred_shape_type = attributes[:'preferred_shape_type'] if attributes[:'preferred_shape_type']

      self.test_spec = attributes[:'testSpec'] if attributes[:'testSpec']

      raise 'You cannot provide both :testSpec and :test_spec' if attributes.key?(:'testSpec') && attributes.key?(:'test_spec')

      self.test_spec = attributes[:'test_spec'] if attributes[:'test_spec']

      self.block_volumes_performance = attributes[:'blockVolumesPerformance'] if attributes[:'blockVolumesPerformance']

      raise 'You cannot provide both :blockVolumesPerformance and :block_volumes_performance' if attributes.key?(:'blockVolumesPerformance') && attributes.key?(:'block_volumes_performance')

      self.block_volumes_performance = attributes[:'block_volumes_performance'] if attributes[:'block_volumes_performance']

      self.ms_license = attributes[:'msLicense'] if attributes[:'msLicense']

      raise 'You cannot provide both :msLicense and :ms_license' if attributes.key?(:'msLicense') && attributes.key?(:'ms_license')

      self.ms_license = attributes[:'ms_license'] if attributes[:'ms_license']

      self.user_spec = attributes[:'userSpec'] if attributes[:'userSpec']

      raise 'You cannot provide both :userSpec and :user_spec' if attributes.key?(:'userSpec') && attributes.key?(:'user_spec')

      self.user_spec = attributes[:'user_spec'] if attributes[:'user_spec']

      self.recommended_spec = attributes[:'recommendedSpec'] if attributes[:'recommendedSpec']

      raise 'You cannot provide both :recommendedSpec and :recommended_spec' if attributes.key?(:'recommendedSpec') && attributes.key?(:'recommended_spec')

      self.recommended_spec = attributes[:'recommended_spec'] if attributes[:'recommended_spec']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] preferred_shape_type Object to be assigned
    def preferred_shape_type=(preferred_shape_type)
      # rubocop:disable Style/ConditionalAssignment
      if preferred_shape_type && !PREFERRED_SHAPE_TYPE_ENUM.include?(preferred_shape_type)
        OCI.logger.debug("Unknown value for 'preferred_shape_type' [" + preferred_shape_type + "]. Mapping to 'PREFERRED_SHAPE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @preferred_shape_type = PREFERRED_SHAPE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @preferred_shape_type = preferred_shape_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        migration_plan_id == other.migration_plan_id &&
        compartment_id == other.compartment_id &&
        created_resource_id == other.created_resource_id &&
        type == other.type &&
        is_excluded_from_execution == other.is_excluded_from_execution &&
        compatibility_messages == other.compatibility_messages &&
        estimated_cost == other.estimated_cost &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_assessed == other.time_assessed &&
        migration_asset == other.migration_asset &&
        preferred_shape_type == other.preferred_shape_type &&
        test_spec == other.test_spec &&
        block_volumes_performance == other.block_volumes_performance &&
        ms_license == other.ms_license &&
        user_spec == other.user_spec &&
        recommended_spec == other.recommended_spec
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
      [id, display_name, lifecycle_state, lifecycle_details, migration_plan_id, compartment_id, created_resource_id, type, is_excluded_from_execution, compatibility_messages, estimated_cost, time_created, time_updated, time_assessed, migration_asset, preferred_shape_type, test_spec, block_volumes_performance, ms_license, user_spec, recommended_spec].hash
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
