# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220926
require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details that are required by the sender to submit a request to send email.
  class EmailDataPlane::Models::SubmitEmailDetails
    # The unique ID for the email's Message-ID header used for service log correlation. The submission will return an error if the syntax is not a valid [RFC 5322](https://www.rfc-editor.org/rfc/rfc5322) Message-ID. This will be generated if not provided.
    # Example: sdiofu234qwermls24fd@mail.example.com
    #
    # @return [String]
    attr_accessor :message_id

    # This attribute is required.
    # @return [OCI::EmailDataPlane::Models::Sender]
    attr_accessor :sender

    # This attribute is required.
    # @return [OCI::EmailDataPlane::Models::Recipients]
    attr_accessor :recipients

    # **[Required]** A short summary of the content, which will appear in the recipient's inbox. UTF-8 supported [RFC 2047](https://www.rfc-editor.org/rfc/rfc2047).
    # @return [String]
    attr_accessor :subject

    # HTML body content in UTF-8.
    # NOTE: Even though bodytext and bodyhtml are both optional, at least one of them must be provided.
    #
    # @return [String]
    attr_accessor :body_html

    # Text body content.
    # NOTE: Even though bodytext and bodyhtml are both optional, at least one of them must be provided.
    #
    # @return [String]
    attr_accessor :body_text

    # The email address for the recipient to reply to. If left blank, defaults to the sender address.
    # @return [Array<OCI::EmailDataPlane::Models::EmailAddress>]
    attr_accessor :reply_to

    # The header used by the customer for the email sent. Reserved headers are not allowed e.g \"subject\", \"from\", and \"to\" etc.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :header_fields

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'message_id': :'messageId',
        'sender': :'sender',
        'recipients': :'recipients',
        'subject': :'subject',
        'body_html': :'bodyHtml',
        'body_text': :'bodyText',
        'reply_to': :'replyTo',
        'header_fields': :'headerFields'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'message_id': :'String',
        'sender': :'OCI::EmailDataPlane::Models::Sender',
        'recipients': :'OCI::EmailDataPlane::Models::Recipients',
        'subject': :'String',
        'body_html': :'String',
        'body_text': :'String',
        'reply_to': :'Array<OCI::EmailDataPlane::Models::EmailAddress>',
        'header_fields': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :message_id The value to assign to the {#message_id} property
    # @option attributes [OCI::EmailDataPlane::Models::Sender] :sender The value to assign to the {#sender} property
    # @option attributes [OCI::EmailDataPlane::Models::Recipients] :recipients The value to assign to the {#recipients} property
    # @option attributes [String] :subject The value to assign to the {#subject} property
    # @option attributes [String] :body_html The value to assign to the {#body_html} property
    # @option attributes [String] :body_text The value to assign to the {#body_text} property
    # @option attributes [Array<OCI::EmailDataPlane::Models::EmailAddress>] :reply_to The value to assign to the {#reply_to} property
    # @option attributes [Hash<String, String>] :header_fields The value to assign to the {#header_fields} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.message_id = attributes[:'messageId'] if attributes[:'messageId']

      raise 'You cannot provide both :messageId and :message_id' if attributes.key?(:'messageId') && attributes.key?(:'message_id')

      self.message_id = attributes[:'message_id'] if attributes[:'message_id']

      self.sender = attributes[:'sender'] if attributes[:'sender']

      self.recipients = attributes[:'recipients'] if attributes[:'recipients']

      self.subject = attributes[:'subject'] if attributes[:'subject']

      self.body_html = attributes[:'bodyHtml'] if attributes[:'bodyHtml']

      raise 'You cannot provide both :bodyHtml and :body_html' if attributes.key?(:'bodyHtml') && attributes.key?(:'body_html')

      self.body_html = attributes[:'body_html'] if attributes[:'body_html']

      self.body_text = attributes[:'bodyText'] if attributes[:'bodyText']

      raise 'You cannot provide both :bodyText and :body_text' if attributes.key?(:'bodyText') && attributes.key?(:'body_text')

      self.body_text = attributes[:'body_text'] if attributes[:'body_text']

      self.reply_to = attributes[:'replyTo'] if attributes[:'replyTo']

      raise 'You cannot provide both :replyTo and :reply_to' if attributes.key?(:'replyTo') && attributes.key?(:'reply_to')

      self.reply_to = attributes[:'reply_to'] if attributes[:'reply_to']

      self.header_fields = attributes[:'headerFields'] if attributes[:'headerFields']

      raise 'You cannot provide both :headerFields and :header_fields' if attributes.key?(:'headerFields') && attributes.key?(:'header_fields')

      self.header_fields = attributes[:'header_fields'] if attributes[:'header_fields']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        message_id == other.message_id &&
        sender == other.sender &&
        recipients == other.recipients &&
        subject == other.subject &&
        body_html == other.body_html &&
        body_text == other.body_text &&
        reply_to == other.reply_to &&
        header_fields == other.header_fields
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
      [message_id, sender, recipients, subject, body_html, body_text, reply_to, header_fields].hash
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
