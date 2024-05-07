# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# NOTE: This class is auto generated by OracleSDKGenerator. DO NOT EDIT. API Version: 20171215
require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # NFS export options applied to a specified set of
  # clients. Only governs access through the associated
  # export. Access to the same file system through a different
  # export (on the same or different mount target) will be governed
  # by that export's export options.
  #
  class FileStorage::Models::ClientOptions
    ACCESS_ENUM = [
      ACCESS_READ_WRITE = 'READ_WRITE'.freeze,
      ACCESS_READ_ONLY = 'READ_ONLY'.freeze,
      ACCESS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IDENTITY_SQUASH_ENUM = [
      IDENTITY_SQUASH_NONE = 'NONE'.freeze,
      IDENTITY_SQUASH_ROOT = 'ROOT'.freeze,
      IDENTITY_SQUASH_ALL = 'ALL'.freeze,
      IDENTITY_SQUASH_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ALLOWED_AUTH_ENUM = [
      ALLOWED_AUTH_SYS = 'SYS'.freeze,
      ALLOWED_AUTH_KRB5 = 'KRB5'.freeze,
      ALLOWED_AUTH_KRB5_I = 'KRB5I'.freeze,
      ALLOWED_AUTH_KRB5_P = 'KRB5P'.freeze,
      ALLOWED_AUTH_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Clients these options should apply to. Must be a either
    # single IPv4 address or single IPv4 CIDR block.
    #
    # **Note:** Access will also be limited by any applicable VCN
    # security rules and the ability to route IP packets to the
    # mount target. Mount targets do not have Internet-routable IP addresses.
    #
    # @return [String]
    attr_accessor :source

    # If `true`, clients accessing the file system through this
    # export must connect from a privileged source port. If
    # unspecified, defaults to `true`.
    #
    # @return [BOOLEAN]
    attr_accessor :require_privileged_source_port

    # Type of access to grant clients using the file system
    # through this export. If unspecified defaults to `READ_WRITE`.
    #
    # @return [String]
    attr_reader :access

    # Used when clients accessing the file system through this export
    # have their UID and GID remapped to 'anonymousUid' and
    # 'anonymousGid'. If `ALL`, all users and groups are remapped;
    # if `ROOT`, only the root user and group (UID/GID 0) are
    # remapped; if `NONE`, no remapping is done. If unspecified,
    # defaults to `ROOT`.
    #
    # @return [String]
    attr_reader :identity_squash

    # UID value to remap to when squashing a client UID (see
    # identitySquash for more details.) If unspecified, defaults
    # to `65534`.
    #
    # @return [Integer]
    attr_accessor :anonymous_uid

    # GID value to remap to when squashing a client GID (see
    # identitySquash for more details.) If unspecified defaults
    # to `65534`.
    #
    # @return [Integer]
    attr_accessor :anonymous_gid

    # Whether or not to enable anonymous access to the file system through this export in cases where a user isn't found in the LDAP server used for ID mapping.
    # If true, and the user is not found in the LDAP directory, the operation uses the Squash UID and Squash GID.
    #
    # @return [BOOLEAN]
    attr_accessor :is_anonymous_access_allowed

    # Array of allowed NFS authentication types.
    # @return [Array<String>]
    attr_reader :allowed_auth

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source': :'source',
        'require_privileged_source_port': :'requirePrivilegedSourcePort',
        'access': :'access',
        'identity_squash': :'identitySquash',
        'anonymous_uid': :'anonymousUid',
        'anonymous_gid': :'anonymousGid',
        'is_anonymous_access_allowed': :'isAnonymousAccessAllowed',
        'allowed_auth': :'allowedAuth'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source': :'String',
        'require_privileged_source_port': :'BOOLEAN',
        'access': :'String',
        'identity_squash': :'String',
        'anonymous_uid': :'Integer',
        'anonymous_gid': :'Integer',
        'is_anonymous_access_allowed': :'BOOLEAN',
        'allowed_auth': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :source The value to assign to the {#source} property
    # @option attributes [BOOLEAN] :require_privileged_source_port The value to assign to the {#require_privileged_source_port} property
    # @option attributes [String] :access The value to assign to the {#access} property
    # @option attributes [String] :identity_squash The value to assign to the {#identity_squash} property
    # @option attributes [Integer] :anonymous_uid The value to assign to the {#anonymous_uid} property
    # @option attributes [Integer] :anonymous_gid The value to assign to the {#anonymous_gid} property
    # @option attributes [BOOLEAN] :is_anonymous_access_allowed The value to assign to the {#is_anonymous_access_allowed} property
    # @option attributes [Array<String>] :allowed_auth The value to assign to the {#allowed_auth} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.source = attributes[:'source'] if attributes[:'source']

      self.require_privileged_source_port = attributes[:'requirePrivilegedSourcePort'] unless attributes[:'requirePrivilegedSourcePort'].nil?

      raise 'You cannot provide both :requirePrivilegedSourcePort and :require_privileged_source_port' if attributes.key?(:'requirePrivilegedSourcePort') && attributes.key?(:'require_privileged_source_port')

      self.require_privileged_source_port = attributes[:'require_privileged_source_port'] unless attributes[:'require_privileged_source_port'].nil?

      self.access = attributes[:'access'] if attributes[:'access']

      self.identity_squash = attributes[:'identitySquash'] if attributes[:'identitySquash']

      raise 'You cannot provide both :identitySquash and :identity_squash' if attributes.key?(:'identitySquash') && attributes.key?(:'identity_squash')

      self.identity_squash = attributes[:'identity_squash'] if attributes[:'identity_squash']

      self.anonymous_uid = attributes[:'anonymousUid'] if attributes[:'anonymousUid']

      raise 'You cannot provide both :anonymousUid and :anonymous_uid' if attributes.key?(:'anonymousUid') && attributes.key?(:'anonymous_uid')

      self.anonymous_uid = attributes[:'anonymous_uid'] if attributes[:'anonymous_uid']

      self.anonymous_gid = attributes[:'anonymousGid'] if attributes[:'anonymousGid']

      raise 'You cannot provide both :anonymousGid and :anonymous_gid' if attributes.key?(:'anonymousGid') && attributes.key?(:'anonymous_gid')

      self.anonymous_gid = attributes[:'anonymous_gid'] if attributes[:'anonymous_gid']

      self.is_anonymous_access_allowed = attributes[:'isAnonymousAccessAllowed'] unless attributes[:'isAnonymousAccessAllowed'].nil?

      raise 'You cannot provide both :isAnonymousAccessAllowed and :is_anonymous_access_allowed' if attributes.key?(:'isAnonymousAccessAllowed') && attributes.key?(:'is_anonymous_access_allowed')

      self.is_anonymous_access_allowed = attributes[:'is_anonymous_access_allowed'] unless attributes[:'is_anonymous_access_allowed'].nil?

      self.allowed_auth = attributes[:'allowedAuth'] if attributes[:'allowedAuth']

      raise 'You cannot provide both :allowedAuth and :allowed_auth' if attributes.key?(:'allowedAuth') && attributes.key?(:'allowed_auth')

      self.allowed_auth = attributes[:'allowed_auth'] if attributes[:'allowed_auth']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access Object to be assigned
    def access=(access)
      # rubocop:disable Style/ConditionalAssignment
      if access && !ACCESS_ENUM.include?(access)
        OCI.logger.debug("Unknown value for 'access' [" + access + "]. Mapping to 'ACCESS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @access = ACCESS_UNKNOWN_ENUM_VALUE
      else
        @access = access
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] identity_squash Object to be assigned
    def identity_squash=(identity_squash)
      # rubocop:disable Style/ConditionalAssignment
      if identity_squash && !IDENTITY_SQUASH_ENUM.include?(identity_squash)
        OCI.logger.debug("Unknown value for 'identity_squash' [" + identity_squash + "]. Mapping to 'IDENTITY_SQUASH_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @identity_squash = IDENTITY_SQUASH_UNKNOWN_ENUM_VALUE
      else
        @identity_squash = identity_squash
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] allowed_auth Object to be assigned
    def allowed_auth=(allowed_auth)
      # rubocop:disable Style/ConditionalAssignment
      if allowed_auth.nil?
        @allowed_auth = nil
      else
        @allowed_auth =
          allowed_auth.collect do |item|
            if ALLOWED_AUTH_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'allowed_auth' [#{item}]. Mapping to 'ALLOWED_AUTH_UNKNOWN_ENUM_VALUE'") if OCI.logger
              ALLOWED_AUTH_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source == other.source &&
        require_privileged_source_port == other.require_privileged_source_port &&
        access == other.access &&
        identity_squash == other.identity_squash &&
        anonymous_uid == other.anonymous_uid &&
        anonymous_gid == other.anonymous_gid &&
        is_anonymous_access_allowed == other.is_anonymous_access_allowed &&
        allowed_auth == other.allowed_auth
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
      [source, require_privileged_source_port, access, identity_squash, anonymous_uid, anonymous_gid, is_anonymous_access_allowed, allowed_auth].hash
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
