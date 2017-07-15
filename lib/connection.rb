require 'json'
require 'faraday'
require 'response/parse_json'

module Taxy
  module Connection
    BASE_URI = 'https://test.cabify.com'.freeze

    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params.to_json)
    end

    def delete(path, params = {})
      request(:delete, path, params)
    end

    def put(path, params = {})
      request(:put, path, params.to_json)
    end

    def patch(path, params = {})
      request(:patch, path, params.to_json)
    end

    private

    def request(method, path, params = {})
      @last_response = agent.send(method.to_sym, path, params)
      @last_response.body
    end

    def agent
      @agent ||= Faraday.new(BASE_URI, connection_options) do |http|
        http.headers[:content_type] = 'application/json'.freeze
        http.headers[:user_agent] = 'Cabify API Ruby Wrapper'.freeze
        http.headers[:accept_language] = 'en'.freeze
        http.authorization 'Bearer', @bearer_token if @bearer_token
      end
    end

    def connection_options
      @connection_options ||= {
        builder: middleware,
        request: {
          open_timeout: 10,
          timeout: 30
        }
      }
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |faraday|
        faraday.response :parse_json
        faraday.response :logger if debug.to_s.casecmp('true').zero?
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
