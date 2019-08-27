# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # TransferJob model.
  class Dts::Models::TransferJob
    DEVICE_TYPE_ENUM = [
      DEVICE_TYPE_DISK = 'DISK'.freeze,
      DEVICE_TYPE_APPLIANCE = 'APPLIANCE'.freeze,
      DEVICE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_INITIATED = 'INITIATED'.freeze,
      LIFECYCLE_STATE_PREPARING = 'PREPARING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_CLOSED = 'CLOSED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # This attribute is required.
    # @return [String]
    attr_accessor :id

    # This attribute is required.
    # @return [String]
    attr_accessor :compartment_id

    # This attribute is required.
    # @return [String]
    attr_accessor :upload_bucket_name

    # This attribute is required.
    # @return [String]
    attr_accessor :display_name

    # @return [String]
    attr_accessor :label

    # @return [DateTime]
    attr_accessor :creation_time

    # This attribute is required.
    # @return [String]
    attr_reader :device_type

    # @return [String]
    attr_reader :lifecycle_state

    # Transfer Appliance labels associated with this transfer Job
    # @return [Array<String>]
    attr_accessor :attached_transfer_appliance_labels

    # Transfer Package labels associated with this transfer Job
    # @return [Array<String>]
    attr_accessor :attached_transfer_package_labels

    # Transfer Device labels associated with this transfer Job
    # @return [Array<String>]
    attr_accessor :attached_transfer_device_labels

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"foo-value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'upload_bucket_name': :'uploadBucketName',
        'display_name': :'displayName',
        'label': :'label',
        'creation_time': :'creationTime',
        'device_type': :'deviceType',
        'lifecycle_state': :'lifecycleState',
        'attached_transfer_appliance_labels': :'attachedTransferApplianceLabels',
        'attached_transfer_package_labels': :'attachedTransferPackageLabels',
        'attached_transfer_device_labels': :'attachedTransferDeviceLabels',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'upload_bucket_name': :'String',
        'display_name': :'String',
        'label': :'String',
        'creation_time': :'DateTime',
        'device_type': :'String',
        'lifecycle_state': :'String',
        'attached_transfer_appliance_labels': :'Array<String>',
        'attached_transfer_package_labels': :'Array<String>',
        'attached_transfer_device_labels': :'Array<String>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :upload_bucket_name The value to assign to the {#upload_bucket_name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :label The value to assign to the {#label} property
    # @option attributes [DateTime] :creation_time The value to assign to the {#creation_time} property
    # @option attributes [String] :device_type The value to assign to the {#device_type} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Array<String>] :attached_transfer_appliance_labels The value to assign to the {#attached_transfer_appliance_labels} property
    # @option attributes [Array<String>] :attached_transfer_package_labels The value to assign to the {#attached_transfer_package_labels} property
    # @option attributes [Array<String>] :attached_transfer_device_labels The value to assign to the {#attached_transfer_device_labels} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.upload_bucket_name = attributes[:'uploadBucketName'] if attributes[:'uploadBucketName']

      raise 'You cannot provide both :uploadBucketName and :upload_bucket_name' if attributes.key?(:'uploadBucketName') && attributes.key?(:'upload_bucket_name')

      self.upload_bucket_name = attributes[:'upload_bucket_name'] if attributes[:'upload_bucket_name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.label = attributes[:'label'] if attributes[:'label']

      self.creation_time = attributes[:'creationTime'] if attributes[:'creationTime']

      raise 'You cannot provide both :creationTime and :creation_time' if attributes.key?(:'creationTime') && attributes.key?(:'creation_time')

      self.creation_time = attributes[:'creation_time'] if attributes[:'creation_time']

      self.device_type = attributes[:'deviceType'] if attributes[:'deviceType']

      raise 'You cannot provide both :deviceType and :device_type' if attributes.key?(:'deviceType') && attributes.key?(:'device_type')

      self.device_type = attributes[:'device_type'] if attributes[:'device_type']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.attached_transfer_appliance_labels = attributes[:'attachedTransferApplianceLabels'] if attributes[:'attachedTransferApplianceLabels']

      raise 'You cannot provide both :attachedTransferApplianceLabels and :attached_transfer_appliance_labels' if attributes.key?(:'attachedTransferApplianceLabels') && attributes.key?(:'attached_transfer_appliance_labels')

      self.attached_transfer_appliance_labels = attributes[:'attached_transfer_appliance_labels'] if attributes[:'attached_transfer_appliance_labels']

      self.attached_transfer_package_labels = attributes[:'attachedTransferPackageLabels'] if attributes[:'attachedTransferPackageLabels']

      raise 'You cannot provide both :attachedTransferPackageLabels and :attached_transfer_package_labels' if attributes.key?(:'attachedTransferPackageLabels') && attributes.key?(:'attached_transfer_package_labels')

      self.attached_transfer_package_labels = attributes[:'attached_transfer_package_labels'] if attributes[:'attached_transfer_package_labels']

      self.attached_transfer_device_labels = attributes[:'attachedTransferDeviceLabels'] if attributes[:'attachedTransferDeviceLabels']

      raise 'You cannot provide both :attachedTransferDeviceLabels and :attached_transfer_device_labels' if attributes.key?(:'attachedTransferDeviceLabels') && attributes.key?(:'attached_transfer_device_labels')

      self.attached_transfer_device_labels = attributes[:'attached_transfer_device_labels'] if attributes[:'attached_transfer_device_labels']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] device_type Object to be assigned
    def device_type=(device_type)
      # rubocop:disable Style/ConditionalAssignment
      if device_type && !DEVICE_TYPE_ENUM.include?(device_type)
        OCI.logger.debug("Unknown value for 'device_type' [" + device_type + "]. Mapping to 'DEVICE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @device_type = DEVICE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @device_type = device_type
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
        upload_bucket_name == other.upload_bucket_name &&
        display_name == other.display_name &&
        label == other.label &&
        creation_time == other.creation_time &&
        device_type == other.device_type &&
        lifecycle_state == other.lifecycle_state &&
        attached_transfer_appliance_labels == other.attached_transfer_appliance_labels &&
        attached_transfer_package_labels == other.attached_transfer_package_labels &&
        attached_transfer_device_labels == other.attached_transfer_device_labels &&
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
      [id, compartment_id, upload_bucket_name, display_name, label, creation_time, device_type, lifecycle_state, attached_transfer_appliance_labels, attached_transfer_package_labels, attached_transfer_device_labels, freeform_tags, defined_tags].hash
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
