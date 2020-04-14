# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties used in data entity create operations.
  class DataCatalog::Models::CreateEntityDetails
    # **[Required]** A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of a data entity.
    # @return [String]
    attr_accessor :description

    # **[Required]** Last modified timestamp of the object in the external system.
    # @return [DateTime]
    attr_accessor :time_external

    # Property to indicate if the object is a physical materialized object or virtual. For example, View.
    # @return [BOOLEAN]
    attr_accessor :is_logical

    # Property to indicate if the object is a sub object of a parent physical object.
    # @return [BOOLEAN]
    attr_accessor :is_partition

    # Key of the associated folder.
    # @return [String]
    attr_accessor :folder_key

    # Status of the object as updated by the harvest process. When an entity object is created , it's harvest status
    # will indicate if the entity's metadata has been fully harvested or not. The harvest process can perform
    # shallow harvesting to allow users to browse the metadata and can on-demand deep harvest on any object
    # This requires a harvest status indicator for catalog objects.
    #
    # @return [String]
    attr_accessor :harvest_status

    # Key of the last harvest process to update this object.
    # @return [String]
    attr_accessor :last_job_key

    # A map of maps that contains the properties which are specific to the entity type. Each entity type
    # definition defines it's set of required and optional properties. The map keys are category names and the
    # values are maps of property name to property value. Every property is contained inside of a category. Most
    # entities have required properties within the \"default\" category. To determine the set of required and
    # optional properties for an entity type, a query can be done on '/types?type=dataEntity' that returns a
    # collection of all entity types. The appropriate entity type, which includes definitions of all of
    # it's properties, can be identified from this collection.
    # Example: `{\"properties\": { \"default\": { \"key1\": \"value1\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'time_external': :'timeExternal',
        'is_logical': :'isLogical',
        'is_partition': :'isPartition',
        'folder_key': :'folderKey',
        'harvest_status': :'harvestStatus',
        'last_job_key': :'lastJobKey',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'time_external': :'DateTime',
        'is_logical': :'BOOLEAN',
        'is_partition': :'BOOLEAN',
        'folder_key': :'String',
        'harvest_status': :'String',
        'last_job_key': :'String',
        'properties': :'Hash<String, Hash<String, String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_external The value to assign to the {#time_external} property
    # @option attributes [BOOLEAN] :is_logical The value to assign to the {#is_logical} property
    # @option attributes [BOOLEAN] :is_partition The value to assign to the {#is_partition} property
    # @option attributes [String] :folder_key The value to assign to the {#folder_key} property
    # @option attributes [String] :harvest_status The value to assign to the {#harvest_status} property
    # @option attributes [String] :last_job_key The value to assign to the {#last_job_key} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.time_external = attributes[:'timeExternal'] if attributes[:'timeExternal']

      raise 'You cannot provide both :timeExternal and :time_external' if attributes.key?(:'timeExternal') && attributes.key?(:'time_external')

      self.time_external = attributes[:'time_external'] if attributes[:'time_external']

      self.is_logical = attributes[:'isLogical'] unless attributes[:'isLogical'].nil?
      self.is_logical = false if is_logical.nil? && !attributes.key?(:'isLogical') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isLogical and :is_logical' if attributes.key?(:'isLogical') && attributes.key?(:'is_logical')

      self.is_logical = attributes[:'is_logical'] unless attributes[:'is_logical'].nil?
      self.is_logical = false if is_logical.nil? && !attributes.key?(:'isLogical') && !attributes.key?(:'is_logical') # rubocop:disable Style/StringLiterals

      self.is_partition = attributes[:'isPartition'] unless attributes[:'isPartition'].nil?
      self.is_partition = false if is_partition.nil? && !attributes.key?(:'isPartition') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPartition and :is_partition' if attributes.key?(:'isPartition') && attributes.key?(:'is_partition')

      self.is_partition = attributes[:'is_partition'] unless attributes[:'is_partition'].nil?
      self.is_partition = false if is_partition.nil? && !attributes.key?(:'isPartition') && !attributes.key?(:'is_partition') # rubocop:disable Style/StringLiterals

      self.folder_key = attributes[:'folderKey'] if attributes[:'folderKey']

      raise 'You cannot provide both :folderKey and :folder_key' if attributes.key?(:'folderKey') && attributes.key?(:'folder_key')

      self.folder_key = attributes[:'folder_key'] if attributes[:'folder_key']

      self.harvest_status = attributes[:'harvestStatus'] if attributes[:'harvestStatus']

      raise 'You cannot provide both :harvestStatus and :harvest_status' if attributes.key?(:'harvestStatus') && attributes.key?(:'harvest_status')

      self.harvest_status = attributes[:'harvest_status'] if attributes[:'harvest_status']

      self.last_job_key = attributes[:'lastJobKey'] if attributes[:'lastJobKey']

      raise 'You cannot provide both :lastJobKey and :last_job_key' if attributes.key?(:'lastJobKey') && attributes.key?(:'last_job_key')

      self.last_job_key = attributes[:'last_job_key'] if attributes[:'last_job_key']

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        description == other.description &&
        time_external == other.time_external &&
        is_logical == other.is_logical &&
        is_partition == other.is_partition &&
        folder_key == other.folder_key &&
        harvest_status == other.harvest_status &&
        last_job_key == other.last_job_key &&
        properties == other.properties
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
      [display_name, description, time_external, is_logical, is_partition, folder_key, harvest_status, last_job_key, properties].hash
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
