# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20211101
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the MediaAssetDistributionChannelAttachment.
  class MediaServices::Models::MediaAssetDistributionChannelAttachmentSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** OCID of associated media asset.
    # @return [String]
    attr_accessor :media_asset_id

    # Display name for the MediaAssetDistributionChannelAttachment. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** OCID of associated Distribution Channel.
    # @return [String]
    attr_accessor :distribution_channel_id

    # **[Required]** Version number of the attachment.
    # @return [Integer]
    attr_accessor :version

    # **[Required]** Lifecycle state of the attachment.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The identifier for the metadata.
    # @return [String]
    attr_accessor :metadata_ref

    # The ingest MediaWorkflowJob ID that created this attachment.
    # @return [String]
    attr_accessor :media_workflow_job_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'media_asset_id': :'mediaAssetId',
        'display_name': :'displayName',
        'distribution_channel_id': :'distributionChannelId',
        'version': :'version',
        'lifecycle_state': :'lifecycleState',
        'metadata_ref': :'metadataRef',
        'media_workflow_job_id': :'mediaWorkflowJobId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'media_asset_id': :'String',
        'display_name': :'String',
        'distribution_channel_id': :'String',
        'version': :'Integer',
        'lifecycle_state': :'String',
        'metadata_ref': :'String',
        'media_workflow_job_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :media_asset_id The value to assign to the {#media_asset_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :distribution_channel_id The value to assign to the {#distribution_channel_id} property
    # @option attributes [Integer] :version The value to assign to the {#version} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :metadata_ref The value to assign to the {#metadata_ref} property
    # @option attributes [String] :media_workflow_job_id The value to assign to the {#media_workflow_job_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.media_asset_id = attributes[:'mediaAssetId'] if attributes[:'mediaAssetId']

      raise 'You cannot provide both :mediaAssetId and :media_asset_id' if attributes.key?(:'mediaAssetId') && attributes.key?(:'media_asset_id')

      self.media_asset_id = attributes[:'media_asset_id'] if attributes[:'media_asset_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.distribution_channel_id = attributes[:'distributionChannelId'] if attributes[:'distributionChannelId']

      raise 'You cannot provide both :distributionChannelId and :distribution_channel_id' if attributes.key?(:'distributionChannelId') && attributes.key?(:'distribution_channel_id')

      self.distribution_channel_id = attributes[:'distribution_channel_id'] if attributes[:'distribution_channel_id']

      self.version = attributes[:'version'] if attributes[:'version']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.metadata_ref = attributes[:'metadataRef'] if attributes[:'metadataRef']

      raise 'You cannot provide both :metadataRef and :metadata_ref' if attributes.key?(:'metadataRef') && attributes.key?(:'metadata_ref')

      self.metadata_ref = attributes[:'metadata_ref'] if attributes[:'metadata_ref']

      self.media_workflow_job_id = attributes[:'mediaWorkflowJobId'] if attributes[:'mediaWorkflowJobId']

      raise 'You cannot provide both :mediaWorkflowJobId and :media_workflow_job_id' if attributes.key?(:'mediaWorkflowJobId') && attributes.key?(:'media_workflow_job_id')

      self.media_workflow_job_id = attributes[:'media_workflow_job_id'] if attributes[:'media_workflow_job_id']
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
        media_asset_id == other.media_asset_id &&
        display_name == other.display_name &&
        distribution_channel_id == other.distribution_channel_id &&
        version == other.version &&
        lifecycle_state == other.lifecycle_state &&
        metadata_ref == other.metadata_ref &&
        media_workflow_job_id == other.media_workflow_job_id
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
      [media_asset_id, display_name, distribution_channel_id, version, lifecycle_state, metadata_ref, media_workflow_job_id].hash
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
