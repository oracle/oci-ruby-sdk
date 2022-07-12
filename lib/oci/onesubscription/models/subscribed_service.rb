# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Subscribed service contract details
  #
  class Onesubscription::Models::SubscribedService
    # SPM internal Subscribed Service ID
    #
    # @return [String]
    attr_accessor :id

    # Subscribed Service line type
    #
    # @return [String]
    attr_accessor :type

    # Subscribed service line number
    #
    # @return [String]
    attr_accessor :serial_number

    # Subscription ID associated to the subscribed service
    #
    # @return [String]
    attr_accessor :subscription_id

    # @return [OCI::Onesubscription::Models::RateCardProduct]
    attr_accessor :product

    # Subscribed service start date
    #
    # @return [DateTime]
    attr_accessor :time_start

    # Subscribed service end date
    #
    # @return [DateTime]
    attr_accessor :time_end

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

    # Indicates the period for which the commitment amount can be utilised exceeding which the amount lapses. Also used in calculation of total contract line value
    #
    # @return [String]
    attr_accessor :price_period

    # Subscribed service line net amount
    #
    # @return [String]
    attr_accessor :line_net_amount

    # Indicates if the commitment lines can have different quantities
    #
    # @return [BOOLEAN]
    attr_accessor :is_variable_commitment

    # Indicates if a service can recieve usages and consequently have available amounts computed
    #
    # @return [BOOLEAN]
    attr_accessor :is_allowance

    # Subscribed service used amount
    #
    # @return [String]
    attr_accessor :used_amount

    # Subscribed sercice available or remaining amount
    #
    # @return [String]
    attr_accessor :available_amount

    # Funded Allocation line value
    # example: 12000.00
    #
    # @return [String]
    attr_accessor :funded_allocation_value

    # Indicator on whether or not there has been usage for the subscribed service
    #
    # @return [BOOLEAN]
    attr_accessor :is_having_usage

    # If true compares rate between ratecard and the active pricelist and minimum rate would be fetched
    #
    # @return [BOOLEAN]
    attr_accessor :is_cap_to_price_list

    # Subscribed service credit percentage
    #
    # @return [String]
    attr_accessor :credit_percentage

    # This field contains the name of the partner to which the subscription belongs - depending on which the invoicing may differ
    #
    # @return [String]
    attr_accessor :partner_transaction_type

    # Used in context of service credit lines
    #
    # @return [BOOLEAN]
    attr_accessor :is_credit_enabled

    # Overage Policy of Subscribed Service
    #
    # @return [String]
    attr_accessor :overage_policy

    # Overage Bill To of Subscribed Service
    #
    # @return [String]
    attr_accessor :overage_bill_to

    # Pay As You Go policy of Subscribed Service (Can be null - indicating no payg policy)
    #
    # @return [String]
    attr_accessor :payg_policy

    # Not null if this service has an associated promotion line in SPM. Contains the line identifier from Order Management of
    # the associated promo line.
    #
    # @return [Integer]
    attr_accessor :promo_order_line_id

    # Promotion Pricing Type of Subscribed Service (Can be null - indicating no promotion pricing)
    #
    # @return [String]
    attr_accessor :promotion_pricing_type

    # Subscribed service Rate Card Discount Percentage
    #
    # @return [String]
    attr_accessor :rate_card_discount_percentage

    # Subscribed service Overage Discount Percentage
    #
    # @return [String]
    attr_accessor :overage_discount_percentage

    # @return [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner]
    attr_accessor :bill_to_customer

    # @return [OCI::Onesubscription::Models::SubscribedServiceUser]
    attr_accessor :bill_to_contact

    # @return [OCI::Onesubscription::Models::SubscribedServiceAddress]
    attr_accessor :bill_to_address

    # Payment Number of Subscribed Service
    #
    # @return [String]
    attr_accessor :payment_number

    # Subscribed service payment expiry date
    #
    # @return [DateTime]
    attr_accessor :time_payment_expiry

    # @return [OCI::Onesubscription::Models::SubscribedServicePaymentTerm]
    attr_accessor :payment_term

    # Payment Method of Subscribed Service
    #
    # @return [String]
    attr_accessor :payment_method

    # Subscribed service Transaction Extension Id
    #
    # @return [Integer]
    attr_accessor :transaction_extension_id

    # Sales Channel of Subscribed Service
    #
    # @return [String]
    attr_accessor :sales_channel

    # Subscribed service eligible to renew field
    #
    # @return [String]
    attr_accessor :eligible_to_renew

    # SPM renewed Subscription ID
    #
    # @return [String]
    attr_accessor :renewed_subscribed_service_id

    # Term value in Months
    #
    # @return [Integer]
    attr_accessor :term_value

    # Term value UOM
    #
    # @return [String]
    attr_accessor :term_value_uom

    # Subscribed service Opportunity Id
    #
    # @return [Integer]
    attr_accessor :renewal_opty_id

    # Renewal Opportunity Number of Subscribed Service
    #
    # @return [String]
    attr_accessor :renewal_opty_number

    # Renewal Opportunity Type of Subscribed Service
    #
    # @return [String]
    attr_accessor :renewal_opty_type

    # Booking Opportunity Number of Subscribed Service
    #
    # @return [String]
    attr_accessor :booking_opty_number

    # Subscribed service Revenue Line Id
    #
    # @return [Integer]
    attr_accessor :revenue_line_id

    # Revenue Line NUmber of Subscribed Service
    #
    # @return [String]
    attr_accessor :revenue_line_number

    # Subscribed service Major Set
    #
    # @return [Integer]
    attr_accessor :major_set

    # Subscribed service Major Set Start date
    #
    # @return [DateTime]
    attr_accessor :time_majorset_start

    # Subscribed service Major Set End date
    #
    # @return [DateTime]
    attr_accessor :time_majorset_end

    # Subscribed service System ARR
    #
    # @return [String]
    attr_accessor :system_arr_in_lc

    # Subscribed service System ARR in Standard Currency
    #
    # @return [String]
    attr_accessor :system_arr_in_sc

    # Subscribed service System ATR-ARR
    #
    # @return [String]
    attr_accessor :system_atr_arr_in_lc

    # Subscribed service System ATR-ARR in Standard Currency
    #
    # @return [String]
    attr_accessor :system_atr_arr_in_sc

    # Subscribed service Revised ARR
    #
    # @return [String]
    attr_accessor :revised_arr_in_lc

    # Subscribed service Revised ARR in Standard Currency
    #
    # @return [String]
    attr_accessor :revised_arr_in_sc

    # Subscribed service total value
    #
    # @return [String]
    attr_accessor :total_value

    # Subscribed service Promotion Amount
    #
    # @return [String]
    attr_accessor :original_promo_amount

    # Sales Order Header associated to the subscribed service
    #
    # @return [Integer]
    attr_accessor :order_header_id

    # Sales Order Number associated to the subscribed service
    #
    # @return [Integer]
    attr_accessor :order_number

    # Order Type of Subscribed Service
    #
    # @return [String]
    attr_accessor :order_type

    # Sales Order Line Id associated to the subscribed service
    #
    # @return [Integer]
    attr_accessor :order_line_id

    # Sales Order Line Number associated to the subscribed service
    #
    # @return [Integer]
    attr_accessor :order_line_number

    # Subscribed service commitment schedule Id
    #
    # @return [String]
    attr_accessor :commitment_schedule_id

    # Subscribed service sales account party id
    #
    # @return [Integer]
    attr_accessor :sales_account_party_id

    # Subscribed service data center
    #
    # @return [String]
    attr_accessor :data_center

    # Subscribed service data center region
    #
    # @return [String]
    attr_accessor :data_center_region

    # Subscribed service admin email id
    #
    # @return [String]
    attr_accessor :admin_email

    # Subscribed service buyer email id
    #
    # @return [String]
    attr_accessor :buyer_email

    # Subscribed service source
    #
    # @return [String]
    attr_accessor :subscription_source

    # Subscribed service provisioning source
    #
    # @return [String]
    attr_accessor :provisioning_source

    # Subscribed service fulfillment set
    #
    # @return [String]
    attr_accessor :fulfillment_set

    # Subscribed service intent to pay flag
    #
    # @return [BOOLEAN]
    attr_accessor :is_intent_to_pay

    # Subscribed service payg flag
    #
    # @return [BOOLEAN]
    attr_accessor :is_payg

    # Subscribed service pricing model
    #
    # @return [String]
    attr_accessor :pricing_model

    # Subscribed service program type
    #
    # @return [String]
    attr_accessor :program_type

    # Subscribed service start date type
    #
    # @return [String]
    attr_accessor :start_date_type

    # Subscribed service provisioning date
    #
    # @return [DateTime]
    attr_accessor :time_provisioned

    # Subscribed service promotion type
    #
    # @return [String]
    attr_accessor :promo_type

    # @return [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner]
    attr_accessor :service_to_customer

    # @return [OCI::Onesubscription::Models::SubscribedServiceUser]
    attr_accessor :service_to_contact

    # @return [OCI::Onesubscription::Models::SubscribedServiceAddress]
    attr_accessor :service_to_address

    # @return [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner]
    attr_accessor :sold_to_customer

    # @return [OCI::Onesubscription::Models::SubscribedServiceUser]
    attr_accessor :sold_to_contact

    # @return [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner]
    attr_accessor :end_user_customer

    # @return [OCI::Onesubscription::Models::SubscribedServiceUser]
    attr_accessor :end_user_contact

    # @return [OCI::Onesubscription::Models::SubscribedServiceAddress]
    attr_accessor :end_user_address

    # @return [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner]
    attr_accessor :reseller_customer

    # @return [OCI::Onesubscription::Models::SubscribedServiceUser]
    attr_accessor :reseller_contact

    # @return [OCI::Onesubscription::Models::SubscribedServiceAddress]
    attr_accessor :reseller_address

    # Subscribed service CSI number
    #
    # @return [Integer]
    attr_accessor :csi

    # Identifier for a customer's transactions for purchase of ay oracle services
    #
    # @return [String]
    attr_accessor :customer_transaction_reference

    # Subscribed service partner credit amount
    #
    # @return [String]
    attr_accessor :partner_credit_amount

    # Indicates if the Subscribed service has a single ratecard
    #
    # @return [BOOLEAN]
    attr_accessor :is_single_rate_card

    # Subscribed service agreement ID
    #
    # @return [Integer]
    attr_accessor :agreement_id

    # Subscribed service agrrement name
    #
    # @return [String]
    attr_accessor :agreement_name

    # Subscribed service agrrement type
    #
    # @return [String]
    attr_accessor :agreement_type

    # Subscribed service invoice frequency
    #
    # @return [String]
    attr_accessor :billing_frequency

    # Subscribed service welcome email sent date
    #
    # @return [DateTime]
    attr_accessor :time_welcome_email_sent

    # Subscribed service service configuration email sent date
    #
    # @return [DateTime]
    attr_accessor :time_service_configuration_email_sent

    # Subscribed service customer config date
    #
    # @return [DateTime]
    attr_accessor :time_customer_config

    # Subscribed service agrrement end date
    #
    # @return [DateTime]
    attr_accessor :time_agreement_end

    # List of Commitment services of a line
    #
    # @return [Array<OCI::Onesubscription::Models::CommitmentService>]
    attr_accessor :commitment_services

    # List of Rate Cards of a Subscribed Service
    #
    # @return [Array<OCI::Onesubscription::Models::RateCardSummary>]
    attr_accessor :rate_cards

    # Subscribed service creation date
    #
    # @return [DateTime]
    attr_accessor :time_created

    # User that created the subscribed service
    #
    # @return [String]
    attr_accessor :created_by

    # Subscribed service last update date
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # User that updated the subscribed service
    #
    # @return [String]
    attr_accessor :updated_by

    # SPM Ratecard Type
    #
    # @return [String]
    attr_accessor :ratecard_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'type': :'type',
        'serial_number': :'serialNumber',
        'subscription_id': :'subscriptionId',
        'product': :'product',
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'quantity': :'quantity',
        'status': :'status',
        'operation_type': :'operationType',
        'net_unit_price': :'netUnitPrice',
        'price_period': :'pricePeriod',
        'line_net_amount': :'lineNetAmount',
        'is_variable_commitment': :'isVariableCommitment',
        'is_allowance': :'isAllowance',
        'used_amount': :'usedAmount',
        'available_amount': :'availableAmount',
        'funded_allocation_value': :'fundedAllocationValue',
        'is_having_usage': :'isHavingUsage',
        'is_cap_to_price_list': :'isCapToPriceList',
        'credit_percentage': :'creditPercentage',
        'partner_transaction_type': :'partnerTransactionType',
        'is_credit_enabled': :'isCreditEnabled',
        'overage_policy': :'overagePolicy',
        'overage_bill_to': :'overageBillTo',
        'payg_policy': :'paygPolicy',
        'promo_order_line_id': :'promoOrderLineId',
        'promotion_pricing_type': :'promotionPricingType',
        'rate_card_discount_percentage': :'rateCardDiscountPercentage',
        'overage_discount_percentage': :'overageDiscountPercentage',
        'bill_to_customer': :'billToCustomer',
        'bill_to_contact': :'billToContact',
        'bill_to_address': :'billToAddress',
        'payment_number': :'paymentNumber',
        'time_payment_expiry': :'timePaymentExpiry',
        'payment_term': :'paymentTerm',
        'payment_method': :'paymentMethod',
        'transaction_extension_id': :'transactionExtensionId',
        'sales_channel': :'salesChannel',
        'eligible_to_renew': :'eligibleToRenew',
        'renewed_subscribed_service_id': :'renewedSubscribedServiceId',
        'term_value': :'termValue',
        'term_value_uom': :'termValueUom',
        'renewal_opty_id': :'renewalOptyId',
        'renewal_opty_number': :'renewalOptyNumber',
        'renewal_opty_type': :'renewalOptyType',
        'booking_opty_number': :'bookingOptyNumber',
        'revenue_line_id': :'revenueLineId',
        'revenue_line_number': :'revenueLineNumber',
        'major_set': :'majorSet',
        'time_majorset_start': :'timeMajorsetStart',
        'time_majorset_end': :'timeMajorsetEnd',
        'system_arr_in_lc': :'systemArrInLc',
        'system_arr_in_sc': :'systemArrInSc',
        'system_atr_arr_in_lc': :'systemAtrArrInLc',
        'system_atr_arr_in_sc': :'systemAtrArrInSc',
        'revised_arr_in_lc': :'revisedArrInLc',
        'revised_arr_in_sc': :'revisedArrInSc',
        'total_value': :'totalValue',
        'original_promo_amount': :'originalPromoAmount',
        'order_header_id': :'orderHeaderId',
        'order_number': :'orderNumber',
        'order_type': :'orderType',
        'order_line_id': :'orderLineId',
        'order_line_number': :'orderLineNumber',
        'commitment_schedule_id': :'commitmentScheduleId',
        'sales_account_party_id': :'salesAccountPartyId',
        'data_center': :'dataCenter',
        'data_center_region': :'dataCenterRegion',
        'admin_email': :'adminEmail',
        'buyer_email': :'buyerEmail',
        'subscription_source': :'subscriptionSource',
        'provisioning_source': :'provisioningSource',
        'fulfillment_set': :'fulfillmentSet',
        'is_intent_to_pay': :'isIntentToPay',
        'is_payg': :'isPayg',
        'pricing_model': :'pricingModel',
        'program_type': :'programType',
        'start_date_type': :'startDateType',
        'time_provisioned': :'timeProvisioned',
        'promo_type': :'promoType',
        'service_to_customer': :'serviceToCustomer',
        'service_to_contact': :'serviceToContact',
        'service_to_address': :'serviceToAddress',
        'sold_to_customer': :'soldToCustomer',
        'sold_to_contact': :'soldToContact',
        'end_user_customer': :'endUserCustomer',
        'end_user_contact': :'endUserContact',
        'end_user_address': :'endUserAddress',
        'reseller_customer': :'resellerCustomer',
        'reseller_contact': :'resellerContact',
        'reseller_address': :'resellerAddress',
        'csi': :'csi',
        'customer_transaction_reference': :'customerTransactionReference',
        'partner_credit_amount': :'partnerCreditAmount',
        'is_single_rate_card': :'isSingleRateCard',
        'agreement_id': :'agreementId',
        'agreement_name': :'agreementName',
        'agreement_type': :'agreementType',
        'billing_frequency': :'billingFrequency',
        'time_welcome_email_sent': :'timeWelcomeEmailSent',
        'time_service_configuration_email_sent': :'timeServiceConfigurationEmailSent',
        'time_customer_config': :'timeCustomerConfig',
        'time_agreement_end': :'timeAgreementEnd',
        'commitment_services': :'commitmentServices',
        'rate_cards': :'rateCards',
        'time_created': :'timeCreated',
        'created_by': :'createdBy',
        'time_updated': :'timeUpdated',
        'updated_by': :'updatedBy',
        'ratecard_type': :'ratecardType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'type': :'String',
        'serial_number': :'String',
        'subscription_id': :'String',
        'product': :'OCI::Onesubscription::Models::RateCardProduct',
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'quantity': :'String',
        'status': :'String',
        'operation_type': :'String',
        'net_unit_price': :'String',
        'price_period': :'String',
        'line_net_amount': :'String',
        'is_variable_commitment': :'BOOLEAN',
        'is_allowance': :'BOOLEAN',
        'used_amount': :'String',
        'available_amount': :'String',
        'funded_allocation_value': :'String',
        'is_having_usage': :'BOOLEAN',
        'is_cap_to_price_list': :'BOOLEAN',
        'credit_percentage': :'String',
        'partner_transaction_type': :'String',
        'is_credit_enabled': :'BOOLEAN',
        'overage_policy': :'String',
        'overage_bill_to': :'String',
        'payg_policy': :'String',
        'promo_order_line_id': :'Integer',
        'promotion_pricing_type': :'String',
        'rate_card_discount_percentage': :'String',
        'overage_discount_percentage': :'String',
        'bill_to_customer': :'OCI::Onesubscription::Models::SubscribedServiceBusinessPartner',
        'bill_to_contact': :'OCI::Onesubscription::Models::SubscribedServiceUser',
        'bill_to_address': :'OCI::Onesubscription::Models::SubscribedServiceAddress',
        'payment_number': :'String',
        'time_payment_expiry': :'DateTime',
        'payment_term': :'OCI::Onesubscription::Models::SubscribedServicePaymentTerm',
        'payment_method': :'String',
        'transaction_extension_id': :'Integer',
        'sales_channel': :'String',
        'eligible_to_renew': :'String',
        'renewed_subscribed_service_id': :'String',
        'term_value': :'Integer',
        'term_value_uom': :'String',
        'renewal_opty_id': :'Integer',
        'renewal_opty_number': :'String',
        'renewal_opty_type': :'String',
        'booking_opty_number': :'String',
        'revenue_line_id': :'Integer',
        'revenue_line_number': :'String',
        'major_set': :'Integer',
        'time_majorset_start': :'DateTime',
        'time_majorset_end': :'DateTime',
        'system_arr_in_lc': :'String',
        'system_arr_in_sc': :'String',
        'system_atr_arr_in_lc': :'String',
        'system_atr_arr_in_sc': :'String',
        'revised_arr_in_lc': :'String',
        'revised_arr_in_sc': :'String',
        'total_value': :'String',
        'original_promo_amount': :'String',
        'order_header_id': :'Integer',
        'order_number': :'Integer',
        'order_type': :'String',
        'order_line_id': :'Integer',
        'order_line_number': :'Integer',
        'commitment_schedule_id': :'String',
        'sales_account_party_id': :'Integer',
        'data_center': :'String',
        'data_center_region': :'String',
        'admin_email': :'String',
        'buyer_email': :'String',
        'subscription_source': :'String',
        'provisioning_source': :'String',
        'fulfillment_set': :'String',
        'is_intent_to_pay': :'BOOLEAN',
        'is_payg': :'BOOLEAN',
        'pricing_model': :'String',
        'program_type': :'String',
        'start_date_type': :'String',
        'time_provisioned': :'DateTime',
        'promo_type': :'String',
        'service_to_customer': :'OCI::Onesubscription::Models::SubscribedServiceBusinessPartner',
        'service_to_contact': :'OCI::Onesubscription::Models::SubscribedServiceUser',
        'service_to_address': :'OCI::Onesubscription::Models::SubscribedServiceAddress',
        'sold_to_customer': :'OCI::Onesubscription::Models::SubscribedServiceBusinessPartner',
        'sold_to_contact': :'OCI::Onesubscription::Models::SubscribedServiceUser',
        'end_user_customer': :'OCI::Onesubscription::Models::SubscribedServiceBusinessPartner',
        'end_user_contact': :'OCI::Onesubscription::Models::SubscribedServiceUser',
        'end_user_address': :'OCI::Onesubscription::Models::SubscribedServiceAddress',
        'reseller_customer': :'OCI::Onesubscription::Models::SubscribedServiceBusinessPartner',
        'reseller_contact': :'OCI::Onesubscription::Models::SubscribedServiceUser',
        'reseller_address': :'OCI::Onesubscription::Models::SubscribedServiceAddress',
        'csi': :'Integer',
        'customer_transaction_reference': :'String',
        'partner_credit_amount': :'String',
        'is_single_rate_card': :'BOOLEAN',
        'agreement_id': :'Integer',
        'agreement_name': :'String',
        'agreement_type': :'String',
        'billing_frequency': :'String',
        'time_welcome_email_sent': :'DateTime',
        'time_service_configuration_email_sent': :'DateTime',
        'time_customer_config': :'DateTime',
        'time_agreement_end': :'DateTime',
        'commitment_services': :'Array<OCI::Onesubscription::Models::CommitmentService>',
        'rate_cards': :'Array<OCI::Onesubscription::Models::RateCardSummary>',
        'time_created': :'DateTime',
        'created_by': :'String',
        'time_updated': :'DateTime',
        'updated_by': :'String',
        'ratecard_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [String] :subscription_id The value to assign to the {#subscription_id} property
    # @option attributes [OCI::Onesubscription::Models::RateCardProduct] :product The value to assign to the {#product} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [String] :quantity The value to assign to the {#quantity} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :net_unit_price The value to assign to the {#net_unit_price} property
    # @option attributes [String] :price_period The value to assign to the {#price_period} property
    # @option attributes [String] :line_net_amount The value to assign to the {#line_net_amount} property
    # @option attributes [BOOLEAN] :is_variable_commitment The value to assign to the {#is_variable_commitment} property
    # @option attributes [BOOLEAN] :is_allowance The value to assign to the {#is_allowance} property
    # @option attributes [String] :used_amount The value to assign to the {#used_amount} property
    # @option attributes [String] :available_amount The value to assign to the {#available_amount} property
    # @option attributes [String] :funded_allocation_value The value to assign to the {#funded_allocation_value} property
    # @option attributes [BOOLEAN] :is_having_usage The value to assign to the {#is_having_usage} property
    # @option attributes [BOOLEAN] :is_cap_to_price_list The value to assign to the {#is_cap_to_price_list} property
    # @option attributes [String] :credit_percentage The value to assign to the {#credit_percentage} property
    # @option attributes [String] :partner_transaction_type The value to assign to the {#partner_transaction_type} property
    # @option attributes [BOOLEAN] :is_credit_enabled The value to assign to the {#is_credit_enabled} property
    # @option attributes [String] :overage_policy The value to assign to the {#overage_policy} property
    # @option attributes [String] :overage_bill_to The value to assign to the {#overage_bill_to} property
    # @option attributes [String] :payg_policy The value to assign to the {#payg_policy} property
    # @option attributes [Integer] :promo_order_line_id The value to assign to the {#promo_order_line_id} property
    # @option attributes [String] :promotion_pricing_type The value to assign to the {#promotion_pricing_type} property
    # @option attributes [String] :rate_card_discount_percentage The value to assign to the {#rate_card_discount_percentage} property
    # @option attributes [String] :overage_discount_percentage The value to assign to the {#overage_discount_percentage} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner] :bill_to_customer The value to assign to the {#bill_to_customer} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceUser] :bill_to_contact The value to assign to the {#bill_to_contact} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceAddress] :bill_to_address The value to assign to the {#bill_to_address} property
    # @option attributes [String] :payment_number The value to assign to the {#payment_number} property
    # @option attributes [DateTime] :time_payment_expiry The value to assign to the {#time_payment_expiry} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServicePaymentTerm] :payment_term The value to assign to the {#payment_term} property
    # @option attributes [String] :payment_method The value to assign to the {#payment_method} property
    # @option attributes [Integer] :transaction_extension_id The value to assign to the {#transaction_extension_id} property
    # @option attributes [String] :sales_channel The value to assign to the {#sales_channel} property
    # @option attributes [String] :eligible_to_renew The value to assign to the {#eligible_to_renew} property
    # @option attributes [String] :renewed_subscribed_service_id The value to assign to the {#renewed_subscribed_service_id} property
    # @option attributes [Integer] :term_value The value to assign to the {#term_value} property
    # @option attributes [String] :term_value_uom The value to assign to the {#term_value_uom} property
    # @option attributes [Integer] :renewal_opty_id The value to assign to the {#renewal_opty_id} property
    # @option attributes [String] :renewal_opty_number The value to assign to the {#renewal_opty_number} property
    # @option attributes [String] :renewal_opty_type The value to assign to the {#renewal_opty_type} property
    # @option attributes [String] :booking_opty_number The value to assign to the {#booking_opty_number} property
    # @option attributes [Integer] :revenue_line_id The value to assign to the {#revenue_line_id} property
    # @option attributes [String] :revenue_line_number The value to assign to the {#revenue_line_number} property
    # @option attributes [Integer] :major_set The value to assign to the {#major_set} property
    # @option attributes [DateTime] :time_majorset_start The value to assign to the {#time_majorset_start} property
    # @option attributes [DateTime] :time_majorset_end The value to assign to the {#time_majorset_end} property
    # @option attributes [String] :system_arr_in_lc The value to assign to the {#system_arr_in_lc} property
    # @option attributes [String] :system_arr_in_sc The value to assign to the {#system_arr_in_sc} property
    # @option attributes [String] :system_atr_arr_in_lc The value to assign to the {#system_atr_arr_in_lc} property
    # @option attributes [String] :system_atr_arr_in_sc The value to assign to the {#system_atr_arr_in_sc} property
    # @option attributes [String] :revised_arr_in_lc The value to assign to the {#revised_arr_in_lc} property
    # @option attributes [String] :revised_arr_in_sc The value to assign to the {#revised_arr_in_sc} property
    # @option attributes [String] :total_value The value to assign to the {#total_value} property
    # @option attributes [String] :original_promo_amount The value to assign to the {#original_promo_amount} property
    # @option attributes [Integer] :order_header_id The value to assign to the {#order_header_id} property
    # @option attributes [Integer] :order_number The value to assign to the {#order_number} property
    # @option attributes [String] :order_type The value to assign to the {#order_type} property
    # @option attributes [Integer] :order_line_id The value to assign to the {#order_line_id} property
    # @option attributes [Integer] :order_line_number The value to assign to the {#order_line_number} property
    # @option attributes [String] :commitment_schedule_id The value to assign to the {#commitment_schedule_id} property
    # @option attributes [Integer] :sales_account_party_id The value to assign to the {#sales_account_party_id} property
    # @option attributes [String] :data_center The value to assign to the {#data_center} property
    # @option attributes [String] :data_center_region The value to assign to the {#data_center_region} property
    # @option attributes [String] :admin_email The value to assign to the {#admin_email} property
    # @option attributes [String] :buyer_email The value to assign to the {#buyer_email} property
    # @option attributes [String] :subscription_source The value to assign to the {#subscription_source} property
    # @option attributes [String] :provisioning_source The value to assign to the {#provisioning_source} property
    # @option attributes [String] :fulfillment_set The value to assign to the {#fulfillment_set} property
    # @option attributes [BOOLEAN] :is_intent_to_pay The value to assign to the {#is_intent_to_pay} property
    # @option attributes [BOOLEAN] :is_payg The value to assign to the {#is_payg} property
    # @option attributes [String] :pricing_model The value to assign to the {#pricing_model} property
    # @option attributes [String] :program_type The value to assign to the {#program_type} property
    # @option attributes [String] :start_date_type The value to assign to the {#start_date_type} property
    # @option attributes [DateTime] :time_provisioned The value to assign to the {#time_provisioned} property
    # @option attributes [String] :promo_type The value to assign to the {#promo_type} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner] :service_to_customer The value to assign to the {#service_to_customer} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceUser] :service_to_contact The value to assign to the {#service_to_contact} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceAddress] :service_to_address The value to assign to the {#service_to_address} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner] :sold_to_customer The value to assign to the {#sold_to_customer} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceUser] :sold_to_contact The value to assign to the {#sold_to_contact} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner] :end_user_customer The value to assign to the {#end_user_customer} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceUser] :end_user_contact The value to assign to the {#end_user_contact} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceAddress] :end_user_address The value to assign to the {#end_user_address} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceBusinessPartner] :reseller_customer The value to assign to the {#reseller_customer} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceUser] :reseller_contact The value to assign to the {#reseller_contact} property
    # @option attributes [OCI::Onesubscription::Models::SubscribedServiceAddress] :reseller_address The value to assign to the {#reseller_address} property
    # @option attributes [Integer] :csi The value to assign to the {#csi} property
    # @option attributes [String] :customer_transaction_reference The value to assign to the {#customer_transaction_reference} property
    # @option attributes [String] :partner_credit_amount The value to assign to the {#partner_credit_amount} property
    # @option attributes [BOOLEAN] :is_single_rate_card The value to assign to the {#is_single_rate_card} property
    # @option attributes [Integer] :agreement_id The value to assign to the {#agreement_id} property
    # @option attributes [String] :agreement_name The value to assign to the {#agreement_name} property
    # @option attributes [String] :agreement_type The value to assign to the {#agreement_type} property
    # @option attributes [String] :billing_frequency The value to assign to the {#billing_frequency} property
    # @option attributes [DateTime] :time_welcome_email_sent The value to assign to the {#time_welcome_email_sent} property
    # @option attributes [DateTime] :time_service_configuration_email_sent The value to assign to the {#time_service_configuration_email_sent} property
    # @option attributes [DateTime] :time_customer_config The value to assign to the {#time_customer_config} property
    # @option attributes [DateTime] :time_agreement_end The value to assign to the {#time_agreement_end} property
    # @option attributes [Array<OCI::Onesubscription::Models::CommitmentService>] :commitment_services The value to assign to the {#commitment_services} property
    # @option attributes [Array<OCI::Onesubscription::Models::RateCardSummary>] :rate_cards The value to assign to the {#rate_cards} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :updated_by The value to assign to the {#updated_by} property
    # @option attributes [String] :ratecard_type The value to assign to the {#ratecard_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.type = attributes[:'type'] if attributes[:'type']

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.subscription_id = attributes[:'subscriptionId'] if attributes[:'subscriptionId']

      raise 'You cannot provide both :subscriptionId and :subscription_id' if attributes.key?(:'subscriptionId') && attributes.key?(:'subscription_id')

      self.subscription_id = attributes[:'subscription_id'] if attributes[:'subscription_id']

      self.product = attributes[:'product'] if attributes[:'product']

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.status = attributes[:'status'] if attributes[:'status']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.net_unit_price = attributes[:'netUnitPrice'] if attributes[:'netUnitPrice']

      raise 'You cannot provide both :netUnitPrice and :net_unit_price' if attributes.key?(:'netUnitPrice') && attributes.key?(:'net_unit_price')

      self.net_unit_price = attributes[:'net_unit_price'] if attributes[:'net_unit_price']

      self.price_period = attributes[:'pricePeriod'] if attributes[:'pricePeriod']

      raise 'You cannot provide both :pricePeriod and :price_period' if attributes.key?(:'pricePeriod') && attributes.key?(:'price_period')

      self.price_period = attributes[:'price_period'] if attributes[:'price_period']

      self.line_net_amount = attributes[:'lineNetAmount'] if attributes[:'lineNetAmount']

      raise 'You cannot provide both :lineNetAmount and :line_net_amount' if attributes.key?(:'lineNetAmount') && attributes.key?(:'line_net_amount')

      self.line_net_amount = attributes[:'line_net_amount'] if attributes[:'line_net_amount']

      self.is_variable_commitment = attributes[:'isVariableCommitment'] unless attributes[:'isVariableCommitment'].nil?

      raise 'You cannot provide both :isVariableCommitment and :is_variable_commitment' if attributes.key?(:'isVariableCommitment') && attributes.key?(:'is_variable_commitment')

      self.is_variable_commitment = attributes[:'is_variable_commitment'] unless attributes[:'is_variable_commitment'].nil?

      self.is_allowance = attributes[:'isAllowance'] unless attributes[:'isAllowance'].nil?

      raise 'You cannot provide both :isAllowance and :is_allowance' if attributes.key?(:'isAllowance') && attributes.key?(:'is_allowance')

      self.is_allowance = attributes[:'is_allowance'] unless attributes[:'is_allowance'].nil?

      self.used_amount = attributes[:'usedAmount'] if attributes[:'usedAmount']

      raise 'You cannot provide both :usedAmount and :used_amount' if attributes.key?(:'usedAmount') && attributes.key?(:'used_amount')

      self.used_amount = attributes[:'used_amount'] if attributes[:'used_amount']

      self.available_amount = attributes[:'availableAmount'] if attributes[:'availableAmount']

      raise 'You cannot provide both :availableAmount and :available_amount' if attributes.key?(:'availableAmount') && attributes.key?(:'available_amount')

      self.available_amount = attributes[:'available_amount'] if attributes[:'available_amount']

      self.funded_allocation_value = attributes[:'fundedAllocationValue'] if attributes[:'fundedAllocationValue']

      raise 'You cannot provide both :fundedAllocationValue and :funded_allocation_value' if attributes.key?(:'fundedAllocationValue') && attributes.key?(:'funded_allocation_value')

      self.funded_allocation_value = attributes[:'funded_allocation_value'] if attributes[:'funded_allocation_value']

      self.is_having_usage = attributes[:'isHavingUsage'] unless attributes[:'isHavingUsage'].nil?

      raise 'You cannot provide both :isHavingUsage and :is_having_usage' if attributes.key?(:'isHavingUsage') && attributes.key?(:'is_having_usage')

      self.is_having_usage = attributes[:'is_having_usage'] unless attributes[:'is_having_usage'].nil?

      self.is_cap_to_price_list = attributes[:'isCapToPriceList'] unless attributes[:'isCapToPriceList'].nil?

      raise 'You cannot provide both :isCapToPriceList and :is_cap_to_price_list' if attributes.key?(:'isCapToPriceList') && attributes.key?(:'is_cap_to_price_list')

      self.is_cap_to_price_list = attributes[:'is_cap_to_price_list'] unless attributes[:'is_cap_to_price_list'].nil?

      self.credit_percentage = attributes[:'creditPercentage'] if attributes[:'creditPercentage']

      raise 'You cannot provide both :creditPercentage and :credit_percentage' if attributes.key?(:'creditPercentage') && attributes.key?(:'credit_percentage')

      self.credit_percentage = attributes[:'credit_percentage'] if attributes[:'credit_percentage']

      self.partner_transaction_type = attributes[:'partnerTransactionType'] if attributes[:'partnerTransactionType']

      raise 'You cannot provide both :partnerTransactionType and :partner_transaction_type' if attributes.key?(:'partnerTransactionType') && attributes.key?(:'partner_transaction_type')

      self.partner_transaction_type = attributes[:'partner_transaction_type'] if attributes[:'partner_transaction_type']

      self.is_credit_enabled = attributes[:'isCreditEnabled'] unless attributes[:'isCreditEnabled'].nil?

      raise 'You cannot provide both :isCreditEnabled and :is_credit_enabled' if attributes.key?(:'isCreditEnabled') && attributes.key?(:'is_credit_enabled')

      self.is_credit_enabled = attributes[:'is_credit_enabled'] unless attributes[:'is_credit_enabled'].nil?

      self.overage_policy = attributes[:'overagePolicy'] if attributes[:'overagePolicy']

      raise 'You cannot provide both :overagePolicy and :overage_policy' if attributes.key?(:'overagePolicy') && attributes.key?(:'overage_policy')

      self.overage_policy = attributes[:'overage_policy'] if attributes[:'overage_policy']

      self.overage_bill_to = attributes[:'overageBillTo'] if attributes[:'overageBillTo']

      raise 'You cannot provide both :overageBillTo and :overage_bill_to' if attributes.key?(:'overageBillTo') && attributes.key?(:'overage_bill_to')

      self.overage_bill_to = attributes[:'overage_bill_to'] if attributes[:'overage_bill_to']

      self.payg_policy = attributes[:'paygPolicy'] if attributes[:'paygPolicy']

      raise 'You cannot provide both :paygPolicy and :payg_policy' if attributes.key?(:'paygPolicy') && attributes.key?(:'payg_policy')

      self.payg_policy = attributes[:'payg_policy'] if attributes[:'payg_policy']

      self.promo_order_line_id = attributes[:'promoOrderLineId'] if attributes[:'promoOrderLineId']

      raise 'You cannot provide both :promoOrderLineId and :promo_order_line_id' if attributes.key?(:'promoOrderLineId') && attributes.key?(:'promo_order_line_id')

      self.promo_order_line_id = attributes[:'promo_order_line_id'] if attributes[:'promo_order_line_id']

      self.promotion_pricing_type = attributes[:'promotionPricingType'] if attributes[:'promotionPricingType']

      raise 'You cannot provide both :promotionPricingType and :promotion_pricing_type' if attributes.key?(:'promotionPricingType') && attributes.key?(:'promotion_pricing_type')

      self.promotion_pricing_type = attributes[:'promotion_pricing_type'] if attributes[:'promotion_pricing_type']

      self.rate_card_discount_percentage = attributes[:'rateCardDiscountPercentage'] if attributes[:'rateCardDiscountPercentage']

      raise 'You cannot provide both :rateCardDiscountPercentage and :rate_card_discount_percentage' if attributes.key?(:'rateCardDiscountPercentage') && attributes.key?(:'rate_card_discount_percentage')

      self.rate_card_discount_percentage = attributes[:'rate_card_discount_percentage'] if attributes[:'rate_card_discount_percentage']

      self.overage_discount_percentage = attributes[:'overageDiscountPercentage'] if attributes[:'overageDiscountPercentage']

      raise 'You cannot provide both :overageDiscountPercentage and :overage_discount_percentage' if attributes.key?(:'overageDiscountPercentage') && attributes.key?(:'overage_discount_percentage')

      self.overage_discount_percentage = attributes[:'overage_discount_percentage'] if attributes[:'overage_discount_percentage']

      self.bill_to_customer = attributes[:'billToCustomer'] if attributes[:'billToCustomer']

      raise 'You cannot provide both :billToCustomer and :bill_to_customer' if attributes.key?(:'billToCustomer') && attributes.key?(:'bill_to_customer')

      self.bill_to_customer = attributes[:'bill_to_customer'] if attributes[:'bill_to_customer']

      self.bill_to_contact = attributes[:'billToContact'] if attributes[:'billToContact']

      raise 'You cannot provide both :billToContact and :bill_to_contact' if attributes.key?(:'billToContact') && attributes.key?(:'bill_to_contact')

      self.bill_to_contact = attributes[:'bill_to_contact'] if attributes[:'bill_to_contact']

      self.bill_to_address = attributes[:'billToAddress'] if attributes[:'billToAddress']

      raise 'You cannot provide both :billToAddress and :bill_to_address' if attributes.key?(:'billToAddress') && attributes.key?(:'bill_to_address')

      self.bill_to_address = attributes[:'bill_to_address'] if attributes[:'bill_to_address']

      self.payment_number = attributes[:'paymentNumber'] if attributes[:'paymentNumber']

      raise 'You cannot provide both :paymentNumber and :payment_number' if attributes.key?(:'paymentNumber') && attributes.key?(:'payment_number')

      self.payment_number = attributes[:'payment_number'] if attributes[:'payment_number']

      self.time_payment_expiry = attributes[:'timePaymentExpiry'] if attributes[:'timePaymentExpiry']

      raise 'You cannot provide both :timePaymentExpiry and :time_payment_expiry' if attributes.key?(:'timePaymentExpiry') && attributes.key?(:'time_payment_expiry')

      self.time_payment_expiry = attributes[:'time_payment_expiry'] if attributes[:'time_payment_expiry']

      self.payment_term = attributes[:'paymentTerm'] if attributes[:'paymentTerm']

      raise 'You cannot provide both :paymentTerm and :payment_term' if attributes.key?(:'paymentTerm') && attributes.key?(:'payment_term')

      self.payment_term = attributes[:'payment_term'] if attributes[:'payment_term']

      self.payment_method = attributes[:'paymentMethod'] if attributes[:'paymentMethod']

      raise 'You cannot provide both :paymentMethod and :payment_method' if attributes.key?(:'paymentMethod') && attributes.key?(:'payment_method')

      self.payment_method = attributes[:'payment_method'] if attributes[:'payment_method']

      self.transaction_extension_id = attributes[:'transactionExtensionId'] if attributes[:'transactionExtensionId']

      raise 'You cannot provide both :transactionExtensionId and :transaction_extension_id' if attributes.key?(:'transactionExtensionId') && attributes.key?(:'transaction_extension_id')

      self.transaction_extension_id = attributes[:'transaction_extension_id'] if attributes[:'transaction_extension_id']

      self.sales_channel = attributes[:'salesChannel'] if attributes[:'salesChannel']

      raise 'You cannot provide both :salesChannel and :sales_channel' if attributes.key?(:'salesChannel') && attributes.key?(:'sales_channel')

      self.sales_channel = attributes[:'sales_channel'] if attributes[:'sales_channel']

      self.eligible_to_renew = attributes[:'eligibleToRenew'] if attributes[:'eligibleToRenew']

      raise 'You cannot provide both :eligibleToRenew and :eligible_to_renew' if attributes.key?(:'eligibleToRenew') && attributes.key?(:'eligible_to_renew')

      self.eligible_to_renew = attributes[:'eligible_to_renew'] if attributes[:'eligible_to_renew']

      self.renewed_subscribed_service_id = attributes[:'renewedSubscribedServiceId'] if attributes[:'renewedSubscribedServiceId']

      raise 'You cannot provide both :renewedSubscribedServiceId and :renewed_subscribed_service_id' if attributes.key?(:'renewedSubscribedServiceId') && attributes.key?(:'renewed_subscribed_service_id')

      self.renewed_subscribed_service_id = attributes[:'renewed_subscribed_service_id'] if attributes[:'renewed_subscribed_service_id']

      self.term_value = attributes[:'termValue'] if attributes[:'termValue']

      raise 'You cannot provide both :termValue and :term_value' if attributes.key?(:'termValue') && attributes.key?(:'term_value')

      self.term_value = attributes[:'term_value'] if attributes[:'term_value']

      self.term_value_uom = attributes[:'termValueUom'] if attributes[:'termValueUom']

      raise 'You cannot provide both :termValueUom and :term_value_uom' if attributes.key?(:'termValueUom') && attributes.key?(:'term_value_uom')

      self.term_value_uom = attributes[:'term_value_uom'] if attributes[:'term_value_uom']

      self.renewal_opty_id = attributes[:'renewalOptyId'] if attributes[:'renewalOptyId']

      raise 'You cannot provide both :renewalOptyId and :renewal_opty_id' if attributes.key?(:'renewalOptyId') && attributes.key?(:'renewal_opty_id')

      self.renewal_opty_id = attributes[:'renewal_opty_id'] if attributes[:'renewal_opty_id']

      self.renewal_opty_number = attributes[:'renewalOptyNumber'] if attributes[:'renewalOptyNumber']

      raise 'You cannot provide both :renewalOptyNumber and :renewal_opty_number' if attributes.key?(:'renewalOptyNumber') && attributes.key?(:'renewal_opty_number')

      self.renewal_opty_number = attributes[:'renewal_opty_number'] if attributes[:'renewal_opty_number']

      self.renewal_opty_type = attributes[:'renewalOptyType'] if attributes[:'renewalOptyType']

      raise 'You cannot provide both :renewalOptyType and :renewal_opty_type' if attributes.key?(:'renewalOptyType') && attributes.key?(:'renewal_opty_type')

      self.renewal_opty_type = attributes[:'renewal_opty_type'] if attributes[:'renewal_opty_type']

      self.booking_opty_number = attributes[:'bookingOptyNumber'] if attributes[:'bookingOptyNumber']

      raise 'You cannot provide both :bookingOptyNumber and :booking_opty_number' if attributes.key?(:'bookingOptyNumber') && attributes.key?(:'booking_opty_number')

      self.booking_opty_number = attributes[:'booking_opty_number'] if attributes[:'booking_opty_number']

      self.revenue_line_id = attributes[:'revenueLineId'] if attributes[:'revenueLineId']

      raise 'You cannot provide both :revenueLineId and :revenue_line_id' if attributes.key?(:'revenueLineId') && attributes.key?(:'revenue_line_id')

      self.revenue_line_id = attributes[:'revenue_line_id'] if attributes[:'revenue_line_id']

      self.revenue_line_number = attributes[:'revenueLineNumber'] if attributes[:'revenueLineNumber']

      raise 'You cannot provide both :revenueLineNumber and :revenue_line_number' if attributes.key?(:'revenueLineNumber') && attributes.key?(:'revenue_line_number')

      self.revenue_line_number = attributes[:'revenue_line_number'] if attributes[:'revenue_line_number']

      self.major_set = attributes[:'majorSet'] if attributes[:'majorSet']

      raise 'You cannot provide both :majorSet and :major_set' if attributes.key?(:'majorSet') && attributes.key?(:'major_set')

      self.major_set = attributes[:'major_set'] if attributes[:'major_set']

      self.time_majorset_start = attributes[:'timeMajorsetStart'] if attributes[:'timeMajorsetStart']

      raise 'You cannot provide both :timeMajorsetStart and :time_majorset_start' if attributes.key?(:'timeMajorsetStart') && attributes.key?(:'time_majorset_start')

      self.time_majorset_start = attributes[:'time_majorset_start'] if attributes[:'time_majorset_start']

      self.time_majorset_end = attributes[:'timeMajorsetEnd'] if attributes[:'timeMajorsetEnd']

      raise 'You cannot provide both :timeMajorsetEnd and :time_majorset_end' if attributes.key?(:'timeMajorsetEnd') && attributes.key?(:'time_majorset_end')

      self.time_majorset_end = attributes[:'time_majorset_end'] if attributes[:'time_majorset_end']

      self.system_arr_in_lc = attributes[:'systemArrInLc'] if attributes[:'systemArrInLc']

      raise 'You cannot provide both :systemArrInLc and :system_arr_in_lc' if attributes.key?(:'systemArrInLc') && attributes.key?(:'system_arr_in_lc')

      self.system_arr_in_lc = attributes[:'system_arr_in_lc'] if attributes[:'system_arr_in_lc']

      self.system_arr_in_sc = attributes[:'systemArrInSc'] if attributes[:'systemArrInSc']

      raise 'You cannot provide both :systemArrInSc and :system_arr_in_sc' if attributes.key?(:'systemArrInSc') && attributes.key?(:'system_arr_in_sc')

      self.system_arr_in_sc = attributes[:'system_arr_in_sc'] if attributes[:'system_arr_in_sc']

      self.system_atr_arr_in_lc = attributes[:'systemAtrArrInLc'] if attributes[:'systemAtrArrInLc']

      raise 'You cannot provide both :systemAtrArrInLc and :system_atr_arr_in_lc' if attributes.key?(:'systemAtrArrInLc') && attributes.key?(:'system_atr_arr_in_lc')

      self.system_atr_arr_in_lc = attributes[:'system_atr_arr_in_lc'] if attributes[:'system_atr_arr_in_lc']

      self.system_atr_arr_in_sc = attributes[:'systemAtrArrInSc'] if attributes[:'systemAtrArrInSc']

      raise 'You cannot provide both :systemAtrArrInSc and :system_atr_arr_in_sc' if attributes.key?(:'systemAtrArrInSc') && attributes.key?(:'system_atr_arr_in_sc')

      self.system_atr_arr_in_sc = attributes[:'system_atr_arr_in_sc'] if attributes[:'system_atr_arr_in_sc']

      self.revised_arr_in_lc = attributes[:'revisedArrInLc'] if attributes[:'revisedArrInLc']

      raise 'You cannot provide both :revisedArrInLc and :revised_arr_in_lc' if attributes.key?(:'revisedArrInLc') && attributes.key?(:'revised_arr_in_lc')

      self.revised_arr_in_lc = attributes[:'revised_arr_in_lc'] if attributes[:'revised_arr_in_lc']

      self.revised_arr_in_sc = attributes[:'revisedArrInSc'] if attributes[:'revisedArrInSc']

      raise 'You cannot provide both :revisedArrInSc and :revised_arr_in_sc' if attributes.key?(:'revisedArrInSc') && attributes.key?(:'revised_arr_in_sc')

      self.revised_arr_in_sc = attributes[:'revised_arr_in_sc'] if attributes[:'revised_arr_in_sc']

      self.total_value = attributes[:'totalValue'] if attributes[:'totalValue']

      raise 'You cannot provide both :totalValue and :total_value' if attributes.key?(:'totalValue') && attributes.key?(:'total_value')

      self.total_value = attributes[:'total_value'] if attributes[:'total_value']

      self.original_promo_amount = attributes[:'originalPromoAmount'] if attributes[:'originalPromoAmount']

      raise 'You cannot provide both :originalPromoAmount and :original_promo_amount' if attributes.key?(:'originalPromoAmount') && attributes.key?(:'original_promo_amount')

      self.original_promo_amount = attributes[:'original_promo_amount'] if attributes[:'original_promo_amount']

      self.order_header_id = attributes[:'orderHeaderId'] if attributes[:'orderHeaderId']

      raise 'You cannot provide both :orderHeaderId and :order_header_id' if attributes.key?(:'orderHeaderId') && attributes.key?(:'order_header_id')

      self.order_header_id = attributes[:'order_header_id'] if attributes[:'order_header_id']

      self.order_number = attributes[:'orderNumber'] if attributes[:'orderNumber']

      raise 'You cannot provide both :orderNumber and :order_number' if attributes.key?(:'orderNumber') && attributes.key?(:'order_number')

      self.order_number = attributes[:'order_number'] if attributes[:'order_number']

      self.order_type = attributes[:'orderType'] if attributes[:'orderType']

      raise 'You cannot provide both :orderType and :order_type' if attributes.key?(:'orderType') && attributes.key?(:'order_type')

      self.order_type = attributes[:'order_type'] if attributes[:'order_type']

      self.order_line_id = attributes[:'orderLineId'] if attributes[:'orderLineId']

      raise 'You cannot provide both :orderLineId and :order_line_id' if attributes.key?(:'orderLineId') && attributes.key?(:'order_line_id')

      self.order_line_id = attributes[:'order_line_id'] if attributes[:'order_line_id']

      self.order_line_number = attributes[:'orderLineNumber'] if attributes[:'orderLineNumber']

      raise 'You cannot provide both :orderLineNumber and :order_line_number' if attributes.key?(:'orderLineNumber') && attributes.key?(:'order_line_number')

      self.order_line_number = attributes[:'order_line_number'] if attributes[:'order_line_number']

      self.commitment_schedule_id = attributes[:'commitmentScheduleId'] if attributes[:'commitmentScheduleId']

      raise 'You cannot provide both :commitmentScheduleId and :commitment_schedule_id' if attributes.key?(:'commitmentScheduleId') && attributes.key?(:'commitment_schedule_id')

      self.commitment_schedule_id = attributes[:'commitment_schedule_id'] if attributes[:'commitment_schedule_id']

      self.sales_account_party_id = attributes[:'salesAccountPartyId'] if attributes[:'salesAccountPartyId']

      raise 'You cannot provide both :salesAccountPartyId and :sales_account_party_id' if attributes.key?(:'salesAccountPartyId') && attributes.key?(:'sales_account_party_id')

      self.sales_account_party_id = attributes[:'sales_account_party_id'] if attributes[:'sales_account_party_id']

      self.data_center = attributes[:'dataCenter'] if attributes[:'dataCenter']

      raise 'You cannot provide both :dataCenter and :data_center' if attributes.key?(:'dataCenter') && attributes.key?(:'data_center')

      self.data_center = attributes[:'data_center'] if attributes[:'data_center']

      self.data_center_region = attributes[:'dataCenterRegion'] if attributes[:'dataCenterRegion']

      raise 'You cannot provide both :dataCenterRegion and :data_center_region' if attributes.key?(:'dataCenterRegion') && attributes.key?(:'data_center_region')

      self.data_center_region = attributes[:'data_center_region'] if attributes[:'data_center_region']

      self.admin_email = attributes[:'adminEmail'] if attributes[:'adminEmail']

      raise 'You cannot provide both :adminEmail and :admin_email' if attributes.key?(:'adminEmail') && attributes.key?(:'admin_email')

      self.admin_email = attributes[:'admin_email'] if attributes[:'admin_email']

      self.buyer_email = attributes[:'buyerEmail'] if attributes[:'buyerEmail']

      raise 'You cannot provide both :buyerEmail and :buyer_email' if attributes.key?(:'buyerEmail') && attributes.key?(:'buyer_email')

      self.buyer_email = attributes[:'buyer_email'] if attributes[:'buyer_email']

      self.subscription_source = attributes[:'subscriptionSource'] if attributes[:'subscriptionSource']

      raise 'You cannot provide both :subscriptionSource and :subscription_source' if attributes.key?(:'subscriptionSource') && attributes.key?(:'subscription_source')

      self.subscription_source = attributes[:'subscription_source'] if attributes[:'subscription_source']

      self.provisioning_source = attributes[:'provisioningSource'] if attributes[:'provisioningSource']

      raise 'You cannot provide both :provisioningSource and :provisioning_source' if attributes.key?(:'provisioningSource') && attributes.key?(:'provisioning_source')

      self.provisioning_source = attributes[:'provisioning_source'] if attributes[:'provisioning_source']

      self.fulfillment_set = attributes[:'fulfillmentSet'] if attributes[:'fulfillmentSet']

      raise 'You cannot provide both :fulfillmentSet and :fulfillment_set' if attributes.key?(:'fulfillmentSet') && attributes.key?(:'fulfillment_set')

      self.fulfillment_set = attributes[:'fulfillment_set'] if attributes[:'fulfillment_set']

      self.is_intent_to_pay = attributes[:'isIntentToPay'] unless attributes[:'isIntentToPay'].nil?

      raise 'You cannot provide both :isIntentToPay and :is_intent_to_pay' if attributes.key?(:'isIntentToPay') && attributes.key?(:'is_intent_to_pay')

      self.is_intent_to_pay = attributes[:'is_intent_to_pay'] unless attributes[:'is_intent_to_pay'].nil?

      self.is_payg = attributes[:'isPayg'] unless attributes[:'isPayg'].nil?

      raise 'You cannot provide both :isPayg and :is_payg' if attributes.key?(:'isPayg') && attributes.key?(:'is_payg')

      self.is_payg = attributes[:'is_payg'] unless attributes[:'is_payg'].nil?

      self.pricing_model = attributes[:'pricingModel'] if attributes[:'pricingModel']

      raise 'You cannot provide both :pricingModel and :pricing_model' if attributes.key?(:'pricingModel') && attributes.key?(:'pricing_model')

      self.pricing_model = attributes[:'pricing_model'] if attributes[:'pricing_model']

      self.program_type = attributes[:'programType'] if attributes[:'programType']

      raise 'You cannot provide both :programType and :program_type' if attributes.key?(:'programType') && attributes.key?(:'program_type')

      self.program_type = attributes[:'program_type'] if attributes[:'program_type']

      self.start_date_type = attributes[:'startDateType'] if attributes[:'startDateType']

      raise 'You cannot provide both :startDateType and :start_date_type' if attributes.key?(:'startDateType') && attributes.key?(:'start_date_type')

      self.start_date_type = attributes[:'start_date_type'] if attributes[:'start_date_type']

      self.time_provisioned = attributes[:'timeProvisioned'] if attributes[:'timeProvisioned']

      raise 'You cannot provide both :timeProvisioned and :time_provisioned' if attributes.key?(:'timeProvisioned') && attributes.key?(:'time_provisioned')

      self.time_provisioned = attributes[:'time_provisioned'] if attributes[:'time_provisioned']

      self.promo_type = attributes[:'promoType'] if attributes[:'promoType']

      raise 'You cannot provide both :promoType and :promo_type' if attributes.key?(:'promoType') && attributes.key?(:'promo_type')

      self.promo_type = attributes[:'promo_type'] if attributes[:'promo_type']

      self.service_to_customer = attributes[:'serviceToCustomer'] if attributes[:'serviceToCustomer']

      raise 'You cannot provide both :serviceToCustomer and :service_to_customer' if attributes.key?(:'serviceToCustomer') && attributes.key?(:'service_to_customer')

      self.service_to_customer = attributes[:'service_to_customer'] if attributes[:'service_to_customer']

      self.service_to_contact = attributes[:'serviceToContact'] if attributes[:'serviceToContact']

      raise 'You cannot provide both :serviceToContact and :service_to_contact' if attributes.key?(:'serviceToContact') && attributes.key?(:'service_to_contact')

      self.service_to_contact = attributes[:'service_to_contact'] if attributes[:'service_to_contact']

      self.service_to_address = attributes[:'serviceToAddress'] if attributes[:'serviceToAddress']

      raise 'You cannot provide both :serviceToAddress and :service_to_address' if attributes.key?(:'serviceToAddress') && attributes.key?(:'service_to_address')

      self.service_to_address = attributes[:'service_to_address'] if attributes[:'service_to_address']

      self.sold_to_customer = attributes[:'soldToCustomer'] if attributes[:'soldToCustomer']

      raise 'You cannot provide both :soldToCustomer and :sold_to_customer' if attributes.key?(:'soldToCustomer') && attributes.key?(:'sold_to_customer')

      self.sold_to_customer = attributes[:'sold_to_customer'] if attributes[:'sold_to_customer']

      self.sold_to_contact = attributes[:'soldToContact'] if attributes[:'soldToContact']

      raise 'You cannot provide both :soldToContact and :sold_to_contact' if attributes.key?(:'soldToContact') && attributes.key?(:'sold_to_contact')

      self.sold_to_contact = attributes[:'sold_to_contact'] if attributes[:'sold_to_contact']

      self.end_user_customer = attributes[:'endUserCustomer'] if attributes[:'endUserCustomer']

      raise 'You cannot provide both :endUserCustomer and :end_user_customer' if attributes.key?(:'endUserCustomer') && attributes.key?(:'end_user_customer')

      self.end_user_customer = attributes[:'end_user_customer'] if attributes[:'end_user_customer']

      self.end_user_contact = attributes[:'endUserContact'] if attributes[:'endUserContact']

      raise 'You cannot provide both :endUserContact and :end_user_contact' if attributes.key?(:'endUserContact') && attributes.key?(:'end_user_contact')

      self.end_user_contact = attributes[:'end_user_contact'] if attributes[:'end_user_contact']

      self.end_user_address = attributes[:'endUserAddress'] if attributes[:'endUserAddress']

      raise 'You cannot provide both :endUserAddress and :end_user_address' if attributes.key?(:'endUserAddress') && attributes.key?(:'end_user_address')

      self.end_user_address = attributes[:'end_user_address'] if attributes[:'end_user_address']

      self.reseller_customer = attributes[:'resellerCustomer'] if attributes[:'resellerCustomer']

      raise 'You cannot provide both :resellerCustomer and :reseller_customer' if attributes.key?(:'resellerCustomer') && attributes.key?(:'reseller_customer')

      self.reseller_customer = attributes[:'reseller_customer'] if attributes[:'reseller_customer']

      self.reseller_contact = attributes[:'resellerContact'] if attributes[:'resellerContact']

      raise 'You cannot provide both :resellerContact and :reseller_contact' if attributes.key?(:'resellerContact') && attributes.key?(:'reseller_contact')

      self.reseller_contact = attributes[:'reseller_contact'] if attributes[:'reseller_contact']

      self.reseller_address = attributes[:'resellerAddress'] if attributes[:'resellerAddress']

      raise 'You cannot provide both :resellerAddress and :reseller_address' if attributes.key?(:'resellerAddress') && attributes.key?(:'reseller_address')

      self.reseller_address = attributes[:'reseller_address'] if attributes[:'reseller_address']

      self.csi = attributes[:'csi'] if attributes[:'csi']

      self.customer_transaction_reference = attributes[:'customerTransactionReference'] if attributes[:'customerTransactionReference']

      raise 'You cannot provide both :customerTransactionReference and :customer_transaction_reference' if attributes.key?(:'customerTransactionReference') && attributes.key?(:'customer_transaction_reference')

      self.customer_transaction_reference = attributes[:'customer_transaction_reference'] if attributes[:'customer_transaction_reference']

      self.partner_credit_amount = attributes[:'partnerCreditAmount'] if attributes[:'partnerCreditAmount']

      raise 'You cannot provide both :partnerCreditAmount and :partner_credit_amount' if attributes.key?(:'partnerCreditAmount') && attributes.key?(:'partner_credit_amount')

      self.partner_credit_amount = attributes[:'partner_credit_amount'] if attributes[:'partner_credit_amount']

      self.is_single_rate_card = attributes[:'isSingleRateCard'] unless attributes[:'isSingleRateCard'].nil?

      raise 'You cannot provide both :isSingleRateCard and :is_single_rate_card' if attributes.key?(:'isSingleRateCard') && attributes.key?(:'is_single_rate_card')

      self.is_single_rate_card = attributes[:'is_single_rate_card'] unless attributes[:'is_single_rate_card'].nil?

      self.agreement_id = attributes[:'agreementId'] if attributes[:'agreementId']

      raise 'You cannot provide both :agreementId and :agreement_id' if attributes.key?(:'agreementId') && attributes.key?(:'agreement_id')

      self.agreement_id = attributes[:'agreement_id'] if attributes[:'agreement_id']

      self.agreement_name = attributes[:'agreementName'] if attributes[:'agreementName']

      raise 'You cannot provide both :agreementName and :agreement_name' if attributes.key?(:'agreementName') && attributes.key?(:'agreement_name')

      self.agreement_name = attributes[:'agreement_name'] if attributes[:'agreement_name']

      self.agreement_type = attributes[:'agreementType'] if attributes[:'agreementType']

      raise 'You cannot provide both :agreementType and :agreement_type' if attributes.key?(:'agreementType') && attributes.key?(:'agreement_type')

      self.agreement_type = attributes[:'agreement_type'] if attributes[:'agreement_type']

      self.billing_frequency = attributes[:'billingFrequency'] if attributes[:'billingFrequency']

      raise 'You cannot provide both :billingFrequency and :billing_frequency' if attributes.key?(:'billingFrequency') && attributes.key?(:'billing_frequency')

      self.billing_frequency = attributes[:'billing_frequency'] if attributes[:'billing_frequency']

      self.time_welcome_email_sent = attributes[:'timeWelcomeEmailSent'] if attributes[:'timeWelcomeEmailSent']

      raise 'You cannot provide both :timeWelcomeEmailSent and :time_welcome_email_sent' if attributes.key?(:'timeWelcomeEmailSent') && attributes.key?(:'time_welcome_email_sent')

      self.time_welcome_email_sent = attributes[:'time_welcome_email_sent'] if attributes[:'time_welcome_email_sent']

      self.time_service_configuration_email_sent = attributes[:'timeServiceConfigurationEmailSent'] if attributes[:'timeServiceConfigurationEmailSent']

      raise 'You cannot provide both :timeServiceConfigurationEmailSent and :time_service_configuration_email_sent' if attributes.key?(:'timeServiceConfigurationEmailSent') && attributes.key?(:'time_service_configuration_email_sent')

      self.time_service_configuration_email_sent = attributes[:'time_service_configuration_email_sent'] if attributes[:'time_service_configuration_email_sent']

      self.time_customer_config = attributes[:'timeCustomerConfig'] if attributes[:'timeCustomerConfig']

      raise 'You cannot provide both :timeCustomerConfig and :time_customer_config' if attributes.key?(:'timeCustomerConfig') && attributes.key?(:'time_customer_config')

      self.time_customer_config = attributes[:'time_customer_config'] if attributes[:'time_customer_config']

      self.time_agreement_end = attributes[:'timeAgreementEnd'] if attributes[:'timeAgreementEnd']

      raise 'You cannot provide both :timeAgreementEnd and :time_agreement_end' if attributes.key?(:'timeAgreementEnd') && attributes.key?(:'time_agreement_end')

      self.time_agreement_end = attributes[:'time_agreement_end'] if attributes[:'time_agreement_end']

      self.commitment_services = attributes[:'commitmentServices'] if attributes[:'commitmentServices']

      raise 'You cannot provide both :commitmentServices and :commitment_services' if attributes.key?(:'commitmentServices') && attributes.key?(:'commitment_services')

      self.commitment_services = attributes[:'commitment_services'] if attributes[:'commitment_services']

      self.rate_cards = attributes[:'rateCards'] if attributes[:'rateCards']

      raise 'You cannot provide both :rateCards and :rate_cards' if attributes.key?(:'rateCards') && attributes.key?(:'rate_cards')

      self.rate_cards = attributes[:'rate_cards'] if attributes[:'rate_cards']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.updated_by = attributes[:'updatedBy'] if attributes[:'updatedBy']

      raise 'You cannot provide both :updatedBy and :updated_by' if attributes.key?(:'updatedBy') && attributes.key?(:'updated_by')

      self.updated_by = attributes[:'updated_by'] if attributes[:'updated_by']

      self.ratecard_type = attributes[:'ratecardType'] if attributes[:'ratecardType']

      raise 'You cannot provide both :ratecardType and :ratecard_type' if attributes.key?(:'ratecardType') && attributes.key?(:'ratecard_type')

      self.ratecard_type = attributes[:'ratecard_type'] if attributes[:'ratecard_type']
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
        type == other.type &&
        serial_number == other.serial_number &&
        subscription_id == other.subscription_id &&
        product == other.product &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        quantity == other.quantity &&
        status == other.status &&
        operation_type == other.operation_type &&
        net_unit_price == other.net_unit_price &&
        price_period == other.price_period &&
        line_net_amount == other.line_net_amount &&
        is_variable_commitment == other.is_variable_commitment &&
        is_allowance == other.is_allowance &&
        used_amount == other.used_amount &&
        available_amount == other.available_amount &&
        funded_allocation_value == other.funded_allocation_value &&
        is_having_usage == other.is_having_usage &&
        is_cap_to_price_list == other.is_cap_to_price_list &&
        credit_percentage == other.credit_percentage &&
        partner_transaction_type == other.partner_transaction_type &&
        is_credit_enabled == other.is_credit_enabled &&
        overage_policy == other.overage_policy &&
        overage_bill_to == other.overage_bill_to &&
        payg_policy == other.payg_policy &&
        promo_order_line_id == other.promo_order_line_id &&
        promotion_pricing_type == other.promotion_pricing_type &&
        rate_card_discount_percentage == other.rate_card_discount_percentage &&
        overage_discount_percentage == other.overage_discount_percentage &&
        bill_to_customer == other.bill_to_customer &&
        bill_to_contact == other.bill_to_contact &&
        bill_to_address == other.bill_to_address &&
        payment_number == other.payment_number &&
        time_payment_expiry == other.time_payment_expiry &&
        payment_term == other.payment_term &&
        payment_method == other.payment_method &&
        transaction_extension_id == other.transaction_extension_id &&
        sales_channel == other.sales_channel &&
        eligible_to_renew == other.eligible_to_renew &&
        renewed_subscribed_service_id == other.renewed_subscribed_service_id &&
        term_value == other.term_value &&
        term_value_uom == other.term_value_uom &&
        renewal_opty_id == other.renewal_opty_id &&
        renewal_opty_number == other.renewal_opty_number &&
        renewal_opty_type == other.renewal_opty_type &&
        booking_opty_number == other.booking_opty_number &&
        revenue_line_id == other.revenue_line_id &&
        revenue_line_number == other.revenue_line_number &&
        major_set == other.major_set &&
        time_majorset_start == other.time_majorset_start &&
        time_majorset_end == other.time_majorset_end &&
        system_arr_in_lc == other.system_arr_in_lc &&
        system_arr_in_sc == other.system_arr_in_sc &&
        system_atr_arr_in_lc == other.system_atr_arr_in_lc &&
        system_atr_arr_in_sc == other.system_atr_arr_in_sc &&
        revised_arr_in_lc == other.revised_arr_in_lc &&
        revised_arr_in_sc == other.revised_arr_in_sc &&
        total_value == other.total_value &&
        original_promo_amount == other.original_promo_amount &&
        order_header_id == other.order_header_id &&
        order_number == other.order_number &&
        order_type == other.order_type &&
        order_line_id == other.order_line_id &&
        order_line_number == other.order_line_number &&
        commitment_schedule_id == other.commitment_schedule_id &&
        sales_account_party_id == other.sales_account_party_id &&
        data_center == other.data_center &&
        data_center_region == other.data_center_region &&
        admin_email == other.admin_email &&
        buyer_email == other.buyer_email &&
        subscription_source == other.subscription_source &&
        provisioning_source == other.provisioning_source &&
        fulfillment_set == other.fulfillment_set &&
        is_intent_to_pay == other.is_intent_to_pay &&
        is_payg == other.is_payg &&
        pricing_model == other.pricing_model &&
        program_type == other.program_type &&
        start_date_type == other.start_date_type &&
        time_provisioned == other.time_provisioned &&
        promo_type == other.promo_type &&
        service_to_customer == other.service_to_customer &&
        service_to_contact == other.service_to_contact &&
        service_to_address == other.service_to_address &&
        sold_to_customer == other.sold_to_customer &&
        sold_to_contact == other.sold_to_contact &&
        end_user_customer == other.end_user_customer &&
        end_user_contact == other.end_user_contact &&
        end_user_address == other.end_user_address &&
        reseller_customer == other.reseller_customer &&
        reseller_contact == other.reseller_contact &&
        reseller_address == other.reseller_address &&
        csi == other.csi &&
        customer_transaction_reference == other.customer_transaction_reference &&
        partner_credit_amount == other.partner_credit_amount &&
        is_single_rate_card == other.is_single_rate_card &&
        agreement_id == other.agreement_id &&
        agreement_name == other.agreement_name &&
        agreement_type == other.agreement_type &&
        billing_frequency == other.billing_frequency &&
        time_welcome_email_sent == other.time_welcome_email_sent &&
        time_service_configuration_email_sent == other.time_service_configuration_email_sent &&
        time_customer_config == other.time_customer_config &&
        time_agreement_end == other.time_agreement_end &&
        commitment_services == other.commitment_services &&
        rate_cards == other.rate_cards &&
        time_created == other.time_created &&
        created_by == other.created_by &&
        time_updated == other.time_updated &&
        updated_by == other.updated_by &&
        ratecard_type == other.ratecard_type
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
      [id, type, serial_number, subscription_id, product, time_start, time_end, quantity, status, operation_type, net_unit_price, price_period, line_net_amount, is_variable_commitment, is_allowance, used_amount, available_amount, funded_allocation_value, is_having_usage, is_cap_to_price_list, credit_percentage, partner_transaction_type, is_credit_enabled, overage_policy, overage_bill_to, payg_policy, promo_order_line_id, promotion_pricing_type, rate_card_discount_percentage, overage_discount_percentage, bill_to_customer, bill_to_contact, bill_to_address, payment_number, time_payment_expiry, payment_term, payment_method, transaction_extension_id, sales_channel, eligible_to_renew, renewed_subscribed_service_id, term_value, term_value_uom, renewal_opty_id, renewal_opty_number, renewal_opty_type, booking_opty_number, revenue_line_id, revenue_line_number, major_set, time_majorset_start, time_majorset_end, system_arr_in_lc, system_arr_in_sc, system_atr_arr_in_lc, system_atr_arr_in_sc, revised_arr_in_lc, revised_arr_in_sc, total_value, original_promo_amount, order_header_id, order_number, order_type, order_line_id, order_line_number, commitment_schedule_id, sales_account_party_id, data_center, data_center_region, admin_email, buyer_email, subscription_source, provisioning_source, fulfillment_set, is_intent_to_pay, is_payg, pricing_model, program_type, start_date_type, time_provisioned, promo_type, service_to_customer, service_to_contact, service_to_address, sold_to_customer, sold_to_contact, end_user_customer, end_user_contact, end_user_address, reseller_customer, reseller_contact, reseller_address, csi, customer_transaction_reference, partner_credit_amount, is_single_rate_card, agreement_id, agreement_name, agreement_type, billing_frequency, time_welcome_email_sent, time_service_configuration_email_sent, time_customer_config, time_agreement_end, commitment_services, rate_cards, time_created, created_by, time_updated, updated_by, ratecard_type].hash
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
