# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A Kubernetes cluster. Avoid entering confidential information.
  class ContainerEngine::Models::Cluster
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the cluster.
    # @return [String]
    attr_accessor :id

    # The name of the cluster.
    # @return [String]
    attr_accessor :name

    # The OCID of the compartment in which the cluster exists.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the virtual cloud network (VCN) in which the cluster exists.
    # @return [String]
    attr_accessor :vcn_id

    # The version of Kubernetes running on the cluster masters.
    # @return [String]
    attr_accessor :kubernetes_version

    # Optional attributes for the cluster.
    # @return [OCI::ContainerEngine::Models::ClusterCreateOptions]
    attr_accessor :options

    # Metadata about the cluster.
    # @return [OCI::ContainerEngine::Models::ClusterMetadata]
    attr_accessor :metadata

    # The state of the cluster masters.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the state of the cluster masters.
    # @return [String]
    attr_accessor :lifecycle_details

    # Endpoints served up by the cluster masters.
    # @return [OCI::ContainerEngine::Models::ClusterEndpoints]
    attr_accessor :endpoints

    # Available Kubernetes versions to which the clusters masters may be upgraded.
    # @return [Array<String>]
    attr_accessor :available_kubernetes_upgrades

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'vcn_id': :'vcnId',
        'kubernetes_version': :'kubernetesVersion',
        'options': :'options',
        'metadata': :'metadata',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'endpoints': :'endpoints',
        'available_kubernetes_upgrades': :'availableKubernetesUpgrades'
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
        'vcn_id': :'String',
        'kubernetes_version': :'String',
        'options': :'OCI::ContainerEngine::Models::ClusterCreateOptions',
        'metadata': :'OCI::ContainerEngine::Models::ClusterMetadata',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'endpoints': :'OCI::ContainerEngine::Models::ClusterEndpoints',
        'available_kubernetes_upgrades': :'Array<String>'
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
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    # @option attributes [String] :kubernetes_version The value to assign to the {#kubernetes_version} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterCreateOptions] :options The value to assign to the {#options} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterMetadata] :metadata The value to assign to the {#metadata} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterEndpoints] :endpoints The value to assign to the {#endpoints} property
    # @option attributes [Array<String>] :available_kubernetes_upgrades The value to assign to the {#available_kubernetes_upgrades} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']

      self.kubernetes_version = attributes[:'kubernetesVersion'] if attributes[:'kubernetesVersion']

      raise 'You cannot provide both :kubernetesVersion and :kubernetes_version' if attributes.key?(:'kubernetesVersion') && attributes.key?(:'kubernetes_version')

      self.kubernetes_version = attributes[:'kubernetes_version'] if attributes[:'kubernetes_version']

      self.options = attributes[:'options'] if attributes[:'options']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.endpoints = attributes[:'endpoints'] if attributes[:'endpoints']

      self.available_kubernetes_upgrades = attributes[:'availableKubernetesUpgrades'] if attributes[:'availableKubernetesUpgrades']

      raise 'You cannot provide both :availableKubernetesUpgrades and :available_kubernetes_upgrades' if attributes.key?(:'availableKubernetesUpgrades') && attributes.key?(:'available_kubernetes_upgrades')

      self.available_kubernetes_upgrades = attributes[:'available_kubernetes_upgrades'] if attributes[:'available_kubernetes_upgrades']
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
        vcn_id == other.vcn_id &&
        kubernetes_version == other.kubernetes_version &&
        options == other.options &&
        metadata == other.metadata &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        endpoints == other.endpoints &&
        available_kubernetes_upgrades == other.available_kubernetes_upgrades
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
      [id, name, compartment_id, vcn_id, kubernetes_version, options, metadata, lifecycle_state, lifecycle_details, endpoints, available_kubernetes_upgrades].hash
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
