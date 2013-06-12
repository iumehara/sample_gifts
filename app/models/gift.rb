class Gift < ActiveRecord::Base
  attr_accessible :giver_id, :provider_id, :receiver_id, :status, :created_at, :updated_at
end
