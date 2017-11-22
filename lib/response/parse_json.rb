require 'faraday'
require 'json'

module Taxy
  module Response
    class ParseJson < Faraday::Response::Middleware
      WHITESPACE_REGEX = /\A^\s*$\z/
      GATEWAY_TIMEOUT_REGEX = /504 Gateway Time-out/ # because cabify's API ain't tamed

      def parse(body)
        case body
        when WHITESPACE_REGEX, GATEWAY_TIMEOUT_REGEX, nil
          nil
        else
          JSON.parse(body, symbolize_names: true)
        end
      end

      def on_complete(response)
        return if unparsable_status_codes.include?(response.status)
        response.body = parse(response.body) if respond_to?(:parse)
      end

      def unparsable_status_codes
        [204, 301, 302, 304]
      end
    end
  end
end

Faraday::Response.register_middleware parse_json: Taxy::Response::ParseJson
