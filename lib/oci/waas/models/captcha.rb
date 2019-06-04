# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The settings of the CAPTCHA challenge. If a specific URL should be accessed only by a human, a CAPTCHA challenge can be placed at the URL to protect the web application from bots.
  #
  # *Warning:* Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  class Waas::Models::Captcha
    # **[Required]** The unique URL path at which to show the CAPTCHA challenge.
    # @return [String]
    attr_accessor :url

    # **[Required]** The amount of time before the CAPTCHA expires, in seconds. If unspecified, defaults to `300`.
    # @return [Integer]
    attr_accessor :session_expiration_in_seconds

    # **[Required]** The title used when displaying a CAPTCHA challenge. If unspecified, defaults to `Are you human?`
    # @return [String]
    attr_accessor :title

    # The text to show in the header when showing a CAPTCHA challenge. If unspecified, defaults to 'We have detected an increased number of attempts to access this website. To help us keep this site secure, please let us know that you are not a robot by entering the text from the image below.'
    # @return [String]
    attr_accessor :header_text

    # The text to show in the footer when showing a CAPTCHA challenge. If unspecified, defaults to 'Enter the letters and numbers as they are shown in the image above.'
    # @return [String]
    attr_accessor :footer_text

    # **[Required]** The text to show when incorrect CAPTCHA text is entered. If unspecified, defaults to `The CAPTCHA was incorrect. Try again.`
    # @return [String]
    attr_accessor :failure_message

    # **[Required]** The text to show on the label of the CAPTCHA challenge submit button. If unspecified, defaults to `Yes, I am human`.
    # @return [String]
    attr_accessor :submit_label

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'url': :'url',
        'session_expiration_in_seconds': :'sessionExpirationInSeconds',
        'title': :'title',
        'header_text': :'headerText',
        'footer_text': :'footerText',
        'failure_message': :'failureMessage',
        'submit_label': :'submitLabel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'url': :'String',
        'session_expiration_in_seconds': :'Integer',
        'title': :'String',
        'header_text': :'String',
        'footer_text': :'String',
        'failure_message': :'String',
        'submit_label': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :url The value to assign to the {#url} property
    # @option attributes [Integer] :session_expiration_in_seconds The value to assign to the {#session_expiration_in_seconds} property
    # @option attributes [String] :title The value to assign to the {#title} property
    # @option attributes [String] :header_text The value to assign to the {#header_text} property
    # @option attributes [String] :footer_text The value to assign to the {#footer_text} property
    # @option attributes [String] :failure_message The value to assign to the {#failure_message} property
    # @option attributes [String] :submit_label The value to assign to the {#submit_label} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.url = attributes[:'url'] if attributes[:'url']

      self.session_expiration_in_seconds = attributes[:'sessionExpirationInSeconds'] if attributes[:'sessionExpirationInSeconds']

      raise 'You cannot provide both :sessionExpirationInSeconds and :session_expiration_in_seconds' if attributes.key?(:'sessionExpirationInSeconds') && attributes.key?(:'session_expiration_in_seconds')

      self.session_expiration_in_seconds = attributes[:'session_expiration_in_seconds'] if attributes[:'session_expiration_in_seconds']

      self.title = attributes[:'title'] if attributes[:'title']

      self.header_text = attributes[:'headerText'] if attributes[:'headerText']

      raise 'You cannot provide both :headerText and :header_text' if attributes.key?(:'headerText') && attributes.key?(:'header_text')

      self.header_text = attributes[:'header_text'] if attributes[:'header_text']

      self.footer_text = attributes[:'footerText'] if attributes[:'footerText']

      raise 'You cannot provide both :footerText and :footer_text' if attributes.key?(:'footerText') && attributes.key?(:'footer_text')

      self.footer_text = attributes[:'footer_text'] if attributes[:'footer_text']

      self.failure_message = attributes[:'failureMessage'] if attributes[:'failureMessage']

      raise 'You cannot provide both :failureMessage and :failure_message' if attributes.key?(:'failureMessage') && attributes.key?(:'failure_message')

      self.failure_message = attributes[:'failure_message'] if attributes[:'failure_message']

      self.submit_label = attributes[:'submitLabel'] if attributes[:'submitLabel']

      raise 'You cannot provide both :submitLabel and :submit_label' if attributes.key?(:'submitLabel') && attributes.key?(:'submit_label')

      self.submit_label = attributes[:'submit_label'] if attributes[:'submit_label']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        url == other.url &&
        session_expiration_in_seconds == other.session_expiration_in_seconds &&
        title == other.title &&
        header_text == other.header_text &&
        footer_text == other.footer_text &&
        failure_message == other.failure_message &&
        submit_label == other.submit_label
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
      [url, session_expiration_in_seconds, title, header_text, footer_text, failure_message, submit_label].hash
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
