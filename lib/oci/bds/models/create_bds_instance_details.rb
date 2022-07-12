# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the new cluster.
  class Bds::Models::CreateBdsInstanceDetails
    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Name of the Big Data Service cluster.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Version of the Hadoop distribution.
    # @return [String]
    attr_accessor :cluster_version

    # **[Required]** The SSH public key used to authenticate the cluster connection.
    # @return [String]
    attr_accessor :cluster_public_key

    # **[Required]** Base-64 encoded password for the cluster (and Cloudera Manager) admin user.
    # @return [String]
    attr_accessor :cluster_admin_password

    # **[Required]** Boolean flag specifying whether or not the cluster is highly available (HA).
    # @return [BOOLEAN]
    attr_accessor :is_high_availability

    # **[Required]** Boolean flag specifying whether or not the cluster should be set up as secure.
    # @return [BOOLEAN]
    attr_accessor :is_secure

    # @return [OCI::Bds::Models::NetworkConfig]
    attr_accessor :network_config

    # Pre-authenticated URL of the script in Object Store that is downloaded and executed.
    # @return [String]
    attr_accessor :bootstrap_script_url

    # **[Required]** The list of nodes in the Big Data Service cluster.
    # @return [Array<OCI::Bds::Models::CreateNodeDetails>]
    attr_accessor :nodes

    # The user-defined kerberos realm name.
    # @return [String]
    attr_accessor :kerberos_realm_name

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # Exists for cross-compatibility only. For example, `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For example, `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'cluster_version': :'clusterVersion',
        'cluster_public_key': :'clusterPublicKey',
        'cluster_admin_password': :'clusterAdminPassword',
        'is_high_availability': :'isHighAvailability',
        'is_secure': :'isSecure',
        'network_config': :'networkConfig',
        'bootstrap_script_url': :'bootstrapScriptUrl',
        'nodes': :'nodes',
        'kerberos_realm_name': :'kerberosRealmName',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'cluster_version': :'String',
        'cluster_public_key': :'String',
        'cluster_admin_password': :'String',
        'is_high_availability': :'BOOLEAN',
        'is_secure': :'BOOLEAN',
        'network_config': :'OCI::Bds::Models::NetworkConfig',
        'bootstrap_script_url': :'String',
        'nodes': :'Array<OCI::Bds::Models::CreateNodeDetails>',
        'kerberos_realm_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :cluster_version The value to assign to the {#cluster_version} property
    # @option attributes [String] :cluster_public_key The value to assign to the {#cluster_public_key} property
    # @option attributes [String] :cluster_admin_password The value to assign to the {#cluster_admin_password} property
    # @option attributes [BOOLEAN] :is_high_availability The value to assign to the {#is_high_availability} property
    # @option attributes [BOOLEAN] :is_secure The value to assign to the {#is_secure} property
    # @option attributes [OCI::Bds::Models::NetworkConfig] :network_config The value to assign to the {#network_config} property
    # @option attributes [String] :bootstrap_script_url The value to assign to the {#bootstrap_script_url} property
    # @option attributes [Array<OCI::Bds::Models::CreateNodeDetails>] :nodes The value to assign to the {#nodes} property
    # @option attributes [String] :kerberos_realm_name The value to assign to the {#kerberos_realm_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
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

      self.cluster_version = attributes[:'clusterVersion'] if attributes[:'clusterVersion']

      raise 'You cannot provide both :clusterVersion and :cluster_version' if attributes.key?(:'clusterVersion') && attributes.key?(:'cluster_version')

      self.cluster_version = attributes[:'cluster_version'] if attributes[:'cluster_version']

      self.cluster_public_key = attributes[:'clusterPublicKey'] if attributes[:'clusterPublicKey']

      raise 'You cannot provide both :clusterPublicKey and :cluster_public_key' if attributes.key?(:'clusterPublicKey') && attributes.key?(:'cluster_public_key')

      self.cluster_public_key = attributes[:'cluster_public_key'] if attributes[:'cluster_public_key']

      self.cluster_admin_password = attributes[:'clusterAdminPassword'] if attributes[:'clusterAdminPassword']

      raise 'You cannot provide both :clusterAdminPassword and :cluster_admin_password' if attributes.key?(:'clusterAdminPassword') && attributes.key?(:'cluster_admin_password')

      self.cluster_admin_password = attributes[:'cluster_admin_password'] if attributes[:'cluster_admin_password']

      self.is_high_availability = attributes[:'isHighAvailability'] unless attributes[:'isHighAvailability'].nil?
      self.is_high_availability = false if is_high_availability.nil? && !attributes.key?(:'isHighAvailability') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHighAvailability and :is_high_availability' if attributes.key?(:'isHighAvailability') && attributes.key?(:'is_high_availability')

      self.is_high_availability = attributes[:'is_high_availability'] unless attributes[:'is_high_availability'].nil?
      self.is_high_availability = false if is_high_availability.nil? && !attributes.key?(:'isHighAvailability') && !attributes.key?(:'is_high_availability') # rubocop:disable Style/StringLiterals

      self.is_secure = attributes[:'isSecure'] unless attributes[:'isSecure'].nil?
      self.is_secure = true if is_secure.nil? && !attributes.key?(:'isSecure') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSecure and :is_secure' if attributes.key?(:'isSecure') && attributes.key?(:'is_secure')

      self.is_secure = attributes[:'is_secure'] unless attributes[:'is_secure'].nil?
      self.is_secure = true if is_secure.nil? && !attributes.key?(:'isSecure') && !attributes.key?(:'is_secure') # rubocop:disable Style/StringLiterals

      self.network_config = attributes[:'networkConfig'] if attributes[:'networkConfig']

      raise 'You cannot provide both :networkConfig and :network_config' if attributes.key?(:'networkConfig') && attributes.key?(:'network_config')

      self.network_config = attributes[:'network_config'] if attributes[:'network_config']

      self.bootstrap_script_url = attributes[:'bootstrapScriptUrl'] if attributes[:'bootstrapScriptUrl']

      raise 'You cannot provide both :bootstrapScriptUrl and :bootstrap_script_url' if attributes.key?(:'bootstrapScriptUrl') && attributes.key?(:'bootstrap_script_url')

      self.bootstrap_script_url = attributes[:'bootstrap_script_url'] if attributes[:'bootstrap_script_url']

      self.nodes = attributes[:'nodes'] if attributes[:'nodes']

      self.kerberos_realm_name = attributes[:'kerberosRealmName'] if attributes[:'kerberosRealmName']

      raise 'You cannot provide both :kerberosRealmName and :kerberos_realm_name' if attributes.key?(:'kerberosRealmName') && attributes.key?(:'kerberos_realm_name')

      self.kerberos_realm_name = attributes[:'kerberos_realm_name'] if attributes[:'kerberos_realm_name']

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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        cluster_version == other.cluster_version &&
        cluster_public_key == other.cluster_public_key &&
        cluster_admin_password == other.cluster_admin_password &&
        is_high_availability == other.is_high_availability &&
        is_secure == other.is_secure &&
        network_config == other.network_config &&
        bootstrap_script_url == other.bootstrap_script_url &&
        nodes == other.nodes &&
        kerberos_realm_name == other.kerberos_realm_name &&
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
      [compartment_id, display_name, cluster_version, cluster_public_key, cluster_admin_password, is_high_availability, is_secure, network_config, bootstrap_script_url, nodes, kerberos_realm_name, freeform_tags, defined_tags].hash
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
