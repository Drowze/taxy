require 'models/estimation/vehicle/icons'
require 'models/estimation/vehicle/eta'

module Taxy
  class Estimation
    class Vehicle
      include Virtus.model

      attribute :_id, String
      attribute :name, String
      attribute :short_name, String
      attribute :description, String
      attribute :icon, String
      attribute :icons, Icons
      attribute :eta, Eta
    end
  end
end
