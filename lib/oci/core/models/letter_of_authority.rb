# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Letter of Authority for the cross-connect. You must submit this letter when
  # requesting cabling for the cross-connect at the FastConnect location.
  #
  class Core::Models::LetterOfAuthority
    CIRCUIT_TYPE_ENUM = [
      CIRCUIT_TYPE_SINGLE_MODE_LC = 'Single_mode_LC'.freeze,
      CIRCUIT_TYPE_SINGLE_MODE_SC = 'Single_mode_SC'.freeze,
      CIRCUIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of the entity authorized by this Letter of Authority.
    # @return [String]
    attr_accessor :authorized_entity_name

    # The type of cross-connect fiber, termination, and optical specification.
    # @return [String]
    attr_reader :circuit_type

    # The OCID of the cross-connect.
    # @return [String]
    attr_accessor :cross_connect_id

    # The address of the FastConnect location.
    # @return [String]
    attr_accessor :facility_location

    # The meet-me room port for this cross-connect.
    # @return [String]
    attr_accessor :port_name

    # The date and time when the Letter of Authority expires, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_expires

    # The date and time the Letter of Authority was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_issued

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'authorized_entity_name': :'authorizedEntityName',
        'circuit_type': :'circuitType',
        'cross_connect_id': :'crossConnectId',
        'facility_location': :'facilityLocation',
        'port_name': :'portName',
        'time_expires': :'timeExpires',
        'time_issued': :'timeIssued'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'authorized_entity_name': :'String',
        'circuit_type': :'String',
        'cross_connect_id': :'String',
        'facility_location': :'String',
        'port_name': :'String',
        'time_expires': :'DateTime',
        'time_issued': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :authorized_entity_name The value to assign to the {#authorized_entity_name} property
    # @option attributes [String] :circuit_type The value to assign to the {#circuit_type} property
    # @option attributes [String] :cross_connect_id The value to assign to the {#cross_connect_id} property
    # @option attributes [String] :facility_location The value to assign to the {#facility_location} property
    # @option attributes [String] :port_name The value to assign to the {#port_name} property
    # @option attributes [DateTime] :time_expires The value to assign to the {#time_expires} property
    # @option attributes [DateTime] :time_issued The value to assign to the {#time_issued} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.authorized_entity_name = attributes[:'authorizedEntityName'] if attributes[:'authorizedEntityName']

      raise 'You cannot provide both :authorizedEntityName and :authorized_entity_name' if attributes.key?(:'authorizedEntityName') && attributes.key?(:'authorized_entity_name')

      self.authorized_entity_name = attributes[:'authorized_entity_name'] if attributes[:'authorized_entity_name']

      self.circuit_type = attributes[:'circuitType'] if attributes[:'circuitType']

      raise 'You cannot provide both :circuitType and :circuit_type' if attributes.key?(:'circuitType') && attributes.key?(:'circuit_type')

      self.circuit_type = attributes[:'circuit_type'] if attributes[:'circuit_type']

      self.cross_connect_id = attributes[:'crossConnectId'] if attributes[:'crossConnectId']

      raise 'You cannot provide both :crossConnectId and :cross_connect_id' if attributes.key?(:'crossConnectId') && attributes.key?(:'cross_connect_id')

      self.cross_connect_id = attributes[:'cross_connect_id'] if attributes[:'cross_connect_id']

      self.facility_location = attributes[:'facilityLocation'] if attributes[:'facilityLocation']

      raise 'You cannot provide both :facilityLocation and :facility_location' if attributes.key?(:'facilityLocation') && attributes.key?(:'facility_location')

      self.facility_location = attributes[:'facility_location'] if attributes[:'facility_location']

      self.port_name = attributes[:'portName'] if attributes[:'portName']

      raise 'You cannot provide both :portName and :port_name' if attributes.key?(:'portName') && attributes.key?(:'port_name')

      self.port_name = attributes[:'port_name'] if attributes[:'port_name']

      self.time_expires = attributes[:'timeExpires'] if attributes[:'timeExpires']

      raise 'You cannot provide both :timeExpires and :time_expires' if attributes.key?(:'timeExpires') && attributes.key?(:'time_expires')

      self.time_expires = attributes[:'time_expires'] if attributes[:'time_expires']

      self.time_issued = attributes[:'timeIssued'] if attributes[:'timeIssued']

      raise 'You cannot provide both :timeIssued and :time_issued' if attributes.key?(:'timeIssued') && attributes.key?(:'time_issued')

      self.time_issued = attributes[:'time_issued'] if attributes[:'time_issued']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] circuit_type Object to be assigned
    def circuit_type=(circuit_type)
      # rubocop:disable Style/ConditionalAssignment
      if circuit_type && !CIRCUIT_TYPE_ENUM.include?(circuit_type)
        OCI.logger.debug("Unknown value for 'circuit_type' [" + circuit_type + "]. Mapping to 'CIRCUIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @circuit_type = CIRCUIT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @circuit_type = circuit_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        authorized_entity_name == other.authorized_entity_name &&
        circuit_type == other.circuit_type &&
        cross_connect_id == other.cross_connect_id &&
        facility_location == other.facility_location &&
        port_name == other.port_name &&
        time_expires == other.time_expires &&
        time_issued == other.time_issued
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
      [authorized_entity_name, circuit_type, cross_connect_id, facility_location, port_name, time_expires, time_issued].hash
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
