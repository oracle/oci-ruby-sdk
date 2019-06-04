# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::ObjectLifecycleRule
    TIME_UNIT_ENUM = [
      TIME_UNIT_DAYS = 'DAYS'.freeze,
      TIME_UNIT_YEARS = 'YEARS'.freeze,
      TIME_UNIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the lifecycle rule to be applied.
    # @return [String]
    attr_accessor :name

    # **[Required]** The action of the object lifecycle policy rule. Rules using the action 'ARCHIVE' move objects into the
    # [Archive Storage tier](https://docs.cloud.oracle.com/Content/Archive/Concepts/archivestorageoverview.htm). Rules using the action
    # 'DELETE' permanently delete objects from buckets. 'ARCHIVE' and 'DELETE' are the only two supported
    # actions at this time.
    #
    # @return [String]
    attr_accessor :action

    # **[Required]** Specifies the age of objects to apply the rule to. The timeAmount is interpreted in units defined by the
    # timeUnit parameter, and is calculated in relation to each object's Last-Modified time.
    #
    # @return [Integer]
    attr_accessor :time_amount

    # **[Required]** The unit that should be used to interpret timeAmount.  Days are defined as starting and ending at midnight UTC.
    # Years are defined as 365.2425 days long and likewise round up to the next midnight UTC.
    #
    # @return [String]
    attr_reader :time_unit

    # **[Required]** A boolean that determines whether this rule is currently enabled.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # A filter limiting object names that the rule will apply to.
    # @return [OCI::ObjectStorage::Models::ObjectNameFilter]
    attr_accessor :object_name_filter

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'action': :'action',
        'time_amount': :'timeAmount',
        'time_unit': :'timeUnit',
        'is_enabled': :'isEnabled',
        'object_name_filter': :'objectNameFilter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'action': :'String',
        'time_amount': :'Integer',
        'time_unit': :'String',
        'is_enabled': :'BOOLEAN',
        'object_name_filter': :'OCI::ObjectStorage::Models::ObjectNameFilter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [Integer] :time_amount The value to assign to the {#time_amount} property
    # @option attributes [String] :time_unit The value to assign to the {#time_unit} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [OCI::ObjectStorage::Models::ObjectNameFilter] :object_name_filter The value to assign to the {#object_name_filter} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.action = attributes[:'action'] if attributes[:'action']

      self.time_amount = attributes[:'timeAmount'] if attributes[:'timeAmount']

      raise 'You cannot provide both :timeAmount and :time_amount' if attributes.key?(:'timeAmount') && attributes.key?(:'time_amount')

      self.time_amount = attributes[:'time_amount'] if attributes[:'time_amount']

      self.time_unit = attributes[:'timeUnit'] if attributes[:'timeUnit']

      raise 'You cannot provide both :timeUnit and :time_unit' if attributes.key?(:'timeUnit') && attributes.key?(:'time_unit')

      self.time_unit = attributes[:'time_unit'] if attributes[:'time_unit']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.object_name_filter = attributes[:'objectNameFilter'] if attributes[:'objectNameFilter']

      raise 'You cannot provide both :objectNameFilter and :object_name_filter' if attributes.key?(:'objectNameFilter') && attributes.key?(:'object_name_filter')

      self.object_name_filter = attributes[:'object_name_filter'] if attributes[:'object_name_filter']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] time_unit Object to be assigned
    def time_unit=(time_unit)
      # rubocop:disable Style/ConditionalAssignment
      if time_unit && !TIME_UNIT_ENUM.include?(time_unit)
        OCI.logger.debug("Unknown value for 'time_unit' [" + time_unit + "]. Mapping to 'TIME_UNIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @time_unit = TIME_UNIT_UNKNOWN_ENUM_VALUE
      else
        @time_unit = time_unit
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
        action == other.action &&
        time_amount == other.time_amount &&
        time_unit == other.time_unit &&
        is_enabled == other.is_enabled &&
        object_name_filter == other.object_name_filter
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
      [name, action, time_amount, time_unit, is_enabled, object_name_filter].hash
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
