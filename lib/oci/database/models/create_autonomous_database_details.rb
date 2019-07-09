# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'create_autonomous_database_base'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create an Oracle Autonomous Database.
  #
  class Database::Models::CreateAutonomousDatabaseDetails < Database::Models::CreateAutonomousDatabaseBase
    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'db_name': :'dbName',
        'cpu_core_count': :'cpuCoreCount',
        'db_workload': :'dbWorkload',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'admin_password': :'adminPassword',
        'display_name': :'displayName',
        'license_model': :'licenseModel',
        'is_preview_version_with_service_terms_accepted': :'isPreviewVersionWithServiceTermsAccepted',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'is_dedicated': :'isDedicated',
        'autonomous_container_database_id': :'autonomousContainerDatabaseId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'source': :'source'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'db_name': :'String',
        'cpu_core_count': :'Integer',
        'db_workload': :'String',
        'data_storage_size_in_tbs': :'Integer',
        'admin_password': :'String',
        'display_name': :'String',
        'license_model': :'String',
        'is_preview_version_with_service_terms_accepted': :'BOOLEAN',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'is_dedicated': :'BOOLEAN',
        'autonomous_container_database_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'source': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#compartment_id #compartment_id} proprety
    # @option attributes [String] :db_name The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#db_name #db_name} proprety
    # @option attributes [Integer] :cpu_core_count The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#cpu_core_count #cpu_core_count} proprety
    # @option attributes [String] :db_workload The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#db_workload #db_workload} proprety
    # @option attributes [Integer] :data_storage_size_in_tbs The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#data_storage_size_in_tbs #data_storage_size_in_tbs} proprety
    # @option attributes [String] :admin_password The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#admin_password #admin_password} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#display_name #display_name} proprety
    # @option attributes [String] :license_model The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#license_model #license_model} proprety
    # @option attributes [BOOLEAN] :is_preview_version_with_service_terms_accepted The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#is_preview_version_with_service_terms_accepted #is_preview_version_with_service_terms_accepted} proprety
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#is_auto_scaling_enabled #is_auto_scaling_enabled} proprety
    # @option attributes [BOOLEAN] :is_dedicated The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#is_dedicated #is_dedicated} proprety
    # @option attributes [String] :autonomous_container_database_id The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#autonomous_container_database_id #autonomous_container_database_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Database::Models::CreateAutonomousDatabaseBase#defined_tags #defined_tags} proprety
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['source'] = 'NONE'

      super(attributes)
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        db_name == other.db_name &&
        cpu_core_count == other.cpu_core_count &&
        db_workload == other.db_workload &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        admin_password == other.admin_password &&
        display_name == other.display_name &&
        license_model == other.license_model &&
        is_preview_version_with_service_terms_accepted == other.is_preview_version_with_service_terms_accepted &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        is_dedicated == other.is_dedicated &&
        autonomous_container_database_id == other.autonomous_container_database_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        source == other.source
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
      [compartment_id, db_name, cpu_core_count, db_workload, data_storage_size_in_tbs, admin_password, display_name, license_model, is_preview_version_with_service_terms_accepted, is_auto_scaling_enabled, is_dedicated, autonomous_container_database_id, freeform_tags, defined_tags, source].hash
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
