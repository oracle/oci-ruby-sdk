# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # a subscription summary for a listing resource version.
  class Core::Models::AppCatalogSubscriptionSummary # rubocop:disable Metrics/LineLength
    # Name of the publisher who published this listing.
    # @return [String]
    attr_accessor :publisher_name

    # The ocid of the listing resource.
    # @return [String]
    attr_accessor :listing_id

    # Listing resource version.
    # @return [String]
    attr_accessor :listing_resource_version

    # Listing resource id.
    # @return [String]
    attr_accessor :listing_resource_id

    # The display name of the listing.
    # @return [String]
    attr_accessor :display_name

    # The short summary to the listing.
    # @return [String]
    attr_accessor :summary

    # The compartmentID of the subscription.
    # @return [String]
    attr_accessor :compartment_id

    # Date and time at which the subscription was created, in RFC3339 format.
    # Example: `2018-03-20T12:32:53.532Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'publisher_name': :'publisherName',
        'listing_id': :'listingId',
        'listing_resource_version': :'listingResourceVersion',
        'listing_resource_id': :'listingResourceId',
        'display_name': :'displayName',
        'summary': :'summary',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'publisher_name': :'String',
        'listing_id': :'String',
        'listing_resource_version': :'String',
        'listing_resource_id': :'String',
        'display_name': :'String',
        'summary': :'String',
        'compartment_id': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :publisher_name The value to assign to the {#publisher_name} property
    # @option attributes [String] :listing_id The value to assign to the {#listing_id} property
    # @option attributes [String] :listing_resource_version The value to assign to the {#listing_resource_version} property
    # @option attributes [String] :listing_resource_id The value to assign to the {#listing_resource_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :summary The value to assign to the {#summary} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.publisher_name = attributes[:'publisherName'] if attributes[:'publisherName']

      raise 'You cannot provide both :publisherName and :publisher_name' if attributes.key?(:'publisherName') && attributes.key?(:'publisher_name')

      self.publisher_name = attributes[:'publisher_name'] if attributes[:'publisher_name']

      self.listing_id = attributes[:'listingId'] if attributes[:'listingId']

      raise 'You cannot provide both :listingId and :listing_id' if attributes.key?(:'listingId') && attributes.key?(:'listing_id')

      self.listing_id = attributes[:'listing_id'] if attributes[:'listing_id']

      self.listing_resource_version = attributes[:'listingResourceVersion'] if attributes[:'listingResourceVersion']

      raise 'You cannot provide both :listingResourceVersion and :listing_resource_version' if attributes.key?(:'listingResourceVersion') && attributes.key?(:'listing_resource_version')

      self.listing_resource_version = attributes[:'listing_resource_version'] if attributes[:'listing_resource_version']

      self.listing_resource_id = attributes[:'listingResourceId'] if attributes[:'listingResourceId']

      raise 'You cannot provide both :listingResourceId and :listing_resource_id' if attributes.key?(:'listingResourceId') && attributes.key?(:'listing_resource_id')

      self.listing_resource_id = attributes[:'listing_resource_id'] if attributes[:'listing_resource_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.summary = attributes[:'summary'] if attributes[:'summary']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        publisher_name == other.publisher_name &&
        listing_id == other.listing_id &&
        listing_resource_version == other.listing_resource_version &&
        listing_resource_id == other.listing_resource_id &&
        display_name == other.display_name &&
        summary == other.summary &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [publisher_name, listing_id, listing_resource_version, listing_resource_id, display_name, summary, compartment_id, time_created].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
