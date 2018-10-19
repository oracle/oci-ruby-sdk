# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # details for creating a subscription for a listing resource version.
  class Core::Models::CreateAppCatalogSubscriptionDetails # rubocop:disable Metrics/LineLength
    # The compartmentID for the subscription.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the listing.
    # @return [String]
    attr_accessor :listing_id

    # Listing resource version.
    # @return [String]
    attr_accessor :listing_resource_version

    # Oracle TOU link
    # @return [String]
    attr_accessor :oracle_terms_of_use_link

    # EULA link
    # @return [String]
    attr_accessor :eula_link

    # Date and time the agreements were retrieved, in RFC3339 format.
    # Example: `2018-03-20T12:32:53.532Z`
    #
    # @return [DateTime]
    attr_accessor :time_retrieved

    # A generated signature for this listing resource version retrieved the agreements API.
    # @return [String]
    attr_accessor :signature

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'listing_id': :'listingId',
        'listing_resource_version': :'listingResourceVersion',
        'oracle_terms_of_use_link': :'oracleTermsOfUseLink',
        'eula_link': :'eulaLink',
        'time_retrieved': :'timeRetrieved',
        'signature': :'signature'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'listing_id': :'String',
        'listing_resource_version': :'String',
        'oracle_terms_of_use_link': :'String',
        'eula_link': :'String',
        'time_retrieved': :'DateTime',
        'signature': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :listing_id The value to assign to the {#listing_id} property
    # @option attributes [String] :listing_resource_version The value to assign to the {#listing_resource_version} property
    # @option attributes [String] :oracle_terms_of_use_link The value to assign to the {#oracle_terms_of_use_link} property
    # @option attributes [String] :eula_link The value to assign to the {#eula_link} property
    # @option attributes [DateTime] :time_retrieved The value to assign to the {#time_retrieved} property
    # @option attributes [String] :signature The value to assign to the {#signature} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.listing_id = attributes[:'listingId'] if attributes[:'listingId']

      raise 'You cannot provide both :listingId and :listing_id' if attributes.key?(:'listingId') && attributes.key?(:'listing_id')

      self.listing_id = attributes[:'listing_id'] if attributes[:'listing_id']

      self.listing_resource_version = attributes[:'listingResourceVersion'] if attributes[:'listingResourceVersion']

      raise 'You cannot provide both :listingResourceVersion and :listing_resource_version' if attributes.key?(:'listingResourceVersion') && attributes.key?(:'listing_resource_version')

      self.listing_resource_version = attributes[:'listing_resource_version'] if attributes[:'listing_resource_version']

      self.oracle_terms_of_use_link = attributes[:'oracleTermsOfUseLink'] if attributes[:'oracleTermsOfUseLink']

      raise 'You cannot provide both :oracleTermsOfUseLink and :oracle_terms_of_use_link' if attributes.key?(:'oracleTermsOfUseLink') && attributes.key?(:'oracle_terms_of_use_link')

      self.oracle_terms_of_use_link = attributes[:'oracle_terms_of_use_link'] if attributes[:'oracle_terms_of_use_link']

      self.eula_link = attributes[:'eulaLink'] if attributes[:'eulaLink']

      raise 'You cannot provide both :eulaLink and :eula_link' if attributes.key?(:'eulaLink') && attributes.key?(:'eula_link')

      self.eula_link = attributes[:'eula_link'] if attributes[:'eula_link']

      self.time_retrieved = attributes[:'timeRetrieved'] if attributes[:'timeRetrieved']

      raise 'You cannot provide both :timeRetrieved and :time_retrieved' if attributes.key?(:'timeRetrieved') && attributes.key?(:'time_retrieved')

      self.time_retrieved = attributes[:'time_retrieved'] if attributes[:'time_retrieved']

      self.signature = attributes[:'signature'] if attributes[:'signature']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)
      self.class == other.class &&
        compartment_id == other.compartment_id &&
        listing_id == other.listing_id &&
        listing_resource_version == other.listing_resource_version &&
        oracle_terms_of_use_link == other.oracle_terms_of_use_link &&
        eula_link == other.eula_link &&
        time_retrieved == other.time_retrieved &&
        signature == other.signature
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
      [compartment_id, listing_id, listing_resource_version, oracle_terms_of_use_link, eula_link, time_retrieved, signature].hash
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
