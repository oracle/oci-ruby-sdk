# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The DiscoveryJob details.
  class StackMonitoring::Models::DiscoveryJob
    DISCOVERY_TYPE_ENUM = [
      DISCOVERY_TYPE_ADD = 'ADD'.freeze,
      DISCOVERY_TYPE_ADD_WITH_RETRY = 'ADD_WITH_RETRY'.freeze,
      DISCOVERY_TYPE_REFRESH = 'REFRESH'.freeze,
      DISCOVERY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_SUCCESS = 'SUCCESS'.freeze,
      STATUS_FAILURE = 'FAILURE'.freeze,
      STATUS_INPROGRESS = 'INPROGRESS'.freeze,
      STATUS_INACTIVE = 'INACTIVE'.freeze,
      STATUS_CREATED = 'CREATED'.freeze,
      STATUS_DELETED = 'DELETED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of Discovery job
    # @return [String]
    attr_accessor :id

    # The OCID of the Compartment
    # @return [String]
    attr_accessor :compartment_id

    # Add option submits new discovery Job. Add with retry option to re-submit failed discovery job. Refresh option refreshes the existing discovered resources.
    #
    # @return [String]
    attr_reader :discovery_type

    # Specifies the status of the discovery job
    # @return [String]
    attr_reader :status

    # The short summary of the status of the discovery job
    # @return [String]
    attr_accessor :status_message

    # The OCID of Tenant
    # @return [String]
    attr_accessor :tenant_id

    # The OCID of user in which the job is submitted
    # @return [String]
    attr_accessor :user_id

    # Client who submits discovery job.
    # @return [String]
    attr_accessor :discovery_client

    # @return [OCI::StackMonitoring::Models::DiscoveryDetails]
    attr_accessor :discovery_details

    # The time the discovery Job was updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the DiscoveryJob Resource.
    # @return [String]
    attr_reader :lifecycle_state

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'discovery_type': :'discoveryType',
        'status': :'status',
        'status_message': :'statusMessage',
        'tenant_id': :'tenantId',
        'user_id': :'userId',
        'discovery_client': :'discoveryClient',
        'discovery_details': :'discoveryDetails',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
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
        'compartment_id': :'String',
        'discovery_type': :'String',
        'status': :'String',
        'status_message': :'String',
        'tenant_id': :'String',
        'user_id': :'String',
        'discovery_client': :'String',
        'discovery_details': :'OCI::StackMonitoring::Models::DiscoveryDetails',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :discovery_type The value to assign to the {#discovery_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :status_message The value to assign to the {#status_message} property
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :user_id The value to assign to the {#user_id} property
    # @option attributes [String] :discovery_client The value to assign to the {#discovery_client} property
    # @option attributes [OCI::StackMonitoring::Models::DiscoveryDetails] :discovery_details The value to assign to the {#discovery_details} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.discovery_type = attributes[:'discoveryType'] if attributes[:'discoveryType']
      self.discovery_type = "ADD" if discovery_type.nil? && !attributes.key?(:'discoveryType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :discoveryType and :discovery_type' if attributes.key?(:'discoveryType') && attributes.key?(:'discovery_type')

      self.discovery_type = attributes[:'discovery_type'] if attributes[:'discovery_type']
      self.discovery_type = "ADD" if discovery_type.nil? && !attributes.key?(:'discoveryType') && !attributes.key?(:'discovery_type') # rubocop:disable Style/StringLiterals

      self.status = attributes[:'status'] if attributes[:'status']

      self.status_message = attributes[:'statusMessage'] if attributes[:'statusMessage']

      raise 'You cannot provide both :statusMessage and :status_message' if attributes.key?(:'statusMessage') && attributes.key?(:'status_message')

      self.status_message = attributes[:'status_message'] if attributes[:'status_message']

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.user_id = attributes[:'userId'] if attributes[:'userId']

      raise 'You cannot provide both :userId and :user_id' if attributes.key?(:'userId') && attributes.key?(:'user_id')

      self.user_id = attributes[:'user_id'] if attributes[:'user_id']

      self.discovery_client = attributes[:'discoveryClient'] if attributes[:'discoveryClient']

      raise 'You cannot provide both :discoveryClient and :discovery_client' if attributes.key?(:'discoveryClient') && attributes.key?(:'discovery_client')

      self.discovery_client = attributes[:'discovery_client'] if attributes[:'discovery_client']

      self.discovery_details = attributes[:'discoveryDetails'] if attributes[:'discoveryDetails']

      raise 'You cannot provide both :discoveryDetails and :discovery_details' if attributes.key?(:'discoveryDetails') && attributes.key?(:'discovery_details')

      self.discovery_details = attributes[:'discovery_details'] if attributes[:'discovery_details']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

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
    # @param [Object] discovery_type Object to be assigned
    def discovery_type=(discovery_type)
      # rubocop:disable Style/ConditionalAssignment
      if discovery_type && !DISCOVERY_TYPE_ENUM.include?(discovery_type)
        OCI.logger.debug("Unknown value for 'discovery_type' [" + discovery_type + "]. Mapping to 'DISCOVERY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @discovery_type = DISCOVERY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @discovery_type = discovery_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
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
        id == other.id &&
        compartment_id == other.compartment_id &&
        discovery_type == other.discovery_type &&
        status == other.status &&
        status_message == other.status_message &&
        tenant_id == other.tenant_id &&
        user_id == other.user_id &&
        discovery_client == other.discovery_client &&
        discovery_details == other.discovery_details &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
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
      [id, compartment_id, discovery_type, status, status_message, tenant_id, user_id, discovery_client, discovery_details, time_updated, lifecycle_state, freeform_tags, defined_tags, system_tags].hash
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