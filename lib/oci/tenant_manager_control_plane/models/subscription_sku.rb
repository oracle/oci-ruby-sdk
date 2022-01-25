# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SKU information.
  class TenantManagerControlPlane::Models::SubscriptionSku
    # **[Required]** Stock keeping unit ID.
    # @return [String]
    attr_accessor :sku

    # Quantity of the stock units.
    # @return [Integer]
    attr_accessor :quantity

    # Description of the stock units.
    # @return [String]
    attr_accessor :description

    # Sales order line identifier.
    # @return [String]
    attr_accessor :gsi_order_line_id

    # Description of the covered product belonging to this SKU.
    # @return [String]
    attr_accessor :license_part_description

    # Base metric for billing the service.
    # @return [String]
    attr_accessor :metric_name

    # Denotes if the SKU is considered as a parent or child.
    # @return [BOOLEAN]
    attr_accessor :is_base_service_component

    # Denotes if an additional test instance can be provisioned by the SAAS application.
    # @return [BOOLEAN]
    attr_accessor :is_additional_instance

    # Date-time when the SKU was created.
    # @return [DateTime]
    attr_accessor :start_date

    # Date-time when the SKU ended.
    # @return [DateTime]
    attr_accessor :end_date

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sku': :'sku',
        'quantity': :'quantity',
        'description': :'description',
        'gsi_order_line_id': :'gsiOrderLineId',
        'license_part_description': :'licensePartDescription',
        'metric_name': :'metricName',
        'is_base_service_component': :'isBaseServiceComponent',
        'is_additional_instance': :'isAdditionalInstance',
        'start_date': :'startDate',
        'end_date': :'endDate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sku': :'String',
        'quantity': :'Integer',
        'description': :'String',
        'gsi_order_line_id': :'String',
        'license_part_description': :'String',
        'metric_name': :'String',
        'is_base_service_component': :'BOOLEAN',
        'is_additional_instance': :'BOOLEAN',
        'start_date': :'DateTime',
        'end_date': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sku The value to assign to the {#sku} property
    # @option attributes [Integer] :quantity The value to assign to the {#quantity} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :gsi_order_line_id The value to assign to the {#gsi_order_line_id} property
    # @option attributes [String] :license_part_description The value to assign to the {#license_part_description} property
    # @option attributes [String] :metric_name The value to assign to the {#metric_name} property
    # @option attributes [BOOLEAN] :is_base_service_component The value to assign to the {#is_base_service_component} property
    # @option attributes [BOOLEAN] :is_additional_instance The value to assign to the {#is_additional_instance} property
    # @option attributes [DateTime] :start_date The value to assign to the {#start_date} property
    # @option attributes [DateTime] :end_date The value to assign to the {#end_date} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sku = attributes[:'sku'] if attributes[:'sku']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.description = attributes[:'description'] if attributes[:'description']

      self.gsi_order_line_id = attributes[:'gsiOrderLineId'] if attributes[:'gsiOrderLineId']

      raise 'You cannot provide both :gsiOrderLineId and :gsi_order_line_id' if attributes.key?(:'gsiOrderLineId') && attributes.key?(:'gsi_order_line_id')

      self.gsi_order_line_id = attributes[:'gsi_order_line_id'] if attributes[:'gsi_order_line_id']

      self.license_part_description = attributes[:'licensePartDescription'] if attributes[:'licensePartDescription']

      raise 'You cannot provide both :licensePartDescription and :license_part_description' if attributes.key?(:'licensePartDescription') && attributes.key?(:'license_part_description')

      self.license_part_description = attributes[:'license_part_description'] if attributes[:'license_part_description']

      self.metric_name = attributes[:'metricName'] if attributes[:'metricName']

      raise 'You cannot provide both :metricName and :metric_name' if attributes.key?(:'metricName') && attributes.key?(:'metric_name')

      self.metric_name = attributes[:'metric_name'] if attributes[:'metric_name']

      self.is_base_service_component = attributes[:'isBaseServiceComponent'] unless attributes[:'isBaseServiceComponent'].nil?
      self.is_base_service_component = false if is_base_service_component.nil? && !attributes.key?(:'isBaseServiceComponent') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBaseServiceComponent and :is_base_service_component' if attributes.key?(:'isBaseServiceComponent') && attributes.key?(:'is_base_service_component')

      self.is_base_service_component = attributes[:'is_base_service_component'] unless attributes[:'is_base_service_component'].nil?
      self.is_base_service_component = false if is_base_service_component.nil? && !attributes.key?(:'isBaseServiceComponent') && !attributes.key?(:'is_base_service_component') # rubocop:disable Style/StringLiterals

      self.is_additional_instance = attributes[:'isAdditionalInstance'] unless attributes[:'isAdditionalInstance'].nil?
      self.is_additional_instance = false if is_additional_instance.nil? && !attributes.key?(:'isAdditionalInstance') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAdditionalInstance and :is_additional_instance' if attributes.key?(:'isAdditionalInstance') && attributes.key?(:'is_additional_instance')

      self.is_additional_instance = attributes[:'is_additional_instance'] unless attributes[:'is_additional_instance'].nil?
      self.is_additional_instance = false if is_additional_instance.nil? && !attributes.key?(:'isAdditionalInstance') && !attributes.key?(:'is_additional_instance') # rubocop:disable Style/StringLiterals

      self.start_date = attributes[:'startDate'] if attributes[:'startDate']

      raise 'You cannot provide both :startDate and :start_date' if attributes.key?(:'startDate') && attributes.key?(:'start_date')

      self.start_date = attributes[:'start_date'] if attributes[:'start_date']

      self.end_date = attributes[:'endDate'] if attributes[:'endDate']

      raise 'You cannot provide both :endDate and :end_date' if attributes.key?(:'endDate') && attributes.key?(:'end_date')

      self.end_date = attributes[:'end_date'] if attributes[:'end_date']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sku == other.sku &&
        quantity == other.quantity &&
        description == other.description &&
        gsi_order_line_id == other.gsi_order_line_id &&
        license_part_description == other.license_part_description &&
        metric_name == other.metric_name &&
        is_base_service_component == other.is_base_service_component &&
        is_additional_instance == other.is_additional_instance &&
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
      [sku, quantity, description, gsi_order_line_id, license_part_description, metric_name, is_base_service_component, is_additional_instance, start_date, end_date].hash
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
