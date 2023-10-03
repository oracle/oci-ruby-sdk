# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20201101
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of an external ASM instance.
  class DatabaseManagement::Models::ExternalAsmInstanceSummary
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external ASM instance.
    # @return [String]
    attr_accessor :id

    # **[Required]** The user-friendly name for the ASM instance. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The name of the external ASM instance.
    # @return [String]
    attr_accessor :component_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external ASM that the ASM instance belongs to.
    # @return [String]
    attr_accessor :external_asm_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external DB system that the ASM instance is a part of.
    # @return [String]
    attr_accessor :external_db_system_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the external DB node on which the ASM instance is running.
    # @return [String]
    attr_accessor :external_db_node_id

    # The Automatic Diagnostic Repository (ADR) home directory for the ASM instance.
    # @return [String]
    attr_accessor :adr_home_directory

    # The name of the host on which the ASM instance is running.
    # @return [String]
    attr_accessor :host_name

    # **[Required]** The current lifecycle state of the external ASM instance.
    # @return [String]
    attr_accessor :lifecycle_state

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The date and time the external ASM instance was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the external ASM instance was last updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'component_name': :'componentName',
        'compartment_id': :'compartmentId',
        'external_asm_id': :'externalAsmId',
        'external_db_system_id': :'externalDbSystemId',
        'external_db_node_id': :'externalDbNodeId',
        'adr_home_directory': :'adrHomeDirectory',
        'host_name': :'hostName',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'component_name': :'String',
        'compartment_id': :'String',
        'external_asm_id': :'String',
        'external_db_system_id': :'String',
        'external_db_node_id': :'String',
        'adr_home_directory': :'String',
        'host_name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :component_name The value to assign to the {#component_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :external_asm_id The value to assign to the {#external_asm_id} property
    # @option attributes [String] :external_db_system_id The value to assign to the {#external_db_system_id} property
    # @option attributes [String] :external_db_node_id The value to assign to the {#external_db_node_id} property
    # @option attributes [String] :adr_home_directory The value to assign to the {#adr_home_directory} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.component_name = attributes[:'componentName'] if attributes[:'componentName']

      raise 'You cannot provide both :componentName and :component_name' if attributes.key?(:'componentName') && attributes.key?(:'component_name')

      self.component_name = attributes[:'component_name'] if attributes[:'component_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.external_asm_id = attributes[:'externalAsmId'] if attributes[:'externalAsmId']

      raise 'You cannot provide both :externalAsmId and :external_asm_id' if attributes.key?(:'externalAsmId') && attributes.key?(:'external_asm_id')

      self.external_asm_id = attributes[:'external_asm_id'] if attributes[:'external_asm_id']

      self.external_db_system_id = attributes[:'externalDbSystemId'] if attributes[:'externalDbSystemId']

      raise 'You cannot provide both :externalDbSystemId and :external_db_system_id' if attributes.key?(:'externalDbSystemId') && attributes.key?(:'external_db_system_id')

      self.external_db_system_id = attributes[:'external_db_system_id'] if attributes[:'external_db_system_id']

      self.external_db_node_id = attributes[:'externalDbNodeId'] if attributes[:'externalDbNodeId']

      raise 'You cannot provide both :externalDbNodeId and :external_db_node_id' if attributes.key?(:'externalDbNodeId') && attributes.key?(:'external_db_node_id')

      self.external_db_node_id = attributes[:'external_db_node_id'] if attributes[:'external_db_node_id']

      self.adr_home_directory = attributes[:'adrHomeDirectory'] if attributes[:'adrHomeDirectory']

      raise 'You cannot provide both :adrHomeDirectory and :adr_home_directory' if attributes.key?(:'adrHomeDirectory') && attributes.key?(:'adr_home_directory')

      self.adr_home_directory = attributes[:'adr_home_directory'] if attributes[:'adr_home_directory']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        component_name == other.component_name &&
        compartment_id == other.compartment_id &&
        external_asm_id == other.external_asm_id &&
        external_db_system_id == other.external_db_system_id &&
        external_db_node_id == other.external_db_node_id &&
        adr_home_directory == other.adr_home_directory &&
        host_name == other.host_name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated
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
      [id, display_name, component_name, compartment_id, external_asm_id, external_db_system_id, external_db_node_id, adr_home_directory, host_name, lifecycle_state, lifecycle_details, time_created, time_updated].hash
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
