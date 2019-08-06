# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The settings used for protection rules.
  class Waas::Models::ProtectionSettings
    BLOCK_ACTION_ENUM = [
      BLOCK_ACTION_SHOW_ERROR_PAGE = 'SHOW_ERROR_PAGE'.freeze,
      BLOCK_ACTION_SET_RESPONSE_CODE = 'SET_RESPONSE_CODE'.freeze,
      BLOCK_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ALLOWED_HTTP_METHODS_ENUM = [
      ALLOWED_HTTP_METHODS_OPTIONS = 'OPTIONS'.freeze,
      ALLOWED_HTTP_METHODS_GET = 'GET'.freeze,
      ALLOWED_HTTP_METHODS_HEAD = 'HEAD'.freeze,
      ALLOWED_HTTP_METHODS_POST = 'POST'.freeze,
      ALLOWED_HTTP_METHODS_PUT = 'PUT'.freeze,
      ALLOWED_HTTP_METHODS_DELETE = 'DELETE'.freeze,
      ALLOWED_HTTP_METHODS_TRACE = 'TRACE'.freeze,
      ALLOWED_HTTP_METHODS_CONNECT = 'CONNECT'.freeze,
      ALLOWED_HTTP_METHODS_PATCH = 'PATCH'.freeze,
      ALLOWED_HTTP_METHODS_PROPFIND = 'PROPFIND'.freeze,
      ALLOWED_HTTP_METHODS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # If `action` is set to `BLOCK`, this specifies how the traffic is blocked when detected as malicious by a protection rule. If unspecified, defaults to `SET_RESPONSE_CODE`.
    # @return [String]
    attr_reader :block_action

    # The response code returned when `action` is set to `BLOCK`, `blockAction` is set to `SET_RESPONSE_CODE`, and the traffic is detected as malicious by a protection rule. If unspecified, defaults to `403`.
    # @return [Integer]
    attr_accessor :block_response_code

    # The message to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the traffic is detected as malicious by a protection rule. If unspecified, defaults to 'Access to the website is blocked.'
    # @return [String]
    attr_accessor :block_error_page_message

    # The error code to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the traffic is detected as malicious by a protection rule. If unspecified, defaults to `403`.
    # @return [String]
    attr_accessor :block_error_page_code

    # The description text to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the traffic is detected as malicious by a protection rule. If unspecified, defaults to `Access blocked by website owner. Please contact support.`
    # @return [String]
    attr_accessor :block_error_page_description

    # The maximum number of arguments allowed to be passed to your application before an action is taken. Arguements are query parameters or body parameters in a PUT or POST request. If unspecified, defaults to `255`. This setting only applies if a corresponding protection rule is enabled, such as the \"Number of Arguments Limits\" rule (key: 960335).
    #
    # Example: If `maxArgumentCount` to `2` for the Max Number of Arguments protection rule (key: 960335), the following requests would be blocked:
    # `GET /myapp/path?query=one&query=two&query=three`
    # `POST /myapp/path` with Body `{\"argument1\":\"one\",\"argument2\":\"two\",\"argument3\":\"three\"}`
    # @return [Integer]
    attr_accessor :max_argument_count

    # The maximum length allowed for each argument name, in characters. Arguements are query parameters or body parameters in a PUT or POST request. If unspecified, defaults to `400`. This setting only applies if a corresponding protection rule is enabled, such as the \"Values Limits\" rule (key: 960208).
    # @return [Integer]
    attr_accessor :max_name_length_per_argument

    # The maximum length allowed for the sum of the argument name and value, in characters. Arguements are query parameters or body parameters in a PUT or POST request. If unspecified, defaults to `64000`. This setting only applies if a corresponding protection rule is enabled, such as the \"Total Arguments Limits\" rule (key: 960341).
    # @return [Integer]
    attr_accessor :max_total_name_length_of_arguments

    # The length of time to analyze traffic traffic, in days. After the analysis period, `WafRecommendations` will be populated. If unspecified, defaults to `10`.
    #
    # Use `GET /waasPolicies/{waasPolicyId}/wafRecommendations` to view WAF recommendations.
    # @return [Integer]
    attr_accessor :recommendations_period_in_days

    # Inspects the response body of origin responses. Can be used to detect leakage of sensitive data. If unspecified, defaults to `false`.
    #
    # **Note:** Only origin responses with a Content-Type matching a value in `mediaTypes` will be inspected.
    # @return [BOOLEAN]
    attr_accessor :is_response_inspected

    # The maximum response size to be fully inspected, in binary kilobytes (KiB). Anything over this limit will be partially inspected. If unspecified, defaults to `1024`.
    # @return [Integer]
    attr_accessor :max_response_size_in_ki_b

    # The list of allowed HTTP methods. If unspecified, default to `[OPTIONS, GET, HEAD, POST]`. This setting only applies if a corresponding protection rule is enabled, such as the \"Restrict HTTP Request Methods\" rule (key: 911100).
    # @return [Array<String>]
    attr_reader :allowed_http_methods

    # The list of media types to allow for inspection, if `isResponseInspected` is enabled. Only responses with MIME types in this list will be inspected. If unspecified, defaults to `[\"text/html\", \"text/plain\", \"text/xml\"]`.
    #
    #     Supported MIME types include:
    #
    #     - text/html
    #     - text/plain
    #     - text/asp
    #     - text/css
    #     - text/x-script
    #     - application/json
    #     - text/webviewhtml
    #     - text/x-java-source
    #     - application/x-javascript
    #     - application/javascript
    #     - application/ecmascript
    #     - text/javascript
    #     - text/ecmascript
    #     - text/x-script.perl
    #     - text/x-script.phyton
    #     - application/plain
    #     - application/xml
    #     - text/xml
    # @return [Array<String>]
    attr_accessor :media_types

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'block_action': :'blockAction',
        'block_response_code': :'blockResponseCode',
        'block_error_page_message': :'blockErrorPageMessage',
        'block_error_page_code': :'blockErrorPageCode',
        'block_error_page_description': :'blockErrorPageDescription',
        'max_argument_count': :'maxArgumentCount',
        'max_name_length_per_argument': :'maxNameLengthPerArgument',
        'max_total_name_length_of_arguments': :'maxTotalNameLengthOfArguments',
        'recommendations_period_in_days': :'recommendationsPeriodInDays',
        'is_response_inspected': :'isResponseInspected',
        'max_response_size_in_ki_b': :'maxResponseSizeInKiB',
        'allowed_http_methods': :'allowedHttpMethods',
        'media_types': :'mediaTypes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'block_action': :'String',
        'block_response_code': :'Integer',
        'block_error_page_message': :'String',
        'block_error_page_code': :'String',
        'block_error_page_description': :'String',
        'max_argument_count': :'Integer',
        'max_name_length_per_argument': :'Integer',
        'max_total_name_length_of_arguments': :'Integer',
        'recommendations_period_in_days': :'Integer',
        'is_response_inspected': :'BOOLEAN',
        'max_response_size_in_ki_b': :'Integer',
        'allowed_http_methods': :'Array<String>',
        'media_types': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :block_action The value to assign to the {#block_action} property
    # @option attributes [Integer] :block_response_code The value to assign to the {#block_response_code} property
    # @option attributes [String] :block_error_page_message The value to assign to the {#block_error_page_message} property
    # @option attributes [String] :block_error_page_code The value to assign to the {#block_error_page_code} property
    # @option attributes [String] :block_error_page_description The value to assign to the {#block_error_page_description} property
    # @option attributes [Integer] :max_argument_count The value to assign to the {#max_argument_count} property
    # @option attributes [Integer] :max_name_length_per_argument The value to assign to the {#max_name_length_per_argument} property
    # @option attributes [Integer] :max_total_name_length_of_arguments The value to assign to the {#max_total_name_length_of_arguments} property
    # @option attributes [Integer] :recommendations_period_in_days The value to assign to the {#recommendations_period_in_days} property
    # @option attributes [BOOLEAN] :is_response_inspected The value to assign to the {#is_response_inspected} property
    # @option attributes [Integer] :max_response_size_in_ki_b The value to assign to the {#max_response_size_in_ki_b} property
    # @option attributes [Array<String>] :allowed_http_methods The value to assign to the {#allowed_http_methods} property
    # @option attributes [Array<String>] :media_types The value to assign to the {#media_types} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.block_action = attributes[:'blockAction'] if attributes[:'blockAction']

      raise 'You cannot provide both :blockAction and :block_action' if attributes.key?(:'blockAction') && attributes.key?(:'block_action')

      self.block_action = attributes[:'block_action'] if attributes[:'block_action']

      self.block_response_code = attributes[:'blockResponseCode'] if attributes[:'blockResponseCode']

      raise 'You cannot provide both :blockResponseCode and :block_response_code' if attributes.key?(:'blockResponseCode') && attributes.key?(:'block_response_code')

      self.block_response_code = attributes[:'block_response_code'] if attributes[:'block_response_code']

      self.block_error_page_message = attributes[:'blockErrorPageMessage'] if attributes[:'blockErrorPageMessage']

      raise 'You cannot provide both :blockErrorPageMessage and :block_error_page_message' if attributes.key?(:'blockErrorPageMessage') && attributes.key?(:'block_error_page_message')

      self.block_error_page_message = attributes[:'block_error_page_message'] if attributes[:'block_error_page_message']

      self.block_error_page_code = attributes[:'blockErrorPageCode'] if attributes[:'blockErrorPageCode']

      raise 'You cannot provide both :blockErrorPageCode and :block_error_page_code' if attributes.key?(:'blockErrorPageCode') && attributes.key?(:'block_error_page_code')

      self.block_error_page_code = attributes[:'block_error_page_code'] if attributes[:'block_error_page_code']

      self.block_error_page_description = attributes[:'blockErrorPageDescription'] if attributes[:'blockErrorPageDescription']

      raise 'You cannot provide both :blockErrorPageDescription and :block_error_page_description' if attributes.key?(:'blockErrorPageDescription') && attributes.key?(:'block_error_page_description')

      self.block_error_page_description = attributes[:'block_error_page_description'] if attributes[:'block_error_page_description']

      self.max_argument_count = attributes[:'maxArgumentCount'] if attributes[:'maxArgumentCount']

      raise 'You cannot provide both :maxArgumentCount and :max_argument_count' if attributes.key?(:'maxArgumentCount') && attributes.key?(:'max_argument_count')

      self.max_argument_count = attributes[:'max_argument_count'] if attributes[:'max_argument_count']

      self.max_name_length_per_argument = attributes[:'maxNameLengthPerArgument'] if attributes[:'maxNameLengthPerArgument']

      raise 'You cannot provide both :maxNameLengthPerArgument and :max_name_length_per_argument' if attributes.key?(:'maxNameLengthPerArgument') && attributes.key?(:'max_name_length_per_argument')

      self.max_name_length_per_argument = attributes[:'max_name_length_per_argument'] if attributes[:'max_name_length_per_argument']

      self.max_total_name_length_of_arguments = attributes[:'maxTotalNameLengthOfArguments'] if attributes[:'maxTotalNameLengthOfArguments']

      raise 'You cannot provide both :maxTotalNameLengthOfArguments and :max_total_name_length_of_arguments' if attributes.key?(:'maxTotalNameLengthOfArguments') && attributes.key?(:'max_total_name_length_of_arguments')

      self.max_total_name_length_of_arguments = attributes[:'max_total_name_length_of_arguments'] if attributes[:'max_total_name_length_of_arguments']

      self.recommendations_period_in_days = attributes[:'recommendationsPeriodInDays'] if attributes[:'recommendationsPeriodInDays']

      raise 'You cannot provide both :recommendationsPeriodInDays and :recommendations_period_in_days' if attributes.key?(:'recommendationsPeriodInDays') && attributes.key?(:'recommendations_period_in_days')

      self.recommendations_period_in_days = attributes[:'recommendations_period_in_days'] if attributes[:'recommendations_period_in_days']

      self.is_response_inspected = attributes[:'isResponseInspected'] unless attributes[:'isResponseInspected'].nil?

      raise 'You cannot provide both :isResponseInspected and :is_response_inspected' if attributes.key?(:'isResponseInspected') && attributes.key?(:'is_response_inspected')

      self.is_response_inspected = attributes[:'is_response_inspected'] unless attributes[:'is_response_inspected'].nil?

      self.max_response_size_in_ki_b = attributes[:'maxResponseSizeInKiB'] if attributes[:'maxResponseSizeInKiB']

      raise 'You cannot provide both :maxResponseSizeInKiB and :max_response_size_in_ki_b' if attributes.key?(:'maxResponseSizeInKiB') && attributes.key?(:'max_response_size_in_ki_b')

      self.max_response_size_in_ki_b = attributes[:'max_response_size_in_ki_b'] if attributes[:'max_response_size_in_ki_b']

      self.allowed_http_methods = attributes[:'allowedHttpMethods'] if attributes[:'allowedHttpMethods']

      raise 'You cannot provide both :allowedHttpMethods and :allowed_http_methods' if attributes.key?(:'allowedHttpMethods') && attributes.key?(:'allowed_http_methods')

      self.allowed_http_methods = attributes[:'allowed_http_methods'] if attributes[:'allowed_http_methods']

      self.media_types = attributes[:'mediaTypes'] if attributes[:'mediaTypes']

      raise 'You cannot provide both :mediaTypes and :media_types' if attributes.key?(:'mediaTypes') && attributes.key?(:'media_types')

      self.media_types = attributes[:'media_types'] if attributes[:'media_types']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] block_action Object to be assigned
    def block_action=(block_action)
      # rubocop:disable Style/ConditionalAssignment
      if block_action && !BLOCK_ACTION_ENUM.include?(block_action)
        OCI.logger.debug("Unknown value for 'block_action' [" + block_action + "]. Mapping to 'BLOCK_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @block_action = BLOCK_ACTION_UNKNOWN_ENUM_VALUE
      else
        @block_action = block_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] allowed_http_methods Object to be assigned
    def allowed_http_methods=(allowed_http_methods)
      # rubocop:disable Style/ConditionalAssignment
      if allowed_http_methods.nil?
        @allowed_http_methods = nil
      else
        @allowed_http_methods =
          allowed_http_methods.collect do |item|
            if ALLOWED_HTTP_METHODS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'allowed_http_methods' [#{item}]. Mapping to 'ALLOWED_HTTP_METHODS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              ALLOWED_HTTP_METHODS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        block_action == other.block_action &&
        block_response_code == other.block_response_code &&
        block_error_page_message == other.block_error_page_message &&
        block_error_page_code == other.block_error_page_code &&
        block_error_page_description == other.block_error_page_description &&
        max_argument_count == other.max_argument_count &&
        max_name_length_per_argument == other.max_name_length_per_argument &&
        max_total_name_length_of_arguments == other.max_total_name_length_of_arguments &&
        recommendations_period_in_days == other.recommendations_period_in_days &&
        is_response_inspected == other.is_response_inspected &&
        max_response_size_in_ki_b == other.max_response_size_in_ki_b &&
        allowed_http_methods == other.allowed_http_methods &&
        media_types == other.media_types
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
      [block_action, block_response_code, block_error_page_message, block_error_page_code, block_error_page_description, max_argument_count, max_name_length_per_argument, max_total_name_length_of_arguments, recommendations_period_in_days, is_response_inspected, max_response_size_in_ki_b, allowed_http_methods, media_types].hash
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
