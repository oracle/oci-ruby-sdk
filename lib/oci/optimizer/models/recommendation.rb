# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The metadata associated with the recommendation.
  #
  class Optimizer::Models::Recommendation
    IMPORTANCE_ENUM = [
      IMPORTANCE_CRITICAL = 'CRITICAL'.freeze,
      IMPORTANCE_HIGH = 'HIGH'.freeze,
      IMPORTANCE_MODERATE = 'MODERATE'.freeze,
      IMPORTANCE_LOW = 'LOW'.freeze,
      IMPORTANCE_MINOR = 'MINOR'.freeze,
      IMPORTANCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_ATTACHING = 'ATTACHING'.freeze,
      LIFECYCLE_STATE_DETACHING = 'DETACHING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_PENDING = 'PENDING'.freeze,
      STATUS_DISMISSED = 'DISMISSED'.freeze,
      STATUS_POSTPONED = 'POSTPONED'.freeze,
      STATUS_IMPLEMENTED = 'IMPLEMENTED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique OCID associated with the recommendation.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the tenancy. The tenancy is the root compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The unique OCID associated with the category.
    # @return [String]
    attr_accessor :category_id

    # **[Required]** The name assigned to the recommendation.
    # @return [String]
    attr_accessor :name

    # **[Required]** Text describing the recommendation.
    # @return [String]
    attr_accessor :description

    # **[Required]** The level of importance assigned to the recommendation.
    # @return [String]
    attr_reader :importance

    # **[Required]** An array of `ResourceCount` objects grouped by the status of the resource actions.
    # @return [Array<OCI::Optimizer::Models::ResourceCount>]
    attr_accessor :resource_counts

    # **[Required]** The recommendation's current state.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The estimated cost savings, in dollars, for the recommendation.
    # @return [Float]
    attr_accessor :estimated_cost_saving

    # **[Required]** The current status of the recommendation.
    # @return [String]
    attr_reader :status

    # **[Required]** The date and time that the recommendation entered its current status. The format is defined by RFC3339.
    #
    # For example, \"The status of the recommendation changed from `pending` to `current(ignored)` on this date and time.\"
    #
    # @return [DateTime]
    attr_accessor :time_status_begin

    # The date and time the current status will change. The format is defined by RFC3339.
    #
    # For example, \"The current `postponed` status of the recommendation will end and change to `pending` on this
    # date and time.\"
    #
    # @return [DateTime]
    attr_accessor :time_status_end

    # The date and time the recommendation details were created, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the recommendation details were last updated, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # @return [OCI::Optimizer::Models::SupportedLevels]
    attr_accessor :supported_levels

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'category_id': :'categoryId',
        'name': :'name',
        'description': :'description',
        'importance': :'importance',
        'resource_counts': :'resourceCounts',
        'lifecycle_state': :'lifecycleState',
        'estimated_cost_saving': :'estimatedCostSaving',
        'status': :'status',
        'time_status_begin': :'timeStatusBegin',
        'time_status_end': :'timeStatusEnd',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'supported_levels': :'supportedLevels'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'category_id': :'String',
        'name': :'String',
        'description': :'String',
        'importance': :'String',
        'resource_counts': :'Array<OCI::Optimizer::Models::ResourceCount>',
        'lifecycle_state': :'String',
        'estimated_cost_saving': :'Float',
        'status': :'String',
        'time_status_begin': :'DateTime',
        'time_status_end': :'DateTime',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'supported_levels': :'OCI::Optimizer::Models::SupportedLevels'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :category_id The value to assign to the {#category_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :importance The value to assign to the {#importance} property
    # @option attributes [Array<OCI::Optimizer::Models::ResourceCount>] :resource_counts The value to assign to the {#resource_counts} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Float] :estimated_cost_saving The value to assign to the {#estimated_cost_saving} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_status_begin The value to assign to the {#time_status_begin} property
    # @option attributes [DateTime] :time_status_end The value to assign to the {#time_status_end} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [OCI::Optimizer::Models::SupportedLevels] :supported_levels The value to assign to the {#supported_levels} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.category_id = attributes[:'categoryId'] if attributes[:'categoryId']

      raise 'You cannot provide both :categoryId and :category_id' if attributes.key?(:'categoryId') && attributes.key?(:'category_id')

      self.category_id = attributes[:'category_id'] if attributes[:'category_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.importance = attributes[:'importance'] if attributes[:'importance']

      self.resource_counts = attributes[:'resourceCounts'] if attributes[:'resourceCounts']

      raise 'You cannot provide both :resourceCounts and :resource_counts' if attributes.key?(:'resourceCounts') && attributes.key?(:'resource_counts')

      self.resource_counts = attributes[:'resource_counts'] if attributes[:'resource_counts']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.estimated_cost_saving = attributes[:'estimatedCostSaving'] if attributes[:'estimatedCostSaving']

      raise 'You cannot provide both :estimatedCostSaving and :estimated_cost_saving' if attributes.key?(:'estimatedCostSaving') && attributes.key?(:'estimated_cost_saving')

      self.estimated_cost_saving = attributes[:'estimated_cost_saving'] if attributes[:'estimated_cost_saving']

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_status_begin = attributes[:'timeStatusBegin'] if attributes[:'timeStatusBegin']

      raise 'You cannot provide both :timeStatusBegin and :time_status_begin' if attributes.key?(:'timeStatusBegin') && attributes.key?(:'time_status_begin')

      self.time_status_begin = attributes[:'time_status_begin'] if attributes[:'time_status_begin']

      self.time_status_end = attributes[:'timeStatusEnd'] if attributes[:'timeStatusEnd']

      raise 'You cannot provide both :timeStatusEnd and :time_status_end' if attributes.key?(:'timeStatusEnd') && attributes.key?(:'time_status_end')

      self.time_status_end = attributes[:'time_status_end'] if attributes[:'time_status_end']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.supported_levels = attributes[:'supportedLevels'] if attributes[:'supportedLevels']

      raise 'You cannot provide both :supportedLevels and :supported_levels' if attributes.key?(:'supportedLevels') && attributes.key?(:'supported_levels')

      self.supported_levels = attributes[:'supported_levels'] if attributes[:'supported_levels']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] importance Object to be assigned
    def importance=(importance)
      # rubocop:disable Style/ConditionalAssignment
      if importance && !IMPORTANCE_ENUM.include?(importance)
        OCI.logger.debug("Unknown value for 'importance' [" + importance + "]. Mapping to 'IMPORTANCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @importance = IMPORTANCE_UNKNOWN_ENUM_VALUE
      else
        @importance = importance
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
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
        compartment_id == other.compartment_id &&
        category_id == other.category_id &&
        name == other.name &&
        description == other.description &&
        importance == other.importance &&
        resource_counts == other.resource_counts &&
        lifecycle_state == other.lifecycle_state &&
        estimated_cost_saving == other.estimated_cost_saving &&
        status == other.status &&
        time_status_begin == other.time_status_begin &&
        time_status_end == other.time_status_end &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        supported_levels == other.supported_levels
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
      [id, compartment_id, category_id, name, description, importance, resource_counts, lifecycle_state, estimated_cost_saving, status, time_status_begin, time_status_end, time_created, time_updated, supported_levels].hash
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
