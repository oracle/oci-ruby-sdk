# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # The body for defining a new steering policy.
  #
  # *Warning:* Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Dns::Models::CreateSteeringPolicyDetails # rubocop:disable Metrics/LineLength
    TEMPLATE_ENUM = [
      TEMPLATE_FAILOVER = 'FAILOVER'.freeze,
      TEMPLATE_LOAD_BALANCE = 'LOAD_BALANCE'.freeze,
      TEMPLATE_ROUTE_BY_GEO = 'ROUTE_BY_GEO'.freeze,
      TEMPLATE_ROUTE_BY_ASN = 'ROUTE_BY_ASN'.freeze,
      TEMPLATE_ROUTE_BY_IP = 'ROUTE_BY_IP'.freeze,
      TEMPLATE_CUSTOM = 'CUSTOM'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment containing the steering policy.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A user-friendly name for the steering policy.
    # Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # The Time To Live for responses from the steering policy, in seconds.
    # If not specified during creation, a value of 30 seconds will be used.
    #
    # @return [Integer]
    attr_accessor :ttl

    # The OCID of the health check monitor providing health data about the answers of the
    # steering policy.
    # A steering policy answer with `rdata` matching a monitored endpoint will use the health
    # data of that endpoint.
    # A steering policy answer with `rdata` not matching any monitored endpoint will be assumed
    # healthy.
    #
    # @return [String]
    attr_accessor :health_check_monitor_id

    # **[Required]** The common pattern (or lack thereof) to which the steering policy adheres. This
    # value restricts the possible configurations of rules, but thereby supports
    # specifically tailored interfaces. Values other than \"CUSTOM\" require the rules to
    # begin with an unconditional FILTER that keeps answers contingent upon
    # `answer.isDisabled != true`, followed
    # _if and only if the policy references a health check monitor_ by an unconditional
    # HEALTH rule, and require the last rule to be an unconditional LIMIT.
    # What must precede the LIMIT rule is determined by the template value:
    # - FAILOVER requires exactly an unconditional PRIORITY rule that ranks answers by pool.
    #   Each answer pool must have a unique priority value assigned to it. Answer data must
    #   be defined in the `defaultAnswerData` property for the rule and the `cases` property
    #   must not be defined.
    # - LOAD_BALANCE requires exactly an unconditional WEIGHTED rule that shuffles answers
    #   by name. Answer data must be defined in the `defaultAnswerData` property for the
    #   rule and the `cases` property must not be defined.
    # - ROUTE_BY_GEO requires exactly one PRIORITY rule that ranks answers by pool using the
    #   geographical location of the client as a condition. Within that rule you may only
    #   use `query.client.geoKey` in the `caseCondition` expressions for defining the cases.
    #   For each case in the PRIORITY rule each answer pool must have a unique priority
    #   value assigned to it. Answer data can only be defined within cases and
    #   `defaultAnswerData` cannot be used in the PRIORITY rule.
    # - ROUTE_BY_ASN requires exactly one PRIORITY rule that ranks answers by pool using the
    #   ASN of the client as a condition. Within that rule you may only use
    #   `query.client.asn` in the `caseCondition` expressions for defining the cases.
    #   For each case in the PRIORITY rule each answer pool must have a unique priority
    #   value assigned to it. Answer data can only be defined within cases and
    #   `defaultAnswerData` cannot be used in the PRIORITY rule.
    # - ROUTE_BY_IP requires exactly one PRIORITY rule that ranks answers by pool using the
    #   IP subnet of the client as a condition. Within that rule you may only use
    #   `query.client.address` in the `caseCondition` expressions for defining the cases.
    #   For each case in the PRIORITY rule each answer pool must have a unique priority
    #   value assigned to it. Answer data can only be defined within cases and
    #   `defaultAnswerData` cannot be used in the PRIORITY rule.
    # - CUSTOM allows an arbitrary configuration of rules.
    #
    # For an existing steering policy, the template value may be changed to any of the
    # supported options but the resulting policy must conform to the requirements for the
    # new template type or else a Bad Request error will be returned.
    #
    # @return [String]
    attr_reader :template

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # For more information, see [Resource Tags](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The set of all answers that can potentially issue from the steering policy.
    #
    # @return [Array<OCI::Dns::Models::SteeringPolicyAnswer>]
    attr_accessor :answers

    # The pipeline of rules that will be processed in sequence to reduce the pool of answers
    # to a response for any given request.
    #
    # The first rule receives a shuffled list of all answers, and every other rule receives
    # the list of answers emitted by the one preceding it. The last rule populates the
    # response.
    #
    # @return [Array<OCI::Dns::Models::SteeringPolicyRule>]
    attr_accessor :rules

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'ttl': :'ttl',
        'health_check_monitor_id': :'healthCheckMonitorId',
        'template': :'template',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'answers': :'answers',
        'rules': :'rules'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'ttl': :'Integer',
        'health_check_monitor_id': :'String',
        'template': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'answers': :'Array<OCI::Dns::Models::SteeringPolicyAnswer>',
        'rules': :'Array<OCI::Dns::Models::SteeringPolicyRule>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :ttl The value to assign to the {#ttl} property
    # @option attributes [String] :health_check_monitor_id The value to assign to the {#health_check_monitor_id} property
    # @option attributes [String] :template The value to assign to the {#template} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Array<OCI::Dns::Models::SteeringPolicyAnswer>] :answers The value to assign to the {#answers} property
    # @option attributes [Array<OCI::Dns::Models::SteeringPolicyRule>] :rules The value to assign to the {#rules} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.ttl = attributes[:'ttl'] if attributes[:'ttl']
      self.ttl = 30 if ttl.nil? && !attributes.key?(:'ttl') # rubocop:disable Style/StringLiterals

      self.health_check_monitor_id = attributes[:'healthCheckMonitorId'] if attributes[:'healthCheckMonitorId']

      raise 'You cannot provide both :healthCheckMonitorId and :health_check_monitor_id' if attributes.key?(:'healthCheckMonitorId') && attributes.key?(:'health_check_monitor_id')

      self.health_check_monitor_id = attributes[:'health_check_monitor_id'] if attributes[:'health_check_monitor_id']

      self.template = attributes[:'template'] if attributes[:'template']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.answers = attributes[:'answers'] if attributes[:'answers']

      self.rules = attributes[:'rules'] if attributes[:'rules']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] template Object to be assigned
    def template=(template)
      # rubocop: disable Metrics/LineLength
      raise "Invalid value for 'template': this must be one of the values in TEMPLATE_ENUM." if template && !TEMPLATE_ENUM.include?(template)

      # rubocop: enable Metrics/LineLength
      @template = template
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        ttl == other.ttl &&
        health_check_monitor_id == other.health_check_monitor_id &&
        template == other.template &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        answers == other.answers &&
        rules == other.rules
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [compartment_id, display_name, ttl, health_check_monitor_id, template, freeform_tags, defined_tags, answers, rules].hash
    end
    # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Layout/EmptyLines

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
# rubocop:enable Lint/UnneededCopDisableDirective
