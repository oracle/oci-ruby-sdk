# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'host_insight_summary'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of an EM-managed external host insight resource.
  class Opsi::Models::EmManagedExternalHostInsightSummary < Opsi::Models::HostInsightSummary
    PLATFORM_TYPE_ENUM = [
      PLATFORM_TYPE_LINUX = 'LINUX'.freeze,
      PLATFORM_TYPE_SOLARIS = 'SOLARIS'.freeze,
      PLATFORM_TYPE_SUNOS = 'SUNOS'.freeze,
      PLATFORM_TYPE_ZLINUX = 'ZLINUX'.freeze,
      PLATFORM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Enterprise Manager Unique Identifier
    # @return [String]
    attr_accessor :enterprise_manager_identifier

    # **[Required]** Enterprise Manager Entity Name
    # @return [String]
    attr_accessor :enterprise_manager_entity_name

    # **[Required]** Enterprise Manager Entity Type
    # @return [String]
    attr_accessor :enterprise_manager_entity_type

    # **[Required]** Enterprise Manager Entity Unique Identifier
    # @return [String]
    attr_accessor :enterprise_manager_entity_identifier

    # Enterprise Manager Entity Display Name
    # @return [String]
    attr_accessor :enterprise_manager_entity_display_name

    # **[Required]** OPSI Enterprise Manager Bridge OCID
    # @return [String]
    attr_accessor :enterprise_manager_bridge_id

    # Platform type.
    # Supported platformType(s) for MACS-managed external host insight: [LINUX].
    # Supported platformType(s) for EM-managed external host insight: [LINUX, SOLARIS, SUNOS, ZLINUX].
    #
    # @return [String]
    attr_reader :platform_type

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the Exadata insight.
    # @return [String]
    attr_accessor :exadata_insight_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'entitySource',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'host_name': :'hostName',
        'host_display_name': :'hostDisplayName',
        'host_type': :'hostType',
        'processor_count': :'processorCount',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'opsi_private_endpoint_id': :'opsiPrivateEndpointId',
        'status': :'status',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'enterprise_manager_identifier': :'enterpriseManagerIdentifier',
        'enterprise_manager_entity_name': :'enterpriseManagerEntityName',
        'enterprise_manager_entity_type': :'enterpriseManagerEntityType',
        'enterprise_manager_entity_identifier': :'enterpriseManagerEntityIdentifier',
        'enterprise_manager_entity_display_name': :'enterpriseManagerEntityDisplayName',
        'enterprise_manager_bridge_id': :'enterpriseManagerBridgeId',
        'platform_type': :'platformType',
        'exadata_insight_id': :'exadataInsightId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'host_name': :'String',
        'host_display_name': :'String',
        'host_type': :'String',
        'processor_count': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'opsi_private_endpoint_id': :'String',
        'status': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'enterprise_manager_identifier': :'String',
        'enterprise_manager_entity_name': :'String',
        'enterprise_manager_entity_type': :'String',
        'enterprise_manager_entity_identifier': :'String',
        'enterprise_manager_entity_display_name': :'String',
        'enterprise_manager_bridge_id': :'String',
        'platform_type': :'String',
        'exadata_insight_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Opsi::Models::HostInsightSummary#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Opsi::Models::HostInsightSummary#compartment_id #compartment_id} proprety
    # @option attributes [String] :host_name The value to assign to the {OCI::Opsi::Models::HostInsightSummary#host_name #host_name} proprety
    # @option attributes [String] :host_display_name The value to assign to the {OCI::Opsi::Models::HostInsightSummary#host_display_name #host_display_name} proprety
    # @option attributes [String] :host_type The value to assign to the {OCI::Opsi::Models::HostInsightSummary#host_type #host_type} proprety
    # @option attributes [Integer] :processor_count The value to assign to the {OCI::Opsi::Models::HostInsightSummary#processor_count #processor_count} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Opsi::Models::HostInsightSummary#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Opsi::Models::HostInsightSummary#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::Opsi::Models::HostInsightSummary#system_tags #system_tags} proprety
    # @option attributes [String] :opsi_private_endpoint_id The value to assign to the {OCI::Opsi::Models::HostInsightSummary#opsi_private_endpoint_id #opsi_private_endpoint_id} proprety
    # @option attributes [String] :status The value to assign to the {OCI::Opsi::Models::HostInsightSummary#status #status} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Opsi::Models::HostInsightSummary#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Opsi::Models::HostInsightSummary#time_updated #time_updated} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Opsi::Models::HostInsightSummary#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::Opsi::Models::HostInsightSummary#lifecycle_details #lifecycle_details} proprety
    # @option attributes [String] :enterprise_manager_identifier The value to assign to the {#enterprise_manager_identifier} property
    # @option attributes [String] :enterprise_manager_entity_name The value to assign to the {#enterprise_manager_entity_name} property
    # @option attributes [String] :enterprise_manager_entity_type The value to assign to the {#enterprise_manager_entity_type} property
    # @option attributes [String] :enterprise_manager_entity_identifier The value to assign to the {#enterprise_manager_entity_identifier} property
    # @option attributes [String] :enterprise_manager_entity_display_name The value to assign to the {#enterprise_manager_entity_display_name} property
    # @option attributes [String] :enterprise_manager_bridge_id The value to assign to the {#enterprise_manager_bridge_id} property
    # @option attributes [String] :platform_type The value to assign to the {#platform_type} property
    # @option attributes [String] :exadata_insight_id The value to assign to the {#exadata_insight_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entitySource'] = 'EM_MANAGED_EXTERNAL_HOST'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.enterprise_manager_identifier = attributes[:'enterpriseManagerIdentifier'] if attributes[:'enterpriseManagerIdentifier']

      raise 'You cannot provide both :enterpriseManagerIdentifier and :enterprise_manager_identifier' if attributes.key?(:'enterpriseManagerIdentifier') && attributes.key?(:'enterprise_manager_identifier')

      self.enterprise_manager_identifier = attributes[:'enterprise_manager_identifier'] if attributes[:'enterprise_manager_identifier']

      self.enterprise_manager_entity_name = attributes[:'enterpriseManagerEntityName'] if attributes[:'enterpriseManagerEntityName']

      raise 'You cannot provide both :enterpriseManagerEntityName and :enterprise_manager_entity_name' if attributes.key?(:'enterpriseManagerEntityName') && attributes.key?(:'enterprise_manager_entity_name')

      self.enterprise_manager_entity_name = attributes[:'enterprise_manager_entity_name'] if attributes[:'enterprise_manager_entity_name']

      self.enterprise_manager_entity_type = attributes[:'enterpriseManagerEntityType'] if attributes[:'enterpriseManagerEntityType']

      raise 'You cannot provide both :enterpriseManagerEntityType and :enterprise_manager_entity_type' if attributes.key?(:'enterpriseManagerEntityType') && attributes.key?(:'enterprise_manager_entity_type')

      self.enterprise_manager_entity_type = attributes[:'enterprise_manager_entity_type'] if attributes[:'enterprise_manager_entity_type']

      self.enterprise_manager_entity_identifier = attributes[:'enterpriseManagerEntityIdentifier'] if attributes[:'enterpriseManagerEntityIdentifier']

      raise 'You cannot provide both :enterpriseManagerEntityIdentifier and :enterprise_manager_entity_identifier' if attributes.key?(:'enterpriseManagerEntityIdentifier') && attributes.key?(:'enterprise_manager_entity_identifier')

      self.enterprise_manager_entity_identifier = attributes[:'enterprise_manager_entity_identifier'] if attributes[:'enterprise_manager_entity_identifier']

      self.enterprise_manager_entity_display_name = attributes[:'enterpriseManagerEntityDisplayName'] if attributes[:'enterpriseManagerEntityDisplayName']

      raise 'You cannot provide both :enterpriseManagerEntityDisplayName and :enterprise_manager_entity_display_name' if attributes.key?(:'enterpriseManagerEntityDisplayName') && attributes.key?(:'enterprise_manager_entity_display_name')

      self.enterprise_manager_entity_display_name = attributes[:'enterprise_manager_entity_display_name'] if attributes[:'enterprise_manager_entity_display_name']

      self.enterprise_manager_bridge_id = attributes[:'enterpriseManagerBridgeId'] if attributes[:'enterpriseManagerBridgeId']

      raise 'You cannot provide both :enterpriseManagerBridgeId and :enterprise_manager_bridge_id' if attributes.key?(:'enterpriseManagerBridgeId') && attributes.key?(:'enterprise_manager_bridge_id')

      self.enterprise_manager_bridge_id = attributes[:'enterprise_manager_bridge_id'] if attributes[:'enterprise_manager_bridge_id']

      self.platform_type = attributes[:'platformType'] if attributes[:'platformType']

      raise 'You cannot provide both :platformType and :platform_type' if attributes.key?(:'platformType') && attributes.key?(:'platform_type')

      self.platform_type = attributes[:'platform_type'] if attributes[:'platform_type']

      self.exadata_insight_id = attributes[:'exadataInsightId'] if attributes[:'exadataInsightId']

      raise 'You cannot provide both :exadataInsightId and :exadata_insight_id' if attributes.key?(:'exadataInsightId') && attributes.key?(:'exadata_insight_id')

      self.exadata_insight_id = attributes[:'exadata_insight_id'] if attributes[:'exadata_insight_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] platform_type Object to be assigned
    def platform_type=(platform_type)
      # rubocop:disable Style/ConditionalAssignment
      if platform_type && !PLATFORM_TYPE_ENUM.include?(platform_type)
        OCI.logger.debug("Unknown value for 'platform_type' [" + platform_type + "]. Mapping to 'PLATFORM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @platform_type = PLATFORM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @platform_type = platform_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_source == other.entity_source &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        host_name == other.host_name &&
        host_display_name == other.host_display_name &&
        host_type == other.host_type &&
        processor_count == other.processor_count &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        opsi_private_endpoint_id == other.opsi_private_endpoint_id &&
        status == other.status &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        enterprise_manager_identifier == other.enterprise_manager_identifier &&
        enterprise_manager_entity_name == other.enterprise_manager_entity_name &&
        enterprise_manager_entity_type == other.enterprise_manager_entity_type &&
        enterprise_manager_entity_identifier == other.enterprise_manager_entity_identifier &&
        enterprise_manager_entity_display_name == other.enterprise_manager_entity_display_name &&
        enterprise_manager_bridge_id == other.enterprise_manager_bridge_id &&
        platform_type == other.platform_type &&
        exadata_insight_id == other.exadata_insight_id
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
      [entity_source, id, compartment_id, host_name, host_display_name, host_type, processor_count, freeform_tags, defined_tags, system_tags, opsi_private_endpoint_id, status, time_created, time_updated, lifecycle_state, lifecycle_details, enterprise_manager_identifier, enterprise_manager_entity_name, enterprise_manager_entity_type, enterprise_manager_entity_identifier, enterprise_manager_entity_display_name, enterprise_manager_bridge_id, platform_type, exadata_insight_id].hash
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
