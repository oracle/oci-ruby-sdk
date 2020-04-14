# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Important changes for software. This can include security advisories, bug fixes, or enhancements.
  class OsManagement::Models::ErratumSummary
    ADVISORY_TYPE_ENUM = [
      ADVISORY_TYPE_SECURITY = 'SECURITY'.freeze,
      ADVISORY_TYPE_BUG = 'BUG'.freeze,
      ADVISORY_TYPE_ENHANCEMENT = 'ENHANCEMENT'.freeze
    ].freeze

    # **[Required]** Advisory name
    # @return [String]
    attr_accessor :name

    # **[Required]** OCID for the Erratum.
    # @return [String]
    attr_accessor :id

    # **[Required]** OCID for the Compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Summary description of the erratum.
    # @return [String]
    attr_accessor :synopsis

    # date the erratum was issued
    # @return [String]
    attr_accessor :issued

    # most recent date the erratum was updated
    # @return [String]
    attr_accessor :updated

    # Type of the erratum.
    # @return [String]
    attr_reader :advisory_type

    # list of CVEs applicable to this erratum
    # @return [Array<String>]
    attr_accessor :related_cves

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'synopsis': :'synopsis',
        'issued': :'issued',
        'updated': :'updated',
        'advisory_type': :'advisoryType',
        'related_cves': :'relatedCves'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'synopsis': :'String',
        'issued': :'String',
        'updated': :'String',
        'advisory_type': :'String',
        'related_cves': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :synopsis The value to assign to the {#synopsis} property
    # @option attributes [String] :issued The value to assign to the {#issued} property
    # @option attributes [String] :updated The value to assign to the {#updated} property
    # @option attributes [String] :advisory_type The value to assign to the {#advisory_type} property
    # @option attributes [Array<String>] :related_cves The value to assign to the {#related_cves} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.synopsis = attributes[:'synopsis'] if attributes[:'synopsis']

      self.issued = attributes[:'issued'] if attributes[:'issued']

      self.updated = attributes[:'updated'] if attributes[:'updated']

      self.advisory_type = attributes[:'advisoryType'] if attributes[:'advisoryType']

      raise 'You cannot provide both :advisoryType and :advisory_type' if attributes.key?(:'advisoryType') && attributes.key?(:'advisory_type')

      self.advisory_type = attributes[:'advisory_type'] if attributes[:'advisory_type']

      self.related_cves = attributes[:'relatedCves'] if attributes[:'relatedCves']

      raise 'You cannot provide both :relatedCves and :related_cves' if attributes.key?(:'relatedCves') && attributes.key?(:'related_cves')

      self.related_cves = attributes[:'related_cves'] if attributes[:'related_cves']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] advisory_type Object to be assigned
    def advisory_type=(advisory_type)
      raise "Invalid value for 'advisory_type': this must be one of the values in ADVISORY_TYPE_ENUM." if advisory_type && !ADVISORY_TYPE_ENUM.include?(advisory_type)

      @advisory_type = advisory_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        synopsis == other.synopsis &&
        issued == other.issued &&
        updated == other.updated &&
        advisory_type == other.advisory_type &&
        related_cves == other.related_cves
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
      [name, id, compartment_id, synopsis, issued, updated, advisory_type, related_cves].hash
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
