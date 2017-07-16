require 'models/user'

module Taxy
  class Client
    module User
      def user(params = {})
        response = get('/api/v2/user', params)
        Taxy::User.new(response) if @last_response.success?
      end
    end
  end
end
