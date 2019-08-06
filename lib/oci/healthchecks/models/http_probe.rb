# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary that contains all of the mutable and immutable properties for an HTTP probe.
  #
  class Healthchecks::Models::HttpProbe
    PROTOCOL_ENUM = [
      PROTOCOL_HTTP = 'HTTP'.freeze,
      PROTOCOL_HTTPS = 'HTTPS'.freeze,
      PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    METHOD_ENUM = [
      METHOD_GET = 'GET'.freeze,
      METHOD_HEAD = 'HEAD'.freeze,
      METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the resource.
    # @return [String]
    attr_accessor :id

    # A URL for fetching the probe results.
    # @return [String]
    attr_accessor :results_url

    # The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # A list of targets (hostnames or IP addresses) of the probe.
    # @return [Array<String>]
    attr_accessor :targets

    # A list of names of vantage points from which to execute the probe.
    # @return [Array<String>]
    attr_accessor :vantage_point_names

    # The port on which to probe endpoints. If unspecified, probes will use the
    # default port of their protocol.
    #
    # @return [Integer]
    attr_accessor :port

    # The probe timeout in seconds. Valid values: 10, 20, 30, and 60.
    # The probe timeout must be less than or equal to `intervalInSeconds` for monitors.
    #
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # @return [String]
    attr_reader :protocol

    # @return [String]
    attr_reader :method

    # The optional URL path to probe, including query parameters.
    # @return [String]
    attr_accessor :path

    # A dictionary of HTTP request headers.
    #
    # *Note:* Monitors and probes do not support the use of the `Authorization` HTTP header.
    #
    # @return [Hash<String, String>]
    attr_accessor :headers

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'results_url': :'resultsUrl',
        'compartment_id': :'compartmentId',
        'targets': :'targets',
        'vantage_point_names': :'vantagePointNames',
        'port': :'port',
        'timeout_in_seconds': :'timeoutInSeconds',
        'protocol': :'protocol',
        'method': :'method',
        'path': :'path',
        'headers': :'headers'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'results_url': :'String',
        'compartment_id': :'String',
        'targets': :'Array<String>',
        'vantage_point_names': :'Array<String>',
        'port': :'Integer',
        'timeout_in_seconds': :'Integer',
        'protocol': :'String',
        'method': :'String',
        'path': :'String',
        'headers': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :results_url The value to assign to the {#results_url} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Array<String>] :targets The value to assign to the {#targets} property
    # @option attributes [Array<String>] :vantage_point_names The value to assign to the {#vantage_point_names} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :method The value to assign to the {#method} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [Hash<String, String>] :headers The value to assign to the {#headers} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.results_url = attributes[:'resultsUrl'] if attributes[:'resultsUrl']

      raise 'You cannot provide both :resultsUrl and :results_url' if attributes.key?(:'resultsUrl') && attributes.key?(:'results_url')

      self.results_url = attributes[:'results_url'] if attributes[:'results_url']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.targets = attributes[:'targets'] if attributes[:'targets']

      self.vantage_point_names = attributes[:'vantagePointNames'] if attributes[:'vantagePointNames']

      raise 'You cannot provide both :vantagePointNames and :vantage_point_names' if attributes.key?(:'vantagePointNames') && attributes.key?(:'vantage_point_names')

      self.vantage_point_names = attributes[:'vantage_point_names'] if attributes[:'vantage_point_names']

      self.port = attributes[:'port'] if attributes[:'port']

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.method = attributes[:'method'] if attributes[:'method']
      self.method = "HEAD" if method.nil? && !attributes.key?(:'method') # rubocop:disable Style/StringLiterals

      self.path = attributes[:'path'] if attributes[:'path']
      self.path = "/" if path.nil? && !attributes.key?(:'path') # rubocop:disable Style/StringLiterals

      self.headers = attributes[:'headers'] if attributes[:'headers']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] method Object to be assigned
    def method=(method)
      # rubocop:disable Style/ConditionalAssignment
      if method && !METHOD_ENUM.include?(method)
        OCI.logger.debug("Unknown value for 'method' [" + method + "]. Mapping to 'METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @method = METHOD_UNKNOWN_ENUM_VALUE
      else
        @method = method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        results_url == other.results_url &&
        compartment_id == other.compartment_id &&
        targets == other.targets &&
        vantage_point_names == other.vantage_point_names &&
        port == other.port &&
        timeout_in_seconds == other.timeout_in_seconds &&
        protocol == other.protocol &&
        method == other.method &&
        path == other.path &&
        headers == other.headers
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
      [id, results_url, compartment_id, targets, vantage_point_names, port, timeout_in_seconds, protocol, method, path, headers].hash
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
