# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20190325
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a glossary. A glossary of business terms, such as 'Customer', 'Account', 'Contact', 'Address',
  # or 'Product', with definitions, used to provide common meaning across disparate data assets. Business glossaries
  # may be hierarchical where some terms may contain child terms to allow them to be used as 'taxonomies'.
  # By linking data assets, data entities, and attributes to glossaries and glossary terms, the glossary can act as a
  # way of organizing data catalog objects in a hierarchy to make a large number of objects more navigable and easier to
  # consume. Objects in the data catalog, such as data assets or data entities, may be linked to any level in the
  # glossary, so that the glossary can be used to browse the available data according to the business model of the
  # organization.
  #
  class DataCatalog::Models::GlossarySummary
    WORKFLOW_STATUS_ENUM = [
      WORKFLOW_STATUS_NEW = 'NEW'.freeze,
      WORKFLOW_STATUS_APPROVED = 'APPROVED'.freeze,
      WORKFLOW_STATUS_UNDER_REVIEW = 'UNDER_REVIEW'.freeze,
      WORKFLOW_STATUS_ESCALATED = 'ESCALATED'.freeze,
      WORKFLOW_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique glossary key that is immutable.
    # @return [String]
    attr_accessor :key

    # A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # The data catalog's OCID.
    # @return [String]
    attr_accessor :catalog_id

    # The date and time the glossary was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Detailed description of the glossary.
    # @return [String]
    attr_accessor :description

    # URI to the glossary instance in the API.
    # @return [String]
    attr_accessor :uri

    # Status of the approval process workflow for this business glossary.
    # @return [String]
    attr_reader :workflow_status

    # State of the Glossary.
    # @return [String]
    attr_reader :lifecycle_state

    # The unique key of the job definition resource that was used in the Glossary import.
    # @return [String]
    attr_accessor :import_job_definition_key

    # The unique key of the job policy for Glossary import.
    # @return [String]
    attr_accessor :import_job_key

    # The unique key of the parent job execution for which the log resource was created.
    # @return [String]
    attr_accessor :latest_import_job_execution_key

    # Status of the latest glossary import job execution, such as running, paused, or completed.
    # This may include additional information like time import started , import file size and % of completion
    #
    # @return [String]
    attr_accessor :latest_import_job_execution_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'catalog_id': :'catalogId',
        'time_created': :'timeCreated',
        'description': :'description',
        'uri': :'uri',
        'workflow_status': :'workflowStatus',
        'lifecycle_state': :'lifecycleState',
        'import_job_definition_key': :'importJobDefinitionKey',
        'import_job_key': :'importJobKey',
        'latest_import_job_execution_key': :'latestImportJobExecutionKey',
        'latest_import_job_execution_status': :'latestImportJobExecutionStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'display_name': :'String',
        'catalog_id': :'String',
        'time_created': :'DateTime',
        'description': :'String',
        'uri': :'String',
        'workflow_status': :'String',
        'lifecycle_state': :'String',
        'import_job_definition_key': :'String',
        'import_job_key': :'String',
        'latest_import_job_execution_key': :'String',
        'latest_import_job_execution_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :catalog_id The value to assign to the {#catalog_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [String] :workflow_status The value to assign to the {#workflow_status} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :import_job_definition_key The value to assign to the {#import_job_definition_key} property
    # @option attributes [String] :import_job_key The value to assign to the {#import_job_key} property
    # @option attributes [String] :latest_import_job_execution_key The value to assign to the {#latest_import_job_execution_key} property
    # @option attributes [String] :latest_import_job_execution_status The value to assign to the {#latest_import_job_execution_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.catalog_id = attributes[:'catalogId'] if attributes[:'catalogId']

      raise 'You cannot provide both :catalogId and :catalog_id' if attributes.key?(:'catalogId') && attributes.key?(:'catalog_id')

      self.catalog_id = attributes[:'catalog_id'] if attributes[:'catalog_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.description = attributes[:'description'] if attributes[:'description']

      self.uri = attributes[:'uri'] if attributes[:'uri']

      self.workflow_status = attributes[:'workflowStatus'] if attributes[:'workflowStatus']

      raise 'You cannot provide both :workflowStatus and :workflow_status' if attributes.key?(:'workflowStatus') && attributes.key?(:'workflow_status')

      self.workflow_status = attributes[:'workflow_status'] if attributes[:'workflow_status']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.import_job_definition_key = attributes[:'importJobDefinitionKey'] if attributes[:'importJobDefinitionKey']

      raise 'You cannot provide both :importJobDefinitionKey and :import_job_definition_key' if attributes.key?(:'importJobDefinitionKey') && attributes.key?(:'import_job_definition_key')

      self.import_job_definition_key = attributes[:'import_job_definition_key'] if attributes[:'import_job_definition_key']

      self.import_job_key = attributes[:'importJobKey'] if attributes[:'importJobKey']

      raise 'You cannot provide both :importJobKey and :import_job_key' if attributes.key?(:'importJobKey') && attributes.key?(:'import_job_key')

      self.import_job_key = attributes[:'import_job_key'] if attributes[:'import_job_key']

      self.latest_import_job_execution_key = attributes[:'latestImportJobExecutionKey'] if attributes[:'latestImportJobExecutionKey']

      raise 'You cannot provide both :latestImportJobExecutionKey and :latest_import_job_execution_key' if attributes.key?(:'latestImportJobExecutionKey') && attributes.key?(:'latest_import_job_execution_key')

      self.latest_import_job_execution_key = attributes[:'latest_import_job_execution_key'] if attributes[:'latest_import_job_execution_key']

      self.latest_import_job_execution_status = attributes[:'latestImportJobExecutionStatus'] if attributes[:'latestImportJobExecutionStatus']

      raise 'You cannot provide both :latestImportJobExecutionStatus and :latest_import_job_execution_status' if attributes.key?(:'latestImportJobExecutionStatus') && attributes.key?(:'latest_import_job_execution_status')

      self.latest_import_job_execution_status = attributes[:'latest_import_job_execution_status'] if attributes[:'latest_import_job_execution_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] workflow_status Object to be assigned
    def workflow_status=(workflow_status)
      # rubocop:disable Style/ConditionalAssignment
      if workflow_status && !WORKFLOW_STATUS_ENUM.include?(workflow_status)
        OCI.logger.debug("Unknown value for 'workflow_status' [" + workflow_status + "]. Mapping to 'WORKFLOW_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @workflow_status = WORKFLOW_STATUS_UNKNOWN_ENUM_VALUE
      else
        @workflow_status = workflow_status
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        display_name == other.display_name &&
        catalog_id == other.catalog_id &&
        time_created == other.time_created &&
        description == other.description &&
        uri == other.uri &&
        workflow_status == other.workflow_status &&
        lifecycle_state == other.lifecycle_state &&
        import_job_definition_key == other.import_job_definition_key &&
        import_job_key == other.import_job_key &&
        latest_import_job_execution_key == other.latest_import_job_execution_key &&
        latest_import_job_execution_status == other.latest_import_job_execution_status
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
      [key, display_name, catalog_id, time_created, description, uri, workflow_status, lifecycle_state, import_job_definition_key, import_job_key, latest_import_job_execution_key, latest_import_job_execution_status].hash
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
