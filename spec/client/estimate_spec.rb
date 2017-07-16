require 'spec_helper'
require 'pry'

describe Taxy::Client::Estimate do
  let(:client) { Taxy::Client.new(bearer_token: 'CABIFY_BEARER_TOKEN') }
  subject { client.estimate(starting_latitude: 1, starting_longitude: 2, ending_latitude: 3, ending_longitude: 4) }

  describe '#user' do
    context 'when the request is successful' do
      let(:request_params_hash) {
        { stops: [{ loc: [1, 2] }, { loc: [3, 4] }] }
      }
      let(:response_hash) do
        [
          {
            vehicle_type: {
              _id: 'executive_id',
              name: 'Executive Class',
              short_name: 'Executive',
              description: 'A very large vehicle with comfortable seats',
              icon: 'executive',
              icons: {
                regular: 'https://cabify.com/images/icons/vehicle_type/executive_27.png'
              },
              eta: {
                min: 100,
                max: 1000,
                formatted: '>2 min'
              }
            },
            total_price: 1234,
            price_formatted: '12.34€',
            currency: 'EUR',
            currency_symbol: '€',
          }
        ]
      end

      before do
        stub_cabify_request(
          verb: :post,
          params: request_params_hash,
          endpoint: '/api/v2/estimate',
          status: 200,
          response: response_hash
        )
      end

      it 'returns an array of Taxy::Estimation instance' do
        expect(subject.first.class).to eq Taxy::Estimation
        expect(subject.first.vehicle_type.class).to eq Taxy::Estimation::Vehicle
        expect(subject.first.vehicle_type.icons.class).to eq Taxy::Estimation::Vehicle::Icons
        expect(subject.first.vehicle_type.eta.class).to eq Taxy::Estimation::Vehicle::Eta
      end

      it 'returns estimations' do
        expect(subject.first).to have_attributes({
          total_price: 1234,
          price_formatted: '12.34€',
          currency: 'EUR',
          currency_symbol: '€',
        })
        expect(subject.first.vehicle_type).to have_attributes({
          _id: 'executive_id',
          name: 'Executive Class',
          short_name: 'Executive',
          description: 'A very large vehicle with comfortable seats',
          icon: 'executive',
        })
        expect(subject.first.vehicle_type.icons).to have_attributes({
          regular: 'https://cabify.com/images/icons/vehicle_type/executive_27.png'
        })
        expect(subject.first.vehicle_type.eta).to have_attributes({
          min: 100,
          max: 1000,
          formatted: '>2 min'
        })
      end
    end
  end
end