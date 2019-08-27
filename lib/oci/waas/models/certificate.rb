# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the SSL certificate.
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  class Waas::Models::Certificate
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the certificate.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the certificate's compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-friendly name of the certificate.
    # @return [String]
    attr_accessor :display_name

    # @return [String]
    attr_accessor :issued_by

    # @return [OCI::Waas::Models::CertificateSubjectName]
    attr_accessor :subject_name

    # @return [OCI::Waas::Models::CertificateIssuerName]
    attr_accessor :issuer_name

    # **[Required]** A unique, positive integer assigned by the Certificate Authority (CA). The issuer name and serial number identify a unique certificate.
    # @return [String]
    attr_accessor :serial_number

    # **[Required]** The version of the encoded certificate.
    # @return [Integer]
    attr_accessor :version

    # **[Required]** The identifier for the cryptographic algorithm used by the Certificate Authority (CA) to sign this certificate.
    # @return [String]
    attr_accessor :signature_algorithm

    # **[Required]** The date and time the certificate will become valid, expressed in RFC 3339 timestamp format.
    # @return [DateTime]
    attr_accessor :time_not_valid_before

    # **[Required]** The date and time the certificate will expire, expressed in RFC 3339 timestamp format.
    # @return [DateTime]
    attr_accessor :time_not_valid_after

    # @return [OCI::Waas::Models::CertificatePublicKeyInfo]
    attr_accessor :public_key_info

    # Additional attributes associated with users or public keys for managing relationships between Certificate Authorities.
    # @return [Array<OCI::Waas::Models::CertificateExtensions>]
    attr_accessor :extensions

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The current lifecycle state of the SSL certificate.
    # @return [String]
    attr_reader :lifecycle_state

    # The date and time the certificate was created, expressed in RFC 3339 timestamp format.
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'issued_by': :'issuedBy',
        'subject_name': :'subjectName',
        'issuer_name': :'issuerName',
        'serial_number': :'serialNumber',
        'version': :'version',
        'signature_algorithm': :'signatureAlgorithm',
        'time_not_valid_before': :'timeNotValidBefore',
        'time_not_valid_after': :'timeNotValidAfter',
        'public_key_info': :'publicKeyInfo',
        'extensions': :'extensions',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'issued_by': :'String',
        'subject_name': :'OCI::Waas::Models::CertificateSubjectName',
        'issuer_name': :'OCI::Waas::Models::CertificateIssuerName',
        'serial_number': :'String',
        'version': :'Integer',
        'signature_algorithm': :'String',
        'time_not_valid_before': :'DateTime',
        'time_not_valid_after': :'DateTime',
        'public_key_info': :'OCI::Waas::Models::CertificatePublicKeyInfo',
        'extensions': :'Array<OCI::Waas::Models::CertificateExtensions>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'lifecycle_state': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :issued_by The value to assign to the {#issued_by} property
    # @option attributes [OCI::Waas::Models::CertificateSubjectName] :subject_name The value to assign to the {#subject_name} property
    # @option attributes [OCI::Waas::Models::CertificateIssuerName] :issuer_name The value to assign to the {#issuer_name} property
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [Integer] :version The value to assign to the {#version} property
    # @option attributes [String] :signature_algorithm The value to assign to the {#signature_algorithm} property
    # @option attributes [DateTime] :time_not_valid_before The value to assign to the {#time_not_valid_before} property
    # @option attributes [DateTime] :time_not_valid_after The value to assign to the {#time_not_valid_after} property
    # @option attributes [OCI::Waas::Models::CertificatePublicKeyInfo] :public_key_info The value to assign to the {#public_key_info} property
    # @option attributes [Array<OCI::Waas::Models::CertificateExtensions>] :extensions The value to assign to the {#extensions} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.issued_by = attributes[:'issuedBy'] if attributes[:'issuedBy']

      raise 'You cannot provide both :issuedBy and :issued_by' if attributes.key?(:'issuedBy') && attributes.key?(:'issued_by')

      self.issued_by = attributes[:'issued_by'] if attributes[:'issued_by']

      self.subject_name = attributes[:'subjectName'] if attributes[:'subjectName']

      raise 'You cannot provide both :subjectName and :subject_name' if attributes.key?(:'subjectName') && attributes.key?(:'subject_name')

      self.subject_name = attributes[:'subject_name'] if attributes[:'subject_name']

      self.issuer_name = attributes[:'issuerName'] if attributes[:'issuerName']

      raise 'You cannot provide both :issuerName and :issuer_name' if attributes.key?(:'issuerName') && attributes.key?(:'issuer_name')

      self.issuer_name = attributes[:'issuer_name'] if attributes[:'issuer_name']

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.version = attributes[:'version'] if attributes[:'version']

      self.signature_algorithm = attributes[:'signatureAlgorithm'] if attributes[:'signatureAlgorithm']

      raise 'You cannot provide both :signatureAlgorithm and :signature_algorithm' if attributes.key?(:'signatureAlgorithm') && attributes.key?(:'signature_algorithm')

      self.signature_algorithm = attributes[:'signature_algorithm'] if attributes[:'signature_algorithm']

      self.time_not_valid_before = attributes[:'timeNotValidBefore'] if attributes[:'timeNotValidBefore']

      raise 'You cannot provide both :timeNotValidBefore and :time_not_valid_before' if attributes.key?(:'timeNotValidBefore') && attributes.key?(:'time_not_valid_before')

      self.time_not_valid_before = attributes[:'time_not_valid_before'] if attributes[:'time_not_valid_before']

      self.time_not_valid_after = attributes[:'timeNotValidAfter'] if attributes[:'timeNotValidAfter']

      raise 'You cannot provide both :timeNotValidAfter and :time_not_valid_after' if attributes.key?(:'timeNotValidAfter') && attributes.key?(:'time_not_valid_after')

      self.time_not_valid_after = attributes[:'time_not_valid_after'] if attributes[:'time_not_valid_after']

      self.public_key_info = attributes[:'publicKeyInfo'] if attributes[:'publicKeyInfo']

      raise 'You cannot provide both :publicKeyInfo and :public_key_info' if attributes.key?(:'publicKeyInfo') && attributes.key?(:'public_key_info')

      self.public_key_info = attributes[:'public_key_info'] if attributes[:'public_key_info']

      self.extensions = attributes[:'extensions'] if attributes[:'extensions']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        issued_by == other.issued_by &&
        subject_name == other.subject_name &&
        issuer_name == other.issuer_name &&
        serial_number == other.serial_number &&
        version == other.version &&
        signature_algorithm == other.signature_algorithm &&
        time_not_valid_before == other.time_not_valid_before &&
        time_not_valid_after == other.time_not_valid_after &&
        public_key_info == other.public_key_info &&
        extensions == other.extensions &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created
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
      [id, compartment_id, display_name, issued_by, subject_name, issuer_name, serial_number, version, signature_algorithm, time_not_valid_before, time_not_valid_after, public_key_info, extensions, freeform_tags, defined_tags, lifecycle_state, time_created].hash
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
