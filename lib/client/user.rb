module Taxy
  class Client
    module User
      def user(params = {})
        get('/api/v2/user', params)
      end
    end
  end
end
