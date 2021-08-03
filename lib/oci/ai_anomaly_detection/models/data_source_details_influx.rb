# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'data_source_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Data Source details for influx.
  class AiAnomalyDetection::Models::DataSourceDetailsInflux < AiAnomalyDetection::Models::DataSourceDetails
    # This attribute is required.
    # @return [OCI::AiAnomalyDetection::Models::InfluxDetails]
    attr_accessor :version_specific_details

    # **[Required]** Username for connection to Influx
    # @return [String]
    attr_accessor :user_name

    # **[Required]** Password Secret Id for the influx connection
    # @return [String]
    attr_accessor :password_secret_id

    # **[Required]** Measurement name for influx
    # @return [String]
    attr_accessor :measurement_name

    # **[Required]** public IP address and port to influx DB
    # @return [String]
    attr_accessor :url

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'data_source_type': :'dataSourceType',
        'version_specific_details': :'versionSpecificDetails',
        'user_name': :'userName',
        'password_secret_id': :'passwordSecretId',
        'measurement_name': :'measurementName',
        'url': :'url'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'data_source_type': :'String',
        'version_specific_details': :'OCI::AiAnomalyDetection::Models::InfluxDetails',
        'user_name': :'String',
        'password_secret_id': :'String',
        'measurement_name': :'String',
        'url': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::AiAnomalyDetection::Models::InfluxDetails] :version_specific_details The value to assign to the {#version_specific_details} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [String] :password_secret_id The value to assign to the {#password_secret_id} property
    # @option attributes [String] :measurement_name The value to assign to the {#measurement_name} property
    # @option attributes [String] :url The value to assign to the {#url} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['dataSourceType'] = 'INFLUX'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.version_specific_details = attributes[:'versionSpecificDetails'] if attributes[:'versionSpecificDetails']

      raise 'You cannot provide both :versionSpecificDetails and :version_specific_details' if attributes.key?(:'versionSpecificDetails') && attributes.key?(:'version_specific_details')

      self.version_specific_details = attributes[:'version_specific_details'] if attributes[:'version_specific_details']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.password_secret_id = attributes[:'passwordSecretId'] if attributes[:'passwordSecretId']

      raise 'You cannot provide both :passwordSecretId and :password_secret_id' if attributes.key?(:'passwordSecretId') && attributes.key?(:'password_secret_id')

      self.password_secret_id = attributes[:'password_secret_id'] if attributes[:'password_secret_id']

      self.measurement_name = attributes[:'measurementName'] if attributes[:'measurementName']

      raise 'You cannot provide both :measurementName and :measurement_name' if attributes.key?(:'measurementName') && attributes.key?(:'measurement_name')

      self.measurement_name = attributes[:'measurement_name'] if attributes[:'measurement_name']

      self.url = attributes[:'url'] if attributes[:'url']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        data_source_type == other.data_source_type &&
        version_specific_details == other.version_specific_details &&
        user_name == other.user_name &&
        password_secret_id == other.password_secret_id &&
        measurement_name == other.measurement_name &&
        url == other.url
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
      [data_source_type, version_specific_details, user_name, password_secret_id, measurement_name, url].hash
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
