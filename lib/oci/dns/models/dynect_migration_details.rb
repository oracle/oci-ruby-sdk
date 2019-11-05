# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details specific to performing a DynECT zone migration.
  #
  class Dns::Models::DynectMigrationDetails
    # **[Required]** DynECT customer name the zone belongs to.
    #
    # @return [String]
    attr_accessor :customer_name

    # **[Required]** DynECT API username to perform the migration with.
    #
    # @return [String]
    attr_accessor :username

    # **[Required]** DynECT API password for the provided username.
    #
    # @return [String]
    attr_accessor :password

    # A map of fully-qualified domain names (FQDNs) to an array of `MigrationReplacement` objects.
    #
    # @return [Hash<String, Array<OCI::Dns::Models::MigrationReplacement>>]
    attr_accessor :http_redirect_replacements

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'customer_name': :'customerName',
        'username': :'username',
        'password': :'password',
        'http_redirect_replacements': :'httpRedirectReplacements'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'customer_name': :'String',
        'username': :'String',
        'password': :'String',
        'http_redirect_replacements': :'Hash<String, Array<OCI::Dns::Models::MigrationReplacement>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :customer_name The value to assign to the {#customer_name} property
    # @option attributes [String] :username The value to assign to the {#username} property
    # @option attributes [String] :password The value to assign to the {#password} property
    # @option attributes [Hash<String, Array<OCI::Dns::Models::MigrationReplacement>>] :http_redirect_replacements The value to assign to the {#http_redirect_replacements} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.customer_name = attributes[:'customerName'] if attributes[:'customerName']

      raise 'You cannot provide both :customerName and :customer_name' if attributes.key?(:'customerName') && attributes.key?(:'customer_name')

      self.customer_name = attributes[:'customer_name'] if attributes[:'customer_name']

      self.username = attributes[:'username'] if attributes[:'username']

      self.password = attributes[:'password'] if attributes[:'password']

      self.http_redirect_replacements = attributes[:'httpRedirectReplacements'] if attributes[:'httpRedirectReplacements']

      raise 'You cannot provide both :httpRedirectReplacements and :http_redirect_replacements' if attributes.key?(:'httpRedirectReplacements') && attributes.key?(:'http_redirect_replacements')

      self.http_redirect_replacements = attributes[:'http_redirect_replacements'] if attributes[:'http_redirect_replacements']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        customer_name == other.customer_name &&
        username == other.username &&
        password == other.password &&
        http_redirect_replacements == other.http_redirect_replacements
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
      [customer_name, username, password, http_redirect_replacements].hash
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
