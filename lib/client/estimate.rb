require 'models/estimation'

module Taxy
  class Client
    module Estimate
      def estimate(starting_latitude:, starting_longitude:,
        ending_latitude:, ending_longitude:)

        params = build_params([starting_latitude, starting_longitude], [ending_latitude, ending_longitude])

        response = post('/api/v2/estimate', params)
        response.map { |est| Taxy::Estimation.new(est) } if @last_response.success?
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
