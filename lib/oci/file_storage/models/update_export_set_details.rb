# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details for updating the export set.
  class FileStorage::Models::UpdateExportSetDetails
    # A user-friendly name. It does not have to be unique, and it is changeable.
    # Avoid entering confidential information.
    #
    # Example: `My export set`
    #
    # @return [String]
    attr_accessor :display_name

    # Controls the maximum `tbytes`, `fbytes`, and `abytes`
    # values reported by `NFS FSSTAT` calls through any associated
    # mount targets. This is an advanced feature. For most
    # applications, use the default value. The
    # `tbytes` value reported by `FSSTAT` will be
    # `maxFsStatBytes`. The value of `fbytes` and `abytes` will be
    # `maxFsStatBytes` minus the metered size of the file
    # system. If the metered size is larger than `maxFsStatBytes`,
    # then `fbytes` and `abytes` will both be '0'.
    #
    # @return [Integer]
    attr_accessor :max_fs_stat_bytes

    # Controls the maximum `ffiles`, `ffiles`, and `afiles`
    # values reported by `NFS FSSTAT` calls through any associated
    # mount targets. This is an advanced feature. For most
    # applications, use the default value. The
    # `tfiles` value reported by `FSSTAT` will be
    # `maxFsStatFiles`. The value of `ffiles` and `afiles` will be
    # `maxFsStatFiles` minus the metered size of the file
    # system. If the metered size is larger than `maxFsStatFiles`,
    # then `ffiles` and `afiles` will both be '0'.
    #
    # @return [Integer]
    attr_accessor :max_fs_stat_files

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'max_fs_stat_bytes': :'maxFsStatBytes',
        'max_fs_stat_files': :'maxFsStatFiles'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'max_fs_stat_bytes': :'Integer',
        'max_fs_stat_files': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :max_fs_stat_bytes The value to assign to the {#max_fs_stat_bytes} property
    # @option attributes [Integer] :max_fs_stat_files The value to assign to the {#max_fs_stat_files} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.max_fs_stat_bytes = attributes[:'maxFsStatBytes'] if attributes[:'maxFsStatBytes']

      raise 'You cannot provide both :maxFsStatBytes and :max_fs_stat_bytes' if attributes.key?(:'maxFsStatBytes') && attributes.key?(:'max_fs_stat_bytes')

      self.max_fs_stat_bytes = attributes[:'max_fs_stat_bytes'] if attributes[:'max_fs_stat_bytes']

      self.max_fs_stat_files = attributes[:'maxFsStatFiles'] if attributes[:'maxFsStatFiles']

      raise 'You cannot provide both :maxFsStatFiles and :max_fs_stat_files' if attributes.key?(:'maxFsStatFiles') && attributes.key?(:'max_fs_stat_files')

      self.max_fs_stat_files = attributes[:'max_fs_stat_files'] if attributes[:'max_fs_stat_files']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        max_fs_stat_bytes == other.max_fs_stat_bytes &&
        max_fs_stat_files == other.max_fs_stat_files
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
      [display_name, max_fs_stat_bytes, max_fs_stat_files].hash
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
