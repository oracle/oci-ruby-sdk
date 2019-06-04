# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'
require_relative 'volume_attachment'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An ISCSI volume attachment.
  class Core::Models::IScsiVolumeAttachment < Core::Models::VolumeAttachment
    # The Challenge-Handshake-Authentication-Protocol (CHAP) secret valid for the associated CHAP user name.
    # (Also called the \"CHAP password\".)
    #
    # Example: `d6866c0d-298b-48ba-95af-309b4faux45e`
    #
    # @return [String]
    attr_accessor :chap_secret

    # The volume's system-generated Challenge-Handshake-Authentication-Protocol (CHAP) user name.
    #
    # Example: `ocid1.volume.oc1.phx.abyhqljrgvttnlx73nmrwfaux7kcvzfs3s66izvxf2h4lgvyndsdsnoiwr5q`
    #
    # @return [String]
    attr_accessor :chap_username

    # **[Required]** The volume's iSCSI IP address.
    #
    # Example: `169.254.0.2`
    #
    # @return [String]
    attr_accessor :ipv4

    # **[Required]** The target volume's iSCSI Qualified Name in the format defined by RFC 3720.
    #
    # Example: `iqn.2015-12.us.oracle.com:456b0391-17b8-4122-bbf1-f85fc0bb97d9`
    #
    # @return [String]
    attr_accessor :iqn

    # **[Required]** The volume's iSCSI port.
    #
    # Example: `3260`
    #
    # @return [Integer]
    attr_accessor :port

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'attachment_type': :'attachmentType',
        'availability_domain': :'availabilityDomain',
        'compartment_id': :'compartmentId',
        'device': :'device',
        'display_name': :'displayName',
        'id': :'id',
        'instance_id': :'instanceId',
        'is_read_only': :'isReadOnly',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'volume_id': :'volumeId',
        'is_pv_encryption_in_transit_enabled': :'isPvEncryptionInTransitEnabled',
        'chap_secret': :'chapSecret',
        'chap_username': :'chapUsername',
        'ipv4': :'ipv4',
        'iqn': :'iqn',
        'port': :'port'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'attachment_type': :'String',
        'availability_domain': :'String',
        'compartment_id': :'String',
        'device': :'String',
        'display_name': :'String',
        'id': :'String',
        'instance_id': :'String',
        'is_read_only': :'BOOLEAN',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'volume_id': :'String',
        'is_pv_encryption_in_transit_enabled': :'BOOLEAN',
        'chap_secret': :'String',
        'chap_username': :'String',
        'ipv4': :'String',
        'iqn': :'String',
        'port': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {OCI::Core::Models::VolumeAttachment#availability_domain #availability_domain} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Core::Models::VolumeAttachment#compartment_id #compartment_id} proprety
    # @option attributes [String] :device The value to assign to the {OCI::Core::Models::VolumeAttachment#device #device} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::Core::Models::VolumeAttachment#display_name #display_name} proprety
    # @option attributes [String] :id The value to assign to the {OCI::Core::Models::VolumeAttachment#id #id} proprety
    # @option attributes [String] :instance_id The value to assign to the {OCI::Core::Models::VolumeAttachment#instance_id #instance_id} proprety
    # @option attributes [BOOLEAN] :is_read_only The value to assign to the {OCI::Core::Models::VolumeAttachment#is_read_only #is_read_only} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Core::Models::VolumeAttachment#lifecycle_state #lifecycle_state} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Core::Models::VolumeAttachment#time_created #time_created} proprety
    # @option attributes [String] :volume_id The value to assign to the {OCI::Core::Models::VolumeAttachment#volume_id #volume_id} proprety
    # @option attributes [BOOLEAN] :is_pv_encryption_in_transit_enabled The value to assign to the {OCI::Core::Models::VolumeAttachment#is_pv_encryption_in_transit_enabled #is_pv_encryption_in_transit_enabled} proprety
    # @option attributes [String] :chap_secret The value to assign to the {#chap_secret} property
    # @option attributes [String] :chap_username The value to assign to the {#chap_username} property
    # @option attributes [String] :ipv4 The value to assign to the {#ipv4} property
    # @option attributes [String] :iqn The value to assign to the {#iqn} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['attachmentType'] = 'iscsi'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.chap_secret = attributes[:'chapSecret'] if attributes[:'chapSecret']

      raise 'You cannot provide both :chapSecret and :chap_secret' if attributes.key?(:'chapSecret') && attributes.key?(:'chap_secret')

      self.chap_secret = attributes[:'chap_secret'] if attributes[:'chap_secret']

      self.chap_username = attributes[:'chapUsername'] if attributes[:'chapUsername']

      raise 'You cannot provide both :chapUsername and :chap_username' if attributes.key?(:'chapUsername') && attributes.key?(:'chap_username')

      self.chap_username = attributes[:'chap_username'] if attributes[:'chap_username']

      self.ipv4 = attributes[:'ipv4'] if attributes[:'ipv4']

      self.iqn = attributes[:'iqn'] if attributes[:'iqn']

      self.port = attributes[:'port'] if attributes[:'port']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        attachment_type == other.attachment_type &&
        availability_domain == other.availability_domain &&
        compartment_id == other.compartment_id &&
        device == other.device &&
        display_name == other.display_name &&
        id == other.id &&
        instance_id == other.instance_id &&
        is_read_only == other.is_read_only &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        volume_id == other.volume_id &&
        is_pv_encryption_in_transit_enabled == other.is_pv_encryption_in_transit_enabled &&
        chap_secret == other.chap_secret &&
        chap_username == other.chap_username &&
        ipv4 == other.ipv4 &&
        iqn == other.iqn &&
        port == other.port
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
      [attachment_type, availability_domain, compartment_id, device, display_name, id, instance_id, is_read_only, lifecycle_state, time_created, volume_id, is_pv_encryption_in_transit_enabled, chap_secret, chap_username, ipv4, iqn, port].hash
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
