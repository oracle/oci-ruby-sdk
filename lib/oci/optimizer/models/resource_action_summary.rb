# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The metadata associated with the resource action summary.
  #
  class Optimizer::Models::ResourceActionSummary
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

    # **[Required]** The unique OCID associated with the resource action.
    # @return [String]
    attr_accessor :id

    # **[Required]** The unique OCID associated with the category.
    # @return [String]
    attr_accessor :category_id

    # **[Required]** The unique OCID associated with the recommendation.
    # @return [String]
    attr_accessor :recommendation_id

    # **[Required]** The unique OCID associated with the resource.
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** The name assigned to the resource.
    # @return [String]
    attr_accessor :name

    # **[Required]** The kind of resource.
    # @return [String]
    attr_accessor :resource_type

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The name associated with the compartment.
    # @return [String]
    attr_accessor :compartment_name

    # This attribute is required.
    # @return [OCI::Optimizer::Models::Action]
    attr_accessor :action

    # **[Required]** The resource action's current state.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The estimated cost savings, in dollars, for the resource action.
    # @return [Float]
    attr_accessor :estimated_cost_saving

    # **[Required]** The current status of the resource action.
    # @return [String]
    attr_reader :status

    # **[Required]** The date and time that the resource action entered its current status. The format is defined by RFC3339.
    #
    # For example, \"The status of the resource action changed from `pending` to `current(ignored)` on this date and time.\"
    #
    # @return [DateTime]
    attr_accessor :time_status_begin

    # The date and time the current status will change. The format is defined by RFC3339.
    #
    # For example, \"The current `postponed` status of the resource action will end and change to `pending` on this
    # date and time.\"
    #
    # @return [DateTime]
    attr_accessor :time_status_end

    # Custom metadata key/value pairs for the resource action.
    #
    #  **Metadata Example**
    #
    #       \"metadata\" : {
    #          \"cpuRecommendedShape\": \"VM.Standard1.1\",
    #          \"computeMemoryUtilization\": \"26.05734124418388\",
    #          \"currentShape\": \"VM.Standard1.2\",
    #          \"instanceRecommendedShape\": \"VM.Standard1.1\",
    #          \"computeCpuUtilization\": \"7.930035319720132\",
    #          \"memoryRecommendedShape\": \"None\"
    #       }
    #
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # Additional metadata key/value pairs that you provide.
    # They serve the same purpose and functionality as fields in the `metadata` object.
    #
    # They are distinguished from `metadata` fields in that these can be nested JSON objects (whereas `metadata` fields are string/string maps only).
    #
    # For example:
    #
    # `{\"CurrentShape\": {\"name\":\"VM.Standard2.16\"}, \"RecommendedShape\": {\"name\":\"VM.Standard2.8\"}}`
    #
    # @return [Hash<String, Object>]
    attr_accessor :extended_metadata

    # The date and time the resource action details were created, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the resource action details were last updated, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'category_id': :'categoryId',
        'recommendation_id': :'recommendationId',
        'resource_id': :'resourceId',
        'name': :'name',
        'resource_type': :'resourceType',
        'compartment_id': :'compartmentId',
        'compartment_name': :'compartmentName',
        'action': :'action',
        'lifecycle_state': :'lifecycleState',
        'estimated_cost_saving': :'estimatedCostSaving',
        'status': :'status',
        'time_status_begin': :'timeStatusBegin',
        'time_status_end': :'timeStatusEnd',
        'metadata': :'metadata',
        'extended_metadata': :'extendedMetadata',
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
        'category_id': :'String',
        'recommendation_id': :'String',
        'resource_id': :'String',
        'name': :'String',
        'resource_type': :'String',
        'compartment_id': :'String',
        'compartment_name': :'String',
        'action': :'OCI::Optimizer::Models::Action',
        'lifecycle_state': :'String',
        'estimated_cost_saving': :'Float',
        'status': :'String',
        'time_status_begin': :'DateTime',
        'time_status_end': :'DateTime',
        'metadata': :'Hash<String, String>',
        'extended_metadata': :'Hash<String, Object>',
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
    # @option attributes [String] :category_id The value to assign to the {#category_id} property
    # @option attributes [String] :recommendation_id The value to assign to the {#recommendation_id} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :compartment_name The value to assign to the {#compartment_name} property
    # @option attributes [OCI::Optimizer::Models::Action] :action The value to assign to the {#action} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Float] :estimated_cost_saving The value to assign to the {#estimated_cost_saving} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_status_begin The value to assign to the {#time_status_begin} property
    # @option attributes [DateTime] :time_status_end The value to assign to the {#time_status_end} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [Hash<String, Object>] :extended_metadata The value to assign to the {#extended_metadata} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.category_id = attributes[:'categoryId'] if attributes[:'categoryId']

      raise 'You cannot provide both :categoryId and :category_id' if attributes.key?(:'categoryId') && attributes.key?(:'category_id')

      self.category_id = attributes[:'category_id'] if attributes[:'category_id']

      self.recommendation_id = attributes[:'recommendationId'] if attributes[:'recommendationId']

      raise 'You cannot provide both :recommendationId and :recommendation_id' if attributes.key?(:'recommendationId') && attributes.key?(:'recommendation_id')

      self.recommendation_id = attributes[:'recommendation_id'] if attributes[:'recommendation_id']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compartment_name = attributes[:'compartmentName'] if attributes[:'compartmentName']

      raise 'You cannot provide both :compartmentName and :compartment_name' if attributes.key?(:'compartmentName') && attributes.key?(:'compartment_name')

      self.compartment_name = attributes[:'compartment_name'] if attributes[:'compartment_name']

      self.action = attributes[:'action'] if attributes[:'action']

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

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.extended_metadata = attributes[:'extendedMetadata'] if attributes[:'extendedMetadata']

      raise 'You cannot provide both :extendedMetadata and :extended_metadata' if attributes.key?(:'extendedMetadata') && attributes.key?(:'extended_metadata')

      self.extended_metadata = attributes[:'extended_metadata'] if attributes[:'extended_metadata']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
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
        category_id == other.category_id &&
        recommendation_id == other.recommendation_id &&
        resource_id == other.resource_id &&
        name == other.name &&
        resource_type == other.resource_type &&
        compartment_id == other.compartment_id &&
        compartment_name == other.compartment_name &&
        action == other.action &&
        lifecycle_state == other.lifecycle_state &&
        estimated_cost_saving == other.estimated_cost_saving &&
        status == other.status &&
        time_status_begin == other.time_status_begin &&
        time_status_end == other.time_status_end &&
        metadata == other.metadata &&
        extended_metadata == other.extended_metadata &&
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
      [id, category_id, recommendation_id, resource_id, name, resource_type, compartment_id, compartment_name, action, lifecycle_state, estimated_cost_saving, status, time_status_begin, time_status_end, metadata, extended_metadata, time_created, time_updated].hash
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
