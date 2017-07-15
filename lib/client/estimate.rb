module Taxy
  class Client
    module Estimate
      def estimate(starting_latitude:, starting_longitude:,
        ending_latitude:, ending_longitude:)

        params = build_params([starting_latitude, starting_longitude], [ending_latitude, ending_longitude])

        post('/api/v2/estimate', params)
      end

      private

      def build_params(starting_point, ending_point)
        {
          stops: [
            { loc: starting_point },
            { loc: ending_point }
          ]
        }
      end
    end
  end
end
