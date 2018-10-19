# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # A service offering from a supported provider. For more information,
  # see [FastConnect Overview](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/fastconnect.htm).
  #
  class Core::Models::FastConnectProviderService # rubocop:disable Metrics/LineLength
    PRIVATE_PEERING_BGP_MANAGEMENT_ENUM = [
      PRIVATE_PEERING_BGP_MANAGEMENT_CUSTOMER_MANAGED = 'CUSTOMER_MANAGED'.freeze,
      PRIVATE_PEERING_BGP_MANAGEMENT_PROVIDER_MANAGED = 'PROVIDER_MANAGED'.freeze,
      PRIVATE_PEERING_BGP_MANAGEMENT_ORACLE_MANAGED = 'ORACLE_MANAGED'.freeze,
      PRIVATE_PEERING_BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PUBLIC_PEERING_BGP_MANAGEMENT_ENUM = [
      PUBLIC_PEERING_BGP_MANAGEMENT_CUSTOMER_MANAGED = 'CUSTOMER_MANAGED'.freeze,
      PUBLIC_PEERING_BGP_MANAGEMENT_PROVIDER_MANAGED = 'PROVIDER_MANAGED'.freeze,
      PUBLIC_PEERING_BGP_MANAGEMENT_ORACLE_MANAGED = 'ORACLE_MANAGED'.freeze,
      PUBLIC_PEERING_BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SUPPORTED_VIRTUAL_CIRCUIT_TYPES_ENUM = [
      SUPPORTED_VIRTUAL_CIRCUIT_TYPES_PUBLIC = 'PUBLIC'.freeze,
      SUPPORTED_VIRTUAL_CIRCUIT_TYPES_PRIVATE = 'PRIVATE'.freeze,
      SUPPORTED_VIRTUAL_CIRCUIT_TYPES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TYPE_ENUM = [
      TYPE_LAYER2 = 'LAYER2'.freeze,
      TYPE_LAYER3 = 'LAYER3'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # A description of the service offered by the provider.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** The OCID of the service offered by the provider.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Who is responsible for managing the private peering BGP information.
    #
    # @return [String]
    attr_reader :private_peering_bgp_management

    # **[Required]** The name of the provider.
    #
    # @return [String]
    attr_accessor :provider_name

    # **[Required]** The name of the service offered by the provider.
    #
    # @return [String]
    attr_accessor :provider_service_name

    # **[Required]** Who is responsible for managing the public peering BGP information.
    #
    # @return [String]
    attr_reader :public_peering_bgp_management

    # An array of virtual circuit types supported by this service.
    #
    # @return [Array<String>]
    attr_reader :supported_virtual_circuit_types

    # **[Required]** Provider service type.
    #
    # @return [String]
    attr_reader :type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'id': :'id',
        'private_peering_bgp_management': :'privatePeeringBgpManagement',
        'provider_name': :'providerName',
        'provider_service_name': :'providerServiceName',
        'public_peering_bgp_management': :'publicPeeringBgpManagement',
        'supported_virtual_circuit_types': :'supportedVirtualCircuitTypes',
        'type': :'type'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'id': :'String',
        'private_peering_bgp_management': :'String',
        'provider_name': :'String',
        'provider_service_name': :'String',
        'public_peering_bgp_management': :'String',
        'supported_virtual_circuit_types': :'Array<String>',
        'type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :private_peering_bgp_management The value to assign to the {#private_peering_bgp_management} property
    # @option attributes [String] :provider_name The value to assign to the {#provider_name} property
    # @option attributes [String] :provider_service_name The value to assign to the {#provider_service_name} property
    # @option attributes [String] :public_peering_bgp_management The value to assign to the {#public_peering_bgp_management} property
    # @option attributes [Array<String>] :supported_virtual_circuit_types The value to assign to the {#supported_virtual_circuit_types} property
    # @option attributes [String] :type The value to assign to the {#type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.id = attributes[:'id'] if attributes[:'id']

      self.private_peering_bgp_management = attributes[:'privatePeeringBgpManagement'] if attributes[:'privatePeeringBgpManagement']

      raise 'You cannot provide both :privatePeeringBgpManagement and :private_peering_bgp_management' if attributes.key?(:'privatePeeringBgpManagement') && attributes.key?(:'private_peering_bgp_management')

      self.private_peering_bgp_management = attributes[:'private_peering_bgp_management'] if attributes[:'private_peering_bgp_management']

      self.provider_name = attributes[:'providerName'] if attributes[:'providerName']

      raise 'You cannot provide both :providerName and :provider_name' if attributes.key?(:'providerName') && attributes.key?(:'provider_name')

      self.provider_name = attributes[:'provider_name'] if attributes[:'provider_name']

      self.provider_service_name = attributes[:'providerServiceName'] if attributes[:'providerServiceName']

      raise 'You cannot provide both :providerServiceName and :provider_service_name' if attributes.key?(:'providerServiceName') && attributes.key?(:'provider_service_name')

      self.provider_service_name = attributes[:'provider_service_name'] if attributes[:'provider_service_name']

      self.public_peering_bgp_management = attributes[:'publicPeeringBgpManagement'] if attributes[:'publicPeeringBgpManagement']

      raise 'You cannot provide both :publicPeeringBgpManagement and :public_peering_bgp_management' if attributes.key?(:'publicPeeringBgpManagement') && attributes.key?(:'public_peering_bgp_management')

      self.public_peering_bgp_management = attributes[:'public_peering_bgp_management'] if attributes[:'public_peering_bgp_management']

      self.supported_virtual_circuit_types = attributes[:'supportedVirtualCircuitTypes'] if attributes[:'supportedVirtualCircuitTypes']

      raise 'You cannot provide both :supportedVirtualCircuitTypes and :supported_virtual_circuit_types' if attributes.key?(:'supportedVirtualCircuitTypes') && attributes.key?(:'supported_virtual_circuit_types')

      self.supported_virtual_circuit_types = attributes[:'supported_virtual_circuit_types'] if attributes[:'supported_virtual_circuit_types']

      self.type = attributes[:'type'] if attributes[:'type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] private_peering_bgp_management Object to be assigned
    def private_peering_bgp_management=(private_peering_bgp_management)
      # rubocop:disable Style/ConditionalAssignment
      if private_peering_bgp_management && !PRIVATE_PEERING_BGP_MANAGEMENT_ENUM.include?(private_peering_bgp_management)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'private_peering_bgp_management' [" + private_peering_bgp_management + "]. Mapping to 'PRIVATE_PEERING_BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @private_peering_bgp_management = PRIVATE_PEERING_BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE
      else
        @private_peering_bgp_management = private_peering_bgp_management
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] public_peering_bgp_management Object to be assigned
    def public_peering_bgp_management=(public_peering_bgp_management)
      # rubocop:disable Style/ConditionalAssignment
      if public_peering_bgp_management && !PUBLIC_PEERING_BGP_MANAGEMENT_ENUM.include?(public_peering_bgp_management)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'public_peering_bgp_management' [" + public_peering_bgp_management + "]. Mapping to 'PUBLIC_PEERING_BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @public_peering_bgp_management = PUBLIC_PEERING_BGP_MANAGEMENT_UNKNOWN_ENUM_VALUE
      else
        @public_peering_bgp_management = public_peering_bgp_management
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] supported_virtual_circuit_types Object to be assigned
    def supported_virtual_circuit_types=(supported_virtual_circuit_types)
      # rubocop:disable Style/ConditionalAssignment
      if supported_virtual_circuit_types.nil?
        @supported_virtual_circuit_types = nil
      else
        @supported_virtual_circuit_types =
          supported_virtual_circuit_types.collect do |item|
            if SUPPORTED_VIRTUAL_CIRCUIT_TYPES_ENUM.include?(item)
              item
            else
              # rubocop: disable Metrics/LineLength
              OCI.logger.debug("Unknown value for 'supported_virtual_circuit_types' [#{item}]. Mapping to 'SUPPORTED_VIRTUAL_CIRCUIT_TYPES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              # rubocop: enable Metrics/LineLength
              SUPPORTED_VIRTUAL_CIRCUIT_TYPES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        # rubocop: disable Metrics/LineLength
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        # rubocop: enable Metrics/LineLength
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        description == other.description &&
        id == other.id &&
        private_peering_bgp_management == other.private_peering_bgp_management &&
        provider_name == other.provider_name &&
        provider_service_name == other.provider_service_name &&
        public_peering_bgp_management == other.public_peering_bgp_management &&
        supported_virtual_circuit_types == other.supported_virtual_circuit_types &&
        type == other.type
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
      [description, id, private_peering_bgp_management, provider_name, provider_service_name, public_peering_bgp_management, supported_virtual_circuit_types, type].hash
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
