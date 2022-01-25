# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about a new Deployment.
  #
  class GoldenGate::Models::CreateDeploymentDetails
    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_OGG = 'OGG'.freeze
    ].freeze

    # **[Required]** An object's Display Name.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The Oracle license model that applies to a Deployment.
    #
    # @return [String]
    attr_reader :license_model

    # Metadata about this specific object.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment being referenced.
    #
    # @return [String]
    attr_accessor :compartment_id

    # A simple key-value pair that is applied without any predefined name, type, or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Tags defined for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup being referenced.
    #
    # @return [String]
    attr_accessor :deployment_backup_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet being referenced.
    #
    # @return [String]
    attr_accessor :subnet_id

    # A three-label Fully Qualified Domain Name (FQDN) for a resource.
    #
    # @return [String]
    attr_accessor :fqdn

    # An array of [Network Security Group](https://docs.cloud.oracle.com/Content/Network/Concepts/networksecuritygroups.htm) OCIDs used to define network access for a deployment.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # True if this object is publicly available.
    #
    # @return [BOOLEAN]
    attr_accessor :is_public

    # **[Required]** The Minimum number of OCPUs to be made available for this Deployment.
    #
    # @return [Integer]
    attr_accessor :cpu_core_count

    # **[Required]** Indicates if auto scaling is enabled for the Deployment's CPU core count.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # **[Required]** The type of deployment, the value determines the exact 'type' of service executed in the Deployment. NOTE: Use of the value OGG is maintained for backward compatibility purposes.  Its use is discouraged
    #       in favor of the equivalent DATABASE_ORACLE value.
    #
    # @return [String]
    attr_reader :deployment_type

    # @return [OCI::GoldenGate::Models::CreateOggDeploymentDetails]
    attr_accessor :ogg_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'license_model': :'licenseModel',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'deployment_backup_id': :'deploymentBackupId',
        'subnet_id': :'subnetId',
        'fqdn': :'fqdn',
        'nsg_ids': :'nsgIds',
        'is_public': :'isPublic',
        'cpu_core_count': :'cpuCoreCount',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'deployment_type': :'deploymentType',
        'ogg_data': :'oggData'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'license_model': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'deployment_backup_id': :'String',
        'subnet_id': :'String',
        'fqdn': :'String',
        'nsg_ids': :'Array<String>',
        'is_public': :'BOOLEAN',
        'cpu_core_count': :'Integer',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'deployment_type': :'String',
        'ogg_data': :'OCI::GoldenGate::Models::CreateOggDeploymentDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :deployment_backup_id The value to assign to the {#deployment_backup_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :fqdn The value to assign to the {#fqdn} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [BOOLEAN] :is_public The value to assign to the {#is_public} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [String] :deployment_type The value to assign to the {#deployment_type} property
    # @option attributes [OCI::GoldenGate::Models::CreateOggDeploymentDetails] :ogg_data The value to assign to the {#ogg_data} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.deployment_backup_id = attributes[:'deploymentBackupId'] if attributes[:'deploymentBackupId']

      raise 'You cannot provide both :deploymentBackupId and :deployment_backup_id' if attributes.key?(:'deploymentBackupId') && attributes.key?(:'deployment_backup_id')

      self.deployment_backup_id = attributes[:'deployment_backup_id'] if attributes[:'deployment_backup_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.fqdn = attributes[:'fqdn'] if attributes[:'fqdn']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.is_public = attributes[:'isPublic'] unless attributes[:'isPublic'].nil?

      raise 'You cannot provide both :isPublic and :is_public' if attributes.key?(:'isPublic') && attributes.key?(:'is_public')

      self.is_public = attributes[:'is_public'] unless attributes[:'is_public'].nil?

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?

      self.deployment_type = attributes[:'deploymentType'] if attributes[:'deploymentType']

      raise 'You cannot provide both :deploymentType and :deployment_type' if attributes.key?(:'deploymentType') && attributes.key?(:'deployment_type')

      self.deployment_type = attributes[:'deployment_type'] if attributes[:'deployment_type']

      self.ogg_data = attributes[:'oggData'] if attributes[:'oggData']

      raise 'You cannot provide both :oggData and :ogg_data' if attributes.key?(:'oggData') && attributes.key?(:'ogg_data')

      self.ogg_data = attributes[:'ogg_data'] if attributes[:'ogg_data']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)

      @license_model = license_model
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_type Object to be assigned
    def deployment_type=(deployment_type)
      raise "Invalid value for 'deployment_type': this must be one of the values in DEPLOYMENT_TYPE_ENUM." if deployment_type && !DEPLOYMENT_TYPE_ENUM.include?(deployment_type)

      @deployment_type = deployment_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        license_model == other.license_model &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        deployment_backup_id == other.deployment_backup_id &&
        subnet_id == other.subnet_id &&
        fqdn == other.fqdn &&
        nsg_ids == other.nsg_ids &&
        is_public == other.is_public &&
        cpu_core_count == other.cpu_core_count &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        deployment_type == other.deployment_type &&
        ogg_data == other.ogg_data
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
      [display_name, license_model, description, compartment_id, freeform_tags, defined_tags, deployment_backup_id, subnet_id, fqdn, nsg_ids, is_public, cpu_core_count, is_auto_scaling_enabled, deployment_type, ogg_data].hash
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
