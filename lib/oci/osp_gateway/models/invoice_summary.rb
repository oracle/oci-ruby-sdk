# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Invoice list elements
  class OspGateway::Models::InvoiceSummary
    INVOICE_STATUS_ENUM = [
      INVOICE_STATUS_OPEN = 'OPEN'.freeze,
      INVOICE_STATUS_PAST_DUE = 'PAST_DUE'.freeze,
      INVOICE_STATUS_PAYMENT_SUBMITTED = 'PAYMENT_SUBMITTED'.freeze,
      INVOICE_STATUS_CLOSED = 'CLOSED'.freeze,
      INVOICE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INVOICE_TYPE_ENUM = [
      INVOICE_TYPE_HARDWARE = 'HARDWARE'.freeze,
      INVOICE_TYPE_SUBSCRIPTION = 'SUBSCRIPTION'.freeze,
      INVOICE_TYPE_SUPPORT = 'SUPPORT'.freeze,
      INVOICE_TYPE_LICENSE = 'LICENSE'.freeze,
      INVOICE_TYPE_EDUCATION = 'EDUCATION'.freeze,
      INVOICE_TYPE_CONSULTING = 'CONSULTING'.freeze,
      INVOICE_TYPE_SERVICE = 'SERVICE'.freeze,
      INVOICE_TYPE_USAGE = 'USAGE'.freeze,
      INVOICE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Invoice identifier
    # @return [String]
    attr_accessor :invoice_id

    # Invoice external reference
    # @return [String]
    attr_accessor :invoice_number

    # PC invoice identifier
    # @return [String]
    attr_accessor :internal_invoice_id

    # Is credit card payment eligible
    # @return [BOOLEAN]
    attr_accessor :is_credit_card_payable

    # Invoice status
    # @return [String]
    attr_reader :invoice_status

    # Type of invoice
    # @return [String]
    attr_reader :invoice_type

    # Is the invoice has been already payed
    # @return [BOOLEAN]
    attr_accessor :is_paid

    # Whether invoice can be payed
    # @return [BOOLEAN]
    attr_accessor :is_payable

    # Invoice amount
    # @return [Float]
    attr_accessor :invoice_amount

    # Invoice amount due
    # @return [Float]
    attr_accessor :invoice_amount_due

    # Invoice amount credit
    # @return [Float]
    attr_accessor :invoice_amount_credited

    # Invoice amount adjust
    # @return [Float]
    attr_accessor :invoice_amount_adjusted

    # Invoice amount applied
    # @return [Float]
    attr_accessor :invoice_amount_applied

    # Due date of invoice amount
    # @return [DateTime]
    attr_accessor :time_invoice_due

    # Is the last payment failed
    # @return [BOOLEAN]
    attr_accessor :is_payment_failed

    # Invoice amount in dispute
    # @return [Float]
    attr_accessor :invoice_amount_in_dispute

    # Invoice reference number
    # @return [String]
    attr_accessor :invoice_ref_number

    # Invoice PO number
    # @return [String]
    attr_accessor :invoice_po_number

    # Date of invoice
    # @return [DateTime]
    attr_accessor :time_invoice

    # @return [OCI::OspGateway::Models::Currency]
    attr_accessor :currency

    # Is emailing pdf allowed
    # @return [BOOLEAN]
    attr_accessor :is_pdf_email_available

    # Is view access allowed
    # @return [BOOLEAN]
    attr_accessor :is_display_view_pdf

    # Is pdf download access allowed
    # @return [BOOLEAN]
    attr_accessor :is_display_download_pdf

    # @return [OCI::OspGateway::Models::PaymentDetail]
    attr_accessor :last_payment_detail

    # Name of the bill to customer
    # @return [String]
    attr_accessor :party_name

    # List of subscription identifiers
    # @return [Array<String>]
    attr_accessor :subscription_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'invoice_id': :'invoiceId',
        'invoice_number': :'invoiceNumber',
        'internal_invoice_id': :'internalInvoiceId',
        'is_credit_card_payable': :'isCreditCardPayable',
        'invoice_status': :'invoiceStatus',
        'invoice_type': :'invoiceType',
        'is_paid': :'isPaid',
        'is_payable': :'isPayable',
        'invoice_amount': :'invoiceAmount',
        'invoice_amount_due': :'invoiceAmountDue',
        'invoice_amount_credited': :'invoiceAmountCredited',
        'invoice_amount_adjusted': :'invoiceAmountAdjusted',
        'invoice_amount_applied': :'invoiceAmountApplied',
        'time_invoice_due': :'timeInvoiceDue',
        'is_payment_failed': :'isPaymentFailed',
        'invoice_amount_in_dispute': :'invoiceAmountInDispute',
        'invoice_ref_number': :'invoiceRefNumber',
        'invoice_po_number': :'invoicePoNumber',
        'time_invoice': :'timeInvoice',
        'currency': :'currency',
        'is_pdf_email_available': :'isPdfEmailAvailable',
        'is_display_view_pdf': :'isDisplayViewPdf',
        'is_display_download_pdf': :'isDisplayDownloadPdf',
        'last_payment_detail': :'lastPaymentDetail',
        'party_name': :'partyName',
        'subscription_ids': :'subscriptionIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'invoice_id': :'String',
        'invoice_number': :'String',
        'internal_invoice_id': :'String',
        'is_credit_card_payable': :'BOOLEAN',
        'invoice_status': :'String',
        'invoice_type': :'String',
        'is_paid': :'BOOLEAN',
        'is_payable': :'BOOLEAN',
        'invoice_amount': :'Float',
        'invoice_amount_due': :'Float',
        'invoice_amount_credited': :'Float',
        'invoice_amount_adjusted': :'Float',
        'invoice_amount_applied': :'Float',
        'time_invoice_due': :'DateTime',
        'is_payment_failed': :'BOOLEAN',
        'invoice_amount_in_dispute': :'Float',
        'invoice_ref_number': :'String',
        'invoice_po_number': :'String',
        'time_invoice': :'DateTime',
        'currency': :'OCI::OspGateway::Models::Currency',
        'is_pdf_email_available': :'BOOLEAN',
        'is_display_view_pdf': :'BOOLEAN',
        'is_display_download_pdf': :'BOOLEAN',
        'last_payment_detail': :'OCI::OspGateway::Models::PaymentDetail',
        'party_name': :'String',
        'subscription_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :invoice_id The value to assign to the {#invoice_id} property
    # @option attributes [String] :invoice_number The value to assign to the {#invoice_number} property
    # @option attributes [String] :internal_invoice_id The value to assign to the {#internal_invoice_id} property
    # @option attributes [BOOLEAN] :is_credit_card_payable The value to assign to the {#is_credit_card_payable} property
    # @option attributes [String] :invoice_status The value to assign to the {#invoice_status} property
    # @option attributes [String] :invoice_type The value to assign to the {#invoice_type} property
    # @option attributes [BOOLEAN] :is_paid The value to assign to the {#is_paid} property
    # @option attributes [BOOLEAN] :is_payable The value to assign to the {#is_payable} property
    # @option attributes [Float] :invoice_amount The value to assign to the {#invoice_amount} property
    # @option attributes [Float] :invoice_amount_due The value to assign to the {#invoice_amount_due} property
    # @option attributes [Float] :invoice_amount_credited The value to assign to the {#invoice_amount_credited} property
    # @option attributes [Float] :invoice_amount_adjusted The value to assign to the {#invoice_amount_adjusted} property
    # @option attributes [Float] :invoice_amount_applied The value to assign to the {#invoice_amount_applied} property
    # @option attributes [DateTime] :time_invoice_due The value to assign to the {#time_invoice_due} property
    # @option attributes [BOOLEAN] :is_payment_failed The value to assign to the {#is_payment_failed} property
    # @option attributes [Float] :invoice_amount_in_dispute The value to assign to the {#invoice_amount_in_dispute} property
    # @option attributes [String] :invoice_ref_number The value to assign to the {#invoice_ref_number} property
    # @option attributes [String] :invoice_po_number The value to assign to the {#invoice_po_number} property
    # @option attributes [DateTime] :time_invoice The value to assign to the {#time_invoice} property
    # @option attributes [OCI::OspGateway::Models::Currency] :currency The value to assign to the {#currency} property
    # @option attributes [BOOLEAN] :is_pdf_email_available The value to assign to the {#is_pdf_email_available} property
    # @option attributes [BOOLEAN] :is_display_view_pdf The value to assign to the {#is_display_view_pdf} property
    # @option attributes [BOOLEAN] :is_display_download_pdf The value to assign to the {#is_display_download_pdf} property
    # @option attributes [OCI::OspGateway::Models::PaymentDetail] :last_payment_detail The value to assign to the {#last_payment_detail} property
    # @option attributes [String] :party_name The value to assign to the {#party_name} property
    # @option attributes [Array<String>] :subscription_ids The value to assign to the {#subscription_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.invoice_id = attributes[:'invoiceId'] if attributes[:'invoiceId']

      raise 'You cannot provide both :invoiceId and :invoice_id' if attributes.key?(:'invoiceId') && attributes.key?(:'invoice_id')

      self.invoice_id = attributes[:'invoice_id'] if attributes[:'invoice_id']

      self.invoice_number = attributes[:'invoiceNumber'] if attributes[:'invoiceNumber']

      raise 'You cannot provide both :invoiceNumber and :invoice_number' if attributes.key?(:'invoiceNumber') && attributes.key?(:'invoice_number')

      self.invoice_number = attributes[:'invoice_number'] if attributes[:'invoice_number']

      self.internal_invoice_id = attributes[:'internalInvoiceId'] if attributes[:'internalInvoiceId']

      raise 'You cannot provide both :internalInvoiceId and :internal_invoice_id' if attributes.key?(:'internalInvoiceId') && attributes.key?(:'internal_invoice_id')

      self.internal_invoice_id = attributes[:'internal_invoice_id'] if attributes[:'internal_invoice_id']

      self.is_credit_card_payable = attributes[:'isCreditCardPayable'] unless attributes[:'isCreditCardPayable'].nil?

      raise 'You cannot provide both :isCreditCardPayable and :is_credit_card_payable' if attributes.key?(:'isCreditCardPayable') && attributes.key?(:'is_credit_card_payable')

      self.is_credit_card_payable = attributes[:'is_credit_card_payable'] unless attributes[:'is_credit_card_payable'].nil?

      self.invoice_status = attributes[:'invoiceStatus'] if attributes[:'invoiceStatus']

      raise 'You cannot provide both :invoiceStatus and :invoice_status' if attributes.key?(:'invoiceStatus') && attributes.key?(:'invoice_status')

      self.invoice_status = attributes[:'invoice_status'] if attributes[:'invoice_status']

      self.invoice_type = attributes[:'invoiceType'] if attributes[:'invoiceType']

      raise 'You cannot provide both :invoiceType and :invoice_type' if attributes.key?(:'invoiceType') && attributes.key?(:'invoice_type')

      self.invoice_type = attributes[:'invoice_type'] if attributes[:'invoice_type']

      self.is_paid = attributes[:'isPaid'] unless attributes[:'isPaid'].nil?

      raise 'You cannot provide both :isPaid and :is_paid' if attributes.key?(:'isPaid') && attributes.key?(:'is_paid')

      self.is_paid = attributes[:'is_paid'] unless attributes[:'is_paid'].nil?

      self.is_payable = attributes[:'isPayable'] unless attributes[:'isPayable'].nil?

      raise 'You cannot provide both :isPayable and :is_payable' if attributes.key?(:'isPayable') && attributes.key?(:'is_payable')

      self.is_payable = attributes[:'is_payable'] unless attributes[:'is_payable'].nil?

      self.invoice_amount = attributes[:'invoiceAmount'] if attributes[:'invoiceAmount']

      raise 'You cannot provide both :invoiceAmount and :invoice_amount' if attributes.key?(:'invoiceAmount') && attributes.key?(:'invoice_amount')

      self.invoice_amount = attributes[:'invoice_amount'] if attributes[:'invoice_amount']

      self.invoice_amount_due = attributes[:'invoiceAmountDue'] if attributes[:'invoiceAmountDue']

      raise 'You cannot provide both :invoiceAmountDue and :invoice_amount_due' if attributes.key?(:'invoiceAmountDue') && attributes.key?(:'invoice_amount_due')

      self.invoice_amount_due = attributes[:'invoice_amount_due'] if attributes[:'invoice_amount_due']

      self.invoice_amount_credited = attributes[:'invoiceAmountCredited'] if attributes[:'invoiceAmountCredited']

      raise 'You cannot provide both :invoiceAmountCredited and :invoice_amount_credited' if attributes.key?(:'invoiceAmountCredited') && attributes.key?(:'invoice_amount_credited')

      self.invoice_amount_credited = attributes[:'invoice_amount_credited'] if attributes[:'invoice_amount_credited']

      self.invoice_amount_adjusted = attributes[:'invoiceAmountAdjusted'] if attributes[:'invoiceAmountAdjusted']

      raise 'You cannot provide both :invoiceAmountAdjusted and :invoice_amount_adjusted' if attributes.key?(:'invoiceAmountAdjusted') && attributes.key?(:'invoice_amount_adjusted')

      self.invoice_amount_adjusted = attributes[:'invoice_amount_adjusted'] if attributes[:'invoice_amount_adjusted']

      self.invoice_amount_applied = attributes[:'invoiceAmountApplied'] if attributes[:'invoiceAmountApplied']

      raise 'You cannot provide both :invoiceAmountApplied and :invoice_amount_applied' if attributes.key?(:'invoiceAmountApplied') && attributes.key?(:'invoice_amount_applied')

      self.invoice_amount_applied = attributes[:'invoice_amount_applied'] if attributes[:'invoice_amount_applied']

      self.time_invoice_due = attributes[:'timeInvoiceDue'] if attributes[:'timeInvoiceDue']

      raise 'You cannot provide both :timeInvoiceDue and :time_invoice_due' if attributes.key?(:'timeInvoiceDue') && attributes.key?(:'time_invoice_due')

      self.time_invoice_due = attributes[:'time_invoice_due'] if attributes[:'time_invoice_due']

      self.is_payment_failed = attributes[:'isPaymentFailed'] unless attributes[:'isPaymentFailed'].nil?

      raise 'You cannot provide both :isPaymentFailed and :is_payment_failed' if attributes.key?(:'isPaymentFailed') && attributes.key?(:'is_payment_failed')

      self.is_payment_failed = attributes[:'is_payment_failed'] unless attributes[:'is_payment_failed'].nil?

      self.invoice_amount_in_dispute = attributes[:'invoiceAmountInDispute'] if attributes[:'invoiceAmountInDispute']

      raise 'You cannot provide both :invoiceAmountInDispute and :invoice_amount_in_dispute' if attributes.key?(:'invoiceAmountInDispute') && attributes.key?(:'invoice_amount_in_dispute')

      self.invoice_amount_in_dispute = attributes[:'invoice_amount_in_dispute'] if attributes[:'invoice_amount_in_dispute']

      self.invoice_ref_number = attributes[:'invoiceRefNumber'] if attributes[:'invoiceRefNumber']

      raise 'You cannot provide both :invoiceRefNumber and :invoice_ref_number' if attributes.key?(:'invoiceRefNumber') && attributes.key?(:'invoice_ref_number')

      self.invoice_ref_number = attributes[:'invoice_ref_number'] if attributes[:'invoice_ref_number']

      self.invoice_po_number = attributes[:'invoicePoNumber'] if attributes[:'invoicePoNumber']

      raise 'You cannot provide both :invoicePoNumber and :invoice_po_number' if attributes.key?(:'invoicePoNumber') && attributes.key?(:'invoice_po_number')

      self.invoice_po_number = attributes[:'invoice_po_number'] if attributes[:'invoice_po_number']

      self.time_invoice = attributes[:'timeInvoice'] if attributes[:'timeInvoice']

      raise 'You cannot provide both :timeInvoice and :time_invoice' if attributes.key?(:'timeInvoice') && attributes.key?(:'time_invoice')

      self.time_invoice = attributes[:'time_invoice'] if attributes[:'time_invoice']

      self.currency = attributes[:'currency'] if attributes[:'currency']

      self.is_pdf_email_available = attributes[:'isPdfEmailAvailable'] unless attributes[:'isPdfEmailAvailable'].nil?

      raise 'You cannot provide both :isPdfEmailAvailable and :is_pdf_email_available' if attributes.key?(:'isPdfEmailAvailable') && attributes.key?(:'is_pdf_email_available')

      self.is_pdf_email_available = attributes[:'is_pdf_email_available'] unless attributes[:'is_pdf_email_available'].nil?

      self.is_display_view_pdf = attributes[:'isDisplayViewPdf'] unless attributes[:'isDisplayViewPdf'].nil?

      raise 'You cannot provide both :isDisplayViewPdf and :is_display_view_pdf' if attributes.key?(:'isDisplayViewPdf') && attributes.key?(:'is_display_view_pdf')

      self.is_display_view_pdf = attributes[:'is_display_view_pdf'] unless attributes[:'is_display_view_pdf'].nil?

      self.is_display_download_pdf = attributes[:'isDisplayDownloadPdf'] unless attributes[:'isDisplayDownloadPdf'].nil?

      raise 'You cannot provide both :isDisplayDownloadPdf and :is_display_download_pdf' if attributes.key?(:'isDisplayDownloadPdf') && attributes.key?(:'is_display_download_pdf')

      self.is_display_download_pdf = attributes[:'is_display_download_pdf'] unless attributes[:'is_display_download_pdf'].nil?

      self.last_payment_detail = attributes[:'lastPaymentDetail'] if attributes[:'lastPaymentDetail']

      raise 'You cannot provide both :lastPaymentDetail and :last_payment_detail' if attributes.key?(:'lastPaymentDetail') && attributes.key?(:'last_payment_detail')

      self.last_payment_detail = attributes[:'last_payment_detail'] if attributes[:'last_payment_detail']

      self.party_name = attributes[:'partyName'] if attributes[:'partyName']

      raise 'You cannot provide both :partyName and :party_name' if attributes.key?(:'partyName') && attributes.key?(:'party_name')

      self.party_name = attributes[:'party_name'] if attributes[:'party_name']

      self.subscription_ids = attributes[:'subscriptionIds'] if attributes[:'subscriptionIds']

      raise 'You cannot provide both :subscriptionIds and :subscription_ids' if attributes.key?(:'subscriptionIds') && attributes.key?(:'subscription_ids')

      self.subscription_ids = attributes[:'subscription_ids'] if attributes[:'subscription_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] invoice_status Object to be assigned
    def invoice_status=(invoice_status)
      # rubocop:disable Style/ConditionalAssignment
      if invoice_status && !INVOICE_STATUS_ENUM.include?(invoice_status)
        OCI.logger.debug("Unknown value for 'invoice_status' [" + invoice_status + "]. Mapping to 'INVOICE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @invoice_status = INVOICE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @invoice_status = invoice_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] invoice_type Object to be assigned
    def invoice_type=(invoice_type)
      # rubocop:disable Style/ConditionalAssignment
      if invoice_type && !INVOICE_TYPE_ENUM.include?(invoice_type)
        OCI.logger.debug("Unknown value for 'invoice_type' [" + invoice_type + "]. Mapping to 'INVOICE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @invoice_type = INVOICE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @invoice_type = invoice_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        invoice_id == other.invoice_id &&
        invoice_number == other.invoice_number &&
        internal_invoice_id == other.internal_invoice_id &&
        is_credit_card_payable == other.is_credit_card_payable &&
        invoice_status == other.invoice_status &&
        invoice_type == other.invoice_type &&
        is_paid == other.is_paid &&
        is_payable == other.is_payable &&
        invoice_amount == other.invoice_amount &&
        invoice_amount_due == other.invoice_amount_due &&
        invoice_amount_credited == other.invoice_amount_credited &&
        invoice_amount_adjusted == other.invoice_amount_adjusted &&
        invoice_amount_applied == other.invoice_amount_applied &&
        time_invoice_due == other.time_invoice_due &&
        is_payment_failed == other.is_payment_failed &&
        invoice_amount_in_dispute == other.invoice_amount_in_dispute &&
        invoice_ref_number == other.invoice_ref_number &&
        invoice_po_number == other.invoice_po_number &&
        time_invoice == other.time_invoice &&
        currency == other.currency &&
        is_pdf_email_available == other.is_pdf_email_available &&
        is_display_view_pdf == other.is_display_view_pdf &&
        is_display_download_pdf == other.is_display_download_pdf &&
        last_payment_detail == other.last_payment_detail &&
        party_name == other.party_name &&
        subscription_ids == other.subscription_ids
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
      [invoice_id, invoice_number, internal_invoice_id, is_credit_card_payable, invoice_status, invoice_type, is_paid, is_payable, invoice_amount, invoice_amount_due, invoice_amount_credited, invoice_amount_adjusted, invoice_amount_applied, time_invoice_due, is_payment_failed, invoice_amount_in_dispute, invoice_ref_number, invoice_po_number, time_invoice, currency, is_pdf_email_available, is_display_view_pdf, is_display_download_pdf, last_payment_detail, party_name, subscription_ids].hash
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
