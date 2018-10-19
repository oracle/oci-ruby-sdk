# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The properties that define extra options for a cluster.
  class ContainerEngine::Models::ClusterCreateOptions # rubocop:disable Metrics/LineLength
    # The OCIDs of the subnets used for Kubernetes services load balancers.
    # @return [Array<String>]
    attr_accessor :service_lb_subnet_ids

    # Network configuration for Kubernetes.
    # @return [OCI::ContainerEngine::Models::KubernetesNetworkConfig]
    attr_accessor :kubernetes_network_config

    # Configurable cluster add-ons
    # @return [OCI::ContainerEngine::Models::AddOnOptions]
    attr_accessor :add_ons

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'service_lb_subnet_ids': :'serviceLbSubnetIds',
        'kubernetes_network_config': :'kubernetesNetworkConfig',
        'add_ons': :'addOns'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'service_lb_subnet_ids': :'Array<String>',
        'kubernetes_network_config': :'OCI::ContainerEngine::Models::KubernetesNetworkConfig',
        'add_ons': :'OCI::ContainerEngine::Models::AddOnOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :service_lb_subnet_ids The value to assign to the {#service_lb_subnet_ids} property
    # @option attributes [OCI::ContainerEngine::Models::KubernetesNetworkConfig] :kubernetes_network_config The value to assign to the {#kubernetes_network_config} property
    # @option attributes [OCI::ContainerEngine::Models::AddOnOptions] :add_ons The value to assign to the {#add_ons} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.service_lb_subnet_ids = attributes[:'serviceLbSubnetIds'] if attributes[:'serviceLbSubnetIds']

      raise 'You cannot provide both :serviceLbSubnetIds and :service_lb_subnet_ids' if attributes.key?(:'serviceLbSubnetIds') && attributes.key?(:'service_lb_subnet_ids')

      self.service_lb_subnet_ids = attributes[:'service_lb_subnet_ids'] if attributes[:'service_lb_subnet_ids']

      self.kubernetes_network_config = attributes[:'kubernetesNetworkConfig'] if attributes[:'kubernetesNetworkConfig']

      raise 'You cannot provide both :kubernetesNetworkConfig and :kubernetes_network_config' if attributes.key?(:'kubernetesNetworkConfig') && attributes.key?(:'kubernetes_network_config')

      self.kubernetes_network_config = attributes[:'kubernetes_network_config'] if attributes[:'kubernetes_network_config']

      self.add_ons = attributes[:'addOns'] if attributes[:'addOns']

      raise 'You cannot provide both :addOns and :add_ons' if attributes.key?(:'addOns') && attributes.key?(:'add_ons')

      self.add_ons = attributes[:'add_ons'] if attributes[:'add_ons']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        service_lb_subnet_ids == other.service_lb_subnet_ids &&
        kubernetes_network_config == other.kubernetes_network_config &&
        add_ons == other.add_ons
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [service_lb_subnet_ids, kubernetes_network_config, add_ons].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
