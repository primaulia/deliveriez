# This will guess the User class
random_date = Faker::Date.forward(30)
delivery_slots = (0...6).to_a.sample

FactoryBot.define do
  factory :delivery_order do
    order_id { "GO#{rand(999)}" }
    serving_datetime { random_date + 11.hours + (delivery_slots * 30).minutes }

    after(:create) do |delivery_order|
      delivery_order.delivery_time 
    end

  end
end
