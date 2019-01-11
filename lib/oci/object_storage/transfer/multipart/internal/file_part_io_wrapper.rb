# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

module OCI
  module ObjectStorage
    module Transfer
      module Multipart
        module Internal
          # An IO-like interface over a part of a file which will participate in a multipart upload. This allows us
          # to upload a given segment of the file as an "upload part" of a multipart upload.
          class FilePartIOWrapper
            # The source file, identified by either a File/Tempfile object or a path to the file
            # @return [String, File, Tempfile]
            attr_reader :source

            # The zero-based position in the file to start reading from
            # @return [Integer]
            attr_reader :offset

            # The number of bytes to read from the file
            # @return [Integer]
            attr_reader :part_size

            # The position of the first byte to start reading from. Synonym for offset
            # @return [Integer]
            attr_reader :first_byte

            # The position of the last byte we'll read to (exclusive). Calculated as offset + part_size
            # @return [Integer]
            attr_reader :last_byte

            # Creates a new FilePartIOWrapper
            #
            # @param [String, File, Tempfile] source The source file, or a path to it
            # @param [Integer] offset The zero-based position in the file to start reading from
            # @param [Integer] part_size The number of bytes to read from the file
            def initialize(source:, offset:, part_size:)
              @source = source
              @offset = offset
              @part_size = part_size

              @first_byte = offset
              @last_byte = offset + part_size

              @file_handle = nil
            end

            def close
              @file_handle.close if @file_handle
            end

            def read(bytes = nil, output_buffer = nil)
              open_file unless @file_handle
              read_internal(bytes, output_buffer)
            end

            def write(_content)
              raise 'FilePartIOWrapper does not support writing'
            end

            def size
              @part_size
            end

            def rewind
              if @file_handle
                @file_handle.seek(@first_byte)
                @position = @first_byte
              end
              0
            end

            private

            def open_file
              @file_handle = File.open(@source)
              rewind
            end

            def read_internal(bytes, output_buffer)
              if bytes
                data = @file_handle.read([remaining_bytes, bytes].min)
                data = nil if data == ''
              end
              data = @file_handle.read(remaining_bytes) unless bytes

              @position += data.bytesize if data

              # From IO docs (https://ruby-doc.org/core-2.3.1/IO.html#method-i-read):
              #
              # "If the optional outbuf argument is present, it must reference a String, which will receive the data.
              # The outbuf will contain only the received data after the method call even if it is not empty at the
              # beginning."
              #
              # So we use String's replace() method to sub in the data we read, or an empty string if there was
              # no data read
              if output_buffer
                output_buffer.replace(data || '')
              else
                data
              end
            end

            def remaining_bytes
              @last_byte - @position
            end
          end
        end
      end
    end
  end
end
