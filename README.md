# Taxy

Simple API wrapper for Cabify public API, built on top of Faraday.
As of now, a bearer token is required beforehand

## Installation

Add this line to your application's Gemfile, then execute `bundle`:

```ruby
gem 'taxy'
```

Or install it yourself as:

    $ gem install taxy

## Usage

```ruby
Taxy::Client.new(bearer_token: <TOKEN>)
```

```ruby
taxy = Taxy::Client.new(bearer_token: 123)
taxy.user # => get info about current user
```

```ruby
taxy = Taxy::Client.new(bearer_token: 123)}] }
taxy.estimate(starting_latitude: 1, starting_longitude: 1, ending_latitude: 1, ending_longitude: 1) #=> get estimation from starting point to ending point
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Drowze/taxy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).