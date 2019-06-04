# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # AuditEvent model.
  class Audit::Models::AuditEvent
    # The OCID of the tenant.
    # @return [String]
    attr_accessor :tenant_id

    # The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # The name of the compartment. This value is the friendly name associated with compartmentId.
    # This value can change, but the service logs the value that appeared at the time of the audit event.
    #
    # @return [String]
    attr_accessor :compartment_name

    # The GUID of the event.
    # @return [String]
    attr_accessor :event_id

    # The name of the event.
    # Example: `LaunchInstance`
    #
    # @return [String]
    attr_accessor :event_name

    # The source of the event.
    # @return [String]
    attr_accessor :event_source

    # The type of the event.
    # @return [String]
    attr_accessor :event_type

    # The time the event occurred, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # @return [DateTime]
    attr_accessor :event_time

    # The OCID of the user whose action triggered the event.
    # @return [String]
    attr_accessor :principal_id

    # The credential ID of the user. This value is extracted from the HTTP 'Authorization' request header. It consists of the tenantId, userId, and user fingerprint, all delimited by a slash (/).
    # @return [String]
    attr_accessor :credential_id

    # The HTTP method of the request.
    # @return [String]
    attr_accessor :request_action

    # The opc-request-id of the request.
    # @return [String]
    attr_accessor :request_id

    # The user agent of the client that made the request.
    # @return [String]
    attr_accessor :request_agent

    # The HTTP header fields and values in the request.
    # @return [Hash<String, Array<String>>]
    attr_accessor :request_headers

    # The IP address of the source of the request.
    # @return [String]
    attr_accessor :request_origin

    # The query parameter fields and values for the request.
    # @return [Hash<String, Array<String>>]
    attr_accessor :request_parameters

    # The resource targeted by the request.
    # @return [String]
    attr_accessor :request_resource

    # The headers of the response.
    # @return [Hash<String, Array<String>>]
    attr_accessor :response_headers

    # The status code of the response.
    # @return [String]
    attr_accessor :response_status

    # The time of the response to the audited request, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # @return [DateTime]
    attr_accessor :response_time

    # Metadata of interest from the response payload. For example, the OCID of a resource.
    # @return [Hash<String, Object>]
    attr_accessor :response_payload

    # The name of the user or service. This value is the friendly name associated with principalId.
    # @return [String]
    attr_accessor :user_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tenant_id': :'tenantId',
        'compartment_id': :'compartmentId',
        'compartment_name': :'compartmentName',
        'event_id': :'eventId',
        'event_name': :'eventName',
        'event_source': :'eventSource',
        'event_type': :'eventType',
        'event_time': :'eventTime',
        'principal_id': :'principalId',
        'credential_id': :'credentialId',
        'request_action': :'requestAction',
        'request_id': :'requestId',
        'request_agent': :'requestAgent',
        'request_headers': :'requestHeaders',
        'request_origin': :'requestOrigin',
        'request_parameters': :'requestParameters',
        'request_resource': :'requestResource',
        'response_headers': :'responseHeaders',
        'response_status': :'responseStatus',
        'response_time': :'responseTime',
        'response_payload': :'responsePayload',
        'user_name': :'userName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tenant_id': :'String',
        'compartment_id': :'String',
        'compartment_name': :'String',
        'event_id': :'String',
        'event_name': :'String',
        'event_source': :'String',
        'event_type': :'String',
        'event_time': :'DateTime',
        'principal_id': :'String',
        'credential_id': :'String',
        'request_action': :'String',
        'request_id': :'String',
        'request_agent': :'String',
        'request_headers': :'Hash<String, Array<String>>',
        'request_origin': :'String',
        'request_parameters': :'Hash<String, Array<String>>',
        'request_resource': :'String',
        'response_headers': :'Hash<String, Array<String>>',
        'response_status': :'String',
        'response_time': :'DateTime',
        'response_payload': :'Hash<String, Object>',
        'user_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :compartment_name The value to assign to the {#compartment_name} property
    # @option attributes [String] :event_id The value to assign to the {#event_id} property
    # @option attributes [String] :event_name The value to assign to the {#event_name} property
    # @option attributes [String] :event_source The value to assign to the {#event_source} property
    # @option attributes [String] :event_type The value to assign to the {#event_type} property
    # @option attributes [DateTime] :event_time The value to assign to the {#event_time} property
    # @option attributes [String] :principal_id The value to assign to the {#principal_id} property
    # @option attributes [String] :credential_id The value to assign to the {#credential_id} property
    # @option attributes [String] :request_action The value to assign to the {#request_action} property
    # @option attributes [String] :request_id The value to assign to the {#request_id} property
    # @option attributes [String] :request_agent The value to assign to the {#request_agent} property
    # @option attributes [Hash<String, Array<String>>] :request_headers The value to assign to the {#request_headers} property
    # @option attributes [String] :request_origin The value to assign to the {#request_origin} property
    # @option attributes [Hash<String, Array<String>>] :request_parameters The value to assign to the {#request_parameters} property
    # @option attributes [String] :request_resource The value to assign to the {#request_resource} property
    # @option attributes [Hash<String, Array<String>>] :response_headers The value to assign to the {#response_headers} property
    # @option attributes [String] :response_status The value to assign to the {#response_status} property
    # @option attributes [DateTime] :response_time The value to assign to the {#response_time} property
    # @option attributes [Hash<String, Object>] :response_payload The value to assign to the {#response_payload} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compartment_name = attributes[:'compartmentName'] if attributes[:'compartmentName']

      raise 'You cannot provide both :compartmentName and :compartment_name' if attributes.key?(:'compartmentName') && attributes.key?(:'compartment_name')

      self.compartment_name = attributes[:'compartment_name'] if attributes[:'compartment_name']

      self.event_id = attributes[:'eventId'] if attributes[:'eventId']

      raise 'You cannot provide both :eventId and :event_id' if attributes.key?(:'eventId') && attributes.key?(:'event_id')

      self.event_id = attributes[:'event_id'] if attributes[:'event_id']

      self.event_name = attributes[:'eventName'] if attributes[:'eventName']

      raise 'You cannot provide both :eventName and :event_name' if attributes.key?(:'eventName') && attributes.key?(:'event_name')

      self.event_name = attributes[:'event_name'] if attributes[:'event_name']

      self.event_source = attributes[:'eventSource'] if attributes[:'eventSource']

      raise 'You cannot provide both :eventSource and :event_source' if attributes.key?(:'eventSource') && attributes.key?(:'event_source')

      self.event_source = attributes[:'event_source'] if attributes[:'event_source']

      self.event_type = attributes[:'eventType'] if attributes[:'eventType']

      raise 'You cannot provide both :eventType and :event_type' if attributes.key?(:'eventType') && attributes.key?(:'event_type')

      self.event_type = attributes[:'event_type'] if attributes[:'event_type']

      self.event_time = attributes[:'eventTime'] if attributes[:'eventTime']

      raise 'You cannot provide both :eventTime and :event_time' if attributes.key?(:'eventTime') && attributes.key?(:'event_time')

      self.event_time = attributes[:'event_time'] if attributes[:'event_time']

      self.principal_id = attributes[:'principalId'] if attributes[:'principalId']

      raise 'You cannot provide both :principalId and :principal_id' if attributes.key?(:'principalId') && attributes.key?(:'principal_id')

      self.principal_id = attributes[:'principal_id'] if attributes[:'principal_id']

      self.credential_id = attributes[:'credentialId'] if attributes[:'credentialId']

      raise 'You cannot provide both :credentialId and :credential_id' if attributes.key?(:'credentialId') && attributes.key?(:'credential_id')

      self.credential_id = attributes[:'credential_id'] if attributes[:'credential_id']

      self.request_action = attributes[:'requestAction'] if attributes[:'requestAction']

      raise 'You cannot provide both :requestAction and :request_action' if attributes.key?(:'requestAction') && attributes.key?(:'request_action')

      self.request_action = attributes[:'request_action'] if attributes[:'request_action']

      self.request_id = attributes[:'requestId'] if attributes[:'requestId']

      raise 'You cannot provide both :requestId and :request_id' if attributes.key?(:'requestId') && attributes.key?(:'request_id')

      self.request_id = attributes[:'request_id'] if attributes[:'request_id']

      self.request_agent = attributes[:'requestAgent'] if attributes[:'requestAgent']

      raise 'You cannot provide both :requestAgent and :request_agent' if attributes.key?(:'requestAgent') && attributes.key?(:'request_agent')

      self.request_agent = attributes[:'request_agent'] if attributes[:'request_agent']

      self.request_headers = attributes[:'requestHeaders'] if attributes[:'requestHeaders']

      raise 'You cannot provide both :requestHeaders and :request_headers' if attributes.key?(:'requestHeaders') && attributes.key?(:'request_headers')

      self.request_headers = attributes[:'request_headers'] if attributes[:'request_headers']

      self.request_origin = attributes[:'requestOrigin'] if attributes[:'requestOrigin']

      raise 'You cannot provide both :requestOrigin and :request_origin' if attributes.key?(:'requestOrigin') && attributes.key?(:'request_origin')

      self.request_origin = attributes[:'request_origin'] if attributes[:'request_origin']

      self.request_parameters = attributes[:'requestParameters'] if attributes[:'requestParameters']

      raise 'You cannot provide both :requestParameters and :request_parameters' if attributes.key?(:'requestParameters') && attributes.key?(:'request_parameters')

      self.request_parameters = attributes[:'request_parameters'] if attributes[:'request_parameters']

      self.request_resource = attributes[:'requestResource'] if attributes[:'requestResource']

      raise 'You cannot provide both :requestResource and :request_resource' if attributes.key?(:'requestResource') && attributes.key?(:'request_resource')

      self.request_resource = attributes[:'request_resource'] if attributes[:'request_resource']

      self.response_headers = attributes[:'responseHeaders'] if attributes[:'responseHeaders']

      raise 'You cannot provide both :responseHeaders and :response_headers' if attributes.key?(:'responseHeaders') && attributes.key?(:'response_headers')

      self.response_headers = attributes[:'response_headers'] if attributes[:'response_headers']

      self.response_status = attributes[:'responseStatus'] if attributes[:'responseStatus']

      raise 'You cannot provide both :responseStatus and :response_status' if attributes.key?(:'responseStatus') && attributes.key?(:'response_status')

      self.response_status = attributes[:'response_status'] if attributes[:'response_status']

      self.response_time = attributes[:'responseTime'] if attributes[:'responseTime']

      raise 'You cannot provide both :responseTime and :response_time' if attributes.key?(:'responseTime') && attributes.key?(:'response_time')

      self.response_time = attributes[:'response_time'] if attributes[:'response_time']

      self.response_payload = attributes[:'responsePayload'] if attributes[:'responsePayload']

      raise 'You cannot provide both :responsePayload and :response_payload' if attributes.key?(:'responsePayload') && attributes.key?(:'response_payload')

      self.response_payload = attributes[:'response_payload'] if attributes[:'response_payload']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tenant_id == other.tenant_id &&
        compartment_id == other.compartment_id &&
        compartment_name == other.compartment_name &&
        event_id == other.event_id &&
        event_name == other.event_name &&
        event_source == other.event_source &&
        event_type == other.event_type &&
        event_time == other.event_time &&
        principal_id == other.principal_id &&
        credential_id == other.credential_id &&
        request_action == other.request_action &&
        request_id == other.request_id &&
        request_agent == other.request_agent &&
        request_headers == other.request_headers &&
        request_origin == other.request_origin &&
        request_parameters == other.request_parameters &&
        request_resource == other.request_resource &&
        response_headers == other.response_headers &&
        response_status == other.response_status &&
        response_time == other.response_time &&
        response_payload == other.response_payload &&
        user_name == other.user_name
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
      [tenant_id, compartment_id, compartment_name, event_id, event_name, event_source, event_type, event_time, principal_id, credential_id, request_action, request_id, request_agent, request_headers, request_origin, request_parameters, request_resource, response_headers, response_status, response_time, response_payload, user_name].hash
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
