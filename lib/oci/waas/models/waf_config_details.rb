# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Web Application Firewall configuration for the WAAS policy creation.
  class Waas::Models::WafConfigDetails
    # The access rules applied to the Web Application Firewall. Access rules allow custom content access policies to be defined and `ALLOW`, `DETECT`, or `BLOCK` actions to be taken on a request when specified criteria are met.
    # @return [Array<OCI::Waas::Models::AccessRule>]
    attr_accessor :access_rules

    # The settings used to limit the number of requests from an IP address.
    # @return [OCI::Waas::Models::AddressRateLimiting]
    attr_accessor :address_rate_limiting

    # A list of CAPTCHA challenge settings. CAPTCHAs challenge requests to ensure a human is attempting to reach the specified URL and not a bot.
    # @return [Array<OCI::Waas::Models::Captcha>]
    attr_accessor :captchas

    # The device fingerprint challenge settings. Blocks bots based on unique device fingerprint information.
    # @return [OCI::Waas::Models::DeviceFingerprintChallenge]
    attr_accessor :device_fingerprint_challenge

    # The human interaction challenge settings. Detects natural human interactions such as mouse movements, time on site, and page scrolling to identify bots.
    # @return [OCI::Waas::Models::HumanInteractionChallenge]
    attr_accessor :human_interaction_challenge

    # The JavaScript challenge settings. Blocks bots by challenging requests from browsers that have no JavaScript support.
    # @return [OCI::Waas::Models::JsChallenge]
    attr_accessor :js_challenge

    # The key in the map of origins referencing the origin used for the Web Application Firewall. The origin must already be included in `Origins`. Required when creating the `WafConfig` resource, but is not required upon updating the configuration.
    # @return [String]
    attr_accessor :origin

    # A list of caching rules applied to the web application.
    # @return [Array<OCI::Waas::Models::CachingRule>]
    attr_accessor :caching_rules

    # A list of the custom protection rule OCIDs and their actions.
    # @return [Array<OCI::Waas::Models::CustomProtectionRuleSetting>]
    attr_accessor :custom_protection_rules

    # The list of origin group references that provide support for additional origin servers. A list of combined unique origin servers from `origin` and `originGroups` will be used.
    # @return [Array<String>]
    attr_accessor :origin_groups

    # The settings applied to protection rules.
    # @return [OCI::Waas::Models::ProtectionSettings]
    attr_accessor :protection_settings

    # A list of IP addresses that bypass the Web Application Firewall.
    # @return [Array<OCI::Waas::Models::Whitelist>]
    attr_accessor :whitelists

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'access_rules': :'accessRules',
        'address_rate_limiting': :'addressRateLimiting',
        'captchas': :'captchas',
        'device_fingerprint_challenge': :'deviceFingerprintChallenge',
        'human_interaction_challenge': :'humanInteractionChallenge',
        'js_challenge': :'jsChallenge',
        'origin': :'origin',
        'caching_rules': :'cachingRules',
        'custom_protection_rules': :'customProtectionRules',
        'origin_groups': :'originGroups',
        'protection_settings': :'protectionSettings',
        'whitelists': :'whitelists'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'access_rules': :'Array<OCI::Waas::Models::AccessRule>',
        'address_rate_limiting': :'OCI::Waas::Models::AddressRateLimiting',
        'captchas': :'Array<OCI::Waas::Models::Captcha>',
        'device_fingerprint_challenge': :'OCI::Waas::Models::DeviceFingerprintChallenge',
        'human_interaction_challenge': :'OCI::Waas::Models::HumanInteractionChallenge',
        'js_challenge': :'OCI::Waas::Models::JsChallenge',
        'origin': :'String',
        'caching_rules': :'Array<OCI::Waas::Models::CachingRule>',
        'custom_protection_rules': :'Array<OCI::Waas::Models::CustomProtectionRuleSetting>',
        'origin_groups': :'Array<String>',
        'protection_settings': :'OCI::Waas::Models::ProtectionSettings',
        'whitelists': :'Array<OCI::Waas::Models::Whitelist>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Waas::Models::AccessRule>] :access_rules The value to assign to the {#access_rules} property
    # @option attributes [OCI::Waas::Models::AddressRateLimiting] :address_rate_limiting The value to assign to the {#address_rate_limiting} property
    # @option attributes [Array<OCI::Waas::Models::Captcha>] :captchas The value to assign to the {#captchas} property
    # @option attributes [OCI::Waas::Models::DeviceFingerprintChallenge] :device_fingerprint_challenge The value to assign to the {#device_fingerprint_challenge} property
    # @option attributes [OCI::Waas::Models::HumanInteractionChallenge] :human_interaction_challenge The value to assign to the {#human_interaction_challenge} property
    # @option attributes [OCI::Waas::Models::JsChallenge] :js_challenge The value to assign to the {#js_challenge} property
    # @option attributes [String] :origin The value to assign to the {#origin} property
    # @option attributes [Array<OCI::Waas::Models::CachingRule>] :caching_rules The value to assign to the {#caching_rules} property
    # @option attributes [Array<OCI::Waas::Models::CustomProtectionRuleSetting>] :custom_protection_rules The value to assign to the {#custom_protection_rules} property
    # @option attributes [Array<String>] :origin_groups The value to assign to the {#origin_groups} property
    # @option attributes [OCI::Waas::Models::ProtectionSettings] :protection_settings The value to assign to the {#protection_settings} property
    # @option attributes [Array<OCI::Waas::Models::Whitelist>] :whitelists The value to assign to the {#whitelists} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.access_rules = attributes[:'accessRules'] if attributes[:'accessRules']

      raise 'You cannot provide both :accessRules and :access_rules' if attributes.key?(:'accessRules') && attributes.key?(:'access_rules')

      self.access_rules = attributes[:'access_rules'] if attributes[:'access_rules']

      self.address_rate_limiting = attributes[:'addressRateLimiting'] if attributes[:'addressRateLimiting']

      raise 'You cannot provide both :addressRateLimiting and :address_rate_limiting' if attributes.key?(:'addressRateLimiting') && attributes.key?(:'address_rate_limiting')

      self.address_rate_limiting = attributes[:'address_rate_limiting'] if attributes[:'address_rate_limiting']

      self.captchas = attributes[:'captchas'] if attributes[:'captchas']

      self.device_fingerprint_challenge = attributes[:'deviceFingerprintChallenge'] if attributes[:'deviceFingerprintChallenge']

      raise 'You cannot provide both :deviceFingerprintChallenge and :device_fingerprint_challenge' if attributes.key?(:'deviceFingerprintChallenge') && attributes.key?(:'device_fingerprint_challenge')

      self.device_fingerprint_challenge = attributes[:'device_fingerprint_challenge'] if attributes[:'device_fingerprint_challenge']

      self.human_interaction_challenge = attributes[:'humanInteractionChallenge'] if attributes[:'humanInteractionChallenge']

      raise 'You cannot provide both :humanInteractionChallenge and :human_interaction_challenge' if attributes.key?(:'humanInteractionChallenge') && attributes.key?(:'human_interaction_challenge')

      self.human_interaction_challenge = attributes[:'human_interaction_challenge'] if attributes[:'human_interaction_challenge']

      self.js_challenge = attributes[:'jsChallenge'] if attributes[:'jsChallenge']

      raise 'You cannot provide both :jsChallenge and :js_challenge' if attributes.key?(:'jsChallenge') && attributes.key?(:'js_challenge')

      self.js_challenge = attributes[:'js_challenge'] if attributes[:'js_challenge']

      self.origin = attributes[:'origin'] if attributes[:'origin']

      self.caching_rules = attributes[:'cachingRules'] if attributes[:'cachingRules']

      raise 'You cannot provide both :cachingRules and :caching_rules' if attributes.key?(:'cachingRules') && attributes.key?(:'caching_rules')

      self.caching_rules = attributes[:'caching_rules'] if attributes[:'caching_rules']

      self.custom_protection_rules = attributes[:'customProtectionRules'] if attributes[:'customProtectionRules']

      raise 'You cannot provide both :customProtectionRules and :custom_protection_rules' if attributes.key?(:'customProtectionRules') && attributes.key?(:'custom_protection_rules')

      self.custom_protection_rules = attributes[:'custom_protection_rules'] if attributes[:'custom_protection_rules']

      self.origin_groups = attributes[:'originGroups'] if attributes[:'originGroups']

      raise 'You cannot provide both :originGroups and :origin_groups' if attributes.key?(:'originGroups') && attributes.key?(:'origin_groups')

      self.origin_groups = attributes[:'origin_groups'] if attributes[:'origin_groups']

      self.protection_settings = attributes[:'protectionSettings'] if attributes[:'protectionSettings']

      raise 'You cannot provide both :protectionSettings and :protection_settings' if attributes.key?(:'protectionSettings') && attributes.key?(:'protection_settings')

      self.protection_settings = attributes[:'protection_settings'] if attributes[:'protection_settings']

      self.whitelists = attributes[:'whitelists'] if attributes[:'whitelists']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        access_rules == other.access_rules &&
        address_rate_limiting == other.address_rate_limiting &&
        captchas == other.captchas &&
        device_fingerprint_challenge == other.device_fingerprint_challenge &&
        human_interaction_challenge == other.human_interaction_challenge &&
        js_challenge == other.js_challenge &&
        origin == other.origin &&
        caching_rules == other.caching_rules &&
        custom_protection_rules == other.custom_protection_rules &&
        origin_groups == other.origin_groups &&
        protection_settings == other.protection_settings &&
        whitelists == other.whitelists
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
      [access_rules, address_rate_limiting, captchas, device_fingerprint_challenge, human_interaction_challenge, js_challenge, origin, caching_rules, custom_protection_rules, origin_groups, protection_settings, whitelists].hash
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
