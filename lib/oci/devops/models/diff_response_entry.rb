# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Entry for description of change on a file.
  class Devops::Models::DiffResponseEntry
    # **[Required]** Type of change made to file.
    # @return [String]
    attr_accessor :change_type

    # The type of the changed object.
    # @return [String]
    attr_accessor :object_type

    # The ID of the commit where the change is coming from.
    # @return [String]
    attr_accessor :commit_id

    # The path on the target to the changed object.
    # @return [String]
    attr_accessor :old_path

    # The path on the source to the changed object.
    # @return [String]
    attr_accessor :new_path

    # The ID of the changed object on the target.
    # @return [String]
    attr_accessor :old_id

    # The ID of the changed object on the source.
    # @return [String]
    attr_accessor :new_id

    # The URL of the changed object.
    # @return [String]
    attr_accessor :url

    # The number of lines added in whole difference.
    # @return [Integer]
    attr_accessor :added_lines_count

    # The number of lines deleted in whole difference.
    # @return [Integer]
    attr_accessor :deleted_lines_count

    # Indicates whether the changed file contains conflicts.
    # @return [BOOLEAN]
    attr_accessor :are_conflicts_in_file

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'change_type': :'changeType',
        'object_type': :'objectType',
        'commit_id': :'commitId',
        'old_path': :'oldPath',
        'new_path': :'newPath',
        'old_id': :'oldId',
        'new_id': :'newId',
        'url': :'url',
        'added_lines_count': :'addedLinesCount',
        'deleted_lines_count': :'deletedLinesCount',
        'are_conflicts_in_file': :'areConflictsInFile'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'change_type': :'String',
        'object_type': :'String',
        'commit_id': :'String',
        'old_path': :'String',
        'new_path': :'String',
        'old_id': :'String',
        'new_id': :'String',
        'url': :'String',
        'added_lines_count': :'Integer',
        'deleted_lines_count': :'Integer',
        'are_conflicts_in_file': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :change_type The value to assign to the {#change_type} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :commit_id The value to assign to the {#commit_id} property
    # @option attributes [String] :old_path The value to assign to the {#old_path} property
    # @option attributes [String] :new_path The value to assign to the {#new_path} property
    # @option attributes [String] :old_id The value to assign to the {#old_id} property
    # @option attributes [String] :new_id The value to assign to the {#new_id} property
    # @option attributes [String] :url The value to assign to the {#url} property
    # @option attributes [Integer] :added_lines_count The value to assign to the {#added_lines_count} property
    # @option attributes [Integer] :deleted_lines_count The value to assign to the {#deleted_lines_count} property
    # @option attributes [BOOLEAN] :are_conflicts_in_file The value to assign to the {#are_conflicts_in_file} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.change_type = attributes[:'changeType'] if attributes[:'changeType']

      raise 'You cannot provide both :changeType and :change_type' if attributes.key?(:'changeType') && attributes.key?(:'change_type')

      self.change_type = attributes[:'change_type'] if attributes[:'change_type']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.commit_id = attributes[:'commitId'] if attributes[:'commitId']

      raise 'You cannot provide both :commitId and :commit_id' if attributes.key?(:'commitId') && attributes.key?(:'commit_id')

      self.commit_id = attributes[:'commit_id'] if attributes[:'commit_id']

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

      self.url = attributes[:'url'] if attributes[:'url']

      self.added_lines_count = attributes[:'addedLinesCount'] if attributes[:'addedLinesCount']

      raise 'You cannot provide both :addedLinesCount and :added_lines_count' if attributes.key?(:'addedLinesCount') && attributes.key?(:'added_lines_count')

      self.added_lines_count = attributes[:'added_lines_count'] if attributes[:'added_lines_count']

      self.deleted_lines_count = attributes[:'deletedLinesCount'] if attributes[:'deletedLinesCount']

      raise 'You cannot provide both :deletedLinesCount and :deleted_lines_count' if attributes.key?(:'deletedLinesCount') && attributes.key?(:'deleted_lines_count')

      self.deleted_lines_count = attributes[:'deleted_lines_count'] if attributes[:'deleted_lines_count']

      self.are_conflicts_in_file = attributes[:'areConflictsInFile'] unless attributes[:'areConflictsInFile'].nil?

      raise 'You cannot provide both :areConflictsInFile and :are_conflicts_in_file' if attributes.key?(:'areConflictsInFile') && attributes.key?(:'are_conflicts_in_file')

      self.are_conflicts_in_file = attributes[:'are_conflicts_in_file'] unless attributes[:'are_conflicts_in_file'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        change_type == other.change_type &&
        object_type == other.object_type &&
        commit_id == other.commit_id &&
        old_path == other.old_path &&
        new_path == other.new_path &&
        old_id == other.old_id &&
        new_id == other.new_id &&
        url == other.url &&
        added_lines_count == other.added_lines_count &&
        deleted_lines_count == other.deleted_lines_count &&
        are_conflicts_in_file == other.are_conflicts_in_file
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
      [change_type, object_type, commit_id, old_path, new_path, old_id, new_id, url, added_lines_count, deleted_lines_count, are_conflicts_in_file].hash
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
