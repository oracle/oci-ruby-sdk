# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The required data to create a WAAS policy.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  class Waas::Models::CreateWaasPolicyDetails # rubocop:disable Metrics/LineLength
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which to create the WAAS policy.
    # @return [String]
    attr_accessor :compartment_id

    # A user-friendly name for the WAAS policy. The name is can be changed and does not need to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The web application domain that the WAAS policy protects.
    # @return [String]
    attr_accessor :domain

    # An array of additional domains for the specified web application.
    # @return [Array<String>]
    attr_accessor :additional_domains

    # A map of host to origin for the web application. The key should be a customer friendly name for the host, ex. primary, secondary, etc.
    # @return [Hash<String, OCI::Waas::Models::Origin>]
    attr_accessor :origins

    # @return [OCI::Waas::Models::PolicyConfig]
    attr_accessor :policy_config

    # @return [OCI::Waas::Models::WafConfigDetails]
    attr_accessor :waf_config

    # A simple key-value pair without any defined schema.
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # A key-value pair with a defined schema that restricts the values of tags. These predefined keys are scoped to namespaces.
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'domain': :'domain',
        'additional_domains': :'additionalDomains',
        'origins': :'origins',
        'policy_config': :'policyConfig',
        'waf_config': :'wafConfig',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'domain': :'String',
        'additional_domains': :'Array<String>',
        'origins': :'Hash<String, OCI::Waas::Models::Origin>',
        'policy_config': :'OCI::Waas::Models::PolicyConfig',
        'waf_config': :'OCI::Waas::Models::WafConfigDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [Array<String>] :additional_domains The value to assign to the {#additional_domains} property
    # @option attributes [Hash<String, OCI::Waas::Models::Origin>] :origins The value to assign to the {#origins} property
    # @option attributes [OCI::Waas::Models::PolicyConfig] :policy_config The value to assign to the {#policy_config} property
    # @option attributes [OCI::Waas::Models::WafConfigDetails] :waf_config The value to assign to the {#waf_config} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.additional_domains = attributes[:'additionalDomains'] if attributes[:'additionalDomains']

      raise 'You cannot provide both :additionalDomains and :additional_domains' if attributes.key?(:'additionalDomains') && attributes.key?(:'additional_domains')

      self.additional_domains = attributes[:'additional_domains'] if attributes[:'additional_domains']

      self.origins = attributes[:'origins'] if attributes[:'origins']

      self.policy_config = attributes[:'policyConfig'] if attributes[:'policyConfig']

      raise 'You cannot provide both :policyConfig and :policy_config' if attributes.key?(:'policyConfig') && attributes.key?(:'policy_config')

      self.policy_config = attributes[:'policy_config'] if attributes[:'policy_config']

      self.waf_config = attributes[:'wafConfig'] if attributes[:'wafConfig']

      raise 'You cannot provide both :wafConfig and :waf_config' if attributes.key?(:'wafConfig') && attributes.key?(:'waf_config')

      self.waf_config = attributes[:'waf_config'] if attributes[:'waf_config']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        domain == other.domain &&
        additional_domains == other.additional_domains &&
        origins == other.origins &&
        policy_config == other.policy_config &&
        waf_config == other.waf_config &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [compartment_id, display_name, domain, additional_domains, origins, policy_config, waf_config, freeform_tags, defined_tags].hash
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