# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration of a backend server that is a member of a load balancer backend set.
  # For more information, see [Managing Backend Servers](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingbackendservers.htm).
  #
  class LoadBalancer::Models::Backend
    # **[Required]** A read-only field showing the IP address and port that uniquely identify this backend server in the backend set.
    #
    # Example: `10.0.0.3:8080`
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The IP address of the backend server.
    #
    # Example: `10.0.0.3`
    #
    # @return [String]
    attr_accessor :ip_address

    # **[Required]** The communication port for the backend server.
    #
    # Example: `8080`
    #
    # @return [Integer]
    attr_accessor :port

    # **[Required]** The load balancing policy weight assigned to the server. Backend servers with a higher weight receive a larger
    # proportion of incoming traffic. For example, a server weighted '3' receives 3 times the number of new connections
    # as a server weighted '1'.
    # For more information on load balancing policies, see
    # [How Load Balancing Policies Work](https://docs.cloud.oracle.com/Content/Balance/Reference/lbpolicies.htm).
    #
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :weight

    # **[Required]** Whether the load balancer should drain this server. Servers marked \"drain\" receive no new
    # incoming traffic.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :drain

    # **[Required]** Whether the load balancer should treat this server as a backup unit. If `true`, the load balancer forwards no ingress
    # traffic to this backend server unless all other backend servers not marked as \"backup\" fail the health check policy.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :backup

    # **[Required]** Whether the load balancer should treat this server as offline. Offline servers receive no incoming
    # traffic.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :offline

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'ip_address': :'ipAddress',
        'port': :'port',
        'weight': :'weight',
        'drain': :'drain',
        'backup': :'backup',
        'offline': :'offline'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'ip_address': :'String',
        'port': :'Integer',
        'weight': :'Integer',
        'drain': :'BOOLEAN',
        'backup': :'BOOLEAN',
        'offline': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [Integer] :weight The value to assign to the {#weight} property
    # @option attributes [BOOLEAN] :drain The value to assign to the {#drain} property
    # @option attributes [BOOLEAN] :backup The value to assign to the {#backup} property
    # @option attributes [BOOLEAN] :offline The value to assign to the {#offline} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.port = attributes[:'port'] if attributes[:'port']

      self.weight = attributes[:'weight'] if attributes[:'weight']

      self.drain = attributes[:'drain'] unless attributes[:'drain'].nil?
      self.drain = false if drain.nil? && !attributes.key?(:'drain') # rubocop:disable Style/StringLiterals

      self.backup = attributes[:'backup'] unless attributes[:'backup'].nil?
      self.backup = false if backup.nil? && !attributes.key?(:'backup') # rubocop:disable Style/StringLiterals

      self.offline = attributes[:'offline'] unless attributes[:'offline'].nil?
      self.offline = false if offline.nil? && !attributes.key?(:'offline') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        ip_address == other.ip_address &&
        port == other.port &&
        weight == other.weight &&
        drain == other.drain &&
        backup == other.backup &&
        offline == other.offline
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
      [name, ip_address, port, weight, drain, backup, offline].hash
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
