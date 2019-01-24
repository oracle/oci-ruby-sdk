# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module Internal
    # Utility methods for internal use only.
    module Util
      BLANK_STRING_REGEX = /\A[[:space:]]*\z/.freeze
      def self.blank_string?(str)
        str.nil? || str.empty? || !BLANK_STRING_REGEX.match(str).nil?
      end

      # Convert data to the given type. This is part of the conversion from strings representing
      # json, where the data that is passed in should already have been converted using JSON.parse.
      # That will give us arrays and hashes, but will not set the correct data types.
      #
      # @param [String] type Type that the data should be converted to
      # @param [String] data Data in string, array or hash of strings, or raw object format.
      # @return [Mixed] Data in the specified type
      def self.convert_to_type(type, data)
        return nil if data.nil?

        case type.downcase.to_sym
        when :datetime
          DateTime.parse(data)
        when :date
          Date.parse(data)
        when :string
          data.to_s
        when :integer
          data.to_i
        when :float
          data.to_f
        when :boolean
          if data.to_s =~ /^(true|yes|1)$/i
            true
          else
            false
          end
        when :object
          # generic object, return directly
          data
        else
          # The remaining cases might need to match a specific model class, so don't ignore case.
          case type.to_sym
          when /\AArray<(?<inner_type>.+)>\z/
            inner_type = Regexp.last_match[:inner_type]
            data.map { |v| convert_to_type(inner_type, v) }
          when /\AHash<(?<k_type>.+?), (?<v_type>.+?)>\z/
            k_type = Regexp.last_match[:k_type]
            v_type = Regexp.last_match[:v_type]
            {}.tap do |hash|
              data.each do |k, v|
                hash[convert_to_type(k_type, k)] = convert_to_type(v_type, v)
              end
            end
          else
            # Type must be a model.
            type = OCI.const_get(type.to_s)

            if defined? type.get_subtype
              # The return type may be an abstract type, in which case
              # we need to use the discriminator value to get the correct subtype.
              type = OCI.const_get(type.get_subtype(data))
            end

            type.new.tap do |model|
              model.build_from_hash data
            end
          end
        end
      end
    end
  end
end
