# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The metadata specific to a resource limit definition.
  class Limits::Models::LimitDefinitionSummary
    SCOPE_TYPE_ENUM = [
      SCOPE_TYPE_GLOBAL = 'GLOBAL'.freeze,
      SCOPE_TYPE_REGION = 'REGION'.freeze,
      SCOPE_TYPE_AD = 'AD'.freeze,
      SCOPE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The resource limit name. To be used for writing policies (in case of quotas) or other programmatic calls.
    #
    # @return [String]
    attr_accessor :name

    # The service name of the limit.
    # @return [String]
    attr_accessor :service_name

    # The limit description.
    # @return [String]
    attr_accessor :description

    # Reflects the scope of the resource limit: which can be Global (across all regions), regional or ad specific.
    #
    # @return [String]
    attr_reader :scope_type

    # If true, quota policies can be created on top of this resource limit.
    #
    # @return [BOOLEAN]
    attr_accessor :are_quotas_supported

    # Reflects if the GetResourceAvailability API is supported for this limit or not.
    # If not, the API will return an empty JSON response.
    #
    # @return [BOOLEAN]
    attr_accessor :is_resource_availability_supported

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'service_name': :'serviceName',
        'description': :'description',
        'scope_type': :'scopeType',
        'are_quotas_supported': :'areQuotasSupported',
        'is_resource_availability_supported': :'isResourceAvailabilitySupported'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'service_name': :'String',
        'description': :'String',
        'scope_type': :'String',
        'are_quotas_supported': :'BOOLEAN',
        'is_resource_availability_supported': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :service_name The value to assign to the {#service_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :scope_type The value to assign to the {#scope_type} property
    # @option attributes [BOOLEAN] :are_quotas_supported The value to assign to the {#are_quotas_supported} property
    # @option attributes [BOOLEAN] :is_resource_availability_supported The value to assign to the {#is_resource_availability_supported} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.service_name = attributes[:'serviceName'] if attributes[:'serviceName']

      raise 'You cannot provide both :serviceName and :service_name' if attributes.key?(:'serviceName') && attributes.key?(:'service_name')

      self.service_name = attributes[:'service_name'] if attributes[:'service_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.scope_type = attributes[:'scopeType'] if attributes[:'scopeType']

      raise 'You cannot provide both :scopeType and :scope_type' if attributes.key?(:'scopeType') && attributes.key?(:'scope_type')

      self.scope_type = attributes[:'scope_type'] if attributes[:'scope_type']

      self.are_quotas_supported = attributes[:'areQuotasSupported'] unless attributes[:'areQuotasSupported'].nil?

      raise 'You cannot provide both :areQuotasSupported and :are_quotas_supported' if attributes.key?(:'areQuotasSupported') && attributes.key?(:'are_quotas_supported')

      self.are_quotas_supported = attributes[:'are_quotas_supported'] unless attributes[:'are_quotas_supported'].nil?

      self.is_resource_availability_supported = attributes[:'isResourceAvailabilitySupported'] unless attributes[:'isResourceAvailabilitySupported'].nil?

      raise 'You cannot provide both :isResourceAvailabilitySupported and :is_resource_availability_supported' if attributes.key?(:'isResourceAvailabilitySupported') && attributes.key?(:'is_resource_availability_supported')

      self.is_resource_availability_supported = attributes[:'is_resource_availability_supported'] unless attributes[:'is_resource_availability_supported'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] scope_type Object to be assigned
    def scope_type=(scope_type)
      # rubocop:disable Style/ConditionalAssignment
      if scope_type && !SCOPE_TYPE_ENUM.include?(scope_type)
        OCI.logger.debug("Unknown value for 'scope_type' [" + scope_type + "]. Mapping to 'SCOPE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @scope_type = SCOPE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @scope_type = scope_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        service_name == other.service_name &&
        description == other.description &&
        scope_type == other.scope_type &&
        are_quotas_supported == other.are_quotas_supported &&
        is_resource_availability_supported == other.is_resource_availability_supported
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
      [name, service_name, description, scope_type, are_quotas_supported, is_resource_availability_supported].hash
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
