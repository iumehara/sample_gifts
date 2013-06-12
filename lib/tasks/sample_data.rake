namespace :db do

# MODEL ATTRIBUTES
# Gift :giver_id, :provider_id, :receiver_id, :status, :created_at, :updated_at
# Giver/Receiver/Provider: no attributes besides id, created_at, updated_at.


  desc "Fill database with sample gifts, as well as a few givers/receivers, and a provider"
  task populate: :environment do
    
    Provider.create!

    5.times do
      Giver.create!
      Receiver.create!
    end    

    def gift_status(redeemed_ratio, open_ratio, unpaid_ratio)
      #please enter whole numbers. ratio should total 100.
      number = rand(99)
      if number < redeemed_ratio
        return "redeemed"
      elsif number > 99 - open_ratio
        return "open"
      else
        return "unpaid"
      end
    end

    number_of_days_back = 30
    orders_per_day = 10
    biz_hours = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1]
    status = gift_status(75, 20, 5)

    number_of_days_back.times do |n|
      date = Date.today - n.days
      orders_per_day.times do
        random_datetime = date + biz_hours[rand(biz_hours.length)].hours + rand(59).minutes
        Gift.create!(provider_id: Provider.first.id,
                     giver_id: Giver.all[(rand(Giver.count - 1))].id,
                     receiver_id: Receiver.all[(rand(Receiver.count - 1))].id,
                     status: status,
                     updated_at: random_datetime,
                     created_at: random_datetime - rand(180).days)
      end
    end
  end

end