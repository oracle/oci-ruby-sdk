# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for creating a load balancer.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class LoadBalancer::Models::CreateLoadBalancerDetails
    IP_MODE_ENUM = [
      IP_MODE_IPV4 = 'IPV4'.freeze,
      IP_MODE_IPV6 = 'IPV6'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which to create the load balancer.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A user-friendly name. It does not have to be unique, and it is changeable.
    # Avoid entering confidential information.
    #
    # Example: `example_load_balancer`
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** A template that determines the total pre-provisioned bandwidth (ingress plus egress).
    # To get a list of available shapes, use the {#list_shapes list_shapes}
    # operation.
    #
    # Example: `100Mbps`
    #
    # @return [String]
    attr_accessor :shape_name

    # Whether the load balancer has a VCN-local (private) IP address.
    #
    # If \"true\", the service assigns a private IP address to the load balancer.
    #
    # If \"false\", the service assigns a public IP address to the load balancer.
    #
    # A public load balancer is accessible from the internet, depending on your VCN's
    # [security list rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securitylists.htm). For more information about public and
    # private load balancers, see [How Load Balancing Works](https://docs.cloud.oracle.com/Content/Balance/Concepts/balanceoverview.htm#how-load-balancing-works).
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_private

    # Whether the load balancer has an IPv4 or IPv6 IP address.
    #
    # If \"IPV4\", the service assigns an IPv4 address and the load balancer supports IPv4 traffic.
    #
    # If \"IPV6\", the service assigns an IPv6 address and the load balancer supports IPv6 traffic.
    #
    # Example: \"ipMode\":\"IPV6\"
    #
    # @return [String]
    attr_reader :ip_mode

    # @return [Hash<String, OCI::LoadBalancer::Models::ListenerDetails>]
    attr_accessor :listeners

    # @return [Hash<String, OCI::LoadBalancer::Models::HostnameDetails>]
    attr_accessor :hostnames

    # @return [Hash<String, OCI::LoadBalancer::Models::BackendSetDetails>]
    attr_accessor :backend_sets

    # The array of NSG [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) to be used by this Load Balancer.
    #
    # @return [Array<String>]
    attr_accessor :network_security_group_ids

    # **[Required]** An array of subnet [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [Array<String>]
    attr_accessor :subnet_ids

    # @return [Hash<String, OCI::LoadBalancer::Models::CertificateDetails>]
    attr_accessor :certificates

    # @return [Hash<String, OCI::LoadBalancer::Models::PathRouteSetDetails>]
    attr_accessor :path_route_sets

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # @return [Hash<String, OCI::LoadBalancer::Models::RuleSetDetails>]
    attr_accessor :rule_sets

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'shape_name': :'shapeName',
        'is_private': :'isPrivate',
        'ip_mode': :'ipMode',
        'listeners': :'listeners',
        'hostnames': :'hostnames',
        'backend_sets': :'backendSets',
        'network_security_group_ids': :'networkSecurityGroupIds',
        'subnet_ids': :'subnetIds',
        'certificates': :'certificates',
        'path_route_sets': :'pathRouteSets',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'rule_sets': :'ruleSets'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'shape_name': :'String',
        'is_private': :'BOOLEAN',
        'ip_mode': :'String',
        'listeners': :'Hash<String, OCI::LoadBalancer::Models::ListenerDetails>',
        'hostnames': :'Hash<String, OCI::LoadBalancer::Models::HostnameDetails>',
        'backend_sets': :'Hash<String, OCI::LoadBalancer::Models::BackendSetDetails>',
        'network_security_group_ids': :'Array<String>',
        'subnet_ids': :'Array<String>',
        'certificates': :'Hash<String, OCI::LoadBalancer::Models::CertificateDetails>',
        'path_route_sets': :'Hash<String, OCI::LoadBalancer::Models::PathRouteSetDetails>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'rule_sets': :'Hash<String, OCI::LoadBalancer::Models::RuleSetDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [BOOLEAN] :is_private The value to assign to the {#is_private} property
    # @option attributes [String] :ip_mode The value to assign to the {#ip_mode} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::ListenerDetails>] :listeners The value to assign to the {#listeners} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::HostnameDetails>] :hostnames The value to assign to the {#hostnames} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::BackendSetDetails>] :backend_sets The value to assign to the {#backend_sets} property
    # @option attributes [Array<String>] :network_security_group_ids The value to assign to the {#network_security_group_ids} property
    # @option attributes [Array<String>] :subnet_ids The value to assign to the {#subnet_ids} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::CertificateDetails>] :certificates The value to assign to the {#certificates} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::PathRouteSetDetails>] :path_route_sets The value to assign to the {#path_route_sets} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, OCI::LoadBalancer::Models::RuleSetDetails>] :rule_sets The value to assign to the {#rule_sets} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.is_private = attributes[:'isPrivate'] unless attributes[:'isPrivate'].nil?
      self.is_private = false if is_private.nil? && !attributes.key?(:'isPrivate') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPrivate and :is_private' if attributes.key?(:'isPrivate') && attributes.key?(:'is_private')

      self.is_private = attributes[:'is_private'] unless attributes[:'is_private'].nil?
      self.is_private = false if is_private.nil? && !attributes.key?(:'isPrivate') && !attributes.key?(:'is_private') # rubocop:disable Style/StringLiterals

      self.ip_mode = attributes[:'ipMode'] if attributes[:'ipMode']
      self.ip_mode = "IPV4" if ip_mode.nil? && !attributes.key?(:'ipMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :ipMode and :ip_mode' if attributes.key?(:'ipMode') && attributes.key?(:'ip_mode')

      self.ip_mode = attributes[:'ip_mode'] if attributes[:'ip_mode']
      self.ip_mode = "IPV4" if ip_mode.nil? && !attributes.key?(:'ipMode') && !attributes.key?(:'ip_mode') # rubocop:disable Style/StringLiterals

      self.listeners = attributes[:'listeners'] if attributes[:'listeners']

      self.hostnames = attributes[:'hostnames'] if attributes[:'hostnames']

      self.backend_sets = attributes[:'backendSets'] if attributes[:'backendSets']

      raise 'You cannot provide both :backendSets and :backend_sets' if attributes.key?(:'backendSets') && attributes.key?(:'backend_sets')

      self.backend_sets = attributes[:'backend_sets'] if attributes[:'backend_sets']

      self.network_security_group_ids = attributes[:'networkSecurityGroupIds'] if attributes[:'networkSecurityGroupIds']

      raise 'You cannot provide both :networkSecurityGroupIds and :network_security_group_ids' if attributes.key?(:'networkSecurityGroupIds') && attributes.key?(:'network_security_group_ids')

      self.network_security_group_ids = attributes[:'network_security_group_ids'] if attributes[:'network_security_group_ids']

      self.subnet_ids = attributes[:'subnetIds'] if attributes[:'subnetIds']

      raise 'You cannot provide both :subnetIds and :subnet_ids' if attributes.key?(:'subnetIds') && attributes.key?(:'subnet_ids')

      self.subnet_ids = attributes[:'subnet_ids'] if attributes[:'subnet_ids']

      self.certificates = attributes[:'certificates'] if attributes[:'certificates']

      self.path_route_sets = attributes[:'pathRouteSets'] if attributes[:'pathRouteSets']

      raise 'You cannot provide both :pathRouteSets and :path_route_sets' if attributes.key?(:'pathRouteSets') && attributes.key?(:'path_route_sets')

      self.path_route_sets = attributes[:'path_route_sets'] if attributes[:'path_route_sets']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.rule_sets = attributes[:'ruleSets'] if attributes[:'ruleSets']

      raise 'You cannot provide both :ruleSets and :rule_sets' if attributes.key?(:'ruleSets') && attributes.key?(:'rule_sets')

      self.rule_sets = attributes[:'rule_sets'] if attributes[:'rule_sets']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ip_mode Object to be assigned
    def ip_mode=(ip_mode)
      raise "Invalid value for 'ip_mode': this must be one of the values in IP_MODE_ENUM." if ip_mode && !IP_MODE_ENUM.include?(ip_mode)

      @ip_mode = ip_mode
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        shape_name == other.shape_name &&
        is_private == other.is_private &&
        ip_mode == other.ip_mode &&
        listeners == other.listeners &&
        hostnames == other.hostnames &&
        backend_sets == other.backend_sets &&
        network_security_group_ids == other.network_security_group_ids &&
        subnet_ids == other.subnet_ids &&
        certificates == other.certificates &&
        path_route_sets == other.path_route_sets &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        rule_sets == other.rule_sets
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
      [compartment_id, display_name, shape_name, is_private, ip_mode, listeners, hostnames, backend_sets, network_security_group_ids, subnet_ids, certificates, path_route_sets, freeform_tags, defined_tags, rule_sets].hash
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
