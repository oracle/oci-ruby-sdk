# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # TransferDeviceSummary model.
  class Dts::Models::TransferDeviceSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PREPARING = 'PREPARING'.freeze,
      LIFECYCLE_STATE_READY = 'READY'.freeze,
      LIFECYCLE_STATE_PACKAGED = 'PACKAGED'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_PROCESSING = 'PROCESSING'.freeze,
      LIFECYCLE_STATE_COMPLETE = 'COMPLETE'.freeze,
      LIFECYCLE_STATE_MISSING = 'MISSING'.freeze,
      LIFECYCLE_STATE_ERROR = 'ERROR'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_CANCELLED = 'CANCELLED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # @return [String]
    attr_accessor :serial_number

    # @return [String]
    attr_accessor :iscsi_iqn

    # @return [String]
    attr_accessor :label

    # @return [String]
    attr_reader :lifecycle_state

    # @return [String]
    attr_accessor :attached_transfer_package_label

    # @return [DateTime]
    attr_accessor :creation_time

    # @return [String]
    attr_accessor :upload_status_log_uri

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'serial_number': :'serialNumber',
        'iscsi_iqn': :'iscsiIQN',
        'label': :'label',
        'lifecycle_state': :'lifecycleState',
        'attached_transfer_package_label': :'attachedTransferPackageLabel',
        'creation_time': :'creationTime',
        'upload_status_log_uri': :'uploadStatusLogUri'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'serial_number': :'String',
        'iscsi_iqn': :'String',
        'label': :'String',
        'lifecycle_state': :'String',
        'attached_transfer_package_label': :'String',
        'creation_time': :'DateTime',
        'upload_status_log_uri': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [String] :iscsi_iqn The value to assign to the {#iscsi_iqn} property
    # @option attributes [String] :label The value to assign to the {#label} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :attached_transfer_package_label The value to assign to the {#attached_transfer_package_label} property
    # @option attributes [DateTime] :creation_time The value to assign to the {#creation_time} property
    # @option attributes [String] :upload_status_log_uri The value to assign to the {#upload_status_log_uri} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.iscsi_iqn = attributes[:'iscsiIQN'] if attributes[:'iscsiIQN']

      raise 'You cannot provide both :iscsiIQN and :iscsi_iqn' if attributes.key?(:'iscsiIQN') && attributes.key?(:'iscsi_iqn')

      self.iscsi_iqn = attributes[:'iscsi_iqn'] if attributes[:'iscsi_iqn']

      self.label = attributes[:'label'] if attributes[:'label']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.attached_transfer_package_label = attributes[:'attachedTransferPackageLabel'] if attributes[:'attachedTransferPackageLabel']

      raise 'You cannot provide both :attachedTransferPackageLabel and :attached_transfer_package_label' if attributes.key?(:'attachedTransferPackageLabel') && attributes.key?(:'attached_transfer_package_label')

      self.attached_transfer_package_label = attributes[:'attached_transfer_package_label'] if attributes[:'attached_transfer_package_label']

      self.creation_time = attributes[:'creationTime'] if attributes[:'creationTime']

      raise 'You cannot provide both :creationTime and :creation_time' if attributes.key?(:'creationTime') && attributes.key?(:'creation_time')

      self.creation_time = attributes[:'creation_time'] if attributes[:'creation_time']

      self.upload_status_log_uri = attributes[:'uploadStatusLogUri'] if attributes[:'uploadStatusLogUri']

      raise 'You cannot provide both :uploadStatusLogUri and :upload_status_log_uri' if attributes.key?(:'uploadStatusLogUri') && attributes.key?(:'upload_status_log_uri')

      self.upload_status_log_uri = attributes[:'upload_status_log_uri'] if attributes[:'upload_status_log_uri']
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
        serial_number == other.serial_number &&
        iscsi_iqn == other.iscsi_iqn &&
        label == other.label &&
        lifecycle_state == other.lifecycle_state &&
        attached_transfer_package_label == other.attached_transfer_package_label &&
        creation_time == other.creation_time &&
        upload_status_log_uri == other.upload_status_log_uri
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
      [serial_number, iscsi_iqn, label, lifecycle_state, attached_transfer_package_label, creation_time, upload_status_log_uri].hash
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
