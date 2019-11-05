# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The payload of the event. Information within `data` comes from the resource emitting the event.
  #
  # Example:
  #
  #   -----
  #     {
  #       \"eventGroupingId\": null,
  #       \"eventName\": \"GetInstance\",
  #       \"compartmentId\": \"ocid1.tenancy.oc1..<unique_ID>\",
  #       \"compartmentName\": \"compartmentA\",
  #       \"resourceName\": \"my_instance\",
  #       \"resourceId\": \"ocid1.instance.oc1.phx.<unique_ID>\",
  #       \"availabilityDomain\": \"<availability_domain>\",
  #       \"freeformTags\": null,
  #       \"definedTags\": null,
  #       \"identity\": {
  #         \"principalName\": \"ExampleName\",
  #         \"principalId\": \"ocid1.user.oc1..<unique_ID>\",
  #         \"authType\": \"natv\",
  #         \"callerName\": null,
  #         \"callerId\": null,
  #         \"tenantId\": \"ocid1.tenancy.oc1..<unique_ID>\",
  #         \"ipAddress\": \"172.24.80.88\",
  #         \"credentials\": null,
  #         \"userAgent\": \"Jersey/2.23 (HttpUrlConnection 1.8.0_212)\",
  #         \"consoleSessionId\": null
  #       },
  #       \"request\": {
  #         \"id\": \"<unique_ID>\",
  #         \"path\": \"/20160918/instances/ocid1.instance.oc1.phx.<unique_ID>\",
  #         \"action\": \"GET\",
  #         \"parameters\": {},
  #         \"headers\": {
  #           \"opc-principal\": [
  #             \"{\\\"tenantId\\\":\\\"ocid1.tenancy.oc1..<unique_ID>\\\",\\\"subjectId\\\":\\\"ocid1.user.oc1..<unique_ID>\\\",\\\"claims\\\":[{\\\"key\\\":\\\"pstype\\\",\\\"value\\\":\\\"natv\\\",\\\"issuer\\\":\\\"authService.oracle.com\\\"},{\\\"key\\\":\\\"h_host\\\",\\\"value\\\":\\\"iaas.r2.oracleiaas.com\\\",\\\"issuer\\\":\\\"h\\\"},{\\\"key\\\":\\\"h_opc-request-id\\\",\\\"value\\\":\\\"<unique_ID>\\\",\\\"issuer\\\":\\\"h\\\"},{\\\"key\\\":\\\"ptype\\\",\\\"value\\\":\\\"user\\\",\\\"issuer\\\":\\\"authService.oracle.com\\\"},{\\\"key\\\":\\\"h_date\\\",\\\"value\\\":\\\"Wed, 18 Sep 2019 00:10:58 UTC\\\",\\\"issuer\\\":\\\"h\\\"},{\\\"key\\\":\\\"h_accept\\\",\\\"value\\\":\\\"application/json\\\",\\\"issuer\\\":\\\"h\\\"},{\\\"key\\\":\\\"authorization\\\",\\\"value\\\":\\\"Signature headers=\\\\\\\"date (request-target) host accept opc-request-id\\\\\\\",keyId=\\\\\\\"ocid1.tenancy.oc1..<unique_ID>/ocid1.user.oc1..<unique_ID>/8c:b4:5f:18:e7:ec:db:08:b8:fa:d2:2a:7d:11:76:ac\\\\\\\",algorithm=\\\\\\\"rsa-pss-sha256\\\\\\\",signature=\\\\\\\"<unique_ID>\\\\\\\",version=\\\\\\\"1\\\\\\\"\\\",\\\"issuer\\\":\\\"h\\\"},{\\\"key\\\":\\\"h_(request-target)\\\",\\\"value\\\":\\\"get /20160918/instances/ocid1.instance.oc1.phx.<unique_ID>\\\",\\\"issuer\\\":\\\"h\\\"}]}\"
  #           ],
  #           \"Accept\": [
  #             \"application/json\"
  #           ],
  #           \"X-Oracle-Auth-Client-CN\": [
  #             \"splat-proxy-se-02302.node.ad2.r2\"
  #           ],
  #           \"X-Forwarded-Host\": [
  #             \"compute-api.svc.ad1.r2\"
  #           ],
  #           \"Connection\": [
  #             \"close\"
  #           ],
  #           \"User-Agent\": [
  #             \"Jersey/2.23 (HttpUrlConnection 1.8.0_212)\"
  #           ],
  #           \"X-Forwarded-For\": [
  #             \"172.24.80.88\"
  #           ],
  #           \"X-Real-IP\": [
  #             \"172.24.80.88\"
  #           ],
  #           \"oci-original-url\": [
  #             \"https://iaas.r2.oracleiaas.com/20160918/instances/ocid1.instance.oc1.phx.<unique_ID>\"
  #           ],
  #           \"opc-request-id\": [
  #             \"<unique_ID>\"
  #           ],
  #           \"Date\": [
  #             \"Wed, 18 Sep 2019 00:10:58 UTC\"
  #           ]
  #         }
  #       },
  #       \"response\": {
  #         \"status\": \"200\",
  #         \"responseTime\": \"2019-09-18T00:10:59.278Z\",
  #         \"headers\": {
  #           \"ETag\": [
  #             \"<unique_ID>\"
  #           ],
  #           \"Connection\": [
  #             \"close\"
  #           ],
  #           \"Content-Length\": [
  #             \"1828\"
  #           ],
  #           \"opc-request-id\": [
  #             \"<unique_ID>\"
  #           ],
  #           \"Date\": [
  #             \"Wed, 18 Sep 2019 00:10:59 GMT\"
  #           ],
  #           \"Content-Type\": [
  #             \"application/json\"
  #           ]
  #         },
  #         \"payload\": {
  #           \"resourceName\": \"my_instance\",
  #           \"id\": \"ocid1.instance.oc1.phx.<unique_ID>\"
  #         },
  #         \"message\": null
  #       },
  #       \"stateChange\": {
  #         \"previous\": null,
  #         \"current\": null
  #       },
  #       \"additionalDetails\": {
  #         \"imageId\": \"ocid1.image.oc1.phx.<unique_ID>\",
  #         \"shape\": \"VM.Standard1.1\",
  #         \"type\": \"CustomerVmi\"
  #       }
  #     }
  #   -----
  #
  class Audit::Models::Data
    # This value links multiple audit events that are part of the same API operation. For example,
    # a long running API operations that emit an event at the start and the end of an operation
    # would use the same value in this field for both events.
    #
    # @return [String]
    attr_accessor :event_grouping_id

    # Name of the API operation that generated this event.
    #
    # Example: `GetInstance`
    #
    # @return [String]
    attr_accessor :event_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment of the resource
    # emitting the event.
    #
    # @return [String]
    attr_accessor :compartment_id

    # The name of the compartment. This value is the friendly name associated with compartmentId.
    # This value can change, but the service logs the value that appeared at the time of the audit
    # event.
    #
    # Example: `CompartmentA`
    #
    # @return [String]
    attr_accessor :compartment_name

    # The name of the resource emitting the event.
    #
    # @return [String]
    attr_accessor :resource_name

    # An [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) or some other ID for the resource
    # emitting the event.
    #
    # @return [String]
    attr_accessor :resource_id

    # The availability domain where the resource resides.
    #
    # @return [String]
    attr_accessor :availability_domain

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name,
    # type, or namespace. Exists for cross-compatibility only. For more information,
    # see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more
    # information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # @return [OCI::Audit::Models::Identity]
    attr_accessor :identity

    # @return [OCI::Audit::Models::Request]
    attr_accessor :request

    # @return [OCI::Audit::Models::Response]
    attr_accessor :response

    # @return [OCI::Audit::Models::StateChange]
    attr_accessor :state_change

    # A container object for attribues unique to the resource emitting the event.
    #
    # Example:
    #
    #   -----
    #     {
    #       \"imageId\": \"ocid1.image.oc1.phx.<unique_ID>\",
    #       \"shape\": \"VM.Standard1.1\",
    #       \"type\": \"CustomerVmi\"
    #     }
    #   -----
    #
    # @return [Hash<String, Object>]
    attr_accessor :additional_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'event_grouping_id': :'eventGroupingId',
        'event_name': :'eventName',
        'compartment_id': :'compartmentId',
        'compartment_name': :'compartmentName',
        'resource_name': :'resourceName',
        'resource_id': :'resourceId',
        'availability_domain': :'availabilityDomain',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'identity': :'identity',
        'request': :'request',
        'response': :'response',
        'state_change': :'stateChange',
        'additional_details': :'additionalDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'event_grouping_id': :'String',
        'event_name': :'String',
        'compartment_id': :'String',
        'compartment_name': :'String',
        'resource_name': :'String',
        'resource_id': :'String',
        'availability_domain': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'identity': :'OCI::Audit::Models::Identity',
        'request': :'OCI::Audit::Models::Request',
        'response': :'OCI::Audit::Models::Response',
        'state_change': :'OCI::Audit::Models::StateChange',
        'additional_details': :'Hash<String, Object>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :event_grouping_id The value to assign to the {#event_grouping_id} property
    # @option attributes [String] :event_name The value to assign to the {#event_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :compartment_name The value to assign to the {#compartment_name} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Audit::Models::Identity] :identity The value to assign to the {#identity} property
    # @option attributes [OCI::Audit::Models::Request] :request The value to assign to the {#request} property
    # @option attributes [OCI::Audit::Models::Response] :response The value to assign to the {#response} property
    # @option attributes [OCI::Audit::Models::StateChange] :state_change The value to assign to the {#state_change} property
    # @option attributes [Hash<String, Object>] :additional_details The value to assign to the {#additional_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.event_grouping_id = attributes[:'eventGroupingId'] if attributes[:'eventGroupingId']

      raise 'You cannot provide both :eventGroupingId and :event_grouping_id' if attributes.key?(:'eventGroupingId') && attributes.key?(:'event_grouping_id')

      self.event_grouping_id = attributes[:'event_grouping_id'] if attributes[:'event_grouping_id']

      self.event_name = attributes[:'eventName'] if attributes[:'eventName']

      raise 'You cannot provide both :eventName and :event_name' if attributes.key?(:'eventName') && attributes.key?(:'event_name')

      self.event_name = attributes[:'event_name'] if attributes[:'event_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compartment_name = attributes[:'compartmentName'] if attributes[:'compartmentName']

      raise 'You cannot provide both :compartmentName and :compartment_name' if attributes.key?(:'compartmentName') && attributes.key?(:'compartment_name')

      self.compartment_name = attributes[:'compartment_name'] if attributes[:'compartment_name']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.identity = attributes[:'identity'] if attributes[:'identity']

      self.request = attributes[:'request'] if attributes[:'request']

      self.response = attributes[:'response'] if attributes[:'response']

      self.state_change = attributes[:'stateChange'] if attributes[:'stateChange']

      raise 'You cannot provide both :stateChange and :state_change' if attributes.key?(:'stateChange') && attributes.key?(:'state_change')

      self.state_change = attributes[:'state_change'] if attributes[:'state_change']

      self.additional_details = attributes[:'additionalDetails'] if attributes[:'additionalDetails']

      raise 'You cannot provide both :additionalDetails and :additional_details' if attributes.key?(:'additionalDetails') && attributes.key?(:'additional_details')

      self.additional_details = attributes[:'additional_details'] if attributes[:'additional_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        event_grouping_id == other.event_grouping_id &&
        event_name == other.event_name &&
        compartment_id == other.compartment_id &&
        compartment_name == other.compartment_name &&
        resource_name == other.resource_name &&
        resource_id == other.resource_id &&
        availability_domain == other.availability_domain &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        identity == other.identity &&
        request == other.request &&
        response == other.response &&
        state_change == other.state_change &&
        additional_details == other.additional_details
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
      [event_grouping_id, event_name, compartment_id, compartment_name, resource_name, resource_id, availability_domain, freeform_tags, defined_tags, identity, request, response, state_change, additional_details].hash
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
