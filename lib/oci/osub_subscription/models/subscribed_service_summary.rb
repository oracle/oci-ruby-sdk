# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Subscribed Service summary
  #
  class OsubSubscription::Models::SubscribedServiceSummary
    # **[Required]** SPM internal Subscribed Service ID
    #
    # @return [String]
    attr_accessor :id

    # @return [OCI::OsubSubscription::Models::SubscriptionProduct]
    attr_accessor :product

    # Subscribed service quantity
    #
    # @return [String]
    attr_accessor :quantity

    # Subscribed service status
    #
    # @return [String]
    attr_accessor :status

    # Subscribed service operation type
    #
    # @return [String]
    attr_accessor :operation_type

    # Subscribed service net unit price
    #
    # @return [String]
    attr_accessor :net_unit_price

    # Funded Allocation line value
    # example: 12000.00
    #
    # @return [String]
    attr_accessor :funded_allocation_value

    # This field contains the name of the partner to which the subscription belongs - depending on which the invoicing may differ
    #
    # @return [String]
    attr_accessor :partner_transaction_type

    # Term value in Months
    #
    # @return [Integer]
    attr_accessor :term_value

    # Term value UOM
    #
    # @return [String]
    attr_accessor :term_value_uom

    # Booking Opportunity Number of Subscribed Service
    #
    # @return [String]
    attr_accessor :booking_opty_number

    # Subscribed service total value
    #
    # @return [String]
    attr_accessor :total_value

    # Sales Order Number associated to the subscribed service
    #
    # @return [Integer]
    attr_accessor :order_number

    # Subscribed service data center region
    #
    # @return [String]
    attr_accessor :data_center_region

    # Subscribed service pricing model
    #
    # @return [String]
    attr_accessor :pricing_model

    # Subscribed service program type
    #
    # @return [String]
    attr_accessor :program_type

    # Subscribed service promotion type
    #
    # @return [String]
    attr_accessor :promo_type

    # Subscribed service CSI number
    #
    # @return [Integer]
    attr_accessor :csi

    # Subscribed service intent to pay flag
    #
    # @return [BOOLEAN]
    attr_accessor :is_intent_to_pay

    # Subscribed service start date
    #
    # @return [DateTime]
    attr_accessor :time_start

    # Subscribed service end date
    #
    # @return [DateTime]
    attr_accessor :time_end

    # List of Commitment services of a line
    #
    # @return [Array<OCI::OsubSubscription::Models::Commitment>]
    attr_accessor :commitment_services

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'product': :'product',
        'quantity': :'quantity',
        'status': :'status',
        'operation_type': :'operationType',
        'net_unit_price': :'netUnitPrice',
        'funded_allocation_value': :'fundedAllocationValue',
        'partner_transaction_type': :'partnerTransactionType',
        'term_value': :'termValue',
        'term_value_uom': :'termValueUOM',
        'booking_opty_number': :'bookingOptyNumber',
        'total_value': :'totalValue',
        'order_number': :'orderNumber',
        'data_center_region': :'dataCenterRegion',
        'pricing_model': :'pricingModel',
        'program_type': :'programType',
        'promo_type': :'promoType',
        'csi': :'csi',
        'is_intent_to_pay': :'isIntentToPay',
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'commitment_services': :'commitmentServices'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'product': :'OCI::OsubSubscription::Models::SubscriptionProduct',
        'quantity': :'String',
        'status': :'String',
        'operation_type': :'String',
        'net_unit_price': :'String',
        'funded_allocation_value': :'String',
        'partner_transaction_type': :'String',
        'term_value': :'Integer',
        'term_value_uom': :'String',
        'booking_opty_number': :'String',
        'total_value': :'String',
        'order_number': :'Integer',
        'data_center_region': :'String',
        'pricing_model': :'String',
        'program_type': :'String',
        'promo_type': :'String',
        'csi': :'Integer',
        'is_intent_to_pay': :'BOOLEAN',
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'commitment_services': :'Array<OCI::OsubSubscription::Models::Commitment>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [OCI::OsubSubscription::Models::SubscriptionProduct] :product The value to assign to the {#product} property
    # @option attributes [String] :quantity The value to assign to the {#quantity} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :net_unit_price The value to assign to the {#net_unit_price} property
    # @option attributes [String] :funded_allocation_value The value to assign to the {#funded_allocation_value} property
    # @option attributes [String] :partner_transaction_type The value to assign to the {#partner_transaction_type} property
    # @option attributes [Integer] :term_value The value to assign to the {#term_value} property
    # @option attributes [String] :term_value_uom The value to assign to the {#term_value_uom} property
    # @option attributes [String] :booking_opty_number The value to assign to the {#booking_opty_number} property
    # @option attributes [String] :total_value The value to assign to the {#total_value} property
    # @option attributes [Integer] :order_number The value to assign to the {#order_number} property
    # @option attributes [String] :data_center_region The value to assign to the {#data_center_region} property
    # @option attributes [String] :pricing_model The value to assign to the {#pricing_model} property
    # @option attributes [String] :program_type The value to assign to the {#program_type} property
    # @option attributes [String] :promo_type The value to assign to the {#promo_type} property
    # @option attributes [Integer] :csi The value to assign to the {#csi} property
    # @option attributes [BOOLEAN] :is_intent_to_pay The value to assign to the {#is_intent_to_pay} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [Array<OCI::OsubSubscription::Models::Commitment>] :commitment_services The value to assign to the {#commitment_services} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.product = attributes[:'product'] if attributes[:'product']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.status = attributes[:'status'] if attributes[:'status']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.net_unit_price = attributes[:'netUnitPrice'] if attributes[:'netUnitPrice']

      raise 'You cannot provide both :netUnitPrice and :net_unit_price' if attributes.key?(:'netUnitPrice') && attributes.key?(:'net_unit_price')

      self.net_unit_price = attributes[:'net_unit_price'] if attributes[:'net_unit_price']

      self.funded_allocation_value = attributes[:'fundedAllocationValue'] if attributes[:'fundedAllocationValue']

      raise 'You cannot provide both :fundedAllocationValue and :funded_allocation_value' if attributes.key?(:'fundedAllocationValue') && attributes.key?(:'funded_allocation_value')

      self.funded_allocation_value = attributes[:'funded_allocation_value'] if attributes[:'funded_allocation_value']

      self.partner_transaction_type = attributes[:'partnerTransactionType'] if attributes[:'partnerTransactionType']

      raise 'You cannot provide both :partnerTransactionType and :partner_transaction_type' if attributes.key?(:'partnerTransactionType') && attributes.key?(:'partner_transaction_type')

      self.partner_transaction_type = attributes[:'partner_transaction_type'] if attributes[:'partner_transaction_type']

      self.term_value = attributes[:'termValue'] if attributes[:'termValue']

      raise 'You cannot provide both :termValue and :term_value' if attributes.key?(:'termValue') && attributes.key?(:'term_value')

      self.term_value = attributes[:'term_value'] if attributes[:'term_value']

      self.term_value_uom = attributes[:'termValueUOM'] if attributes[:'termValueUOM']

      raise 'You cannot provide both :termValueUOM and :term_value_uom' if attributes.key?(:'termValueUOM') && attributes.key?(:'term_value_uom')

      self.term_value_uom = attributes[:'term_value_uom'] if attributes[:'term_value_uom']

      self.booking_opty_number = attributes[:'bookingOptyNumber'] if attributes[:'bookingOptyNumber']

      raise 'You cannot provide both :bookingOptyNumber and :booking_opty_number' if attributes.key?(:'bookingOptyNumber') && attributes.key?(:'booking_opty_number')

      self.booking_opty_number = attributes[:'booking_opty_number'] if attributes[:'booking_opty_number']

      self.total_value = attributes[:'totalValue'] if attributes[:'totalValue']

      raise 'You cannot provide both :totalValue and :total_value' if attributes.key?(:'totalValue') && attributes.key?(:'total_value')

      self.total_value = attributes[:'total_value'] if attributes[:'total_value']

      self.order_number = attributes[:'orderNumber'] if attributes[:'orderNumber']

      raise 'You cannot provide both :orderNumber and :order_number' if attributes.key?(:'orderNumber') && attributes.key?(:'order_number')

      self.order_number = attributes[:'order_number'] if attributes[:'order_number']

      self.data_center_region = attributes[:'dataCenterRegion'] if attributes[:'dataCenterRegion']

      raise 'You cannot provide both :dataCenterRegion and :data_center_region' if attributes.key?(:'dataCenterRegion') && attributes.key?(:'data_center_region')

      self.data_center_region = attributes[:'data_center_region'] if attributes[:'data_center_region']

      self.pricing_model = attributes[:'pricingModel'] if attributes[:'pricingModel']

      raise 'You cannot provide both :pricingModel and :pricing_model' if attributes.key?(:'pricingModel') && attributes.key?(:'pricing_model')

      self.pricing_model = attributes[:'pricing_model'] if attributes[:'pricing_model']

      self.program_type = attributes[:'programType'] if attributes[:'programType']

      raise 'You cannot provide both :programType and :program_type' if attributes.key?(:'programType') && attributes.key?(:'program_type')

      self.program_type = attributes[:'program_type'] if attributes[:'program_type']

      self.promo_type = attributes[:'promoType'] if attributes[:'promoType']

      raise 'You cannot provide both :promoType and :promo_type' if attributes.key?(:'promoType') && attributes.key?(:'promo_type')

      self.promo_type = attributes[:'promo_type'] if attributes[:'promo_type']

      self.csi = attributes[:'csi'] if attributes[:'csi']

      self.is_intent_to_pay = attributes[:'isIntentToPay'] unless attributes[:'isIntentToPay'].nil?

      raise 'You cannot provide both :isIntentToPay and :is_intent_to_pay' if attributes.key?(:'isIntentToPay') && attributes.key?(:'is_intent_to_pay')

      self.is_intent_to_pay = attributes[:'is_intent_to_pay'] unless attributes[:'is_intent_to_pay'].nil?

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.commitment_services = attributes[:'commitmentServices'] if attributes[:'commitmentServices']

      raise 'You cannot provide both :commitmentServices and :commitment_services' if attributes.key?(:'commitmentServices') && attributes.key?(:'commitment_services')

      self.commitment_services = attributes[:'commitment_services'] if attributes[:'commitment_services']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        product == other.product &&
        quantity == other.quantity &&
        status == other.status &&
        operation_type == other.operation_type &&
        net_unit_price == other.net_unit_price &&
        funded_allocation_value == other.funded_allocation_value &&
        partner_transaction_type == other.partner_transaction_type &&
        term_value == other.term_value &&
        term_value_uom == other.term_value_uom &&
        booking_opty_number == other.booking_opty_number &&
        total_value == other.total_value &&
        order_number == other.order_number &&
        data_center_region == other.data_center_region &&
        pricing_model == other.pricing_model &&
        program_type == other.program_type &&
        promo_type == other.promo_type &&
        csi == other.csi &&
        is_intent_to_pay == other.is_intent_to_pay &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        commitment_services == other.commitment_services
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
      [id, product, quantity, status, operation_type, net_unit_price, funded_allocation_value, partner_transaction_type, term_value, term_value_uom, booking_opty_number, total_value, order_number, data_center_region, pricing_model, program_type, promo_type, csi, is_intent_to_pay, time_start, time_end, commitment_services].hash
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
