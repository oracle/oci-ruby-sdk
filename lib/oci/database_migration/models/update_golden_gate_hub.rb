# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about Oracle GoldenGate Microservices.
  #
  class DatabaseMigration::Models::UpdateGoldenGateHub
    # @return [OCI::DatabaseMigration::Models::UpdateAdminCredentials]
    attr_accessor :rest_admin_credentials

    # @return [OCI::DatabaseMigration::Models::UpdateAdminCredentials]
    attr_accessor :source_db_admin_credentials

    # @return [OCI::DatabaseMigration::Models::UpdateAdminCredentials]
    attr_accessor :source_container_db_admin_credentials

    # @return [OCI::DatabaseMigration::Models::UpdateAdminCredentials]
    attr_accessor :target_db_admin_credentials

    # Oracle GoldenGate hub's REST endpoint.
    # Refer to https://docs.oracle.com/en/middleware/goldengate/core/19.1/securing/network.html#GUID-A709DA55-111D-455E-8942-C9BDD1E38CAA
    #
    # @return [String]
    attr_accessor :url

    # Name of GoldenGate deployment to operate on source database
    #
    # @return [String]
    attr_accessor :source_microservices_deployment_name

    # Name of GoldenGate deployment to operate on target database
    #
    # @return [String]
    attr_accessor :target_microservices_deployment_name

    # OCID of GoldenGate compute instance. An empty value will remove the stored computeId.
    #
    # @return [String]
    attr_accessor :compute_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'rest_admin_credentials': :'restAdminCredentials',
        'source_db_admin_credentials': :'sourceDbAdminCredentials',
        'source_container_db_admin_credentials': :'sourceContainerDbAdminCredentials',
        'target_db_admin_credentials': :'targetDbAdminCredentials',
        'url': :'url',
        'source_microservices_deployment_name': :'sourceMicroservicesDeploymentName',
        'target_microservices_deployment_name': :'targetMicroservicesDeploymentName',
        'compute_id': :'computeId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'rest_admin_credentials': :'OCI::DatabaseMigration::Models::UpdateAdminCredentials',
        'source_db_admin_credentials': :'OCI::DatabaseMigration::Models::UpdateAdminCredentials',
        'source_container_db_admin_credentials': :'OCI::DatabaseMigration::Models::UpdateAdminCredentials',
        'target_db_admin_credentials': :'OCI::DatabaseMigration::Models::UpdateAdminCredentials',
        'url': :'String',
        'source_microservices_deployment_name': :'String',
        'target_microservices_deployment_name': :'String',
        'compute_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DatabaseMigration::Models::UpdateAdminCredentials] :rest_admin_credentials The value to assign to the {#rest_admin_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateAdminCredentials] :source_db_admin_credentials The value to assign to the {#source_db_admin_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateAdminCredentials] :source_container_db_admin_credentials The value to assign to the {#source_container_db_admin_credentials} property
    # @option attributes [OCI::DatabaseMigration::Models::UpdateAdminCredentials] :target_db_admin_credentials The value to assign to the {#target_db_admin_credentials} property
    # @option attributes [String] :url The value to assign to the {#url} property
    # @option attributes [String] :source_microservices_deployment_name The value to assign to the {#source_microservices_deployment_name} property
    # @option attributes [String] :target_microservices_deployment_name The value to assign to the {#target_microservices_deployment_name} property
    # @option attributes [String] :compute_id The value to assign to the {#compute_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.rest_admin_credentials = attributes[:'restAdminCredentials'] if attributes[:'restAdminCredentials']

      raise 'You cannot provide both :restAdminCredentials and :rest_admin_credentials' if attributes.key?(:'restAdminCredentials') && attributes.key?(:'rest_admin_credentials')

      self.rest_admin_credentials = attributes[:'rest_admin_credentials'] if attributes[:'rest_admin_credentials']

      self.source_db_admin_credentials = attributes[:'sourceDbAdminCredentials'] if attributes[:'sourceDbAdminCredentials']

      raise 'You cannot provide both :sourceDbAdminCredentials and :source_db_admin_credentials' if attributes.key?(:'sourceDbAdminCredentials') && attributes.key?(:'source_db_admin_credentials')

      self.source_db_admin_credentials = attributes[:'source_db_admin_credentials'] if attributes[:'source_db_admin_credentials']

      self.source_container_db_admin_credentials = attributes[:'sourceContainerDbAdminCredentials'] if attributes[:'sourceContainerDbAdminCredentials']

      raise 'You cannot provide both :sourceContainerDbAdminCredentials and :source_container_db_admin_credentials' if attributes.key?(:'sourceContainerDbAdminCredentials') && attributes.key?(:'source_container_db_admin_credentials')

      self.source_container_db_admin_credentials = attributes[:'source_container_db_admin_credentials'] if attributes[:'source_container_db_admin_credentials']

      self.target_db_admin_credentials = attributes[:'targetDbAdminCredentials'] if attributes[:'targetDbAdminCredentials']

      raise 'You cannot provide both :targetDbAdminCredentials and :target_db_admin_credentials' if attributes.key?(:'targetDbAdminCredentials') && attributes.key?(:'target_db_admin_credentials')

      self.target_db_admin_credentials = attributes[:'target_db_admin_credentials'] if attributes[:'target_db_admin_credentials']

      self.url = attributes[:'url'] if attributes[:'url']

      self.source_microservices_deployment_name = attributes[:'sourceMicroservicesDeploymentName'] if attributes[:'sourceMicroservicesDeploymentName']

      raise 'You cannot provide both :sourceMicroservicesDeploymentName and :source_microservices_deployment_name' if attributes.key?(:'sourceMicroservicesDeploymentName') && attributes.key?(:'source_microservices_deployment_name')

      self.source_microservices_deployment_name = attributes[:'source_microservices_deployment_name'] if attributes[:'source_microservices_deployment_name']

      self.target_microservices_deployment_name = attributes[:'targetMicroservicesDeploymentName'] if attributes[:'targetMicroservicesDeploymentName']

      raise 'You cannot provide both :targetMicroservicesDeploymentName and :target_microservices_deployment_name' if attributes.key?(:'targetMicroservicesDeploymentName') && attributes.key?(:'target_microservices_deployment_name')

      self.target_microservices_deployment_name = attributes[:'target_microservices_deployment_name'] if attributes[:'target_microservices_deployment_name']

      self.compute_id = attributes[:'computeId'] if attributes[:'computeId']

      raise 'You cannot provide both :computeId and :compute_id' if attributes.key?(:'computeId') && attributes.key?(:'compute_id')

      self.compute_id = attributes[:'compute_id'] if attributes[:'compute_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        rest_admin_credentials == other.rest_admin_credentials &&
        source_db_admin_credentials == other.source_db_admin_credentials &&
        source_container_db_admin_credentials == other.source_container_db_admin_credentials &&
        target_db_admin_credentials == other.target_db_admin_credentials &&
        url == other.url &&
        source_microservices_deployment_name == other.source_microservices_deployment_name &&
        target_microservices_deployment_name == other.target_microservices_deployment_name &&
        compute_id == other.compute_id
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
      [rest_admin_credentials, source_db_admin_credentials, source_container_db_admin_credentials, target_db_admin_credentials, url, source_microservices_deployment_name, target_microservices_deployment_name, compute_id].hash
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
