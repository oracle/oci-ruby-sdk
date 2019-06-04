# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Object used to create a group cursor.
  class Streaming::Models::CreateGroupCursorDetails
    TYPE_ENUM = [
      TYPE_AT_TIME = 'AT_TIME'.freeze,
      TYPE_LATEST = 'LATEST'.freeze,
      TYPE_TRIM_HORIZON = 'TRIM_HORIZON'.freeze
    ].freeze

    # **[Required]** The type of the cursor. This value is only used when the group is created.
    # @return [String]
    attr_reader :type

    # The time to consume from if type is AT_TIME.
    # @return [DateTime]
    attr_accessor :time

    # **[Required]** Name of the consumer group.
    # @return [String]
    attr_accessor :group_name

    # A unique identifier for the instance joining the consumer group. If an instanceName is not provided, a UUID will be generated and used.
    # @return [String]
    attr_accessor :instance_name

    # The amount of a consumer instance inactivity time, before partition reservations are released.
    # @return [Integer]
    attr_accessor :timeout_in_ms

    # When using consumer-groups, the default commit-on-get behaviour can be overriden by setting this value to false.
    # If disabled, a consumer must manually commit their cursors.
    #
    # @return [BOOLEAN]
    attr_accessor :commit_on_get

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'time': :'time',
        'group_name': :'groupName',
        'instance_name': :'instanceName',
        'timeout_in_ms': :'timeoutInMs',
        'commit_on_get': :'commitOnGet'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'time': :'DateTime',
        'group_name': :'String',
        'instance_name': :'String',
        'timeout_in_ms': :'Integer',
        'commit_on_get': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [DateTime] :time The value to assign to the {#time} property
    # @option attributes [String] :group_name The value to assign to the {#group_name} property
    # @option attributes [String] :instance_name The value to assign to the {#instance_name} property
    # @option attributes [Integer] :timeout_in_ms The value to assign to the {#timeout_in_ms} property
    # @option attributes [BOOLEAN] :commit_on_get The value to assign to the {#commit_on_get} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.time = attributes[:'time'] if attributes[:'time']

      self.group_name = attributes[:'groupName'] if attributes[:'groupName']

      raise 'You cannot provide both :groupName and :group_name' if attributes.key?(:'groupName') && attributes.key?(:'group_name')

      self.group_name = attributes[:'group_name'] if attributes[:'group_name']

      self.instance_name = attributes[:'instanceName'] if attributes[:'instanceName']

      raise 'You cannot provide both :instanceName and :instance_name' if attributes.key?(:'instanceName') && attributes.key?(:'instance_name')

      self.instance_name = attributes[:'instance_name'] if attributes[:'instance_name']

      self.timeout_in_ms = attributes[:'timeoutInMs'] if attributes[:'timeoutInMs']
      self.timeout_in_ms = 30000 if timeout_in_ms.nil? && !attributes.key?(:'timeoutInMs') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :timeoutInMs and :timeout_in_ms' if attributes.key?(:'timeoutInMs') && attributes.key?(:'timeout_in_ms')

      self.timeout_in_ms = attributes[:'timeout_in_ms'] if attributes[:'timeout_in_ms']
      self.timeout_in_ms = 30000 if timeout_in_ms.nil? && !attributes.key?(:'timeoutInMs') && !attributes.key?(:'timeout_in_ms') # rubocop:disable Style/StringLiterals

      self.commit_on_get = attributes[:'commitOnGet'] unless attributes[:'commitOnGet'].nil?
      self.commit_on_get = true if commit_on_get.nil? && !attributes.key?(:'commitOnGet') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :commitOnGet and :commit_on_get' if attributes.key?(:'commitOnGet') && attributes.key?(:'commit_on_get')

      self.commit_on_get = attributes[:'commit_on_get'] unless attributes[:'commit_on_get'].nil?
      self.commit_on_get = true if commit_on_get.nil? && !attributes.key?(:'commitOnGet') && !attributes.key?(:'commit_on_get') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        time == other.time &&
        group_name == other.group_name &&
        instance_name == other.instance_name &&
        timeout_in_ms == other.timeout_in_ms &&
        commit_on_get == other.commit_on_get
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
      [type, time, group_name, instance_name, timeout_in_ms, commit_on_get].hash
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
