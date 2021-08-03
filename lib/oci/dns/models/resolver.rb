# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An OCI DNS resolver. If the resolver has an attached VCN, the VCN will attempt to answer queries based on the
  # attached views in priority order. If the query does not match any of the attached views, the query will be
  # evaluated against the default view. If the default view does not match, the rules will be evaluated in
  # priority order. If no rules match the query, answers come from Internet DNS. A resolver may have a maximum of 10
  # resolver endpoints.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Dns::Models::Resolver
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the owning compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the attached VCN.
    #
    # @return [String]
    attr_accessor :attached_vcn_id

    # **[Required]** The display name of the resolver.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    #
    # **Example:** `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    #
    # **Example:** `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** The OCID of the resolver.
    # @return [String]
    attr_accessor :id

    # **[Required]** The date and time the resource was created in \"YYYY-MM-ddThh:mm:ssZ\" format
    # with a Z offset, as defined by RFC 3339.
    #
    # **Example:** `2016-07-22T17:23:59:60Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the resource was last updated in \"YYYY-MM-ddThh:mm:ssZ\"
    # format with a Z offset, as defined by RFC 3339.
    #
    # **Example:** `2016-07-22T17:23:59:60Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the resource.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The canonical absolute URL of the resource.
    # @return [String]
    attr_accessor :_self

    # The OCID of the default view.
    #
    # @return [String]
    attr_accessor :default_view_id

    # **[Required]** A Boolean flag indicating whether or not parts of the resource are unable to be explicitly managed.
    #
    # @return [BOOLEAN]
    attr_accessor :is_protected

    # **[Required]** Read-only array of endpoints for the resolver.
    #
    # @return [Array<OCI::Dns::Models::ResolverEndpointSummary>]
    attr_accessor :endpoints

    # **[Required]** The attached views. Views are evaluated in order.
    # @return [Array<OCI::Dns::Models::AttachedView>]
    attr_accessor :attached_views

    # Rules for the resolver. Rules are evaluated in order.
    #
    # @return [Array<OCI::Dns::Models::ResolverRule>]
    attr_accessor :rules

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'attached_vcn_id': :'attachedVcnId',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'id': :'id',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        '_self': :'self',
        'default_view_id': :'defaultViewId',
        'is_protected': :'isProtected',
        'endpoints': :'endpoints',
        'attached_views': :'attachedViews',
        'rules': :'rules'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'attached_vcn_id': :'String',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        '_self': :'String',
        'default_view_id': :'String',
        'is_protected': :'BOOLEAN',
        'endpoints': :'Array<OCI::Dns::Models::ResolverEndpointSummary>',
        'attached_views': :'Array<OCI::Dns::Models::AttachedView>',
        'rules': :'Array<OCI::Dns::Models::ResolverRule>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :attached_vcn_id The value to assign to the {#attached_vcn_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :_self The value to assign to the {#_self} property
    # @option attributes [String] :default_view_id The value to assign to the {#default_view_id} property
    # @option attributes [BOOLEAN] :is_protected The value to assign to the {#is_protected} property
    # @option attributes [Array<OCI::Dns::Models::ResolverEndpointSummary>] :endpoints The value to assign to the {#endpoints} property
    # @option attributes [Array<OCI::Dns::Models::AttachedView>] :attached_views The value to assign to the {#attached_views} property
    # @option attributes [Array<OCI::Dns::Models::ResolverRule>] :rules The value to assign to the {#rules} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.attached_vcn_id = attributes[:'attachedVcnId'] if attributes[:'attachedVcnId']

      raise 'You cannot provide both :attachedVcnId and :attached_vcn_id' if attributes.key?(:'attachedVcnId') && attributes.key?(:'attached_vcn_id')

      self.attached_vcn_id = attributes[:'attached_vcn_id'] if attributes[:'attached_vcn_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.id = attributes[:'id'] if attributes[:'id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self._self = attributes[:'self'] if attributes[:'self']

      raise 'You cannot provide both :self and :_self' if attributes.key?(:'self') && attributes.key?(:'_self')

      self._self = attributes[:'_self'] if attributes[:'_self']

      self.default_view_id = attributes[:'defaultViewId'] if attributes[:'defaultViewId']

      raise 'You cannot provide both :defaultViewId and :default_view_id' if attributes.key?(:'defaultViewId') && attributes.key?(:'default_view_id')

      self.default_view_id = attributes[:'default_view_id'] if attributes[:'default_view_id']

      self.is_protected = attributes[:'isProtected'] unless attributes[:'isProtected'].nil?

      raise 'You cannot provide both :isProtected and :is_protected' if attributes.key?(:'isProtected') && attributes.key?(:'is_protected')

      self.is_protected = attributes[:'is_protected'] unless attributes[:'is_protected'].nil?

      self.endpoints = attributes[:'endpoints'] if attributes[:'endpoints']

      self.attached_views = attributes[:'attachedViews'] if attributes[:'attachedViews']

      raise 'You cannot provide both :attachedViews and :attached_views' if attributes.key?(:'attachedViews') && attributes.key?(:'attached_views')

      self.attached_views = attributes[:'attached_views'] if attributes[:'attached_views']

      self.rules = attributes[:'rules'] if attributes[:'rules']
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
        compartment_id == other.compartment_id &&
        attached_vcn_id == other.attached_vcn_id &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        id == other.id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        _self == other._self &&
        default_view_id == other.default_view_id &&
        is_protected == other.is_protected &&
        endpoints == other.endpoints &&
        attached_views == other.attached_views &&
        rules == other.rules
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
      [compartment_id, attached_vcn_id, display_name, freeform_tags, defined_tags, id, time_created, time_updated, lifecycle_state, _self, default_view_id, is_protected, endpoints, attached_views, rules].hash
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
