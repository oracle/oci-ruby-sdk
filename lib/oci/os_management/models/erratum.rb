# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about the erratum.
  class OsManagement::Models::Erratum
    ADVISORY_TYPE_ENUM = [
      ADVISORY_TYPE_SECURITY = 'SECURITY'.freeze,
      ADVISORY_TYPE_BUG = 'BUG'.freeze,
      ADVISORY_TYPE_ENHANCEMENT = 'ENHANCEMENT'.freeze,
      ADVISORY_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    # Details describing the erratum.
    # @return [String]
    attr_accessor :description

    # most recent date the erratum was updated
    # @return [String]
    attr_accessor :updated

    # Type of the erratum.
    # @return [String]
    attr_reader :advisory_type

    # Information specifying from where the erratum was release.
    # @return [String]
    attr_accessor :from

    # Information describing how the erratum can be resolved.
    # @return [String]
    attr_accessor :solution

    # Information describing how to find more information about the erratum.
    # @return [String]
    attr_accessor :references

    # list of managed instances  to this erratum
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :affected_instances

    # list of CVEs applicable to this erratum
    # @return [Array<String>]
    attr_accessor :related_cves

    # list of Software Sources
    # @return [Array<OCI::OsManagement::Models::Id>]
    attr_accessor :software_sources

    # list of Packages affected by this erratum
    # @return [Array<OCI::OsManagement::Models::SoftwarePackageSummary>]
    attr_accessor :packages

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'synopsis': :'synopsis',
        'issued': :'issued',
        'description': :'description',
        'updated': :'updated',
        'advisory_type': :'advisoryType',
        'from': :'from',
        'solution': :'solution',
        'references': :'references',
        'affected_instances': :'affectedInstances',
        'related_cves': :'relatedCves',
        'software_sources': :'softwareSources',
        'packages': :'packages'
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
        'description': :'String',
        'updated': :'String',
        'advisory_type': :'String',
        'from': :'String',
        'solution': :'String',
        'references': :'String',
        'affected_instances': :'Array<OCI::OsManagement::Models::Id>',
        'related_cves': :'Array<String>',
        'software_sources': :'Array<OCI::OsManagement::Models::Id>',
        'packages': :'Array<OCI::OsManagement::Models::SoftwarePackageSummary>'
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
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :updated The value to assign to the {#updated} property
    # @option attributes [String] :advisory_type The value to assign to the {#advisory_type} property
    # @option attributes [String] :from The value to assign to the {#from} property
    # @option attributes [String] :solution The value to assign to the {#solution} property
    # @option attributes [String] :references The value to assign to the {#references} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :affected_instances The value to assign to the {#affected_instances} property
    # @option attributes [Array<String>] :related_cves The value to assign to the {#related_cves} property
    # @option attributes [Array<OCI::OsManagement::Models::Id>] :software_sources The value to assign to the {#software_sources} property
    # @option attributes [Array<OCI::OsManagement::Models::SoftwarePackageSummary>] :packages The value to assign to the {#packages} property
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

      self.description = attributes[:'description'] if attributes[:'description']

      self.updated = attributes[:'updated'] if attributes[:'updated']

      self.advisory_type = attributes[:'advisoryType'] if attributes[:'advisoryType']

      raise 'You cannot provide both :advisoryType and :advisory_type' if attributes.key?(:'advisoryType') && attributes.key?(:'advisory_type')

      self.advisory_type = attributes[:'advisory_type'] if attributes[:'advisory_type']

      self.from = attributes[:'from'] if attributes[:'from']

      self.solution = attributes[:'solution'] if attributes[:'solution']

      self.references = attributes[:'references'] if attributes[:'references']

      self.affected_instances = attributes[:'affectedInstances'] if attributes[:'affectedInstances']

      raise 'You cannot provide both :affectedInstances and :affected_instances' if attributes.key?(:'affectedInstances') && attributes.key?(:'affected_instances')

      self.affected_instances = attributes[:'affected_instances'] if attributes[:'affected_instances']

      self.related_cves = attributes[:'relatedCves'] if attributes[:'relatedCves']

      raise 'You cannot provide both :relatedCves and :related_cves' if attributes.key?(:'relatedCves') && attributes.key?(:'related_cves')

      self.related_cves = attributes[:'related_cves'] if attributes[:'related_cves']

      self.software_sources = attributes[:'softwareSources'] if attributes[:'softwareSources']

      raise 'You cannot provide both :softwareSources and :software_sources' if attributes.key?(:'softwareSources') && attributes.key?(:'software_sources')

      self.software_sources = attributes[:'software_sources'] if attributes[:'software_sources']

      self.packages = attributes[:'packages'] if attributes[:'packages']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] advisory_type Object to be assigned
    def advisory_type=(advisory_type)
      # rubocop:disable Style/ConditionalAssignment
      if advisory_type && !ADVISORY_TYPE_ENUM.include?(advisory_type)
        OCI.logger.debug("Unknown value for 'advisory_type' [" + advisory_type + "]. Mapping to 'ADVISORY_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @advisory_type = ADVISORY_TYPE_UNKNOWN_ENUM_VALUE
      else
        @advisory_type = advisory_type
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
        id == other.id &&
        compartment_id == other.compartment_id &&
        synopsis == other.synopsis &&
        issued == other.issued &&
        description == other.description &&
        updated == other.updated &&
        advisory_type == other.advisory_type &&
        from == other.from &&
        solution == other.solution &&
        references == other.references &&
        affected_instances == other.affected_instances &&
        related_cves == other.related_cves &&
        software_sources == other.software_sources &&
        packages == other.packages
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
      [name, id, compartment_id, synopsis, issued, description, updated, advisory_type, from, solution, references, affected_instances, related_cves, software_sources, packages].hash
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
