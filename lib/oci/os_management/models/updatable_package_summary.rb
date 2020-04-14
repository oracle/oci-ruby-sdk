# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A software package available for update on a managed instance
  class OsManagement::Models::UpdatablePackageSummary
    # **[Required]** Package name
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Unique name for the package.
    # @return [String]
    attr_accessor :name

    # Unique name for the package available for update.
    # @return [String]
    attr_accessor :available_package_name

    # **[Required]** Type of the update.
    # @return [String]
    attr_accessor :type

    # **[Required]** Version of the installed package
    # @return [String]
    attr_accessor :installed_version

    # **[Required]** Version of the package available for update
    # @return [String]
    attr_accessor :available_version

    # The architecture for which this package was built
    # @return [String]
    attr_accessor :architecture

    # list of software sources that provide the software package
    # @return [Array<OCI::OsManagement::Models::SoftwareSourceId>]
    attr_accessor :software_sources

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'name': :'name',
        'available_package_name': :'availablePackageName',
        'type': :'type',
        'installed_version': :'installedVersion',
        'available_version': :'availableVersion',
        'architecture': :'architecture',
        'software_sources': :'softwareSources'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'name': :'String',
        'available_package_name': :'String',
        'type': :'String',
        'installed_version': :'String',
        'available_version': :'String',
        'architecture': :'String',
        'software_sources': :'Array<OCI::OsManagement::Models::SoftwareSourceId>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :available_package_name The value to assign to the {#available_package_name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :installed_version The value to assign to the {#installed_version} property
    # @option attributes [String] :available_version The value to assign to the {#available_version} property
    # @option attributes [String] :architecture The value to assign to the {#architecture} property
    # @option attributes [Array<OCI::OsManagement::Models::SoftwareSourceId>] :software_sources The value to assign to the {#software_sources} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.name = attributes[:'name'] if attributes[:'name']

      self.available_package_name = attributes[:'availablePackageName'] if attributes[:'availablePackageName']

      raise 'You cannot provide both :availablePackageName and :available_package_name' if attributes.key?(:'availablePackageName') && attributes.key?(:'available_package_name')

      self.available_package_name = attributes[:'available_package_name'] if attributes[:'available_package_name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.installed_version = attributes[:'installedVersion'] if attributes[:'installedVersion']

      raise 'You cannot provide both :installedVersion and :installed_version' if attributes.key?(:'installedVersion') && attributes.key?(:'installed_version')

      self.installed_version = attributes[:'installed_version'] if attributes[:'installed_version']

      self.available_version = attributes[:'availableVersion'] if attributes[:'availableVersion']

      raise 'You cannot provide both :availableVersion and :available_version' if attributes.key?(:'availableVersion') && attributes.key?(:'available_version')

      self.available_version = attributes[:'available_version'] if attributes[:'available_version']

      self.architecture = attributes[:'architecture'] if attributes[:'architecture']

      self.software_sources = attributes[:'softwareSources'] if attributes[:'softwareSources']

      raise 'You cannot provide both :softwareSources and :software_sources' if attributes.key?(:'softwareSources') && attributes.key?(:'software_sources')

      self.software_sources = attributes[:'software_sources'] if attributes[:'software_sources']
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
        name == other.name &&
        available_package_name == other.available_package_name &&
        type == other.type &&
        installed_version == other.installed_version &&
        available_version == other.available_version &&
        architecture == other.architecture &&
        software_sources == other.software_sources
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
      [display_name, name, available_package_name, type, installed_version, available_version, architecture, software_sources].hash
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
