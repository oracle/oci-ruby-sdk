# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The description of work request, including its status.
  class Oda::Models::WorkRequest
    REQUEST_ACTION_ENUM = [
      REQUEST_ACTION_CREATE_ODA_INSTANCE = 'CREATE_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_UPGRADE_ODA_INSTANCE = 'UPGRADE_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_DELETE_ODA_INSTANCE = 'DELETE_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_PURGE_ODA_INSTANCE = 'PURGE_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_RECOVER_ODA_INSTANCE = 'RECOVER_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_STOP_ODA_INSTANCE = 'STOP_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_START_ODA_INSTANCE = 'START_ODA_INSTANCE'.freeze,
      REQUEST_ACTION_CHANGE_ODA_INSTANCE_COMPARTMENT = 'CHANGE_ODA_INSTANCE_COMPARTMENT'.freeze,
      REQUEST_ACTION_CREATE_ASSOCIATION = 'CREATE_ASSOCIATION'.freeze,
      REQUEST_ACTION_DELETE_ASSOCIATION = 'DELETE_ASSOCIATION'.freeze,
      REQUEST_ACTION_UPDATE_ENTITLEMENTS_FOR_CACCT = 'UPDATE_ENTITLEMENTS_FOR_CACCT'.freeze,
      REQUEST_ACTION_LOOKUP_ODA_INSTANCES_FOR_CACCT = 'LOOKUP_ODA_INSTANCES_FOR_CACCT'.freeze,
      REQUEST_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The identifier of the work request.
    # @return [String]
    attr_accessor :id

    # **[Required]** The identifier of the compartment that contains the work request.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The identifier of the Digital Assistant instance to which this work request pertains.
    # @return [String]
    attr_accessor :oda_instance_id

    # **[Required]** The type of the operation that's associated with the work request.
    # @return [String]
    attr_reader :request_action

    # **[Required]** The status of current work request.
    # @return [String]
    attr_reader :status

    # A short message that provides more detail about the current status.
    # For example, if a work request fails, then this may include information
    # about why it failed.
    #
    # @return [String]
    attr_accessor :status_message

    # **[Required]** The resources that this work request affects.
    # @return [Array<OCI::Oda::Models::WorkRequestResource>]
    attr_accessor :resources

    # **[Required]** Percentage of the request completed.
    # @return [Float]
    attr_accessor :percent_complete

    # **[Required]** The date and time that the request was created, as described in
    # [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    #
    # @return [DateTime]
    attr_accessor :time_accepted

    # The date and time that the request was started, as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), CKQ
    # section 14.29.
    #
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time that the object finished, as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339). CKQ
    #
    # @return [DateTime]
    attr_accessor :time_finished

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'oda_instance_id': :'odaInstanceId',
        'request_action': :'requestAction',
        'status': :'status',
        'status_message': :'statusMessage',
        'resources': :'resources',
        'percent_complete': :'percentComplete',
        'time_accepted': :'timeAccepted',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'oda_instance_id': :'String',
        'request_action': :'String',
        'status': :'String',
        'status_message': :'String',
        'resources': :'Array<OCI::Oda::Models::WorkRequestResource>',
        'percent_complete': :'Float',
        'time_accepted': :'DateTime',
        'time_started': :'DateTime',
        'time_finished': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :oda_instance_id The value to assign to the {#oda_instance_id} property
    # @option attributes [String] :request_action The value to assign to the {#request_action} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :status_message The value to assign to the {#status_message} property
    # @option attributes [Array<OCI::Oda::Models::WorkRequestResource>] :resources The value to assign to the {#resources} property
    # @option attributes [Float] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.oda_instance_id = attributes[:'odaInstanceId'] if attributes[:'odaInstanceId']

      raise 'You cannot provide both :odaInstanceId and :oda_instance_id' if attributes.key?(:'odaInstanceId') && attributes.key?(:'oda_instance_id')

      self.oda_instance_id = attributes[:'oda_instance_id'] if attributes[:'oda_instance_id']

      self.request_action = attributes[:'requestAction'] if attributes[:'requestAction']

      raise 'You cannot provide both :requestAction and :request_action' if attributes.key?(:'requestAction') && attributes.key?(:'request_action')

      self.request_action = attributes[:'request_action'] if attributes[:'request_action']

      self.status = attributes[:'status'] if attributes[:'status']

      self.status_message = attributes[:'statusMessage'] if attributes[:'statusMessage']

      raise 'You cannot provide both :statusMessage and :status_message' if attributes.key?(:'statusMessage') && attributes.key?(:'status_message')

      self.status_message = attributes[:'status_message'] if attributes[:'status_message']

      self.resources = attributes[:'resources'] if attributes[:'resources']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] request_action Object to be assigned
    def request_action=(request_action)
      # rubocop:disable Style/ConditionalAssignment
      if request_action && !REQUEST_ACTION_ENUM.include?(request_action)
        OCI.logger.debug("Unknown value for 'request_action' [" + request_action + "]. Mapping to 'REQUEST_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @request_action = REQUEST_ACTION_UNKNOWN_ENUM_VALUE
      else
        @request_action = request_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
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
        oda_instance_id == other.oda_instance_id &&
        request_action == other.request_action &&
        status == other.status &&
        status_message == other.status_message &&
        resources == other.resources &&
        percent_complete == other.percent_complete &&
        time_accepted == other.time_accepted &&
        time_started == other.time_started &&
        time_finished == other.time_finished
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
      [id, compartment_id, oda_instance_id, request_action, status, status_message, resources, percent_complete, time_accepted, time_started, time_finished].hash
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
