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
Taxy::Client.new(bearer_token: 123)
=> #<Taxy::Client:0x00000001ebe280 @bearer_token=123>
```

```ruby
taxy = Taxy::Client.new(bearer_token: 123)
taxy.user # http://developers.cabify.com/#users
=> #<Taxy::User:0x00000001a31500
 @avatar_url="http://example.com/example.jpg",
 @email="johndoe@example.com",
 @locale="pt-BR",
 @mobile_cc="12",
 @mobile_num="123123123",
 @name="John",
 @surname="Doe">
```

```ruby
taxy = Taxy::Client.new(bearer_token: 123) # http://developers.cabify.com/#estimates
taxy.estimate(starting_latitude: 1, starting_longitude: 1, ending_latitude: 1, ending_longitude: 1)
=> [#<Taxy::Estimation:0x00000002053eb0
  @currency="EUR",
  @currency_symbol="€",
  @price_formatted="12.34€",
  @total_price=1234,
  @vehicle_type=
   #<Taxy::Estimation::Vehicle:0x00000002053de8
    @_id="executive_id",
    @description="A very large vehicle with comfortable seats",
    @eta=#<Taxy::Estimation::Vehicle::Eta:0x00000002053780 @formatted=">2 min", @low_availability=nil, @max=1000, @min=100>,
    @icon="executive",
    @icons=#<Taxy::Estimation::Vehicle::Icons:0x00000002053988 @regular="https://cabify.com/images/icons/vehicle_type/executive_27.png">,
    @name="Executive Class",
    @short_name="Executive">>]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Drowze/taxy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).