# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for an Oracle Cloud Infrastructure Marketplace Publisher listing revision.
  class MarketplacePublisher::Models::CreateListingRevisionDetails
    # The name for the listing revision.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The unique identifier for the listing this revision belongs to.
    # @return [String]
    attr_accessor :listing_id

    # @return [OCI::MarketplacePublisher::Models::VersionDetails]
    attr_accessor :version_details

    # **[Required]** Single line introduction for the listing revision.
    # @return [String]
    attr_accessor :headline

    # The tagline for the listing revision.
    # @return [String]
    attr_accessor :tagline

    # Keywords associated with the listing revision.
    # @return [String]
    attr_accessor :keywords

    # A short description for the listing revision.
    # @return [String]
    attr_accessor :short_description

    # Usage information for the listing revision.
    # @return [String]
    attr_accessor :usage_information

    # A long description for the listing revision.
    # @return [String]
    attr_accessor :long_description

    # System requirements for the listing revision.
    # @return [String]
    attr_accessor :system_requirements

    # **[Required]** The categories for the listing revision.
    # @return [Array<String>]
    attr_accessor :categories

    # The markets supported by the listing revision.
    # @return [Array<String>]
    attr_accessor :markets

    # @return [OCI::MarketplacePublisher::Models::LanguageItem]
    attr_accessor :content_language

    # Languages supported by the publisher for the listing revision.
    # @return [Array<OCI::MarketplacePublisher::Models::LanguageItem>]
    attr_accessor :supportedlanguages

    # Contact information to use to get support from the publisher for the listing revision.
    # @return [Array<OCI::MarketplacePublisher::Models::SupportContact>]
    attr_accessor :support_contacts

    # Links to support resources for the listing revision.
    # @return [Array<OCI::MarketplacePublisher::Models::NamedLink>]
    attr_accessor :support_links

    # The current status of the Listing revision.
    # @return [String]
    attr_accessor :status

    # **[Required]** The pricing model for the listing revision.
    # @return [String]
    attr_accessor :pricing_type

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'listing_id': :'listingId',
        'version_details': :'versionDetails',
        'headline': :'headline',
        'tagline': :'tagline',
        'keywords': :'keywords',
        'short_description': :'shortDescription',
        'usage_information': :'usageInformation',
        'long_description': :'longDescription',
        'system_requirements': :'systemRequirements',
        'categories': :'categories',
        'markets': :'markets',
        'content_language': :'contentLanguage',
        'supportedlanguages': :'supportedlanguages',
        'support_contacts': :'supportContacts',
        'support_links': :'supportLinks',
        'status': :'status',
        'pricing_type': :'pricingType',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'listing_id': :'String',
        'version_details': :'OCI::MarketplacePublisher::Models::VersionDetails',
        'headline': :'String',
        'tagline': :'String',
        'keywords': :'String',
        'short_description': :'String',
        'usage_information': :'String',
        'long_description': :'String',
        'system_requirements': :'String',
        'categories': :'Array<String>',
        'markets': :'Array<String>',
        'content_language': :'OCI::MarketplacePublisher::Models::LanguageItem',
        'supportedlanguages': :'Array<OCI::MarketplacePublisher::Models::LanguageItem>',
        'support_contacts': :'Array<OCI::MarketplacePublisher::Models::SupportContact>',
        'support_links': :'Array<OCI::MarketplacePublisher::Models::NamedLink>',
        'status': :'String',
        'pricing_type': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :listing_id The value to assign to the {#listing_id} property
    # @option attributes [OCI::MarketplacePublisher::Models::VersionDetails] :version_details The value to assign to the {#version_details} property
    # @option attributes [String] :headline The value to assign to the {#headline} property
    # @option attributes [String] :tagline The value to assign to the {#tagline} property
    # @option attributes [String] :keywords The value to assign to the {#keywords} property
    # @option attributes [String] :short_description The value to assign to the {#short_description} property
    # @option attributes [String] :usage_information The value to assign to the {#usage_information} property
    # @option attributes [String] :long_description The value to assign to the {#long_description} property
    # @option attributes [String] :system_requirements The value to assign to the {#system_requirements} property
    # @option attributes [Array<String>] :categories The value to assign to the {#categories} property
    # @option attributes [Array<String>] :markets The value to assign to the {#markets} property
    # @option attributes [OCI::MarketplacePublisher::Models::LanguageItem] :content_language The value to assign to the {#content_language} property
    # @option attributes [Array<OCI::MarketplacePublisher::Models::LanguageItem>] :supportedlanguages The value to assign to the {#supportedlanguages} property
    # @option attributes [Array<OCI::MarketplacePublisher::Models::SupportContact>] :support_contacts The value to assign to the {#support_contacts} property
    # @option attributes [Array<OCI::MarketplacePublisher::Models::NamedLink>] :support_links The value to assign to the {#support_links} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :pricing_type The value to assign to the {#pricing_type} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.listing_id = attributes[:'listingId'] if attributes[:'listingId']

      raise 'You cannot provide both :listingId and :listing_id' if attributes.key?(:'listingId') && attributes.key?(:'listing_id')

      self.listing_id = attributes[:'listing_id'] if attributes[:'listing_id']

      self.version_details = attributes[:'versionDetails'] if attributes[:'versionDetails']

      raise 'You cannot provide both :versionDetails and :version_details' if attributes.key?(:'versionDetails') && attributes.key?(:'version_details')

      self.version_details = attributes[:'version_details'] if attributes[:'version_details']

      self.headline = attributes[:'headline'] if attributes[:'headline']

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

      self.system_requirements = attributes[:'systemRequirements'] if attributes[:'systemRequirements']

      raise 'You cannot provide both :systemRequirements and :system_requirements' if attributes.key?(:'systemRequirements') && attributes.key?(:'system_requirements')

      self.system_requirements = attributes[:'system_requirements'] if attributes[:'system_requirements']

      self.categories = attributes[:'categories'] if attributes[:'categories']

      self.markets = attributes[:'markets'] if attributes[:'markets']

      self.content_language = attributes[:'contentLanguage'] if attributes[:'contentLanguage']

      raise 'You cannot provide both :contentLanguage and :content_language' if attributes.key?(:'contentLanguage') && attributes.key?(:'content_language')

      self.content_language = attributes[:'content_language'] if attributes[:'content_language']

      self.supportedlanguages = attributes[:'supportedlanguages'] if attributes[:'supportedlanguages']

      self.support_contacts = attributes[:'supportContacts'] if attributes[:'supportContacts']

      raise 'You cannot provide both :supportContacts and :support_contacts' if attributes.key?(:'supportContacts') && attributes.key?(:'support_contacts')

      self.support_contacts = attributes[:'support_contacts'] if attributes[:'support_contacts']

      self.support_links = attributes[:'supportLinks'] if attributes[:'supportLinks']

      raise 'You cannot provide both :supportLinks and :support_links' if attributes.key?(:'supportLinks') && attributes.key?(:'support_links')

      self.support_links = attributes[:'support_links'] if attributes[:'support_links']

      self.status = attributes[:'status'] if attributes[:'status']

      self.pricing_type = attributes[:'pricingType'] if attributes[:'pricingType']

      raise 'You cannot provide both :pricingType and :pricing_type' if attributes.key?(:'pricingType') && attributes.key?(:'pricing_type')

      self.pricing_type = attributes[:'pricing_type'] if attributes[:'pricing_type']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
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
        listing_id == other.listing_id &&
        version_details == other.version_details &&
        headline == other.headline &&
        tagline == other.tagline &&
        keywords == other.keywords &&
        short_description == other.short_description &&
        usage_information == other.usage_information &&
        long_description == other.long_description &&
        system_requirements == other.system_requirements &&
        categories == other.categories &&
        markets == other.markets &&
        content_language == other.content_language &&
        supportedlanguages == other.supportedlanguages &&
        support_contacts == other.support_contacts &&
        support_links == other.support_links &&
        status == other.status &&
        pricing_type == other.pricing_type &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [display_name, listing_id, version_details, headline, tagline, keywords, short_description, usage_information, long_description, system_requirements, categories, markets, content_language, supportedlanguages, support_contacts, support_links, status, pricing_type, freeform_tags, defined_tags].hash
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