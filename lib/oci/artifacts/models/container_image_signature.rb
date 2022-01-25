# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Container image signature metadata.
  class Artifacts::Models::ContainerImageSignature
    SIGNING_ALGORITHM_ENUM = [
      SIGNING_ALGORITHM_SHA_224_RSA_PKCS_PSS = 'SHA_224_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_256_RSA_PKCS_PSS = 'SHA_256_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_384_RSA_PKCS_PSS = 'SHA_384_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_512_RSA_PKCS_PSS = 'SHA_512_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which the container repository exists.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The id of the user or principal that created the resource.
    # @return [String]
    attr_accessor :created_by

    # **[Required]** The last 10 characters of the kmsKeyId, the last 10 characters of the kmsKeyVersionId, the signingAlgorithm, and the last 10 characters of the signatureId.
    #
    # Example: `wrmz22sixa::qdwyc2ptun::SHA_256_RSA_PKCS_PSS::2vwmobasva`
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the container image signature.
    #
    # Example: `ocid1.containerimagesignature.oc1..exampleuniqueID`
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the container image.
    #
    # Example: `ocid1.containerimage.oc1..exampleuniqueID`
    #
    # @return [String]
    attr_accessor :image_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the kmsKeyId used to sign the container image.
    #
    # Example: `ocid1.key.oc1..exampleuniqueID`
    #
    # @return [String]
    attr_accessor :kms_key_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the kmsKeyVersionId used to sign the container image.
    #
    # Example: `ocid1.keyversion.oc1..exampleuniqueID`
    #
    # @return [String]
    attr_accessor :kms_key_version_id

    # **[Required]** The base64 encoded signature payload that was signed.
    # @return [String]
    attr_accessor :message

    # **[Required]** The signature of the message field using the kmsKeyId, the kmsKeyVersionId, and the signingAlgorithm.
    # @return [String]
    attr_accessor :signature

    # **[Required]** The algorithm to be used for signing. These are the only supported signing algorithms for container images.
    # @return [String]
    attr_reader :signing_algorithm

    # **[Required]** An RFC 3339 timestamp indicating when the image was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'created_by': :'createdBy',
        'display_name': :'displayName',
        'id': :'id',
        'image_id': :'imageId',
        'kms_key_id': :'kmsKeyId',
        'kms_key_version_id': :'kmsKeyVersionId',
        'message': :'message',
        'signature': :'signature',
        'signing_algorithm': :'signingAlgorithm',
        'time_created': :'timeCreated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'created_by': :'String',
        'display_name': :'String',
        'id': :'String',
        'image_id': :'String',
        'kms_key_id': :'String',
        'kms_key_version_id': :'String',
        'message': :'String',
        'signature': :'String',
        'signing_algorithm': :'String',
        'time_created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [String] :kms_key_version_id The value to assign to the {#kms_key_version_id} property
    # @option attributes [String] :message The value to assign to the {#message} property
    # @option attributes [String] :signature The value to assign to the {#signature} property
    # @option attributes [String] :signing_algorithm The value to assign to the {#signing_algorithm} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.kms_key_version_id = attributes[:'kmsKeyVersionId'] if attributes[:'kmsKeyVersionId']

      raise 'You cannot provide both :kmsKeyVersionId and :kms_key_version_id' if attributes.key?(:'kmsKeyVersionId') && attributes.key?(:'kms_key_version_id')

      self.kms_key_version_id = attributes[:'kms_key_version_id'] if attributes[:'kms_key_version_id']

      self.message = attributes[:'message'] if attributes[:'message']

      self.signature = attributes[:'signature'] if attributes[:'signature']

      self.signing_algorithm = attributes[:'signingAlgorithm'] if attributes[:'signingAlgorithm']

      raise 'You cannot provide both :signingAlgorithm and :signing_algorithm' if attributes.key?(:'signingAlgorithm') && attributes.key?(:'signing_algorithm')

      self.signing_algorithm = attributes[:'signing_algorithm'] if attributes[:'signing_algorithm']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] signing_algorithm Object to be assigned
    def signing_algorithm=(signing_algorithm)
      # rubocop:disable Style/ConditionalAssignment
      if signing_algorithm && !SIGNING_ALGORITHM_ENUM.include?(signing_algorithm)
        OCI.logger.debug("Unknown value for 'signing_algorithm' [" + signing_algorithm + "]. Mapping to 'SIGNING_ALGORITHM_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @signing_algorithm = SIGNING_ALGORITHM_UNKNOWN_ENUM_VALUE
      else
        @signing_algorithm = signing_algorithm
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        created_by == other.created_by &&
        display_name == other.display_name &&
        id == other.id &&
        image_id == other.image_id &&
        kms_key_id == other.kms_key_id &&
        kms_key_version_id == other.kms_key_version_id &&
        message == other.message &&
        signature == other.signature &&
        signing_algorithm == other.signing_algorithm &&
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
      [compartment_id, created_by, display_name, id, image_id, kms_key_id, kms_key_version_id, message, signature, signing_algorithm, time_created].hash
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
