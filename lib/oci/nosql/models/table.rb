# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Complete metadata about a table.
  class Nosql::Models::Table
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier that is immutable.
    # @return [String]
    attr_accessor :id

    # Human-friendly table name, immutable.
    # @return [String]
    attr_accessor :name

    # **[Required]** Compartment Identifier.
    # @return [String]
    attr_accessor :compartment_id

    # The time the the table was created. An RFC3339 formatted
    # datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the the table's metadata was last updated. An
    # RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # @return [OCI::Nosql::Models::TableLimits]
    attr_accessor :table_limits

    # The state of a table.
    # @return [String]
    attr_reader :lifecycle_state

    # True if this table can be reclaimed after an idle period.
    # @return [BOOLEAN]
    attr_accessor :is_auto_reclaimable

    # If lifecycleState is INACTIVE, indicates when
    # this table will be automatically removed.
    # An RFC3339 formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_of_expiration

    # A message describing the current state in more detail.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # @return [OCI::Nosql::Models::Schema]
    attr_accessor :schema

    # A DDL statement representing the schema.
    # @return [String]
    attr_accessor :ddl_statement

    # Simple key-value pair that is applied without any predefined
    # name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and
    # scoped to a namespace.  Example: `{\"foo-namespace\":
    # {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Read-only system tag. These predefined keys are scoped to
    # namespaces.  At present the only supported namespace is
    # `\"orcl-cloud\"`; and the only key in that namespace is
    # `\"free-tier-retained\"`.
    # Example: `{\"orcl-cloud\"\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'table_limits': :'tableLimits',
        'lifecycle_state': :'lifecycleState',
        'is_auto_reclaimable': :'isAutoReclaimable',
        'time_of_expiration': :'timeOfExpiration',
        'lifecycle_details': :'lifecycleDetails',
        'schema': :'schema',
        'ddl_statement': :'ddlStatement',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'table_limits': :'OCI::Nosql::Models::TableLimits',
        'lifecycle_state': :'String',
        'is_auto_reclaimable': :'BOOLEAN',
        'time_of_expiration': :'DateTime',
        'lifecycle_details': :'String',
        'schema': :'OCI::Nosql::Models::Schema',
        'ddl_statement': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [OCI::Nosql::Models::TableLimits] :table_limits The value to assign to the {#table_limits} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_auto_reclaimable The value to assign to the {#is_auto_reclaimable} property
    # @option attributes [DateTime] :time_of_expiration The value to assign to the {#time_of_expiration} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [OCI::Nosql::Models::Schema] :schema The value to assign to the {#schema} property
    # @option attributes [String] :ddl_statement The value to assign to the {#ddl_statement} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.table_limits = attributes[:'tableLimits'] if attributes[:'tableLimits']

      raise 'You cannot provide both :tableLimits and :table_limits' if attributes.key?(:'tableLimits') && attributes.key?(:'table_limits')

      self.table_limits = attributes[:'table_limits'] if attributes[:'table_limits']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_auto_reclaimable = attributes[:'isAutoReclaimable'] unless attributes[:'isAutoReclaimable'].nil?

      raise 'You cannot provide both :isAutoReclaimable and :is_auto_reclaimable' if attributes.key?(:'isAutoReclaimable') && attributes.key?(:'is_auto_reclaimable')

      self.is_auto_reclaimable = attributes[:'is_auto_reclaimable'] unless attributes[:'is_auto_reclaimable'].nil?

      self.time_of_expiration = attributes[:'timeOfExpiration'] if attributes[:'timeOfExpiration']

      raise 'You cannot provide both :timeOfExpiration and :time_of_expiration' if attributes.key?(:'timeOfExpiration') && attributes.key?(:'time_of_expiration')

      self.time_of_expiration = attributes[:'time_of_expiration'] if attributes[:'time_of_expiration']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.schema = attributes[:'schema'] if attributes[:'schema']

      self.ddl_statement = attributes[:'ddlStatement'] if attributes[:'ddlStatement']

      raise 'You cannot provide both :ddlStatement and :ddl_statement' if attributes.key?(:'ddlStatement') && attributes.key?(:'ddl_statement')

      self.ddl_statement = attributes[:'ddl_statement'] if attributes[:'ddl_statement']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
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
        name == other.name &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        table_limits == other.table_limits &&
        lifecycle_state == other.lifecycle_state &&
        is_auto_reclaimable == other.is_auto_reclaimable &&
        time_of_expiration == other.time_of_expiration &&
        lifecycle_details == other.lifecycle_details &&
        schema == other.schema &&
        ddl_statement == other.ddl_statement &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, name, compartment_id, time_created, time_updated, table_limits, lifecycle_state, is_auto_reclaimable, time_of_expiration, lifecycle_details, schema, ddl_statement, freeform_tags, defined_tags, system_tags].hash
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
