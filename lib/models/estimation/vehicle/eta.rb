module Taxy
  class Estimation
    class Vehicle
      class Eta
        include Virtus.model

        attribute :min, Integer
        attribute :max, Integer
        attribute :low_availability, Boolean
        attribute :formatted, String
      end
    end
  end
end
