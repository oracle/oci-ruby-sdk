# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The body for defining an attachment between a steering policy and a domain.
  #
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Dns::Models::CreateSteeringPolicyAttachmentDetails
    # **[Required]** The OCID of the attached steering policy.
    # @return [String]
    attr_accessor :steering_policy_id

    # **[Required]** The OCID of the attached zone.
    # @return [String]
    attr_accessor :zone_id

    # **[Required]** The attached domain within the attached zone.
    # @return [String]
    attr_accessor :domain_name

    # A user-friendly name for the steering policy attachment.
    # Does not have to be unique and can be changed.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'steering_policy_id': :'steeringPolicyId',
        'zone_id': :'zoneId',
        'domain_name': :'domainName',
        'display_name': :'displayName'
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
        'display_name': :'String'
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
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        steering_policy_id == other.steering_policy_id &&
        zone_id == other.zone_id &&
        domain_name == other.domain_name &&
        display_name == other.display_name
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
      [steering_policy_id, zone_id, domain_name, display_name].hash
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
