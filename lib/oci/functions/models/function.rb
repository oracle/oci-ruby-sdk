# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A function resource defines the code (Docker image) and configuration for a specific function. Functions are defined in applications. Avoid entering confidential information.
  #
  class Functions::Models::Function
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the function.
    #
    # @return [String]
    attr_accessor :id

    # The display name of the function. The display name is unique within the application containing the function.
    #
    # @return [String]
    attr_accessor :display_name

    # The current state of the function.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # The OCID of the application the function belongs to.
    # @return [String]
    attr_accessor :application_id

    # The OCID of the compartment that contains the function.
    #
    # @return [String]
    attr_accessor :compartment_id

    # The qualified name of the Docker image to use in the function, including the image tag.
    # The image should be in the OCI Registry that is in the same region as the function itself.
    # Example: `phx.ocir.io/ten/functions/function:0.0.1`
    #
    # @return [String]
    attr_accessor :image

    # The image digest for the version of the image that will be pulled when invoking this function.
    # If no value is specified, the digest currently associated with the image in the OCI Registry will be used.
    # Example: `sha256:ca0eeb6fb05351dfc8759c20733c91def84cb8007aa89a5bf606bc8b315b9fc7`
    #
    # @return [String]
    attr_accessor :image_digest

    # Maximum usable memory for the function (MiB).
    # @return [Integer]
    attr_accessor :memory_in_m_bs

    # Function configuration. Overrides application configuration.
    # Keys must be ASCII strings consisting solely of letters, digits, and the '_' (underscore) character, and must not begin with a digit. Values should be limited to printable unicode characters.
    #
    # Example: `{\"MY_FUNCTION_CONFIG\": \"ConfVal\"}`
    #
    # The maximum size for all configuration keys and values is limited to 4KB. This is measured as the sum of octets necessary to represent each key and value in UTF-8.
    #
    # @return [Hash<String, String>]
    attr_accessor :config

    # Timeout for executions of the function. Value in seconds.
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The base https invoke URL to set on a client in order to invoke a function. This URL will never change over the lifetime of the function and can be cached.
    #
    # @return [String]
    attr_accessor :invoke_endpoint

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The time the function was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format.
    #
    # Example: `2018-09-12T22:47:12.613Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the function was updated, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format.
    #
    # Example: `2018-09-12T22:47:12.613Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'lifecycle_state': :'lifecycleState',
        'application_id': :'applicationId',
        'compartment_id': :'compartmentId',
        'image': :'image',
        'image_digest': :'imageDigest',
        'memory_in_m_bs': :'memoryInMBs',
        'config': :'config',
        'timeout_in_seconds': :'timeoutInSeconds',
        'freeform_tags': :'freeformTags',
        'invoke_endpoint': :'invokeEndpoint',
        'defined_tags': :'definedTags',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'lifecycle_state': :'String',
        'application_id': :'String',
        'compartment_id': :'String',
        'image': :'String',
        'image_digest': :'String',
        'memory_in_m_bs': :'Integer',
        'config': :'Hash<String, String>',
        'timeout_in_seconds': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'invoke_endpoint': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :application_id The value to assign to the {#application_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :image The value to assign to the {#image} property
    # @option attributes [String] :image_digest The value to assign to the {#image_digest} property
    # @option attributes [Integer] :memory_in_m_bs The value to assign to the {#memory_in_m_bs} property
    # @option attributes [Hash<String, String>] :config The value to assign to the {#config} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :invoke_endpoint The value to assign to the {#invoke_endpoint} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.application_id = attributes[:'applicationId'] if attributes[:'applicationId']

      raise 'You cannot provide both :applicationId and :application_id' if attributes.key?(:'applicationId') && attributes.key?(:'application_id')

      self.application_id = attributes[:'application_id'] if attributes[:'application_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.image = attributes[:'image'] if attributes[:'image']

      self.image_digest = attributes[:'imageDigest'] if attributes[:'imageDigest']

      raise 'You cannot provide both :imageDigest and :image_digest' if attributes.key?(:'imageDigest') && attributes.key?(:'image_digest')

      self.image_digest = attributes[:'image_digest'] if attributes[:'image_digest']

      self.memory_in_m_bs = attributes[:'memoryInMBs'] if attributes[:'memoryInMBs']

      raise 'You cannot provide both :memoryInMBs and :memory_in_m_bs' if attributes.key?(:'memoryInMBs') && attributes.key?(:'memory_in_m_bs')

      self.memory_in_m_bs = attributes[:'memory_in_m_bs'] if attributes[:'memory_in_m_bs']

      self.config = attributes[:'config'] if attributes[:'config']

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']
      self.timeout_in_seconds = 30 if timeout_in_seconds.nil? && !attributes.key?(:'timeoutInSeconds') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']
      self.timeout_in_seconds = 30 if timeout_in_seconds.nil? && !attributes.key?(:'timeoutInSeconds') && !attributes.key?(:'timeout_in_seconds') # rubocop:disable Style/StringLiterals

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.invoke_endpoint = attributes[:'invokeEndpoint'] if attributes[:'invokeEndpoint']

      raise 'You cannot provide both :invokeEndpoint and :invoke_endpoint' if attributes.key?(:'invokeEndpoint') && attributes.key?(:'invoke_endpoint')

      self.invoke_endpoint = attributes[:'invoke_endpoint'] if attributes[:'invoke_endpoint']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
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
        display_name == other.display_name &&
        lifecycle_state == other.lifecycle_state &&
        application_id == other.application_id &&
        compartment_id == other.compartment_id &&
        image == other.image &&
        image_digest == other.image_digest &&
        memory_in_m_bs == other.memory_in_m_bs &&
        config == other.config &&
        timeout_in_seconds == other.timeout_in_seconds &&
        freeform_tags == other.freeform_tags &&
        invoke_endpoint == other.invoke_endpoint &&
        defined_tags == other.defined_tags &&
        time_created == other.time_created &&
        time_updated == other.time_updated
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
      [id, display_name, lifecycle_state, application_id, compartment_id, image, image_digest, memory_in_m_bs, config, timeout_in_seconds, freeform_tags, invoke_endpoint, defined_tags, time_created, time_updated].hash
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
