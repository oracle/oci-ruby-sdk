# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Repositories containing the source code to build and deploy.
  class Devops::Models::Repository
    REPOSITORY_TYPE_ENUM = [
      REPOSITORY_TYPE_MIRRORED = 'MIRRORED'.freeze,
      REPOSITORY_TYPE_HOSTED = 'HOSTED'.freeze,
      REPOSITORY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRIGGER_BUILD_EVENTS_ENUM = [
      TRIGGER_BUILD_EVENTS_PUSH = 'PUSH'.freeze,
      TRIGGER_BUILD_EVENTS_COMMIT_UPDATES = 'COMMIT_UPDATES'.freeze,
      TRIGGER_BUILD_EVENTS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the repository. This value is unique and immutable.
    # @return [String]
    attr_accessor :id

    # Unique name of a repository. This value is mutable.
    # @return [String]
    attr_accessor :name

    # **[Required]** The OCID of the repository's compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Tenancy unique namespace.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The OCID of the DevOps project containing the repository.
    # @return [String]
    attr_accessor :project_id

    # Unique project name in a namespace.
    # @return [String]
    attr_accessor :project_name

    # SSH URL that you use to git clone, pull and push.
    # @return [String]
    attr_accessor :ssh_url

    # HTTP URL that you use to git clone, pull and push.
    # @return [String]
    attr_accessor :http_url

    # Details of the repository. Avoid entering confidential information.
    # @return [String]
    attr_accessor :description

    # The default branch of the repository.
    # @return [String]
    attr_accessor :default_branch

    # Type of repository:
    # Mirrored - Repository created by mirroring an existing repository.
    # Hosted - Repository created and hosted using OCI DevOps code repository.
    #
    # @return [String]
    attr_reader :repository_type

    # @return [OCI::Devops::Models::MirrorRepositoryConfig]
    attr_accessor :mirror_repository_config

    # The time the repository was created. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # The time the repository was updated. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the repository.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecyle_details

    # The count of the branches present in the repository.
    # @return [Integer]
    attr_accessor :branch_count

    # The count of the commits present in the repository.
    # @return [Integer]
    attr_accessor :commit_count

    # The size of the repository in bytes.
    # @return [Integer]
    attr_accessor :size_in_bytes

    # Trigger build events supported for this repository:
    # Push - Build is triggered when a push event occurs.
    # Commit updates - Build is triggered when new commits are mirrored into a repository.
    #
    # @return [Array<String>]
    attr_reader :trigger_build_events

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.  See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"bar-key\": \"value\"}`
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'namespace': :'namespace',
        'project_id': :'projectId',
        'project_name': :'projectName',
        'ssh_url': :'sshUrl',
        'http_url': :'httpUrl',
        'description': :'description',
        'default_branch': :'defaultBranch',
        'repository_type': :'repositoryType',
        'mirror_repository_config': :'mirrorRepositoryConfig',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecyle_details': :'lifecyleDetails',
        'branch_count': :'branchCount',
        'commit_count': :'commitCount',
        'size_in_bytes': :'sizeInBytes',
        'trigger_build_events': :'triggerBuildEvents',
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
        'namespace': :'String',
        'project_id': :'String',
        'project_name': :'String',
        'ssh_url': :'String',
        'http_url': :'String',
        'description': :'String',
        'default_branch': :'String',
        'repository_type': :'String',
        'mirror_repository_config': :'OCI::Devops::Models::MirrorRepositoryConfig',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecyle_details': :'String',
        'branch_count': :'Integer',
        'commit_count': :'Integer',
        'size_in_bytes': :'Integer',
        'trigger_build_events': :'Array<String>',
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
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [String] :project_name The value to assign to the {#project_name} property
    # @option attributes [String] :ssh_url The value to assign to the {#ssh_url} property
    # @option attributes [String] :http_url The value to assign to the {#http_url} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :default_branch The value to assign to the {#default_branch} property
    # @option attributes [String] :repository_type The value to assign to the {#repository_type} property
    # @option attributes [OCI::Devops::Models::MirrorRepositoryConfig] :mirror_repository_config The value to assign to the {#mirror_repository_config} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecyle_details The value to assign to the {#lifecyle_details} property
    # @option attributes [Integer] :branch_count The value to assign to the {#branch_count} property
    # @option attributes [Integer] :commit_count The value to assign to the {#commit_count} property
    # @option attributes [Integer] :size_in_bytes The value to assign to the {#size_in_bytes} property
    # @option attributes [Array<String>] :trigger_build_events The value to assign to the {#trigger_build_events} property
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

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.project_name = attributes[:'projectName'] if attributes[:'projectName']

      raise 'You cannot provide both :projectName and :project_name' if attributes.key?(:'projectName') && attributes.key?(:'project_name')

      self.project_name = attributes[:'project_name'] if attributes[:'project_name']

      self.ssh_url = attributes[:'sshUrl'] if attributes[:'sshUrl']

      raise 'You cannot provide both :sshUrl and :ssh_url' if attributes.key?(:'sshUrl') && attributes.key?(:'ssh_url')

      self.ssh_url = attributes[:'ssh_url'] if attributes[:'ssh_url']

      self.http_url = attributes[:'httpUrl'] if attributes[:'httpUrl']

      raise 'You cannot provide both :httpUrl and :http_url' if attributes.key?(:'httpUrl') && attributes.key?(:'http_url')

      self.http_url = attributes[:'http_url'] if attributes[:'http_url']

      self.description = attributes[:'description'] if attributes[:'description']

      self.default_branch = attributes[:'defaultBranch'] if attributes[:'defaultBranch']

      raise 'You cannot provide both :defaultBranch and :default_branch' if attributes.key?(:'defaultBranch') && attributes.key?(:'default_branch')

      self.default_branch = attributes[:'default_branch'] if attributes[:'default_branch']

      self.repository_type = attributes[:'repositoryType'] if attributes[:'repositoryType']
      self.repository_type = "HOSTED" if repository_type.nil? && !attributes.key?(:'repositoryType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :repositoryType and :repository_type' if attributes.key?(:'repositoryType') && attributes.key?(:'repository_type')

      self.repository_type = attributes[:'repository_type'] if attributes[:'repository_type']
      self.repository_type = "HOSTED" if repository_type.nil? && !attributes.key?(:'repositoryType') && !attributes.key?(:'repository_type') # rubocop:disable Style/StringLiterals

      self.mirror_repository_config = attributes[:'mirrorRepositoryConfig'] if attributes[:'mirrorRepositoryConfig']

      raise 'You cannot provide both :mirrorRepositoryConfig and :mirror_repository_config' if attributes.key?(:'mirrorRepositoryConfig') && attributes.key?(:'mirror_repository_config')

      self.mirror_repository_config = attributes[:'mirror_repository_config'] if attributes[:'mirror_repository_config']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecyle_details = attributes[:'lifecyleDetails'] if attributes[:'lifecyleDetails']

      raise 'You cannot provide both :lifecyleDetails and :lifecyle_details' if attributes.key?(:'lifecyleDetails') && attributes.key?(:'lifecyle_details')

      self.lifecyle_details = attributes[:'lifecyle_details'] if attributes[:'lifecyle_details']

      self.branch_count = attributes[:'branchCount'] if attributes[:'branchCount']

      raise 'You cannot provide both :branchCount and :branch_count' if attributes.key?(:'branchCount') && attributes.key?(:'branch_count')

      self.branch_count = attributes[:'branch_count'] if attributes[:'branch_count']

      self.commit_count = attributes[:'commitCount'] if attributes[:'commitCount']

      raise 'You cannot provide both :commitCount and :commit_count' if attributes.key?(:'commitCount') && attributes.key?(:'commit_count')

      self.commit_count = attributes[:'commit_count'] if attributes[:'commit_count']

      self.size_in_bytes = attributes[:'sizeInBytes'] if attributes[:'sizeInBytes']

      raise 'You cannot provide both :sizeInBytes and :size_in_bytes' if attributes.key?(:'sizeInBytes') && attributes.key?(:'size_in_bytes')

      self.size_in_bytes = attributes[:'size_in_bytes'] if attributes[:'size_in_bytes']

      self.trigger_build_events = attributes[:'triggerBuildEvents'] if attributes[:'triggerBuildEvents']

      raise 'You cannot provide both :triggerBuildEvents and :trigger_build_events' if attributes.key?(:'triggerBuildEvents') && attributes.key?(:'trigger_build_events')

      self.trigger_build_events = attributes[:'trigger_build_events'] if attributes[:'trigger_build_events']

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
    # @param [Object] repository_type Object to be assigned
    def repository_type=(repository_type)
      # rubocop:disable Style/ConditionalAssignment
      if repository_type && !REPOSITORY_TYPE_ENUM.include?(repository_type)
        OCI.logger.debug("Unknown value for 'repository_type' [" + repository_type + "]. Mapping to 'REPOSITORY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @repository_type = REPOSITORY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @repository_type = repository_type
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
    # @param [Object] trigger_build_events Object to be assigned
    def trigger_build_events=(trigger_build_events)
      # rubocop:disable Style/ConditionalAssignment
      if trigger_build_events.nil?
        @trigger_build_events = nil
      else
        @trigger_build_events =
          trigger_build_events.collect do |item|
            if TRIGGER_BUILD_EVENTS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'trigger_build_events' [#{item}]. Mapping to 'TRIGGER_BUILD_EVENTS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              TRIGGER_BUILD_EVENTS_UNKNOWN_ENUM_VALUE
            end
          end
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
        namespace == other.namespace &&
        project_id == other.project_id &&
        project_name == other.project_name &&
        ssh_url == other.ssh_url &&
        http_url == other.http_url &&
        description == other.description &&
        default_branch == other.default_branch &&
        repository_type == other.repository_type &&
        mirror_repository_config == other.mirror_repository_config &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecyle_details == other.lifecyle_details &&
        branch_count == other.branch_count &&
        commit_count == other.commit_count &&
        size_in_bytes == other.size_in_bytes &&
        trigger_build_events == other.trigger_build_events &&
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
      [id, name, compartment_id, namespace, project_id, project_name, ssh_url, http_url, description, default_branch, repository_type, mirror_repository_config, time_created, time_updated, lifecycle_state, lifecyle_details, branch_count, commit_count, size_in_bytes, trigger_build_events, freeform_tags, defined_tags, system_tags].hash
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
