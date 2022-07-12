# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Connection details to connect to the database. HostName, protocol, and port should be specified.
  class StackMonitoring::Models::ConnectionDetails
    PROTOCOL_ENUM = [
      PROTOCOL_TCP = 'TCP'.freeze,
      PROTOCOL_TCPS = 'TCPS'.freeze,
      PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Protocol used in DB connection string when connecting to external database service.
    # @return [String]
    attr_reader :protocol

    # **[Required]** Listener Port number used for connection requests.
    # @return [Integer]
    attr_accessor :port

    # Database connector Identifier
    # @return [String]
    attr_accessor :connector_id

    # **[Required]** Service name used for connection requests.
    # @return [String]
    attr_accessor :service_name

    # UniqueName used for database connection requests.
    # @return [String]
    attr_accessor :db_unique_name

    # dbId of the database
    # @return [String]
    attr_accessor :db_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'protocol',
        'port': :'port',
        'connector_id': :'connectorId',
        'service_name': :'serviceName',
        'db_unique_name': :'dbUniqueName',
        'db_id': :'dbId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'String',
        'port': :'Integer',
        'connector_id': :'String',
        'service_name': :'String',
        'db_unique_name': :'String',
        'db_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [String] :connector_id The value to assign to the {#connector_id} property
    # @option attributes [String] :service_name The value to assign to the {#service_name} property
    # @option attributes [String] :db_unique_name The value to assign to the {#db_unique_name} property
    # @option attributes [String] :db_id The value to assign to the {#db_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.port = attributes[:'port'] if attributes[:'port']

      self.connector_id = attributes[:'connectorId'] if attributes[:'connectorId']

      raise 'You cannot provide both :connectorId and :connector_id' if attributes.key?(:'connectorId') && attributes.key?(:'connector_id')

      self.connector_id = attributes[:'connector_id'] if attributes[:'connector_id']

      self.service_name = attributes[:'serviceName'] if attributes[:'serviceName']

      raise 'You cannot provide both :serviceName and :service_name' if attributes.key?(:'serviceName') && attributes.key?(:'service_name')

      self.service_name = attributes[:'service_name'] if attributes[:'service_name']

      self.db_unique_name = attributes[:'dbUniqueName'] if attributes[:'dbUniqueName']

      raise 'You cannot provide both :dbUniqueName and :db_unique_name' if attributes.key?(:'dbUniqueName') && attributes.key?(:'db_unique_name')

      self.db_unique_name = attributes[:'db_unique_name'] if attributes[:'db_unique_name']

      self.db_id = attributes[:'dbId'] if attributes[:'dbId']

      raise 'You cannot provide both :dbId and :db_id' if attributes.key?(:'dbId') && attributes.key?(:'db_id')

      self.db_id = attributes[:'db_id'] if attributes[:'db_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protocol Object to be assigned
    def protocol=(protocol)
      # rubocop:disable Style/ConditionalAssignment
      if protocol && !PROTOCOL_ENUM.include?(protocol)
        OCI.logger.debug("Unknown value for 'protocol' [" + protocol + "]. Mapping to 'PROTOCOL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protocol = PROTOCOL_UNKNOWN_ENUM_VALUE
      else
        @protocol = protocol
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        protocol == other.protocol &&
        port == other.port &&
        connector_id == other.connector_id &&
        service_name == other.service_name &&
        db_unique_name == other.db_unique_name &&
        db_id == other.db_id
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
      [protocol, port, connector_id, service_name, db_unique_name, db_id].hash
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
