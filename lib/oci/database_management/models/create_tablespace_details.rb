# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details required to create a tablespace.
  class DatabaseManagement::Models::CreateTablespaceDetails
    TYPE_ENUM = [
      TYPE_PERMANENT = 'PERMANENT'.freeze,
      TYPE_TEMPORARY = 'TEMPORARY'.freeze
    ].freeze

    DEFAULT_COMPRESS_ENUM = [
      DEFAULT_COMPRESS_NO_COMPRESS = 'NO_COMPRESS'.freeze,
      DEFAULT_COMPRESS_BASIC_COMPRESS = 'BASIC_COMPRESS'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_READ_ONLY = 'READ_ONLY'.freeze,
      STATUS_READ_WRITE = 'READ_WRITE'.freeze
    ].freeze

    EXTENT_MANAGEMENT_ENUM = [
      EXTENT_MANAGEMENT_AUTOALLOCATE = 'AUTOALLOCATE'.freeze,
      EXTENT_MANAGEMENT_UNIFORM = 'UNIFORM'.freeze
    ].freeze

    SEGMENT_MANAGEMENT_ENUM = [
      SEGMENT_MANAGEMENT_AUTO = 'AUTO'.freeze,
      SEGMENT_MANAGEMENT_MANUAL = 'MANUAL'.freeze
    ].freeze

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails]
    attr_accessor :credential_details

    # **[Required]** The name of the tablespace. It must be unique within a database.
    #
    # @return [String]
    attr_accessor :name

    # The type of tablespace.
    #
    # @return [String]
    attr_reader :type

    # Specifies whether the tablespace is a bigfile or smallfile tablespace.
    # A bigfile tablespace contains only one data file or temp file, which can contain up to approximately 4 billion (232) blocks.
    # A smallfile tablespace is a traditional Oracle tablespace, which can contain 1022 data files or temp files, each of which can contain up to approximately 4 million (222) blocks.
    #
    # @return [BOOLEAN]
    attr_accessor :is_bigfile

    # The list of data files or temp files created for the tablespace.
    #
    # @return [Array<String>]
    attr_accessor :data_files

    # The number of data files or temp files created for the tablespace. This is for Oracle Managed Files only.
    #
    # @return [Integer]
    attr_accessor :file_count

    # The size of each data file or temp file.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :file_size

    # Specifies whether Oracle can reuse the data file or temp file. Reuse is only allowed when the file name is provided.
    #
    # @return [BOOLEAN]
    attr_accessor :is_reusable

    # Specifies whether the data file or temp file can be extended automatically.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_extensible

    # The size of the next increment of disk space to be allocated automatically when more extents are required.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :auto_extend_next_size

    # The maximum disk space allowed for automatic extension of the data files or temp files.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :auto_extend_max_size

    # Specifies whether the disk space of the data file or temp file can be limited.
    #
    # @return [BOOLEAN]
    attr_accessor :is_max_size_unlimited

    # Block size for the tablespace.
    #
    # @return [Integer]
    attr_accessor :block_size_in_kilobytes

    # Indicates whether the tablespace is encrypted.
    # @return [BOOLEAN]
    attr_accessor :is_encrypted

    # The name of the encryption algorithm to be used for tablespace encryption.
    #
    # @return [String]
    attr_accessor :encryption_algorithm

    # The default compression of data for all tables created in the tablespace.
    #
    # @return [String]
    attr_reader :default_compress

    # The status of the tablespace.
    #
    # @return [String]
    attr_reader :status

    # Specifies how the extents of the tablespace should be managed.
    #
    # @return [String]
    attr_reader :extent_management

    # The size of the extent when the tablespace is managed with uniform extents of a specific size.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :extent_uniform_size

    # Specifies whether tablespace segment management should be automatic or manual.
    #
    # @return [String]
    attr_reader :segment_management

    # Specifies whether the tablespace is the default tablespace.
    #
    # @return [BOOLEAN]
    attr_accessor :is_default

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'credentialDetails',
        'name': :'name',
        'type': :'type',
        'is_bigfile': :'isBigfile',
        'data_files': :'dataFiles',
        'file_count': :'fileCount',
        'file_size': :'fileSize',
        'is_reusable': :'isReusable',
        'is_auto_extensible': :'isAutoExtensible',
        'auto_extend_next_size': :'autoExtendNextSize',
        'auto_extend_max_size': :'autoExtendMaxSize',
        'is_max_size_unlimited': :'isMaxSizeUnlimited',
        'block_size_in_kilobytes': :'blockSizeInKilobytes',
        'is_encrypted': :'isEncrypted',
        'encryption_algorithm': :'encryptionAlgorithm',
        'default_compress': :'defaultCompress',
        'status': :'status',
        'extent_management': :'extentManagement',
        'extent_uniform_size': :'extentUniformSize',
        'segment_management': :'segmentManagement',
        'is_default': :'isDefault'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails',
        'name': :'String',
        'type': :'String',
        'is_bigfile': :'BOOLEAN',
        'data_files': :'Array<String>',
        'file_count': :'Integer',
        'file_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'is_reusable': :'BOOLEAN',
        'is_auto_extensible': :'BOOLEAN',
        'auto_extend_next_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'auto_extend_max_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'is_max_size_unlimited': :'BOOLEAN',
        'block_size_in_kilobytes': :'Integer',
        'is_encrypted': :'BOOLEAN',
        'encryption_algorithm': :'String',
        'default_compress': :'String',
        'status': :'String',
        'extent_management': :'String',
        'extent_uniform_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'segment_management': :'String',
        'is_default': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [BOOLEAN] :is_bigfile The value to assign to the {#is_bigfile} property
    # @option attributes [Array<String>] :data_files The value to assign to the {#data_files} property
    # @option attributes [Integer] :file_count The value to assign to the {#file_count} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :file_size The value to assign to the {#file_size} property
    # @option attributes [BOOLEAN] :is_reusable The value to assign to the {#is_reusable} property
    # @option attributes [BOOLEAN] :is_auto_extensible The value to assign to the {#is_auto_extensible} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :auto_extend_next_size The value to assign to the {#auto_extend_next_size} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :auto_extend_max_size The value to assign to the {#auto_extend_max_size} property
    # @option attributes [BOOLEAN] :is_max_size_unlimited The value to assign to the {#is_max_size_unlimited} property
    # @option attributes [Integer] :block_size_in_kilobytes The value to assign to the {#block_size_in_kilobytes} property
    # @option attributes [BOOLEAN] :is_encrypted The value to assign to the {#is_encrypted} property
    # @option attributes [String] :encryption_algorithm The value to assign to the {#encryption_algorithm} property
    # @option attributes [String] :default_compress The value to assign to the {#default_compress} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :extent_management The value to assign to the {#extent_management} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :extent_uniform_size The value to assign to the {#extent_uniform_size} property
    # @option attributes [String] :segment_management The value to assign to the {#segment_management} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.name = attributes[:'name'] if attributes[:'name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.is_bigfile = attributes[:'isBigfile'] unless attributes[:'isBigfile'].nil?

      raise 'You cannot provide both :isBigfile and :is_bigfile' if attributes.key?(:'isBigfile') && attributes.key?(:'is_bigfile')

      self.is_bigfile = attributes[:'is_bigfile'] unless attributes[:'is_bigfile'].nil?

      self.data_files = attributes[:'dataFiles'] if attributes[:'dataFiles']

      raise 'You cannot provide both :dataFiles and :data_files' if attributes.key?(:'dataFiles') && attributes.key?(:'data_files')

      self.data_files = attributes[:'data_files'] if attributes[:'data_files']

      self.file_count = attributes[:'fileCount'] if attributes[:'fileCount']

      raise 'You cannot provide both :fileCount and :file_count' if attributes.key?(:'fileCount') && attributes.key?(:'file_count')

      self.file_count = attributes[:'file_count'] if attributes[:'file_count']

      self.file_size = attributes[:'fileSize'] if attributes[:'fileSize']

      raise 'You cannot provide both :fileSize and :file_size' if attributes.key?(:'fileSize') && attributes.key?(:'file_size')

      self.file_size = attributes[:'file_size'] if attributes[:'file_size']

      self.is_reusable = attributes[:'isReusable'] unless attributes[:'isReusable'].nil?

      raise 'You cannot provide both :isReusable and :is_reusable' if attributes.key?(:'isReusable') && attributes.key?(:'is_reusable')

      self.is_reusable = attributes[:'is_reusable'] unless attributes[:'is_reusable'].nil?

      self.is_auto_extensible = attributes[:'isAutoExtensible'] unless attributes[:'isAutoExtensible'].nil?

      raise 'You cannot provide both :isAutoExtensible and :is_auto_extensible' if attributes.key?(:'isAutoExtensible') && attributes.key?(:'is_auto_extensible')

      self.is_auto_extensible = attributes[:'is_auto_extensible'] unless attributes[:'is_auto_extensible'].nil?

      self.auto_extend_next_size = attributes[:'autoExtendNextSize'] if attributes[:'autoExtendNextSize']

      raise 'You cannot provide both :autoExtendNextSize and :auto_extend_next_size' if attributes.key?(:'autoExtendNextSize') && attributes.key?(:'auto_extend_next_size')

      self.auto_extend_next_size = attributes[:'auto_extend_next_size'] if attributes[:'auto_extend_next_size']

      self.auto_extend_max_size = attributes[:'autoExtendMaxSize'] if attributes[:'autoExtendMaxSize']

      raise 'You cannot provide both :autoExtendMaxSize and :auto_extend_max_size' if attributes.key?(:'autoExtendMaxSize') && attributes.key?(:'auto_extend_max_size')

      self.auto_extend_max_size = attributes[:'auto_extend_max_size'] if attributes[:'auto_extend_max_size']

      self.is_max_size_unlimited = attributes[:'isMaxSizeUnlimited'] unless attributes[:'isMaxSizeUnlimited'].nil?

      raise 'You cannot provide both :isMaxSizeUnlimited and :is_max_size_unlimited' if attributes.key?(:'isMaxSizeUnlimited') && attributes.key?(:'is_max_size_unlimited')

      self.is_max_size_unlimited = attributes[:'is_max_size_unlimited'] unless attributes[:'is_max_size_unlimited'].nil?

      self.block_size_in_kilobytes = attributes[:'blockSizeInKilobytes'] if attributes[:'blockSizeInKilobytes']

      raise 'You cannot provide both :blockSizeInKilobytes and :block_size_in_kilobytes' if attributes.key?(:'blockSizeInKilobytes') && attributes.key?(:'block_size_in_kilobytes')

      self.block_size_in_kilobytes = attributes[:'block_size_in_kilobytes'] if attributes[:'block_size_in_kilobytes']

      self.is_encrypted = attributes[:'isEncrypted'] unless attributes[:'isEncrypted'].nil?

      raise 'You cannot provide both :isEncrypted and :is_encrypted' if attributes.key?(:'isEncrypted') && attributes.key?(:'is_encrypted')

      self.is_encrypted = attributes[:'is_encrypted'] unless attributes[:'is_encrypted'].nil?

      self.encryption_algorithm = attributes[:'encryptionAlgorithm'] if attributes[:'encryptionAlgorithm']

      raise 'You cannot provide both :encryptionAlgorithm and :encryption_algorithm' if attributes.key?(:'encryptionAlgorithm') && attributes.key?(:'encryption_algorithm')

      self.encryption_algorithm = attributes[:'encryption_algorithm'] if attributes[:'encryption_algorithm']

      self.default_compress = attributes[:'defaultCompress'] if attributes[:'defaultCompress']

      raise 'You cannot provide both :defaultCompress and :default_compress' if attributes.key?(:'defaultCompress') && attributes.key?(:'default_compress')

      self.default_compress = attributes[:'default_compress'] if attributes[:'default_compress']

      self.status = attributes[:'status'] if attributes[:'status']

      self.extent_management = attributes[:'extentManagement'] if attributes[:'extentManagement']

      raise 'You cannot provide both :extentManagement and :extent_management' if attributes.key?(:'extentManagement') && attributes.key?(:'extent_management')

      self.extent_management = attributes[:'extent_management'] if attributes[:'extent_management']

      self.extent_uniform_size = attributes[:'extentUniformSize'] if attributes[:'extentUniformSize']

      raise 'You cannot provide both :extentUniformSize and :extent_uniform_size' if attributes.key?(:'extentUniformSize') && attributes.key?(:'extent_uniform_size')

      self.extent_uniform_size = attributes[:'extent_uniform_size'] if attributes[:'extent_uniform_size']

      self.segment_management = attributes[:'segmentManagement'] if attributes[:'segmentManagement']

      raise 'You cannot provide both :segmentManagement and :segment_management' if attributes.key?(:'segmentManagement') && attributes.key?(:'segment_management')

      self.segment_management = attributes[:'segment_management'] if attributes[:'segment_management']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_compress Object to be assigned
    def default_compress=(default_compress)
      raise "Invalid value for 'default_compress': this must be one of the values in DEFAULT_COMPRESS_ENUM." if default_compress && !DEFAULT_COMPRESS_ENUM.include?(default_compress)

      @default_compress = default_compress
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      raise "Invalid value for 'status': this must be one of the values in STATUS_ENUM." if status && !STATUS_ENUM.include?(status)

      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] extent_management Object to be assigned
    def extent_management=(extent_management)
      raise "Invalid value for 'extent_management': this must be one of the values in EXTENT_MANAGEMENT_ENUM." if extent_management && !EXTENT_MANAGEMENT_ENUM.include?(extent_management)

      @extent_management = extent_management
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] segment_management Object to be assigned
    def segment_management=(segment_management)
      raise "Invalid value for 'segment_management': this must be one of the values in SEGMENT_MANAGEMENT_ENUM." if segment_management && !SEGMENT_MANAGEMENT_ENUM.include?(segment_management)

      @segment_management = segment_management
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        credential_details == other.credential_details &&
        name == other.name &&
        type == other.type &&
        is_bigfile == other.is_bigfile &&
        data_files == other.data_files &&
        file_count == other.file_count &&
        file_size == other.file_size &&
        is_reusable == other.is_reusable &&
        is_auto_extensible == other.is_auto_extensible &&
        auto_extend_next_size == other.auto_extend_next_size &&
        auto_extend_max_size == other.auto_extend_max_size &&
        is_max_size_unlimited == other.is_max_size_unlimited &&
        block_size_in_kilobytes == other.block_size_in_kilobytes &&
        is_encrypted == other.is_encrypted &&
        encryption_algorithm == other.encryption_algorithm &&
        default_compress == other.default_compress &&
        status == other.status &&
        extent_management == other.extent_management &&
        extent_uniform_size == other.extent_uniform_size &&
        segment_management == other.segment_management &&
        is_default == other.is_default
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
      [credential_details, name, type, is_bigfile, data_files, file_count, file_size, is_reusable, is_auto_extensible, auto_extend_next_size, auto_extend_max_size, is_max_size_unlimited, block_size_in_kilobytes, is_encrypted, encryption_algorithm, default_compress, status, extent_management, extent_uniform_size, segment_management, is_default].hash
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
