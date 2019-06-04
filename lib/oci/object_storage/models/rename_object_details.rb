# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::RenameObjectDetails
    # **[Required]** The name of the source object to be renamed.
    # @return [String]
    attr_accessor :source_name

    # **[Required]** The new name of the source object.
    # @return [String]
    attr_accessor :new_name

    # The if-match entity tag (ETag) of the source object.
    # @return [String]
    attr_accessor :src_obj_if_match_e_tag

    # The if-match entity tag (ETag) of the new object.
    # @return [String]
    attr_accessor :new_obj_if_match_e_tag

    # The if-none-match entity tag (ETag) of the new object.
    # @return [String]
    attr_accessor :new_obj_if_none_match_e_tag

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_name': :'sourceName',
        'new_name': :'newName',
        'src_obj_if_match_e_tag': :'srcObjIfMatchETag',
        'new_obj_if_match_e_tag': :'newObjIfMatchETag',
        'new_obj_if_none_match_e_tag': :'newObjIfNoneMatchETag'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_name': :'String',
        'new_name': :'String',
        'src_obj_if_match_e_tag': :'String',
        'new_obj_if_match_e_tag': :'String',
        'new_obj_if_none_match_e_tag': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_name The value to assign to the {#source_name} property
    # @option attributes [String] :new_name The value to assign to the {#new_name} property
    # @option attributes [String] :src_obj_if_match_e_tag The value to assign to the {#src_obj_if_match_e_tag} property
    # @option attributes [String] :new_obj_if_match_e_tag The value to assign to the {#new_obj_if_match_e_tag} property
    # @option attributes [String] :new_obj_if_none_match_e_tag The value to assign to the {#new_obj_if_none_match_e_tag} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_name = attributes[:'sourceName'] if attributes[:'sourceName']

      raise 'You cannot provide both :sourceName and :source_name' if attributes.key?(:'sourceName') && attributes.key?(:'source_name')

      self.source_name = attributes[:'source_name'] if attributes[:'source_name']

      self.new_name = attributes[:'newName'] if attributes[:'newName']

      raise 'You cannot provide both :newName and :new_name' if attributes.key?(:'newName') && attributes.key?(:'new_name')

      self.new_name = attributes[:'new_name'] if attributes[:'new_name']

      self.src_obj_if_match_e_tag = attributes[:'srcObjIfMatchETag'] if attributes[:'srcObjIfMatchETag']

      raise 'You cannot provide both :srcObjIfMatchETag and :src_obj_if_match_e_tag' if attributes.key?(:'srcObjIfMatchETag') && attributes.key?(:'src_obj_if_match_e_tag')

      self.src_obj_if_match_e_tag = attributes[:'src_obj_if_match_e_tag'] if attributes[:'src_obj_if_match_e_tag']

      self.new_obj_if_match_e_tag = attributes[:'newObjIfMatchETag'] if attributes[:'newObjIfMatchETag']

      raise 'You cannot provide both :newObjIfMatchETag and :new_obj_if_match_e_tag' if attributes.key?(:'newObjIfMatchETag') && attributes.key?(:'new_obj_if_match_e_tag')

      self.new_obj_if_match_e_tag = attributes[:'new_obj_if_match_e_tag'] if attributes[:'new_obj_if_match_e_tag']

      self.new_obj_if_none_match_e_tag = attributes[:'newObjIfNoneMatchETag'] if attributes[:'newObjIfNoneMatchETag']

      raise 'You cannot provide both :newObjIfNoneMatchETag and :new_obj_if_none_match_e_tag' if attributes.key?(:'newObjIfNoneMatchETag') && attributes.key?(:'new_obj_if_none_match_e_tag')

      self.new_obj_if_none_match_e_tag = attributes[:'new_obj_if_none_match_e_tag'] if attributes[:'new_obj_if_none_match_e_tag']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_name == other.source_name &&
        new_name == other.new_name &&
        src_obj_if_match_e_tag == other.src_obj_if_match_e_tag &&
        new_obj_if_match_e_tag == other.new_obj_if_match_e_tag &&
        new_obj_if_none_match_e_tag == other.new_obj_if_none_match_e_tag
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
      [source_name, new_name, src_obj_if_match_e_tag, new_obj_if_match_e_tag, new_obj_if_none_match_e_tag].hash
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
