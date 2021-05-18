# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Optional settings for Data Pump Export and Import jobs
  #
  class DatabaseMigration::Models::UpdateDataPumpSettings
    JOB_MODE_ENUM = [
      JOB_MODE_FULL = 'FULL'.freeze,
      JOB_MODE_SCHEMA = 'SCHEMA'.freeze,
      JOB_MODE_TABLE = 'TABLE'.freeze,
      JOB_MODE_TABLESPACE = 'TABLESPACE'.freeze,
      JOB_MODE_TRANSPORTABLE = 'TRANSPORTABLE'.freeze
    ].freeze

    # Data Pump job mode.
    # Refer to [Data Pump Export Modes ](https://docs.oracle.com/en/database/oracle/oracle-database/19/sutil/oracle-data-pump-export-utility.html#GUID-8E497131-6B9B-4CC8-AA50-35F480CAC2C4)
    #
    # @return [String]
    attr_reader :job_mode

    # @return [OCI::DatabaseMigration::Models::UpdateDataPumpParameters]
    attr_accessor :data_pump_parameters

    # Defines remappings to be applied to objects as they are processed.
    # Refer to [METADATA_REMAP Procedure ](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_DATAPUMP.html#GUID-0FC32790-91E6-4781-87A3-229DE024CB3D)
    # If specified, the list will be replaced entirely. Empty list will remove stored Metadata Remap details.
    #
    # @return [Array<OCI::DatabaseMigration::Models::MetadataRemap>]
    attr_accessor :metadata_remaps

    # @return [OCI::DatabaseMigration::Models::UpdateDirectoryObject]
    attr_accessor :export_directory_object

    # @return [OCI::DatabaseMigration::Models::UpdateDirectoryObject]
    attr_accessor :import_directory_object

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'job_mode': :'jobMode',
        'data_pump_parameters': :'dataPumpParameters',
        'metadata_remaps': :'metadataRemaps',
        'export_directory_object': :'exportDirectoryObject',
        'import_directory_object': :'importDirectoryObject'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'job_mode': :'String',
        'data_pump_parameters': :'OCI::DatabaseMigration::Models::UpdateDataPumpParameters',
        'metadata_remaps': :'Array<OCI::DatabaseMigration::Models::MetadataRemap>',
        'export_directory_object': :'OCI::DatabaseMigration::Models::UpdateDirectoryObject',
        'import_directory_object': :'OCI::DatabaseMigration::Models::UpdateDirectoryObject'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :job_mode The value to assign to the {#job_mode} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateDataPumpParameters] :data_pump_parameters The value to assign to the {#data_pump_parameters} property
    # @option attributes [Array<OCI::DatabaseMigration::Models::MetadataRemap>] :metadata_remaps The value to assign to the {#metadata_remaps} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateDirectoryObject] :export_directory_object The value to assign to the {#export_directory_object} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateDirectoryObject] :import_directory_object The value to assign to the {#import_directory_object} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.job_mode = attributes[:'jobMode'] if attributes[:'jobMode']

      raise 'You cannot provide both :jobMode and :job_mode' if attributes.key?(:'jobMode') && attributes.key?(:'job_mode')

      self.job_mode = attributes[:'job_mode'] if attributes[:'job_mode']

      self.data_pump_parameters = attributes[:'dataPumpParameters'] if attributes[:'dataPumpParameters']

      raise 'You cannot provide both :dataPumpParameters and :data_pump_parameters' if attributes.key?(:'dataPumpParameters') && attributes.key?(:'data_pump_parameters')

      self.data_pump_parameters = attributes[:'data_pump_parameters'] if attributes[:'data_pump_parameters']

      self.metadata_remaps = attributes[:'metadataRemaps'] if attributes[:'metadataRemaps']

      raise 'You cannot provide both :metadataRemaps and :metadata_remaps' if attributes.key?(:'metadataRemaps') && attributes.key?(:'metadata_remaps')

      self.metadata_remaps = attributes[:'metadata_remaps'] if attributes[:'metadata_remaps']

      self.export_directory_object = attributes[:'exportDirectoryObject'] if attributes[:'exportDirectoryObject']

      raise 'You cannot provide both :exportDirectoryObject and :export_directory_object' if attributes.key?(:'exportDirectoryObject') && attributes.key?(:'export_directory_object')

      self.export_directory_object = attributes[:'export_directory_object'] if attributes[:'export_directory_object']

      self.import_directory_object = attributes[:'importDirectoryObject'] if attributes[:'importDirectoryObject']

      raise 'You cannot provide both :importDirectoryObject and :import_directory_object' if attributes.key?(:'importDirectoryObject') && attributes.key?(:'import_directory_object')

      self.import_directory_object = attributes[:'import_directory_object'] if attributes[:'import_directory_object']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] job_mode Object to be assigned
    def job_mode=(job_mode)
      raise "Invalid value for 'job_mode': this must be one of the values in JOB_MODE_ENUM." if job_mode && !JOB_MODE_ENUM.include?(job_mode)

      @job_mode = job_mode
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        job_mode == other.job_mode &&
        data_pump_parameters == other.data_pump_parameters &&
        metadata_remaps == other.metadata_remaps &&
        export_directory_object == other.export_directory_object &&
        import_directory_object == other.import_directory_object
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
      [job_mode, data_pump_parameters, metadata_remaps, export_directory_object, import_directory_object].hash
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
