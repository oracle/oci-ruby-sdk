# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The detail for one alert log entry.
  #
  class DatabaseManagement::Models::AlertLogSummary
    MESSAGE_LEVEL_ENUM = [
      MESSAGE_LEVEL_CRITICAL = 'CRITICAL'.freeze,
      MESSAGE_LEVEL_SEVERE = 'SEVERE'.freeze,
      MESSAGE_LEVEL_IMPORTANT = 'IMPORTANT'.freeze,
      MESSAGE_LEVEL_NORMAL = 'NORMAL'.freeze,
      MESSAGE_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MESSAGE_TYPE_ENUM = [
      MESSAGE_TYPE_UNKNOWN = 'UNKNOWN'.freeze,
      MESSAGE_TYPE_INCIDENT_ERROR = 'INCIDENT_ERROR'.freeze,
      MESSAGE_TYPE_ERROR = 'ERROR'.freeze,
      MESSAGE_TYPE_WARNING = 'WARNING'.freeze,
      MESSAGE_TYPE_NOTIFICATION = 'NOTIFICATION'.freeze,
      MESSAGE_TYPE_TRACE = 'TRACE'.freeze,
      MESSAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The level of the alert log.
    # @return [String]
    attr_reader :message_level

    # **[Required]** The type of alert log message.
    # @return [String]
    attr_reader :message_type

    # The contents of the alert log message.
    # @return [String]
    attr_accessor :message_content

    # The date and time the alert log was created.
    # @return [DateTime]
    attr_accessor :timestamp

    # The supplemental details of the alert log.
    # @return [String]
    attr_accessor :supplemental_detail

    # The alert log file location.
    # @return [String]
    attr_accessor :file_location

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'message_level': :'messageLevel',
        'message_type': :'messageType',
        'message_content': :'messageContent',
        'timestamp': :'timestamp',
        'supplemental_detail': :'supplementalDetail',
        'file_location': :'fileLocation'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'message_level': :'String',
        'message_type': :'String',
        'message_content': :'String',
        'timestamp': :'DateTime',
        'supplemental_detail': :'String',
        'file_location': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :message_level The value to assign to the {#message_level} property
    # @option attributes [String] :message_type The value to assign to the {#message_type} property
    # @option attributes [String] :message_content The value to assign to the {#message_content} property
    # @option attributes [DateTime] :timestamp The value to assign to the {#timestamp} property
    # @option attributes [String] :supplemental_detail The value to assign to the {#supplemental_detail} property
    # @option attributes [String] :file_location The value to assign to the {#file_location} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.message_level = attributes[:'messageLevel'] if attributes[:'messageLevel']

      raise 'You cannot provide both :messageLevel and :message_level' if attributes.key?(:'messageLevel') && attributes.key?(:'message_level')

      self.message_level = attributes[:'message_level'] if attributes[:'message_level']

      self.message_type = attributes[:'messageType'] if attributes[:'messageType']

      raise 'You cannot provide both :messageType and :message_type' if attributes.key?(:'messageType') && attributes.key?(:'message_type')

      self.message_type = attributes[:'message_type'] if attributes[:'message_type']

      self.message_content = attributes[:'messageContent'] if attributes[:'messageContent']

      raise 'You cannot provide both :messageContent and :message_content' if attributes.key?(:'messageContent') && attributes.key?(:'message_content')

      self.message_content = attributes[:'message_content'] if attributes[:'message_content']

      self.timestamp = attributes[:'timestamp'] if attributes[:'timestamp']

      self.supplemental_detail = attributes[:'supplementalDetail'] if attributes[:'supplementalDetail']

      raise 'You cannot provide both :supplementalDetail and :supplemental_detail' if attributes.key?(:'supplementalDetail') && attributes.key?(:'supplemental_detail')

      self.supplemental_detail = attributes[:'supplemental_detail'] if attributes[:'supplemental_detail']

      self.file_location = attributes[:'fileLocation'] if attributes[:'fileLocation']

      raise 'You cannot provide both :fileLocation and :file_location' if attributes.key?(:'fileLocation') && attributes.key?(:'file_location')

      self.file_location = attributes[:'file_location'] if attributes[:'file_location']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] message_level Object to be assigned
    def message_level=(message_level)
      # rubocop:disable Style/ConditionalAssignment
      if message_level && !MESSAGE_LEVEL_ENUM.include?(message_level)
        OCI.logger.debug("Unknown value for 'message_level' [" + message_level + "]. Mapping to 'MESSAGE_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @message_level = MESSAGE_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @message_level = message_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] message_type Object to be assigned
    def message_type=(message_type)
      # rubocop:disable Style/ConditionalAssignment
      if message_type && !MESSAGE_TYPE_ENUM.include?(message_type)
        OCI.logger.debug("Unknown value for 'message_type' [" + message_type + "]. Mapping to 'MESSAGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @message_type = MESSAGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @message_type = message_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        message_level == other.message_level &&
        message_type == other.message_type &&
        message_content == other.message_content &&
        timestamp == other.timestamp &&
        supplemental_detail == other.supplemental_detail &&
        file_location == other.file_location
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
      [message_level, message_type, message_content, timestamp, supplemental_detail, file_location].hash
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
