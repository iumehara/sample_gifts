class User < ActiveRecord::Base
  attr_accessible :giver, :receiver
end
