# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Returns a listing of all of the specified job's properties and their values.
  class ResourceManager::Models::JobSummary
    # The job's OCID.
    # @return [String]
    attr_accessor :id

    # OCID of the stack that is associated with the specified job.
    # @return [String]
    attr_accessor :stack_id

    # OCID of the compartment where the stack of the associated job resides.
    # @return [String]
    attr_accessor :compartment_id

    # The job's display name.
    # @return [String]
    attr_accessor :display_name

    # The type of job executing
    # @return [String]
    attr_accessor :operation

    # @return [OCI::ResourceManager::Models::ApplyJobPlanResolution]
    attr_accessor :apply_job_plan_resolution

    # The plan job OCID that was used (if this was an APPLY job and not auto approved).
    # @return [String]
    attr_accessor :resolved_plan_job_id

    # The date and time the job was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the job succeeded or failed.
    # @return [DateTime]
    attr_accessor :time_finished

    # Current state of the specified job. Allowed values are:
    # - ACCEPTED
    # - IN_PROGRESS
    # - FAILED
    # - SUCCEEDED
    # - CANCELING
    # - CANCELED
    #
    # @return [String]
    attr_accessor :lifecycle_state

    # Free-form tags associated with this resource. Each tag is a key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'stack_id': :'stackId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'operation': :'operation',
        'apply_job_plan_resolution': :'applyJobPlanResolution',
        'resolved_plan_job_id': :'resolvedPlanJobId',
        'time_created': :'timeCreated',
        'time_finished': :'timeFinished',
        'lifecycle_state': :'lifecycleState',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'stack_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'operation': :'String',
        'apply_job_plan_resolution': :'OCI::ResourceManager::Models::ApplyJobPlanResolution',
        'resolved_plan_job_id': :'String',
        'time_created': :'DateTime',
        'time_finished': :'DateTime',
        'lifecycle_state': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :stack_id The value to assign to the {#stack_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :operation The value to assign to the {#operation} property
    # @option attributes [OCI::ResourceManager::Models::ApplyJobPlanResolution] :apply_job_plan_resolution The value to assign to the {#apply_job_plan_resolution} property
    # @option attributes [String] :resolved_plan_job_id The value to assign to the {#resolved_plan_job_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.stack_id = attributes[:'stackId'] if attributes[:'stackId']

      raise 'You cannot provide both :stackId and :stack_id' if attributes.key?(:'stackId') && attributes.key?(:'stack_id')

      self.stack_id = attributes[:'stack_id'] if attributes[:'stack_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.operation = attributes[:'operation'] if attributes[:'operation']

      self.apply_job_plan_resolution = attributes[:'applyJobPlanResolution'] if attributes[:'applyJobPlanResolution']

      raise 'You cannot provide both :applyJobPlanResolution and :apply_job_plan_resolution' if attributes.key?(:'applyJobPlanResolution') && attributes.key?(:'apply_job_plan_resolution')

      self.apply_job_plan_resolution = attributes[:'apply_job_plan_resolution'] if attributes[:'apply_job_plan_resolution']

      self.resolved_plan_job_id = attributes[:'resolvedPlanJobId'] if attributes[:'resolvedPlanJobId']

      raise 'You cannot provide both :resolvedPlanJobId and :resolved_plan_job_id' if attributes.key?(:'resolvedPlanJobId') && attributes.key?(:'resolved_plan_job_id')

      self.resolved_plan_job_id = attributes[:'resolved_plan_job_id'] if attributes[:'resolved_plan_job_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
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
        stack_id == other.stack_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        operation == other.operation &&
        apply_job_plan_resolution == other.apply_job_plan_resolution &&
        resolved_plan_job_id == other.resolved_plan_job_id &&
        time_created == other.time_created &&
        time_finished == other.time_finished &&
        lifecycle_state == other.lifecycle_state &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, stack_id, compartment_id, display_name, operation, apply_job_plan_resolution, resolved_plan_job_id, time_created, time_finished, lifecycle_state, freeform_tags, defined_tags].hash
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
