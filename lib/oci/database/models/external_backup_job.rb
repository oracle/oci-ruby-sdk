# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective
module OCI
  # Provides all the details that apply to an external backup job.
  #
  class Database::Models::ExternalBackupJob # rubocop:disable Metrics/LineLength
    # **[Required]** The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the associated backup resource.
    # @return [String]
    attr_accessor :backup_id

    # **[Required]** An indicator for the provisioning state of the resource. If `TRUE`, the resource is still being provisioned.
    # @return [BOOLEAN]
    attr_accessor :provisioning

    # **[Required]** The Swift path to use as a destination for the standalone backup.
    # @return [String]
    attr_accessor :swift_path

    # **[Required]** The name of the Swift compartment bucket where the backup should be stored.
    # @return [String]
    attr_accessor :bucket_name

    # **[Required]** The tag for RMAN to apply to the backup.
    # @return [String]
    attr_accessor :tag

    # **[Required]** The Swift user name to use for transferring the standalone backup to the designated Swift compartment bucket.
    # @return [String]
    attr_accessor :user_name

    # The auth token to use for access to the Swift compartment bucket that will store the standalone backup.
    # For information about auth tokens, see [Working with Auth Tokens](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Tasks/managingcredentials.htm#two).
    #
    # @return [String]
    attr_accessor :swift_password

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_id': :'backupId',
        'provisioning': :'provisioning',
        'swift_path': :'swiftPath',
        'bucket_name': :'bucketName',
        'tag': :'tag',
        'user_name': :'userName',
        'swift_password': :'swiftPassword'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'backup_id': :'String',
        'provisioning': :'BOOLEAN',
        'swift_path': :'String',
        'bucket_name': :'String',
        'tag': :'String',
        'user_name': :'String',
        'swift_password': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :backup_id The value to assign to the {#backup_id} property
    # @option attributes [BOOLEAN] :provisioning The value to assign to the {#provisioning} property
    # @option attributes [String] :swift_path The value to assign to the {#swift_path} property
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :tag The value to assign to the {#tag} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [String] :swift_password The value to assign to the {#swift_password} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.backup_id = attributes[:'backupId'] if attributes[:'backupId']

      raise 'You cannot provide both :backupId and :backup_id' if attributes.key?(:'backupId') && attributes.key?(:'backup_id')

      self.backup_id = attributes[:'backup_id'] if attributes[:'backup_id']

      self.provisioning = attributes[:'provisioning'] unless attributes[:'provisioning'].nil?

      self.swift_path = attributes[:'swiftPath'] if attributes[:'swiftPath']

      raise 'You cannot provide both :swiftPath and :swift_path' if attributes.key?(:'swiftPath') && attributes.key?(:'swift_path')

      self.swift_path = attributes[:'swift_path'] if attributes[:'swift_path']

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.tag = attributes[:'tag'] if attributes[:'tag']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.swift_password = attributes[:'swiftPassword'] if attributes[:'swiftPassword']

      raise 'You cannot provide both :swiftPassword and :swift_password' if attributes.key?(:'swiftPassword') && attributes.key?(:'swift_password')

      self.swift_password = attributes[:'swift_password'] if attributes[:'swift_password']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/LineLength, Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/LineLength, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        backup_id == other.backup_id &&
        provisioning == other.provisioning &&
        swift_path == other.swift_path &&
        bucket_name == other.bucket_name &&
        tag == other.tag &&
        user_name == other.user_name &&
        swift_password == other.swift_password
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
      [backup_id, provisioning, swift_path, bucket_name, tag, user_name, swift_password].hash
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