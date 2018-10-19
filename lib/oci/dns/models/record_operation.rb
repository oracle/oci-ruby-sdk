# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # An extension of the existing record resource, describing either a
  # precondition, an add, or a remove. Preconditions check all fields,
  # including read-only data like `recordHash` and `rrsetVersion`.
  #
  class Dns::Models::RecordOperation # rubocop:disable Metrics/LineLength
    OPERATION_ENUM = [
      OPERATION_REQUIRE = 'REQUIRE'.freeze,
      OPERATION_PROHIBIT = 'PROHIBIT'.freeze,
      OPERATION_ADD = 'ADD'.freeze,
      OPERATION_REMOVE = 'REMOVE'.freeze
    ].freeze

    # The fully qualified domain name where the record can be located.
    #
    # @return [String]
    attr_accessor :domain

    # A unique identifier for the record within its zone.
    #
    # @return [String]
    attr_accessor :record_hash

    # A Boolean flag indicating whether or not parts of the record
    # are unable to be explicitly managed.
    #
    # @return [BOOLEAN]
    attr_accessor :is_protected

    # The record's data, as whitespace-delimited tokens in
    # type-specific presentation format.
    #
    # @return [String]
    attr_accessor :rdata

    # The latest version of the record's zone in which its RRSet differs
    # from the preceding version.
    #
    # @return [String]
    attr_accessor :rrset_version

    # The canonical name for the record's type, such as A or CNAME. For more
    # information, see [Resource Record (RR) TYPEs](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4).
    #
    # @return [String]
    attr_accessor :rtype

    # The Time To Live for the record, in seconds.
    # @return [Integer]
    attr_accessor :ttl

    # A description of how a record relates to a PATCH operation.
    #
    # - `REQUIRE` indicates a precondition that record data **must** already exist.
    # - `PROHIBIT` indicates a precondition that record data **must not** already exist.
    # - `ADD` indicates that record data **must** exist after successful application.
    # - `REMOVE` indicates that record data **must not** exist after successful application.
    #
    #   **Note:** `ADD` and `REMOVE` operations can succeed even if
    #   they require no changes when applied, such as when the described
    #   records are already present or absent.
    #
    #   **Note:** `ADD` and `REMOVE` operations can describe changes for
    #   more than one record.
    #
    #   **Example:** `{ \"domain\": \"www.example.com\", \"rtype\": \"AAAA\", \"ttl\": 60 }`
    #   specifies a new TTL for every record in the www.example.com AAAA RRSet.
    #
    # @return [String]
    attr_reader :operation

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'domain': :'domain',
        'record_hash': :'recordHash',
        'is_protected': :'isProtected',
        'rdata': :'rdata',
        'rrset_version': :'rrsetVersion',
        'rtype': :'rtype',
        'ttl': :'ttl',
        'operation': :'operation'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'domain': :'String',
        'record_hash': :'String',
        'is_protected': :'BOOLEAN',
        'rdata': :'String',
        'rrset_version': :'String',
        'rtype': :'String',
        'ttl': :'Integer',
        'operation': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [String] :record_hash The value to assign to the {#record_hash} property
    # @option attributes [BOOLEAN] :is_protected The value to assign to the {#is_protected} property
    # @option attributes [String] :rdata The value to assign to the {#rdata} property
    # @option attributes [String] :rrset_version The value to assign to the {#rrset_version} property
    # @option attributes [String] :rtype The value to assign to the {#rtype} property
    # @option attributes [Integer] :ttl The value to assign to the {#ttl} property
    # @option attributes [String] :operation The value to assign to the {#operation} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.record_hash = attributes[:'recordHash'] if attributes[:'recordHash']

      raise 'You cannot provide both :recordHash and :record_hash' if attributes.key?(:'recordHash') && attributes.key?(:'record_hash')

      self.record_hash = attributes[:'record_hash'] if attributes[:'record_hash']

      self.is_protected = attributes[:'isProtected'] unless attributes[:'isProtected'].nil?

      raise 'You cannot provide both :isProtected and :is_protected' if attributes.key?(:'isProtected') && attributes.key?(:'is_protected')

      self.is_protected = attributes[:'is_protected'] unless attributes[:'is_protected'].nil?

      self.rdata = attributes[:'rdata'] if attributes[:'rdata']

      self.rrset_version = attributes[:'rrsetVersion'] if attributes[:'rrsetVersion']

      raise 'You cannot provide both :rrsetVersion and :rrset_version' if attributes.key?(:'rrsetVersion') && attributes.key?(:'rrset_version')

      self.rrset_version = attributes[:'rrset_version'] if attributes[:'rrset_version']

      self.rtype = attributes[:'rtype'] if attributes[:'rtype']

      self.ttl = attributes[:'ttl'] if attributes[:'ttl']

      self.operation = attributes[:'operation'] if attributes[:'operation']
      self.operation = "ADD" if operation.nil? && !attributes.key?(:'operation') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation Object to be assigned
    def operation=(operation)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'operation': this must be one of the values in OPERATION_ENUM." if operation && !OPERATION_ENUM.include?(operation)
      # rubocop: enable Metrics/LineLength
      @operation = operation
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        domain == other.domain &&
        record_hash == other.record_hash &&
        is_protected == other.is_protected &&
        rdata == other.rdata &&
        rrset_version == other.rrset_version &&
        rtype == other.rtype &&
        ttl == other.ttl &&
        operation == other.operation
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
      [domain, record_hash, is_protected, rdata, rrset_version, rtype, ttl, operation].hash
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
