module HttpMockHelpers
  def stub_cabify_request(verb:, endpoint:, params: nil, response: nil, status: nil)
    options = Hash.new.tap do |h|
      h[:headers] = {
        'Authorization' => 'Bearer CABIFY_BEARER_TOKEN',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Cabify API Ruby Wrapper'
      }
      h[:body] = params.to_json unless params.nil?
    end

    stub_request(verb, "#{Taxy::Connection::BASE_URI}#{endpoint}")
      .with(options)
      .to_return(status: status || 200, body: response ? response.to_json : '')
  end
end