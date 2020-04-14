# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A container object for response attributes.
  #
  # Example:
  #
  #   -----
  #     {
  #       \"status\": \"200\",
  #       \"responseTime\": \"2019-09-18T00:10:59.278Z\",
  #       \"headers\": {
  #         \"ETag\": [
  #           \"<unique_ID>\"
  #         ],
  #         \"Connection\": [
  #           \"close\"
  #         ],
  #         \"Content-Length\": [
  #           \"1828\"
  #         ],
  #         \"opc-request-id\": [
  #           \"<unique_ID>\"
  #         ],
  #         \"Date\": [
  #           \"Wed, 18 Sep 2019 00:10:59 GMT\"
  #         ],
  #         \"Content-Type\": [
  #           \"application/json\"
  #         ]
  #       },
  #       \"payload\": {
  #         \"resourceName\": \"my_instance\",
  #         \"id\": \"ocid1.instance.oc1.phx.<unique_ID>\"
  #       },
  #       \"message\": null
  #     }
  #   -----
  #
  class Audit::Models::Response
    # The status code of the response.
    #
    # Example: `200`
    #
    # @return [String]
    attr_accessor :status

    # The time of the response to the audited request, expressed in
    # [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    #
    # Example: `2019-09-18T00:10:59.278Z`
    #
    # @return [DateTime]
    attr_accessor :response_time

    # The headers of the response.
    #
    # Example:
    #
    #   -----
    #     {
    #       \"ETag\": [
    #         \"<unique_ID>\"
    #       ],
    #       \"Connection\": [
    #         \"close\"
    #       ],
    #       \"Content-Length\": [
    #         \"1828\"
    #       ],
    #       \"opc-request-id\": [
    #         \"<unique_ID>\"
    #       ],
    #       \"Date\": [
    #         \"Wed, 18 Sep 2019 00:10:59 GMT\"
    #       ],
    #       \"Content-Type\": [
    #         \"application/json\"
    #       ]
    #     }
    #   -----
    #
    # @return [Hash<String, Array<String>>]
    attr_accessor :headers

    # This value is included for backward compatibility with the Audit version 1 schema, where
    # it contained metadata of interest from the response payload.
    #
    # Example:
    #
    #   -----
    #     {
    #       \"resourceName\": \"my_instance\",
    #       \"id\": \"ocid1.instance.oc1.phx.<unique_ID>\"
    #     }
    #   -----
    #
    # @return [Hash<String, Object>]
    attr_accessor :payload

    # A friendly description of what happened during the operation. Use this for troubleshooting.
    #
    # @return [String]
    attr_accessor :message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'status': :'status',
        'response_time': :'responseTime',
        'headers': :'headers',
        'payload': :'payload',
        'message': :'message'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'status': :'String',
        'response_time': :'DateTime',
        'headers': :'Hash<String, Array<String>>',
        'payload': :'Hash<String, Object>',
        'message': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :response_time The value to assign to the {#response_time} property
    # @option attributes [Hash<String, Array<String>>] :headers The value to assign to the {#headers} property
    # @option attributes [Hash<String, Object>] :payload The value to assign to the {#payload} property
    # @option attributes [String] :message The value to assign to the {#message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.status = attributes[:'status'] if attributes[:'status']

      self.response_time = attributes[:'responseTime'] if attributes[:'responseTime']

      raise 'You cannot provide both :responseTime and :response_time' if attributes.key?(:'responseTime') && attributes.key?(:'response_time')

      self.response_time = attributes[:'response_time'] if attributes[:'response_time']

      self.headers = attributes[:'headers'] if attributes[:'headers']

      self.payload = attributes[:'payload'] if attributes[:'payload']

      self.message = attributes[:'message'] if attributes[:'message']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        status == other.status &&
        response_time == other.response_time &&
        headers == other.headers &&
        payload == other.payload &&
        message == other.message
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
      [status, response_time, headers, payload, message].hash
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
