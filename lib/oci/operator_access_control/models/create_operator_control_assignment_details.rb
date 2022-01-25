# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the Operator Control assignment. An Operator Control Assignment identifies the target resource that is placed under the governance of an Operator Control.
  # Creating an Operator Control Assignment Assignment with a time duration ensures that human accesses to the target resource will be governed by Operator Control for the duration specified.
  #
  class OperatorAccessControl::Models::CreateOperatorControlAssignmentDetails
    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_EXACC = 'EXACC'.freeze,
      RESOURCE_TYPE_EXADATAINFRASTRUCTURE = 'EXADATAINFRASTRUCTURE'.freeze,
      RESOURCE_TYPE_AUTONOMOUSVMCLUSTER = 'AUTONOMOUSVMCLUSTER'.freeze
    ].freeze

    # **[Required]** The OCID of the operator control that is being assigned to a target resource.
    # @return [String]
    attr_accessor :operator_control_id

    # **[Required]** The OCID of the target resource being brought under the governance of the operator control.
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** Name of the target resource.
    # @return [String]
    attr_accessor :resource_name

    # **[Required]** Type of the target resource.
    # @return [String]
    attr_reader :resource_type

    # **[Required]** The OCID of the compartment that contains the target resource.
    # @return [String]
    attr_accessor :resource_compartment_id

    # The time at which the target resource will be brought under the governance of the operator control in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format. Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_assignment_from

    # The time at which the target resource will leave the governance of the operator control in [RFC 3339](https://tools.ietf.org/html/rfc3339)timestamp format.Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_assignment_to

    # **[Required]** The OCID of the compartment that contains the operator control assignment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** If set, then the target resource is always governed by the operator control.
    # @return [BOOLEAN]
    attr_accessor :is_enforced_always

    # Comment about the assignment of the operator control to this target resource.
    # @return [String]
    attr_accessor :comment

    # If set, then the audit logs will be forwarded to the relevant remote logging server
    # @return [BOOLEAN]
    attr_accessor :is_log_forwarded

    # The address of the remote syslog server where the audit logs will be forwarded to. Address in host or IP format.
    # @return [String]
    attr_accessor :remote_syslog_server_address

    # The listening port of the remote syslog server. The port range is 0 - 65535. Only TCP supported.
    # @return [Integer]
    attr_accessor :remote_syslog_server_port

    # The CA certificate of the remote syslog server. Identity of the remote syslog server will be asserted based on this certificate.
    # @return [String]
    attr_accessor :remote_syslog_server_ca_cert

    # The boolean if true would autoApprove during maintenance.
    # @return [BOOLEAN]
    attr_accessor :is_auto_approve_during_maintenance

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operator_control_id': :'operatorControlId',
        'resource_id': :'resourceId',
        'resource_name': :'resourceName',
        'resource_type': :'resourceType',
        'resource_compartment_id': :'resourceCompartmentId',
        'time_assignment_from': :'timeAssignmentFrom',
        'time_assignment_to': :'timeAssignmentTo',
        'compartment_id': :'compartmentId',
        'is_enforced_always': :'isEnforcedAlways',
        'comment': :'comment',
        'is_log_forwarded': :'isLogForwarded',
        'remote_syslog_server_address': :'remoteSyslogServerAddress',
        'remote_syslog_server_port': :'remoteSyslogServerPort',
        'remote_syslog_server_ca_cert': :'remoteSyslogServerCACert',
        'is_auto_approve_during_maintenance': :'isAutoApproveDuringMaintenance',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operator_control_id': :'String',
        'resource_id': :'String',
        'resource_name': :'String',
        'resource_type': :'String',
        'resource_compartment_id': :'String',
        'time_assignment_from': :'DateTime',
        'time_assignment_to': :'DateTime',
        'compartment_id': :'String',
        'is_enforced_always': :'BOOLEAN',
        'comment': :'String',
        'is_log_forwarded': :'BOOLEAN',
        'remote_syslog_server_address': :'String',
        'remote_syslog_server_port': :'Integer',
        'remote_syslog_server_ca_cert': :'String',
        'is_auto_approve_during_maintenance': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operator_control_id The value to assign to the {#operator_control_id} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :resource_compartment_id The value to assign to the {#resource_compartment_id} property
    # @option attributes [DateTime] :time_assignment_from The value to assign to the {#time_assignment_from} property
    # @option attributes [DateTime] :time_assignment_to The value to assign to the {#time_assignment_to} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_enforced_always The value to assign to the {#is_enforced_always} property
    # @option attributes [String] :comment The value to assign to the {#comment} property
    # @option attributes [BOOLEAN] :is_log_forwarded The value to assign to the {#is_log_forwarded} property
    # @option attributes [String] :remote_syslog_server_address The value to assign to the {#remote_syslog_server_address} property
    # @option attributes [Integer] :remote_syslog_server_port The value to assign to the {#remote_syslog_server_port} property
    # @option attributes [String] :remote_syslog_server_ca_cert The value to assign to the {#remote_syslog_server_ca_cert} property
    # @option attributes [BOOLEAN] :is_auto_approve_during_maintenance The value to assign to the {#is_auto_approve_during_maintenance} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operator_control_id = attributes[:'operatorControlId'] if attributes[:'operatorControlId']

      raise 'You cannot provide both :operatorControlId and :operator_control_id' if attributes.key?(:'operatorControlId') && attributes.key?(:'operator_control_id')

      self.operator_control_id = attributes[:'operator_control_id'] if attributes[:'operator_control_id']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.resource_compartment_id = attributes[:'resourceCompartmentId'] if attributes[:'resourceCompartmentId']

      raise 'You cannot provide both :resourceCompartmentId and :resource_compartment_id' if attributes.key?(:'resourceCompartmentId') && attributes.key?(:'resource_compartment_id')

      self.resource_compartment_id = attributes[:'resource_compartment_id'] if attributes[:'resource_compartment_id']

      self.time_assignment_from = attributes[:'timeAssignmentFrom'] if attributes[:'timeAssignmentFrom']

      raise 'You cannot provide both :timeAssignmentFrom and :time_assignment_from' if attributes.key?(:'timeAssignmentFrom') && attributes.key?(:'time_assignment_from')

      self.time_assignment_from = attributes[:'time_assignment_from'] if attributes[:'time_assignment_from']

      self.time_assignment_to = attributes[:'timeAssignmentTo'] if attributes[:'timeAssignmentTo']

      raise 'You cannot provide both :timeAssignmentTo and :time_assignment_to' if attributes.key?(:'timeAssignmentTo') && attributes.key?(:'time_assignment_to')

      self.time_assignment_to = attributes[:'time_assignment_to'] if attributes[:'time_assignment_to']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_enforced_always = attributes[:'isEnforcedAlways'] unless attributes[:'isEnforcedAlways'].nil?

      raise 'You cannot provide both :isEnforcedAlways and :is_enforced_always' if attributes.key?(:'isEnforcedAlways') && attributes.key?(:'is_enforced_always')

      self.is_enforced_always = attributes[:'is_enforced_always'] unless attributes[:'is_enforced_always'].nil?

      self.comment = attributes[:'comment'] if attributes[:'comment']

      self.is_log_forwarded = attributes[:'isLogForwarded'] unless attributes[:'isLogForwarded'].nil?

      raise 'You cannot provide both :isLogForwarded and :is_log_forwarded' if attributes.key?(:'isLogForwarded') && attributes.key?(:'is_log_forwarded')

      self.is_log_forwarded = attributes[:'is_log_forwarded'] unless attributes[:'is_log_forwarded'].nil?

      self.remote_syslog_server_address = attributes[:'remoteSyslogServerAddress'] if attributes[:'remoteSyslogServerAddress']

      raise 'You cannot provide both :remoteSyslogServerAddress and :remote_syslog_server_address' if attributes.key?(:'remoteSyslogServerAddress') && attributes.key?(:'remote_syslog_server_address')

      self.remote_syslog_server_address = attributes[:'remote_syslog_server_address'] if attributes[:'remote_syslog_server_address']

      self.remote_syslog_server_port = attributes[:'remoteSyslogServerPort'] if attributes[:'remoteSyslogServerPort']

      raise 'You cannot provide both :remoteSyslogServerPort and :remote_syslog_server_port' if attributes.key?(:'remoteSyslogServerPort') && attributes.key?(:'remote_syslog_server_port')

      self.remote_syslog_server_port = attributes[:'remote_syslog_server_port'] if attributes[:'remote_syslog_server_port']

      self.remote_syslog_server_ca_cert = attributes[:'remoteSyslogServerCACert'] if attributes[:'remoteSyslogServerCACert']

      raise 'You cannot provide both :remoteSyslogServerCACert and :remote_syslog_server_ca_cert' if attributes.key?(:'remoteSyslogServerCACert') && attributes.key?(:'remote_syslog_server_ca_cert')

      self.remote_syslog_server_ca_cert = attributes[:'remote_syslog_server_ca_cert'] if attributes[:'remote_syslog_server_ca_cert']

      self.is_auto_approve_during_maintenance = attributes[:'isAutoApproveDuringMaintenance'] unless attributes[:'isAutoApproveDuringMaintenance'].nil?

      raise 'You cannot provide both :isAutoApproveDuringMaintenance and :is_auto_approve_during_maintenance' if attributes.key?(:'isAutoApproveDuringMaintenance') && attributes.key?(:'is_auto_approve_during_maintenance')

      self.is_auto_approve_during_maintenance = attributes[:'is_auto_approve_during_maintenance'] unless attributes[:'is_auto_approve_during_maintenance'].nil?

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
    # @param [Object] resource_type Object to be assigned
    def resource_type=(resource_type)
      raise "Invalid value for 'resource_type': this must be one of the values in RESOURCE_TYPE_ENUM." if resource_type && !RESOURCE_TYPE_ENUM.include?(resource_type)

      @resource_type = resource_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operator_control_id == other.operator_control_id &&
        resource_id == other.resource_id &&
        resource_name == other.resource_name &&
        resource_type == other.resource_type &&
        resource_compartment_id == other.resource_compartment_id &&
        time_assignment_from == other.time_assignment_from &&
        time_assignment_to == other.time_assignment_to &&
        compartment_id == other.compartment_id &&
        is_enforced_always == other.is_enforced_always &&
        comment == other.comment &&
        is_log_forwarded == other.is_log_forwarded &&
        remote_syslog_server_address == other.remote_syslog_server_address &&
        remote_syslog_server_port == other.remote_syslog_server_port &&
        remote_syslog_server_ca_cert == other.remote_syslog_server_ca_cert &&
        is_auto_approve_during_maintenance == other.is_auto_approve_during_maintenance &&
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
      [operator_control_id, resource_id, resource_name, resource_type, resource_compartment_id, time_assignment_from, time_assignment_to, compartment_id, is_enforced_always, comment, is_log_forwarded, remote_syslog_server_address, remote_syslog_server_port, remote_syslog_server_ca_cert, is_auto_approve_during_maintenance, freeform_tags, defined_tags].hash
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
