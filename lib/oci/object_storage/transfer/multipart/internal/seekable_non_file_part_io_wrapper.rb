# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    module Transfer
      module Multipart
        module Internal
          # A class which wraps a seekable (but non-file) IO-like object (for example, a StringIO) so that
          # we can extract a part of it to upload as an "upload part" of a multipart upload. This works by
          # seeking to a given position in the IO-like object and then reading a certain number of bytes
          # from that position onwards.
          #
          # Reading a part of the IO-like object is synchronised so that only a single thread can access the
          # IO at any one time. This prevents issues where we would do, for example, concurrent seeks and so
          # potentially end up reading content we didn't intend to read.
          class SeekableNonFilePartIOWrapper
            # The underlying IO-like object which we'll extract content from
            # @return [IO]
            attr_reader :source

            # Creates a new SeekableNonFilePartIOWrapper
            # @param [IO] source the IO-like object which will back this wrapper
            def initialize(source:)
              raise 'The provided source is not seekable' unless source.respond_to?(:seek)

              @source = source
              @lock = Mutex.new
            end

            # Reads a part/segment from the IO-like object by seeking to a given location and then
            # reading a given number of bytes. This is synchronised so that only a single thread can
            # perform this operation at any one time.
            #
            # @param [Integer] offset the zero-based position in the IO-like object where we'll start reading from
            # @param [Integer] part_size the number of bytes to read
            #
            # @return [String] The content read from the IO-like object
            def read(offset, part_size)
              @lock.synchronize do
                @source.seek(offset)
                @source.read(part_size)
              end
            end
          end
        end
      end
    end
  end
end
