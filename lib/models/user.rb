module Taxy
  class User
    include Virtus.model

    attribute :avatar_url, String
    attribute :name, String
    attribute :surname, String
    attribute :email, String
    attribute :mobile_cc, String
    attribute :mobile_num, String
    attribute :locale, String
  end
end
