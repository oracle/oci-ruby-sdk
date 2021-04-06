# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The body for defining a new resolver endpoint.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Dns::Models::CreateResolverEndpointDetails
    ENDPOINT_TYPE_ENUM = [
      ENDPOINT_TYPE_VNIC = 'VNIC'.freeze
    ].freeze

    # **[Required]** The name of the resolver endpoint. Must be unique within the resolver.
    #
    # @return [String]
    attr_accessor :name

    # The type of resolver endpoint. VNIC is currently the only supported type.
    #
    # @return [String]
    attr_reader :endpoint_type

    # An IP address from which forwarded queries may be sent. For VNIC endpoints, this IP address must be part
    # of the subnet and will be assigned by the system if unspecified when isForwarding is true.
    #
    # @return [String]
    attr_accessor :forwarding_address

    # **[Required]** A Boolean flag indicating whether or not the resolver endpoint is for forwarding.
    #
    # @return [BOOLEAN]
    attr_accessor :is_forwarding

    # **[Required]** A Boolean flag indicating whether or not the resolver endpoint is for listening.
    #
    # @return [BOOLEAN]
    attr_accessor :is_listening

    # An IP address to listen to queries on. For VNIC endpoints this IP address must be part of the
    # subnet and will be assigned by the system if unspecified.
    #
    # @return [String]
    attr_accessor :listening_address

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'endpoint_type': :'endpointType',
        'forwarding_address': :'forwardingAddress',
        'is_forwarding': :'isForwarding',
        'is_listening': :'isListening',
        'listening_address': :'listeningAddress'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'endpoint_type': :'String',
        'forwarding_address': :'String',
        'is_forwarding': :'BOOLEAN',
        'is_listening': :'BOOLEAN',
        'listening_address': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'endpointType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Dns::Models::CreateResolverVnicEndpointDetails' if type == 'VNIC'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Dns::Models::CreateResolverEndpointDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :endpoint_type The value to assign to the {#endpoint_type} property
    # @option attributes [String] :forwarding_address The value to assign to the {#forwarding_address} property
    # @option attributes [BOOLEAN] :is_forwarding The value to assign to the {#is_forwarding} property
    # @option attributes [BOOLEAN] :is_listening The value to assign to the {#is_listening} property
    # @option attributes [String] :listening_address The value to assign to the {#listening_address} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.endpoint_type = attributes[:'endpointType'] if attributes[:'endpointType']
      self.endpoint_type = "VNIC" if endpoint_type.nil? && !attributes.key?(:'endpointType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :endpointType and :endpoint_type' if attributes.key?(:'endpointType') && attributes.key?(:'endpoint_type')

      self.endpoint_type = attributes[:'endpoint_type'] if attributes[:'endpoint_type']
      self.endpoint_type = "VNIC" if endpoint_type.nil? && !attributes.key?(:'endpointType') && !attributes.key?(:'endpoint_type') # rubocop:disable Style/StringLiterals

      self.forwarding_address = attributes[:'forwardingAddress'] if attributes[:'forwardingAddress']

      raise 'You cannot provide both :forwardingAddress and :forwarding_address' if attributes.key?(:'forwardingAddress') && attributes.key?(:'forwarding_address')

      self.forwarding_address = attributes[:'forwarding_address'] if attributes[:'forwarding_address']

      self.is_forwarding = attributes[:'isForwarding'] unless attributes[:'isForwarding'].nil?

      raise 'You cannot provide both :isForwarding and :is_forwarding' if attributes.key?(:'isForwarding') && attributes.key?(:'is_forwarding')

      self.is_forwarding = attributes[:'is_forwarding'] unless attributes[:'is_forwarding'].nil?

      self.is_listening = attributes[:'isListening'] unless attributes[:'isListening'].nil?

      raise 'You cannot provide both :isListening and :is_listening' if attributes.key?(:'isListening') && attributes.key?(:'is_listening')

      self.is_listening = attributes[:'is_listening'] unless attributes[:'is_listening'].nil?

      self.listening_address = attributes[:'listeningAddress'] if attributes[:'listeningAddress']

      raise 'You cannot provide both :listeningAddress and :listening_address' if attributes.key?(:'listeningAddress') && attributes.key?(:'listening_address')

      self.listening_address = attributes[:'listening_address'] if attributes[:'listening_address']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] endpoint_type Object to be assigned
    def endpoint_type=(endpoint_type)
      raise "Invalid value for 'endpoint_type': this must be one of the values in ENDPOINT_TYPE_ENUM." if endpoint_type && !ENDPOINT_TYPE_ENUM.include?(endpoint_type)

      @endpoint_type = endpoint_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        endpoint_type == other.endpoint_type &&
        forwarding_address == other.forwarding_address &&
        is_forwarding == other.is_forwarding &&
        is_listening == other.is_listening &&
        listening_address == other.listening_address
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
      [name, endpoint_type, forwarding_address, is_forwarding, is_listening, listening_address].hash
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
