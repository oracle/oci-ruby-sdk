# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220915
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The real-time DbSystem configuration that customers can use for getting access to the PostgreSQL instance.
  #
  class Psql::Models::ConnectionDetails
    # **[Required]** The CA certificate to be used by the Posgresql client to connect to the database.
    # The CA certificate is used to authenticate the server identity.
    # It is issued by PostgreSQL Service Private CA.
    #
    # @return [String]
    attr_accessor :ca_certificate

    # This attribute is required.
    # @return [OCI::Psql::Models::Endpoint]
    attr_accessor :primary_db_endpoint

    # **[Required]** The list of DbInstance endpoints in the DbSystem.
    # @return [Array<OCI::Psql::Models::DbInstanceEndpoint>]
    attr_accessor :instance_endpoints

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'ca_certificate': :'caCertificate',
        'primary_db_endpoint': :'primaryDbEndpoint',
        'instance_endpoints': :'instanceEndpoints'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'ca_certificate': :'String',
        'primary_db_endpoint': :'OCI::Psql::Models::Endpoint',
        'instance_endpoints': :'Array<OCI::Psql::Models::DbInstanceEndpoint>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :ca_certificate The value to assign to the {#ca_certificate} property
    # @option attributes [OCI::Psql::Models::Endpoint] :primary_db_endpoint The value to assign to the {#primary_db_endpoint} property
    # @option attributes [Array<OCI::Psql::Models::DbInstanceEndpoint>] :instance_endpoints The value to assign to the {#instance_endpoints} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.ca_certificate = attributes[:'caCertificate'] if attributes[:'caCertificate']

      raise 'You cannot provide both :caCertificate and :ca_certificate' if attributes.key?(:'caCertificate') && attributes.key?(:'ca_certificate')

      self.ca_certificate = attributes[:'ca_certificate'] if attributes[:'ca_certificate']

      self.primary_db_endpoint = attributes[:'primaryDbEndpoint'] if attributes[:'primaryDbEndpoint']

      raise 'You cannot provide both :primaryDbEndpoint and :primary_db_endpoint' if attributes.key?(:'primaryDbEndpoint') && attributes.key?(:'primary_db_endpoint')

      self.primary_db_endpoint = attributes[:'primary_db_endpoint'] if attributes[:'primary_db_endpoint']

      self.instance_endpoints = attributes[:'instanceEndpoints'] if attributes[:'instanceEndpoints']

      raise 'You cannot provide both :instanceEndpoints and :instance_endpoints' if attributes.key?(:'instanceEndpoints') && attributes.key?(:'instance_endpoints')

      self.instance_endpoints = attributes[:'instance_endpoints'] if attributes[:'instance_endpoints']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        ca_certificate == other.ca_certificate &&
        primary_db_endpoint == other.primary_db_endpoint &&
        instance_endpoints == other.instance_endpoints
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
      [ca_certificate, primary_db_endpoint, instance_endpoints].hash
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
