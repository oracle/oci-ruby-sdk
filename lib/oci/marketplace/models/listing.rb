# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for an Oracle Cloud Infrastructure Marketplace listing.
  class Marketplace::Models::Listing
    COMPATIBLE_ARCHITECTURES_ENUM = [
      COMPATIBLE_ARCHITECTURES_X86 = 'X86'.freeze,
      COMPATIBLE_ARCHITECTURES_ARM = 'ARM'.freeze,
      COMPATIBLE_ARCHITECTURES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PACKAGE_TYPE_ENUM = [
      PACKAGE_TYPE_ORCHESTRATION = 'ORCHESTRATION'.freeze,
      PACKAGE_TYPE_IMAGE = 'IMAGE'.freeze,
      PACKAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LISTING_TYPE_ENUM = [
      LISTING_TYPE_COMMUNITY = 'COMMUNITY'.freeze,
      LISTING_TYPE_PARTNER = 'PARTNER'.freeze,
      LISTING_TYPE_PRIVATE = 'PRIVATE'.freeze,
      LISTING_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The unique identifier for the listing in Marketplace.
    # @return [String]
    attr_accessor :id

    # The name of the listing.
    # @return [String]
    attr_accessor :name

    # The version of the listing.
    # @return [String]
    attr_accessor :version

    # The tagline of the listing.
    # @return [String]
    attr_accessor :tagline

    # Keywords associated with the listing.
    # @return [String]
    attr_accessor :keywords

    # A short description of the listing.
    # @return [String]
    attr_accessor :short_description

    # Usage information for the listing.
    # @return [String]
    attr_accessor :usage_information

    # A long description of the listing.
    # @return [String]
    attr_accessor :long_description

    # A description of the publisher's licensing model for the listing.
    # @return [String]
    attr_accessor :license_model_description

    # System requirements for the listing.
    # @return [String]
    attr_accessor :system_requirements

    # The release date of the listing.
    # @return [DateTime]
    attr_accessor :time_released

    # Release notes for the listing.
    # @return [String]
    attr_accessor :release_notes

    # Categories that the listing belongs to.
    # @return [Array<String>]
    attr_accessor :categories

    # @return [OCI::Marketplace::Models::Publisher]
    attr_accessor :publisher

    # Languages supported by the listing.
    # @return [Array<OCI::Marketplace::Models::Item>]
    attr_accessor :languages

    # Screenshots of the listing.
    # @return [Array<OCI::Marketplace::Models::Screenshot>]
    attr_accessor :screenshots

    # Videos of the listing.
    # @return [Array<OCI::Marketplace::Models::NamedLink>]
    attr_accessor :videos

    # Contact information to use to get support from the publisher for the listing.
    # @return [Array<OCI::Marketplace::Models::SupportContact>]
    attr_accessor :support_contacts

    # Links to support resources for the listing.
    # @return [Array<OCI::Marketplace::Models::NamedLink>]
    attr_accessor :support_links

    # Links to additional documentation provided by the publisher specifically for the listing.
    # @return [Array<OCI::Marketplace::Models::DocumentationLink>]
    attr_accessor :documentation_links

    # @return [OCI::Marketplace::Models::UploadData]
    attr_accessor :icon

    # @return [OCI::Marketplace::Models::UploadData]
    attr_accessor :banner

    # The list of compatible architectures supported by the listing
    # @return [Array<String>]
    attr_reader :compatible_architectures

    # The regions where you can deploy the listing. (Some listings have restrictions that limit their deployment to United States regions only.)
    #
    # @return [Array<OCI::Marketplace::Models::Region>]
    attr_accessor :regions

    # The listing's package type.
    # @return [String]
    attr_reader :package_type

    # The default package version.
    # @return [String]
    attr_accessor :default_package_version

    # Links to reference material.
    # @return [Array<OCI::Marketplace::Models::Link>]
    attr_accessor :links

    # Indicates whether the listing is included in Featured Listings.
    # @return [BOOLEAN]
    attr_accessor :is_featured

    # The publisher category to which the listing belongs. The publisher category informs where the listing appears for use.
    # @return [String]
    attr_reader :listing_type

    # List of operating systems supported by the listing.
    # @return [Array<OCI::Marketplace::Models::OperatingSystem>]
    attr_accessor :supported_operating_systems

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'version': :'version',
        'tagline': :'tagline',
        'keywords': :'keywords',
        'short_description': :'shortDescription',
        'usage_information': :'usageInformation',
        'long_description': :'longDescription',
        'license_model_description': :'licenseModelDescription',
        'system_requirements': :'systemRequirements',
        'time_released': :'timeReleased',
        'release_notes': :'releaseNotes',
        'categories': :'categories',
        'publisher': :'publisher',
        'languages': :'languages',
        'screenshots': :'screenshots',
        'videos': :'videos',
        'support_contacts': :'supportContacts',
        'support_links': :'supportLinks',
        'documentation_links': :'documentationLinks',
        'icon': :'icon',
        'banner': :'banner',
        'compatible_architectures': :'compatibleArchitectures',
        'regions': :'regions',
        'package_type': :'packageType',
        'default_package_version': :'defaultPackageVersion',
        'links': :'links',
        'is_featured': :'isFeatured',
        'listing_type': :'listingType',
        'supported_operating_systems': :'supportedOperatingSystems'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'version': :'String',
        'tagline': :'String',
        'keywords': :'String',
        'short_description': :'String',
        'usage_information': :'String',
        'long_description': :'String',
        'license_model_description': :'String',
        'system_requirements': :'String',
        'time_released': :'DateTime',
        'release_notes': :'String',
        'categories': :'Array<String>',
        'publisher': :'OCI::Marketplace::Models::Publisher',
        'languages': :'Array<OCI::Marketplace::Models::Item>',
        'screenshots': :'Array<OCI::Marketplace::Models::Screenshot>',
        'videos': :'Array<OCI::Marketplace::Models::NamedLink>',
        'support_contacts': :'Array<OCI::Marketplace::Models::SupportContact>',
        'support_links': :'Array<OCI::Marketplace::Models::NamedLink>',
        'documentation_links': :'Array<OCI::Marketplace::Models::DocumentationLink>',
        'icon': :'OCI::Marketplace::Models::UploadData',
        'banner': :'OCI::Marketplace::Models::UploadData',
        'compatible_architectures': :'Array<String>',
        'regions': :'Array<OCI::Marketplace::Models::Region>',
        'package_type': :'String',
        'default_package_version': :'String',
        'links': :'Array<OCI::Marketplace::Models::Link>',
        'is_featured': :'BOOLEAN',
        'listing_type': :'String',
        'supported_operating_systems': :'Array<OCI::Marketplace::Models::OperatingSystem>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [String] :tagline The value to assign to the {#tagline} property
    # @option attributes [String] :keywords The value to assign to the {#keywords} property
    # @option attributes [String] :short_description The value to assign to the {#short_description} property
    # @option attributes [String] :usage_information The value to assign to the {#usage_information} property
    # @option attributes [String] :long_description The value to assign to the {#long_description} property
    # @option attributes [String] :license_model_description The value to assign to the {#license_model_description} property
    # @option attributes [String] :system_requirements The value to assign to the {#system_requirements} property
    # @option attributes [DateTime] :time_released The value to assign to the {#time_released} property
    # @option attributes [String] :release_notes The value to assign to the {#release_notes} property
    # @option attributes [Array<String>] :categories The value to assign to the {#categories} property
    # @option attributes [OCI::Marketplace::Models::Publisher] :publisher The value to assign to the {#publisher} property
    # @option attributes [Array<OCI::Marketplace::Models::Item>] :languages The value to assign to the {#languages} property
    # @option attributes [Array<OCI::Marketplace::Models::Screenshot>] :screenshots The value to assign to the {#screenshots} property
    # @option attributes [Array<OCI::Marketplace::Models::NamedLink>] :videos The value to assign to the {#videos} property
    # @option attributes [Array<OCI::Marketplace::Models::SupportContact>] :support_contacts The value to assign to the {#support_contacts} property
    # @option attributes [Array<OCI::Marketplace::Models::NamedLink>] :support_links The value to assign to the {#support_links} property
    # @option attributes [Array<OCI::Marketplace::Models::DocumentationLink>] :documentation_links The value to assign to the {#documentation_links} property
    # @option attributes [OCI::Marketplace::Models::UploadData] :icon The value to assign to the {#icon} property
    # @option attributes [OCI::Marketplace::Models::UploadData] :banner The value to assign to the {#banner} property
    # @option attributes [Array<String>] :compatible_architectures The value to assign to the {#compatible_architectures} property
    # @option attributes [Array<OCI::Marketplace::Models::Region>] :regions The value to assign to the {#regions} property
    # @option attributes [String] :package_type The value to assign to the {#package_type} property
    # @option attributes [String] :default_package_version The value to assign to the {#default_package_version} property
    # @option attributes [Array<OCI::Marketplace::Models::Link>] :links The value to assign to the {#links} property
    # @option attributes [BOOLEAN] :is_featured The value to assign to the {#is_featured} property
    # @option attributes [String] :listing_type The value to assign to the {#listing_type} property
    # @option attributes [Array<OCI::Marketplace::Models::OperatingSystem>] :supported_operating_systems The value to assign to the {#supported_operating_systems} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.version = attributes[:'version'] if attributes[:'version']

      self.tagline = attributes[:'tagline'] if attributes[:'tagline']

      self.keywords = attributes[:'keywords'] if attributes[:'keywords']

      self.short_description = attributes[:'shortDescription'] if attributes[:'shortDescription']

      raise 'You cannot provide both :shortDescription and :short_description' if attributes.key?(:'shortDescription') && attributes.key?(:'short_description')

      self.short_description = attributes[:'short_description'] if attributes[:'short_description']

      self.usage_information = attributes[:'usageInformation'] if attributes[:'usageInformation']

      raise 'You cannot provide both :usageInformation and :usage_information' if attributes.key?(:'usageInformation') && attributes.key?(:'usage_information')

      self.usage_information = attributes[:'usage_information'] if attributes[:'usage_information']

      self.long_description = attributes[:'longDescription'] if attributes[:'longDescription']

      raise 'You cannot provide both :longDescription and :long_description' if attributes.key?(:'longDescription') && attributes.key?(:'long_description')

      self.long_description = attributes[:'long_description'] if attributes[:'long_description']

      self.license_model_description = attributes[:'licenseModelDescription'] if attributes[:'licenseModelDescription']

      raise 'You cannot provide both :licenseModelDescription and :license_model_description' if attributes.key?(:'licenseModelDescription') && attributes.key?(:'license_model_description')

      self.license_model_description = attributes[:'license_model_description'] if attributes[:'license_model_description']

      self.system_requirements = attributes[:'systemRequirements'] if attributes[:'systemRequirements']

      raise 'You cannot provide both :systemRequirements and :system_requirements' if attributes.key?(:'systemRequirements') && attributes.key?(:'system_requirements')

      self.system_requirements = attributes[:'system_requirements'] if attributes[:'system_requirements']

      self.time_released = attributes[:'timeReleased'] if attributes[:'timeReleased']

      raise 'You cannot provide both :timeReleased and :time_released' if attributes.key?(:'timeReleased') && attributes.key?(:'time_released')

      self.time_released = attributes[:'time_released'] if attributes[:'time_released']

      self.release_notes = attributes[:'releaseNotes'] if attributes[:'releaseNotes']

      raise 'You cannot provide both :releaseNotes and :release_notes' if attributes.key?(:'releaseNotes') && attributes.key?(:'release_notes')

      self.release_notes = attributes[:'release_notes'] if attributes[:'release_notes']

      self.categories = attributes[:'categories'] if attributes[:'categories']

      self.publisher = attributes[:'publisher'] if attributes[:'publisher']

      self.languages = attributes[:'languages'] if attributes[:'languages']

      self.screenshots = attributes[:'screenshots'] if attributes[:'screenshots']

      self.videos = attributes[:'videos'] if attributes[:'videos']

      self.support_contacts = attributes[:'supportContacts'] if attributes[:'supportContacts']

      raise 'You cannot provide both :supportContacts and :support_contacts' if attributes.key?(:'supportContacts') && attributes.key?(:'support_contacts')

      self.support_contacts = attributes[:'support_contacts'] if attributes[:'support_contacts']

      self.support_links = attributes[:'supportLinks'] if attributes[:'supportLinks']

      raise 'You cannot provide both :supportLinks and :support_links' if attributes.key?(:'supportLinks') && attributes.key?(:'support_links')

      self.support_links = attributes[:'support_links'] if attributes[:'support_links']

      self.documentation_links = attributes[:'documentationLinks'] if attributes[:'documentationLinks']

      raise 'You cannot provide both :documentationLinks and :documentation_links' if attributes.key?(:'documentationLinks') && attributes.key?(:'documentation_links')

      self.documentation_links = attributes[:'documentation_links'] if attributes[:'documentation_links']

      self.icon = attributes[:'icon'] if attributes[:'icon']

      self.banner = attributes[:'banner'] if attributes[:'banner']

      self.compatible_architectures = attributes[:'compatibleArchitectures'] if attributes[:'compatibleArchitectures']

      raise 'You cannot provide both :compatibleArchitectures and :compatible_architectures' if attributes.key?(:'compatibleArchitectures') && attributes.key?(:'compatible_architectures')

      self.compatible_architectures = attributes[:'compatible_architectures'] if attributes[:'compatible_architectures']

      self.regions = attributes[:'regions'] if attributes[:'regions']

      self.package_type = attributes[:'packageType'] if attributes[:'packageType']

      raise 'You cannot provide both :packageType and :package_type' if attributes.key?(:'packageType') && attributes.key?(:'package_type')

      self.package_type = attributes[:'package_type'] if attributes[:'package_type']

      self.default_package_version = attributes[:'defaultPackageVersion'] if attributes[:'defaultPackageVersion']

      raise 'You cannot provide both :defaultPackageVersion and :default_package_version' if attributes.key?(:'defaultPackageVersion') && attributes.key?(:'default_package_version')

      self.default_package_version = attributes[:'default_package_version'] if attributes[:'default_package_version']

      self.links = attributes[:'links'] if attributes[:'links']

      self.is_featured = attributes[:'isFeatured'] unless attributes[:'isFeatured'].nil?

      raise 'You cannot provide both :isFeatured and :is_featured' if attributes.key?(:'isFeatured') && attributes.key?(:'is_featured')

      self.is_featured = attributes[:'is_featured'] unless attributes[:'is_featured'].nil?

      self.listing_type = attributes[:'listingType'] if attributes[:'listingType']

      raise 'You cannot provide both :listingType and :listing_type' if attributes.key?(:'listingType') && attributes.key?(:'listing_type')

      self.listing_type = attributes[:'listing_type'] if attributes[:'listing_type']

      self.supported_operating_systems = attributes[:'supportedOperatingSystems'] if attributes[:'supportedOperatingSystems']

      raise 'You cannot provide both :supportedOperatingSystems and :supported_operating_systems' if attributes.key?(:'supportedOperatingSystems') && attributes.key?(:'supported_operating_systems')

      self.supported_operating_systems = attributes[:'supported_operating_systems'] if attributes[:'supported_operating_systems']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] compatible_architectures Object to be assigned
    def compatible_architectures=(compatible_architectures)
      # rubocop:disable Style/ConditionalAssignment
      if compatible_architectures.nil?
        @compatible_architectures = nil
      else
        @compatible_architectures =
          compatible_architectures.collect do |item|
            if COMPATIBLE_ARCHITECTURES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'compatible_architectures' [#{item}]. Mapping to 'COMPATIBLE_ARCHITECTURES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              COMPATIBLE_ARCHITECTURES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] package_type Object to be assigned
    def package_type=(package_type)
      # rubocop:disable Style/ConditionalAssignment
      if package_type && !PACKAGE_TYPE_ENUM.include?(package_type)
        OCI.logger.debug("Unknown value for 'package_type' [" + package_type + "]. Mapping to 'PACKAGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @package_type = PACKAGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @package_type = package_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] listing_type Object to be assigned
    def listing_type=(listing_type)
      # rubocop:disable Style/ConditionalAssignment
      if listing_type && !LISTING_TYPE_ENUM.include?(listing_type)
        OCI.logger.debug("Unknown value for 'listing_type' [" + listing_type + "]. Mapping to 'LISTING_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @listing_type = LISTING_TYPE_UNKNOWN_ENUM_VALUE
      else
        @listing_type = listing_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        version == other.version &&
        tagline == other.tagline &&
        keywords == other.keywords &&
        short_description == other.short_description &&
        usage_information == other.usage_information &&
        long_description == other.long_description &&
        license_model_description == other.license_model_description &&
        system_requirements == other.system_requirements &&
        time_released == other.time_released &&
        release_notes == other.release_notes &&
        categories == other.categories &&
        publisher == other.publisher &&
        languages == other.languages &&
        screenshots == other.screenshots &&
        videos == other.videos &&
        support_contacts == other.support_contacts &&
        support_links == other.support_links &&
        documentation_links == other.documentation_links &&
        icon == other.icon &&
        banner == other.banner &&
        compatible_architectures == other.compatible_architectures &&
        regions == other.regions &&
        package_type == other.package_type &&
        default_package_version == other.default_package_version &&
        links == other.links &&
        is_featured == other.is_featured &&
        listing_type == other.listing_type &&
        supported_operating_systems == other.supported_operating_systems
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
      [id, name, version, tagline, keywords, short_description, usage_information, long_description, license_model_description, system_requirements, time_released, release_notes, categories, publisher, languages, screenshots, videos, support_contacts, support_links, documentation_links, icon, banner, compatible_architectures, regions, package_type, default_package_version, links, is_featured, listing_type, supported_operating_systems].hash
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
