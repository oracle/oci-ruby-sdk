# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information detailing the state of a module stream
  class OsManagement::Models::UpdateModuleStreamDetails
    STATUS_ENUM = [
      STATUS_ENABLED = 'ENABLED'.freeze,
      STATUS_DISABLED = 'DISABLED'.freeze,
      STATUS_ACTIVE = 'ACTIVE'.freeze
    ].freeze

    # **[Required]** The name of the stream of the parent module
    # @return [String]
    attr_accessor :stream_name

    # **[Required]** The status of the stream
    #
    # A stream with the \"ENABLED\" status can be used as a source for installing
    # profiles.  Streams with this status are also \"ACTIVE\".
    #
    # A stream with the \"DISABLED\" status cannot be the source for installing
    # profiles.  To install profiles and packages from this stream, it must be
    # enabled.
    #
    # A stream with the \"ACTIVE\" status can be used as a source for installing
    # profiles.  The packages that comprise the stream are also used when a
    # matching package is installed directly.  In general, a stream can have
    # this status if it is the default stream for the module and no stream has
    # been explicitly enabled.
    #
    # @return [String]
    attr_reader :status

    # **[Required]** The date and time of the last status change for this object, as
    # described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339),
    # section 14.29.
    #
    # @return [DateTime]
    attr_accessor :time_modified

    # The name of the software source that publishes this stream.
    # @return [String]
    attr_accessor :software_source_name

    # The URL of the software source that publishes this stream.
    # @return [String]
    attr_accessor :software_source_url

    # Indicates if the module stream is the default
    # @return [BOOLEAN]
    attr_accessor :is_default

    # The profiles of the stream
    # @return [Array<OCI::OsManagement::Models::UpdateModuleStreamProfileDetails>]
    attr_accessor :profiles

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'stream_name': :'streamName',
        'status': :'status',
        'time_modified': :'timeModified',
        'software_source_name': :'softwareSourceName',
        'software_source_url': :'softwareSourceUrl',
        'is_default': :'isDefault',
        'profiles': :'profiles'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'stream_name': :'String',
        'status': :'String',
        'time_modified': :'DateTime',
        'software_source_name': :'String',
        'software_source_url': :'String',
        'is_default': :'BOOLEAN',
        'profiles': :'Array<OCI::OsManagement::Models::UpdateModuleStreamProfileDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :stream_name The value to assign to the {#stream_name} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_modified The value to assign to the {#time_modified} property
    # @option attributes [String] :software_source_name The value to assign to the {#software_source_name} property
    # @option attributes [String] :software_source_url The value to assign to the {#software_source_url} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    # @option attributes [Array<OCI::OsManagement::Models::UpdateModuleStreamProfileDetails>] :profiles The value to assign to the {#profiles} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.stream_name = attributes[:'streamName'] if attributes[:'streamName']

      raise 'You cannot provide both :streamName and :stream_name' if attributes.key?(:'streamName') && attributes.key?(:'stream_name')

      self.stream_name = attributes[:'stream_name'] if attributes[:'stream_name']

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_modified = attributes[:'timeModified'] if attributes[:'timeModified']

      raise 'You cannot provide both :timeModified and :time_modified' if attributes.key?(:'timeModified') && attributes.key?(:'time_modified')

      self.time_modified = attributes[:'time_modified'] if attributes[:'time_modified']

      self.software_source_name = attributes[:'softwareSourceName'] if attributes[:'softwareSourceName']

      raise 'You cannot provide both :softwareSourceName and :software_source_name' if attributes.key?(:'softwareSourceName') && attributes.key?(:'software_source_name')

      self.software_source_name = attributes[:'software_source_name'] if attributes[:'software_source_name']

      self.software_source_url = attributes[:'softwareSourceUrl'] if attributes[:'softwareSourceUrl']

      raise 'You cannot provide both :softwareSourceUrl and :software_source_url' if attributes.key?(:'softwareSourceUrl') && attributes.key?(:'software_source_url')

      self.software_source_url = attributes[:'software_source_url'] if attributes[:'software_source_url']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?

      self.profiles = attributes[:'profiles'] if attributes[:'profiles']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      raise "Invalid value for 'status': this must be one of the values in STATUS_ENUM." if status && !STATUS_ENUM.include?(status)

      @status = status
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        stream_name == other.stream_name &&
        status == other.status &&
        time_modified == other.time_modified &&
        software_source_name == other.software_source_name &&
        software_source_url == other.software_source_url &&
        is_default == other.is_default &&
        profiles == other.profiles
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
      [stream_name, status, time_modified, software_source_name, software_source_url, is_default, profiles].hash
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
