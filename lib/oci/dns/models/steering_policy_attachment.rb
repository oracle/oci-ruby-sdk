# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An attachment between a steering policy and a domain. An attachment constructs
  # DNS responses using its steering policy instead of the records at its defined domain.
  # Only records of the policy's covered rtype are blocked at the domain.
  # A domain can have a maximum of one attachment covering any given rtype.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Dns::Models::SteeringPolicyAttachment
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the attached steering policy.
    # @return [String]
    attr_accessor :steering_policy_id

    # The OCID of the attached zone.
    # @return [String]
    attr_accessor :zone_id

    # The attached domain within the attached zone.
    # @return [String]
    attr_accessor :domain_name

    # A user-friendly name for the steering policy attachment.
    # Does not have to be unique and can be changed.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # The record types covered by the attachment at the domain. The set of record types is
    # determined by aggregating the record types from the answers defined in the steering
    # policy.
    #
    # @return [Array<String>]
    attr_accessor :rtypes

    # The OCID of the compartment containing the steering policy attachment.
    # @return [String]
    attr_accessor :compartment_id

    # The canonical absolute URL of the resource.
    # @return [String]
    attr_accessor :_self

    # The OCID of the resource.
    # @return [String]
    attr_accessor :id

    # The date and time the resource was created, expressed in RFC 3339 timestamp format.
    #
    # **Example:** `2016-07-22T17:23:59:60Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The current state of the resource.
    # @return [String]
    attr_reader :lifecycle_state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'steering_policy_id': :'steeringPolicyId',
        'zone_id': :'zoneId',
        'domain_name': :'domainName',
        'display_name': :'displayName',
        'rtypes': :'rtypes',
        'compartment_id': :'compartmentId',
        '_self': :'self',
        'id': :'id',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'steering_policy_id': :'String',
        'zone_id': :'String',
        'domain_name': :'String',
        'display_name': :'String',
        'rtypes': :'Array<String>',
        'compartment_id': :'String',
        '_self': :'String',
        'id': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :steering_policy_id The value to assign to the {#steering_policy_id} property
    # @option attributes [String] :zone_id The value to assign to the {#zone_id} property
    # @option attributes [String] :domain_name The value to assign to the {#domain_name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Array<String>] :rtypes The value to assign to the {#rtypes} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :_self The value to assign to the {#_self} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.steering_policy_id = attributes[:'steeringPolicyId'] if attributes[:'steeringPolicyId']

      raise 'You cannot provide both :steeringPolicyId and :steering_policy_id' if attributes.key?(:'steeringPolicyId') && attributes.key?(:'steering_policy_id')

      self.steering_policy_id = attributes[:'steering_policy_id'] if attributes[:'steering_policy_id']

      self.zone_id = attributes[:'zoneId'] if attributes[:'zoneId']

      raise 'You cannot provide both :zoneId and :zone_id' if attributes.key?(:'zoneId') && attributes.key?(:'zone_id')

      self.zone_id = attributes[:'zone_id'] if attributes[:'zone_id']

      self.domain_name = attributes[:'domainName'] if attributes[:'domainName']

      raise 'You cannot provide both :domainName and :domain_name' if attributes.key?(:'domainName') && attributes.key?(:'domain_name')

      self.domain_name = attributes[:'domain_name'] if attributes[:'domain_name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.rtypes = attributes[:'rtypes'] if attributes[:'rtypes']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self._self = attributes[:'self'] if attributes[:'self']

      raise 'You cannot provide both :self and :_self' if attributes.key?(:'self') && attributes.key?(:'_self')

      self._self = attributes[:'_self'] if attributes[:'_self']

      self.id = attributes[:'id'] if attributes[:'id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']
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
        steering_policy_id == other.steering_policy_id &&
        zone_id == other.zone_id &&
        domain_name == other.domain_name &&
        display_name == other.display_name &&
        rtypes == other.rtypes &&
        compartment_id == other.compartment_id &&
        _self == other._self &&
        id == other.id &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state
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
      [steering_policy_id, zone_id, domain_name, display_name, rtypes, compartment_id, _self, id, time_created, lifecycle_state].hash
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
