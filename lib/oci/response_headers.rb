# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  # A readonly, case-insensitive http response header collection
  class ResponseHeaders
    # Initialize the readonly and case-insensitive http response headers with hash object.
    #
    # @param [Hash] headers the hash object contains http response headers.
    def initialize(headers)
      @headers = {}
      return if headers.nil?

      headers.each do |key, value|
        key = key.downcase if key.is_a? String
        @headers[key] = value.is_a?(Array) && value.length == 1 ? value[0] : value
      end
    end

    # Element Reference-Retrieves the value object corresponding to the key object.
    # If not found, returns nil.
    #
    # @param [Object] key the key object. It is case-insensitive if it is a String object.
    def [](key)
      key = key.downcase if key.is_a? String
      @headers[key] || nil
    end

    # Calls block once for each key in hsh, passing the key-value pair as parameters.
    # If no block is given, an enumerator is returned instead.
    #
    # @param [Block] block the callback block
    def each(&block)
      @headers.each(&block)
    end

    # Calls block once for each key in hsh, passing the key as a parameter.
    # If no block is given, an enumerator is returned instead.
    #
    # @param [Block] block the callback block
    def each_key(&block)
      @headers.each_key(&block)
    end

    # Alias for: each
    alias each_pair each

    # Calls block once for each key in hsh, passing the value as a parameter.
    # If no block is given, an enumerator is returned instead.
    #
    # @param [Block] block the callback block
    def each_value(&block)
      @headers.each_value(&block)
    end

    # Returns true if hsh contains no key-value pairs.
    def empty?
      @headers.empty?
    end

    # Returns true if hash and other are both hashes with the same content.
    def eql?(other)
      @headers.eql?(other)
    end

    # Returns a value from the hash for the given key. If the key cannot be found, there are several options: With no
    # other arguments, it will raise an KeyError exception; if default is given, then that will be returned; if the
    # optional code block is specified, then that will be run and its result returned.
    def fetch(key, *args, &block)
      key = key.downcase if key.is_a? String
      @headers.fetch(key, *args, &block)
    end

    # Returns true if the given key is present in hsh.
    #
    # @param [Object] key to check. It is case-insensitive if it is a String object.
    def key?(key)
      key = key.downcase if key.is_a? String
      @headers.key?(key)
    end

    # Alias for: key?
    alias has_key? key?

    # Returns true if the given value is present for some key in hsh.
    #
    # @param [Object] value to check.
    def value?(value)
      @headers.value?(value)
    end

    # Alias for: value?
    alias has_value? value?

    # Compute a hash-code for this hash. Two hashes with the same content will have the same hash code
    # (and will compare using eql?).
    def hash
      @headers.hash
    end

    # Alias for: key?
    alias include? key?

    # Return the contents of this hash as a string.
    def to_s
      @headers.to_s
    end

    # Alias for: to_s
    alias inspect to_s

    # Returns the key of an occurrence of a given value. If the value is not found, returns nil.
    #
    # @param [Object] value to check.
    def key(value)
      @headers.key(value)
    end

    # Returns a new array populated with the keys from this hash.
    def keys
      @headers.keys
    end

    # Returns the number of key-value pairs in the hash.
    def size
      @headers.size
    end

    # Alias for: size
    alias length size

    # Alias for: key?
    alias member? key?

    # Returns the hash object.
    def to_hash
      @headers
    end

    # Returns a new array populated with the values from hsh.
    def values
      @headers.values
    end
  end
end
