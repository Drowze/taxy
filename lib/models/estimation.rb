require 'models/estimation/vehicle'

module Taxy
  class Estimation
    include Virtus.model

    attribute :vehicle_type, Vehicle
    attribute :total_price, Integer
    attribute :currency, String
    attribute :currency_symbol, String
    attribute :price_formatted, String
  end
end