require 'connection'
require 'client/estimate'
require 'client/user'

module Taxy
  class Client
    include Taxy::Connection
    include Taxy::Client::Estimate
    include Taxy::Client::User

    attr_accessor :bearer_token, :debug

    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end
    end
  end
end
