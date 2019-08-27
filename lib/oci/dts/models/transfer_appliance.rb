# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # TransferAppliance model.
  class Dts::Models::TransferAppliance
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_REQUESTED = 'REQUESTED'.freeze,
      LIFECYCLE_STATE_ORACLE_PREPARING = 'ORACLE_PREPARING'.freeze,
      LIFECYCLE_STATE_SHIPPING = 'SHIPPING'.freeze,
      LIFECYCLE_STATE_DELIVERED = 'DELIVERED'.freeze,
      LIFECYCLE_STATE_PREPARING = 'PREPARING'.freeze,
      LIFECYCLE_STATE_RETURN_SHIPPED = 'RETURN_SHIPPED'.freeze,
      LIFECYCLE_STATE_RETURN_SHIPPED_CANCELLED = 'RETURN_SHIPPED_CANCELLED'.freeze,
      LIFECYCLE_STATE_ORACLE_RECEIVED = 'ORACLE_RECEIVED'.freeze,
      LIFECYCLE_STATE_ORACLE_RECEIVED_CANCELLED = 'ORACLE_RECEIVED_CANCELLED'.freeze,
      LIFECYCLE_STATE_PROCESSING = 'PROCESSING'.freeze,
      LIFECYCLE_STATE_COMPLETE = 'COMPLETE'.freeze,
      LIFECYCLE_STATE_CUSTOMER_NEVER_RECEIVED = 'CUSTOMER_NEVER_RECEIVED'.freeze,
      LIFECYCLE_STATE_ORACLE_NEVER_RECEIVED = 'ORACLE_NEVER_RECEIVED'.freeze,
      LIFECYCLE_STATE_CUSTOMER_LOST = 'CUSTOMER_LOST'.freeze,
      LIFECYCLE_STATE_CANCELLED = 'CANCELLED'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_REJECTED = 'REJECTED'.freeze,
      LIFECYCLE_STATE_ERROR = 'ERROR'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique alpha-numeric identifier for a transfer appliance auto generated during create.
    # @return [String]
    attr_accessor :label

    # @return [String]
    attr_reader :lifecycle_state

    # @return [String]
    attr_accessor :transfer_job_id

    # @return [String]
    attr_accessor :serial_number

    # @return [DateTime]
    attr_accessor :creation_time

    # @return [DateTime]
    attr_accessor :customer_received_time

    # @return [DateTime]
    attr_accessor :customer_returned_time

    # @return [DateTime]
    attr_accessor :next_billing_time

    # @return [String]
    attr_accessor :delivery_security_tie_id

    # @return [String]
    attr_accessor :return_security_tie_id

    # @return [String]
    attr_accessor :appliance_delivery_tracking_number

    # @return [String]
    attr_accessor :appliance_return_delivery_tracking_number

    # @return [String]
    attr_accessor :appliance_delivery_vendor

    # @return [OCI::Dts::Models::ShippingAddress]
    attr_accessor :customer_shipping_address

    # @return [String]
    attr_accessor :upload_status_log_uri

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'label': :'label',
        'lifecycle_state': :'lifecycleState',
        'transfer_job_id': :'transferJobId',
        'serial_number': :'serialNumber',
        'creation_time': :'creationTime',
        'customer_received_time': :'customerReceivedTime',
        'customer_returned_time': :'customerReturnedTime',
        'next_billing_time': :'nextBillingTime',
        'delivery_security_tie_id': :'deliverySecurityTieId',
        'return_security_tie_id': :'returnSecurityTieId',
        'appliance_delivery_tracking_number': :'applianceDeliveryTrackingNumber',
        'appliance_return_delivery_tracking_number': :'applianceReturnDeliveryTrackingNumber',
        'appliance_delivery_vendor': :'applianceDeliveryVendor',
        'customer_shipping_address': :'customerShippingAddress',
        'upload_status_log_uri': :'uploadStatusLogUri'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'label': :'String',
        'lifecycle_state': :'String',
        'transfer_job_id': :'String',
        'serial_number': :'String',
        'creation_time': :'DateTime',
        'customer_received_time': :'DateTime',
        'customer_returned_time': :'DateTime',
        'next_billing_time': :'DateTime',
        'delivery_security_tie_id': :'String',
        'return_security_tie_id': :'String',
        'appliance_delivery_tracking_number': :'String',
        'appliance_return_delivery_tracking_number': :'String',
        'appliance_delivery_vendor': :'String',
        'customer_shipping_address': :'OCI::Dts::Models::ShippingAddress',
        'upload_status_log_uri': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :label The value to assign to the {#label} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :transfer_job_id The value to assign to the {#transfer_job_id} property
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [DateTime] :creation_time The value to assign to the {#creation_time} property
    # @option attributes [DateTime] :customer_received_time The value to assign to the {#customer_received_time} property
    # @option attributes [DateTime] :customer_returned_time The value to assign to the {#customer_returned_time} property
    # @option attributes [DateTime] :next_billing_time The value to assign to the {#next_billing_time} property
    # @option attributes [String] :delivery_security_tie_id The value to assign to the {#delivery_security_tie_id} property
    # @option attributes [String] :return_security_tie_id The value to assign to the {#return_security_tie_id} property
    # @option attributes [String] :appliance_delivery_tracking_number The value to assign to the {#appliance_delivery_tracking_number} property
    # @option attributes [String] :appliance_return_delivery_tracking_number The value to assign to the {#appliance_return_delivery_tracking_number} property
    # @option attributes [String] :appliance_delivery_vendor The value to assign to the {#appliance_delivery_vendor} property
    # @option attributes [OCI::Dts::Models::ShippingAddress] :customer_shipping_address The value to assign to the {#customer_shipping_address} property
    # @option attributes [String] :upload_status_log_uri The value to assign to the {#upload_status_log_uri} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.label = attributes[:'label'] if attributes[:'label']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.transfer_job_id = attributes[:'transferJobId'] if attributes[:'transferJobId']

      raise 'You cannot provide both :transferJobId and :transfer_job_id' if attributes.key?(:'transferJobId') && attributes.key?(:'transfer_job_id')

      self.transfer_job_id = attributes[:'transfer_job_id'] if attributes[:'transfer_job_id']

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.creation_time = attributes[:'creationTime'] if attributes[:'creationTime']

      raise 'You cannot provide both :creationTime and :creation_time' if attributes.key?(:'creationTime') && attributes.key?(:'creation_time')

      self.creation_time = attributes[:'creation_time'] if attributes[:'creation_time']

      self.customer_received_time = attributes[:'customerReceivedTime'] if attributes[:'customerReceivedTime']

      raise 'You cannot provide both :customerReceivedTime and :customer_received_time' if attributes.key?(:'customerReceivedTime') && attributes.key?(:'customer_received_time')

      self.customer_received_time = attributes[:'customer_received_time'] if attributes[:'customer_received_time']

      self.customer_returned_time = attributes[:'customerReturnedTime'] if attributes[:'customerReturnedTime']

      raise 'You cannot provide both :customerReturnedTime and :customer_returned_time' if attributes.key?(:'customerReturnedTime') && attributes.key?(:'customer_returned_time')

      self.customer_returned_time = attributes[:'customer_returned_time'] if attributes[:'customer_returned_time']

      self.next_billing_time = attributes[:'nextBillingTime'] if attributes[:'nextBillingTime']

      raise 'You cannot provide both :nextBillingTime and :next_billing_time' if attributes.key?(:'nextBillingTime') && attributes.key?(:'next_billing_time')

      self.next_billing_time = attributes[:'next_billing_time'] if attributes[:'next_billing_time']

      self.delivery_security_tie_id = attributes[:'deliverySecurityTieId'] if attributes[:'deliverySecurityTieId']

      raise 'You cannot provide both :deliverySecurityTieId and :delivery_security_tie_id' if attributes.key?(:'deliverySecurityTieId') && attributes.key?(:'delivery_security_tie_id')

      self.delivery_security_tie_id = attributes[:'delivery_security_tie_id'] if attributes[:'delivery_security_tie_id']

      self.return_security_tie_id = attributes[:'returnSecurityTieId'] if attributes[:'returnSecurityTieId']

      raise 'You cannot provide both :returnSecurityTieId and :return_security_tie_id' if attributes.key?(:'returnSecurityTieId') && attributes.key?(:'return_security_tie_id')

      self.return_security_tie_id = attributes[:'return_security_tie_id'] if attributes[:'return_security_tie_id']

      self.appliance_delivery_tracking_number = attributes[:'applianceDeliveryTrackingNumber'] if attributes[:'applianceDeliveryTrackingNumber']

      raise 'You cannot provide both :applianceDeliveryTrackingNumber and :appliance_delivery_tracking_number' if attributes.key?(:'applianceDeliveryTrackingNumber') && attributes.key?(:'appliance_delivery_tracking_number')

      self.appliance_delivery_tracking_number = attributes[:'appliance_delivery_tracking_number'] if attributes[:'appliance_delivery_tracking_number']

      self.appliance_return_delivery_tracking_number = attributes[:'applianceReturnDeliveryTrackingNumber'] if attributes[:'applianceReturnDeliveryTrackingNumber']

      raise 'You cannot provide both :applianceReturnDeliveryTrackingNumber and :appliance_return_delivery_tracking_number' if attributes.key?(:'applianceReturnDeliveryTrackingNumber') && attributes.key?(:'appliance_return_delivery_tracking_number')

      self.appliance_return_delivery_tracking_number = attributes[:'appliance_return_delivery_tracking_number'] if attributes[:'appliance_return_delivery_tracking_number']

      self.appliance_delivery_vendor = attributes[:'applianceDeliveryVendor'] if attributes[:'applianceDeliveryVendor']

      raise 'You cannot provide both :applianceDeliveryVendor and :appliance_delivery_vendor' if attributes.key?(:'applianceDeliveryVendor') && attributes.key?(:'appliance_delivery_vendor')

      self.appliance_delivery_vendor = attributes[:'appliance_delivery_vendor'] if attributes[:'appliance_delivery_vendor']

      self.customer_shipping_address = attributes[:'customerShippingAddress'] if attributes[:'customerShippingAddress']

      raise 'You cannot provide both :customerShippingAddress and :customer_shipping_address' if attributes.key?(:'customerShippingAddress') && attributes.key?(:'customer_shipping_address')

      self.customer_shipping_address = attributes[:'customer_shipping_address'] if attributes[:'customer_shipping_address']

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
        label == other.label &&
        lifecycle_state == other.lifecycle_state &&
        transfer_job_id == other.transfer_job_id &&
        serial_number == other.serial_number &&
        creation_time == other.creation_time &&
        customer_received_time == other.customer_received_time &&
        customer_returned_time == other.customer_returned_time &&
        next_billing_time == other.next_billing_time &&
        delivery_security_tie_id == other.delivery_security_tie_id &&
        return_security_tie_id == other.return_security_tie_id &&
        appliance_delivery_tracking_number == other.appliance_delivery_tracking_number &&
        appliance_return_delivery_tracking_number == other.appliance_return_delivery_tracking_number &&
        appliance_delivery_vendor == other.appliance_delivery_vendor &&
        customer_shipping_address == other.customer_shipping_address &&
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
      [label, lifecycle_state, transfer_job_id, serial_number, creation_time, customer_received_time, customer_returned_time, next_billing_time, delivery_security_tie_id, return_security_tie_id, appliance_delivery_tracking_number, appliance_return_delivery_tracking_number, appliance_delivery_vendor, customer_shipping_address, upload_status_log_uri].hash
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
