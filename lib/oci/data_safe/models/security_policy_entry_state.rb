# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20181201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The resource represents the state of a specific entry type deployment on a target.
  #
  class DataSafe::Models::SecurityPolicyEntryState
    DEPLOYMENT_STATUS_ENUM = [
      DEPLOYMENT_STATUS_CREATED = 'CREATED'.freeze,
      DEPLOYMENT_STATUS_MODIFIED = 'MODIFIED'.freeze,
      DEPLOYMENT_STATUS_CONFLICT = 'CONFLICT'.freeze,
      DEPLOYMENT_STATUS_UNAUTHORIZED = 'UNAUTHORIZED'.freeze,
      DEPLOYMENT_STATUS_DELETED = 'DELETED'.freeze,
      DEPLOYMENT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique id of the security policy entry state.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the security policy entry type associated.
    # @return [String]
    attr_accessor :security_policy_entry_id

    # The OCID of the security policy deployment associated.
    # @return [String]
    attr_accessor :security_policy_deployment_id

    # **[Required]** The current deployment status of the security policy deployment and the security policy entry associated.
    # @return [String]
    attr_reader :deployment_status

    # @return [OCI::DataSafe::Models::EntryDetails]
    attr_accessor :entry_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'security_policy_entry_id': :'securityPolicyEntryId',
        'security_policy_deployment_id': :'securityPolicyDeploymentId',
        'deployment_status': :'deploymentStatus',
        'entry_details': :'entryDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'security_policy_entry_id': :'String',
        'security_policy_deployment_id': :'String',
        'deployment_status': :'String',
        'entry_details': :'OCI::DataSafe::Models::EntryDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :security_policy_entry_id The value to assign to the {#security_policy_entry_id} property
    # @option attributes [String] :security_policy_deployment_id The value to assign to the {#security_policy_deployment_id} property
    # @option attributes [String] :deployment_status The value to assign to the {#deployment_status} property
    # @option attributes [OCI::DataSafe::Models::EntryDetails] :entry_details The value to assign to the {#entry_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.security_policy_entry_id = attributes[:'securityPolicyEntryId'] if attributes[:'securityPolicyEntryId']

      raise 'You cannot provide both :securityPolicyEntryId and :security_policy_entry_id' if attributes.key?(:'securityPolicyEntryId') && attributes.key?(:'security_policy_entry_id')

      self.security_policy_entry_id = attributes[:'security_policy_entry_id'] if attributes[:'security_policy_entry_id']

      self.security_policy_deployment_id = attributes[:'securityPolicyDeploymentId'] if attributes[:'securityPolicyDeploymentId']

      raise 'You cannot provide both :securityPolicyDeploymentId and :security_policy_deployment_id' if attributes.key?(:'securityPolicyDeploymentId') && attributes.key?(:'security_policy_deployment_id')

      self.security_policy_deployment_id = attributes[:'security_policy_deployment_id'] if attributes[:'security_policy_deployment_id']

      self.deployment_status = attributes[:'deploymentStatus'] if attributes[:'deploymentStatus']

      raise 'You cannot provide both :deploymentStatus and :deployment_status' if attributes.key?(:'deploymentStatus') && attributes.key?(:'deployment_status')

      self.deployment_status = attributes[:'deployment_status'] if attributes[:'deployment_status']

      self.entry_details = attributes[:'entryDetails'] if attributes[:'entryDetails']

      raise 'You cannot provide both :entryDetails and :entry_details' if attributes.key?(:'entryDetails') && attributes.key?(:'entry_details')

      self.entry_details = attributes[:'entry_details'] if attributes[:'entry_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_status Object to be assigned
    def deployment_status=(deployment_status)
      # rubocop:disable Style/ConditionalAssignment
      if deployment_status && !DEPLOYMENT_STATUS_ENUM.include?(deployment_status)
        OCI.logger.debug("Unknown value for 'deployment_status' [" + deployment_status + "]. Mapping to 'DEPLOYMENT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @deployment_status = DEPLOYMENT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @deployment_status = deployment_status
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
        security_policy_entry_id == other.security_policy_entry_id &&
        security_policy_deployment_id == other.security_policy_deployment_id &&
        deployment_status == other.deployment_status &&
        entry_details == other.entry_details
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
      [id, security_policy_entry_id, security_policy_deployment_id, deployment_status, entry_details].hash
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
