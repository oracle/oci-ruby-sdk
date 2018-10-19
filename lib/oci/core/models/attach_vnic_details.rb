# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # AttachVnicDetails model.
  class Core::Models::AttachVnicDetails # rubocop:disable Metrics/LineLength
    # **[Required]** Details for creating a new VNIC.
    #
    # @return [OCI::Core::Models::CreateVnicDetails]
    attr_accessor :create_vnic_details

    # A user-friendly name for the attachment. Does not have to be unique, and it cannot be changed.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the instance.
    # @return [String]
    attr_accessor :instance_id

    # Which physical network interface card (NIC) the VNIC will use. Defaults to 0.
    # Certain bare metal instance shapes have two active physical NICs (0 and 1). If
    # you add a secondary VNIC to one of these instances, you can specify which NIC
    # the VNIC will use. For more information, see
    # [Virtual Network Interface Cards (VNICs)](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingVNICs.htm).
    #
    # @return [Integer]
    attr_accessor :nic_index

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'create_vnic_details': :'createVnicDetails',
        'display_name': :'displayName',
        'instance_id': :'instanceId',
        'nic_index': :'nicIndex'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'create_vnic_details': :'OCI::Core::Models::CreateVnicDetails',
        'display_name': :'String',
        'instance_id': :'String',
        'nic_index': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Core::Models::CreateVnicDetails] :create_vnic_details The value to assign to the {#create_vnic_details} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [Integer] :nic_index The value to assign to the {#nic_index} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.create_vnic_details = attributes[:'createVnicDetails'] if attributes[:'createVnicDetails']

      raise 'You cannot provide both :createVnicDetails and :create_vnic_details' if attributes.key?(:'createVnicDetails') && attributes.key?(:'create_vnic_details')

      self.create_vnic_details = attributes[:'create_vnic_details'] if attributes[:'create_vnic_details']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.nic_index = attributes[:'nicIndex'] if attributes[:'nicIndex']

      raise 'You cannot provide both :nicIndex and :nic_index' if attributes.key?(:'nicIndex') && attributes.key?(:'nic_index')

      self.nic_index = attributes[:'nic_index'] if attributes[:'nic_index']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        create_vnic_details == other.create_vnic_details &&
        display_name == other.display_name &&
        instance_id == other.instance_id &&
        nic_index == other.nic_index
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [create_vnic_details, display_name, instance_id, nic_index].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
