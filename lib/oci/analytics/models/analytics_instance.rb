# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Analytics Instance metadata.
  #
  class Analytics::Models::AnalyticsInstance
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    FEATURE_SET_ENUM = [
      FEATURE_SET_SELF_SERVICE_ANALYTICS = 'SELF_SERVICE_ANALYTICS'.freeze,
      FEATURE_SET_ENTERPRISE_ANALYTICS = 'ENTERPRISE_ANALYTICS'.freeze,
      FEATURE_SET_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_TYPE_ENUM = [
      LICENSE_TYPE_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_TYPE_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The resource OCID.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the Analytics instance. This name must be unique in the tenancy and cannot be changed.
    #
    # @return [String]
    attr_accessor :name

    # Optional description.
    #
    # @return [String]
    attr_accessor :description

    # **[Required]** The OCID of the compartment.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The current state of an instance.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** Analytics feature set.
    #
    # @return [String]
    attr_reader :feature_set

    # This attribute is required.
    # @return [OCI::Analytics::Models::Capacity]
    attr_accessor :capacity

    # The license used for the service.
    #
    # @return [String]
    attr_reader :license_type

    # Email address receiving notifications.
    #
    # @return [String]
    attr_accessor :email_notification

    # URL of the Analytics service.
    #
    # @return [String]
    attr_accessor :service_url

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** The date and time the instance was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the instance was last updated (in the format defined by RFC3339).
    # This timestamp represents updates made through this API. External events do not
    # influence it.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'feature_set': :'featureSet',
        'capacity': :'capacity',
        'license_type': :'licenseType',
        'email_notification': :'emailNotification',
        'service_url': :'serviceUrl',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
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
        'name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'feature_set': :'String',
        'capacity': :'OCI::Analytics::Models::Capacity',
        'license_type': :'String',
        'email_notification': :'String',
        'service_url': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
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
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :feature_set The value to assign to the {#feature_set} property
    # @option attributes [OCI::Analytics::Models::Capacity] :capacity The value to assign to the {#capacity} property
    # @option attributes [String] :license_type The value to assign to the {#license_type} property
    # @option attributes [String] :email_notification The value to assign to the {#email_notification} property
    # @option attributes [String] :service_url The value to assign to the {#service_url} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.feature_set = attributes[:'featureSet'] if attributes[:'featureSet']

      raise 'You cannot provide both :featureSet and :feature_set' if attributes.key?(:'featureSet') && attributes.key?(:'feature_set')

      self.feature_set = attributes[:'feature_set'] if attributes[:'feature_set']

      self.capacity = attributes[:'capacity'] if attributes[:'capacity']

      self.license_type = attributes[:'licenseType'] if attributes[:'licenseType']

      raise 'You cannot provide both :licenseType and :license_type' if attributes.key?(:'licenseType') && attributes.key?(:'license_type')

      self.license_type = attributes[:'license_type'] if attributes[:'license_type']

      self.email_notification = attributes[:'emailNotification'] if attributes[:'emailNotification']

      raise 'You cannot provide both :emailNotification and :email_notification' if attributes.key?(:'emailNotification') && attributes.key?(:'email_notification')

      self.email_notification = attributes[:'email_notification'] if attributes[:'email_notification']

      self.service_url = attributes[:'serviceUrl'] if attributes[:'serviceUrl']

      raise 'You cannot provide both :serviceUrl and :service_url' if attributes.key?(:'serviceUrl') && attributes.key?(:'service_url')

      self.service_url = attributes[:'service_url'] if attributes[:'service_url']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] feature_set Object to be assigned
    def feature_set=(feature_set)
      # rubocop:disable Style/ConditionalAssignment
      if feature_set && !FEATURE_SET_ENUM.include?(feature_set)
        OCI.logger.debug("Unknown value for 'feature_set' [" + feature_set + "]. Mapping to 'FEATURE_SET_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @feature_set = FEATURE_SET_UNKNOWN_ENUM_VALUE
      else
        @feature_set = feature_set
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_type Object to be assigned
    def license_type=(license_type)
      # rubocop:disable Style/ConditionalAssignment
      if license_type && !LICENSE_TYPE_ENUM.include?(license_type)
        OCI.logger.debug("Unknown value for 'license_type' [" + license_type + "]. Mapping to 'LICENSE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_type = LICENSE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @license_type = license_type
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
        name == other.name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        feature_set == other.feature_set &&
        capacity == other.capacity &&
        license_type == other.license_type &&
        email_notification == other.email_notification &&
        service_url == other.service_url &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
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
      [id, name, description, compartment_id, lifecycle_state, feature_set, capacity, license_type, email_notification, service_url, defined_tags, freeform_tags, time_created, time_updated].hash
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
