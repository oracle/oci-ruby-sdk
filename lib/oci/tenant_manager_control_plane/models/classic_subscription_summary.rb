# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20230401
require 'date'
require 'logger'
require_relative 'subscription_summary'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of subscription.
  class TenantManagerControlPlane::Models::ClassicSubscriptionSummary < TenantManagerControlPlane::Models::SubscriptionSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Classic subscription ID.
    # @return [String]
    attr_accessor :classic_subscription_id

    # Specifies whether or not the subscription is from classic systems.
    # @return [BOOLEAN]
    attr_accessor :is_classic_subscription

    # The pay model of the subscription, such as 'Pay as you go' or 'Monthly'.
    # @return [String]
    attr_accessor :payment_model

    # Region for the subscription.
    # @return [String]
    attr_accessor :region_assignment

    # Lifecycle state of the subscription.
    # @return [String]
    attr_reader :lifecycle_state

    # Subscription start time.
    # @return [DateTime]
    attr_accessor :start_date

    # Subscription end time.
    # @return [DateTime]
    attr_accessor :end_date

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_version': :'entityVersion',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'service_name': :'serviceName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'classic_subscription_id': :'classicSubscriptionId',
        'is_classic_subscription': :'isClassicSubscription',
        'payment_model': :'paymentModel',
        'region_assignment': :'regionAssignment',
        'lifecycle_state': :'lifecycleState',
        'start_date': :'startDate',
        'end_date': :'endDate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_version': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'service_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'classic_subscription_id': :'String',
        'is_classic_subscription': :'BOOLEAN',
        'payment_model': :'String',
        'region_assignment': :'String',
        'lifecycle_state': :'String',
        'start_date': :'DateTime',
        'end_date': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#compartment_id #compartment_id} proprety
    # @option attributes [String] :service_name The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#service_name #service_name} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#time_updated #time_updated} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::TenantManagerControlPlane::Models::SubscriptionSummary#defined_tags #defined_tags} proprety
    # @option attributes [String] :classic_subscription_id The value to assign to the {#classic_subscription_id} property
    # @option attributes [BOOLEAN] :is_classic_subscription The value to assign to the {#is_classic_subscription} property
    # @option attributes [String] :payment_model The value to assign to the {#payment_model} property
    # @option attributes [String] :region_assignment The value to assign to the {#region_assignment} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :start_date The value to assign to the {#start_date} property
    # @option attributes [DateTime] :end_date The value to assign to the {#end_date} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entityVersion'] = 'V1'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.classic_subscription_id = attributes[:'classicSubscriptionId'] if attributes[:'classicSubscriptionId']

      raise 'You cannot provide both :classicSubscriptionId and :classic_subscription_id' if attributes.key?(:'classicSubscriptionId') && attributes.key?(:'classic_subscription_id')

      self.classic_subscription_id = attributes[:'classic_subscription_id'] if attributes[:'classic_subscription_id']

      self.is_classic_subscription = attributes[:'isClassicSubscription'] unless attributes[:'isClassicSubscription'].nil?
      self.is_classic_subscription = false if is_classic_subscription.nil? && !attributes.key?(:'isClassicSubscription') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isClassicSubscription and :is_classic_subscription' if attributes.key?(:'isClassicSubscription') && attributes.key?(:'is_classic_subscription')

      self.is_classic_subscription = attributes[:'is_classic_subscription'] unless attributes[:'is_classic_subscription'].nil?
      self.is_classic_subscription = false if is_classic_subscription.nil? && !attributes.key?(:'isClassicSubscription') && !attributes.key?(:'is_classic_subscription') # rubocop:disable Style/StringLiterals

      self.payment_model = attributes[:'paymentModel'] if attributes[:'paymentModel']

      raise 'You cannot provide both :paymentModel and :payment_model' if attributes.key?(:'paymentModel') && attributes.key?(:'payment_model')

      self.payment_model = attributes[:'payment_model'] if attributes[:'payment_model']

      self.region_assignment = attributes[:'regionAssignment'] if attributes[:'regionAssignment']

      raise 'You cannot provide both :regionAssignment and :region_assignment' if attributes.key?(:'regionAssignment') && attributes.key?(:'region_assignment')

      self.region_assignment = attributes[:'region_assignment'] if attributes[:'region_assignment']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.start_date = attributes[:'startDate'] if attributes[:'startDate']

      raise 'You cannot provide both :startDate and :start_date' if attributes.key?(:'startDate') && attributes.key?(:'start_date')

      self.start_date = attributes[:'start_date'] if attributes[:'start_date']

      self.end_date = attributes[:'endDate'] if attributes[:'endDate']

      raise 'You cannot provide both :endDate and :end_date' if attributes.key?(:'endDate') && attributes.key?(:'end_date')

      self.end_date = attributes[:'end_date'] if attributes[:'end_date']
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
        entity_version == other.entity_version &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        service_name == other.service_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        classic_subscription_id == other.classic_subscription_id &&
        is_classic_subscription == other.is_classic_subscription &&
        payment_model == other.payment_model &&
        region_assignment == other.region_assignment &&
        lifecycle_state == other.lifecycle_state &&
        start_date == other.start_date &&
        end_date == other.end_date
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
      [entity_version, id, compartment_id, service_name, time_created, time_updated, freeform_tags, defined_tags, classic_subscription_id, is_classic_subscription, payment_model, region_assignment, lifecycle_state, start_date, end_date].hash
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
