# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that represents your tenancy's access to a particular region (i.e., a subscription), the status of that
  # access, and whether that region is the home region. For more information, see [Managing Regions](https://docs.cloud.oracle.com/Content/Identity/Tasks/managingregions.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Identity::Models::RegionSubscription
    STATUS_ENUM = [
      STATUS_READY = 'READY'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The region's key.
    #
    # Allowed values are:
    # - `PHX`
    # - `IAD`
    # - `FRA`
    # - `LHR`
    #
    # @return [String]
    attr_accessor :region_key

    # **[Required]** The region's name.
    #
    # Allowed values are:
    # - `us-phoenix-1`
    # - `us-ashburn-1`
    # - `eu-frankurt-1`
    # - `uk-london-1`
    #
    # @return [String]
    attr_accessor :region_name

    # **[Required]** The region subscription status.
    # @return [String]
    attr_reader :status

    # **[Required]** Indicates if the region is the home region or not.
    # @return [BOOLEAN]
    attr_accessor :is_home_region

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'region_key': :'regionKey',
        'region_name': :'regionName',
        'status': :'status',
        'is_home_region': :'isHomeRegion'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'region_key': :'String',
        'region_name': :'String',
        'status': :'String',
        'is_home_region': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :region_key The value to assign to the {#region_key} property
    # @option attributes [String] :region_name The value to assign to the {#region_name} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [BOOLEAN] :is_home_region The value to assign to the {#is_home_region} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.region_key = attributes[:'regionKey'] if attributes[:'regionKey']

      raise 'You cannot provide both :regionKey and :region_key' if attributes.key?(:'regionKey') && attributes.key?(:'region_key')

      self.region_key = attributes[:'region_key'] if attributes[:'region_key']

      self.region_name = attributes[:'regionName'] if attributes[:'regionName']

      raise 'You cannot provide both :regionName and :region_name' if attributes.key?(:'regionName') && attributes.key?(:'region_name')

      self.region_name = attributes[:'region_name'] if attributes[:'region_name']

      self.status = attributes[:'status'] if attributes[:'status']

      self.is_home_region = attributes[:'isHomeRegion'] unless attributes[:'isHomeRegion'].nil?

      raise 'You cannot provide both :isHomeRegion and :is_home_region' if attributes.key?(:'isHomeRegion') && attributes.key?(:'is_home_region')

      self.is_home_region = attributes[:'is_home_region'] unless attributes[:'is_home_region'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        region_key == other.region_key &&
        region_name == other.region_name &&
        status == other.status &&
        is_home_region == other.is_home_region
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
      [region_key, region_name, status, is_home_region].hash
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
