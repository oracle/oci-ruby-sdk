# Copyright (c) 2016, 2023, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20210201
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A configuration item, which has a number of mutually exclusive properties that can be used to set specific
  # portions of the configuration.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class ApmConfig::Models::Config
    CONFIG_TYPE_ENUM = [
      CONFIG_TYPE_SPAN_FILTER = 'SPAN_FILTER'.freeze,
      CONFIG_TYPE_METRIC_GROUP = 'METRIC_GROUP'.freeze,
      CONFIG_TYPE_APDEX = 'APDEX'.freeze,
      CONFIG_TYPE_OPTIONS = 'OPTIONS'.freeze,
      CONFIG_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the configuration item. An OCID is generated
    # when the item is created.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The type of configuration item.
    # @return [String]
    attr_reader :config_type

    # The time the resource was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format.
    # Example: `2020-02-12T22:47:12.613Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the resource was updated, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format.
    # Example: `2020-02-13T22:47:12.613Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a user.
    #
    # @return [String]
    attr_accessor :created_by

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a user.
    #
    # @return [String]
    attr_accessor :updated_by

    # For optimistic concurrency control. See `if-match`.
    #
    # @return [String]
    attr_accessor :etag

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'config_type': :'configType',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'created_by': :'createdBy',
        'updated_by': :'updatedBy',
        'etag': :'etag',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'config_type': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'created_by': :'String',
        'updated_by': :'String',
        'etag': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'configType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::ApmConfig::Models::Options' if type == 'OPTIONS'
      return 'OCI::ApmConfig::Models::MetricGroup' if type == 'METRIC_GROUP'
      return 'OCI::ApmConfig::Models::ApdexRules' if type == 'APDEX'
      return 'OCI::ApmConfig::Models::SpanFilter' if type == 'SPAN_FILTER'

      # TODO: Log a warning when the subtype is not found.
      'OCI::ApmConfig::Models::Config'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :config_type The value to assign to the {#config_type} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [String] :updated_by The value to assign to the {#updated_by} property
    # @option attributes [String] :etag The value to assign to the {#etag} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.config_type = attributes[:'configType'] if attributes[:'configType']

      raise 'You cannot provide both :configType and :config_type' if attributes.key?(:'configType') && attributes.key?(:'config_type')

      self.config_type = attributes[:'config_type'] if attributes[:'config_type']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.updated_by = attributes[:'updatedBy'] if attributes[:'updatedBy']

      raise 'You cannot provide both :updatedBy and :updated_by' if attributes.key?(:'updatedBy') && attributes.key?(:'updated_by')

      self.updated_by = attributes[:'updated_by'] if attributes[:'updated_by']

      self.etag = attributes[:'etag'] if attributes[:'etag']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] config_type Object to be assigned
    def config_type=(config_type)
      # rubocop:disable Style/ConditionalAssignment
      if config_type && !CONFIG_TYPE_ENUM.include?(config_type)
        OCI.logger.debug("Unknown value for 'config_type' [" + config_type + "]. Mapping to 'CONFIG_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @config_type = CONFIG_TYPE_UNKNOWN_ENUM_VALUE
      else
        @config_type = config_type
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
        config_type == other.config_type &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        created_by == other.created_by &&
        updated_by == other.updated_by &&
        etag == other.etag &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, config_type, time_created, time_updated, created_by, updated_by, etag, freeform_tags, defined_tags].hash
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
