# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20220901
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Helmchart image details.
  class MarketplacePublisher::Models::HelmChartImageDetails
    VALIDATION_STATUS_ENUM = [
      VALIDATION_STATUS_VALIDATION_IN_PROGRESS = 'VALIDATION_IN_PROGRESS'.freeze,
      VALIDATION_STATUS_VALIDATION_FAILED = 'VALIDATION_FAILED'.freeze,
      VALIDATION_STATUS_VALIDATION_COMPLETED = 'VALIDATION_COMPLETED'.freeze,
      VALIDATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PUBLICATION_STATUS_ENUM = [
      PUBLICATION_STATUS_PUBLICATION_IN_PROGRESS = 'PUBLICATION_IN_PROGRESS'.freeze,
      PUBLICATION_STATUS_PUBLICATION_COMPLETED = 'PUBLICATION_COMPLETED'.freeze,
      PUBLICATION_STATUS_PUBLICATION_FAILED = 'PUBLICATION_FAILED'.freeze,
      PUBLICATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The source registry OCID of the helmchart image.
    # @return [String]
    attr_accessor :source_registry_id

    # **[Required]** source registry url of the helmchart image.
    # @return [String]
    attr_accessor :source_registry_url

    # The supported versions of Kubernetes
    # @return [Array<String>]
    attr_accessor :supported_kubernetes_versions

    # **[Required]** image validation status.
    # @return [String]
    attr_reader :validation_status

    # image validation failure errors
    # @return [String]
    attr_accessor :validation_error

    # **[Required]** image publication status
    # @return [String]
    attr_reader :publication_status

    # image validation failure errors
    # @return [String]
    attr_accessor :publication_error

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_registry_id': :'sourceRegistryId',
        'source_registry_url': :'sourceRegistryUrl',
        'supported_kubernetes_versions': :'supportedKubernetesVersions',
        'validation_status': :'validationStatus',
        'validation_error': :'validationError',
        'publication_status': :'publicationStatus',
        'publication_error': :'publicationError'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_registry_id': :'String',
        'source_registry_url': :'String',
        'supported_kubernetes_versions': :'Array<String>',
        'validation_status': :'String',
        'validation_error': :'String',
        'publication_status': :'String',
        'publication_error': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source_registry_id The value to assign to the {#source_registry_id} property
    # @option attributes [String] :source_registry_url The value to assign to the {#source_registry_url} property
    # @option attributes [Array<String>] :supported_kubernetes_versions The value to assign to the {#supported_kubernetes_versions} property
    # @option attributes [String] :validation_status The value to assign to the {#validation_status} property
    # @option attributes [String] :validation_error The value to assign to the {#validation_error} property
    # @option attributes [String] :publication_status The value to assign to the {#publication_status} property
    # @option attributes [String] :publication_error The value to assign to the {#publication_error} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source_registry_id = attributes[:'sourceRegistryId'] if attributes[:'sourceRegistryId']

      raise 'You cannot provide both :sourceRegistryId and :source_registry_id' if attributes.key?(:'sourceRegistryId') && attributes.key?(:'source_registry_id')

      self.source_registry_id = attributes[:'source_registry_id'] if attributes[:'source_registry_id']

      self.source_registry_url = attributes[:'sourceRegistryUrl'] if attributes[:'sourceRegistryUrl']

      raise 'You cannot provide both :sourceRegistryUrl and :source_registry_url' if attributes.key?(:'sourceRegistryUrl') && attributes.key?(:'source_registry_url')

      self.source_registry_url = attributes[:'source_registry_url'] if attributes[:'source_registry_url']

      self.supported_kubernetes_versions = attributes[:'supportedKubernetesVersions'] if attributes[:'supportedKubernetesVersions']

      raise 'You cannot provide both :supportedKubernetesVersions and :supported_kubernetes_versions' if attributes.key?(:'supportedKubernetesVersions') && attributes.key?(:'supported_kubernetes_versions')

      self.supported_kubernetes_versions = attributes[:'supported_kubernetes_versions'] if attributes[:'supported_kubernetes_versions']

      self.validation_status = attributes[:'validationStatus'] if attributes[:'validationStatus']

      raise 'You cannot provide both :validationStatus and :validation_status' if attributes.key?(:'validationStatus') && attributes.key?(:'validation_status')

      self.validation_status = attributes[:'validation_status'] if attributes[:'validation_status']

      self.validation_error = attributes[:'validationError'] if attributes[:'validationError']

      raise 'You cannot provide both :validationError and :validation_error' if attributes.key?(:'validationError') && attributes.key?(:'validation_error')

      self.validation_error = attributes[:'validation_error'] if attributes[:'validation_error']

      self.publication_status = attributes[:'publicationStatus'] if attributes[:'publicationStatus']

      raise 'You cannot provide both :publicationStatus and :publication_status' if attributes.key?(:'publicationStatus') && attributes.key?(:'publication_status')

      self.publication_status = attributes[:'publication_status'] if attributes[:'publication_status']

      self.publication_error = attributes[:'publicationError'] if attributes[:'publicationError']

      raise 'You cannot provide both :publicationError and :publication_error' if attributes.key?(:'publicationError') && attributes.key?(:'publication_error')

      self.publication_error = attributes[:'publication_error'] if attributes[:'publication_error']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] validation_status Object to be assigned
    def validation_status=(validation_status)
      # rubocop:disable Style/ConditionalAssignment
      if validation_status && !VALIDATION_STATUS_ENUM.include?(validation_status)
        OCI.logger.debug("Unknown value for 'validation_status' [" + validation_status + "]. Mapping to 'VALIDATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @validation_status = VALIDATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @validation_status = validation_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] publication_status Object to be assigned
    def publication_status=(publication_status)
      # rubocop:disable Style/ConditionalAssignment
      if publication_status && !PUBLICATION_STATUS_ENUM.include?(publication_status)
        OCI.logger.debug("Unknown value for 'publication_status' [" + publication_status + "]. Mapping to 'PUBLICATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @publication_status = PUBLICATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @publication_status = publication_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_registry_id == other.source_registry_id &&
        source_registry_url == other.source_registry_url &&
        supported_kubernetes_versions == other.supported_kubernetes_versions &&
        validation_status == other.validation_status &&
        validation_error == other.validation_error &&
        publication_status == other.publication_status &&
        publication_error == other.publication_error
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
      [source_registry_id, source_registry_url, supported_kubernetes_versions, validation_status, validation_error, publication_status, publication_error].hash
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
