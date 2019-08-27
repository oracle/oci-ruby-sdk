# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A list of Web Application Firewall log entries. Each entry is a JSON object, including a timestamp property and other fields varying based on log type. Logs record what rules and countermeasures are triggered by requests and are used as a basis to move request handling into block mode. For more information about WAF logs, see [WAF Logs](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/waflogs.htm).
  class Waas::Models::WafLog
    # The action taken on the request, either `ALLOW`, `DETECT`, or `BLOCK`.
    # @return [String]
    attr_accessor :action

    # The CAPTCHA action taken on the request, `ALLOW` or `BLOCK`. For more information about
    # CAPTCHAs, see `UpdateCaptchas`.
    #
    # @return [String]
    attr_accessor :captcha_action

    # The CAPTCHA challenge answer that was expected.
    # @return [String]
    attr_accessor :captcha_expected

    # The CAPTCHA challenge answer that was received.
    # @return [String]
    attr_accessor :captcha_received

    # The number of times the CAPTCHA challenge was failed.
    # @return [String]
    attr_accessor :captcha_fail_count

    # The IPv4 address of the requesting client.
    # @return [String]
    attr_accessor :client_address

    # The name of the country where the request originated.
    # @return [String]
    attr_accessor :country_name

    # The value of the request's `User-Agent` header field.
    # @return [String]
    attr_accessor :user_agent

    # The `Host` header data of the request.
    #
    # @return [String]
    attr_accessor :domain

    # A map of protection rule keys to detection message details. Detections are
    # requests that matched the criteria of a protection rule but the rule's
    # action was set to `DETECT`.
    #
    # @return [Hash<String, String>]
    attr_accessor :protection_rule_detections

    # The HTTP method of the request.
    # @return [String]
    attr_accessor :http_method

    # The path and query string of the request.
    # @return [String]
    attr_accessor :request_url

    # The map of the request's header names to their respective values.
    # @return [Hash<String, String>]
    attr_accessor :http_headers

    # The `Referrer` header value of the request.
    # @return [String]
    attr_accessor :referrer

    # The status code of the response.
    # @return [Integer]
    attr_accessor :response_code

    # The size in bytes of the response.
    # @return [Integer]
    attr_accessor :response_size

    # The incident key of a request. An incident key is generated for
    # each request processed by the Web Application Firewall and is used to
    # idenitfy blocked requests in applicable logs.
    #
    # @return [String]
    attr_accessor :incident_key

    # The hashed signature of the device's fingerprint. For more information,
    # see `DeviceFingerPrintChallenge`.
    #
    # @return [String]
    attr_accessor :fingerprint

    # The type of device that the request was made from.
    # @return [String]
    attr_accessor :device

    # ISO 3166-1 alpha-2 code of the country from which the request originated.
    # For a list of codes, see [ISO's website](https://www.iso.org/obp/ui/#search/code/).
    #
    # @return [String]
    attr_accessor :country_code

    # A map of header names to values of the request sent to the origin, including any headers
    # appended by the Web Application Firewall.
    #
    # @return [Hash<String, String>]
    attr_accessor :request_headers

    # The `ThreatFeed` key that matched the request. For more information about
    # threat feeds, see `UpdateThreatFeeds`.
    #
    # @return [String]
    attr_accessor :threat_feed_key

    # The `AccessRule` key that matched the request. For more information about
    # access rules, see `UpdateAccessRules`.
    #
    # @return [String]
    attr_accessor :access_rule_key

    # The `AddressRateLimiting` key that matched the request. For more information
    # about address rate limiting, see `UpdateWafAddressRateLimiting`.
    #
    # @return [String]
    attr_accessor :address_rate_limiting_key

    # The date and time the Web Application Firewall processed the request and logged it.
    #
    # @return [DateTime]
    attr_accessor :timestamp

    # The type of log of the request. For more about log types, see [WAF Logs](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/waflogs.htm).
    #
    # @return [String]
    attr_accessor :log_type

    # The address of the origin server where the request was sent.
    # @return [String]
    attr_accessor :origin_address

    # The amount of time it took the origin server to respond to the request, in seconds.
    #
    # @return [String]
    attr_accessor :origin_response_time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'action',
        'captcha_action': :'captchaAction',
        'captcha_expected': :'captchaExpected',
        'captcha_received': :'captchaReceived',
        'captcha_fail_count': :'captchaFailCount',
        'client_address': :'clientAddress',
        'country_name': :'countryName',
        'user_agent': :'userAgent',
        'domain': :'domain',
        'protection_rule_detections': :'protectionRuleDetections',
        'http_method': :'httpMethod',
        'request_url': :'requestUrl',
        'http_headers': :'httpHeaders',
        'referrer': :'referrer',
        'response_code': :'responseCode',
        'response_size': :'responseSize',
        'incident_key': :'incidentKey',
        'fingerprint': :'fingerprint',
        'device': :'device',
        'country_code': :'countryCode',
        'request_headers': :'requestHeaders',
        'threat_feed_key': :'threatFeedKey',
        'access_rule_key': :'accessRuleKey',
        'address_rate_limiting_key': :'addressRateLimitingKey',
        'timestamp': :'timestamp',
        'log_type': :'logType',
        'origin_address': :'originAddress',
        'origin_response_time': :'originResponseTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'String',
        'captcha_action': :'String',
        'captcha_expected': :'String',
        'captcha_received': :'String',
        'captcha_fail_count': :'String',
        'client_address': :'String',
        'country_name': :'String',
        'user_agent': :'String',
        'domain': :'String',
        'protection_rule_detections': :'Hash<String, String>',
        'http_method': :'String',
        'request_url': :'String',
        'http_headers': :'Hash<String, String>',
        'referrer': :'String',
        'response_code': :'Integer',
        'response_size': :'Integer',
        'incident_key': :'String',
        'fingerprint': :'String',
        'device': :'String',
        'country_code': :'String',
        'request_headers': :'Hash<String, String>',
        'threat_feed_key': :'String',
        'access_rule_key': :'String',
        'address_rate_limiting_key': :'String',
        'timestamp': :'DateTime',
        'log_type': :'String',
        'origin_address': :'String',
        'origin_response_time': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :captcha_action The value to assign to the {#captcha_action} property
    # @option attributes [String] :captcha_expected The value to assign to the {#captcha_expected} property
    # @option attributes [String] :captcha_received The value to assign to the {#captcha_received} property
    # @option attributes [String] :captcha_fail_count The value to assign to the {#captcha_fail_count} property
    # @option attributes [String] :client_address The value to assign to the {#client_address} property
    # @option attributes [String] :country_name The value to assign to the {#country_name} property
    # @option attributes [String] :user_agent The value to assign to the {#user_agent} property
    # @option attributes [String] :domain The value to assign to the {#domain} property
    # @option attributes [Hash<String, String>] :protection_rule_detections The value to assign to the {#protection_rule_detections} property
    # @option attributes [String] :http_method The value to assign to the {#http_method} property
    # @option attributes [String] :request_url The value to assign to the {#request_url} property
    # @option attributes [Hash<String, String>] :http_headers The value to assign to the {#http_headers} property
    # @option attributes [String] :referrer The value to assign to the {#referrer} property
    # @option attributes [Integer] :response_code The value to assign to the {#response_code} property
    # @option attributes [Integer] :response_size The value to assign to the {#response_size} property
    # @option attributes [String] :incident_key The value to assign to the {#incident_key} property
    # @option attributes [String] :fingerprint The value to assign to the {#fingerprint} property
    # @option attributes [String] :device The value to assign to the {#device} property
    # @option attributes [String] :country_code The value to assign to the {#country_code} property
    # @option attributes [Hash<String, String>] :request_headers The value to assign to the {#request_headers} property
    # @option attributes [String] :threat_feed_key The value to assign to the {#threat_feed_key} property
    # @option attributes [String] :access_rule_key The value to assign to the {#access_rule_key} property
    # @option attributes [String] :address_rate_limiting_key The value to assign to the {#address_rate_limiting_key} property
    # @option attributes [DateTime] :timestamp The value to assign to the {#timestamp} property
    # @option attributes [String] :log_type The value to assign to the {#log_type} property
    # @option attributes [String] :origin_address The value to assign to the {#origin_address} property
    # @option attributes [String] :origin_response_time The value to assign to the {#origin_response_time} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.action = attributes[:'action'] if attributes[:'action']

      self.captcha_action = attributes[:'captchaAction'] if attributes[:'captchaAction']

      raise 'You cannot provide both :captchaAction and :captcha_action' if attributes.key?(:'captchaAction') && attributes.key?(:'captcha_action')

      self.captcha_action = attributes[:'captcha_action'] if attributes[:'captcha_action']

      self.captcha_expected = attributes[:'captchaExpected'] if attributes[:'captchaExpected']

      raise 'You cannot provide both :captchaExpected and :captcha_expected' if attributes.key?(:'captchaExpected') && attributes.key?(:'captcha_expected')

      self.captcha_expected = attributes[:'captcha_expected'] if attributes[:'captcha_expected']

      self.captcha_received = attributes[:'captchaReceived'] if attributes[:'captchaReceived']

      raise 'You cannot provide both :captchaReceived and :captcha_received' if attributes.key?(:'captchaReceived') && attributes.key?(:'captcha_received')

      self.captcha_received = attributes[:'captcha_received'] if attributes[:'captcha_received']

      self.captcha_fail_count = attributes[:'captchaFailCount'] if attributes[:'captchaFailCount']

      raise 'You cannot provide both :captchaFailCount and :captcha_fail_count' if attributes.key?(:'captchaFailCount') && attributes.key?(:'captcha_fail_count')

      self.captcha_fail_count = attributes[:'captcha_fail_count'] if attributes[:'captcha_fail_count']

      self.client_address = attributes[:'clientAddress'] if attributes[:'clientAddress']

      raise 'You cannot provide both :clientAddress and :client_address' if attributes.key?(:'clientAddress') && attributes.key?(:'client_address')

      self.client_address = attributes[:'client_address'] if attributes[:'client_address']

      self.country_name = attributes[:'countryName'] if attributes[:'countryName']

      raise 'You cannot provide both :countryName and :country_name' if attributes.key?(:'countryName') && attributes.key?(:'country_name')

      self.country_name = attributes[:'country_name'] if attributes[:'country_name']

      self.user_agent = attributes[:'userAgent'] if attributes[:'userAgent']

      raise 'You cannot provide both :userAgent and :user_agent' if attributes.key?(:'userAgent') && attributes.key?(:'user_agent')

      self.user_agent = attributes[:'user_agent'] if attributes[:'user_agent']

      self.domain = attributes[:'domain'] if attributes[:'domain']

      self.protection_rule_detections = attributes[:'protectionRuleDetections'] if attributes[:'protectionRuleDetections']

      raise 'You cannot provide both :protectionRuleDetections and :protection_rule_detections' if attributes.key?(:'protectionRuleDetections') && attributes.key?(:'protection_rule_detections')

      self.protection_rule_detections = attributes[:'protection_rule_detections'] if attributes[:'protection_rule_detections']

      self.http_method = attributes[:'httpMethod'] if attributes[:'httpMethod']

      raise 'You cannot provide both :httpMethod and :http_method' if attributes.key?(:'httpMethod') && attributes.key?(:'http_method')

      self.http_method = attributes[:'http_method'] if attributes[:'http_method']

      self.request_url = attributes[:'requestUrl'] if attributes[:'requestUrl']

      raise 'You cannot provide both :requestUrl and :request_url' if attributes.key?(:'requestUrl') && attributes.key?(:'request_url')

      self.request_url = attributes[:'request_url'] if attributes[:'request_url']

      self.http_headers = attributes[:'httpHeaders'] if attributes[:'httpHeaders']

      raise 'You cannot provide both :httpHeaders and :http_headers' if attributes.key?(:'httpHeaders') && attributes.key?(:'http_headers')

      self.http_headers = attributes[:'http_headers'] if attributes[:'http_headers']

      self.referrer = attributes[:'referrer'] if attributes[:'referrer']

      self.response_code = attributes[:'responseCode'] if attributes[:'responseCode']

      raise 'You cannot provide both :responseCode and :response_code' if attributes.key?(:'responseCode') && attributes.key?(:'response_code')

      self.response_code = attributes[:'response_code'] if attributes[:'response_code']

      self.response_size = attributes[:'responseSize'] if attributes[:'responseSize']

      raise 'You cannot provide both :responseSize and :response_size' if attributes.key?(:'responseSize') && attributes.key?(:'response_size')

      self.response_size = attributes[:'response_size'] if attributes[:'response_size']

      self.incident_key = attributes[:'incidentKey'] if attributes[:'incidentKey']

      raise 'You cannot provide both :incidentKey and :incident_key' if attributes.key?(:'incidentKey') && attributes.key?(:'incident_key')

      self.incident_key = attributes[:'incident_key'] if attributes[:'incident_key']

      self.fingerprint = attributes[:'fingerprint'] if attributes[:'fingerprint']

      self.device = attributes[:'device'] if attributes[:'device']

      self.country_code = attributes[:'countryCode'] if attributes[:'countryCode']

      raise 'You cannot provide both :countryCode and :country_code' if attributes.key?(:'countryCode') && attributes.key?(:'country_code')

      self.country_code = attributes[:'country_code'] if attributes[:'country_code']

      self.request_headers = attributes[:'requestHeaders'] if attributes[:'requestHeaders']

      raise 'You cannot provide both :requestHeaders and :request_headers' if attributes.key?(:'requestHeaders') && attributes.key?(:'request_headers')

      self.request_headers = attributes[:'request_headers'] if attributes[:'request_headers']

      self.threat_feed_key = attributes[:'threatFeedKey'] if attributes[:'threatFeedKey']

      raise 'You cannot provide both :threatFeedKey and :threat_feed_key' if attributes.key?(:'threatFeedKey') && attributes.key?(:'threat_feed_key')

      self.threat_feed_key = attributes[:'threat_feed_key'] if attributes[:'threat_feed_key']

      self.access_rule_key = attributes[:'accessRuleKey'] if attributes[:'accessRuleKey']

      raise 'You cannot provide both :accessRuleKey and :access_rule_key' if attributes.key?(:'accessRuleKey') && attributes.key?(:'access_rule_key')

      self.access_rule_key = attributes[:'access_rule_key'] if attributes[:'access_rule_key']

      self.address_rate_limiting_key = attributes[:'addressRateLimitingKey'] if attributes[:'addressRateLimitingKey']

      raise 'You cannot provide both :addressRateLimitingKey and :address_rate_limiting_key' if attributes.key?(:'addressRateLimitingKey') && attributes.key?(:'address_rate_limiting_key')

      self.address_rate_limiting_key = attributes[:'address_rate_limiting_key'] if attributes[:'address_rate_limiting_key']

      self.timestamp = attributes[:'timestamp'] if attributes[:'timestamp']

      self.log_type = attributes[:'logType'] if attributes[:'logType']

      raise 'You cannot provide both :logType and :log_type' if attributes.key?(:'logType') && attributes.key?(:'log_type')

      self.log_type = attributes[:'log_type'] if attributes[:'log_type']

      self.origin_address = attributes[:'originAddress'] if attributes[:'originAddress']

      raise 'You cannot provide both :originAddress and :origin_address' if attributes.key?(:'originAddress') && attributes.key?(:'origin_address')

      self.origin_address = attributes[:'origin_address'] if attributes[:'origin_address']

      self.origin_response_time = attributes[:'originResponseTime'] if attributes[:'originResponseTime']

      raise 'You cannot provide both :originResponseTime and :origin_response_time' if attributes.key?(:'originResponseTime') && attributes.key?(:'origin_response_time')

      self.origin_response_time = attributes[:'origin_response_time'] if attributes[:'origin_response_time']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        action == other.action &&
        captcha_action == other.captcha_action &&
        captcha_expected == other.captcha_expected &&
        captcha_received == other.captcha_received &&
        captcha_fail_count == other.captcha_fail_count &&
        client_address == other.client_address &&
        country_name == other.country_name &&
        user_agent == other.user_agent &&
        domain == other.domain &&
        protection_rule_detections == other.protection_rule_detections &&
        http_method == other.http_method &&
        request_url == other.request_url &&
        http_headers == other.http_headers &&
        referrer == other.referrer &&
        response_code == other.response_code &&
        response_size == other.response_size &&
        incident_key == other.incident_key &&
        fingerprint == other.fingerprint &&
        device == other.device &&
        country_code == other.country_code &&
        request_headers == other.request_headers &&
        threat_feed_key == other.threat_feed_key &&
        access_rule_key == other.access_rule_key &&
        address_rate_limiting_key == other.address_rate_limiting_key &&
        timestamp == other.timestamp &&
        log_type == other.log_type &&
        origin_address == other.origin_address &&
        origin_response_time == other.origin_response_time
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
      [action, captcha_action, captcha_expected, captcha_received, captcha_fail_count, client_address, country_name, user_agent, domain, protection_rule_detections, http_method, request_url, http_headers, referrer, response_code, response_size, incident_key, fingerprint, device, country_code, request_headers, threat_feed_key, access_rule_key, address_rate_limiting_key, timestamp, log_type, origin_address, origin_response_time].hash
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
