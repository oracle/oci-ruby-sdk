# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The health check policy configuration.
  # For more information, see [Editing Health Check Policies](https://docs.us-phoenix-1.oraclecloud.com/Content/Balance/Tasks/editinghealthcheck.htm).
  #
  class LoadBalancer::Models::HealthChecker # rubocop:disable Metrics/LineLength
    # The interval between health checks, in milliseconds. The default is 10000 (10 seconds).
    #
    # Example: `10000`
    #
    # @return [Integer]
    attr_accessor :interval_in_millis

    # **[Required]** The backend server port against which to run the health check. If the port is not specified, the load balancer uses the
    # port information from the `Backend` object.
    #
    # Example: `8080`
    #
    # @return [Integer]
    attr_accessor :port

    # **[Required]** The protocol the health check must use; either HTTP or TCP.
    #
    # Example: `HTTP`
    #
    # @return [String]
    attr_accessor :protocol

    # **[Required]** A regular expression for parsing the response body from the backend server.
    #
    # Example: `^((?!false).|\\s)*$`
    #
    # @return [String]
    attr_accessor :response_body_regex

    # The number of retries to attempt before a backend server is considered \"unhealthy\". Defaults to 3.
    #
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :retries

    # **[Required]** The status code a healthy backend server should return. If you configure the health check policy to use the HTTP protocol,
    # you can use common HTTP status codes such as \"200\".
    #
    # Example: `200`
    #
    # @return [Integer]
    attr_accessor :return_code

    # The maximum time, in milliseconds, to wait for a reply to a health check. A health check is successful only if a reply
    # returns within this timeout period. Defaults to 3000 (3 seconds).
    #
    # Example: `3000`
    #
    # @return [Integer]
    attr_accessor :timeout_in_millis

    # The path against which to run the health check.
    #
    # Example: `/healthcheck`
    #
    # @return [String]
    attr_accessor :url_path

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'interval_in_millis': :'intervalInMillis',
        'port': :'port',
        'protocol': :'protocol',
        'response_body_regex': :'responseBodyRegex',
        'retries': :'retries',
        'return_code': :'returnCode',
        'timeout_in_millis': :'timeoutInMillis',
        'url_path': :'urlPath'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'interval_in_millis': :'Integer',
        'port': :'Integer',
        'protocol': :'String',
        'response_body_regex': :'String',
        'retries': :'Integer',
        'return_code': :'Integer',
        'timeout_in_millis': :'Integer',
        'url_path': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :interval_in_millis The value to assign to the {#interval_in_millis} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :response_body_regex The value to assign to the {#response_body_regex} property
    # @option attributes [Integer] :retries The value to assign to the {#retries} property
    # @option attributes [Integer] :return_code The value to assign to the {#return_code} property
    # @option attributes [Integer] :timeout_in_millis The value to assign to the {#timeout_in_millis} property
    # @option attributes [String] :url_path The value to assign to the {#url_path} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.interval_in_millis = attributes[:'intervalInMillis'] if attributes[:'intervalInMillis']

      raise 'You cannot provide both :intervalInMillis and :interval_in_millis' if attributes.key?(:'intervalInMillis') && attributes.key?(:'interval_in_millis')

      self.interval_in_millis = attributes[:'interval_in_millis'] if attributes[:'interval_in_millis']

      self.port = attributes[:'port'] if attributes[:'port']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.response_body_regex = attributes[:'responseBodyRegex'] if attributes[:'responseBodyRegex']

      raise 'You cannot provide both :responseBodyRegex and :response_body_regex' if attributes.key?(:'responseBodyRegex') && attributes.key?(:'response_body_regex')

      self.response_body_regex = attributes[:'response_body_regex'] if attributes[:'response_body_regex']

      self.retries = attributes[:'retries'] if attributes[:'retries']

      self.return_code = attributes[:'returnCode'] if attributes[:'returnCode']

      raise 'You cannot provide both :returnCode and :return_code' if attributes.key?(:'returnCode') && attributes.key?(:'return_code')

      self.return_code = attributes[:'return_code'] if attributes[:'return_code']

      self.timeout_in_millis = attributes[:'timeoutInMillis'] if attributes[:'timeoutInMillis']

      raise 'You cannot provide both :timeoutInMillis and :timeout_in_millis' if attributes.key?(:'timeoutInMillis') && attributes.key?(:'timeout_in_millis')

      self.timeout_in_millis = attributes[:'timeout_in_millis'] if attributes[:'timeout_in_millis']

      self.url_path = attributes[:'urlPath'] if attributes[:'urlPath']

      raise 'You cannot provide both :urlPath and :url_path' if attributes.key?(:'urlPath') && attributes.key?(:'url_path')

      self.url_path = attributes[:'url_path'] if attributes[:'url_path']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        interval_in_millis == other.interval_in_millis &&
        port == other.port &&
        protocol == other.protocol &&
        response_body_regex == other.response_body_regex &&
        retries == other.retries &&
        return_code == other.return_code &&
        timeout_in_millis == other.timeout_in_millis &&
        url_path == other.url_path
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
      [interval_in_millis, port, protocol, response_body_regex, retries, return_code, timeout_in_millis, url_path].hash
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
