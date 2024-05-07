# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  # A response, which represents all successful API calls.
  class Response
    # The HTTP status, such as 200, 401, etc
    #
    # @return [Integer]
    attr_reader :status

    # A ResponseHeaders object containing all response headers
    #
    # @return [ResponseHeaders]
    attr_reader :headers

    # The body of the response. For example, this
    # may contain a User object, or a list of Users.
    attr_reader :data

    # The value of the next page token, if available,
    # taken from the opc-next-page header.
    #
    # @return [String]
    attr_reader :next_page

    # The request ID, taken from the opc-request-id header.
    #
    # @return [String]
    attr_reader :request_id

    attr_writer :api_call

    def initialize(status, headers, data)
      @status = status
      @headers = OCI::ResponseHeaders.new(headers)
      @data = data

      @next_page = @headers['opc-next-page'] if headers
      @next_page = data.next_start_with if data.respond_to?(:next_start_with)
      @request_id = @headers['opc-request-id'] if headers
    end

    # Returns true if there is another page available.
    def has_next_page?
      !next_page.nil?
    end

    include Enumerable

    # For paged responses, yields each page until the last page is reached.
    # For example:
    #
    #   OCI::Identity::IdentityClient.new.list_users(compartment, limit:'3').each { |r| r.data.each { |user| puts user.name }}
    #
    # The first response yielded is always the response that 'each' is being
    # called on.
    #
    # If any of the requests result in an error, that error will be thrown
    # as normal, which will abort the enumeration.
    #
    # While this can be called on non-paged responses, it will simply result
    # in the response itself being yielded.
    #
    # @yieldparam [Response] response A response object for each page, starting with the response used to call 'each'.
    def each
      yield self
      page = @next_page

      while @api_call && page
        next_response = @api_call.call(page)

        raise 'Paging failure: Two consecutive responses had the same next page token.' if page == next_response.next_page

        page = next_response.next_page
        yield next_response
      end
    end
  end
end
