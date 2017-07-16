require 'bundler/setup'
require 'taxy'
require 'webmock/rspec'

Dir[File.join(File.dirname(__FILE__), './support/**/*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.include HttpMockHelpers

  c.before :all do
    WebMock.disable_net_connect!(allow_localhost: true)
  end
end
