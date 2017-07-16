require 'spec_helper'

describe Taxy::Client::User do
  let(:client) { Taxy::Client.new(bearer_token: 'CABIFY_BEARER_TOKEN') }

  describe '#user' do
    context 'when the request is successful' do
      let(:response_hash) do
        {
          name: 'John',
          surname: 'Doe',
          email: 'johndoe@example.com',
          mobile_cc: '12',
          mobile_num: '123123123',
          locale: 'pt-BR',
          avatar_url: 'http://example.com/example.jpg'
        }
      end

      before do
        stub_cabify_request(verb: :get, endpoint: '/api/v2/user', status: 200, response: response_hash)
      end

      it 'returns a Taxy::User instance' do
        expect(client.user.class).to eq Taxy::User
      end

      it 'returns the current user' do
        expect(client.user).to have_attributes({
          name: 'John',
          surname: 'Doe',
          email: 'johndoe@example.com',
          mobile_cc: '12',
          mobile_num: '123123123',
          locale: 'pt-BR',
          avatar_url: 'http://example.com/example.jpg'
        })
      end
    end
  end
end