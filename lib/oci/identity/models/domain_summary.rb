# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # (For tenancies that support identity domains) As the name suggests, a `DomainSummary` object contains information about a `Domain`.
  #
  class Identity::Models::DomainSummary
    TYPE_ENUM = [
      TYPE_DEFAULT = 'DEFAULT'.freeze,
      TYPE_SECONDARY = 'SECONDARY'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_DETAILS_ENUM = [
      LIFECYCLE_DETAILS_DEACTIVATING = 'DEACTIVATING'.freeze,
      LIFECYCLE_DETAILS_ACTIVATING = 'ACTIVATING'.freeze,
      LIFECYCLE_DETAILS_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the identity domain.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment containing the identity domain.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The mutable display name of the identity domain.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The identity domain description. You can have an empty description.
    # @return [String]
    attr_accessor :description

    # **[Required]** Region-agnostic identity domain URL.
    # @return [String]
    attr_accessor :url

    # **[Required]** Region-specific identity domain URL.
    # @return [String]
    attr_accessor :home_region_url

    # **[Required]** The home region for the identity domain.
    # @return [String]
    attr_accessor :home_region

    # **[Required]** The regions where replicas of the identity domain exist.
    # @return [Array<OCI::Identity::Models::ReplicatedRegionDetails>]
    attr_accessor :replica_regions

    # **[Required]** The type of the identity domain.
    #
    # @return [String]
    attr_reader :type

    # **[Required]** The license type of the identity domain.
    # @return [String]
    attr_accessor :license_type

    # **[Required]** Indicates whether the identity domain is hidden on the sign-in screen or not.
    #
    # @return [BOOLEAN]
    attr_accessor :is_hidden_on_login

    # **[Required]** Date and time the identity domain was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The current state.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Any additional details about the current state of the identity domain.
    #
    # @return [String]
    attr_reader :lifecycle_details

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'url': :'url',
        'home_region_url': :'homeRegionUrl',
        'home_region': :'homeRegion',
        'replica_regions': :'replicaRegions',
        'type': :'type',
        'license_type': :'licenseType',
        'is_hidden_on_login': :'isHiddenOnLogin',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
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
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'url': :'String',
        'home_region_url': :'String',
        'home_region': :'String',
        'replica_regions': :'Array<OCI::Identity::Models::ReplicatedRegionDetails>',
        'type': :'String',
        'license_type': :'String',
        'is_hidden_on_login': :'BOOLEAN',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
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
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :url The value to assign to the {#url} property
    # @option attributes [String] :home_region_url The value to assign to the {#home_region_url} property
    # @option attributes [String] :home_region The value to assign to the {#home_region} property
    # @option attributes [Array<OCI::Identity::Models::ReplicatedRegionDetails>] :replica_regions The value to assign to the {#replica_regions} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :license_type The value to assign to the {#license_type} property
    # @option attributes [BOOLEAN] :is_hidden_on_login The value to assign to the {#is_hidden_on_login} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
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

      self.description = attributes[:'description'] if attributes[:'description']

      self.url = attributes[:'url'] if attributes[:'url']

      self.home_region_url = attributes[:'homeRegionUrl'] if attributes[:'homeRegionUrl']

      raise 'You cannot provide both :homeRegionUrl and :home_region_url' if attributes.key?(:'homeRegionUrl') && attributes.key?(:'home_region_url')

      self.home_region_url = attributes[:'home_region_url'] if attributes[:'home_region_url']

      self.home_region = attributes[:'homeRegion'] if attributes[:'homeRegion']

      raise 'You cannot provide both :homeRegion and :home_region' if attributes.key?(:'homeRegion') && attributes.key?(:'home_region')

      self.home_region = attributes[:'home_region'] if attributes[:'home_region']

      self.replica_regions = attributes[:'replicaRegions'] if attributes[:'replicaRegions']

      raise 'You cannot provide both :replicaRegions and :replica_regions' if attributes.key?(:'replicaRegions') && attributes.key?(:'replica_regions')

      self.replica_regions = attributes[:'replica_regions'] if attributes[:'replica_regions']

      self.type = attributes[:'type'] if attributes[:'type']

      self.license_type = attributes[:'licenseType'] if attributes[:'licenseType']

      raise 'You cannot provide both :licenseType and :license_type' if attributes.key?(:'licenseType') && attributes.key?(:'license_type')

      self.license_type = attributes[:'license_type'] if attributes[:'license_type']

      self.is_hidden_on_login = attributes[:'isHiddenOnLogin'] unless attributes[:'isHiddenOnLogin'].nil?

      raise 'You cannot provide both :isHiddenOnLogin and :is_hidden_on_login' if attributes.key?(:'isHiddenOnLogin') && attributes.key?(:'is_hidden_on_login')

      self.is_hidden_on_login = attributes[:'is_hidden_on_login'] unless attributes[:'is_hidden_on_login'].nil?

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

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
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] lifecycle_details Object to be assigned
    def lifecycle_details=(lifecycle_details)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_details && !LIFECYCLE_DETAILS_ENUM.include?(lifecycle_details)
        OCI.logger.debug("Unknown value for 'lifecycle_details' [" + lifecycle_details + "]. Mapping to 'LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_details = LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_details = lifecycle_details
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
        description == other.description &&
        url == other.url &&
        home_region_url == other.home_region_url &&
        home_region == other.home_region &&
        replica_regions == other.replica_regions &&
        type == other.type &&
        license_type == other.license_type &&
        is_hidden_on_login == other.is_hidden_on_login &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
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
      [id, compartment_id, display_name, description, url, home_region_url, home_region, replica_regions, type, license_type, is_hidden_on_login, time_created, lifecycle_state, lifecycle_details, freeform_tags, defined_tags].hash
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
