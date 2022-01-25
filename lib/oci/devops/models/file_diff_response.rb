# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Response object for showing differences for a file between two commits.
  class Devops::Models::FileDiffResponse
    # The path on the base version to the changed object.
    # @return [String]
    attr_accessor :old_path

    # The path on the target version to the changed object.
    # @return [String]
    attr_accessor :new_path

    # The ID of the changed object on the base version.
    # @return [String]
    attr_accessor :old_id

    # The ID of the changed object on the target version.
    # @return [String]
    attr_accessor :new_id

    # Indicates whether the changed file contains conflicts.
    # @return [BOOLEAN]
    attr_accessor :are_conflicts_in_file

    # Indicates whether the file is large.
    # @return [BOOLEAN]
    attr_accessor :is_large

    # Indicates whether the file is binary.
    # @return [BOOLEAN]
    attr_accessor :is_binary

    # **[Required]** List of changed section in the file.
    # @return [Array<OCI::Devops::Models::DiffChunk>]
    attr_accessor :changes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'old_path': :'oldPath',
        'new_path': :'newPath',
        'old_id': :'oldId',
        'new_id': :'newId',
        'are_conflicts_in_file': :'areConflictsInFile',
        'is_large': :'isLarge',
        'is_binary': :'isBinary',
        'changes': :'changes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'old_path': :'String',
        'new_path': :'String',
        'old_id': :'String',
        'new_id': :'String',
        'are_conflicts_in_file': :'BOOLEAN',
        'is_large': :'BOOLEAN',
        'is_binary': :'BOOLEAN',
        'changes': :'Array<OCI::Devops::Models::DiffChunk>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :old_path The value to assign to the {#old_path} property
    # @option attributes [String] :new_path The value to assign to the {#new_path} property
    # @option attributes [String] :old_id The value to assign to the {#old_id} property
    # @option attributes [String] :new_id The value to assign to the {#new_id} property
    # @option attributes [BOOLEAN] :are_conflicts_in_file The value to assign to the {#are_conflicts_in_file} property
    # @option attributes [BOOLEAN] :is_large The value to assign to the {#is_large} property
    # @option attributes [BOOLEAN] :is_binary The value to assign to the {#is_binary} property
    # @option attributes [Array<OCI::Devops::Models::DiffChunk>] :changes The value to assign to the {#changes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.old_path = attributes[:'oldPath'] if attributes[:'oldPath']

      raise 'You cannot provide both :oldPath and :old_path' if attributes.key?(:'oldPath') && attributes.key?(:'old_path')

      self.old_path = attributes[:'old_path'] if attributes[:'old_path']

      self.new_path = attributes[:'newPath'] if attributes[:'newPath']

      raise 'You cannot provide both :newPath and :new_path' if attributes.key?(:'newPath') && attributes.key?(:'new_path')

      self.new_path = attributes[:'new_path'] if attributes[:'new_path']

      self.old_id = attributes[:'oldId'] if attributes[:'oldId']

      raise 'You cannot provide both :oldId and :old_id' if attributes.key?(:'oldId') && attributes.key?(:'old_id')

      self.old_id = attributes[:'old_id'] if attributes[:'old_id']

      self.new_id = attributes[:'newId'] if attributes[:'newId']

      raise 'You cannot provide both :newId and :new_id' if attributes.key?(:'newId') && attributes.key?(:'new_id')

      self.new_id = attributes[:'new_id'] if attributes[:'new_id']

      self.are_conflicts_in_file = attributes[:'areConflictsInFile'] unless attributes[:'areConflictsInFile'].nil?

      raise 'You cannot provide both :areConflictsInFile and :are_conflicts_in_file' if attributes.key?(:'areConflictsInFile') && attributes.key?(:'are_conflicts_in_file')

      self.are_conflicts_in_file = attributes[:'are_conflicts_in_file'] unless attributes[:'are_conflicts_in_file'].nil?

      self.is_large = attributes[:'isLarge'] unless attributes[:'isLarge'].nil?

      raise 'You cannot provide both :isLarge and :is_large' if attributes.key?(:'isLarge') && attributes.key?(:'is_large')

      self.is_large = attributes[:'is_large'] unless attributes[:'is_large'].nil?

      self.is_binary = attributes[:'isBinary'] unless attributes[:'isBinary'].nil?

      raise 'You cannot provide both :isBinary and :is_binary' if attributes.key?(:'isBinary') && attributes.key?(:'is_binary')

      self.is_binary = attributes[:'is_binary'] unless attributes[:'is_binary'].nil?

      self.changes = attributes[:'changes'] if attributes[:'changes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        old_path == other.old_path &&
        new_path == other.new_path &&
        old_id == other.old_id &&
        new_id == other.new_id &&
        are_conflicts_in_file == other.are_conflicts_in_file &&
        is_large == other.is_large &&
        is_binary == other.is_binary &&
        changes == other.changes
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
      [old_path, new_path, old_id, new_id, are_conflicts_in_file, is_large, is_binary, changes].hash
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
